`timescale  1 ns / 100 ps
`default_nettype none

module first_inst_MA
    (input wire clk,
    input wire rstn,
    input wire LeavelinkM1,
    input wire [1:0] BranchM1,
    input wire [1:0] BltM1,
    input wire Branch_predictedM1,
    input wire done_beforeM1,
    input wire [31:0] branchsrcaM1,
    input wire [31:0] branchsrcbM1,
    output wire branchM1,
    input wire [31:0] pc_plusM1,
    input wire [31:0] pc_branchM1,
    input wire [31:0] cal_resultM1,
    output wire [31:0] write_backM1,
    output wire [31:0] branch_destM1,
    input wire [1:0] ForwardaM1,
    input wire [1:0] ForwardbM1,
    input wire [31:0] read_dataW3,
    input wire [31:0] read_dataW4
    );

    wire done_afterM1;
    wire Branch_destM1;
    reg Hazard_existenceM1;
    (*mark_debug = "true"*)wire [31:0] forwardedaM1;
    (*mark_debug = "true"*)wire [31:0] forwardedbM1;

    always @(posedge clk) begin
        if(~rstn)begin
            Hazard_existenceM1 <= 0;
        end
    end

    assign branch_destM1 = Branch_destM1 ? pc_branchM1 : pc_plusM1;

    assign forwardedaM1 = (ForwardaM1 == 2'b00) ? branchsrcaM1
                        :((ForwardaM1 == 2'b01) ? read_dataW3
                        :((ForwardaM1 == 2'b10) ? read_dataW4
                        : branchsrcaM1));
    assign forwardedbM1 = (ForwardbM1 == 2'b00) ? branchsrcbM1
                        :((ForwardbM1 == 2'b01) ? read_dataW3
                        :((ForwardbM1 == 2'b10) ? read_dataW4
                        : branchsrcbM1));

    branch_unitDEM buM(Branch_predictedM1,BranchM1[0],BranchM1[1],BltM1,done_beforeM1,Hazard_existenceM1,forwardedaM1,forwardedbM1,done_afterM1,Branch_destM1,branchM1);

    assign write_backM1 = LeavelinkM1 ? pc_plusM1 : cal_resultM1;

endmodule