`default_nettype none

module fmul
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output wire [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);
    wire [23:0] m1ahm2ah;
    wire [23:0] m1ahm2al;
    wire [23:0] m1alm2ah;
    wire [23:0] m1alm2al;
    wire [8:0] e1a;
    wire [8:0] e2a;
    wire [7:0] e1;
    wire [7:0] e2;
    wire s;

    reg [23:0] m1ahm2ah_reg;
    reg [23:0] m1ahm2al_reg;
    reg [23:0] m1alm2ah_reg;
    reg [23:0] m1alm2al_reg;
    reg [8:0] e1a_reg;
    reg [8:0] e2a_reg;
    reg [7:0] e1_reg;
    reg [7:0] e2_reg;
    reg s_reg;

    assign ovf = 0;

    fmul_1st u1(x1, x2, m1ahm2ah, m1ahm2al, m1alm2ah, m1alm2al, e1a, e2a, e1, e2, s);
    fmul_2nd u2(m1ahm2ah_reg, m1ahm2al_reg, m1alm2ah_reg, m1alm2al_reg, e1a_reg, e2a_reg, e1_reg, e2_reg, s_reg, y);

    always @(posedge clk) begin
        m1ahm2ah_reg <= m1ahm2ah;
        m1ahm2al_reg <= m1ahm2al;
        m1alm2ah_reg <= m1alm2ah;
        m1alm2al_reg <= m1alm2al;
        e1a_reg <= e1a;
        e2a_reg <= e2a;
        e1_reg <= e1;
        e2_reg <= e2;
        s_reg <= s;
    end

endmodule

module fmul_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire [23:0] m1ahm2ah,
    output wire [23:0] m1ahm2al,
    output wire [23:0] m1alm2ah,
    output wire [23:0] m1alm2al,
    output wire [8:0] e1a,
    output wire [8:0] e2a,
    output wire [7:0] e1,
    output wire [7:0] e2,
    output wire s
);
    wire [23:0] m1a;
    wire [23:0] m2a;
    wire [11:0] m1a_h;
    wire [11:0] m1a_l;
    wire [11:0] m2a_h;
    wire [11:0] m2a_l;

    wire s1;
    wire s2;
    wire [22:0] m1;
    wire [22:0] m2;

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

endmodule


module fmul_2nd
(
    input wire [23:0] m1ahm2ah,
    input wire [23:0] m1ahm2al,
    input wire [23:0] m1alm2ah,
    input wire [23:0] m1alm2al,
    input wire [8:0] e1a,
    input wire [8:0] e2a,
    input wire [7:0] e1,
    input wire [7:0] e2,
    input wire s,
    output wire [31:0] y
);
    wire [47:0] m1am2a;
    wire [8:0] ea;

    wire inf;
    wire [22:0] m;
    wire [7:0] e;
    wire [7:0] shift_e;
    wire zero;
    wire subnormal;
    wire [23:0] subnormal_m;
    wire [22:0] shifted_m;

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