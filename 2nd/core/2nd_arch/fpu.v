`default_nettype none
module fpu (
    input wire clk,
    input wire rstn,
    input wire [3:0] fpu_control,
    input wire [31:0] srcA,
    input wire [31:0] srcB,
    output wire [31:0] fpu_result
    //output wire zero
);

wire [31:0] add;
wire [31:0] sub;
wire [31:0] mul;
wire [31:0] div;
wire [31:0] sqrt;
wire [31:0] mov;
//wire [31:0] branch;
wire [31:0] neg;
wire [31:0] abs;
wire [31:0] fint;
wire [31:0] ifloat;
wire [31:0] ffloor;
//wire slt;
//wire [32:0] dif;
wire ovfa;
wire ovfs;
wire ovfm;
wire ovfd;
wire [31:0] fpu_result_pre;

fadd fad(srcA,srcB,add,ovfa,clk,rstn);
fsub fsb(srcA,srcB,sub,ovfs,clk,rstn);
fmul fml(srcA,srcB,mul,ovfm,clk,rstn);
fdiv fdv(srcA,srcB,div,ovfd,clk,rstn);
fneg fng(srcB,neg);
fabs fas(srcB,abs);
fsqrt fsq(srcB,sqrt,clk,rstn);
fmove fmv(srcA,mov);
ftoi fi(srcA,fint,clk,rstn);
itof itf(srcA,ifloat,clk,rstn);
floor fl(srcA,ffloor,clk,rstn);

//fslt
//assign dif = srcA + (~srcB) + 1'b1;
//assign slt = (srcA[31]==1'b1&&srcB[31]==1'b0) ? srcA[31]
             //:((srcA[31]==1'b0&&srcB[31]==1'b1) ? srcA[31]
             //:((srcA[31]==1'b1&&srcB[31]==1'b1) ? ~dif[31] : dif[31]));


//fbeq,fbne
//assign zero = (srcA[30:0]==31'h00000000 &&srcB[30:0]==31'h00000000) ? 1'b1
                //:((srcA == srcB) ? 1'b1
                //:1'b0);



assign fpu_result_pre = (fpu_control == 4'b0000) ? add
                    :((fpu_control == 4'b001) ? sub
                    :((fpu_control == 4'b0010) ? mul
                    :((fpu_control == 4'b0011) ? div
                    :((fpu_control == 4'b0100) ? neg
                    :((fpu_control == 4'b0101) ? abs
                    :((fpu_control == 4'b0110) ? sqrt
                    :((fpu_control == 4'b0111) ? mov
                    :((fpu_control == 4'b1000) ? fint
                    :((fpu_control == 4'b1001) ? ifloat
                    :((fpu_control == 4'b1010) ? ffloor
                    : 31'd0))))))))));

assign fpu_result = (fpu_result_pre == 32'h80000000) ? 32'h00000000 : fpu_result_pre;

endmodule

`default_nettype wire