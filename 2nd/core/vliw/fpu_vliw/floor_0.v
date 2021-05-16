`default_nettype none

module floor
    ( input wire [31:0] x,
      output wire [31:0] y,
      input wire clk,
      input wire rstn
);

    wire s;
    wire [7:0] e;
    wire [22:0] m;

    assign s = x[31];
    assign e = x[30:23];
    assign m = x[22:0];

    floor_1st u2(s, e, m, y);


endmodule


module floor_1st
    (input wire s,
     input wire [7:0] e,
     input wire [22:0] m,
     output wire [31:0] y);

    wire [22:0] m1;
    wire [23:0] m2;
    wire [22:0] m3;
    wire [7:0] e1;

    assign m3 = (m >> (150 - e)) << (150 - e);
    assign m2 = (s && e < 150 && m != m3) ? m + (1 << (150 - e)) : m;
    assign m1 = (e >= 150) ? m2 : (m2 >> (150 - e)) << (150 - e);
    assign e1 = e + 1;
    assign y = (e >= 127 && s && m2[23]) ? {s, e1, 23'b0} :
               (e >= 127) ? {s,e,m1} :
               (s && e > 0) ? {1'b1, 8'd127, 23'd0} :  31'b0;
endmodule



`default_nettype wire