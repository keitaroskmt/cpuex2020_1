`default_nettype none

module itof
    ( input wire [31:0] x,
      output reg [31:0] y,
      input wire clk,
      input wire rstn
);

    wire [31:0] y_wire;

    itof_1st u2(x, y_wire);

    always @(posedge clk) begin
        y <= y_wire;
    end

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
    assign ux = x[30:0];

    assign k =  (x[30]) ? 5'd30 :
                (x[29]) ? 5'd29 :
                (x[28]) ? 5'd28 :
                (x[27]) ? 5'd27 :
                (x[26]) ? 5'd26 :
                (x[25]) ? 5'd25 :
                (x[24]) ? 5'd24 :
                (x[23]) ? 5'd23 :
                (x[22]) ? 5'd22 :
                (x[21]) ? 5'd21 :
                (x[20]) ? 5'd20 :
                (x[19]) ? 5'd19 :
                (x[18]) ? 5'd18 :
                (x[17]) ? 5'd17 :
                (x[16]) ? 5'd16 :
                (x[15]) ? 5'd15 :
                (x[14]) ? 5'd14 :
                (x[13]) ? 5'd13 :
                (x[12]) ? 5'd12 :
                (x[11]) ? 5'd11 :
                (x[10]) ? 5'd10 :
                (x[9]) ? 5'd9 :
                (x[8])  ? 5'd8 :
                (x[7])  ? 5'd7 :
                (x[6])  ? 5'd6 :
                (x[5])  ? 5'd5 :
                (x[4])  ? 5'd4 :
                (x[3])  ? 5'd3 :
                (x[2])  ? 5'd2 :
                (x[1])  ? 5'd1 :
                (x[0])  ? 5'd0 : 5'd31;

    assign m1 = (k <= 23) ? {ux, 1'b0} << (23 - k) : {ux, 1'b0} >> (k - 23);
    assign m2 = m1 + 1;
    assign m = (k <= 23) ? m1[23:1] : m2[23:1];
    assign e = 127 + k;
    assign y = (k == 31) ? 32'b0 : {s,e,m};
endmodule



`default_nettype wire