`default_nettype none

module fdiv
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output reg [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);
    wire [7:0] xe1;
    wire [7:0] xe2;
    wire [31:0] x1_;
    wire [31:0] x2_;
    wire [31:0] x2_inv;
    wire [31:0] y_wire;
    reg [31:0] x1_reg_1;
    reg [31:0] x1_reg_2;

    assign xe1 = (x1[30:23] > 120 && x2[30:23] > 252) ? x1[30:23] - 3 : x1[30:23];
    assign xe2 = (x1[30:23] > 120 && x2[30:23] > 252) ? x2[30:23] - 3 : x2[30:23];
    assign x1_ = {x1[31], xe1, x1[22:0]};
    assign x2_ = {x2[31], xe2, x2[22:0]};

    finv u1(x2_, x2_inv, clk, rstn);
    fmul u2(x1_reg_2, x2_inv, y_wire, ovf, clk, rstn);


    always @(posedge clk) begin
        x1_reg_1 <= x1_;
        x1_reg_2 <= x1_reg_1;
        y <= y_wire;
    end

endmodule

`default_nettype wire