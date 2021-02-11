`default_nettype none

module fabs
    ( input wire [31:0] x,
      output wire [31:0] y
);
    assign y = {0, x[30:0]};

endmodule

`default_nettype wire