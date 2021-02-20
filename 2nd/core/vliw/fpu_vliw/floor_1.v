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

    wire [23:0] m2;
    wire [22:0] m3;
    wire [7:0] e1;

    reg s_reg;
    reg [7:0] e_reg;

    reg [23:0] m2_reg;
    reg [22:0] m3_reg;
    reg [7:0] e1_reg;

    assign s = x[31];
    assign e = x[30:23];
    assign m = x[22:0];

    floor_1st u1(s, e, m, m2, m3, e1);
    floor_2nd u2(s_reg, e_reg, m2_reg, m3_reg, e1_reg, y);

    always @(posedge clk) begin
        s_reg <= s;
        e_reg <= e;
        m2_reg <= m2;
        m3_reg <= m3;
        e1_reg <= e1;
    end


endmodule


module floor_1st
    (input wire s,
     input wire [7:0] e,
     input wire [22:0] m,
     output wire [23:0] m2,
     output wire [22:0] m3,
     output wire [7:0] e1);

    assign m3 = (m >> (150 - e)) << (150 - e);
    assign m2 = (s && e < 150 && m != m3) ? m + (1 << (150 - e)) : m;
    assign e1 = e + 1;
endmodule

module floor_2nd
    (input wire s,
     input wire [7:0] e,
     input wire [23:0] m2,
     input wire [22:0] m3,
     input wire [7:0] e1,
     output wire [31:0] y);

    wire [22:0] m1;

    assign m1 = (e >= 150) ? m2 : (m2 >> (150 - e)) << (150 - e);
    assign y = (e >= 127 && s && m2[23]) ? {s, e1, 23'b0} :
               (e >= 127) ? {s,e,m1} :
               (s && e > 0) ? {1'b1, 8'd127, 23'd0} :  31'b0;
endmodule



`default_nettype wire