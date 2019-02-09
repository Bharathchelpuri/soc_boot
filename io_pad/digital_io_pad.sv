`include "io_pad_config.svh"

module digital_io_pad (
    inout wire tck_pad,
    inout wire tms_pad,
    inout wire tdi_pad,
    inout wire trst_pad,
    inout wire tdo_pad,

    // PAD  to Core  
    output wire tck_jtag_itb,
    output wire tms_jtag_itb,
    output wire tdi_jtag_itb,
    output wire trst_jtag_itb,

    // Core to PAD
    input wire tdo_jtag_ctb
);

    `DIGITAL_IO_CELL u_tck (
        .I   (1'b0),
        .DS  (1'b0),
        .OEN (1'b1),              
        .PAD (tck_pad),
        .C   (tck_jtag_itb),
        .PE  (1'b0),
        .IE  (1'b1)               
    );

    `DIGITAL_IO_CELL u_tms (
        .I   (1'b0),
        .DS  (1'b0),
        .OEN (1'b1),
        .PAD (tms_pad),
        .C   (tms_jtag_itb),
        .PE  (1'b0),
        .IE  (1'b1)
    );

    `DIGITAL_IO_CELL u_tdi (
        .I   (1'b0),
        .DS  (1'b0),
        .OEN (1'b1),
        .PAD (tdi_pad),
        .C   (tdi_jtag_itb),
        .PE  (1'b0),
        .IE  (1'b1)
    );

    `DIGITAL_IO_CELL u_trst (
        .I   (1'b0),
        .DS  (1'b0),
        .OEN (1'b1),
        .PAD (trst_pad),
        .C   (trst_jtag_itb),
        .PE  (1'b0),
        .IE  (1'b1)
    );

    `DIGITAL_IO_CELL u_tdo (
        .I   (tdo_jtag_ctb),
        .DS  (1'b0),
        .OEN (1'b0),              
        .PAD (tdo_pad),
        .C   (),                  
        .PE  (1'b0),
        .IE  (1'b0)               
    );

endmodule
