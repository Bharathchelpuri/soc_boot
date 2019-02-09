module top_io_pad (

    //========================================================
    // POWER
    //========================================================
    inout wire VDDPST,
    inout wire VSSPST,
    inout wire VDD_1_2,
   
   // CLK/RST

    inout  wire RESET_N,   
    input  wire XTAL_IN,
    output wire XTAL_OUT,
   
   //ANALOG

    inout wire VDD_1_8,
    inout wire VDD_2_5,
    inout wire ANA0,
    inout wire ANA1,
    inout wire ANA2,
    inout wire ANA3,
    inout wire ANA4,
    inout wire ANA5,
    inout wire ANA6,
    inout wire ANA7,
    inout wire ANA8,
    inout wire ANA9,

    inout wire ADC_IN,
    inout wire DAC_OUT,

    inout wire LDO_1_2_ACAP,
    inout wire LDO_1_2_DCAP,
    inout wire LDO_1_8_ACAP,
    inout wire LDO_1_8_DCAP,
    inout wire LDO_2_5_ACAP,
    inout wire LDO_2_5_DCAP,

    // DIGITAL
    
    inout wire TCK,
    inout wire TMS,
    inout wire TDI,
    inout wire TRST,
    inout wire TDO,

    //GPIO

    inout wire GPIO0,
    inout wire GPIO1,
    inout wire GPIO2,
    inout wire GPIO3,
    inout wire GPIO4,
    inout wire GPIO5,
    inout wire GPIO6,
    inout wire GPIO7,
    inout wire GPIO8,
    inout wire GPIO9,
    inout wire GPIO10,
    inout wire GPIO11,
    inout wire GPIO12,
    inout wire GPIO13,
    inout wire GPIO14,
    inout wire GPIO15,
    inout wire GPIO16,
    inout wire GPIO17,
    inout wire GPIO18,
    inout wire GPIO19,
    inout wire GPIO20,
    inout wire GPIO21,
    inout wire GPIO22,

    //========================================================
    // CLOCK / RESET
    //========================================================

    output wire xtal_in_btc,
    output wire reset_n_btc,

    //========================================================
    // GPIO CORE INTERFACE
    //========================================================
    input  logic [22:0] gpio_pad_dir,
    input  logic [22:0] gpio_pad_in,
    output logic [22:0] gpio_pad_out,

    //========================================================
    // JTAG
    //========================================================
 
    output wire tck_jtag_btc,
    output wire tms_jtag_btc,
    output wire tdi_jtag_btc,
    output wire trst_jtag_btc,

    input wire tdo_jtag_bto
        
);

// GPIO IO PAD

gpio_io_pad u_gpio_io_pad (
    // Core-side GPIO controls
    .gpio_pad_block_dir   (gpio_pad_dir),
    .gpio_pad_block_in    (gpio_pad_in),
    .gpio_pad_block_out   (gpio_pad_out),

    // Physical GPIO pads
    .gpio_pad_out0  (gpio_pad_bto0),
    .gpio_pad_out1  (gpio_pad_bto1),
    .gpio_pad_out2  (gpio_pad_bto2),
    .gpio_pad_out3  (gpio_pad_bto3),
    .gpio_pad_out4  (gpio_pad_bto4),
    .gpio_pad_out5  (gpio_pad_bto5),
    .gpio_pad_out6  (gpio_pad_bto6),
    .gpio_pad_out7  (gpio_pad_bto7),
    .gpio_pad_out8  (gpio_pad_bto8),
    .gpio_pad_out9  (gpio_pad_bto9),
    .gpio_pad_out10 (gpio_pad_bto10),
    .gpio_pad_out11 (gpio_pad_bto11),
    .gpio_pad_out12 (gpio_pad_bto12),
    .gpio_pad_out13 (gpio_pad_bto13),
    .gpio_pad_out14 (gpio_pad_bto14),
    .gpio_pad_out15 (gpio_pad_bto15),
    .gpio_pad_out16 (gpio_pad_bto16),
    .gpio_pad_out17 (gpio_pad_bto17),
    .gpio_pad_out18 (gpio_pad_bto18),
    .gpio_pad_out19 (gpio_pad_bto19),
    .gpio_pad_out20 (gpio_pad_bto20),
    .gpio_pad_out21 (gpio_pad_bto21),
    .gpio_pad_out22 (gpio_pad_bto22)
);

// DIGITAL IO PAD

digital_io_pad u_digital_io_pad (

    // Physical JTAG pads
    .tck_pad        (TCK),
    .tms_pad        (TMS),
    .tdi_pad        (TDI),
    .trst_pad       (TRST),
    .tdo_pad        (TDO),

    // IO PAD block -> Core
    .tck_jtag_itb   (tck_jtag_btc),
    .tms_jtag_itb   (tms_jtag_btc),
    .tdi_jtag_itb   (tdi_jtag_btc),
    .trst_jtag_itb  (trst_jtag_btc),

    // Core -> IO PAD block
    .tdo_jtag_ctb   (tdo_jtag_bto)
);

power_io_pad u_misc_io_pad (

    // Power
    .VDDPST       (VDDPST),
    .VSSPST       (VSSPST),
    .VDD_1_2      (VDD_1_2),   

    // Clock
    .CLK_IN       (XTAL_IN),
    .CLK_OUT      (XTAL_OUT),
    .CLK_CORE     (xtal_in_btc),

    // Reset
    .RESET_IN     (RESET_N),
    .RESET_CORE   (reset_n_btc)

);

// ANALOG IO PAD

analog_io_pad u_analog_io_pad (
    .VDD_1_8      (VDD_1_8),
    .VDD_2_5      (VDD_2_5),
    .ANA0         (ANA0),
    .ANA1         (ANA1),
    .ANA2         (ANA2),
    .ANA3         (ANA3),
    .ANA4         (ANA4),
    .ANA5         (ANA5),
    .ANA6         (ANA6),
    .ANA7         (ANA7),
    .ANA8         (ANA8),
    .ANA9         (ANA9),

    .ADC_IN       (ADC_IN),
    .DAC_OUT      (DAC_OUT),

    .LDO_1_2_ACAP (LDO_1_2_ACAP),
    .LDO_1_2_DCAP (LDO_1_2_DCAP),
    .LDO_1_8_ACAP (LDO_1_8_ACAP),
    .LDO_1_8_DCAP (LDO_1_8_DCAP),
    .LDO_2_5_ACAP (LDO_2_5_ACAP),
    .LDO_2_5_DCAP (LDO_2_5_DCAP)
);

endmodule
