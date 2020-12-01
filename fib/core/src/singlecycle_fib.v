`default_nettype none

module cpu
    (input wire clk,
     input wire rstn,
     output wire [31:0] pc_,
     output wire [5:0] opcode,
     output wire [5:0] funct,
     output wire RegtoPC, //jr命令専用。当方独自作成。
     output wire Jump, //jump命令用のバスが必要なことに注意。p365参照
     output wire LeaveLink, //jal命令専用。当方独自作成。
     output wire RegWrite,
     output wire MemtoReg,
     output wire MemWrite,
     output wire [2:0] ALUControl,
     output wire ALUSrc,
     output wire RegDst,
     output wire Branch,
     output wire ToggleEqual, //For bne instr. When it is active, it toggles the "Zero" bit from ALU.
     output wire [31:0] alu_srcA,
     output wire [31:0] alu_srcB,
     output wire [31:0] alu_result
     );
     wire [31:0] mp32_1_to_pc;
     wire [31:0] mp32_3_to_mp32_1;
     wire [31:0] mp32_2_to_mp32_1;
     wire [31:0] inst;
     wire [31:0] pc_wire;
     wire [31:0] pc_plus_4;
     wire [31:0] mp32_4_to_rf;
     wire [4:0] mp5_0_to_mp5_1;
     wire [4:0] mp5_1_to_rf;
     wire [4:0] op1;
     wire [4:0] op2;
     wire [31:0] output_rf1;
     wire [31:0] output_rf2;
     wire [27:0] jump_address;
     wire [31:0] alu_srcB;
     wire [31:0] alu_result;
     wire zero;
     wire [31:0] SignImm;
     wire [31:0] PCBranch;
     wire vector_logic1_to_0;
     wire mp32_3_selector;
     wire [31:0] output_data;
     wire [31:0] write_back;
   // wire wRegtoPC; //jr命令専用。当方独自作成。
   // wire wJump; //jump命令用のバスが必要なことに注意。p365参照
   // wire wLeaveLink; //jal命令専用。当方独自作成。
   // wire wRegWrite;
   // wire wMemtoReg;
   // wire wMemWrite;
   // wire w[2:0] ALUControl;
   // wire wALUSrc;
   // wire wRegDst;
   // wire wBranch;
   // wire wTogglequal; //For bne instr. When it is active, it toggles the "Zero" bit from ALU.
   // assign RegtoPC = wRegtoPC; //jr命令
   // assign Jump = wJump; //jump命令 
   // assign LeaveLink = wLeaveLink; //jal 
   // assign RegWrite = wRegWrite;
   // assign MemtoReg = wMemtoReg;
   // assign MemWrite = wMemWrite;
   // assign ALUControl = wALUControl;
   // assign ALUSrc = wALUSrc;
   // assign RegDst = wRegDst;
   // assign Branch = wBranch;
   // assign Togglequal = wTogglequal; //For
    reg [31:0] pc;
//    reg RegtoPC; //jr命令専用。当方独自作成。
//    reg Jump; //jump命令用のバスが必要なことに注意。p365参照
//    reg LeaveLink; //jal命令専用。当方独自作成。
//    reg RegWrite;
//    reg MemtoReg;
//    reg MemWrite;
//    reg [2:0] ALUControl;
//    reg ALUSrc;
//    reg RegDst;
//    reg Branch;
//    reg ToggleEqual;//For bne instr. When it is active, it toggles the "Zero" bit from ALU.
     

     assign mp32_3_to_mp32_1 = (~mp32_3_selector ? pc_plus_4 : PCBranch);
     assign mp32_2_to_mp32_1 = (~RegtoPC ? {pc_plus_4[31:28],jump_address} : output_rf1); 
     assign mp32_1_to_pc = (~Jump ? mp32_3_to_mp32_1 : mp32_2_to_mp32_1);
     assign pc_ = pc;
        
     initial begin 
         pc = 0;
//       RegtoPC = 0;
//       Jump = 0;
//       LeaveLink = 0;
//       RegWrite = 0;
//       MemtoReg = 0;
//       MemWrite = 0;
//       [2:0] ALUControl = 0;
//       ALUSrc = 0;
//       RegDst = 0;
//       Branch = 0;
//       ToggleEqual = 0;
     end

     always @(posedge clk) begin 
         pc <= mp32_1_to_pc;
     end

     //fetch stage
     assign pc_wire = pc;
     inst_mem_dis imd(pc_wire,inst);
     assign pc_plus_4 = pc + 3'b100;

    //decode stage
     assign opcode = inst[31:26];
     assign funct = inst[5:0];
     assign mp32_4_to_rf = (~LeaveLink ? write_back : pc_plus_4);
     assign op1 = inst[25:21];
     assign op2 = inst[20:16];
     assign mp5_0_to_mp5_1 = (~RegDst ? inst[20:16] : inst[15:11]);
     assign mp5_1_to_rf = (~LeaveLink ? mp5_0_to_mp5_1 : 5'b11111);
     assign jump_address = {inst[25:0],2'b00};

     control_unit cu(opcode,funct,RegtoPC,Jump,LeaveLink,RegWrite,MemtoReg,MemWrite,ALUControl,ALUSrc,RegDst,Branch,ToggleEqual);
     rams_dp_wf rf1(clk,RegWrite,mp5_1_to_rf,mp32_4_to_rf,op1,output_rf1);
     rams_dp_wf rf2(clk,RegWrite,mp5_1_to_rf,mp32_4_to_rf,op2,output_rf2);

    
     //execute stage
     assign SignImm = (inst[15] ? {16'b1111111111111111,inst[15:0]} : {16'd0,inst[15:0]});
     assign alu_srcB = (~ALUSrc ? output_rf2 : SignImm);
     assign PCBranch = {SignImm[29:0],2'b00} + pc_plus_4;
     assign vector_logic1_to_0 = (ToggleEqual ^ zero);
     assign mp32_3_selector = (Branch & vector_logic1_to_0);
     assign alu_srcA = output_rf1;

     alu a(ALUControl,output_rf1,alu_srcB,alu_result,zero);

     //memory access stage
     data_mem_dis dmd(clk,MemWrite,alu_result,output_rf2,output_data);

     //write back stage
     assign write_back = (~MemtoReg ? alu_result : output_data);

endmodule
    
     
        
