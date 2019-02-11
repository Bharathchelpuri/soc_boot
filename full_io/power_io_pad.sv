module power_io_pad (
    inout wire VDDPST,
    inout wire VSSPST,
    inout wire VDD_1_2,
    inout wire RESET_N,
    inout wire XTAL_IN,
    inout wire XTAL_OUT
,
    output wire xtal_in_btc,
    output wire reset_n_btc,
    input  wire xtal_out_btc
);

PVDD2CDG u_vddpst (
    .VDDPST (VDDPST)
);

PVSS2CDG u_vsspst (
    .VSSPST (VSSPST)
);

PVDD2CDG u_vdd_1_2 (
    .VDDPST (VDD_1_2)
);

PRUW0408CDG u_reset_n (
    .I (1'b0),
    .DS (1'b0),
    .OEN (1'b1),
    .PAD (RESET_N),
    .C (reset_n_btc),
    .PE (1'b0),
    .IE (1'b1)
);

PXOE1CDG u_xtal_in (
    .XC (xtal_in_btc),
    .XO (XTAL_IN_XO),
    .XI (XTAL_IN_XI),
    .XE (1'b1)
);

PXOE1CDG u_xtal_out (
    .XC (xtal_in_btc),
    .XO (XTAL_OUT_XO),
    .XI (XTAL_OUT_XI),
    .XE (1'b1)
);

endmodule

