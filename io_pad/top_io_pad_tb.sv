
module top_io_pad_tb;

    //========================================================
    // POWER PADS
    //========================================================
    tri VDDPST;
    tri VSSPST;
    tri VDD_1_2;


    //========================================================
    // CLOCK / RESET
    //========================================================
    reg  XTAL_IN;
    wire XTAL_OUT;
    tri  RESET_N;


    //========================================================
    // ANALOG PADS
    //========================================================
    tri VDD_1_8;
    tri VDD_2_5;

    tri ANA0;
    tri ANA1;
    tri ANA2;
    tri ANA3;
    tri ANA4;
    tri ANA5;
    tri ANA6;
    tri ANA7;
    tri ANA8;
    tri ANA9;

    tri ADC_IN;
    tri DAC_OUT;

    tri LDO_1_2_ACAP;
    tri LDO_1_2_DCAP;
    tri LDO_1_8_ACAP;
    tri LDO_1_8_DCAP;
    tri LDO_2_5_ACAP;
    tri LDO_2_5_DCAP;


    //========================================================
    // DIGITAL / JTAG
    //========================================================
    tri TCK;
    tri TMS;
    tri TDI;
    tri TRST;

    wire TDO;


    //========================================================
    // GPIO PHYSICAL PADS
    //========================================================
    tri GPIO0;
    tri GPIO1;
    tri GPIO2;
    tri GPIO3;
    tri GPIO4;
    tri GPIO5;
    tri GPIO6;
    tri GPIO7;
    tri GPIO8;
    tri GPIO9;
    tri GPIO10;
    tri GPIO11;
    tri GPIO12;
    tri GPIO13;
    tri GPIO14;
    tri GPIO15;
    tri GPIO16;
    tri GPIO17;
    tri GPIO18;
    tri GPIO19;
    tri GPIO20;
    tri GPIO21;
    tri GPIO22;


    //========================================================
    // CLOCK / RESET CORE INTERFACE
    //========================================================
    wire xtal_in_btc;
    wire reset_n_btc;


    //========================================================
    // GPIO CORE INTERFACE
    //========================================================
    reg  [22:0] gpio_pad_dir;
    reg  [22:0] gpio_pad_in;
    wire [22:0] gpio_pad_out;


    //========================================================
    // JTAG CORE INTERFACE
    //========================================================
    wire tck_jtag_btc;
    wire tms_jtag_btc;
    wire tdi_jtag_btc;
    wire trst_jtag_btc;

    reg tdo_jtag_bto;


    //========================================================
    // EXTERNAL DRIVERS
    //========================================================

    //-------------------------
    // RESET
    //-------------------------
    reg reset_drv_en;
    reg reset_drv;

    assign RESET_N = reset_drv_en ? reset_drv : 1'bz;


    //-------------------------
    // JTAG INPUTS
    //-------------------------
    reg jtag_drv_en;

    reg tck_drv;
    reg tms_drv;
    reg tdi_drv;
    reg trst_drv;

    assign TCK  = jtag_drv_en ? tck_drv  : 1'bz;
    assign TMS  = jtag_drv_en ? tms_drv  : 1'bz;
    assign TDI  = jtag_drv_en ? tdi_drv  : 1'bz;
    assign TRST = jtag_drv_en ? trst_drv : 1'bz;


    //========================================================
    // GPIO EXTERNAL DRIVER
    //========================================================

    reg [22:0] gpio_ext_data;
    reg        gpio_ext_en;

    assign GPIO0  = gpio_ext_en ? gpio_ext_data[0]  : 1'bz;
    assign GPIO1  = gpio_ext_en ? gpio_ext_data[1]  : 1'bz;
    assign GPIO2  = gpio_ext_en ? gpio_ext_data[2]  : 1'bz;
    assign GPIO3  = gpio_ext_en ? gpio_ext_data[3]  : 1'bz;
    assign GPIO4  = gpio_ext_en ? gpio_ext_data[4]  : 1'bz;
    assign GPIO5  = gpio_ext_en ? gpio_ext_data[5]  : 1'bz;
    assign GPIO6  = gpio_ext_en ? gpio_ext_data[6]  : 1'bz;
    assign GPIO7  = gpio_ext_en ? gpio_ext_data[7]  : 1'bz;
    assign GPIO8  = gpio_ext_en ? gpio_ext_data[8]  : 1'bz;
    assign GPIO9  = gpio_ext_en ? gpio_ext_data[9]  : 1'bz;
    assign GPIO10 = gpio_ext_en ? gpio_ext_data[10] : 1'bz;
    assign GPIO11 = gpio_ext_en ? gpio_ext_data[11] : 1'bz;
    assign GPIO12 = gpio_ext_en ? gpio_ext_data[12] : 1'bz;
    assign GPIO13 = gpio_ext_en ? gpio_ext_data[13] : 1'bz;
    assign GPIO14 = gpio_ext_en ? gpio_ext_data[14] : 1'bz;
    assign GPIO15 = gpio_ext_en ? gpio_ext_data[15] : 1'bz;
    assign GPIO16 = gpio_ext_en ? gpio_ext_data[16] : 1'bz;
    assign GPIO17 = gpio_ext_en ? gpio_ext_data[17] : 1'bz;
    assign GPIO18 = gpio_ext_en ? gpio_ext_data[18] : 1'bz;
    assign GPIO19 = gpio_ext_en ? gpio_ext_data[19] : 1'bz;
    assign GPIO20 = gpio_ext_en ? gpio_ext_data[20] : 1'bz;
    assign GPIO21 = gpio_ext_en ? gpio_ext_data[21] : 1'bz;
    assign GPIO22 = gpio_ext_en ? gpio_ext_data[22] : 1'bz;


    //========================================================
    // ANALOG EXTERNAL DRIVERS
    //========================================================

    reg ana_drv_en;

    reg ana0_drv;
    reg ana1_drv;
    reg ana2_drv;
    reg ana3_drv;
    reg ana4_drv;
    reg ana5_drv;
    reg ana6_drv;
    reg ana7_drv;
    reg ana8_drv;
    reg ana9_drv;

    reg adc_in_drv;
    reg dac_out_drv;

    reg ldo_1_2_acap_drv;
    reg ldo_1_2_dcap_drv;
    reg ldo_1_8_acap_drv;
    reg ldo_1_8_dcap_drv;
    reg ldo_2_5_acap_drv;
    reg ldo_2_5_dcap_drv;

    reg vdd_1_8_drv;
    reg vdd_2_5_drv;


    assign ANA0 = ana_drv_en ? ana0_drv : 1'bz;
    assign ANA1 = ana_drv_en ? ana1_drv : 1'bz;
    assign ANA2 = ana_drv_en ? ana2_drv : 1'bz;
    assign ANA3 = ana_drv_en ? ana3_drv : 1'bz;
    assign ANA4 = ana_drv_en ? ana4_drv : 1'bz;
    assign ANA5 = ana_drv_en ? ana5_drv : 1'bz;
    assign ANA6 = ana_drv_en ? ana6_drv : 1'bz;
    assign ANA7 = ana_drv_en ? ana7_drv : 1'bz;
    assign ANA8 = ana_drv_en ? ana8_drv : 1'bz;
    assign ANA9 = ana_drv_en ? ana9_drv : 1'bz;

    assign ADC_IN =
        ana_drv_en ? adc_in_drv : 1'bz;

    assign DAC_OUT =
        ana_drv_en ? dac_out_drv : 1'bz;

    assign LDO_1_2_ACAP =
        ana_drv_en ? ldo_1_2_acap_drv : 1'bz;

    assign LDO_1_2_DCAP =
        ana_drv_en ? ldo_1_2_dcap_drv : 1'bz;

    assign LDO_1_8_ACAP =
        ana_drv_en ? ldo_1_8_acap_drv : 1'bz;

    assign LDO_1_8_DCAP =
        ana_drv_en ? ldo_1_8_dcap_drv : 1'bz;

    assign LDO_2_5_ACAP =
        ana_drv_en ? ldo_2_5_acap_drv : 1'bz;

    assign LDO_2_5_DCAP =
        ana_drv_en ? ldo_2_5_dcap_drv : 1'bz;

    assign VDD_1_8 =
        ana_drv_en ? vdd_1_8_drv : 1'bz;

    assign VDD_2_5 =
        ana_drv_en ? vdd_2_5_drv : 1'bz;


    //========================================================
    // DUT
    //========================================================

    top_io_pad dut (

        //====================================================
        // POWER
        //====================================================
        .VDDPST  (VDDPST),
        .VSSPST  (VSSPST),
        .VDD_1_2 (VDD_1_2),

        //====================================================
        // CLOCK / RESET
        //====================================================
        .RESET_N  (RESET_N),
        .XTAL_IN  (XTAL_IN),
        .XTAL_OUT (XTAL_OUT),

        //====================================================
        // ANALOG
        //====================================================
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
        .LDO_2_5_DCAP (LDO_2_5_DCAP),

        //====================================================
        // DIGITAL
        //====================================================
        .TCK  (TCK),
        .TMS  (TMS),
        .TDI  (TDI),
        .TRST (TRST),
        .TDO  (TDO),

        //====================================================
        // GPIO
        //====================================================
        .GPIO0  (GPIO0),
        .GPIO1  (GPIO1),
        .GPIO2  (GPIO2),
        .GPIO3  (GPIO3),
        .GPIO4  (GPIO4),
        .GPIO5  (GPIO5),
        .GPIO6  (GPIO6),
        .GPIO7  (GPIO7),
        .GPIO8  (GPIO8),
        .GPIO9  (GPIO9),
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
        .GPIO22 (GPIO22),

        //====================================================
        // CORE SIDE
        //====================================================
        .xtal_in_btc  (xtal_in_btc),
        .reset_n_btc  (reset_n_btc),

        .gpio_pad_dir (gpio_pad_dir),
        .gpio_pad_in  (gpio_pad_in),
        .gpio_pad_out (gpio_pad_out),

        .tck_jtag_btc  (tck_jtag_btc),
        .tms_jtag_btc  (tms_jtag_btc),
        .tdi_jtag_btc  (tdi_jtag_btc),
        .trst_jtag_btc (trst_jtag_btc),

        .tdo_jtag_bto (tdo_jtag_bto)

    );


    //========================================================
    // TEST SEQUENCE
    //========================================================

    initial begin

        //====================================================
        // INITIALIZATION
        //====================================================

        XTAL_IN = 1'b0;

        reset_drv_en = 1'b0;
        reset_drv    = 1'b1;

        jtag_drv_en = 1'b0;

        tck_drv  = 1'b0;
        tms_drv  = 1'b0;
        tdi_drv  = 1'b0;
        trst_drv = 1'b0;

        gpio_pad_dir = '0;
        gpio_pad_in  = '0;

        gpio_ext_data = '0;
        gpio_ext_en   = 1'b0;

        ana_drv_en = 1'b0;

        ana0_drv = 0;
        ana1_drv = 0;
        ana2_drv = 0;
        ana3_drv = 0;
        ana4_drv = 0;
        ana5_drv = 0;
        ana6_drv = 0;
        ana7_drv = 0;
        ana8_drv = 0;
        ana9_drv = 0;

        adc_in_drv  = 0;
        dac_out_drv = 0;

        ldo_1_2_acap_drv = 0;
        ldo_1_2_dcap_drv = 0;
        ldo_1_8_acap_drv = 0;
        ldo_1_8_dcap_drv = 0;
        ldo_2_5_acap_drv = 0;
        ldo_2_5_dcap_drv = 0;

        vdd_1_8_drv = 0;
        vdd_2_5_drv = 0;

        tdo_jtag_bto = 1'b0;

        #20;


        //====================================================
        // TEST 1 : JTAG INPUTS
        //====================================================

        $display("==========================================");
        $display("TEST 1 : JTAG INPUTS");
        $display("==========================================");

        jtag_drv_en = 1'b1;

        tck_drv  = 1'b1;
        tms_drv  = 1'b0;
        tdi_drv  = 1'b1;
        trst_drv = 1'b0;

        #10;

        if (tck_jtag_btc !== 1'b1)
            $error("TCK test FAILED");
        else
            $display("TCK test PASS");

        if (tms_jtag_btc !== 1'b0)
            $error("TMS test FAILED");
        else
            $display("TMS test PASS");

        if (tdi_jtag_btc !== 1'b1)
            $error("TDI test FAILED");
        else
            $display("TDI test PASS");

        if (trst_jtag_btc !== 1'b0)
            $error("TRST test FAILED");
        else
            $display("TRST test PASS");


        //====================================================
        // TEST 2 : JTAG TDO
        //====================================================

        $display("==========================================");
        $display("TEST 2 : JTAG TDO");
        $display("==========================================");

        jtag_drv_en = 1'b0;

        tdo_jtag_bto = 1'b0;

        #10;

        if (TDO !== 1'b0)
            $error("TDO = 0 test FAILED");
        else
            $display("TDO = 0 test PASS");

        tdo_jtag_bto = 1'b1;

        #10;

        if (TDO !== 1'b1)
            $error("TDO = 1 test FAILED");
        else
            $display("TDO = 1 test PASS");


        //====================================================
        // TEST 3 : CLOCK
        //====================================================

        $display("==========================================");
        $display("TEST 3 : CLOCK");
        $display("==========================================");

        XTAL_IN = 1'b0;

        #10;

        if (xtal_in_btc !== 1'b0)
            $error("XTAL_IN = 0 test FAILED");
        else
            $display("XTAL_IN = 0 test PASS");

        if (XTAL_OUT !== 1'b1)
            $error("XTAL_OUT for CLK=0 test FAILED");
        else
            $display("XTAL_OUT for CLK=0 test PASS");


        XTAL_IN = 1'b1;

        #10;

        if (xtal_in_btc !== 1'b1)
            $error("XTAL_IN = 1 test FAILED");
        else
            $display("XTAL_IN = 1 test PASS");

        if (XTAL_OUT !== 1'b0)
            $error("XTAL_OUT for CLK=1 test FAILED");
        else
            $display("XTAL_OUT for CLK=1 test PASS");


        //====================================================
        // TEST 4 : RESET
        //====================================================

        $display("==========================================");
        $display("TEST 4 : RESET");
        $display("==========================================");

        reset_drv_en = 1'b1;

        reset_drv = 1'b0;

        #10;

        if (reset_n_btc !== 1'b0)
            $error("RESET = 0 test FAILED");
        else
            $display("RESET = 0 test PASS");

        reset_drv = 1'b1;

        #10;

        if (reset_n_btc !== 1'b1)
            $error("RESET = 1 test FAILED");
        else
            $display("RESET = 1 test PASS");

        reset_drv_en = 1'b0;


        //====================================================
        // TEST 5 : ANALOG
        //====================================================

        $display("==========================================");
        $display("TEST 5 : ANALOG");
        $display("==========================================");

        ana_drv_en = 1'b1;

        ana0_drv = 1'b1;
        ana1_drv = 1'b1;
        ana2_drv = 1'b1;
        ana3_drv = 1'b1;
        ana4_drv = 1'b1;
        ana5_drv = 1'b1;
        ana6_drv = 1'b1;
        ana7_drv = 1'b1;
        ana8_drv = 1'b1;
        ana9_drv = 1'b1;

        adc_in_drv  = 1'b1;
        dac_out_drv = 1'b1;

        ldo_1_2_acap_drv = 1'b1;
        ldo_1_2_dcap_drv = 1'b1;
        ldo_1_8_acap_drv = 1'b1;
        ldo_1_8_dcap_drv = 1'b1;
        ldo_2_5_acap_drv = 1'b1;
        ldo_2_5_dcap_drv = 1'b1;

        vdd_1_8_drv = 1'b1;
        vdd_2_5_drv = 1'b1;

        #10;

        if (ANA0 !== 1'b1) $error("ANA0 FAILED");
        if (ANA1 !== 1'b1) $error("ANA1 FAILED");
        if (ANA2 !== 1'b1) $error("ANA2 FAILED");
        if (ANA3 !== 1'b1) $error("ANA3 FAILED");
        if (ANA4 !== 1'b1) $error("ANA4 FAILED");
        if (ANA5 !== 1'b1) $error("ANA5 FAILED");
        if (ANA6 !== 1'b1) $error("ANA6 FAILED");
        if (ANA7 !== 1'b1) $error("ANA7 FAILED");
        if (ANA8 !== 1'b1) $error("ANA8 FAILED");
        if (ANA9 !== 1'b1) $error("ANA9 FAILED");

        if (ADC_IN !== 1'b1)
            $error("ADC_IN FAILED");

        if (DAC_OUT !== 1'b1)
            $error("DAC_OUT FAILED");

        if (VDD_1_8 !== 1'b1)
            $error("VDD_1_8 FAILED");

        if (VDD_2_5 !== 1'b1)
            $error("VDD_2_5 FAILED");

        $display("ANALOG connectivity test completed");


        //====================================================
        // TEST 6 : GPIO
        //====================================================

        $display("==========================================");
        $display("TEST 6 : GPIO");
        $display("==========================================");

        gpio_pad_dir = 23'h7FFFFF;
        gpio_pad_in  = 23'h555555;

        #10;

        $display("GPIO core interface test completed");


        //====================================================
        // TEST COMPLETE
        //====================================================

        $display("==========================================");
        $display("TOP IO PAD TEST COMPLETED");
        $display("==========================================");

        #20;

        $finish;

    end

endmodule
