`default_nettype none

module fsub
    ( input wire [31:0] x1,
      input wire [31:0] x2,
      output wire [31:0] y,
      output wire ovf,
      input wire clk,
      input wire rstn
);
    wire [31:0] x2_;

    wire [55:0] mia;
    wire s1;
    wire s2;
    wire [24:0] ms;
    wire [7:0] es;
    wire sy;

    reg [55:0] mia_reg;
    reg s1_reg;
    reg s2_reg;
    reg [24:0] ms_reg;
    reg [7:0] es_reg;
    reg sy_reg;

    assign ovf = 0;
    assign x2_ = {~x2[31], x2[30:0]};

    fsub_1st u1(x1, x2_, mia, s1, s2, ms, es, sy);
    fsub_2nd u2(mia_reg, s1_reg, s2_reg, ms_reg, es_reg, sy_reg, y);

    always @(posedge clk) begin
        mia_reg <= mia;
        s1_reg <= s1;
        s2_reg <= s2;
        ms_reg <= ms;
        es_reg <= es;
        sy_reg <= sy;
    end

endmodule

module fsub_1st
(
    input wire [31:0] x1,
    input wire [31:0] x2,
    output wire [55:0] mia,
    output wire s1,
    output wire s2,
    output wire [24:0] ms,
    output wire [7:0] es,
    output wire sy
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

    wire [7:0] e1;
    wire [7:0] e2;
    wire [22:0] m1;
    wire [22:0] m2;

    wire [24:0] mi;
    wire [4:0] de;

    wire [55:0] mie;

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
    assign ei = (sel == 0) ? e2a : e1a;
    assign sy = (sel == 0) ? s1 : s2;

    assign mie = {mi, 31'b0};
    assign mia = mie>>de;


endmodule


module fsub_2nd
(
    input wire [55:0] mia,
    input wire s1,
    input wire s2,
    input wire [24:0] ms,
    input wire [7:0] es,
    input wire sy,
    output wire [31:0] y
);

    wire [26:0] mye;
    wire [7:0] esi;
    wire [7:0] eyd;
    wire [26:0] myd;

    wire [4:0] se;

    wire [8:0] eyf;
    wire [26:0] myf;
    wire [7:0] ey;
    wire [22:0] my;

    assign mye = (s1 == s2) ? {ms, 2'b0} + mia[55:29] : {ms, 2'b0} - mia[55:29];
    assign esi = es + 1;
    assign eyd = (mye[26] == 1) ? esi : es;
    assign myd = (mye[26] == 1) ? ((esi === 8'd255) ? {2'b01,25'b0} : mye>>1) : mye;

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

    assign eyf = {1'b0, eyd} - {4'b0, se};
    assign myf = ({1'b0, eyd} > {4'b0, se}) ? myd<<se : myd<<(eyd[4:0] - 1);
    assign my = myf[24:2];
    assign ey = (myf[25:2] == 24'b0) ? 8'b0 :
                ({1'b0, eyd} > {4'b0, se}) ? eyf[7:0] : 8'b0;
    assign y = {sy,ey,my};

endmodule

`default_nettype wire