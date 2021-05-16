`timescale 1ns / 100ps
`default_nettype none

module first_inst_EX
    (input wire clk,
    input wire rstn,
    input wire LeavelinkE1,
    input wire [1:0] BranchE1,
    input wire [2:0] ALUControlE1,
    input wire [4:0] FPUControlE1,
    input wire [2:0] ALUSrcE1,
    input wire RegDstE1,
    input wire BiE1,
    input wire [1:0] BltE1,
    input wire Branch_predictedE1,
    input wire Hazard_existenceE1,
    output wire branchE1,
    input wire done_beforeE1,
    output wire done_afterE1,
    input wire [31:0] srcaE1,
    input wire [31:0] srcbE1,
    input wire [31:0] ImmE1,
    input wire [31:0] pc_plusE1,
    input wire [31:0] pc_branchE1,
    input wire [31:0] biE1,
    input wire [5:0] rsE1,
    input wire [5:0] rtE1,
    input wire [5:0] rdE1,
    input wire [4:0] shamtE1,
    output wire [31:0] cal_resultE1,
    output wire [31:0] selectedbE1,
    output wire [5:0] writeRegE1,
    output wire [31:0] branch_destE1,
    output wire [31:0] branchsrcaE1,
    output wire [31:0] branchsrcbE1,
    input wire [3:0] ForwardaE1,
    input wire [3:0] ForwardbE1,
    input wire [31:0] write_backM1,
    input wire [31:0] write_backM2,
    input wire [31:0] read_dataW3,
    input wire [31:0] read_dataW4,
    input wire [31:0] write_backKept1,
    input wire [31:0] write_backKept2,
    input wire [31:0] read_dataKept3,
    input wire [31:0] read_dataKept4,
    input wire [31:0] rdataE1
    );

    (*mark_debug = "true"*)wire [31:0] forwardedaE1;
    (*mark_debug = "true"*)wire [31:0] forwardedbE1;
    wire [31:0] aluoutE1;
    wire [31:0] fpuoutE1;
    wire Branch_destE1;



    assign forwardedaE1 = (ForwardaE1 == 4'b0000) ? srcaE1
                        :((ForwardaE1 == 4'b0001) ? write_backM1
                        :((ForwardaE1 == 4'b0010) ? write_backM2
                        :((ForwardaE1 == 4'b0011) ? read_dataW3
                        :((ForwardaE1 == 4'b0100) ? read_dataW4
                        :((ForwardaE1 == 4'b1000) ? write_backKept1
                        :((ForwardaE1 == 4'b1001) ? write_backKept2
                        :((ForwardaE1 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign forwardedbE1 = (ForwardbE1 == 4'b0000) ? srcbE1
                        :((ForwardbE1 == 4'b0001) ? write_backM1
                        :((ForwardbE1 == 4'b0010) ? write_backM2
                        :((ForwardbE1 == 4'b0011) ? read_dataW3
                        :((ForwardbE1 == 4'b0100) ? read_dataW4
                        :((ForwardbE1 == 4'b1000) ? write_backKept1
                        :((ForwardbE1 == 4'b1001) ? write_backKept2
                        :((ForwardbE1 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign selectedbE1 = (ALUSrcE1 == 3'b000) ? forwardedbE1
                        :((ALUSrcE1 == 3'b001) ? (forwardedbE1 << shamtE1)
                        :((ALUSrcE1 == 3'b010) ? (forwardedbE1 >> shamtE1)
                        :((ALUSrcE1 == 3'b011) ? ImmE1
                        : rdataE1)));
    assign writeRegE1 = LeavelinkE1 ? 6'd31 : ( RegDstE1 ? rdE1 : rtE1);
    assign branch_destE1 = (Branch_destE1) ? pc_branchE1 : pc_plusE1;

    assign branchsrcaE1 = forwardedaE1;
    assign branchsrcbE1 = BiE1 ? biE1 : forwardedbE1;
    branch_unitDEM buE(Branch_predictedE1,BranchE1[0],BranchE1[1],BltE1,done_beforeE1,Hazard_existenceE1,branchsrcaE1,branchsrcbE1,done_afterE1,Branch_destE1,branchE1);

    alu al1(ALUControlE1,forwardedaE1,selectedbE1,aluoutE1);
    fpu fp1(clk,rstn,FPUControlE1[4:1],forwardedaE1,selectedbE1,fpuoutE1);

    assign cal_resultE1 = FPUControlE1[0] ? fpuoutE1 : aluoutE1;

endmodule