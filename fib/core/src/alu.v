`default_nettype none
module alu (
    input wire [2:0] alu_control,
    input wire [31:0] srcA,
    input wire [31:0] srcB,
    output wire [31:0] alu_result,
    output wire zero
);

    wire [31:0]            srcBB;
    wire [31:0]            out0;
    wire [31:0]            out1;
    wire [31:0]            out2;
    wire [31:0]            out3;

    assign srcBB = (alu_control[2] == 1) ? ~srcB : srcB;
    assign out0 = srcBB & srcA;
    assign out1 = srcBB | srcA;
    assign out2 = srcBB + srcA + alu_control[2];
    assign out3 = {31'b0,out2[31]};
    assign alu_result = (alu_control[1] == 0) ? ((alu_control[0] == 0) ? out0 : out1):((alu_control[0] == 0) ? out2 : out3);
    assign zero = (out2 == 0) ? 1'b1 : 1'b0;


endmodule

`default_nettype wire

