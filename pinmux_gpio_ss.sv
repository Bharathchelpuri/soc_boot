module pinaka_gpio_subsystem
(
//////////////////////////////////////////////////////
/////// GPIO PADS
//////////////////////////////////////////////////////
    input   logic   [14:0]  gpio_pad_in,
    output  logic   [14:0]  gpio_pad_out,
    output  logic   [14:0]  gpio_pad_oe,

//////////////////////////////////////////////////////
////// GPIO REGISTERS
//////////////////////////////////////////////////////
    input   logic   [31:0]  gpio_dir_reg,
    input   logic   [31:0]  gpio_out_reg,
    output  logic   [31:0]  gpio_in_reg,

//////////////////////////////////////////////////////
////// PINMUX REGISTERS
//////////////////////////////////////////////////////
    input   logic   [31:0]  pinmux0,
    input   logic   [31:0]  pinmux1,

//////////////////////////////////////////////////////
////// UART
//////////////////////////////////////////////////////
    input   logic           uart_tx,
    output  logic           uart_rx,


//////////////////////////////////////////////////////
////// SPI
//////////////////////////////////////////////////////
    input   logic           spi_cs,
    input   logic           spi_clk,
    input   logic           spi_mosi,
    output  logic           spi_miso,

//////////////////////////////////////////////////////
////// I2C
//////////////////////////////////////////////////////
    input   logic           i2c_scl,
    input   logic           i2c_sda_out,
    output  logic           i2c_sda_in,

//////////////////////////////////////////////////////
////// INTERRUPT
//////////////////////////////////////////////////////
    output  logic   [14:0]  irq_in,

//////////////////////////////////////////////////////
////// DEBUG
//////////////////////////////////////////////////////
    input   logic           clk_out,
    input   logic   [13:0]  debug,

//////////////////////////////////////////////////////
////// TRACE
//////////////////////////////////////////////////////
    input   logic           atclk,
    input   logic           atvalid,
    input   logic           atready,
    input   logic           atsync,

    input   logic   [2:0]   atid,
    input   logic   [31:0]  atdata

);

////////////////////////////////////////////////////////
// PINMUX FUNCTION ENUM
////////////////////////////////////////////////////////

typedef enum logic [3:0]
{
    PINMUX_GPIO       = 4'd0,
    PINMUX_PERIPHERAL = 4'd1,
    PINMUX_IRQ        = 4'd2,
    PINMUX_DEBUG      = 4'd3,
    PINMUX_TRACE      = 4'd4
} pinmux_func_e;

////////////////////////////////////////////////////////
// FUNCTION SELECT
////////////////////////////////////////////////////////

pinmux_func_e func_sel [14:0];

////////////////////////////////////////////////////////
// PINMUX DECODE
////////////////////////////////////////////////////////

always_comb
begin

    func_sel[0]  = pinmux_func_e'(pinmux0[3:0]);
    func_sel[1]  = pinmux_func_e'(pinmux0[7:4]);
    func_sel[2]  = pinmux_func_e'(pinmux0[11:8]);
    func_sel[3]  = pinmux_func_e'(pinmux0[15:12]);
    func_sel[4]  = pinmux_func_e'(pinmux0[19:16]);
    func_sel[5]  = pinmux_func_e'(pinmux0[23:20]);
    func_sel[6]  = pinmux_func_e'(pinmux0[27:24]);
    func_sel[7]  = pinmux_func_e'(pinmux0[31:28]);

    func_sel[8]  = pinmux_func_e'(pinmux1[3:0]);
    func_sel[9]  = pinmux_func_e'(pinmux1[7:4]);
    func_sel[10] = pinmux_func_e'(pinmux1[11:8]);
    func_sel[11] = pinmux_func_e'(pinmux1[15:12]);
    func_sel[12] = pinmux_func_e'(pinmux1[19:16]);
    func_sel[13] = pinmux_func_e'(pinmux1[23:20]);
    func_sel[14] = pinmux_func_e'(pinmux1[27:24]);

end

////////////// GPIO MUX LOGIC /////////////////////////

