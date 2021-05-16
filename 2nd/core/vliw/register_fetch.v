module register_fetch
    (input wire clk,
    input wire rstn,
    input wire [25:0] instD1,
    input wire RegWriteM1,
    input wire [1:0] BranchD1,
    input wire BiD1,
    input wire [1:0] BltD1,
    input wire [1:0] Lui_OriD1,
    input wire [2:0] RegConcatD1,
    input wire RegtoPCD1,
    input wire OutD1,
    input wire Branch_predictedD,
    input wire Hazard_existenceD1,
    input wire [31:0] pc_plusD1,
    input wire [31:0] write_backM1,
    input wire [5:0] writeRegM1,
    output wire branchD1,
    output wire [31:0] srcaD1,
    output wire [31:0] srcbD1,
    output wire [31:0] ImmD1,
    output wire [31:0] pc_branchD1,
    output wire [31:0] branch_destD1,
    output wire done_afterD1,
    input wire [25:0] instD2,
    input wire RegWriteM2,
    input wire [1:0] Lui_OriD2,
    input wire [2:0] RegConcatD2,
    input wire [31:0] write_backM2,
    input wire [5:0] writeRegM2,
    output wire [31:0] srcaD2,
    output wire [31:0] srcbD2,
    output wire [31:0] ImmD2,
    input wire [25:0] instD3,
    input wire RegWriteW3,
    input wire [2:0] RegConcatD3,
    input wire [31:0] read_dataW3,
    input wire [5:0] writeRegW3,
    output wire [31:0] srcaD3,
    output wire [31:0] srcbD3,
    output wire [31:0] ImmD3,
    input wire [25:0] instD4,
    input wire RegWriteW4,
    input wire [2:0] RegConcatD4,
    input wire [31:0] read_dataW4,
    input wire [5:0] writeRegW4,
    output wire [31:0] srcaD4,
    output wire [31:0] srcbD4,
    output wire [31:0] ImmD4
    );


    wire Branch_destD1;
    wire [31:0] branchbD1;

    reg done_beforeD1;
    always @(posedge clk) begin
        if(~rstn)begin
            done_beforeD1 <= 1'b0;
        end
    end


    reg_file_vliw rfg(clk,RegWriteM1,writeRegM1,write_backM1,{RegConcatD1[2],instD1[25:21]},srcaD1,{RegConcatD1[1],instD1[20:16]},srcbD1,RegWriteM2,writeRegM2,write_backM2,{RegConcatD2[2],instD2[25:21]},srcaD2,{RegConcatD2[1],instD2[20:16]},srcbD2,RegWriteW3,writeRegW3,read_dataW3,{RegConcatD3[2],instD3[25:21]},srcaD3,{RegConcatD3[1],instD3[20:16]},srcbD3,RegWriteW4,writeRegW4,read_dataW4,{RegConcatD4[2],instD4[25:21]},srcaD4,{RegConcatD4[1],instD4[20:16]},srcbD4);

    assign branchbD1 = BiD1 ? (instD1[20]? {24'hffffff,instD1[20:13]} : {24'd0,instD1[20:13]}) : srcbD1;
    branch_unitDEM buD(Branch_predictedD,BranchD1[0],BranchD1[1],BltD1,done_beforeD1,Hazard_existenceD1,srcaD1,branchbD1,done_afterD1,Branch_destD1,branchD1);



    //1st instruction
    assign ImmD1 = Lui_OriD1[1] ? {instD1[15:0],16'd0}
                    :(Lui_OriD1[0] ? {16'd0,instD1[15:0]}
                    :(instD1[15] ? {16'hffff,instD1[15:0]}
                    :{16'd0,instD1[15:0]}));

    assign pc_branchD1 = pc_plusD1 + {19'd0,instD1[12:0]};
    assign branch_destD1 = Branch_destD1 ? pc_branchD1 : pc_plusD1;

    //2nd instruction
    assign ImmD2 = Lui_OriD2[1] ? {instD2[15:0],16'd0}
                    :(Lui_OriD2[0] ? {16'd0,instD2[15:0]}
                    :(instD2[15] ? {16'hffff,instD2[15:0]}
                    :{16'd0,instD2[15:0]}));

    //3rd instruction
    assign ImmD3 = instD3[15] ? {16'hffff,instD3[15:0]} : {16'b0,instD3[15:0]};
    //4th instruction
    assign ImmD4 = instD4[15] ? {16'hffff,instD4[15:0]} : {16'b0,instD4[15:0]};



endmodule