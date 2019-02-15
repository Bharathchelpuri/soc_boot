`include "../rtl/common/io_pad/io_pad_config.svh"

module gpio_io_pad (
    // Signals from GPIO block
    input  logic [22:0] gpio_pad_block_dir,
    input  logic [22:0] gpio_pad_block_out,
    input  logic [22:0] gpio_pull_en,
    output logic [22:0] gpio_pad_block_in,

    // Physical GPIO pads
    inout wire gpio_pad_out0,
    inout wire gpio_pad_out1,
    inout wire gpio_pad_out2,
    inout wire gpio_pad_out3,
    inout wire gpio_pad_out4,
    inout wire gpio_pad_out5,
    inout wire gpio_pad_out6,
    inout wire gpio_pad_out7,
    inout wire gpio_pad_out8,
    inout wire gpio_pad_out9,
    inout wire gpio_pad_out10,
    inout wire gpio_pad_out11,
    inout wire gpio_pad_out12,
    inout wire gpio_pad_out13,
    inout wire gpio_pad_out14,
    inout wire gpio_pad_out15,
    inout wire gpio_pad_out16,
    inout wire gpio_pad_out17,
    inout wire gpio_pad_out18,
    inout wire gpio_pad_out19,
    inout wire gpio_pad_out20,
    inout wire gpio_pad_out21,
    inout wire gpio_pad_out22
);

    // ==========================================================
    // GPIO0
    // ==========================================================

    `GPIO_SDA_CELL u_gpio_pad0 (
        .I   (gpio_pad_block_out[0]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[0]),
        .PAD (gpio_pad_out0),
        .C   (gpio_pad_block_in[0]),
        .PE  (gpio_pull_en[0]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO1
    // ==========================================================

    `GPIO_CELL u_gpio_pad1 (
        .I   (gpio_pad_block_out[1]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[1]),
        .PAD (gpio_pad_out1),
        .C   (gpio_pad_block_in[1]),
        .PE  (gpio_pull_en[1]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO2
    // ==========================================================

    `GPIO_CELL u_gpio_pad2 (
        .I   (gpio_pad_block_out[2]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[2]),
        .PAD (gpio_pad_out2),
        .C  (gpio_pad_block_in[2]),
        .PE  (gpio_pull_en[2]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO3
    // ==========================================================

    `GPIO_CELL u_gpio_pad3 (
        .I   (gpio_pad_block_out[3]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[3]),
        .PAD (gpio_pad_out3),
        .C   (gpio_pad_block_in[3]),
        .PE  (gpio_pull_en[3]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO4
    // ==========================================================

    `GPIO_CELL u_gpio_pad4 (
        .I   (gpio_pad_block_out[4]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[4]),
        .PAD (gpio_pad_out4),
        .C   (gpio_pad_block_in[4]),
        .PE  (gpio_pull_en[4]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO5
    // ==========================================================

    `GPIO_CELL u_gpio_pad5 (
        .I   (gpio_pad_block_out[5]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[5]),
        .PAD (gpio_pad_out5),
        .C   (gpio_pad_block_in[5]),
        .PE  (gpio_pull_en[5]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO6
    // ==========================================================

    `GPIO_CELL u_gpio_pad6 (
        .I   (gpio_pad_block_out[6]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[6]),
        .PAD (gpio_pad_out6),
        .C   (gpio_pad_block_in[6]),
        .PE  (gpio_pull_en[6]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO7
    // ==========================================================

    `GPIO_CELL u_gpio_pad7 (
        .I   (gpio_pad_block_out[7]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[7]),
        .PAD (gpio_pad_out7),
        .C   (gpio_pad_block_in[7]),
        .PE  (gpio_pull_en[7]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO8
    // ==========================================================

    `GPIO_CELL u_gpio_pad8 (
        .I   (gpio_pad_block_out[8]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[8]),
        .PAD (gpio_pad_out8),
        .C   (gpio_pad_block_in[8]),
        .PE  (gpio_pull_en[8]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO9
    // ==========================================================

    `GPIO_CELL u_gpio_pad9 (
        .I   (gpio_pad_block_out[9]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[9]),
        .PAD (gpio_pad_out9),
        .C   (gpio_pad_block_in[9]),
        .PE  (gpio_pull_en[9]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO10
    // ==========================================================

    `GPIO_CELL u_gpio_pad10 (
        .I   (gpio_pad_block_out[10]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[10]),
        .PAD (gpio_pad_out10),
        .C   (gpio_pad_block_in[10]),
        .PE  (gpio_pull_en[10]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO11
    // ==========================================================

    `GPIO_CELL u_gpio_pad11 (
        .I   (gpio_pad_block_out[11]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[11]),
        .PAD (gpio_pad_out11),
        .C   (gpio_pad_block_in[11]),
        .PE  (gpio_pull_en[11]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO12
    // ==========================================================

    `GPIO_CELL u_gpio_pad12 (
        .I   (gpio_pad_block_out[12]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[12]),
        .PAD (gpio_pad_out12),
        .C   (gpio_pad_block_in[12]),
        .PE  (gpio_pull_en[12]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO13
    // ==========================================================

    `GPIO_CELL u_gpio_pad13 (
        .I   (gpio_pad_block_out[13]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[13]),
        .PAD (gpio_pad_out13),
        .C   (gpio_pad_block_in[13]),
        .PE  (gpio_pull_en[13]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO14
    // ==========================================================

    `GPIO_CELL u_gpio_pad14 (
        .I   (gpio_pad_block_out[14]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[14]),
        .PAD (gpio_pad_out14),
        .C   (gpio_pad_block_in[14]),
        .PE  (gpio_pull_en[14]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO15
    // ==========================================================

    `GPIO_CELL u_gpio_pad15 (
        .I   (gpio_pad_block_out[15]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[15]),
        .PAD (gpio_pad_out15),
        .C   (gpio_pad_block_in[15]),
        .PE  (gpio_pull_en[15]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO16
    // ==========================================================

    `GPIO_CELL u_gpio_pad16 (
        .I   (gpio_pad_block_out[16]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[16]),
        .PAD (gpio_pad_out16),
        .C   (gpio_pad_block_in[16]),
        .PE  (gpio_pull_en[16]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO17
    // ==========================================================

    `GPIO_CELL u_gpio_pad17 (
        .I   (gpio_pad_block_out[17]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[17]),
        .PAD (gpio_pad_out17),
        .C   (gpio_pad_block_in[17]),
        .PE  (gpio_pull_en[17]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO18
    // ==========================================================

    `GPIO_CELL u_gpio_pad18 (
        .I   (gpio_pad_block_out[18]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[18]),
        .PAD (gpio_pad_out18),
        .C   (gpio_pad_block_in[18]),
        .PE  (gpio_pull_en[18]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO19
    // ==========================================================

    `GPIO_CELL u_gpio_pad19 (
        .I   (gpio_pad_block_out[19]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[19]),
        .PAD (gpio_pad_out19),
        .C   (gpio_pad_block_in[19]),
        .PE  (gpio_pull_en[19]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO20
    // ==========================================================

    `GPIO_CELL u_gpio_pad20 (
        .I   (gpio_pad_block_out[20]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[20]),
        .PAD (gpio_pad_out20),
        .C   (gpio_pad_block_in[20]),
        .PE  (gpio_pull_en[20]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO21
    // ==========================================================

    `GPIO_CELL u_gpio_pad21 (
        .I   (gpio_pad_block_out[21]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[21]),
        .PAD (gpio_pad_out21),
        .C   (gpio_pad_block_in[21]),
        .PE  (gpio_pull_en[21]),
        .IE  (1'b1)
    );

    // ==========================================================
    // GPIO22
    // ==========================================================

    `GPIO_CELL u_gpio_pad22 (
        .I   (gpio_pad_block_out[22]),
        .DS  (1'b0),
        .OEN (~gpio_pad_block_dir[22]),
        .PAD (gpio_pad_out22),
        .C   (gpio_pad_block_in[22]),
        .PE  (gpio_pull_en[22]),
        .IE  (1'b1)
    );

endmodule
