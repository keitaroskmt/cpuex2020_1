`default_nettype none

module floor
    ( input wire [31:0] x,
      output reg [31:0] y,
      input wire clk,
      input wire rstn
);

    wire [31:0] y_wire;
    wire s;
    wire [7:0] e;
    wire [22:0] m;

    assign s = x[31];
    assign e = x[30:23];
    assign m = x[22:0];

    floor_1st u2(s, e, m, y_wire);

    always @(posedge clk) begin
        y <= y_wire;
    end

endmodule


module floor_1st
    (input wire s,
     input wire [7:0] e,
     input wire [22:0] m,
     output wire [31:0] y);

    wire [22:0] m1;

    assign m1 = (e >= 150) ? m : (m >> (150 - e)) << (150 - e);
    assign y = (e >= 127) ? {s,e,m1} : 31'b0;
endmodule



`default_nettype wire