module gpio_io_pad (
    input  logic [22:0] gpio_pad_dir,
    output logic [22:0] gpio_pad_in,
    input  logic [22:0] gpio_pad_out,
    input  logic [22:0] gpio_pad_pull_en,
    inout  wire GPIO0,
    inout  wire GPIO1,
    inout  wire GPIO2,
    inout  wire GPIO3,
    inout  wire GPIO4,
    inout  wire GPIO5,
    inout  wire GPIO6,
    inout  wire GPIO7,
    inout  wire GPIO8,
    inout  wire GPIO9,
    inout  wire GPIO10,
    inout  wire GPIO11,
    inout  wire GPIO12,
    inout  wire GPIO13,
    inout  wire GPIO14,
    inout  wire GPIO15,
    inout  wire GPIO16,
    inout  wire GPIO17,
    inout  wire GPIO18,
    inout  wire GPIO19,
    inout  wire GPIO20,
    inout  wire GPIO21,
    inout  wire GPIO22
);

PRUW0408CDG u_gpio0 (
    .I (gpio_pad_out[0]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[0]),
    .PAD (GPIO0),
    .C (gpio_pad_in[0]),
    .PE (gpio_pull_en[0]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio1 (
    .I (gpio_pad_out[1]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[1]),
    .PAD (GPIO1),
    .C (gpio_pad_in[1]),
    .PE (gpio_pull_en[1]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio2 (
    .I (gpio_pad_out[2]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[2]),
    .PAD (GPIO2),
    .C (gpio_pad_in[2]),
    .PE (gpio_pull_en[2]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio3 (
    .I (gpio_pad_out[3]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[3]),
    .PAD (GPIO3),
    .C (gpio_pad_in[3]),
    .PE (gpio_pull_en[3]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio4 (
    .I (gpio_pad_out[4]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[4]),
    .PAD (GPIO4),
    .C (gpio_pad_in[4]),
    .PE (gpio_pull_en[4]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio5 (
    .I (gpio_pad_out[5]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[5]),
    .PAD (GPIO5),
    .C (gpio_pad_in[5]),
    .PE (gpio_pull_en[5]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio6 (
    .I (gpio_pad_out[6]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[6]),
    .PAD (GPIO6),
    .C (gpio_pad_in[6]),
    .PE (gpio_pull_en[6]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio7 (
    .I (gpio_pad_out[7]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[7]),
    .PAD (GPIO7),
    .C (gpio_pad_in[7]),
    .PE (gpio_pull_en[7]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio8 (
    .I (gpio_pad_out[8]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[8]),
    .PAD (GPIO8),
    .C (gpio_pad_in[8]),
    .PE (gpio_pull_en[8]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio9 (
    .I (gpio_pad_out[9]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[9]),
    .PAD (GPIO9),
    .C (gpio_pad_in[9]),
    .PE (gpio_pull_en[9]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio10 (
    .I (gpio_pad_out[10]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[10]),
    .PAD (GPIO10),
    .C (gpio_pad_in[10]),
    .PE (gpio_pull_en[10]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio11 (
    .I (gpio_pad_out[11]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[11]),
    .PAD (GPIO11),
    .C (gpio_pad_in[11]),
    .PE (gpio_pull_en[11]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio12 (
    .I (gpio_pad_out[12]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[12]),
    .PAD (GPIO12),
    .C (gpio_pad_in[12]),
    .PE (gpio_pull_en[12]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio13 (
    .I (gpio_pad_out[13]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[13]),
    .PAD (GPIO13),
    .C (gpio_pad_in[13]),
    .PE (gpio_pull_en[13]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio14 (
    .I (gpio_pad_out[14]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[14]),
    .PAD (GPIO14),
    .C (gpio_pad_in[14]),
    .PE (gpio_pull_en[14]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio15 (
    .I (gpio_pad_out[15]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[15]),
    .PAD (GPIO15),
    .C (gpio_pad_in[15]),
    .PE (gpio_pull_en[15]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio16 (
    .I (gpio_pad_out[16]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[16]),
    .PAD (GPIO16),
    .C (gpio_pad_in[16]),
    .PE (gpio_pull_en[16]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio17 (
    .I (gpio_pad_out[17]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[17]),
    .PAD (GPIO17),
    .C (gpio_pad_in[17]),
    .PE (gpio_pull_en[17]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio18 (
    .I (gpio_pad_out[18]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[18]),
    .PAD (GPIO18),
    .C (gpio_pad_in[18]),
    .PE (gpio_pull_en[18]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio19 (
    .I (gpio_pad_out[19]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[19]),
    .PAD (GPIO19),
    .C (gpio_pad_in[19]),
    .PE (gpio_pull_en[19]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio20 (
    .I (gpio_pad_out[20]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[20]),
    .PAD (GPIO20),
    .C (gpio_pad_in[20]),
    .PE (gpio_pull_en[20]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio21 (
    .I (gpio_pad_out[21]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[21]),
    .PAD (GPIO21),
    .C (gpio_pad_in[21]),
    .PE (gpio_pull_en[21]),
    .IE (1'b1)
);

PRDW0408CDG u_gpio22 (
    .I (gpio_pad_out[22]),
    .DS (1'b0),
    .OEN (~gpio_pad_dir[22]),
    .PAD (GPIO22),
    .C (gpio_pad_in[22]),
    .PE (gpio_pull_en[22]),
    .IE (1'b1)
);

endmodule

