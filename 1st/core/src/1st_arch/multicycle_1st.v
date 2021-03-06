`timescale  1 ns / 100 ps
`default_nettype none

module multicycle_cpu
    (//input wire SYSCLK_300_P, SYSCLK_300_N,
     //input wire CPU_RESET,
     input wire clk,
     input wire rstn_,
     //(*mark_debug = "true"*)output reg [7:0] led,
     input wire rxd,
     output wire txd
     );
    //reg rxd;
    //initial begin
      //rxd=1;
    //end

     //IBUFGDS clk_inst (
        //.O(clk),
        //.I(SYSCLK_300_P),
        //.IB(SYSCLK_300_N)
     //);

     //(*mark_debug = "true"*)wire         txd;
     //(*mark_debug = "true"*)wire         rxd;
     //reg  [7:0]     led;
     wire          ferr;
     (*mark_debug = "true"*)wire [31:0] pc_wire;
     (*mark_debug = "true"*)wire [5:0] opcode;
     (*mark_debug = "true"*)wire [5:0] funct;
     //wire         UBusy;
     wire         IorD;
     wire         MemWrite;
     wire         IRWrite;
     wire         PCWrite;
     wire         Branch;
     wire         ToggleEqual;
     wire [1:0]   PCSrc;
     wire [2:0]   ALUControl;
     wire [3:0]   FPUControl;
     wire         ALUorFPU;
     wire [1:0]   ALUSrcB;
     wire         ALUSrcA;
     wire         AndiOri;
     wire         RegWrite;
     wire [1:0]   RegDst;
     wire [1:0]   MemtoReg;
     (*mark_debug = "true"*)wire [31:0]  srcA;
     (*mark_debug = "true"*)wire [31:0]  srcB;
     wire [31:0]  alu_result;
     wire [31:0]  fpu_result;
     (*mark_debug = "true"*)wire [31:0]  cal_result;
     wire         ShiftD;
     wire         Shift;
     wire         BorL;
     wire [2:0]   RegConcat;
     wire         Out;
     (*mark_debug = "true"*)wire         Tx_start;
     wire         Rx_ready;

     (*mark_debug = "true"*)wire [5:0]   state;

     wire [31:0] adr;
     wire [31:0] sr2_adr;
     wire [31:0] ird;
     wire [31:0] drd;
     wire [31:0] inst;
     wire [31:0] data;
     wire [31:0] pc_;
     wire [5:0] op1;
     wire [5:0] op2;
     wire [5:0] regdst;
     wire [31:0] mem_to_reg;
     wire [31:0] output_rf1;
     wire [31:0] output_rf2;
     wire [31:0] output1;
     wire [31:0] output2;
     wire [31:0] shifted;
     wire [31:0] output2_or_shifted;
     wire [7:0] rdata;
     wire [31:0] Indata;
     wire [31:0] jump_address;
     wire [31:0] alu_out;
     wire zero;
     wire azero;
     wire fzero;
     wire [31:0] branch_or_lui;
     wire [31:0] SignImm;
     wire pcen;

     reg [31:0] pc;
     reg [31:0] inst_reg;
     reg [31:0] data_reg;
     reg [31:0] output_rf1_reg;
     reg [31:0] output_rf2_reg;
     reg [31:0] alu_out_reg;
     (*mark_debug = "true"*)reg [31:0] sdata;
     reg [31:0] rdata_reg;
     (*mark_debug = "true"*)reg [33:0] counter;
     reg rstn;

    (* ASYNC_REG = "true" *) reg [2:0] sync_reg;



     initial begin
         pc = 0;
         counter <= 0;
     end

     //fetch stage
    always @(posedge clk) begin
        if(~rstn) begin
           pc <= 0;
           inst_reg <= 0;
           data_reg <= 0;
           output_rf1_reg <= 0;
           output_rf2_reg <= 0;
           alu_out_reg <= 0;
           sdata <= 0;
           rdata_reg <= 0;
           counter <= 0;
           sync_reg <= 3'b111;
        end else begin
            if (pcen) begin
                pc <= pc_;
            end
            if (IRWrite) begin
                inst_reg <= ird;
                counter <= counter + 1'b1;
            end
            data_reg <= drd;
            if (Out) begin
                sdata <= output_rf2;
            end else if (Rx_ready) begin
                rdata_reg <= {24'b0,rdata};
            end
            output_rf1_reg <= output_rf1;
            output_rf2_reg <= output_rf2;
            alu_out_reg <= cal_result;
            if(pc_wire == 8'd164 && RegWrite == 1'b1) begin
//              led <= alu_out[7:0];
            end
        end
        sync_reg[0] <= rstn_;
        sync_reg[2:1] <= sync_reg [1:0];
        rstn <= sync_reg[2];
    end

    assign pc_wire = pc;
    assign adr = (~IorD ? pc_wire : alu_out);
    reg en;
    reg we;
    initial begin
        en = 1'b1;
        we = 1'b0;
    end

//    assign sr2_adr = {2'b00,adr[31:2]};
    rams_sp_rf2 im(clk,en,we,adr,output2,ird);
    rams_sp_rf dm(clk,en,MemWrite,adr,output2,drd);


    //decode,memory access stage
     assign inst = inst_reg;
     assign data = data_reg;
     assign opcode = inst[31:26];
     assign funct = inst[5:0];
     assign op1 = {RegConcat[2],inst[25:21]};
     assign op2 = {RegConcat[1],inst[20:16]};
     assign regdst = (RegDst == 2'b00 ? {RegConcat[0],inst[20:16]} :(RegDst == 2'b01 ? {RegConcat[0],inst[15:11]} : 5'b11111));
     assign mem_to_reg = (MemtoReg == 2'b00 ? alu_out : (MemtoReg == 2'b01 ? data : (MemtoReg == 2'b10 ? pc : Indata )));

     multi_control_unit mcu(opcode,funct,clk,rstn,Rx_ready,IorD,MemWrite,IRWrite,PCWrite,Branch,ToggleEqual,PCSrc,ALUControl,FPUControl,ALUorFPU,ALUSrcB,ALUSrcA,AndiOri,RegWrite,RegDst,MemtoReg,ShiftD,Shift,BorL,RegConcat,Out,Tx_start,state);
     rams_dp_wf rf1(clk,RegWrite,regdst,mem_to_reg,op1,output_rf1);
     rams_dp_wf rf2(clk,RegWrite,regdst,mem_to_reg,op2,output_rf2);

     assign Indata = rdata_reg;

     uart_tx_top utt(clk,rstn,Tx_start,sdata[7:0],txd) //,UBusy);
     uart_rx ur(rdata,Rx_ready,ferr,rxd,clk,rstn);

     //execute stage
     assign output1 = output_rf1_reg;
     assign output2 = output_rf2_reg;

     assign shifted = ShiftD ? output2 >> inst[10:6] : output2 << inst[10:6];
     assign output2_or_shifted = Shift ? shifted : output2;

     assign SignImm = AndiOri ? {16'd0,inst[15:0]} : (inst[15] ? {16'b1111111111111111,inst[15:0]} : {16'd0,inst[15:0]});
     assign srcA = (~ALUSrcA ? pc_wire : output1);
     assign branch_or_lui = BorL ? (inst[15:0]<< 5'd16) : SignImm;
     assign srcB = (ALUSrcB == 2'b00 ? output2_or_shifted :(ALUSrcB == 2'b01 ? 32'd1 : (ALUSrcB == 2'b10 ? SignImm : branch_or_lui)));
     assign zero = (ALUorFPU == 1'b1) ? fzero : azero;
     assign pcen = PCWrite | (Branch & (ToggleEqual ^ zero));

     alu a(ALUControl,srcA,srcB,alu_result,azero);
     fpu f(clk,rstn,FPUControl,srcA,srcB,fpu_result,fzero);

     assign cal_result = ALUorFPU ? fpu_result : alu_result;


     //write back stage
     assign alu_out = alu_out_reg;
     assign jump_address = {pc_wire[31:26],inst[25:0]};
     assign pc_ = (PCSrc == 2'b00 ? alu_result :(PCSrc == 2'b01 ? alu_out : jump_address));


endmodule

