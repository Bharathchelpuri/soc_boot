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

    // ANALOG
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
    inout wire TRST,
    inout wire TCK,
    inout wire TMS,
    inout wire TDI,
    inout wire TDO,
    // GPIO
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

    // CLOCK / RESET
    output wire xtal_in_btc,
    output wire reset_n_btc,

    // GPIO CORE INTERFACE
    input  logic [22:0] gpio_pad_dir,
    output logic [22:0] gpio_pad_in,
    input  logic [22:0] gpio_pad_out,
    input  logic [22:0] gpio_pad_pull_en,

    // JTAG
    output wire tck_jtag_btc,
    output wire tms_jtag_btc,
    output wire tdi_jtag_btc,
    output wire trst_jtag_btc,
    input  wire tdo_jtag_bto
);

    gpio_io_pad u_gpio_io_pad (
        .gpio_pad_dir       (gpio_pad_dir),
        .gpio_pad_in        (gpio_pad_in),
        .gpio_pad_out       (gpio_pad_out),
        .gpio_pad_pull_en   (gpio_pad_pull_en),
        .GPIO0 (GPIO0),
        .GPIO1 (GPIO1),
        .GPIO2 (GPIO2),
        .GPIO3 (GPIO3),
        .GPIO4 (GPIO4),
        .GPIO5 (GPIO5),
        .GPIO6 (GPIO6),
        .GPIO7 (GPIO7),
        .GPIO8 (GPIO8),
        .GPIO9 (GPIO9),
        .GPIO10 (GPIO10),
        .GPIO11 (GPIO11),
        .GPIO12 (GPIO12),
        .GPIO13 (GPIO13),
        .GPIO14 (GPIO14),
        .GPIO15 (GPIO15),
        .GPIO16 (GPIO16),
        .GPIO17 (GPIO17),
        .GPIO18 (GPIO18),
        .GPIO19 (GPIO19),
        .GPIO20 (GPIO20),
        .GPIO21 (GPIO21),
        .GPIO22 (GPIO22)
    );

    digital_io_pad u_digital_io_pad (
        .tck_jtag_btc   (tck_jtag_btc),
        .tms_jtag_btc   (tms_jtag_btc),
        .tdi_jtag_btc   (tdi_jtag_btc),
        .trst_jtag_btc  (trst_jtag_btc),
        .tdo_jtag_bto   (tdo_jtag_bto),
        .TRST (TRST),
        .TCK (TCK),
        .TMS (TMS),
        .TDI (TDI),
        .TDO (TDO)
    );

    analog_io_pad u_analog_io_pad (
        .VDD_1_8 (VDD_1_8),
        .VDD_2_5 (VDD_2_5),
        .ANA0 (ANA0),
        .ANA1 (ANA1),
        .ANA2 (ANA2),
        .ANA3 (ANA3),
        .ANA4 (ANA4),
        .ANA5 (ANA5),
        .ANA6 (ANA6),
        .ANA7 (ANA7),
        .ANA8 (ANA8),
        .ANA9 (ANA9),
        .ADC_IN (ADC_IN),
        .DAC_OUT (DAC_OUT),
        .LDO_1_2_ACAP (LDO_1_2_ACAP),
        .LDO_1_2_DCAP (LDO_1_2_DCAP),
        .LDO_1_8_ACAP (LDO_1_8_ACAP),
        .LDO_1_8_DCAP (LDO_1_8_DCAP),
        .LDO_2_5_ACAP (LDO_2_5_ACAP),
        .LDO_2_5_DCAP (LDO_2_5_DCAP)
    );

    power_io_pad u_power_io_pad (
        .xtal_in_btc  (xtal_in_btc),
        .reset_n_btc  (reset_n_btc),
        .xtal_out_btc (XTAL_OUT),
        .VDDPST (VDDPST),
        .VSSPST (VSSPST),
        .VDD_1_2 (VDD_1_2),
        .RESET_N (RESET_N),
        .XTAL_IN (XTAL_IN),
        .XTAL_OUT (XTAL_OUT)
    );

endmodule

