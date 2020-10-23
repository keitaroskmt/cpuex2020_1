`timescale  1 ns / 100 ps
`default_nettype none

module multicycle_cpu_sim
    (input wire SYSCLK_300_P, SYSCLK_300_N,
     input wire CPU_RESET,
     //input wire clk,
     //input wire rstn,
  //    output wire [31:0] pc_wire,
   //  output wire [5:0] opcode,
    // output wire [5:0] funct,
    // output wire         IorD,
    // output wire         MemWrite,
    // output wire         IRWrite,
    // output wire         PCWrite,
    // output wire         Branch,
    // output wire         ToggleEqual,
    // output wire [1:0]   PCSrc,
    // output wire [2:0]   ALUControl,
    // output wire [1:0]   ALUSrcB,
    // output wire         ALUSrcA,
    // output wire         RegWrite,
     //output wire [1:0]   RegDst,
     //output wire [1:0]   MemtoReg,
     //output wire [31:0] alu_srcA,
     //output wire [31:0] alu_srcB,
     //output wire [31:0] alu_result,
     //output wire [4:0] state,
     output reg [7:0] led
     );
     wire clk;
     
     IBUFGDS clk_inst (
        .O(clk),
        .I(SYSCLK_300_P),
        .IB(SYSCLK_300_N)
     );


     reg clkr;
     reg rstnr;
     wire [31:0] pc_wire;
     wire [5:0] opcode;
     wire [5:0] funct;
     wire         IorD;
     wire         MemWrite;
     wire         IRWrite;
     wire         PCWrite;
     wire         Branch;
     wire         ToggleEqual;
     wire [1:0]   PCSrc;
     wire [2:0]   ALUControl;
     wire [1:0]   ALUSrcB;
     wire         ALUSrcA;
     wire         RegWrite;
     wire [1:0]   RegDst;
     wire [1:0]   MemtoReg;
     wire [31:0] alu_srcA;
     wire [31:0] alu_srcB;
     wire [31:0] alu_result;
     wire [4:0] state;

     wire [31:0] adr;
     wire [31:0] sr2_adr;
     wire [31:0] rd;
     wire [31:0] inst;
     wire [31:0] data;
     wire [31:0] pc_;
     wire [4:0] op1;
     wire [4:0] op2;
     wire [4:0] regdst;
     wire [31:0] mem_to_reg;
     wire [31:0] output_rf1;
     wire [31:0] output_rf2;
     wire [31:0] output1;
     wire [31:0] output2;
     wire [27:0] jump_address;
     wire [31:0] alu_out;
     wire zero;
     wire [31:0] SignImm;
     wire pcen;

     reg [31:0] pc;
     reg [31:0] inst_reg;
     reg [31:0] data_reg;
     reg [31:0] output_rf1_reg;
     reg [31:0] output_rf2_reg;
     reg [31:0] alu_out_reg;


     initial begin
         pc = 0;
         //clkr = 0;
         //rstnr = 1'b1;
     end

     //wire clk;
     //wire rstn;


    //always #500 begin
        //clkr <= ~clkr;
        //rstnr <= 1'b0;
    //end

    //assign clk = clkr;
    //assign rstn = rstnr;

     //fetch stage
     always @(posedge clk) begin
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
         end
            data_reg <= rd;
     end

     assign inst = inst_reg;
     assign data = data_reg;
     assign opcode = inst[31:26];
     assign funct = inst[5:0];
     assign op1 = inst[25:21];
     assign op2 = inst[20:16];
     assign regdst = (RegDst == 2'b00 ? inst[20:16] :(RegDst == 2'b01 ? inst[15:11] : 5'b11111));
     assign mem_to_reg = (MemtoReg == 2'b00 ? alu_out : (MemtoReg == 2'b01 ? data : pc ));

     multi_control_unit mcu(opcode,funct,clk,CPU_RESET,IorD,MemWrite,IRWrite,PCWrite,Branch,ToggleEqual,PCSrc,ALUControl,ALUSrcB,ALUSrcA,RegWrite,RegDst,MemtoReg,state);
     rams_dp_wf rf1(clk,RegWrite,regdst,mem_to_reg,op1,output_rf1);
     rams_dp_wf rf2(clk,RegWrite,regdst,mem_to_reg,op2,output_rf2);


     //execute stage
     always @(posedge clk) begin
        output_rf1_reg <= output_rf1;
        output_rf2_reg <= output_rf2;
     end

     assign output1 = output_rf1_reg;
     assign output2 = output_rf2_reg;

     assign SignImm = (inst[15] ? {16'b1111111111111111,inst[15:0]} : {16'd0,inst[15:0]});
     assign alu_srcA = (~ALUSrcA ? pc_wire : output1);
     assign alu_srcB = (ALUSrcB == 2'b00 ? output2 :(ALUSrcB == 2'b01 ? 32'b100 : (ALUSrcB == 2'b10 ? SignImm : {SignImm[29:0],2'b00})));
     assign pcen = PCWrite | (Branch & (ToggleEqual ^ zero));

     alu a(ALUControl,alu_srcA,alu_srcB,alu_result,zero);


     //write back stage
     always @(posedge clk) begin
         alu_out_reg <= alu_result;
         if(pc_wire == 8'd148 && RegWrite == 1'b1) begin
           led <= alu_out[7:0];
         end
     end

     assign alu_out = alu_out_reg;
     assign jump_address = {pc_wire[31:28],inst[25:0],2'b00};
     assign pc_ = (PCSrc == 2'b00 ? alu_result :(PCSrc == 2'b01 ? alu_out : jump_address));


endmodule

