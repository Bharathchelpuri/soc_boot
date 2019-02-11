module gpio_regfile (
    
    //signals for the cpu 
    input logic           pclk,
    input logic           presetn,

    input logic [7:0]    paddr,
    input logic           pwrite,
    input logic [31:0]    pwdata,

    input logic           penable,
    input logic           psel,

    output logic [31:0]   prdata,
    output logic          pready,
    output logic          pslverr,

    // signals for internal blocks

    output logic [22:0] gpio_dir_out,       
    output logic [22:0] gpio_out_out,     
    input  logic [22:0] gpio_in,  
      
    output logic [22:0] gpio_pull_en_out,
    
    output logic [29:0] pinmux0_out,
    output logic [29:0] pinmux1_out,
    output logic [8:0]  pinmux2_out

    );


logic read_en;
logic write_en;

logic [22:0] gpio_dir_reg;       
logic [22:0] gpio_out_reg;

logic [22:0] gpio_pull_en_reg;    

logic [29:0] pinmux0_reg;        
logic [29:0] pinmux1_reg;
logic [8:0]  pinmux2_reg;

logic boot_rst_one;
logic boot_rst_n;


//register address map

localparam GPIO_DIR_ADDR        = 8'h00;
localparam GPIO_OUT_ADDR        = 8'h04;
localparam GPIO_IN_ADDR         = 8'h08;

localparam GPIO_SET_ADDR        = 8'h0C;
localparam GPIO_CLR_ADDR        = 8'h10;
localparam GPIO_TOGGLE_ADDR     = 8'h14;

localparam GPIO_PULL_EN_ADDR     = 8'h18;

localparam PINMUX0_ADDR         = 8'h1C;  //0-9     pin access
localparam PINMUX1_ADDR         = 8'h20; //10-19    pin access
localparam PINMUX2_ADDR         = 8'h24; //20-22  pin access


assign write_en = psel & penable & pwrite;

assign read_en = psel & penable & (~pwrite);

assign pslverr = !((paddr == GPIO_DIR_ADDR ) || (paddr == GPIO_OUT_ADDR)  || (paddr == GPIO_IN_ADDR ) ||
                 (paddr ==  GPIO_PULL_EN_ADDR )|| (paddr == PINMUX0_ADDR  )||(paddr == PINMUX1_ADDR )|| 
                 (paddr == PINMUX2_ADDR ) || (paddr == GPIO_SET_ADDR) || (paddr == GPIO_CLR_ADDR) || 
                 (paddr == GPIO_TOGGLE_ADDR)); 

always_ff @(posedge pclk or negedge presetn) begin
	if(!presetn) begin
	boot_rst_one <= 1'b0;
	boot_rst_n   <= 1'b0;
	end
	else begin
	boot_rst_one <= 1'b1;
	boot_rst_n   <= boot_rst_one;
	end
end

//write logic
always_ff @(posedge pclk or negedge boot_rst_n) begin 
    if(!boot_rst_n) begin

         pready               <= 1'b0;
 
         gpio_dir_reg        <= 23'h0;      
         gpio_out_reg        <= 23'h0;
         
         gpio_pull_en_reg     <= 23'h0;
         
         pinmux0_reg         <= 30'h0;
         pinmux1_reg         <= 30'h0;
         pinmux2_reg         <= 9'h0;
         
end
        else begin
            pready          <= 1'b1;
            if(write_en) begin
            case(paddr)

             GPIO_DIR_ADDR        :    gpio_dir_reg         <=  pwdata[22:0]  ;
             GPIO_OUT_ADDR        :    gpio_out_reg         <=  pwdata[22:0]  ;

             GPIO_SET_ADDR        :    gpio_out_reg         <=  gpio_out_reg | pwdata[22:0]  ;
             GPIO_CLR_ADDR        :    gpio_out_reg         <=  gpio_out_reg & ~pwdata[22:0] ;
             GPIO_TOGGLE_ADDR     :    gpio_out_reg         <=  gpio_out_reg ^ pwdata[22:0]  ;

             GPIO_PULL_EN_ADDR    :    gpio_pull_en_reg     <=  pwdata[22:0]  ;

             PINMUX0_ADDR         :    pinmux0_reg          <=  pwdata[29:0] ;
             PINMUX1_ADDR         :    pinmux1_reg          <=  pwdata[29:0] ;
             PINMUX2_ADDR         :    pinmux2_reg          <=  pwdata[8:0]  ;

             default: begin
	    			gpio_dir_reg        <= gpio_dir_reg;
	    			gpio_out_reg        <= gpio_out_reg;
	    			gpio_pull_en_reg    <= gpio_pull_en_reg;
	    			pinmux0_reg         <= pinmux0_reg;
	    			pinmux1_reg         <= pinmux1_reg;
                    pinmux2_reg         <= pinmux2_reg;
			      end

              endcase

          end
     end
end

// read logic 
always_comb
    begin 

    prdata  = 32'h0;

    if (read_en) 
        begin
            case(paddr)

             GPIO_DIR_ADDR        :  prdata    =     {9'd0,gpio_dir_reg};
             GPIO_OUT_ADDR        :  prdata    =     {9'd0,gpio_out_reg};
             GPIO_IN_ADDR         :  prdata    =     {9'd0,gpio_in};
             
             GPIO_PULL_EN_ADDR    :  prdata    =     {9'd0,gpio_pull_en_reg};
                                                  
             PINMUX0_ADDR         :  prdata    =     {2'b0,pinmux0_reg};
             PINMUX1_ADDR         :  prdata    =     {2'b0,pinmux1_reg};
             PINMUX2_ADDR         :  prdata    =     {23'b0,pinmux2_reg};
                                                       
             default              :  prdata    =     32'h0;

             endcase
       end
end

// output assignments
assign  gpio_dir_out        = gpio_dir_reg;        
assign  gpio_out_out        = gpio_out_reg;       

assign  gpio_pull_en_out     = gpio_pull_en_reg;    

assign  pinmux0_out         = pinmux0_reg;        
assign  pinmux1_out         = pinmux1_reg;
assign  pinmux2_out         = pinmux2_reg;   

endmodule
