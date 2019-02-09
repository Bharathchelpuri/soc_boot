
`include "io_pad_config.svh"

module power_io_pad (

    // Power Pads
    
    inout wire VDDPST,
    inout wire VSSPST,
    inout wire VDD_1_2,

    // Clock
    
    input  wire CLK_IN,
    output wire CLK_OUT,
    output wire CLK_CORE,

    // Reset
    
    inout wire RESET_IN,
    output wire RESET_CORE

);

    // VDD
    
    `POWER_IO_CELL u_vdd (
        .VDDPST (VDDPST)
    );

    // VSS
    
    `GROUND_IO_CELL u_vss (
        .VSSPST (VSSPST)
    );


    // VDD 1.2V
    `POWER_IO_CELL u_vdd_1_2 (
        .VDDPST (VDD_1_2)
    );

    // Clock
    `CLOCK_IO_CELL u_clk (
        .XC (CLK_CORE),
        .XO (CLK_OUT),
        .XI (CLK_IN),
        .XE (1'b1)
    );


    // Reset
    
    `RESET_IO_CELL u_reset (
        .I   (1'b0),
        .DS  (1'b0),
        .OEN (1'b1),
        .PAD (RESET_IN),
        .C   (RESET_CORE),
        .PE  (1'b0),
        .IE  (1'b1)
    );

endmodule
