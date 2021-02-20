`default_nettype none

module itof
    ( input wire [31:0] x,
      output wire [31:0] y,
      input wire clk,
      input wire rstn
);

    itof_1st u2(x, y);

endmodule


module itof_1st
    (input wire [31:0] x,
     output wire [31:0] y);

    wire [4:0] k;
    wire [30:0] ux;
    wire [31:0] m1;
    wire [31:0] m2;
    wire [22:0] m;
    wire [7:0] e;
    wire s;

    assign s = x[31];
    assign ux = (s) ? ~(x[30:0] - 1) : x[30:0];

    assign k =  (ux[30]) ? 5'd30 :
                (ux[29]) ? 5'd29 :
                (ux[28]) ? 5'd28 :
                (ux[27]) ? 5'd27 :
                (ux[26]) ? 5'd26 :
                (ux[25]) ? 5'd25 :
                (ux[24]) ? 5'd24 :
                (ux[23]) ? 5'd23 :
                (ux[22]) ? 5'd22 :
                (ux[21]) ? 5'd21 :
                (ux[20]) ? 5'd20 :
                (ux[19]) ? 5'd19 :
                (ux[18]) ? 5'd18 :
                (ux[17]) ? 5'd17 :
                (ux[16]) ? 5'd16 :
                (ux[15]) ? 5'd15 :
                (ux[14]) ? 5'd14 :
                (ux[13]) ? 5'd13 :
                (ux[12]) ? 5'd12 :
                (ux[11]) ? 5'd11 :
                (ux[10]) ? 5'd10 :
                (ux[9]) ? 5'd9 :
                (ux[8])  ? 5'd8 :
                (ux[7])  ? 5'd7 :
                (ux[6])  ? 5'd6 :
                (ux[5])  ? 5'd5 :
                (ux[4])  ? 5'd4 :
                (ux[3])  ? 5'd3 :
                (ux[2])  ? 5'd2 :
                (ux[1])  ? 5'd1 :
                (ux[0])  ? 5'd0 : 5'd31;

    assign m1 = (k <= 23) ? {ux, 1'b0} << (23 - k) : {ux, 1'b0} >> (k - 23);
    assign m2 = m1 + 1;
    assign m = (k <= 23) ? m1[23:1] : m2[23:1];
    assign e = 127 + k;
    assign y = (k == 31) ? 32'b0 : {s,e,m};
endmodule



`default_nettype wire