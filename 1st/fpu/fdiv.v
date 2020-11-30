`default_nettype none

module fdiv
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output reg [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);
    wire [31:0] x2_inv;
    wire [31:0] y_wire;
    reg [31:0] x1_reg_1;
    reg [31:0] x1_reg_2;

    finv u1(x2, x2_inv, clk, rstn);
    fmul u2(x1_reg_2, x2_inv, y_wire, ovf, clk, rstn);


    always @(posedge clk) begin
        x1_reg_1 <= x1;
        x1_reg_2 <= x1_reg_1;
        y <= y_wire;
    end

endmodule

`default_nettype wire