always_comb begin

    gpio_pad_out = 15'h0;
    gpio_pad_oe  = 15'h0;
    gpio_in_reg  = 32'h0;
    uart_rx      = 1'b0;
    spi_miso     = 1'b0;
    i2c_sda_in   = 1'b0;
    irq_in       = 15'h0;
    
/////////////////////////////////////////////////////////
//////////  GPIO0 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[0])

        PINMUX_GPIO:
        begin
            gpio_pad_out[0] = gpio_out_reg[0];
            gpio_pad_oe [0] = gpio_dir_reg[0];
        end

        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[0] = uart_tx;
            gpio_pad_oe [0] = 1'b1;
        end

        PINMUX_IRQ:
            irq0 = gpio_pad_in[0];

        PINMUX_DEBUG:
        begin
            gpio_pad_out[0] = clk_out;
            gpio_pad_oe [0] = 1'b1;
        end

        PINMUX_TRACE:
        begin
            gpio_pad_out[0] = atclk;
            gpio_pad_oe [0] = 1'b1;
        end

    endcase

/////////////////////////////////////////////////////////
//////////  GPIO1 MUX
/////////////////////////////////////////////////////////


    unique case(func_sel[1])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[1] = gpio_out_reg[1];
            gpio_pad_oe [1] = gpio_dir_reg[1];
        end
    
        PINMUX_PERIPHERAL:
            uart_rx = gpio_pad_in[1];
    
        PINMUX_IRQ:
            irq1 = gpio_pad_in[1];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[1] = debug[0];
            gpio_pad_oe [1] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[1] = atvalid;
            gpio_pad_oe [1] = 1'b1;
        end

    endcase

/////////////////////////////////////////////////////////
//////////  GPIO2 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[2])

        PINMUX_GPIO:
        begin
            gpio_pad_out[2] = gpio_out_reg[2];
            gpio_pad_oe [2] = gpio_dir_reg[2];
        end

        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[2] = spi_mosi;
            gpio_pad_oe [2] = 1'b1;
        end

        PINMUX_IRQ:
            irq2 = gpio_pad_in[2];

        PINMUX_DEBUG:
        begin
            gpio_pad_out[2] = debug[1];
            gpio_pad_oe [2] = 1'b1;
        end

        PINMUX_TRACE:
        begin
            gpio_pad_out[2] = atready;
            gpio_pad_oe [2] = 1'b1;
        end

    endcase

