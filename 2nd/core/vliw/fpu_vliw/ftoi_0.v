`default_nettype none

module ftoi
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

    ftoi_1st u2(s, e, m, y);

endmodule


module ftoi_1st
    (input wire s,
     input wire [7:0] e,
     input wire [22:0] m,
     output wire [31:0] y);

    wire [32:0] y1;
    wire [32:0] y2;
    wire [31:0] y3;

    assign y1 = {1'b1, m, 1'b0} << (e - 150);
    assign y2 = ({1'b1, m, 1'b0} >> (150 - e)) + 1;
    assign y3 = (e >= 150 && s) ? (~y1[31:1]) + 1 :
                (e >= 150) ? y1[31:1] :
                (s) ? (~y2[31:1]) + 1 : y2[31:1];
    assign y = {s, y3};
endmodule



`default_nettype wire