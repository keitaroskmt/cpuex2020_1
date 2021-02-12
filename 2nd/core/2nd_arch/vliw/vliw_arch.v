`timescale  1 ns / 100 ps
`default_nettype none

module vliw_arch
    (//input wire SYSCLK_300_P, SYSCLK_300_N,
    //input wire CPU_RESET,
    input wire clk,
    input wire rstn_,
     //(*mark_debug = "true"*)output reg [7:0] led,
    input wire rxd,
    output wire txd
    );

    //(*mark_debug = "true"*)reg [31:0] pc;
    (*mark_debug = "true"*)reg [31:0] pc;
    reg rstn;
    (*mark_debug = "true"*)reg [35:0] total_inst;

    wire [31:0] to_pc;
    wire [31:0] to_pc_jr;
    wire [31:0] next_pc;
    wire branch_type;
    wire [31:0] branched_pc_plus;
    wire branch_prediction;
//IF
    wire [31:0] pcF;
    wire [31:0] pc_plusF;
    wire [127:0] instrF;
    wire [1:0] Branch_predictedF;

    reg [31:0] pc_plusFD;
    reg [127:0] instrFD;
    reg Branch_predictedFD;
//RF
    wire [127:0] instrD;
    //1st inst
    wire [31:0] instD1;
    wire LeavelinkD1;
    wire RegWriteD1;
    wire [1:0] BranchD1;
    wire [2:0] ALUControlD1;
    wire [4:0] FPUControlD1;
    wire [2:0] ALUSrcD1;
    wire RegDstD1;
    wire BiD1;
    wire [1:0] BltD1;
    wire [1:0] Lui_OriD1;
    wire [2:0] RegConcatD1;
    wire RegtoPCD1;
    wire OutD1;
    wire Branch_predictedD1;
    wire Hazard_existenceD1;
    wire [31:0] srcaD1;
    wire [31:0] srcbD1;
    wire [31:0] ImmD1;
    wire branchD1;
    wire [31:0] pc_plusD1;
    wire [31:0] pc_branchD1;
    wire [31:0] branch_destD1;
    wire done_afterD1;
    wire [7:0] rdataD1;
    reg LeavelinkDE1;
    reg RegWriteDE1;
    reg [1:0] BranchDE1;
    reg [2:0] ALUControlDE1;
    reg [4:0] FPUControlDE1;
    reg [2:0] ALUSrcDE1;
    reg RegDstDE1;
    reg BiDE1;
    reg [1:0] BltDE1;
    reg OutDE1;
    reg Branch_predictedDE1;
    reg [31:0] srcaDE1;
    reg [31:0] srcbDE1;
    reg [5:0] rsDE1;
    reg [5:0] rtDE1;
    reg [5:0] rdDE1;
    reg [4:0] shamtDE1;
    reg [31:0] ImmDE1;
    reg [31:0] pc_plusDE1;
    reg [31:0] pc_branchDE1;
    reg doneDE1;
    reg [7:0] biDE1;
    reg [7:0] rdataDE1;
    //2nd inst
    wire [31:0] instD2;
    wire RegWriteD2;
    wire [2:0] ALUControlD2;
    wire [4:0] FPUControlD2;
    wire [1:0] ALUSrcD2;
    wire RegDstD2;
    wire [1:0] Lui_OriD2;
    wire [2:0] RegConcatD2;
    wire [31:0] srcaD2;
    wire [31:0] srcbD2;
    wire [31:0] ImmD2;
    reg RegWriteDE2;
    reg [2:0] ALUControlDE2;
    reg [4:0] FPUControlDE2;
    reg [1:0] ALUSrcDE2;
    reg RegDstDE2;
    reg [31:0] srcaDE2;
    reg [31:0] srcbDE2;
    reg [31:0] ImmDE2;
    reg [4:0] shamtDE2;
    reg [5:0] rsDE2;
    reg [5:0] rtDE2;
    reg [5:0] rdDE2;
    //3rd inst
    wire [31:0] instD3;
    wire RegWriteD3;
    wire MemWriteD3;
    wire [31:0] srcaD3;
    wire [31:0] srcbD3;
    wire [31:0] ImmD3;
    reg RegWriteDE3;
    reg MemWriteDE3;
    wire [2:0] RegConcatD3;
    reg [31:0] srcaDE3;
    reg [31:0] srcbDE3;
    reg [31:0] ImmDE3;
    reg [5:0] rsDE3;
    reg [5:0] rtDE3;
    ////4th inst
    wire [31:0] instD4;
    wire RegWriteD4;
    wire MemWriteD4;
    wire [31:0] srcaD4;
    wire [31:0] srcbD4;
    wire [31:0] ImmD4;
    reg RegWriteDE4;
    reg MemWriteDE4;
    wire [2:0] RegConcatD4;
    reg [31:0] srcaDE4;
    reg [31:0] srcbDE4;
    reg [31:0] ImmDE4;
    reg [5:0] rsDE4;
    reg [5:0] rtDE4;
