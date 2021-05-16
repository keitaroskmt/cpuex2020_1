`timescale  1 ns / 100 ps
`default_nettype none

module pipeline_cpu
    (//input wire SYSCLK_300_P, SYSCLK_300_N,
    //input wire CPU_RESET,
    input wire clk,
    input wire rstn_,
     //(*mark_debug = "true"*)output reg [7:0] led,
     input wire rxd,
     output wire txd
    );

    reg [33:0] total_inst;
    reg [50:0] total_clk;
    reg [31:0] pc;
    reg rstn;
    (* ASYNC_REG = "true" *)reg [2:0] sync_reg;
    reg [31:0] instrFD;
    reg [31:0] pc_plusFD;
    reg Branch_predictedFD;
    reg Stalled;
    reg [31:0] missed;
    reg [31:0] branch_count;

    reg RegWriteDE;
    reg RegDstDE;
    reg ALUSrcDE;
    reg MemWriteDE;
    reg MemtoRegDE;
    reg LeaveLinkDE;
    reg BranchDE;
    reg ToggleEqualDE;
    reg BiDE;
    reg [1:0] BltDE;
    reg InDE;
    reg OutDE;
    reg Branch_predictedDE;
    reg [31:0] rdataDE;
    reg [1:0] ShiftDE;
    reg [2:0] ALUControlDE;
    reg [4:0] FPUControlDE;
    reg [31:0] biDE;
    reg [5:0] rsDE;
    reg [5:0] rtDE;
    reg [5:0] rdDE;
    reg [4:0] shamtDE;
    reg [31:0] pc_plusDE;
    reg [31:0] pcbranchDE;
    reg [31:0] signImmDE;
    reg [31:0] out_rfaDE;
    reg [31:0] out_rfbDE;
    reg doneDE;

    reg LeaveLinkEM;
    reg RegWriteEM;
    reg MemWriteEM;
    reg MemtoRegEM;
    reg BranchEM;
    reg ToggleEqualEM;
    reg [1:0] BltEM;
    reg Branch_predictedEM;
    reg [31:0] cal_resultEM;
    reg [31:0] writeDataEM;
    reg [5:0] writeRegEM;
    reg [31:0] pc_plusEM;
    reg [31:0] pcbranchEM;
    reg [5:0] rsEM;
    reg [5:0] rtEM;
    reg [31:0] srcAEM;
    reg [31:0] srcBEM;
    reg doneEM;

    reg LeaveLinkMW;
    reg RegWriteMW;
    reg MemtoRegMW;
    reg [31:0] cal_resultMW;
    reg [5:0] writeRegMW;
    reg [31:0] pc_plusMW;
    //reg [31:0] readDataMW;

    reg en;
    reg done_beforeD;
    reg Hazard_existenceM;

    wire [31:0] pc_regtopc_tia;
    wire [31:0] to_pc;

    wire [31:0] branched_pc_plus;
    wire branch_prediction;
    wire branch;
    wire branch_type;

    wire [31:0] pcF;
    wire [31:0] instrF;
    wire [31:0] instrD;
    wire [31:0] pc_plusF;
    wire [31:0] pc_branchF;
    wire [31:0] pc_branch_imF;
    wire [31:0] pc_jumpF;
    wire [31:0] pc_nextF;
    wire [1:0] Branch_predictedF;
    wire [31:0] pc_plusD;

    wire RegWriteD;
    wire RegDstD;
    wire ALUSrcD;
    wire BranchD;
    wire MemWriteD;
    wire MemtoRegD;
    //wire JumpD;
    wire LeaveLinkD;
    wire ToggleEqualD;
    wire RegtoPCD;
    wire BiD;
    wire [1:0] BltD;
    wire LuiD;
    wire OriD;
    wire InD;
    wire OutD;
    wire [7:0] rdataD;
    wire [1:0] ShiftD;
    wire [2:0] ALUControlD;
    wire [4:0] FPUControlD;
    wire [2:0] RegConcatD;
    wire Hazard_existenceD;
    wire Branch_destD;
    wire Branch_predictedD;

    wire [31:0] out_rfaD;
    wire [31:0] out_rfbD;
    wire signed [31:0] brancha;
    wire [31:0] forwardedbD;
    wire signed [31:0] branchb;
    wire [31:0] branch_destD;
    wire CLR_FD;
    //wire bres;
    wire done_afterD;
    wire branchD;
    wire [31:0] signImmD;
    wire [31:0] shift_tia;
    wire [31:0] pcbranchD;
    wire [31:0] wdata;
    wire [5:0] regdst;
    wire [31:0] biD;
    wire [5:0] rsD;
    wire [5:0] rtD;
    wire [5:0] rdD;

    wire RegWriteE;
    wire RegDstE;
    wire ALUSrcE;
    wire BranchE;
    wire MemWriteE;
    wire MemtoRegE;
    wire LeaveLinkE;
    wire ToggleEqualE;
    wire BiE;
    wire [1:0] BltE;
    wire InE;
    wire OutE;
    wire [31:0] rdataE;
    wire [1:0] ShiftE;
    wire [2:0] ALUControlE;
    wire [4:0] FPUControlE;
    wire Branch_predictedE;
    wire Hazard_existenceE;
    wire Branch_destE;

    wire [31:0] out_rfaE;
    wire [31:0] out_rfbE;
    wire [31:0] signImmE;
    wire [31:0] pc_plusE;
    wire [31:0] srcaE;
    wire [31:0] srcbE;
    wire [31:0] forwardedbE;
    wire [31:0] fb_shift_tiaE;
    wire [31:0] fb_in_tiaE;
    wire [31:0] aluoutE;
    wire [31:0] fpuoutE;
    wire [31:0] cal_resultE;
    wire [5:0] writeReg_withoutjalE;
    wire [5:0] writeRegE;
    wire [31:0] biE;
    wire [5:0] rsE;
    wire [5:0] rtE;
    wire [5:0] rdE;
    wire [4:0] shamtE;
    wire done_beforeE;
    wire done_afterE;
    wire [31:0] pcbranchE;
    wire branchE;
    wire [31:0] branch_destE;
    wire [31:0] bi_tiaE;

    wire LeaveLinkM;
    wire RegWriteM;
    wire MemWriteM;
    wire MemtoRegM;
    wire BranchM;
    wire ToggleEqualM;
    wire [1:0] BltM;
    wire Branch_predictedM;
    wire Branch_destM;

    wire [31:0] srcAM;
    wire [31:0] srcBM;
    wire [31:0] forwardedaM;
    wire [31:0] forwardedbM;
    wire [31:0] cal_resultM;
    wire [31:0] cal_result_without_pcplusM;
    wire [31:0] writeDataM;
    wire [5:0] writeRegM;
    wire [5:0] rsM;
    wire [5:0] rtM;
    wire [31:0] pc_plusM;
    wire [31:0] pcbranchM;
    //wire [31:0] readDataM;
    wire done_beforeM;
    wire done_afterM;
    wire branchM;
    wire [31:0] branch_destM;

    wire LeaveLinkW;
    wire RegWriteW;
    wire MemtoRegW;

    wire [31:0] cal_resultW;
    wire [5:0] writeRegW;
    wire [31:0] pc_plusW;
    wire [31:0] resultW;
    wire [31:0] readDataW;

    wire StallF;
    wire StallD;
    wire StallE;
    wire [1:0] ForwardAD;
    wire [1:0] ForwardBD;
    wire FlushE;
    wire FlushM;
    wire [1:0] ForwardAE;
    wire [1:0] ForwardBE;
    wire       ForwardAM;
    wire       ForwardBM;

    wire Rx_ready;

    always @(posedge clk) begin
        if (~rstn) begin
            total_inst <= 0;
            en <= 1'b1;
            pc <= 0;
            instrFD <= {6'b011111,26'd0}; //nop (all 0 -> sll RegWrite stands and bugged)
            Branch_predictedFD <= 0;
            pc_plusFD <= 0;
            {Branch_predictedDE,BranchDE,ToggleEqualDE,BltDE,BiDE,RegWriteDE,RegDstDE,ALUSrcDE,MemWriteDE,MemtoRegDE,LeaveLinkDE,ALUControlDE,FPUControlDE,InDE,OutDE,ShiftDE} <= 0;
            {rdataDE,rsDE,rtDE,rdDE,shamtDE,pc_plusDE,signImmDE,out_rfaDE,out_rfbDE,doneDE,pcbranchDE,biDE} <= 0;
            {Branch_predictedEM,BranchEM,ToggleEqualEM,BltEM,LeaveLinkEM,RegWriteEM,MemWriteEM,MemtoRegEM} <= 0;
            {cal_resultEM,writeDataEM,writeRegEM,pc_plusEM,pcbranchEM,rsEM,rtEM,srcAEM,srcBEM,doneEM} <= 0;
            {LeaveLinkMW,RegWriteMW,MemtoRegMW,cal_resultMW,writeRegMW,pc_plusMW} <= 0;
            //readDataMW <= 0;
            total_clk <= 0;
            done_beforeD <= 0;
            Hazard_existenceM <= 0;
            branch_count <= 0;
            missed <= 0;
        end else begin
            total_clk <= total_clk + 1;
            if (branchD | branchE | branchM) begin
                pc <= to_pc;
                missed <= missed + 1;
            end else if(StallF)begin
            end else begin
                pc <= to_pc;
            end
            if (branchE | branchM) begin
                if (branchE) begin
                    total_inst <= total_inst - 1;
                end else if(branchM) begin
                    total_inst <= total_inst - 2 + Stalled;
                end
                instrFD <= {6'b011111,26'd0}; //nop (all 0 -> sll RegWrite stands and bugged)
                pc_plusFD <= 32'b0;
                Branch_predictedFD <= 0;
                Stalled <= 1'b0;
            end else if (StallD) begin
                Stalled <= 1'b1;
            end else if (CLR_FD) begin
                instrFD <= {6'b011111,26'd0}; //nop (all 0 -> sll RegWrite stands and bugged)
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
            //Stall has higher priority than CLR. The instruction right after the "branch" could be cleared even if it is the right instruction to excute.
            if (branchE | branchM) begin
                {Branch_predictedDE,BranchDE,ToggleEqualDE,BltDE,BiDE,RegWriteDE,RegDstDE,ALUSrcDE,MemWriteDE,MemtoRegDE,LeaveLinkDE,ALUControlDE,FPUControlDE,InDE,OutDE,ShiftDE} <= 0;
                {rdataDE,rsDE,rtDE,rdDE,shamtDE,pc_plusDE,signImmDE,out_rfaDE,out_rfbDE,doneDE,pcbranchDE,biDE} <= 0;
            end else if (StallE) begin
            end else if (FlushE) begin
                {Branch_predictedDE,BranchDE,ToggleEqualDE,BltDE,BiDE,RegWriteDE,RegDstDE,ALUSrcDE,MemWriteDE,MemtoRegDE,LeaveLinkDE,ALUControlDE,FPUControlDE,InDE,OutDE,ShiftDE} <= 0;
                {rdataDE,rsDE,rtDE,rdDE,shamtDE,pc_plusDE,signImmDE,out_rfaDE,out_rfbDE,doneDE,pcbranchDE,biDE} <= 0;
            end else begin
                LeaveLinkDE <= LeaveLinkD;
                RegWriteDE <= RegWriteD;
                RegDstDE   <= RegDstD;
                BranchDE <= BranchD;
                ToggleEqualDE <= ToggleEqualD;
                BltDE <= BltD;
                BiDE <= BiD;
                ALUSrcDE   <= ALUSrcD;
                MemWriteDE <= MemWriteD;
                MemtoRegDE <= MemtoRegD;
                ALUControlDE <= ALUControlD;
                FPUControlDE <= FPUControlD;
                InDE <= InD;
                OutDE <= OutD;
                rdataDE <= {24'd0,rdataD};
                ShiftDE <= ShiftD;
                out_rfaDE <= out_rfaD;
                out_rfbDE <= out_rfbD;
                rsDE <= rsD;
                rtDE <= rtD;
                rdDE <= rdD;
                pc_plusDE <= pc_plusD;
                signImmDE <= shift_tia;
                shamtDE <= instrD[10:6];
                Branch_predictedDE <= Branch_predictedD;
                doneDE <= done_afterD;
                pcbranchDE <= pcbranchD;
                biDE <= biD;
            end
            if (FlushM | branchM) begin
                {Branch_predictedEM,BranchEM,ToggleEqualEM,BltEM,LeaveLinkEM,RegWriteEM,MemWriteEM,MemtoRegEM} <= 0;
                {cal_resultEM,writeDataEM,writeRegEM,pc_plusEM,pcbranchEM,rsEM,rtEM,srcAEM,srcBEM,doneEM} <= 0;
            end else begin
                LeaveLinkEM <= LeaveLinkE;
                RegWriteEM <= RegWriteE;
                MemWriteEM <= MemWriteE;
                MemtoRegEM <= MemtoRegE;
                BranchEM <= BranchE;
                ToggleEqualEM <= ToggleEqualE;
                BltEM <= BltE;
                Branch_predictedEM <= Branch_predictedE;
                rsEM <= rsE;
                rtEM <= rtE;
                srcAEM <= srcaE;
                srcBEM <= bi_tiaE;
                cal_resultEM <= cal_resultE;
                writeDataEM <= fb_in_tiaE;
                writeRegEM <= writeRegE;
                pc_plusEM <= pc_plusE;
                pcbranchEM <= pcbranchE;
                doneEM <= done_afterE;
            end
            if(BranchM)begin
              branch_count <= branch_count + 1;
            end
            LeaveLinkMW <= LeaveLinkM;
            RegWriteMW <= RegWriteM;
            MemtoRegMW <= MemtoRegM;
            //readDataMW <= readDataM;
            cal_resultMW <= cal_resultM;
            writeRegMW <= writeRegM;
            pc_plusMW <= pc_plusM;
        end
        sync_reg[0] <= rstn_;
        sync_reg[2:1] <= sync_reg [1:0];
        rstn <= sync_reg[2];
    end

    assign pc_regtopc_tia = RegtoPCD ? brancha : pc_nextF;
    assign to_pc = branchM ? branch_destM
                : (branchE ? branch_destE
                : (branchD ? branch_destD
                : pc_regtopc_tia));


    //instruction fetch stage
    assign pcF = pc;
    inst_mem_dis instmem(clk,pcF,instrF);

    assign branched_pc_plus = branchM ? pc_plusM
                            : (branchE ? pc_plusE
                            : (branchD ? pc_plusD
                            : 31'b0));
    assign branch = branchM || branchE || branchD;
    branch_predictor bp(clk,rstn,branch_type,pc,branched_pc_plus,branch,branch_prediction);
    branch_unitF buF(instrF[31:26],branch_prediction,branch_type,Branch_predictedF);
    assign pc_plusF = pc + 1;
    assign pc_branchF = pc_plusF + {16'b0,instrF[15:0]};
    assign pc_branch_imF = pc_plusF + {19'b0,instrF[12:0]};
    assign pc_jumpF = {6'b0,instrF[25:0]};
    assign pc_nextF = (Branch_predictedF == 2'b00) ? pc_plusF
                    :((Branch_predictedF == 2'b10) ? pc_branchF
                    :((Branch_predictedF == 2'b11) ? pc_branch_imF
                    :pc_jumpF));




    //decode stage
    assign instrD = instrFD;
    assign pc_plusD = pc_plusFD;
    assign rsD = {RegConcatD[2],instrD[25:21]};
    assign rtD = {RegConcatD[1],instrD[20:16]};
    assign rdD = {RegConcatD[0],instrD[15:11]};
    assign Branch_predictedD = Branch_predictedFD;

    reg_file rf(clk,RegWriteW,regdst,wdata,rsD,out_rfaD,rtD,out_rfbD);
    control_unit cu(instrD[31:26],instrD[5:0],RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,LeaveLinkD,ToggleEqualD,RegtoPCD,BiD,BltD,LuiD,OriD,InD,OutD,ShiftD,ALUControlD,FPUControlD,RegConcatD);
    assign CLR_FD =  RegtoPCD | branchD;

    assign brancha = (ForwardAD == 2'b00) ? out_rfaD
                    :((ForwardAD == 2'b01) ? cal_resultM
                    //:((ForwardAD == 2'b10) ? pc_plusM
                    :31'b0 );
    assign forwardedbD = (ForwardBD == 2'b00) ? out_rfbD
                         :((ForwardBD == 2'b01) ? cal_resultM
                         //:((ForwardBD == 2'b10) ? pc_plusM
                         :31'b0);
    assign biD = instrD[20] ? {24'hffffff,instrD[20:13]} : {24'b0,instrD[20:13]};
    assign branchb = (BiD == 1'b0) ? forwardedbD : biD;
    branch_unitDEM buD(Branch_predictedD,BranchD,ToggleEqualD,BltD,done_beforeD,Hazard_existenceD,brancha,branchb,done_afterD,Branch_destD,branchD);
    assign signImmD = OriD ? {16'd0,instrD[15:0]} : (instrD[15] ? {16'hffff,instrD[15:0]} : {16'b0,instrD[15:0]});
    assign shift_tia = LuiD ? signImmD << 5'd16 : signImmD;
    assign pcbranchD = {19'b0,instrD[12:0]} + pc_plusD;
    assign branch_destD = Branch_destD ? pcbranchD : pc_plusD;
    assign wdata = resultW;
    assign regdst = writeRegW;


    //execute stage
    assign LeaveLinkE = LeaveLinkDE;
    assign RegWriteE = RegWriteDE;
    assign RegDstE = RegDstDE;
    assign BranchE = BranchDE;
    assign ToggleEqualE = ToggleEqualDE;
    assign BltE = BltDE;
    assign BiE = BiDE;
    assign ALUSrcE = ALUSrcDE;
    assign MemWriteE = MemWriteDE;
    assign MemtoRegE = MemtoRegDE;
    assign ALUControlE = ALUControlDE;
    assign FPUControlE = FPUControlDE;
    assign InE = InDE;
    assign OutE = OutDE;
    assign ShiftE = ShiftDE;
    assign shamtE = shamtDE;
    assign rdataE = rdataDE;
    assign Branch_predictedE = Branch_predictedDE;
    assign done_beforeE = doneDE;
    assign pcbranchE = pcbranchDE;
    assign biE = biDE;

    assign bi_tiaE = BiE ? biE : forwardedbE;
    branch_unitDEM buE(Branch_predictedE,BranchE,ToggleEqualE,BltE,done_beforeE,Hazard_existenceE,srcaE,bi_tiaE,done_afterE,Branch_destE,branchE);

    assign out_rfaE = out_rfaDE;
    assign out_rfbE = out_rfbDE;
    assign srcaE = (ForwardAE == 2'b00) ? out_rfaE
                    :((ForwardAE == 2'b01) ? resultW
                    :((ForwardAE == 2'b10) ? cal_resultM
                    : pc_plusW ));
    assign forwardedbE = (ForwardBE == 2'b00) ? out_rfbE
                    :((ForwardBE == 2'b01) ? resultW
                    :((ForwardBE == 2'b10) ? cal_resultM
                    : pc_plusW ));
    assign fb_shift_tiaE = (ShiftE == 2'b10) ? (forwardedbE << shamtE)
                            :(ShiftE == 2'b11) ? (forwardedbE >> shamtE)
                            : forwardedbE;
    assign fb_in_tiaE = InE ? rdataE : fb_shift_tiaE;
    assign srcbE = ALUSrcE ? signImmE : fb_in_tiaE;
    alu al(ALUControlE,srcaE,srcbE,aluoutE);
    fpu fp(clk,rstn,FPUControlE[4:1],srcaE,srcbE,fpuoutE);

    assign cal_resultE = FPUControlE[0] ? fpuoutE : aluoutE;

    assign rsE = rsDE;
    assign rtE = rtDE;
    assign rdE = rdDE;
    assign pc_plusE = pc_plusDE;
    assign signImmE = signImmDE;
    assign writeReg_withoutjalE = RegDstE ? rdE : rtE;
    assign writeRegE = LeaveLinkE ? 6'd31 : writeReg_withoutjalE;

    assign branch_destE = Branch_destE ? pcbranchE : pc_plusE;


    //Memory Access stage
    assign LeaveLinkM = LeaveLinkEM;
    assign RegWriteM = RegWriteEM;
    assign MemWriteM = MemWriteEM;
    assign MemtoRegM = MemtoRegEM;
    assign BranchM = BranchEM;
    assign ToggleEqualM = ToggleEqualEM;
    assign BltM = BltEM;
    assign cal_result_without_pcplusM = cal_resultEM;
    assign cal_resultM = LeaveLinkM ? pc_plusM : cal_result_without_pcplusM;
    assign writeDataM = writeDataEM;
    assign writeRegM = writeRegEM;
    assign pc_plusM = pc_plusEM;
    assign pcbranchM = pcbranchEM;
    assign done_beforeM = doneEM;
    assign Branch_predictedM = Branch_predictedEM;

    assign rsM = rsEM;
    assign rtM = rtEM;

    assign srcAM = srcAEM;
    assign srcBM = srcBEM;
    assign forwardedaM = ForwardAM ? resultW : srcAM;
    assign forwardedbM = ForwardBM ? resultW : srcBM;

    branch_unitDEM buM(Branch_predictedM,BranchM,ToggleEqualM,BltM,done_beforeM,Hazard_existenceM,forwardedaM,forwardedbM,done_afterM,Branch_destM,branchM);

    assign branch_destM = Branch_destM ? pcbranchM : pc_plusM;

    //data_mem_dis dm(clk,MemWriteM,cal_resultM,writeDataM,readDataM);
    data_mem_bl dm(clk,en,MemWriteM,cal_resultM,writeDataM,readDataW);


    //Writeback Stage
    assign LeaveLinkW = LeaveLinkMW;
    assign RegWriteW = RegWriteMW;
    assign MemtoRegW = MemtoRegMW;
    //assign readDataW = readDataMW;
    assign cal_resultW = cal_resultMW;
    assign writeRegW = writeRegMW;
    assign pc_plusW = pc_plusMW;
    assign resultW = MemtoRegW ? readDataW : cal_resultW;

    wire ferr;
    uart_rx ur(rdataD,Rx_ready,ferr,rxd,clk,rstn);
    uart_tx_top utt(clk,rstn,OutE,fb_shift_tiaE[7:0],txd);

    hazard_unit hu(clk,rstn,Rx_ready,InD,BranchD,BiD,BranchE,BiE,rsD,rtD,rsE,rtE,rsM,rtM,writeRegE,writeRegM,writeRegW,MemtoRegE,MemtoRegM,RegWriteE,RegWriteM,RegWriteW,RegtoPCD,FPUControlE,StallF,StallD,StallE,Hazard_existenceD,Hazard_existenceE,ForwardAD,ForwardBD,FlushE,FlushM,ForwardAE,ForwardBE,ForwardAM,ForwardBM);

endmodule