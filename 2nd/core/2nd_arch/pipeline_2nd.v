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

    reg RegWriteDE;
    reg RegDstDE;
    reg ALUSrcDE;
    reg MemWriteDE;
    reg MemtoRegDE;
    reg LeaveLinkDE;
    reg InDE;
    reg OutDE;
    reg [31:0] rdataDE;
    reg [1:0] ShiftDE;
    reg [2:0] ALUControlDE;
    reg [4:0] FPUControlDE;
    reg [5:0] rsDE;
    reg [5:0] rtDE;
    reg [5:0] rdDE;
    reg [4:0] shamtDE;
    reg [31:0] pc_plusDE;
    reg [31:0] signImmDE;
    reg [31:0] out_rfaDE;
    reg [31:0] out_rfbDE;

    reg LeaveLinkEM;
    reg RegWriteEM;
    reg MemWriteEM;
    reg MemtoRegEM;
    reg [31:0] cal_resultEM;
    reg [31:0] writeDataEM;
    reg [5:0] writeRegEM;
    reg [31:0] pc_plusEM;

    reg LeaveLinkMW;
    reg RegWriteMW;
    reg MemtoRegMW;
    reg [31:0] cal_resultMW;
    reg [5:0] writeRegMW;
    reg [31:0] pc_plusMW;
    //reg [31:0] readDataMW;

    reg en;

    wire [31:0] to_pc;

    wire [31:0] pcF;
    wire [31:0] instrF;
    wire [31:0] instrD;
    wire [31:0] pc_plusF;
    wire [31:0] pc_plusD;

    wire RegWriteD;
    wire RegDstD;
    wire ALUSrcD;
    wire BranchD;
    wire MemWriteD;
    wire MemtoRegD;
    wire JumpD;
    wire LeaveLinkD;
    wire ToggleEqualD;
    wire RegtoPCD;
    wire BltiD;
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

    wire [31:0] out_rfaD;
    wire [31:0] out_rfbD;
    wire signed [31:0] brancha;
    wire [31:0] forwardedbD;
    wire signed [31:0] branchb;
    wire CLR_FD;
    wire bres;
    wire branch;
    wire [31:0] signImmD;
    wire [31:0] shift_tia;
    wire [31:0] pcbranchD;
    wire [31:0] wdata;
    wire [5:0] regdst;
    wire [31:0] bi;
    wire [5:0] rsD;
    wire [5:0] rtD;
    wire [5:0] rdD;

    wire RegWriteE;
    wire RegDstE;
    wire ALUSrcE;
    wire MemWriteE;
    wire MemtoRegE;
    wire LeaveLinkE;
    wire InE;
    wire OutE;
    wire [31:0] rdataE;
    wire [1:0] ShiftE;
    wire [2:0] ALUControlE;
    wire [4:0] FPUControlE;

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
    wire [5:0] rsE;
    wire [5:0] rtE;
    wire [5:0] rdE;
    wire [4:0] shamtE;

    wire LeaveLinkM;
    wire RegWriteM;
    wire MemWriteM;
    wire MemtoRegM;

    wire [31:0] cal_resultM;
    wire [31:0] cal_result_without_pcplusM;
    wire [31:0] writeDataM;
    wire [5:0] writeRegM;
    wire [31:0] pc_plusM;
    wire [31:0] readDataM;

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

    wire Rx_ready;

    always @(posedge clk) begin
        if (~rstn) begin
            total_inst <= 0;
            en <= 1'b1;
            pc <= 0;
            instrFD <= {6'b011111,26'd0}; //nop (all 0 -> sll RegWrite stands and bugged)
            pc_plusFD <= 0;
            RegWriteDE <= 0;
            RegDstDE <= 0;
            ALUSrcDE <= 0;
            MemWriteDE <= 0;
            MemtoRegDE <= 0;
            LeaveLinkDE <= 0;
            ALUControlDE <= 0;
            FPUControlDE <= 0;
            InDE <= 0;
            OutDE <= 0;
            rdataDE <= 0;
            ShiftDE <= 0;
            rsDE <= 0;
            rtDE <= 0;
            rdDE <= 0;
            shamtDE <= 0;
            pc_plusDE <= 0;
            signImmDE <= 0;
            out_rfaDE <= 0;
            out_rfbDE <= 0;
            LeaveLinkEM <= 0;
            RegWriteEM <= 0;
            MemWriteEM <= 0;
            MemtoRegEM <= 0;
            cal_resultEM <= 0;
            writeDataEM <= 0;
            writeRegEM <= 0;
            pc_plusEM <= 0;
            LeaveLinkMW <= 0;
            RegWriteMW <= 0;
            MemtoRegMW <= 0;
            cal_resultMW<= 0;
            writeRegMW <= 0;
            pc_plusMW <= 0;
            //readDataMW <= 0;
            total_clk <= 0;
        end else begin
            total_clk <= total_clk + 1;
            if (~StallF) begin
                pc <= to_pc;
            end
            if (StallD) begin
            end else if (CLR_FD) begin
                instrFD <= {6'b011111,26'd0}; //nop (all 0 -> sll RegWrite stands and bugged)
                pc_plusFD <= 32'b0;
            end else begin
                total_inst <= total_inst + 1;
                instrFD <= instrF;
                pc_plusFD <= pc_plusF;
            end
            //Stall has higher priority than CLR. The instruction right after the "branch" could be cleared even if it is the right instruction to excute.
            if (StallE) begin
            end else if (FlushE) begin
                LeaveLinkDE <= 0;
                RegWriteDE <= 0;
                RegDstDE   <= 0;
                ALUSrcDE   <= 0;
                MemWriteDE <= 0;
                MemtoRegDE <= 0;
                ALUControlDE <= 0;
                FPUControlDE <= 0;
                InDE <= 0;
                OutDE <= 0;
                rdataDE <= 0;
                ShiftDE <= 0;
                out_rfaDE <= 0;
                out_rfbDE <= 0;
                rsDE <= 0;
                rtDE <= 0;
                rdDE <= 0;
                pc_plusDE <= 0;
                signImmDE <= 0;
                shamtDE <= 0;
            end else begin
                LeaveLinkDE <= LeaveLinkD;
                RegWriteDE <= RegWriteD;
                RegDstDE   <= RegDstD;
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
            end
            if (FlushM) begin
                LeaveLinkEM <= 0;
                RegWriteEM <= 0;
                MemWriteEM <= 0;
                MemtoRegEM <= 0;
                cal_resultEM <= 0;
                writeDataEM <= 0;
                writeRegEM <= 0;
                pc_plusEM <= 0;
            end else begin
                LeaveLinkEM <= LeaveLinkE;
                RegWriteEM <= RegWriteE;
                MemWriteEM <= MemWriteE;
                MemtoRegEM <= MemtoRegE;
                cal_resultEM <= cal_resultE;
                writeDataEM <= fb_in_tiaE;
                writeRegEM <= writeRegE;
                pc_plusEM <= pc_plusE;
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

    assign to_pc = ({branch,JumpD,RegtoPCD} == 3'b000) ? pc_plusF
                    :(({branch,JumpD,RegtoPCD} == 3'b010)  ? {6'b0,instrD[25:0]}
                    :(({branch,JumpD,RegtoPCD} == 3'b011)  ? brancha
                    :(({branch,JumpD,RegtoPCD} == 3'b100)  ? pcbranchD
                    :(({branch,JumpD,RegtoPCD} == 3'b110)  ? {6'b0,instrD[25:0]}
                    :(({branch,JumpD,RegtoPCD} == 3'b111)  ? brancha
                    : 32'b0)))));

    //instruction fetch stage
    assign pcF = pc;
    inst_mem_dis instmem(clk,pcF,instrF);
    assign pc_plusF = pc + 1;

    //decode stage
    assign instrD = instrFD;
    assign pc_plusD = pc_plusFD;
    assign rsD = {RegConcatD[2],instrD[25:21]};
    assign rtD = {RegConcatD[1],instrD[20:16]};
    assign rdD = {RegConcatD[0],instrD[15:11]};

    reg_file rf(clk,RegWriteW,regdst,wdata,rsD,out_rfaD,rtD,out_rfbD);
    control_unit cu(instrD[31:26],instrD[5:0],RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,JumpD,LeaveLinkD,ToggleEqualD,RegtoPCD,BltiD,BltD,LuiD,OriD,InD,OutD,ShiftD,ALUControlD,FPUControlD,RegConcatD);
    assign CLR_FD = JumpD | branch;

    assign brancha = (ForwardAD == 2'b00) ? out_rfaD
                    :((ForwardAD == 2'b01) ? cal_resultM
                    //:((ForwardAD == 2'b10) ? pc_plusM
                    :31'b0 );
    assign forwardedbD = (ForwardBD == 2'b00) ? out_rfbD
                         :((ForwardBD == 2'b01) ? cal_resultM
                         //:((ForwardBD == 2'b10) ? pc_plusM
                         :31'b0);
    //assign out_rfb_shift_tiaD = (ShiftD == 2'b10) ? (out_rfbD << instrD[15:11])
                                //:((ShiftD == 2'b11) ? (out_rfbD >> instrD[15:11])
                                //:out_rfbD);
    assign bi = instrD[20] ? {24'hffffff,instrD[20:13]} : {24'b0,instrD[20:13]};
    assign branchb = (BltiD == 1'b0) ? forwardedbD : bi;
    assign bres = (BltD == 2'b00) ? brancha == branchb    //beq,fbeq
                    :((BltD == 2'b01) ? brancha < branchb  //blt,fbne
                    :((BltD == 2'b10) ?
                    ((brancha[31]==1'b1&&branchb[31]==1'b1) ? brancha > branchb : brancha < branchb)
                    :1'b0));
    assign branch = BranchD & (ToggleEqualD ^ bres);
    assign signImmD = OriD ? {16'd0,instrD[15:0]} : (instrD[15] ? {16'hffff,instrD[15:0]} : {16'b0,instrD[15:0]});
    assign shift_tia = LuiD ? signImmD << 5'd16 : signImmD;
    assign pcbranchD = {19'b0,instrD[12:0]} + pc_plusD;
    assign wdata = resultW;
    assign regdst = writeRegW;


    //execute stage

    assign LeaveLinkE = LeaveLinkDE;
    assign RegWriteE = RegWriteDE;
    assign RegDstE = RegDstDE;
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


    //Memory Access stage
    assign LeaveLinkM = LeaveLinkEM;
    assign RegWriteM = RegWriteEM;
    assign MemWriteM = MemWriteEM;
    assign MemtoRegM = MemtoRegEM;
    assign cal_result_without_pcplusM = cal_resultEM;
    assign cal_resultM = LeaveLinkM ? pc_plusM : cal_result_without_pcplusM;
    assign writeDataM = writeDataEM;
    assign writeRegM = writeRegEM;
    assign pc_plusM = pc_plusEM;

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

    hazard_unit hu(clk,rstn,Rx_ready,InD,BranchD,rsD,rtD,rsE,rtE,writeRegE,writeRegM,writeRegW,MemtoRegE,MemtoRegM,RegWriteE,RegWriteM,RegWriteW,RegtoPCD,FPUControlE,StallF,StallD,StallE,ForwardAD,ForwardBD,FlushE,FlushM,ForwardAE,ForwardBE);

endmodule