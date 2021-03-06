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

    wire s1;
    wire s2;
    wire [7:0] e1;
    wire [7:0] e2;
    wire [22:0] m1;
    wire [22:0] m2;
    wire s;
    wire [8:0] ea;
    wire [8:0] eb;
    wire [47:0] m1am2a;
    wire [31:0] y_wire;

    reg reg_s1;
    reg reg_s2;
    reg [7:0] reg_e1;
    reg [7:0] reg_e2;
    reg [22:0] reg_m1;
    reg [22:0] reg_m2;
    reg reg_s;
    reg [8:0] reg_ea;
    reg [8:0] reg_eb;
    reg [47:0] reg_m1am2a;

    fmul_1st u1(x1, x2, s1, s2, e1, e2, m1, m2, s, ea, eb, m1am2a);
    fmul_2nd u2(reg_s1, reg_s2, reg_e1, reg_e2, reg_m1, reg_m2, reg_s, reg_ea, reg_eb, reg_m1am2a, y_wire);

    always @(posedge clk) begin
        reg_s1 <= s1;
        reg_s2 <= s2;
        reg_e1 <= e1;
        reg_e2 <= e2;
        reg_m1 <= m1;
        reg_m2 <= m2;
        reg_s <= s;
        reg_ea <= ea;
        reg_eb <= eb;
        reg_m1am2a <= m1am2a;
        y <= y_wire;
    end

endmodule

module fmul_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire s1,
    output wire s2,
    output wire [7:0] e1,
    output wire [7:0] e2,
    output wire [22:0] m1,
    output wire [22:0] m2,
    output wire s,
    output wire [8:0] ea,
    output wire [8:0] eb,
    output wire [47:0] m1am2a
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
    assign ea = {1'b0, e1a} + {1'b0, e2a}; // 127以下ならアンダーフロー(0にする) 384以上でオーバーフロー(∞にする)
    assign eb = ea + 9'b1;

    assign m1a_h = m1a[23:12];
    assign m1a_l = m1a[11:0];
    assign m2a_h = m2a[23:12];
    assign m2a_l = m2a[11:0];

    assign m1ahm2ah = m1a_h * m2a_h;
    assign m1ahm2al = m1a_h * m2a_l;
    assign m1alm2ah = m1a_l * m2a_h;
    assign m1alm2al = m1a_l * m2a_l;

    assign m1am2a = (m1ahm2ah << 24) + (m1ahm2al << 12) + (m1alm2ah << 12) + m1alm2al;

endmodule

module fmul_2nd
(
    input wire s1,
    input wire s2,
    input wire [7:0] e1,
    input wire [7:0] e2,
    input wire [22:0] m1,
    input wire [22:0] m2,
    input wire s,
    input wire [8:0] ea,
    input wire [8:0] eb,
    input wire [47:0] m1am2a,
    output wire [31:0] y
);


    wire inf;
    wire [22:0] m;
    wire [7:0] e;
    wire [8:0] ec;
    wire [8:0] ed;
    wire [8:0] e_9;
    wire [7:0] shift_e;
    wire zero;
    wire subnormal;
    wire [23:0] subnormal_m;
    wire [22:0] shifted_m;

    assign ec = ea - 1;
    assign ed = ea - 2;
    // eb:48bit ea:47bit ec:46bit ed:45bit用

    assign m = (m1am2a[47] == 1) ? m1am2a[46:24] :
               (m1am2a[46] == 1) ? m1am2a[45:23] :
               (m1am2a[45] == 1) ? m1am2a[44:22] : m1am2a[43:21]; // 正規化数なら47bit目は絶対立ってる

    assign e_9 = (m1am2a[47] == 1) ? eb :
                 (m1am2a[46] == 1) ? ea :
                 (m1am2a[45] == 1) ? ec : ed;

    assign e = e_9 - 9'd127;

    assign subnormal = (eb < 9'd128 & e_9 == eb) ? 1'b1 :
                       (ea < 9'd128 & e_9 == ea) ? 1'b1 :
                       (ec < 9'd128 & e_9 == ec) ? 1'b1 :
                       (ed < 9'd128 & e_9 == ed) ? 1'b1 : 0;

    assign inf = (eb > 9'd381 & e_9 == eb) ? 1'b1 :
                 (ea > 9'd381 & e_9 == ea) ? 1'b1 :
                 (ec > 9'd381 & e_9 == ec) ? 1'b1 :
                 (ed > 9'd381 & e_9 == ed) ? 1'b1 : 0; //または、eb=382かつm1a*m2aの48bit目が立ってる

    assign shift_e = (subnormal == 1 & eb < 9'd128 & e_9 == eb) ? 8'd128 - eb :
                     (subnormal == 1 & ea < 9'd128 & e_9 == ea) ? 8'd128 - ea :
                     (subnormal == 1 & ec < 9'd128 & e_9 == ec) ? 8'd128 - ec :
                     (subnormal == 1 & ed < 9'd128 & e_9 == ed) ? 8'd128 - ed : 0;

    assign zero = (e1 == 8'b0) ? 1 :
                  (e2 == 8'b0 & m2[22:21] == 2'b0) ? 1 : 0;

    assign subnormal_m = {1'b1, m} >> shift_e;
    assign shifted_m = subnormal_m[22:0];

    assign y = (zero == 1) ? {s, 8'b0, 23'b0} :
               (subnormal == 1) ? {s, 8'b0, shifted_m} :
               (inf == 1) ? {s, 8'b11111111, 23'b0} : {s, e, m};

endmodule


`default_nettype wire