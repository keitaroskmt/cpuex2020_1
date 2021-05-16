`default_nettype none

module fsub
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output wire [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);
    wire s1;
    wire s2;
    wire [24:0] ms;
    wire [7:0] es;
    wire [24:0] mi;
    wire [4:0] de;
    wire sy;
    wire [55:0] mie;

    wire [26:0] myd;
    wire [26:0] mye;
    wire [4:0] se;

    reg s1_reg;
    reg s2_reg;
    reg [24:0] ms_reg;
    reg [7:0] es_reg;
    reg [7:0] es_reg2;
    reg [24:0] mi_reg;
    reg [4:0] de_reg;
    reg sy_reg;
    reg sy_reg2;
    reg [55:0] mie_reg;

    reg [26:0] myd_reg;
    reg [26:0] mye_reg;
    reg [4:0] se_reg;

    wire [31:0] x2_;
    assign x2_ = {~x2[31], x2[30:0]};

    assign ovf = 0;
    fsub_1st u1(x1, x2_, s1, s2, ms, es, mi, de, sy, mie);
    fsub_2nd u2(s1_reg, s2_reg, es_reg, ms_reg, mi_reg, mie_reg, de_reg, myd, mye, se);
    fsub_3rd u3(es_reg2, myd_reg, mye_reg, se_reg, sy_reg2, y);

    always @(posedge clk) begin
        s1_reg <= s1;
        s2_reg <= s2;
        ms_reg <= ms;
        es_reg <= es;
        es_reg2 <= es_reg;
        sy_reg <= sy;
        sy_reg2 <= sy_reg;
        mi_reg <= mi;
        de_reg <= de;
        mie_reg <= mie;

        myd_reg <= myd;
        mye_reg <= mye;
        se_reg <= se;
    end

endmodule

module fsub_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire s1,
    output wire s2,
    output wire [24:0] ms,
    output wire [7:0] es,
    output wire [24:0]mi,
    output wire [4:0]de,
    output wire sy,
    output wire [55:0] mie
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

    wire [7:0] e1;
    wire [7:0] e2;
    wire [22:0] m1;
    wire [22:0] m2;

    assign s1 = x1[31];
    assign s2 = x2[31];
    assign e1 = x1[30:23];
    assign e2 = x2[30:23];
    assign m1 = x1[22:0];
    assign m2 = x2[22:0];
    assign m1a = (e1 == 8'b0) ? {25'b0} : {2'b01, m1};
    assign m2a = (e2 == 8'b0) ? {25'b0} : {2'b01, m2};
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
    assign sy = (sel == 0) ? s1 : s2;
    assign mie = {mi, 31'b0};
endmodule

module fsub_2nd
(
    input wire s1,
    input wire s2,
    input wire [7:0] es,
    input wire [24:0] ms,
    input wire [24:0] mi,
    input wire [55:0] mie,
    input wire [4:0] de,
    output wire [26:0] myd,
    output wire [26:0] mye,
    output wire [4:0] se
);
    wire [55:0] mia;

    assign mia = mie>>de;
    assign mye = (s1 == s2) ? {ms, 2'b0} + mia[55:29] : {ms, 2'b0} - mia[55:29];
    assign myd = (mye[26] == 1) ? ((es == 8'd254) ? {2'b01,25'b0} : mye>>1) : mye;
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

module fsub_3rd
(
    input wire [7:0] es,
    input wire [26:0] myd,
    input wire [26:0] mye,
    input wire [4:0] se,
    input wire sy,
    output wire [31:0] y
);
    wire [7:0] esi;
    wire [7:0] eyd;
    wire [8:0] eyf;
    wire [26:0] myf;
    wire [7:0] ey;
    wire [22:0] my;

    assign esi = es + 1;
    assign eyd = (mye[26] == 1) ? esi : es;

    assign eyf = {1'b0, eyd} - {4'b0, se};
    assign myf = ({1'b0, eyd} > {4'b0, se}) ? myd<<se : myd<<(eyd[4:0] - 1);
    assign my = myf[24:2];
    assign ey = (myf[25:2] == 24'b0) ? 8'b0 :
                ({1'b0, eyd} > {4'b0, se}) ? eyf[7:0] : 8'b0;
    assign y = {sy,ey,my};

endmodule

`default_nettype wire