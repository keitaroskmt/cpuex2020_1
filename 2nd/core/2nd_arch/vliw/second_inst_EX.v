`timescale 1ns / 100ps
`default_nettype none

module second_inst_EX
    (input wire clk,
    input wire rstn,
    input wire [2:0] ALUControlE2,
    input wire [4:0] FPUControlE2,
    input wire [1:0] ALUSrcE2,
    input wire RegDstE2,
    input wire [31:0] srcaE2,
    input wire [31:0] srcbE2,
    input wire [31:0] ImmE2,
    input wire [5:0] rsE2,
    input wire [5:0] rtE2,
    input wire [5:0] rdE2,
    input wire [4:0] shamtE2,
    output wire [31:0] cal_resultE2,
    output wire [5:0] writeRegE2,
    input wire [3:0] ForwardaE2,
    input wire [3:0] ForwardbE2,
    input wire [31:0] write_backM1,
    input wire [31:0] write_backM2,
    input wire [31:0] read_dataW3,
    input wire [31:0] read_dataW4,
    input wire [31:0] write_backKept1,
    input wire [31:0] write_backKept2,
    input wire [31:0] read_dataKept3,
    input wire [31:0] read_dataKept4
    );


    wire [31:0] forwardedaE2;
    wire [31:0] forwardedbE2;
    wire [31:0] aluoutE2;
    wire [31:0] fpuoutE2;
    wire [31:0] selectedbE2;

    assign forwardedaE2 = (ForwardaE2 == 4'b0000) ? srcaE2
                        :((ForwardaE2 == 4'b0001) ? write_backM1
                        :((ForwardaE2 == 4'b0010) ? write_backM2
                        :((ForwardaE2 == 4'b0011) ? read_dataW3
                        :((ForwardaE2 == 4'b0100) ? read_dataW4
                        :((ForwardaE2 == 4'b1000) ? write_backKept1
                        :((ForwardaE2 == 4'b1001) ? write_backKept2
                        :((ForwardaE2 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign forwardedbE2 = (ForwardbE2 == 4'b0000) ? srcbE2
                        :((ForwardbE2 == 4'b0001) ? write_backM1
                        :((ForwardbE2 == 4'b0010) ? write_backM2
                        :((ForwardbE2 == 4'b0011) ? read_dataW3
                        :((ForwardbE2 == 4'b0100) ? read_dataW4
                        :((ForwardbE2 == 4'b1000) ? write_backKept1
                        :((ForwardbE2 == 4'b1001) ? write_backKept2
                        :((ForwardbE2 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign selectedbE2 = (ALUSrcE2 == 2'b00) ? forwardedbE2
                        :((ALUSrcE2 == 2'b01) ? (forwardedbE2 << shamtE2)
                        :((ALUSrcE2 == 2'b10) ? (forwardedbE2 >> shamtE2)
                        :ImmE2));
    assign writeRegE2 =  RegDstE2 ? rdE2 : rtE2;

    alu al2(ALUControlE2,forwardedaE2,selectedbE2,aluoutE2);
    fpu fp2(clk,rstn,FPUControlE2[4:1],forwardedaE2,selectedbE2,fpuoutE2);

    assign cal_resultE2 = FPUControlE2[0] ? fpuoutE2 : aluoutE2;

endmodule