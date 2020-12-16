`default_nettype none

module fadd
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output reg [31:0] y,
      output reg ovf,
      input wire clk,
      input wire rstn
);
    wire s1;
    wire s2;
    wire [7:0] e1;
    wire [7:0] e2;
    wire [22:0] m1;
    wire [22:0] m2;
    wire [4:0] de;
    wire [24:0] ms;
    wire [24:0] mi;
    wire [7:0] es;
    wire ss;
    wire [26:0] mye;
    wire [7:0] esi;
    wire stck;
    wire [7:0] eyd;
    wire [26:0] myd;
    wire [4:0] se;
    wire [31:0] y_wire;
    wire ovf_wire;

    reg reg_s1_1;
    reg reg_s1_2;
    reg reg_s2_1;
    reg reg_s2_2;
    reg [7:0] reg_e1_1;
    reg [7:0] reg_e1_2;
    reg [7:0] reg_e2_1;
    reg [7:0] reg_e2_2;
    reg [22:0] reg_m1_1;
    reg [22:0] reg_m1_2;
    reg [22:0] reg_m2_1;
    reg [22:0] reg_m2_2;
    reg [4:0] reg_de;
    reg [24:0] reg_ms;
    reg [24:0] reg_mi;
    reg [7:0] reg_es;
    reg reg_ss_1;
    reg reg_ss_2;
    reg [26:0] reg_mye;
    reg [7:0] reg_esi;
    reg reg_stck;
    reg [7:0] reg_eyd;
    reg [26:0] reg_myd;
    reg [4:0] reg_se;

    fadd_1st u1(x1, x2, s1, s2, e1, e2, m1, m2, de, ms, mi, es, ss);
    fadd_2nd u2(reg_s1_1, reg_s2_1, reg_de, reg_ms, reg_mi, reg_es, mye, esi, stck, eyd, myd, se);
    fadd_3rd u3(reg_s1_2, reg_s2_2, reg_e1_2, reg_e2_2, reg_m1_2, reg_m2_2, reg_ss_2, reg_mye, reg_esi, reg_stck, reg_eyd, reg_myd, reg_se, y_wire, ovf_wire);

    always @(posedge clk) begin
        reg_s1_2 <= reg_s1_1;
        reg_s1_1 <= s1;
        reg_s2_2 <= reg_s2_1;
        reg_s2_1 <= s2;
        reg_e1_2 <= reg_e1_1;
        reg_e1_1 <= e1;
        reg_e2_2 <= reg_e2_1;
        reg_e2_1 <= e2;
        reg_m1_2 <= reg_m1_1;
        reg_m1_1 <= m1;
        reg_m2_2 <= reg_m2_1;
        reg_m2_1 <= m2;
        reg_de <= de;
        reg_ms <= ms;
        reg_mi <= mi;
        reg_es <= es;
        reg_ss_2 <= reg_ss_1;
        reg_ss_1 <= ss;
        reg_mye <= mye;
        reg_esi <= esi;
        reg_stck <= stck;
        reg_eyd <= eyd;
        reg_myd <= myd;
        reg_se <= se;
        y <= y_wire;
        ovf <= ovf_wire;
    end

endmodule

module fadd_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire s1,
    output wire s2,
    output wire [7:0] e1,
    output wire [7:0] e2,
    output wire [22:0] m1,
    output wire [22:0] m2,
    output wire [4:0] de,
    output wire [24:0] ms,
    output wire [24:0] mi,
    output wire [7:0] es,
    output wire ss
);

    wire [7:0] e1a;
    wire [7:0] e2a;
    wire [24:0] m1a;
    wire [24:0] m2a;
    wire [7:0] e2ai;
    wire [8:0] te;
    wire [8:0] te2;
    wire [8:0] te3;
    wire ce;
    wire [7:0] tde;
    wire sel;
    wire [7:0] ei;

    assign s1 = x1[31];
    assign s2 = x2[31];
    assign e1 = x1[30:23];
    assign e2 = x2[30:23];
    assign m1 = x1[22:0];
    assign m2 = x2[22:0];
    assign m1a = (e1 == 8'b0) ? {2'b0, m1} : {2'b01, m1};
    assign m2a = (e2 == 8'b0) ? {2'b0, m2} : {2'b01, m2};
    assign e1a = (e1 == 8'b0) ? 8'b1 : e1;
    assign e2a = (e2 == 8'b0) ? 8'b1 : e2;
    assign e2ai = ~e2a;
    assign te = {1'b0, e1a} + {1'b0, e2ai};
    assign ce = (te[8] == 1) ? 0 : 1;
    assign te2 = te + 9'b1;
    assign te3 = ~te;
    assign tde = (ce == 0) ? te2[7:0] : te3[7:0];
    assign de = (|(tde[7:5])) ? 5'd31 : tde[4:0];
    assign sel = (de == 0) ? ((m1a > m2a) ? 0 : 1) : ce;
    assign ms = (sel == 0) ? m1a : m2a;
    assign mi = (sel == 0) ? m2a : m1a;
    assign es = (sel == 0) ? e1a : e2a;
    assign ei = (sel == 0) ? e2a : e1a;
    assign ss = (sel == 0) ? s1 : s2;

endmodule

module fadd_2nd
(
    input wire s1,
    input wire s2,
    input wire [4:0] de,
    input wire [24:0] ms,
    input wire [24:0] mi,
    input wire [7:0] es,
    output wire [26:0] mye,
    output wire [7:0] esi,
    output wire stck,
    output wire [7:0] eyd,
    output wire [26:0] myd,
    output wire [4:0] se
);

    wire [55:0] mie;
    wire [55:0] mia;
    wire tstck;

    assign mie = {mi, 31'b0};
    assign mia = mie>>de;
    assign tstck = |(mia[28:0]);
    assign mye = (s1 == s2) ? {ms, 2'b0} + mia[55:29] : {ms, 2'b0} - mia[55:29];
    assign esi = es + 1;
    assign eyd = (mye[26] == 1) ? esi : es;
    assign myd = (mye[26] == 1) ? ((esi === 8'd255) ? {2'b01,25'b0} : mye>>1) : mye;
    assign stck = (mye[26] == 1) ? ((esi == 8'd255) ? 0 : tstck | mye[0]) : tstck;
    assign se = (myd[25]) ? 5'd0 :
                (myd[24]) ? 5'd1 :
                (myd[23]) ? 5'd2 :
                (myd[22]) ? 5'd3 :
                (myd[21]) ? 5'd4 :
                (myd[20]) ? 5'd5 :
                (myd[19]) ? 5'd6 :
                (myd[18]) ? 5'd7 :
                (myd[17]) ? 5'd8 :
                (myd[16]) ? 5'd9 :
                (myd[15]) ? 5'd10 :
                (myd[14]) ? 5'd11 :
                (myd[13]) ? 5'd12 :
                (myd[12]) ? 5'd13 :
                (myd[11]) ? 5'd14 :
                (myd[10]) ? 5'd15 :
                (myd[9])  ? 5'd16 :
                (myd[8])  ? 5'd17 :
                (myd[7])  ? 5'd18 :
                (myd[6])  ? 5'd19 :
                (myd[5])  ? 5'd20 :
                (myd[4])  ? 5'd21 :
                (myd[3])  ? 5'd22 :
                (myd[2])  ? 5'd23 :
                (myd[1])  ? 5'd24 :
                (myd[0])  ? 5'd25 : 5'd26;


endmodule

module fadd_3rd
(
    input wire s1,
    input wire s2,
    input wire [7:0] e1,
    input wire [7:0] e2,
    input wire [22:0] m1,
    input wire [22:0] m2,
    input wire ss,
    input wire [26:0] mye,
    input wire [7:0] esi,
    input wire stck,
    input wire [7:0] eyd,
    input wire [26:0] myd,
    input wire [4:0] se,
    output wire [31:0] y,
    output wire ovf
);

    wire [8:0] eyf;
    wire [7:0] eyr;
    wire [26:0] myf;
    wire [24:0] myr;
    wire [7:0] eyri;
    wire [7:0] ey;
    wire [22:0] my;
    wire sy;
    wire nzm1;
    wire nzm2;


    assign eyf = {1'b0, eyd} - {4'b0, se};
    assign eyr = ({1'b0, eyd} > {4'b0, se}) ? eyf[7:0] : 8'b0;
    assign myf = ({1'b0, eyd} > {4'b0, se}) ? myd<<se : myd<<(eyd[4:0] - 1);
    assign myr = (myf[1] == 1 & myf[0] == 0 & stck == 0 & myf[2] == 1) ? myf[26:2] + 25'b1 :
                 (myf[1] == 1 & myf[0] == 0 & s1 == s2 & stck == 1)    ? myf[26:2] + 25'b1 :
                 (myf[1] == 1 & myf[0] == 1)                           ? myf[26:2] + 25'b1 : myf[26:2];
    assign eyri = eyr + 8'b1;
    assign ey = (myr[24] == 1) ? eyri :
                (myr[23:0] == 24'b0) ? 8'b0 : eyr;
    assign my = (myr[24] == 1) ? 23'b0 : myr[22:0];
    assign sy = (ey == 8'b0 & my == 23'b0) ? s1 & s2 : ss;
    assign nzm1 = |(m1[22:0]);
    assign nzm2 =  |(m2[22:0]);
    assign y = (e1 == 8'd255 & ~(e2 == 8'd255)) ? {s1,8'd255,nzm1,m1[21:0]} :
               (~(e1 == 8'd255) & e2 == 8'd255) ? {s2,8'd255,nzm2,m2[21:0]} :
               (e1 == 8'd255 & e2 == 8'd255 & nzm2) ? {s2,8'd255,1'b1,m2[21:0]} :
               (e1 == 8'd255 & e2 == 8'd255 & nzm1) ? {s1,8'd255,1'b1,m1[21:0]} :
               (e1 == 8'd255 & e2 == 8'd255 & s1 == s2) ? {s1,8'd255,23'b0} :
               (e1 == 8'd255 & e2 == 8'd255) ? {1'b1,8'd255,1'b1,22'b0} : {sy,ey,my};
    assign ovf = (~(e1 == 8'd255) & ~(e2 == 8'd255) & (myr[24] == 1) & (eyri == 8'd255)) ? 1 :
                 (~(e1 == 8'd255) & ~(e2 == 8'd255) & (mye[26] == 1) & (esi == 8'd255)) ? 1 : 0;

endmodule

`default_nettype wire