//EX
    //1st inst
    wire LeavelinkE1;
    wire RegWriteE1;
    wire [1:0] BranchE1;
    wire [2:0] ALUControlE1;
    wire [4:0] FPUControlE1;
    wire [2:0] ALUSrcE1;
    wire RegDstE1;
    wire BiE1;
    wire [1:0] BltE1;
    wire OutE1;
    wire Branch_predictedE1;
    wire [31:0] srcaE1;
    wire [31:0] srcbE1;
    wire [5:0] rsE1;
    wire [5:0] rtE1;
    wire [5:0] rdE1;
    wire [4:0] shamtE1;
    wire [31:0] ImmE1;
    wire [31:0] cal_resultE1;
    wire branchE1;
    wire [31:0] pc_plusE1;
    wire [31:0] pc_branchE1;
    wire [31:0] branch_destE1;
    wire [31:0] branchsrcaE1;
    wire [31:0] branchsrcbE1;
    wire done_beforeE1;
    wire done_afterE1;
    wire [31:0] biE1;
    wire [31:0] rdataE1;
    wire [3:0] ForwardaE1;
    wire [3:0] ForwardbE1;
    wire [31:0] selectedbE1;
    wire [5:0] writeRegE1;
    wire Hazard_existenceE1;
    reg LeavelinkEM1;
    reg RegWriteEM1;
    reg [1:0] BranchEM1;
    reg [1:0] BltEM1;
    reg Branch_predictedEM1;
    reg [5:0] rsEM1;
    reg [5:0] rtEM1;
    reg [5:0] writeRegEM1;
    reg [31:0] cal_resultEM1;
    reg [31:0] pc_plusEM1;
    reg [31:0] pc_branchEM1;
    reg [31:0] branchsrcaEM1;
    reg [31:0] branchsrcbEM1;
    reg doneEM1;
    //2nd inst
    wire RegWriteE2;
    wire [2:0] ALUControlE2;
    wire [4:0] FPUControlE2;
    wire [1:0] ALUSrcE2;
    wire RegDstE2;
    wire [31:0] srcaE2;
    wire [31:0] srcbE2;
    wire [5:0] rsE2;
    wire [5:0] rtE2;
    wire [5:0] rdE2;
    wire [5:0] writeRegE2;
    wire [4:0] shamtE2;
    wire [31:0] ImmE2;
    wire [31:0] cal_resultE2;
    wire [3:0] ForwardaE2;
    wire [3:0] ForwardbE2;
    reg RegWriteEM2;
    reg [5:0] writeRegEM2;
    reg [31:0] cal_resultEM2;
    //3rd inst
    wire RegWriteE3;
    wire MemWriteE3;
    wire [31:0] srcaE3;
    wire [31:0] srcbE3;
    wire [31:0] forwardedaE3;
    wire [31:0] forwardedbE3;
    wire [5:0] rsE3;
    wire [5:0] rtE3;
    wire [31:0] ImmE3;
    wire [31:0] alu_resultE3;
    wire [3:0] ForwardaE3;
    wire [3:0] ForwardbE3;
    reg RegWriteEM3;
    reg MemWriteEM3;
    reg [31:0] srcbEM3;
    reg [5:0] rtEM3;
    reg [31:0] alu_resultEM3;
    ////4th inst
    wire RegWriteE4;
    wire MemWriteE4;
    wire [31:0] srcaE4;
    wire [31:0] srcbE4;
    wire [31:0] forwardedaE4;
    wire [31:0] forwardedbE4;
    wire [5:0] rsE4;
    wire [5:0] rtE4;
    wire [31:0] ImmE4;
    wire [31:0] alu_resultE4;
    wire [3:0] ForwardaE4;
    wire [3:0] ForwardbE4;
    reg RegWriteEM4;
    reg MemWriteEM4;
    reg [31:0] srcbEM4;
    reg [5:0] rtEM4;
    reg [31:0] alu_resultEM4;
