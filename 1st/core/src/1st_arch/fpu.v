`default_nettype none
module fpu (
    input wire clk,
    input wire rstn,
    input wire [2:0] fpu_control,
    input wire [31:0] srcA,
    input wire [31:0] srcB,
    output wire [31:0] fpu_result
);

wire [31:0] add;
wire [31:0] sub;
wire [31:0] mul;
wire [31:0] div;
wire [31:0] sqrt;
wire [31:0] neg;
wire [31:0] abs;
wire slt;
wire [31:0] dif;
wire ovfa;
wire ovfs;
wire ovfm;
wire ovfd;

fadd fad(srcA,srcB,add,ovfa,clk,rstn);
fsub fsb(srcA,srcB,sub,ovfs,clk,rstn);
fmul fml(srcA,srcB,mul,ovfm,clk,rstn);
fdiv fdv(srcA,srcB,div,ovfd,clk,rstn);
fneg fng(srcB,neg);
fabs fas(srcB,abs);
fsqrt fsq(srcB,sqrt,clk,rstn);


//fslt
assign dif = srcA - srcB;
assign slt = (srcA[31]==1'b1&&srcB[31]==1'b1) ? ~dif[31] : dif[31];

assign fpu_result = (fpu_control == 3'b000) ? add
                    :((fpu_control == 3'b001) ? sub
                    :((fpu_control == 3'b010) ? mul
                    :((fpu_control == 3'b011) ? div
                    :((fpu_control == 3'b100) ? neg
                    :((fpu_control == 3'b101) ? abs
                    :((fpu_control == 3'b110) ? sqrt
                    :((fpu_control == 3'b111) ? {31'b0,slt}
                    : 31'd0)))))));

endmodule

`default_nettype wire