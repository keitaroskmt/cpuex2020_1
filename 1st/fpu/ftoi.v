`default_nettype none

module ftoi
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

    ftoi_1st u2(s, e, m, y_wire);

    always @(posedge clk) begin
        y <= y_wire;
    end

endmodule


module ftoi_1st
    (input wire s,
     input wire [7:0] e,
     input wire [22:0] m,
     output wire [31:0] y);

    wire [32:0] y1;
    wire [32:0] y2;

    assign y1 = (e >= 150) ? {1'b1, m, 1'b0} << (e - 150) : {1'b1, m, 1'b0} >> (150 - e);
    assign y2 = y1 + 1;
    assign y = (e >= 150) ? y1[32:1] : y2[32:1];
endmodule



`default_nettype wire