module gpio_pad
(
    input  wire [16:0] gpio_pad_block_dir,
    input  wire [16:0] gpio_pad_block_out,
    output wire [16:0] gpio_pad_block_in,
    //inout  wire [14:0] gpio_pad_out
    inout wire  gpio_pad_out0 ,
    inout wire  gpio_pad_out1 ,
    inout wire  gpio_pad_out2 ,
    inout wire  gpio_pad_out3 ,
    inout wire  gpio_pad_out4 ,
    inout wire  gpio_pad_out5 ,
    inout wire  gpio_pad_out6 ,
    inout wire  gpio_pad_out7 ,
    inout wire  gpio_pad_out8 ,
    inout wire  gpio_pad_out9 ,
    inout wire  gpio_pad_out10,
    inout wire  gpio_pad_out11,
    inout wire  gpio_pad_out12,
    inout wire  gpio_pad_out13,
    inout wire  gpio_pad_out14,
    inout wire  gpio_pad_out15,
    inout wire  gpio_pad_out16
    
    
);

//----------------------------------------------------------------------------------------

        assign gpio_pad_out0 = (gpio_pad_block_dir[0]) ? gpio_pad_block_out[0] : 1'bz;

        assign gpio_pad_block_in[0] = gpio_pad_out0;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out1 = (gpio_pad_block_dir[1]) ? gpio_pad_block_out[1] : 1'bz;

        assign gpio_pad_block_in[1] = gpio_pad_out1;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out2 = (gpio_pad_block_dir[2]) ? gpio_pad_block_out[2] : 1'bz;

        assign gpio_pad_block_in[2] = gpio_pad_out2;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out3 = (gpio_pad_block_dir[3]) ? gpio_pad_block_out[3] : 1'bz;

        assign gpio_pad_block_in[3] = gpio_pad_out3;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out4 = (gpio_pad_block_dir[4]) ? gpio_pad_block_out[4] : 1'bz;

        assign gpio_pad_block_in[4] = gpio_pad_out4;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out5 = (gpio_pad_block_dir[5]) ? gpio_pad_block_out[5] : 1'bz;

        assign gpio_pad_block_in[5] = gpio_pad_out5;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out6 = (gpio_pad_block_dir[6]) ? gpio_pad_block_out[6] : 1'bz;

        assign gpio_pad_block_in[6] = gpio_pad_out6;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out7 = (gpio_pad_block_dir[7]) ? gpio_pad_block_out[7] : 1'bz;

        assign gpio_pad_block_in[7] = gpio_pad_out7;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out8 = (gpio_pad_block_dir[8]) ? gpio_pad_block_out[8] : 1'bz;

        assign gpio_pad_block_in[8] = gpio_pad_out8;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out9 = (gpio_pad_block_dir[9]) ? gpio_pad_block_out[9] : 1'bz;

        assign gpio_pad_block_in[9] = gpio_pad_out9;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out10 = (gpio_pad_block_dir[10]) ? gpio_pad_block_out[10] : 1'bz;

        assign gpio_pad_block_in[10] = gpio_pad_out10;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out11 = (gpio_pad_block_dir[11]) ? gpio_pad_block_out[11] : 1'bz;

        assign gpio_pad_block_in[11] = gpio_pad_out11;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out12 = (gpio_pad_block_dir[12]) ? gpio_pad_block_out[12] : 1'bz;

        assign gpio_pad_block_in[12] = gpio_pad_out12;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out13 = (gpio_pad_block_dir[13]) ? gpio_pad_block_out[13] : 1'bz;

        assign gpio_pad_block_in[13] = gpio_pad_out13;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out14 = (gpio_pad_block_dir[14]) ? gpio_pad_block_out[14] : 1'bz;

        assign gpio_pad_block_in[14] = gpio_pad_out14;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out15 = (gpio_pad_block_dir[15]) ? gpio_pad_block_out[15] : 1'bz;

        assign gpio_pad_block_in[15] = gpio_pad_out15;

//----------------------------------------------------------------------------------------

        assign gpio_pad_out16 = (gpio_pad_block_dir[16]) ? gpio_pad_block_out[16] : 1'bz;

        assign gpio_pad_block_in[16] = gpio_pad_out16;

endmodule



















