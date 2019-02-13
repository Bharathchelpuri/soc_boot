module io_pad_top (

//power pins into block (3)
    input logic        vdd_itb,
    input logic        vss_itb,
    input logic        vdd_1_2_itb,

    output logic       vdd_btc,
    output logic       vss_btc,
    output logic       vdd_1_2_btc,

//clock and reset ports (3)
    input  logic       xtal_in_itb,
    input  logic       reset_n_itb,   
    output logic       xtal_in_btc,
    output logic       reset_n_btc, 

    output logic       xtal_out_bto,
    input logic        xtal_out_ctb, 

// inputs from inside the gpio block
    input  logic [22:0] gpio_pad_dir,
    input  logic [22:0] gpio_pad_in,
    output logic [22:0] gpio_pad_out,

//inputs to the block from out (5)
    input logic        tck_jtag_itb,
    input logic        tms_jtag_itb,
    input logic        tdi_jtag_itb,
    input logic        trst_jtag_itb,

    output logic        tck_jtag_btc,
    output logic        tms_jtag_btc,
    output logic        tdi_jtag_btc,
    output logic        trst_jtag_btc,
//jtag tdo out
    input  logic        tdo_jtag_ctb, 
    output logic        tdo_jtag_bto,

// analog ports in to block (14)
    input logic        analog_port0_itb,
    input logic        analog_port1_itb,
    input logic        analog_port2_itb,
    input logic        analog_port3_itb,
    input logic        analog_port4_itb,
    input logic        analog_port5_itb,
    input logic        analog_port6_itb,
    input logic        analog_port7_itb,
    input logic        analog_port8_itb,
    input logic        analog_port9_itb,
    input logic        analog_port10_itb,
    input logic        analog_port11_itb,
    input logic        analog_port12_itb,
    input logic        analog_port13_itb, 

// analog num ports block to the core 
    output logic        analog_port0_btc,
    output logic        analog_port1_btc,
    output logic        analog_port2_btc,
    output logic        analog_port3_btc,
    output logic        analog_port4_btc,
    output logic        analog_port5_btc,
    output logic        analog_port6_btc,
    output logic        analog_port7_btc,
    output logic        analog_port8_btc,
    output logic        analog_port9_btc,
    output logic        analog_port10_btc,
    output logic        analog_port11_btc,
    output logic        analog_port12_btc,
    output logic        analog_port13_btc,  

// analog copacitance ports in to block (6)
    input logic         cdac_in_itb,
    input logic         csdac_in_itb,
    input logic         cifb_in_itb,
    input logic         ciff_in_itb,
    input logic         sar_in_itb,
    input logic         tdc_in_itb,

    output logic        cdac_in_btc,
    output logic        csdac_in_btc,
    output logic        cifb_in_btc,
    output logic        ciff_in_btc,
    output logic        sar_in_btc,
    output logic        tdc_in_btc,

// gpio 23 ports in/out
    inout logic  gpio_pad_bto0 ,
    inout logic  gpio_pad_bto1 ,
    inout logic  gpio_pad_bto2 ,
    inout logic  gpio_pad_bto3 ,
    inout logic  gpio_pad_bto4 ,
    inout logic  gpio_pad_bto5 ,
    inout logic  gpio_pad_bto6 ,
    inout logic  gpio_pad_bto7 ,
    inout logic  gpio_pad_bto8 ,
    inout logic  gpio_pad_bto9 ,
    inout logic  gpio_pad_bto10,
    inout logic  gpio_pad_bto11,
    inout logic  gpio_pad_bto12,
    inout logic  gpio_pad_bto13,
    inout logic  gpio_pad_bto14,
    inout logic  gpio_pad_bto15,
    inout logic  gpio_pad_bto16,
    inout logic  gpio_pad_bto17,
    inout logic  gpio_pad_bto18,
    inout logic  gpio_pad_bto19,
    inout logic  gpio_pad_bto20,
    inout logic  gpio_pad_bto21,
    inout logic  gpio_pad_bto22
    
);

// gpio instance
gpio_pad gpio_pad_instance (
    .gpio_pad_block_dir (gpio_pad_dir),
    .gpio_pad_block_out (gpio_pad_in),
    .gpio_pad_block_in  (gpio_pad_out),
    .gpio_pad_out0      (gpio_pad_bto0),
    .gpio_pad_out1      (gpio_pad_bto1),
    .gpio_pad_out2      (gpio_pad_bto2),
    .gpio_pad_out3      (gpio_pad_bto3),
    .gpio_pad_out4      (gpio_pad_bto4),
    .gpio_pad_out5      (gpio_pad_bto5),
    .gpio_pad_out6      (gpio_pad_bto6),
    .gpio_pad_out7      (gpio_pad_bto7),
    .gpio_pad_out8      (gpio_pad_bto8),
    .gpio_pad_out9      (gpio_pad_bto9),
    .gpio_pad_out10     (gpio_pad_bto10),
    .gpio_pad_out11     (gpio_pad_bto11),
    .gpio_pad_out12     (gpio_pad_bto12),
    .gpio_pad_out13     (gpio_pad_bto13),
    .gpio_pad_out14     (gpio_pad_bto14),
    .gpio_pad_out15     (gpio_pad_bto15),
    .gpio_pad_out16     (gpio_pad_bto16),
    .gpio_pad_out17     (gpio_pad_bto17),
    .gpio_pad_out18     (gpio_pad_bto18),
    .gpio_pad_out19     (gpio_pad_bto19),
    .gpio_pad_out20     (gpio_pad_bto20),
    .gpio_pad_out21     (gpio_pad_bto21),
    .gpio_pad_out22     (gpio_pad_bto22)         

    );

//power pins
assign vdd_btc = vdd_itb;
assign vss_btc = vss_itb;
assign vdd_1_2_btc = vdd_1_2_itb;

// clock and reset ports
assign xtal_in_btc = xtal_in_itb;
assign reset_n_btc = reset_n_itb;
assign xtal_out_bto = xtal_out_ctb;

//inputs to the block from out (5)
assign tck_jtag_btc  = tck_jtag_itb;
assign tms_jtag_btc  = tms_jtag_itb;
assign tdi_jtag_btc  = tdi_jtag_itb;
assign trst_jtag_btc = trst_jtag_itb;

//jtag tdo out
assign tdo_jtag_bto = tdo_jtag_ctb;


// analog ports
assign analog_port0_btc    =  analog_port0_itb;
assign analog_port1_btc    =  analog_port1_itb;
assign analog_port2_btc    =  analog_port2_itb;
assign analog_port3_btc    =  analog_port3_itb;
assign analog_port4_btc    =  analog_port4_itb;
assign analog_port5_btc    =  analog_port5_itb;
assign analog_port6_btc    =  analog_port6_itb;
assign analog_port7_btc    =  analog_port7_itb;
assign analog_port8_btc    =  analog_port8_itb;
assign analog_port9_btc    =  analog_port9_itb;
assign analog_port10_btc   =  analog_port10_itb;
assign analog_port11_btc   =  analog_port11_itb;
assign analog_port12_btc   =  analog_port12_itb;
assign analog_port13_btc   =  analog_port13_itb;


//analog capacitance ports

assign cdac_in_btc  = cdac_in_itb;
assign csdac_in_btc = csdac_in_itb;
assign cifb_in_btc  = cifb_in_itb;
assign ciff_in_btc  = ciff_in_itb;
assign sar_in_btc   = sar_in_itb;
assign tdc_in_btc   = tdc_in_itb;






endmodule