//MA
    //1st inst
    wire LeavelinkM1;
    wire RegWriteM1;
    wire [1:0] BranchM1;
    wire [1:0] BltM1;
    wire [5:0] writeRegM1;
    wire [31:0] cal_resultM1;
    wire [5:0] rsM1;
    wire [5:0] rtM1;
    wire branchM1;
    wire [31:0] pc_plusM1;
    wire [31:0] pc_branchM1;
    wire [31:0] branch_destM1;
    wire [31:0] branchsrcaM1;
    wire [31:0] branchsrcbM1;
    wire Branch_predictedM1;
    wire done_beforeM1;
    wire [31:0] write_backM1;
    wire [1:0] ForwardaM1;
    wire [1:0] ForwardbM1;
    //2nd inst
    wire RegWriteM2;
    wire [5:0] writeRegM2;
    wire [31:0] cal_resultM2;
    wire [31:0] write_backM2;
    //3rd inst
    wire RegWriteM3;
    wire MemWriteM3;
    wire [31:0] alu_resultM3;
    wire [31:0] srcbM3;
    wire [5:0] writeRegM3;
    wire [31:0] read_dataM3;
    reg RegWriteMW3;
    reg [5:0] writeRegMW3;
    reg [31:0] read_dataMW3;
    //4th inst
    wire RegWriteM4;
    wire MemWriteM4;
    wire [31:0] alu_resultM4;
    wire [31:0] srcbM4;
    wire [5:0] writeRegM4;
    wire [31:0] read_dataM4;
    reg RegWriteMW4;
    reg [5:0] writeRegMW4;
    reg [31:0] read_dataMW4;
    //WA
    //3rd inst
    wire RegWriteW3;
    wire [5:0] writeRegW3;
    wire [31:0] read_dataW3;
    //4th inst
    wire RegWriteW4;
    wire [5:0] writeRegW4;
    wire [31:0] read_dataW4;

    //Keep
    //1st inst
    reg [31:0] write_backKeep1;
    reg [5:0] writeRegKeep1;
    reg RegWriteKeep1;
    wire [31:0] write_backKept1;
    wire [5:0] writeRegKept1;
    wire RegWriteKept1;
    //2nd inst
    reg [31:0] write_backKeep2;
    reg [5:0] writeRegKeep2;
    reg RegWriteKeep2;
    wire [31:0] write_backKept2;
    wire [5:0] writeRegKept2;
    wire RegWriteKept2;
    //3rd inst
    reg [31:0] read_dataKeep3;
    reg [5:0] writeRegKeep3;
    reg RegWriteKeep3;
    wire [31:0] read_dataKept3;
    wire [5:0] writeRegKept3;
    wire RegWriteKept3;
    //4th inst
    reg [31:0] read_dataKeep4;
    reg [5:0] writeRegKeep4;
    reg RegWriteKeep4;
    wire [31:0] read_dataKept4;
    wire [5:0] writeRegKept4;
    wire RegWriteKept4;


    wire StallF;
    wire StallD;
    wire StallE;
    wire FlushE;
    wire FlushM;
    wire Rx_ready;
    wire Read_data_keep;
    reg Stalled;

    (* ASYNC_REG = "true" *)reg [2:0] sync_reg;



    //Instruction Fetch Stage
    assign pcF = pc;
    assign pc_plusF = pcF + 1'b1;
    assign to_pc =  (Branch_predictedF == 2'b01) ? {6'd0,instrF[25:0]}
                    : ((Branch_predictedF == 2'b10) ? pc_plusF + {16'd0,instrF[15:0]}
                    : ((Branch_predictedF == 2'b11) ? pc_plusF + {19'd0,instrF[12:0]}
                    : pc_plusF));
    assign to_pc_jr = RegtoPCD1 ? srcaD1 : to_pc;
    assign next_pc = branchM1 ? branch_destM1
                : (branchE1 ? branch_destE1
                : (branchD1 ? branch_destD1
                : to_pc_jr));

    assign branched_pc_plus = branchM1 ? pc_plusM1
                            : (branchE1 ? pc_plusE1
                            : (branchD1 ? pc_plusD1
                            : 31'b0));

    inst_mem_dis_vliw instmemv(clk,pcF,instrF);
    reg branch_prediction;
    //branch_predictor bp(clk,rstn,branch_type,pc,branched_pc_plus,branchD1||branchE1||branchM1,branch_prediction);
    branch_unitF buF(instrF[31:26],branch_prediction,branch_type,Branch_predictedF);

    always @(posedge clk) begin
        if(~rstn)begin
            branch_prediction <= 1'b1;
            pc <= 0;
            {Branch_predictedFD,pc_plusFD} <= 0;
            instrFD <= {6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0};
            total_inst <= 0;
        end else begin
            if (branchD1 || branchE1 || branchM1) begin
                pc <= next_pc;
            end else if(StallF)begin
            end else begin
                pc <= next_pc;
            end
            if(branchE1 || branchM1) begin
                if (branchM1) begin
                  total_inst <= total_inst - 2 + Stalled;
                end else if (branchE1) begin
                  total_inst <= total_inst - 1;
                end
                instrFD <= {6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0};
                pc_plusFD <= 32'b0;
                Branch_predictedFD <= 0;
                Stalled <= 1'b0;
            end else if(StallD) begin
                Stalled <= 1'b1;
            end else if(RegtoPCD1 || branchD1) begin
                instrFD <= {6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0,6'b011111,26'd0};
                pc_plusFD <= 32'b0;
                Branch_predictedFD <= 0;
                Stalled <= 1'b1;
            end else begin
                total_inst <= total_inst + 1;
                instrFD <= instrF;
                pc_plusFD <= pc_plusF;
                Branch_predictedFD <= Branch_predictedF[1];
                Stalled <= 1'b0;
            end
        end
        sync_reg[0] <= rstn_;
        sync_reg[2:1] <= sync_reg [1:0];
        rstn <= sync_reg[2];
    end


    //Register Fetch Stage
    control_unit_vliw cuv(instrD[31:26],instrD[5:0],instrD[63:58],instrD[37:32],instrD[95:90],instrD[127:122],LeavelinkD1,RegWriteD1,BranchD1,ALUControlD1,FPUControlD1,ALUSrcD1,RegDstD1,BiD1,BltD1,Lui_OriD1,RegConcatD1,RegtoPCD1,OutD1,RegWriteD2,ALUControlD2,FPUControlD2,ALUSrcD2,RegDstD2,Lui_OriD2,RegConcatD2,RegWriteD3,MemWriteD3,RegConcatD3,RegWriteD4,MemWriteD4,RegConcatD4);

    assign instrD = instrFD;
    assign Branch_predictedD1 = Branch_predictedFD;
    assign pc_plusD1 = pc_plusFD;
    assign {instD1,instD2,instD3,instD4} = {instrD[31:0],instrD[63:32],instrD[95:64],instrD[127:96]};

    register_fetch rf(clk,rstn,instrD[25:0],RegWriteM1,BranchD1,BiD1,BltD1,Lui_OriD1,RegConcatD1,RegtoPCD1,OutD1,Branch_predictedD1,Hazard_existenceD1,pc_plusD1,write_backM1,writeRegM1,branchD1,srcaD1,srcbD1,ImmD1,pc_branchD1,branch_destD1,done_afterD1,instrD[57:32],RegWriteM2,Lui_OriD2,RegConcatD2,write_backM2,writeRegM2,srcaD2,srcbD2,ImmD2,instrD[89:64],RegWriteW3,RegConcatD3,read_dataW3,writeRegW3,srcaD3,srcbD3,ImmD3,instrD[121:96],RegWriteW4,RegConcatD4,read_dataW4,writeRegW4,srcaD4,srcbD4,ImmD4);


    //fourth_inst_RF fth_inst_RF(clk,rstn,instrD[127:96],,);

    always @(posedge clk) begin
        if(~rstn)begin
            {LeavelinkDE1,RegWriteDE1,BranchDE1,ALUControlDE1,FPUControlDE1,ALUSrcDE1,RegDstDE1,BiDE1,BltDE1,OutDE1,Branch_predictedDE1} <= 0;
            {srcaDE1,srcbDE1,ImmDE1,pc_plusDE1,pc_branchDE1,doneDE1,biDE1,rdataDE1,rsDE1,rtDE1,rdDE1,shamtDE1} <= 0;
            {RegWriteDE2,ALUControlDE2,FPUControlDE2,ALUSrcDE2,RegDstDE2} <= 0;
            {srcaDE2,srcbDE2,ImmDE2,rsDE2,rtDE2,rdDE2,shamtDE2} <= 0;
            {RegWriteDE3,MemWriteDE3} <= 0;
            {srcaDE3,srcbDE3,rsDE3,rtDE3,ImmDE3} <= 0;
            {RegWriteDE4,MemWriteDE4} <= 0;
            {srcaDE4,srcbDE4,rsDE4,rtDE4,ImmDE4} <= 0;
            //{RegWriteDE4,MemWriteDE4} <= 0;
            //{srcaDE4,srcbDE4,rsDE4,rtDE4} <= 0;
        end else begin
            if(branchE1 || branchM1)begin
                {LeavelinkDE1,RegWriteDE1,BranchDE1,ALUControlDE1,FPUControlDE1,ALUSrcDE1,RegDstDE1,BiDE1,BltDE1,OutDE1,Branch_predictedDE1} <= 0; {srcaDE1,srcbDE1,ImmDE1,pc_plusDE1,pc_branchDE1,doneDE1,biDE1,rdataDE1,rsDE1,rtDE1,rdDE1,shamtDE1} <= 0;
                {RegWriteDE2,ALUControlDE2,FPUControlDE2,ALUSrcDE2,RegDstDE2} <= 0;
                {srcaDE2,srcbDE2,ImmDE2,rsDE2,rtDE2,rdDE2,shamtDE2} <= 0;
                {RegWriteDE3,MemWriteDE3} <= 0;
                {srcaDE3,srcbDE3,rsDE3,rtDE3,ImmDE3} <= 0;
                {RegWriteDE4,MemWriteDE4} <= 0;
                {srcaDE4,srcbDE4,rsDE4,rtDE4,ImmDE4} <= 0;
            end else if (StallE) begin
            end else if (FlushE) begin
                {LeavelinkDE1,RegWriteDE1,BranchDE1,ALUControlDE1,FPUControlDE1,ALUSrcDE1,RegDstDE1,BiDE1,BltDE1,OutDE1,Branch_predictedDE1} <= 0; {srcaDE1,srcbDE1,ImmDE1,pc_plusDE1,pc_branchDE1,doneDE1,biDE1,rdataDE1,rsDE1,rtDE1,rdDE1,shamtDE1} <= 0;
                {RegWriteDE2,ALUControlDE2,FPUControlDE2,ALUSrcDE2,RegDstDE2} <= 0;
                {srcaDE2,srcbDE2,ImmDE2,rsDE2,rtDE2,rdDE2,shamtDE2} <= 0;
                {RegWriteDE3,MemWriteDE3} <= 0;
                {srcaDE3,srcbDE3,rsDE3,rtDE3,ImmDE3} <= 0;
                {RegWriteDE4,MemWriteDE4} <= 0;
                {srcaDE4,srcbDE4,rsDE4,rtDE4,ImmDE4} <= 0;
            end else begin
                {LeavelinkDE1,RegWriteDE1,BranchDE1,ALUControlDE1,FPUControlDE1,ALUSrcDE1,RegDstDE1,BiDE1,BltDE1,OutDE1,Branch_predictedDE1} <= {LeavelinkD1,RegWriteD1,BranchD1,ALUControlD1,FPUControlD1,ALUSrcD1,RegDstD1,BiD1,BltD1,OutD1,Branch_predictedD1};
                {srcaDE1,srcbDE1,ImmDE1,pc_plusDE1,pc_branchDE1,doneDE1,biDE1,rdataDE1} <= {srcaD1,srcbD1,ImmD1,pc_plusD1,pc_branchD1,done_afterD1,instrD[20:13],rdataD1};
                rsDE1 <= {RegConcatD1[2],instrD[25:21]};
                rtDE1 <= {RegConcatD1[1],instrD[20:16]};
                rdDE1 <= {RegConcatD1[0],instrD[15:11]};
                shamtDE1 <= instrD[10:6];
                {RegWriteDE2,ALUControlDE2,FPUControlDE2,ALUSrcDE2,RegDstDE2} <= {RegWriteD2,ALUControlD2,FPUControlD2,ALUSrcD2,RegDstD2};
                {srcaDE2,srcbDE2,ImmDE2} <= {srcaD2,srcbD2,ImmD2};
                rsDE2 <= {RegConcatD2[2],instrD[57:53]};
                rtDE2 <= {RegConcatD2[1],instrD[52:48]};
                rdDE2 <= {RegConcatD2[0],instrD[47:43]};
                shamtDE2 <= instrD[42:38];
                {RegWriteDE3,MemWriteDE3} <= {RegWriteD3,MemWriteD3};
                rsDE3 <= {RegConcatD3[2],instrD[89:85]};
                rtDE3 <= {RegConcatD3[1],instrD[84:80]};
                ImmDE3 <= ImmD3;
                {srcaDE3,srcbDE3} <= {srcaD3,srcbD3};
                {RegWriteDE4,MemWriteDE4} <= {RegWriteD4,MemWriteD4};
                rsDE4 <= {RegConcatD4[2],instrD[121:117]};
                rtDE4 <= {RegConcatD4[1],instrD[116:112]};
                ImmDE4 <= ImmD4;
                {srcaDE4,srcbDE4} <= {srcaD4,srcbD4};
            end
        end
    end

    //Execution Stage
    //1st instruction
    assign biE1 = biDE1[7] ? {24'hffffff,biDE1[7:0]} : {24'b0,biDE1[7:0]};
    assign {LeavelinkE1,RegWriteE1,BranchE1,ALUControlE1,FPUControlE1,ALUSrcE1,RegDstE1,BiE1,BltE1,OutE1,Branch_predictedE1} = {LeavelinkDE1,RegWriteDE1,BranchDE1,ALUControlDE1,FPUControlDE1,ALUSrcDE1,RegDstDE1,BiDE1,BltDE1,OutDE1,Branch_predictedDE1};
    assign {srcaE1,srcbE1,ImmE1,pc_plusE1,pc_branchE1,rdataE1,rsE1,rtE1,rdE1,shamtE1,done_beforeE1} = {srcaDE1,srcbDE1,ImmDE1,pc_plusDE1,pc_branchDE1,{24'd0,rdataDE1},rsDE1,rtDE1,rdDE1,shamtDE1,doneDE1};
    first_inst_EX fst_inst_EX(clk,rstn,LeavelinkE1,BranchE1,ALUControlE1,FPUControlE1,ALUSrcE1,RegDstE1,BiE1,BltE1,Branch_predictedE1,Hazard_existenceE1,branchE1,done_beforeE1,done_afterE1,srcaE1,srcbE1,ImmE1,pc_plusE1,pc_branchE1,biE1,rsE1,rtE1,rdE1,shamtE1,cal_resultE1,selectedbE1,writeRegE1,branch_destE1,branchsrcaE1,branchsrcbE1,ForwardaE1,ForwardbE1,write_backM1,write_backM2,read_dataW3,read_dataW4,write_backKept1,write_backKept2,read_dataKept3,read_dataKept4,rdataE1);

    //2nd instruction
    assign {RegWriteE2,ALUControlE2,FPUControlE2,ALUSrcE2,RegDstE2} = {RegWriteDE2,ALUControlDE2,FPUControlDE2,ALUSrcDE2,RegDstDE2};
    assign {srcaE2,srcbE2,ImmE2,rsE2,rtE2,rdE2,shamtE2} = {srcaDE2,srcbDE2,ImmDE2,rsDE2,rtDE2,rdDE2,shamtDE2};
    second_inst_EX snd_inst_EX(clk,rstn,ALUControlE2,FPUControlE2,ALUSrcE2,RegDstE2,srcaE2,srcbE2,ImmE2,rsE2,rtE2,
    rdE2,shamtE2,cal_resultE2,writeRegE2,ForwardaE2,ForwardbE2,write_backM1,write_backM2,read_dataW3,read_dataW4,write_backKept1,write_backKept2,read_dataKept3,read_dataKept4);

    //3rd instruction
    assign {RegWriteE3,MemWriteE3} = {RegWriteDE3,MemWriteDE3};
    assign {rsE3,rtE3,srcaE3,srcbE3,ImmE3} = {rsDE3,rtDE3,srcaDE3,srcbDE3,ImmDE3};
    assign forwardedaE3 = (ForwardaE3 == 4'b0000) ? srcaE3
                        :((ForwardaE3 == 4'b0001) ? write_backM1
                        :((ForwardaE3 == 4'b0010) ? write_backM2
                        :((ForwardaE3 == 4'b0011) ? read_dataW3
                        :((ForwardaE3 == 4'b0100) ? read_dataW4
                        :((ForwardaE3 == 4'b1000) ? write_backKept1
                        :((ForwardaE3 == 4'b1001) ? write_backKept2
                        :((ForwardaE3 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign forwardedbE3 = (ForwardbE3 == 4'b0000) ? srcbE3
                        :((ForwardbE3 == 4'b0001) ? write_backM1
                        :((ForwardbE3 == 4'b0010) ? write_backM2
                        :((ForwardbE3 == 4'b0011) ? read_dataW3
                        :((ForwardbE3 == 4'b0100) ? read_dataW4
                        :((ForwardbE3 == 4'b1000) ? write_backKept1
                        :((ForwardbE3 == 4'b1001) ? write_backKept2
                        :((ForwardbE3 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign alu_resultE3 = forwardedaE3 + ImmE3;

    ////4th instruction
    assign {RegWriteE4,MemWriteE4} = {RegWriteDE4,MemWriteDE4};
    assign {rsE4,rtE4,srcaE4,srcbE4,ImmE4} = {rsDE4,rtDE4,srcaDE4,srcbDE4,ImmDE4};
    assign forwardedaE4 = (ForwardaE4 == 4'b0000) ? srcaE4
                        :((ForwardaE4 == 4'b0001) ? write_backM1
                        :((ForwardaE4 == 4'b0010) ? write_backM2
                        :((ForwardaE4 == 4'b0011) ? read_dataW3
                        :((ForwardaE4 == 4'b0100) ? read_dataW4
                        :((ForwardaE4 == 4'b1000) ? write_backKept1
                        :((ForwardaE4 == 4'b1001) ? write_backKept2
                        :((ForwardaE4 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign forwardedbE4 = (ForwardbE4 == 4'b0000) ? srcbE4
                        :((ForwardbE4 == 4'b0001) ? write_backM1
                        :((ForwardbE4 == 4'b0010) ? write_backM2
                        :((ForwardbE4 == 4'b0011) ? read_dataW3
                        :((ForwardbE4 == 4'b0100) ? read_dataW4
                        :((ForwardbE4 == 4'b1000) ? write_backKept1
                        :((ForwardbE4 == 4'b1001) ? write_backKept2
                        :((ForwardbE4 == 4'b0101) ? read_dataKept3
                        : read_dataKept4)))))));
    assign alu_resultE4 = forwardedaE4 + ImmE4;


    always @(posedge clk) begin
        if(~rstn)begin
            {LeavelinkEM1,RegWriteEM1,BranchEM1,BltEM1,Branch_predictedEM1} <= 0;
            {rsEM1,rtEM1,writeRegEM1,cal_resultEM1,pc_plusEM1,pc_branchEM1,doneEM1,branchsrcaEM1,branchsrcbEM1} <= 0;
            RegWriteEM2 <= 0;
            {writeRegEM2,cal_resultEM2} <= 0;
            {RegWriteEM3,MemWriteEM3} <= 0;
            {rtEM3,alu_resultEM3,srcbEM3} <= 0;
            {RegWriteEM4,MemWriteEM4} <= 0;
            {rtEM4,alu_resultEM4,srcbEM4} <= 0;
        end else begin
            if(FlushM || branchM1) begin
                {LeavelinkEM1,RegWriteEM1,BranchEM1,BltEM1,Branch_predictedEM1} <= 0;
                {rsEM1,rtEM1,writeRegEM1,cal_resultEM1,pc_plusEM1,pc_branchEM1,doneEM1,branchsrcaEM1,branchsrcbEM1} <= 0;
                RegWriteEM2 <= 0;
                {writeRegEM2,cal_resultEM2} <= 0;
                {RegWriteEM3,MemWriteEM3} <= 0;
                {rtEM3,alu_resultEM3,srcbEM3} <= 0;
                {RegWriteEM4,MemWriteEM4} <= 0;
                {rtEM4,alu_resultEM4,srcbEM4} <= 0;
            end else begin
                {LeavelinkEM1,RegWriteEM1,BranchEM1,BltEM1,Branch_predictedEM1} <= {LeavelinkE1,RegWriteE1,BranchE1,BltE1,Branch_predictedE1};
                {rsEM1,rtEM1,writeRegEM1,cal_resultEM1,pc_plusEM1,pc_branchEM1,doneEM1,branchsrcaEM1,branchsrcbEM1} <= {rsE1,rtE1,writeRegE1,cal_resultE1,pc_plusE1,pc_branchE1,done_afterE1,branchsrcaE1,branchsrcbE1};
                RegWriteEM2 <= RegWriteE2;
                {writeRegEM2,cal_resultEM2} <= {writeRegE2,cal_resultE2};
                {RegWriteEM3,MemWriteEM3} <= {RegWriteE3,MemWriteE3};
                {rtEM3,alu_resultEM3,srcbEM3} <= {rtE3,alu_resultE3,forwardedbE3};
                {RegWriteEM4,MemWriteEM4} <= {RegWriteE4,MemWriteE4};
                {rtEM4,alu_resultEM4,srcbEM4} <= {rtE4,alu_resultE4,forwardedbE4};
            end
        end
    end

    //Memory Access & Write Back Stage
    //1st instruction
    assign {LeavelinkM1,RegWriteM1,BranchM1,BltM1,Branch_predictedM1} = {LeavelinkEM1,RegWriteEM1,BranchEM1,BltEM1,Branch_predictedEM1};
    assign {rsM1,rtM1,writeRegM1,cal_resultM1,pc_plusM1,pc_branchM1,done_beforeM1,branchsrcaM1,branchsrcbM1} = {rsEM1,rtEM1,writeRegEM1,cal_resultEM1,pc_plusEM1,pc_branchEM1,doneEM1,branchsrcaEM1,branchsrcbEM1};
    first_inst_MA fst_inst_MA(clk,rstn,LeavelinkM1,BranchM1,BltM1,Branch_predictedM1,done_beforeM1,branchsrcaM1,branchsrcbM1,branchM1,pc_plusM1,pc_branchM1,cal_resultM1,write_backM1,branch_destM1,ForwardaM1,ForwardbM1,read_dataW3,read_dataW4);
    //2nd instruction
    assign RegWriteM2 = RegWriteEM2;
    assign {writeRegM2,cal_resultM2} = {writeRegEM2,cal_resultEM2};
    assign write_backM2 = cal_resultM2;
    //3rd instruction
    assign {RegWriteM3,MemWriteM3} = {RegWriteEM3,MemWriteEM3};
    assign {writeRegM3,alu_resultM3,srcbM3} = {rtEM3,alu_resultEM3,srcbEM3};
    //4th instruction
    assign {RegWriteM4,MemWriteM4} = {RegWriteEM4,MemWriteEM4};
    assign {writeRegM4,alu_resultM4,srcbM4} = {rtEM4,alu_resultEM4,srcbEM4};
    reg en;

    //data_mem_bl_vliw dmb(clk,en,MemWriteM3,alu_resultM3,srcbM3,read_dataW3);
    data_mem_wrap dmw(clk,rstn,MemWriteE3,alu_resultE3,forwardedbE3,read_dataM3,MemWriteE4,alu_resultE4,forwardedbE4,read_dataM4);

    always @(posedge clk) begin
        if(~rstn)begin
            RegWriteMW3 <= 0;
            writeRegMW3 <= 0;
            RegWriteMW4 <= 0;
            writeRegMW4 <= 0;
            en <= 1'b1;
            read_dataKeep3 <= 0;
            writeRegKeep3 <= 0;
            read_dataKeep4 <= 0;
            writeRegKeep4 <= 0;
            RegWriteKeep3 <= 0;
            RegWriteKeep4 <= 0;
        end else begin
            if(Read_data_keep)begin
                write_backKeep1 <= write_backM1;
                writeRegKeep1 <= writeRegM1;
                RegWriteKeep1 <= RegWriteM1;
                write_backKeep2 <= write_backM2;
                writeRegKeep2 <= writeRegM2;
                RegWriteKeep2 <= RegWriteM2;
                read_dataKeep3 <= read_dataW3;
                writeRegKeep3 <= writeRegW3;
                RegWriteKeep3 <= RegWriteW3;
                read_dataKeep4 <= read_dataW4;
                writeRegKeep4 <= writeRegW4;
                RegWriteKeep4 <= RegWriteW4;
            end else if(StallE)begin
            end
            read_dataMW3 <= read_dataM3;
            RegWriteMW3 <= RegWriteM3;
            writeRegMW3 <= writeRegM3;
            read_dataMW4 <= read_dataM4;
            RegWriteMW4 <= RegWriteM4;
            writeRegMW4 <= writeRegM4;
        end
    end

    //3rd instruction
    assign read_dataW3 = read_dataMW3;
    assign RegWriteW3 = RegWriteMW3;
    assign writeRegW3 = writeRegMW3;
    ////4th instruction
    assign read_dataW4 = read_dataMW4;
    assign RegWriteW4 = RegWriteMW4;
    assign writeRegW4 = writeRegMW4;

    //Keep for StallE(floatstall), the data could be lost when the floatstall occured without this.
    assign write_backKept1 = write_backKeep1;
    assign writeRegKept1 = writeRegKeep1;
    assign RegWriteKept1 = RegWriteKeep1;
    assign write_backKept2 = write_backKeep2;
    assign writeRegKept2 = writeRegKeep2;
    assign RegWriteKept2 = RegWriteKeep2;
    assign read_dataKept3 = read_dataKeep3;
    assign writeRegKept3 = writeRegKeep3;
    assign RegWriteKept3 = RegWriteKeep3;
    assign read_dataKept4 = read_dataKeep4;
    assign writeRegKept4 = writeRegKeep4;
    assign RegWriteKept4 = RegWriteKeep4;


    wire ferr;
    uart_rx ur(rdataD1,Rx_ready,ferr,rxd,clk,rstn);
    uart_tx_top_bl utt(clk,rstn,OutE1,selectedbE1[7:0],txd);

    hazard_unit_vliw huv(clk,rstn,Rx_ready,ALUSrcD1[2],BranchD1,BiD1,BranchE1,BiE1,{RegConcatD1[2],instrD[25:21]},{RegConcatD1[1],instrD[20:16]},{RegConcatD2[2],instrD[57:53]},{RegConcatD2[1],instrD[52:48]},{RegConcatD3[2],instrD[89:85]},{RegConcatD3[1],instrD[84:80]},{RegConcatD4[2],instrD[121:117]},{RegConcatD4[1],instrD[116:112]},rsE1,rtE1,writeRegE1,rsE2,rtE2,writeRegE2,rsE3,rtE3,rsE4,rtE4,rsM1,rtM1,writeRegM1,writeRegM2,writeRegM3,writeRegM4,writeRegW3,writeRegW4,writeRegKept1,writeRegKept2,writeRegKept3,writeRegKept4,RegWriteE1,RegWriteE2,RegWriteE3,RegWriteE4,RegWriteM1,RegWriteM2,RegWriteM3,RegWriteM4,RegWriteW3,RegWriteW4,RegWriteKept1,RegWriteKept2,RegWriteKept3,RegWriteKept4,RegtoPCD1,FPUControlE1,FPUControlE2,StallF,StallD,StallE,Hazard_existenceD1,Hazard_existenceE1,FlushE,FlushM,ForwardaE1,ForwardbE1,ForwardaE2,ForwardbE2,ForwardaE3,ForwardbE3,ForwardaE4,ForwardbE4,ForwardaM1,ForwardbM1,Read_data_keep);


    endmodule