/////////////////////////////////////////////////////////
//////////  GPIO3 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[3])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[3] = gpio_out_reg[3];
            gpio_pad_oe [3] = gpio_dir_reg[3];
        end
    
        PINMUX_PERIPHERAL:
            spi_miso = gpio_pad_in[3];
    
        PINMUX_IRQ:
            irq3 = gpio_pad_in[3];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[3] = debug[2];
            gpio_pad_oe [3] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[3] = atsync;
            gpio_pad_oe [3] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO4 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[4])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[4] = gpio_out_reg[4];
            gpio_pad_oe [4] = gpio_dir_reg[4];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[4] = spi_clk;
            gpio_pad_oe [4] = 1'b1;
        end
    
        PINMUX_IRQ:
            irq4 = gpio_pad_in[4];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[4] = debug[3];
            gpio_pad_oe [4] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[4] = atid[0];
            gpio_pad_oe [4] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO5 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[5])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[5] = gpio_out_reg[5];
            gpio_pad_oe [5] = gpio_dir_reg[5];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[5] = spi_cs0;
            gpio_pad_oe [5] = 1'b1;
        end
    
        PINMUX_IRQ:
            irq5 = gpio_pad_in[5];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[5] = debug[4];
            gpio_pad_oe [5] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[5] = atid[1];
            gpio_pad_oe [5] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO6 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[6])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[6] = gpio_out_reg[6];
            gpio_pad_oe [6] = gpio_dir_reg[6];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[6] = i2c_sda_out;
            gpio_pad_oe [6] = 1'b1;
        end
    
        PINMUX_IRQ:
            irq6 = gpio_pad_in[6];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[6] = debug[5];
            gpio_pad_oe [6] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[6] = atid[2];
            gpio_pad_oe [6] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO7 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[7])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[7] = gpio_out_reg[7];
            gpio_pad_oe [7] = gpio_dir_reg[7];
        end
    
        PINMUX_PERIPHERAL:
            i2c_sda_in = gpio_pad_in[7];
    
        PINMUX_IRQ:
            irq7 = gpio_pad_in[7];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[7] = debug[6];
            gpio_pad_oe [7] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[7] = atdata[0];
            gpio_pad_oe [7] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO8 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[8])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[8] = gpio_out_reg[8];
            gpio_pad_oe [8] = gpio_dir_reg[8];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[8] = i2c_scl;
            gpio_pad_oe [8] = 1'b1;
        end
    
        PINMUX_IRQ:
            irq8 = gpio_pad_in[8];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[8] = debug[7];
            gpio_pad_oe [8] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[8] = atdata[1];
            gpio_pad_oe [8] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO9 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[9])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[9] = gpio_out_reg[9];
            gpio_pad_oe [9] = gpio_dir_reg[9];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[9] = gpio_out_reg[9];
            gpio_pad_oe [9] = gpio_dir_reg[9];
        end
    
        PINMUX_IRQ:
            irq9 = gpio_pad_in[9];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[9] = debug[8];
            gpio_pad_oe [9] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[9] = atdata[2];
            gpio_pad_oe [9] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO10 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[10])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[10] = gpio_out_reg[10];
            gpio_pad_oe [10] = gpio_dir_reg[10];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[10] = gpio_out_reg[10];
            gpio_pad_oe [10] = gpio_dir_reg[10];
        end
    
        PINMUX_IRQ:
            irq10 = gpio_pad_in[10];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[10] = debug[9];
            gpio_pad_oe [10] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[10] = atdata[3];
            gpio_pad_oe [10] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO11 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[11])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[11] = gpio_out_reg[11];
            gpio_pad_oe [11] = gpio_dir_reg[11];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[11] = gpio_out_reg[11];
            gpio_pad_oe [11] = gpio_dir_reg[11];
        end
    
        PINMUX_IRQ:
            irq11 = gpio_pad_in[11];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[11] = debug[10];
            gpio_pad_oe [11] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[11] = atdata[4];
            gpio_pad_oe [11] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO12 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[12])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[12] = gpio_out_reg[12];
            gpio_pad_oe [12] = gpio_dir_reg[12];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[12] = gpio_out_reg[12];
            gpio_pad_oe [12] = gpio_dir_reg[12];
        end
    
        PINMUX_IRQ:
            irq12 = gpio_pad_in[12];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[12] = debug[11];
            gpio_pad_oe [12] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[12] = atdata[5];
            gpio_pad_oe [12] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO13 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[13])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[13] = gpio_out_reg[13];
            gpio_pad_oe [13] = gpio_dir_reg[13];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[13] = gpio_out_reg[13];
            gpio_pad_oe [13] = gpio_dir_reg[13];
        end
    
        PINMUX_IRQ:
            irq13 = gpio_pad_in[13];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[13] = debug[12];
            gpio_pad_oe [13] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[13] = atdata[6];
            gpio_pad_oe [13] = 1'b1;
        end
    
    endcase

/////////////////////////////////////////////////////////
//////////  GPIO14 MUX
/////////////////////////////////////////////////////////

    unique case(func_sel[14])
    
        PINMUX_GPIO:
        begin
            gpio_pad_out[14] = gpio_out_reg[14];
            gpio_pad_oe [14] = gpio_dir_reg[14];
        end
    
        PINMUX_PERIPHERAL:
        begin
            gpio_pad_out[14] = gpio_out_reg[14];
            gpio_pad_oe [14] = gpio_dir_reg[14];
        end
    
        PINMUX_IRQ:
            irq14 = gpio_pad_in[14];
    
        PINMUX_DEBUG:
        begin
            gpio_pad_out[14] = debug[12];
            gpio_pad_oe [14] = 1'b1;
        end
    
        PINMUX_TRACE:
        begin
            gpio_pad_out[14] = atdata[6];
            gpio_pad_oe [14] = 1'b1;
        end
    
    endcase

end

endmodule
