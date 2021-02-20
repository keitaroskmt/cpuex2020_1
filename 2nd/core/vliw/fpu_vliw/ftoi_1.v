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

    wire [32:0] y1;
    wire [32:0] y2;

    reg s_reg;
    reg [7:0] e_reg;

    reg [32:0] y1_reg;
    reg [32:0] y2_reg;

    assign s = x[31];
    assign e = x[30:23];
    assign m = x[22:0];

    ftoi_1st u1(e, m, y1, y2);
    ftoi_2nd u2(s_reg, e_reg, y1_reg, y2_reg, y);

    always @(posedge clk) begin
        s_reg <= s;
        e_reg <= e;
        y1_reg <= y1;
        y2_reg <= y2;
    end

endmodule


module ftoi_1st
    (input wire [7:0] e,
     input wire [22:0] m,
     output wire [32:0] y1,
     output wire [32:0] y2);

    assign y1 = {1'b1, m, 1'b0} << (e - 150);
    assign y2 = ({1'b1, m, 1'b0} >> (150 - e)) + 1;
endmodule

module ftoi_2nd
    (input wire s,
     input wire [7:0] e,
     input wire [32:0] y1,
     input wire [32:0] y2,
     output wire [31:0] y);

    wire [31:0] y3;

    assign y3 = (e >= 150 && s) ? (~y1[31:1]) + 1 :
                (e >= 150) ? y1[31:1] :
                (s) ? (~y2[31:1]) + 1 : y2[31:1];
    assign y = {s, y3};
endmodule



`default_nettype wire