`include "../rtl/common/io_pad/io_pad_config.svh"

module analog_io_pad (

    //========================================================
    // Analog IO Pads
    //========================================================

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
    inout wire LDO_2_5_DCAP

);

    //========================================================
    // Analog PDK Cell Instances
    //========================================================

    `ANALOG_P_CELL u_vdd_1_8 (
        .VDDPST (VDD_1_8)
    );

    `ANALOG_P_CELL u_vdd_2_5 (
        .VDDPST (VDD_2_5)
    ); 
    
    `ANALOG_IO_CELL u_ana0 (
        .AIO (ANA0)
    );

    `ANALOG_IO_CELL u_ana1 (
        .AIO (ANA1)
    );

    `ANALOG_IO_CELL u_ana2 (
        .AIO (ANA2)
    );

    `ANALOG_IO_CELL u_ana3 (
        .AIO (ANA3)
    );

    `ANALOG_IO_CELL u_ana4 (
        .AIO (ANA4)
    );

    `ANALOG_IO_CELL u_ana5 (
        .AIO (ANA5)
    );

    `ANALOG_IO_CELL u_ana6 (
        .AIO (ANA6)
    );

    `ANALOG_IO_CELL u_ana7 (
        .AIO (ANA7)
    );

    `ANALOG_IO_CELL u_ana8 (
        .AIO (ANA8)
    );

    `ANALOG_IO_CELL u_ana9 (
        .AIO (ANA9)
    );

    `ANALOG_IO_CELL u_adc_in (
        .AIO (ADC_IN)
    );

    `ANALOG_IO_CELL u_dac_out (
        .AIO (DAC_OUT)
    );

    `ANALOG_IO_CELL u_ldo_1_2_acap (
        .AIO (LDO_1_2_ACAP)
    );

    `ANALOG_IO_CELL u_ldo_1_2_dcap (
        .AIO (LDO_1_2_DCAP)
    );

    `ANALOG_IO_CELL u_ldo_1_8_acap (
        .AIO (LDO_1_8_ACAP)
    );

    `ANALOG_IO_CELL u_ldo_1_8_dcap (
        .AIO (LDO_1_8_DCAP)
    );

    `ANALOG_IO_CELL u_ldo_2_5_acap (
        .AIO (LDO_2_5_ACAP)
    );

    `ANALOG_IO_CELL u_ldo_2_5_dcap (
        .AIO (LDO_2_5_DCAP)
    );

  

endmodule
