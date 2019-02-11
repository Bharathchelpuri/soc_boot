module digital_io_pad (
    inout wire TRST,
    inout wire TCK,
    inout wire TMS,
    inout wire TDI,
    inout wire TDO
,
    output wire tck_jtag_btc,
    output wire tms_jtag_btc,
    output wire tdi_jtag_btc,
    output wire trst_jtag_btc,
    input  wire tdo_jtag_bto
);

PRDW0408CDG u_trst (
    .I (1'b0),
    .DS (1'b0),
    .OEN (1'b1),
    .PAD (TRST),
    .C (trst_jtag_btc),
    .PE (1'b0),
    .IE (1'b1)
);

PRDW0408CDG u_tck (
    .I (1'b0),
    .DS (1'b0),
    .OEN (1'b1),
    .PAD (TCK),
    .C (tck_jtag_btc),
    .PE (1'b0),
    .IE (1'b1)
);

PRDW0408CDG u_tms (
    .I (1'b0),
    .DS (1'b0),
    .OEN (1'b1),
    .PAD (TMS),
    .C (tms_jtag_btc),
    .PE (1'b0),
    .IE (1'b1)
);

PRDW0408CDG u_tdi (
    .I (1'b0),
    .DS (1'b0),
    .OEN (1'b1),
    .PAD (TDI),
    .C (tdi_jtag_btc),
    .PE (1'b0),
    .IE (1'b1)
);

PRDW0408CDG u_tdo (
    .I (tdo_jtag_bto),
    .DS (1'b0),
    .OEN (1'b0),
    .PAD (TDO),
    .C (1'b0),
    .PE (1'b0),
    .IE (1'b0)
);

endmodule

