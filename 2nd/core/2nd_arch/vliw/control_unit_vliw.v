`timescale 1ns / 100ps
`default_nettype none

module control_unit_vliw
    (input wire [5:0] Op1,
     input wire [5:0] Funct1,
     input wire [5:0] Op2,
     input wire [5:0] Funct2,
     input wire [5:0] Op3,
     input wire [5:0] Op4,
     output wire Leavelink1,
     output wire RegWrite1,
     output wire [1:0] Branch1, //Branch(new) ={ToggleEqual,Branch(old)}
     output wire [2:0] ALUControl1,
     output wire [4:0] FPUControl1,
     output wire [2:0] ALUSrc1, //ALUSrc[2] = In
     output wire RegDst1,
     output wire Bi1,
     output wire [1:0] Blt1, //{fblt,blt}
     output wire [1:0] Lui_Ori1,
     output wire [2:0] RegConcat1,
     output wire RegtoPC1,
     output wire Out1,
     output wire RegWrite2,
     output wire [2:0] ALUControl2,
     output wire [4:0] FPUControl2,
     output wire [1:0] ALUSrc2,
     output wire RegDst2,
     output wire [1:0] Lui_Ori2,
     output wire [2:0] RegConcat2,
     output wire RegWrite3,
     output wire MemWrite3,
     output wire [2:0] RegConcat3,
     output wire RegWrite4,
     output wire MemWrite4,
     output wire [2:0] RegConcat4
     );

    wire [1:0] ALUOp1;
    wire [1:0] ALUOp2;

    fisrt_decoder fd(Op1,Leavelink1,RegWrite1,Branch1,FPUControl1,ALUSrc1,RegDst1,Bi1,Blt1,Lui_Ori1,RegConcat1,RegtoPC1,Out1,ALUOp1);
    second_decoder sd(Op2,RegWrite2,FPUControl2,ALUSrc2,RegDst2,Lui_Ori2,RegConcat2,ALUOp2);
    mem_access_decoder td3(Op3,RegWrite3,MemWrite3,RegConcat3);
    mem_access_decoder td4(Op4,RegWrite4,MemWrite4,RegConcat4);

    ALU_decoder ad1(Op1, Funct1, ALUOp1, ALUControl1);
    ALU_decoder ad2(Op2, Funct2, ALUOp2, ALUControl2);

endmodule




