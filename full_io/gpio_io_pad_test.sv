module gpio_io_pad (
    input  logic [22:0] gpio_pad_dir,
    output logic [22:0] gpio_pad_in,
    input  logic [22:0] gpio_pad_out,
    input  logic [22:0] gpio_pull_en,
    inout  wire  GPIO1
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

endmodule

