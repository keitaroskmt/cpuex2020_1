`default_nettype none

module fmul
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output reg [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);

    assign ovf = 0;

    wire [31:0] y_wire;

    fmul_1st u1(x1, x2, y_wire);

    always @(posedge clk) begin
        y <= y_wire;
    end

endmodule

module fmul_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire [31:0] y
);
    wire [8:0] e1a;
    wire [8:0] e2a;
    wire [23:0] m1a;
    wire [23:0] m2a;
    wire [11:0] m1a_h;
    wire [11:0] m1a_l;
    wire [11:0] m2a_h;
    wire [11:0] m2a_l;
    wire [23:0] m1ahm2ah;
    wire [23:0] m1ahm2al;
    wire [23:0] m1alm2ah;
    wire [23:0] m1alm2al;

    wire s1;
    wire s2;
    wire [7:0] e1;
    wire [7:0] e2;
    wire [22:0] m1;
    wire [22:0] m2;
    wire s;
    wire [8:0] ea;
    wire [47:0] m1am2a;

    wire inf;
    wire [22:0] m;
    wire [7:0] e;
    wire [7:0] shift_e;
    wire zero;
    wire subnormal;
    wire [23:0] subnormal_m;
    wire [22:0] shifted_m;

    // x1が正規化数なのは仮定して良い
    // x2は非正規化数の場合があるその場合、23bit目か22bit目のどちらかが必ず立っている
    assign s1 = x1[31];
    assign s2 = x2[31];
    assign e1 = x1[30:23];
    assign e2 = x2[30:23];
    assign m1 = x1[22:0];
    assign m2 = x2[22:0];

    assign e1a = (e1 == 8'b0) ? 8'b1 : e1;
    assign e2a = (e2 == 8'b0) ? 8'b1 : e2;
    assign m1a = (e1 == 8'b0) ? {1'b0, m1} : {1'b1, m1};
    assign m2a = (e2 == 8'b0) ? {1'b0, m2} : {1'b1, m2};

    assign s = s1 ^ s2;

    assign m1a_h = m1a[23:12];
    assign m1a_l = m1a[11:0];
    assign m2a_h = m2a[23:12];
    assign m2a_l = m2a[11:0];

    assign m1ahm2ah = m1a_h * m2a_h;
    assign m1ahm2al = m1a_h * m2a_l;
    assign m1alm2ah = m1a_l * m2a_h;
    assign m1alm2al = m1a_l * m2a_l;

    assign m1am2a = (m1ahm2ah << 24) + (m1ahm2al << 12) + (m1alm2ah << 12) + m1alm2al;

    assign ea = (m1am2a[47] == 1) ? e1a + e2a + 1 : e1a + e2a; // 127以下ならアンダーフロー(0にする) 384以上でオーバーフロー(∞にする)
    assign m = (m1am2a[47] == 1) ? m1am2a[46:24] : m1am2a[45:23]; // 正規化数なら47bit目は絶対立ってる
    assign e = ea - 9'd127;
    assign subnormal = (ea < 9'd128) ? 1 : 0;
    assign inf = (ea > 9'd381) ? 1 : 0;  //または、eb=382かつm1a*m2aの48bit目が立ってる
    assign shift_e = 128 - ea;
    assign zero = (e1 == 8'b0 | e2 == 8'b0) ? 1 : 0;
    assign subnormal_m = {1'b1, m} >> shift_e;
    assign shifted_m = subnormal_m[22:0];

    assign y = (zero == 1) ? {s, 8'b0, 23'b0} :
               (subnormal == 1) ? {s, 8'b0, shifted_m} :
               (inf == 1) ? {s, 8'b11111111, 23'b0} : {s, e, m};

endmodule

`default_nettype wire