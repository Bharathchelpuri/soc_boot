module analog_io_pad (
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

PVDD2CDG u_vdd_1_8 (
    .VDDPST (VDD_1_8)
);

PVDD2CDG u_vdd_2_5 (
    .VDDPST (VDD_2_5)
);

PDB3A u_ana0 (
    .AIO (ANA0)
);

PDB3A u_ana1 (
    .AIO (ANA1)
);

PDB3A u_ana2 (
    .AIO (ANA2)
);

PDB3A u_ana3 (
    .AIO (ANA3)
);

PDB3A u_ana4 (
    .AIO (ANA4)
);

PDB3A u_ana5 (
    .AIO (ANA5)
);

PDB3A u_ana6 (
    .AIO (ANA6)
);

PDB3A u_ana7 (
    .AIO (ANA7)
);

PDB3A u_ana8 (
    .AIO (ANA8)
);

PDB3A u_ana9 (
    .AIO (ANA9)
);

PDB3A u_adc_in (
    .AIO (ADC_IN)
);

PDB3A u_dac_out (
    .AIO (DAC_OUT)
);

PDB3A u_ldo_1_2_acap (
    .AIO (LDO_1_2_ACAP)
);

PDB3A u_ldo_1_2_dcap (
    .AIO (LDO_1_2_DCAP)
);

PDB3A u_ldo_1_8_acap (
    .AIO (LDO_1_8_ACAP)
);

PDB3A u_ldo_1_8_dcap (
    .AIO (LDO_1_8_DCAP)
);

PDB3A u_ldo_2_5_acap (
    .AIO (LDO_2_5_ACAP)
);

PDB3A u_ldo_2_5_dcap (
    .AIO (LDO_2_5_DCAP)
);

endmodule

