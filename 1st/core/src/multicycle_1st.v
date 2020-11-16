`timescale  1 ns / 100 ps
`default_nettype none

module multicycle_cpu
    (//input wire SYSCLK_300_P, SYSCLK_300_N,
     //input wire CPU_RESET,
     (*mark_debug = "true"*)input wire clk,
     (*mark_debug = "true"*)input wire rstn,
     (*mark_debug = "true"*)output reg [7:0] led,
     (*mark_debug = "true"*)input wire rxd,
     (*mark_debug = "true"*)output wire txd
     );

     //IBUFGDS clk_inst (
        //.O(clk),
        //.I(SYSCLK_300_P),
        //.IB(SYSCLK_300_N)
     //);

     //(*mark_debug = "true"*)wire         txd;
     //(*mark_debug = "true"*)wire         rxd;
     //reg  [7:0]     led;
     wire          ferr;
     wire [31:0] pc_wire;
     wire [5:0] opcode;
     wire [5:0] funct;
     wire         UBusy;
     wire         IorD;
     wire         MemWrite;
     wire         IRWrite;
     wire         PCWrite;
     wire         Branch;
     wire         ToggleEqual;
     wire [1:0]   PCSrc;
     wire [2:0]   ALUControl;
     wire [2:0]   FPUControl;
     wire         ALUorFPU;
     wire [1:0]   ALUSrcB;
     wire         ALUSrcA;
     wire         AndiOri;
     wire         RegWrite;
     wire [1:0]   RegDst;
     wire [1:0]   MemtoReg;
     wire [31:0]  srcA;
     wire [31:0]  srcB;
     wire [31:0]  alu_result;
     wire [31:0]  fpu_result;
     wire [31:0]  cal_result;
     wire         ShiftD;
     wire         Shift;
     wire         BorL;
     wire [2:0]   RegConcat;
     wire         Out;
     wire         Tx_start;
     wire         Rx_ready;

     (*mark_debug = "true"*)wire [5:0]   state;

     wire [31:0] adr;
     wire [31:0] sr2_adr;
     wire [31:0] rd;
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
     wire [27:0] jump_address;
     wire [31:0] alu_out;
     wire zero;
     wire [31:0] branch_or_lui;
     wire [31:0] SignImm;
     wire pcen;

     (*mark_debug = "true"*)reg [31:0] pc;
     (*mark_debug = "true"*)reg [31:0] inst_reg;
     (*mark_debug = "true"*)reg [31:0] data_reg;
     (*mark_debug = "true"*)reg [31:0] output_rf1_reg;
     (*mark_debug = "true"*)reg [31:0] output_rf2_reg;
     (*mark_debug = "true"*)reg [31:0] alu_out_reg;
     (*mark_debug = "true"*)reg [31:0] sdata;
     (*mark_debug = "true"*)reg [31:0] rdata_reg;
     (*mark_debug = "true"*)reg [31:0] counter;




     initial begin
         pc = 0;
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
         end
         if (pcen) begin
            pc <= pc_;
         end
     end

     assign pc_wire = pc;
     assign adr = (~IorD ? pc_wire : alu_out);
    reg en;
    initial begin
        en = 1'b1;
    end

    assign sr2_adr = {2'b00,adr[31:2]};
    rams_sp_rf idmd(clk,en,MemWrite,sr2_adr,output2,rd);


    //decode,memory access stage
     always @(posedge clk) begin
         if (IRWrite) begin
            inst_reg <= rd;
            counter <= counter + 1'b1;
         end
            data_reg <= rd;
     end

     assign inst = inst_reg;
     assign data = data_reg;
     assign opcode = inst[31:26];
     assign funct = inst[5:0];
     assign op1 = {RegConcat[2],inst[25:21]};
     assign op2 = {RegConcat[1],inst[20:16]};
     assign regdst = (RegDst == 2'b00 ? {RegConcat[0],inst[20:16]} :(RegDst == 2'b01 ? {RegConcat[0],inst[15:11]} : 5'b11111));
     assign mem_to_reg = (MemtoReg == 2'b00 ? alu_out : (MemtoReg == 2'b01 ? data : (MemtoReg == 2'b10 ? pc : Indata )));

     multi_control_unit mcu(opcode,funct,clk,rstn,UBusy,Rx_ready,IorD,MemWrite,IRWrite,PCWrite,Branch,ToggleEqual,PCSrc,ALUControl,FPUControl,ALUorFPU,ALUSrcB,ALUSrcA,AndiOri,RegWrite,RegDst,MemtoReg,ShiftD,Shift,BorL,RegConcat,Out,Tx_start,state);
     rams_dp_wf rf1(clk,RegWrite,regdst,mem_to_reg,op1,output_rf1);
     rams_dp_wf rf2(clk,RegWrite,regdst,mem_to_reg,op2,output_rf2);

     always @(posedge clk) begin
         if (Out) begin
             sdata <= output_rf2;
         end else if (Rx_ready) begin
             rdata_reg <= {24'b0,rdata};
         end
     end

     assign Indata = rdata_reg;

     //wire data10;

     //send_10 sd(clk,rstn,data10);
     uart_tx ut(sdata[7:0],Tx_start,UBusy,txd,clk,rstn);
     uart_rx ur(rdata,Rx_ready,ferr,rxd,clk,rstn);

     //execute stage
     always @(posedge clk) begin
        output_rf1_reg <= output_rf1;
        output_rf2_reg <= output_rf2;
     end

     assign output1 = output_rf1_reg;
     assign output2 = output_rf2_reg;

     assign shifted = ShiftD ? output2 >> inst[10:6] : output2 << inst[10:6];
     assign output2_or_shifted = Shift ? shifted : output2;

     assign SignImm = AndiOri ? {16'd0,inst[15:0]} : (inst[15] ? {16'b1111111111111111,inst[15:0]} : {16'd0,inst[15:0]});
     assign srcA = (~ALUSrcA ? pc_wire : output1);
     assign branch_or_lui = BorL ? (inst[15:0]<< 5'd16) : (SignImm << 2'd2);
     assign srcB = (ALUSrcB == 2'b00 ? output2_or_shifted :(ALUSrcB == 2'b01 ? 32'b100 : (ALUSrcB == 2'b10 ? SignImm : branch_or_lui)));
     assign pcen = PCWrite | (Branch & (ToggleEqual ^ zero));

     alu a(ALUControl,srcA,srcB,alu_result,zero);
     fpu f(clk,rstn,FPUControl,srcA,srcB,fpu_result);

     assign cal_result = ALUorFPU ? fpu_result : alu_result;


     //write back stage
     always @(posedge clk) begin
         alu_out_reg <= cal_result;
         if(pc_wire == 8'd164 && RegWrite == 1'b1) begin
           led <= alu_out[7:0];
         end
     end

     assign alu_out = alu_out_reg;
     assign jump_address = {pc_wire[31:28],inst[25:0],2'b00};
     assign pc_ = (PCSrc == 2'b00 ? alu_result :(PCSrc == 2'b01 ? alu_out : jump_address));


endmodule

