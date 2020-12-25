`timescale 1ns / 100ps
`default_nettype none

module control_unit
    (input wire [5:0] Op,
     input wire [5:0] Funct,
     output wire RegWrite,
     output wire RegDst,
     output wire ALUSrc,
     output wire Branch,
     output wire MemWrite,
     output wire MemtoReg,
     output wire Jump,
     output wire LeaveLink,
     output wire ToggleEqual,
     output wire RegtoPC,
     output wire Bi,
     output wire [1:0] Blt,
     output wire Lui,
     output wire Ori,
     output wire In,
     output wire Out,
     output wire [1:0] Shift,
     output wire [2:0] ALUControl,
     output wire [4:0] FPUControl,
     output wire [2:0] RegConcat
     );

    wire [1:0] ALUOp;

    main_decoder md(Op,RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump, LeaveLink, ToggleEqual, RegtoPC, Bi, Blt, Lui, Ori, In, Out, Shift, FPUControl, RegConcat);
    ALU_decoder ad(Op, Funct, ALUOp, ALUControl);

endmodule


module main_decoder
    (input wire [5:0] Op,
     output wire RegWrite,
     output wire RegDst,
     output wire ALUSrc,
     output wire Branch,
     output wire MemWrite,
     output wire MemtoReg,
     output wire [1:0] ALUOp,
     output wire Jump,
     output wire LeaveLink,
     output wire ToggleEqual,
     output wire RegtoPC,
     output wire Bi,
     output wire [1:0] Blt,
     output wire Lui,
     output wire Ori,
     output wire In,
     output wire Out,
     output wire [1:0] Shift,
     output wire [4:0] FPUControl,
     output wire [2:0] RegConcat);

    assign {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump, LeaveLink, ToggleEqual,RegtoPC,Bi,Blt,Lui,Ori,In,Out,Shift,FPUControl,RegConcat}
                         = (Op == 6'b000000) ? {19'b1100001100000000000,2'd0,5'd0,3'd0} //R-type. 命令の詳細はfunctフィールド�??��解読をするしかな?��?ので、ALUOpは0b10に?��?(?��?ィジタル回路設?��?p363参�??��)

                        : ((Op == 6'b000001) ? {19'b1010000000000000000,2'd0,5'd0,3'd0}  //addi.
                        : ((Op == 6'b000010) ? {19'b1100000000000000000,2'b10,5'd0,3'd0}  //sll.
                        : ((Op == 6'b000011) ? {19'b1100000000000000000,2'b11,5'd0,3'd0}  //srl.
                        : ((Op == 6'b000100) ? {19'b1010001000000000100,2'd0,5'd0,3'd0}  //ori.
                        : ((Op == 6'b000101) ? {19'b1010000000000001000,2'd0,5'd0,3'd0}  //lui.
                        : ((Op == 6'b000110) ? {19'b1010010000000000000,2'd0,5'd0,3'd0}  //lw. よってRegWrite, ALUSrc, MemtoReg?��?け立て、アドレスのオフセ?��?ト計算に足し算を使?��?のでALUOpは0b00?��?
                        : ((Op == 6'b000111) ? {19'b0010100000000000000,2'd0,5'b0,3'd0} //sw. よってALUSrc, MemWrite?��?け立てて、RegDst, MemtoRegはどちらでもよ?��?ので不定�??��xに。アドレスのオフセ?��?ト計算に足し算を使?��?のでALUOpは0b00?��?
                        : ((Op == 6'b001000) ? {19'b1000000000000000010,2'd0,5'd0,3'b000} //in
                        : ((Op == 6'b001001) ? {19'b1000000000000000010,2'd0,5'd0,3'b011} //fin
                        : ((Op == 6'b001010) ? {19'b0000000000000000001,2'd0,5'd0,3'b000} //out
                        : ((Op == 6'b001011) ? {19'b1100000000000000000,2'd0,5'b00001,3'b111} //fadd
                        : ((Op == 6'b001100) ? {19'b1100000000000000000,2'd0,5'b00011,3'b111}  //fsub
                        : ((Op == 6'b001101) ? {19'b1100000000000000000,2'd0,5'b00101,3'b111}  //fmul
                        : ((Op == 6'b001110) ? {19'b1100000000000000000,2'd0,5'b00111,3'b111}  //fdiv
                        : ((Op == 6'b001111) ? {19'b1100000000000000000,2'd0,5'b01001,3'b111} //fneg
                        : ((Op == 6'b010000) ? {19'b1100000000000000000,2'd0,5'b01011,3'b111} //fabs
                        : ((Op == 6'b010001) ? {19'b1100000000000000000,2'd0,5'b01101,3'b111} //fsqrt
                        : ((Op == 6'b010011) ? {19'b1000000000000000000,2'd0,5'b01111,3'b111} //fmov
                        : ((Op == 6'b010100) ? {19'b1010010000000000000,2'd0,5'd0,3'b010} //flw
                        : ((Op == 6'b010101) ? {19'b0010100000000000000,2'd0,5'd0,3'b010} //fsw
                        : ((Op == 6'b010110) ? {19'b1000000000000000000,2'd0,5'b10001,3'b100} //ftoi
                        : ((Op == 6'b010111) ? {19'b1000000000000000000,2'd0,5'b10011,3'b011} //itof
                        : ((Op == 6'b011000) ? {19'b1000000000000000000,2'd0,5'b10101,3'b111} //floor
                        : ((Op == 6'b100000) ? {19'b0000000010000000000,2'd0,5'd0,3'd0}  //jump.
                        : ((Op == 6'b100001) ? {19'b1000000011000000000,2'd0,5'd0,3'd0}  //jal.
                        : ((Op == 6'b100010) ? {19'b0000000010010000000,2'd0,5'd0,3'd0}  //jr.
                        : ((Op == 6'b100011) ? {19'b1000000011010000000,2'd0,5'd0,3'd0}  //jalr.
                        : ((Op == 6'b100100) ? {19'b0001000000000000000,2'd0,5'd0,3'd0}  //beq.
                        : ((Op == 6'b100101) ? {19'b0001000000100000000,2'd0,5'd0,3'd0} //bne. beq命令とほぼ同じ?��?が�??��ALUのZero bitの01を�??��れ替えた?��?。よってそ�??��ためのToggleEqualビットを立てる�??
                        : ((Op == 6'b100110) ? {19'b0001000000000010000,2'd0,5'd0,3'd0}   //blt.
                        : ((Op == 6'b100111) ? {19'b0001000000000000000,2'd0,5'd0,3'b110} //fbeq
                        : ((Op == 6'b101000) ? {19'b0001000000100000000,2'd0,5'd0,3'b110} //fbne
                        : ((Op == 6'b101001) ? {19'b0001000000000100000,2'd0,5'd0,3'b111} //fblt
                        : ((Op == 6'b110000) ? {19'b0001000000001000000,2'd0,5'd0,3'd0}  //beqi.
                        : ((Op == 6'b111000) ? {19'b0001000000001010000,2'd0,5'd0,3'd0}  //blti.
                        : 22'b0))))))))))))))))))))))))))))))))))); //else。と�?0ま全部0に?��?

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
                                   : ((Funct == 6'b100100) ? 3'b000 //and命令?��?
                                   : ((Funct == 6'b100101) ? 3'b001 //or命令?��?
                                  // : ((Funct == 6'b101010) ? 3'b111 //slt命令?��?
                                   : 3'b0)))))); //else. とりま全30に?��?

endmodule


`default_nettype wire

