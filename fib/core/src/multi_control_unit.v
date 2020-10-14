`default_nettype none

module multi_control_unit(
    input wire [5:0]    Op,
    input wire [5:0]    Funct,
    input wire          clk,
    input wire          rstn,
    output wire         IorD,
    output wire         MemWrite,
    output wire         IRWrite,
    output wire         PCWrite,
    output wire         Branch,
    output wire         ToggleEqual,
    output wire [1:0]   PCSrc,
    output wire [2:0]   ALUControl,
    output wire [1:0]   ALUSrcB,
    output wire         ALUSrcA,
    output wire         RegWrite,
    output wire [1:0]   RegDst,
    output wire [1:0]   MemtoReg
);

wire [1:0] PCSrc_temp;
wire       PCWrite_temp;
wire [1:0] ALUOp;
wire  [4:0] state;

multi_main_decoder md(Op,clk,rstn,IorD,MemWrite,IRWrite,PCWrite_temp,Branch,ToggleEqual,PCSrc_temp,ALUSrcB,ALUSrcA,RegWrite,RegDst,MemtoReg,ALUOp,state);
multi_ALU_decoder ad(Op,Funct,ALUOp,PCSrc_temp,PCWrite_temp,state,ALUControl,PCSrc,PCWrite);

endmodule


module multi_main_decoder(
    input wire [5:0]   Op,
    input wire         clk,
    input wire         rstn,
    output reg         IorD,
    output reg         MemWrite,
    output reg         IRWrite,
    output reg         PCWrite_temp,
    output reg         Branch,
    output reg         ToggleEqual,
    output reg [1:0]   PCSrc_temp,
    output reg [1:0]   ALUSrcB,
    output reg         ALUSrcA,
    output reg         RegWrite,
    output reg [1:0]   RegDst,
    output reg [1:0]   MemtoReg,
    output reg [1:0]   ALUOp,
    output reg [4:0]   state
);


    localparam s_Fetch =            0;
    localparam s_FetchWait =        1;
    localparam s_FetchWait2 =       2;
    localparam s_Decode =           3;
    localparam s_MemAdr =           4;
    localparam s_MemRead =          5;
    localparam s_MemReadWait =      6;  
    localparam s_MemReadWait2 =     7;  
    localparam s_MemWriteback =     8;
    localparam s_MemWrite =         9;
    localparam s_Execute =         10;
    localparam s_ALUWriteback =    11;
    localparam s_Branch =          12;
    localparam s_ADDIExecute =     13;
    localparam s_ADDIWriteback =   14;
    localparam s_Jump =            15;
    localparam s_Jumpandlink =     16;
    localparam s_Branchnotequal =  17;
                                     
always @(posedge clk) begin        
    if(~rstn) begin //reset all regters.
        state    <= s_Fetch;
        IorD     <= 1'b0;
        MemWrite <= 1'b0;
        IRWrite  <= 1'b0;
        PCWrite_temp <= 1'b1;
        Branch   <= 1'b0;
        ToggleEqual <= 1'b0;
        PCSrc_temp <= 2'b0;
        ALUSrcB  <= 2'b01;
        ALUSrcA  <= 1'b0;
        RegWrite <= 1'b0;
        RegDst   <= 2'b0;
        MemtoReg <= 2'b0;
        ALUOp    <= 2'b0;
    end else if (state == s_Fetch) begin
        state    <= s_FetchWait;
        PCWrite_temp  <= 1'b0; //set down this bit so as not to write in PC.
    end else if (state == s_FetchWait) begin
        state <= s_FetchWait2;
        IRWrite  <= 1'b1; //instruction leaks from the memory in this phase.
    end else if (state == s_FetchWait2) begin
        state    <= s_Decode;
        IRWrite  <= 1'b0; //instruction leaks from the memory in this phase.
        ALUSrcA <= 1'b0;
        ALUSrcB <= 2'b11;
        ALUOp   <= 2'b00;
    end else if (state == s_Decode) begin
        if (Op == 6'b100011) begin //lw
            state <= s_MemAdr;
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b10;
            ALUOp   <= 2'b00;
        end else if (Op == 6'b101011) begin // sw
            state <= s_MemAdr;
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b10;
            ALUOp   <= 2'b00;
        end else if (Op == 6'b000000) begin //R-type
            state <= s_Execute;
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b00;
            ALUOp   <= 2'b10;
        end else if (Op == 6'b000100) begin //beq
            state <= s_Branch;
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b00;
            ALUOp   <= 2'b01;
            PCSrc_temp   <= 2'b01;
            Branch  <= 1'b1;
        end else if (Op == 6'b000101) begin //bne
            state <= s_Branchnotequal;
            ALUSrcA     <= 1'b1;
            ALUSrcB     <= 2'b00;
            ALUOp       <= 2'b01;
            PCSrc_temp       <= 2'b01;
            Branch      <= 1'b1;
            ToggleEqual <= 1'b1;
        end else if (Op == 6'b001000) begin //addi
            state <= s_ADDIExecute;
            ALUSrcA <= 1'b1;
            ALUSrcB <= 2'b10;
            ALUOp   <= 2'b00;
        end else if (Op == 6'b000010) begin //jump
            state <= s_Jump;
            PCSrc_temp   <= 2'b10;
            PCWrite_temp <= 1'b1;
        end else if (Op == 6'b000011) begin //jal
            state <= s_Jumpandlink;
            PCSrc_temp    <= 2'b10;
            PCWrite_temp  <= 1'b1;
            RegDst   <= 2'b10;
            MemtoReg <= 2'b10;
            RegWrite <= 1'b1;
        end
    end else if (state == s_MemAdr) begin
        if (Op == 6'b100011) begin //lw
            state <= s_MemRead;
            IorD  <= 1'b1;
        end else if (Op == 6'b101011) begin // sw
            state <= s_MemWrite;
            IorD     <= 1'b1;
            MemWrite <= 1'b1;
        end
    end else if (state == s_MemRead) begin
        state <= s_MemReadWait;
    end else if (state == s_MemReadWait) begin
        state <= s_MemReadWait2;
    end else if (state == s_MemReadWait2) begin
        state <= s_MemWriteback;
        RegDst   <= 2'b00;
        MemtoReg <= 2'b01;
        RegWrite <= 1'b1;
    end else if (state == s_MemWriteback) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end else if (state == s_MemWrite) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end else if (state == s_Execute) begin
        state   <= s_ALUWriteback;
        RegDst   <= 2'b01;
        MemtoReg <= 2'b00;
        RegWrite <= 1'b1;
        PCWrite_temp  <= 1'b0;
    end else if (state == s_ALUWriteback) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end else if (state == s_Branch) begin
        state   <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
        Branch <= 1'b0;
    end else if (state == s_Branchnotequal) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
        Branch <= 1'b0;
    end else if (state == s_ADDIExecute) begin
        state   <= s_ADDIWriteback;
        RegDst   <= 1'b00;
        MemtoReg <= 1'b00;
        RegWrite <= 1'b1;
        MemWrite <= 1'b0;
    end else if (state == s_ADDIWriteback) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end else if (state == s_Jump) begin
        state   <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end else if (state == s_Jumpandlink) begin
        state    <= s_Fetch;
        IorD     <= 1'b0;
        ALUSrcA  <= 1'b0;
        ALUSrcB  <= 2'b01;
        ALUOp    <= 2'b00;
        ToggleEqual <= 1'b0; //when returning from BranchnotEqual state, we should set down this bit.
        PCSrc_temp    <= 2'b00;
        //IRWrite  <= 1'b1;
        PCWrite_temp  <= 1'b1;
        RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    end
  end
endmodule


module multi_ALU_decoder
    (input wire [5:0]  Op,
     input wire [5:0]  Funct,
     input wire [1:0]  ALUOp,
     input wire [1:0] PCSrc_temp,
     input wire       PCWrite_temp,
     input wire [4:0]  state,
     output wire [2:0] ALUControl,
     output wire [1:0] PCSrc,
     output wire       PCWrite
     ); //jr命令専用。jr命令かどうかはfunctフィールドも見ないとわからないからALUdecoderの管轄

    localparam s_Execute = 10;
    assign ALUControl = (ALUOp == 2'b00) ? 4'b010 //Opcodeフィールドですでにaddと判明してるケース
                                   : ((ALUOp == 2'b01) ? 4'b110 //Opcodeフィールドですでにsubtractと判明してるケース
                                   : ((Funct == 6'b100000) ? 4'b010 //add命令
                                   : ((Funct == 6'b100010) ? 4'b110 //subtract命令
                                   : ((Funct == 6'b100100) ? 4'b000 //and命令。
                                   : ((Funct == 6'b100101) ? 4'b001 //or命令。
                                   : ((Funct == 6'b101010) ? 4'b111 //slt命令。
                                   : ((Funct == 6'b001000) ? 4'b010 //jr命令。この時だけRegtoPCを立てて置き、他ではすべて下げる。jr命令がなぜかR形式命令のため、回路を複雑化させないためにはレジスタ書き込みは行わなければならない。よって$raレジスタと$0レジスタをaddして、$raに書き戻す、という無意味な操作をするために、ALUにaddの指示を出す。したがって、このために、jrの機械語形式には注意が必要。
                                   : 4'b0))))))); //else. とりま全部0に。
    assign {PCSrc,PCWrite} = (Op == 6'b000000 && Funct == 6'b001000 && state == s_Execute) ? 3'b001 : {PCSrc_temp,PCWrite_temp}; // jump asserts when only jr.



endmodule


`default_nettype wire