module fisrt_decoder
    (input wire [5:0] Op1,
     output wire Leavelink1,
     output wire RegWrite1,
     output wire [1:0] Branch1,
     output wire [4:0] FPUControl1,
     output wire [2:0] ALUSrc1,
     output wire RegDst1,
     output wire Bi1,
     output wire [1:0] Blt1,
     output wire [1:0] Lui_Ori1,
     output wire [2:0] RegConcat1,
     output wire RegtoPC1,
     output wire Out1,
     output wire [1:0] ALUOp1
     );

    assign {Leavelink1,RegWrite1,Branch1,FPUControl1,ALUSrc1,RegDst1,Bi1,Blt1,Lui_Ori1,RegConcat1,RegtoPC1,Out1,ALUOp1}
        = (Op1 == 6'b000000) ? {2'b01,2'd0,5'd0,3'b000,2'b10,2'b00,2'b00,3'b000,2'b00,2'b11} //R-type
        :((Op1 == 6'b000001) ? {2'b01,2'd0,5'd0,3'b011,2'b00,2'b00,2'b00,3'b000,2'b00,2'b00} //addi
        :((Op1 == 6'b000010) ? {2'b01,2'd0,5'd0,3'b001,2'b10,2'b00,2'b00,3'b000,2'b00,2'b00} //sll
        :((Op1 == 6'b000011) ? {2'b01,2'd0,5'd0,3'b010,2'b10,2'b00,2'b00,3'b000,2'b00,2'b00} //slr
        :((Op1== 6'b000100) ? {2'b01,2'd0,5'd0,3'b011,2'b00,2'b00,2'b01,3'b000,2'b00,2'b10} //ori
        :((Op1 == 6'b000101) ? {2'b01,2'd0,5'd0,3'b011,2'b00,2'b00,2'b10,3'b000,2'b00,2'b00} //lui
        :((Op1 == 6'b001000) ? {2'b01,2'd0,5'd0,3'b100,2'b00,2'b00,2'b00,3'b000,2'b00,2'b00} //in
        :((Op1 == 6'b001001) ? {2'b01,2'd0,5'd0,3'b100,2'b00,2'b00,2'b00,3'b010,2'b00,2'b00} //fin
        :((Op1 == 6'b001010) ? {2'b00,2'd0,5'd0,3'b000,2'b00,2'b00,2'b00,3'b000,2'b01,2'b00} //out
        :((Op1 == 6'b001011) ? {2'b01,2'd0,5'b00001,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fadd
        :((Op1 == 6'b001100) ? {2'b01,2'd0,5'b00011,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fsub
        :((Op1 == 6'b001101) ? {2'b01,2'd0,5'b00101,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fmul
        :((Op1 == 6'b001110) ? {2'b01,2'd0,5'b00111,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fdiv
        :((Op1 == 6'b001111) ? {2'b01,2'd0,5'b01001,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fneg
        :((Op1 == 6'b010000) ? {2'b01,2'd0,5'b01011,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fabs
        :((Op1 == 6'b010001) ? {2'b01,2'd0,5'b01101,3'b000,2'b10,2'b00,2'b00,3'b111,2'b00,2'b00} //fsqrt
        :((Op1 == 6'b010011) ? {2'b01,2'd0,5'b01111,3'b000,2'b00,2'b00,2'b00,3'b111,2'b00,2'b00} //fmov
        :((Op1 == 6'b010110) ? {2'b01,2'd0,5'b10001,3'b000,2'b00,2'b00,2'b00,3'b100,2'b00,2'b00} //ftoi
        :((Op1 == 6'b010111) ? {2'b01,2'd0,5'b10011,3'b000,2'b00,2'b00,2'b00,3'b011,2'b00,2'b00} //itof
        :((Op1 == 6'b011000) ? {2'b01,2'd0,5'b10101,3'b000,2'b00,2'b00,2'b00,3'b111,2'b00,2'b00} //floor
        :((Op1 == 6'b100000) ? {2'b00,2'd0,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b00,2'b00} //jump
        :((Op1 == 6'b100001) ? {2'b11,2'd0,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b00,2'b00} //jal
        :((Op1 == 6'b100010) ? {2'b00,2'd0,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b10,2'b00} //jr
        :((Op1 == 6'b100011) ? {2'b11,2'd0,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b10,2'b00} //jalr
        :((Op1 == 6'b100100) ? {2'b00,2'b01,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b00,2'b00} //beq
        :((Op1 == 6'b100101) ? {2'b00,2'b11,5'd0,3'b000,2'b00,2'b00,2'b00,3'd0,2'b00,2'b00} //bne
        :((Op1 == 6'b100110) ? {2'b00,2'b01,5'd0,3'b000,2'b00,2'b01,2'b00,3'd0,2'b00,2'b00} //blt
        :((Op1 == 6'b100111) ? {2'b00,2'b01,5'd0,3'b000,2'b00,2'b00,2'b00,3'b110,2'b00,2'b00} //fbeq
        :((Op1 == 6'b101000) ? {2'b00,2'b11,5'd0,3'b000,2'b00,2'b00,2'b00,3'b110,2'b00,2'b00} //fbne
        :((Op1 == 6'b101001) ? {2'b00,2'b01,5'd0,3'b000,2'b00,2'b10,2'b00,3'b111,2'b00,2'b00} //fblt
        :((Op1 == 6'b110000) ? {2'b00,2'b01,5'd0,3'b000,2'b01,2'b00,2'b00,3'd0,2'b00,2'b00} //beqi
        :((Op1 == 6'b111000) ? {2'b00,2'b01,5'd0,3'b000,2'b01,2'b01,2'b00,3'd0,2'b00,2'b00} //blti
        :27'd0)))))))))))))))))))))))))))))));

endmodule




module second_decoder
    (input wire [5:0] Op2,
     output wire RegWrite2,
     output wire [4:0] FPUControl2,
     output wire [1:0] ALUSrc2,
     output wire RegDst2,
     output wire [1:0] Lui_Ori2,
     output wire [2:0] RegConcat2,
     output wire [1:0] ALUOp2
     );

    assign {RegWrite2,FPUControl2,ALUSrc2,RegDst2,Lui_Ori2,RegConcat2,ALUOp2}
        = (Op2 == 6'b000000) ? {1'b1,5'd0,2'b00,1'b1,2'b00,3'b000,2'b11} //R-type
        :((Op2 == 6'b000001) ? {1'b1,5'd0,2'b11,1'b0,2'b00,3'b000,2'b00} //addi
        :((Op2 == 6'b000010) ? {1'b1,5'd0,2'b01,1'b1,2'b00,3'b000,2'b00} //sll
        :((Op2 == 6'b000011) ? {1'b1,5'd0,2'b10,1'b1,2'b00,3'b000,2'b00} //slr
        :((Op2 == 6'b000100) ? {1'b1,5'd0,2'b11,1'b0,2'b01,3'b000,2'b10} //ori
        :((Op2 == 6'b000101) ? {1'b1,5'd0,2'b11,1'b0,2'b10,3'b000,2'b00} //lui
        :((Op2 == 6'b001011) ? {1'b1,5'b00001,2'b00,1'b1,2'b00,3'b111,2'b00} //fadd
        :((Op2 == 6'b001100) ? {1'b1,5'b00011,2'b00,1'b1,2'b00,3'b111,2'b00} //fsub
        :((Op2 == 6'b001101) ? {1'b1,5'b00101,2'b00,1'b1,2'b00,3'b111,2'b00} //fmul
        :((Op2 == 6'b001110) ? {1'b1,5'b00111,2'b00,1'b1,2'b00,3'b111,2'b00} //fdiv
        :((Op2 == 6'b001111) ? {1'b1,5'b01001,2'b00,1'b1,2'b00,3'b111,2'b00} //fneg
        :((Op2 == 6'b010000) ? {1'b1,5'b01011,2'b00,1'b1,2'b00,3'b111,2'b00} //fabs
        :((Op2 == 6'b010001) ? {1'b1,5'b01101,2'b00,1'b1,2'b00,3'b111,2'b00} //fsqrt
        :((Op2 == 6'b010011) ? {1'b1,5'b01111,2'b00,1'b0,2'b00,3'b111,2'b00} //fmov
        :((Op2 == 6'b010110) ? {1'b1,5'b10001,2'b00,1'b0,2'b00,3'b100,2'b00} //ftoi
        :((Op2 == 6'b010111) ? {1'b1,5'b10011,2'b00,1'b0,2'b00,3'b011,2'b00} //itof
        :((Op2 == 6'b011000) ? {1'b1,5'b10101,2'b00,1'b0,2'b00,3'b111,2'b00} //floor
        :17'd0))))))))))))))));

endmodule




module mem_access_decoder
    (input wire [5:0] Op,
     output wire RegWrite,
     output wire MemWrite,
     output wire [2:0] RegConcat
     );

    assign {RegWrite,MemWrite,RegConcat} =
        (Op == 6'b000110) ? {1'b1,1'b0,3'd0} // lw
        : ((Op == 6'b000111) ? {1'b0,1'b1,3'd0} // sw
        : ((Op == 6'b010100) ? {1'b1,1'b0,3'b010} // flw
        : ((Op == 6'b010101) ? {1'b0,1'b1,3'b010} // fsw
        : 5'd0)));

endmodule




module ALU_decoder
    (input wire [5:0] Op,
     input wire [5:0] Funct,
     input wire [1:0] ALUOp,
     output wire [2:0] ALUControl
     );

    assign {ALUControl} = (ALUOp == 2'b00) ? 3'b010 //Opcodeフィールドですでにaddと判明してるケース
                                   : ((ALUOp == 2'b01) ? 3'b110 //Opcodeフィールドですでにsubtractと判明してるケース
                                   : ((ALUOp == 2'b10) ? 3'b001 //Opcodeフィールドですでにorと判明してるケース
                                   : ((Funct == 6'b100000) ? 3'b010 //add命令
                                   : ((Funct == 6'b100010) ? 3'b110 //subtract命令
                                   : ((Funct == 6'b100100) ? 3'b000 //and命令??��?��?
                                   : ((Funct == 6'b100101) ? 3'b001 //or命令??��?��?
                                  // : ((Funct == 6'b101010) ? 3'b111 //slt命令??��?��?
                                   : 3'b0)))))); //else. とりま全30に??��?��?

endmodule


`default_nettype wire

