`timescale 1ns / 100ps
`default_nettype none

module control_unit
    (input wire [5:0] Op,
     input wire [5:0] Funct,
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
     output wire ToggleEqual //For bne instr. When it is active, it toggles the "Zero" bit from ALU.
     );
    
    wire [1:0] for_ALUOp;
    wire Jump_tmp; // the temporary jump wire due to jr instruction

    //制御ユニットはメインデコーダとALUデコーダに分けられる。何命令か見分けるには命令32bitのうち、上位6bitのopcodeフィールドと、下位6bitのfunctフィールドだけを見ればよい。
    //基本はopcodeフィールドだけで判断できる(ALUの何算の結果を出力すべきか決定できる)のだが、opcodeが0のR形式命令の時だけは、functフィールドも見ないと判断できない（ALUの何算を出力すべきかを決定できない）
    //main_decoderは、opcodeフィールドの解読を担当し、ALU_decoderはfunctフィールドの解読を担当する。こう分けることで、ALUを使わないような命令だったら、functフィールドの解読を待たずに、opcodeだけ見てさっさと次にいける。
    main_decoder md(Op, for_ALUOp, LeaveLink, Jump_tmp, MemtoReg, MemWrite, Branch, ToggleEqual, ALUSrc, RegDst, RegWrite);
    ALU_decoder ad(Op, Funct, for_ALUOp, Jump_tmp, ALUControl, RegtoPC, Jump);

endmodule


module main_decoder
    (input wire [5:0] Op,
     output wire [1:0] ALUOp,
     output wire LeaveLink, //jal命令専用。
     output wire Jump_tmp,
     output wire MemtoReg,
     output wire MemWrite,
     output wire Branch,
     output wire ToggleEqual,
     output wire ALUSrc,
     output wire RegDst,
     output wire RegWrite);

    assign {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump_tmp, LeaveLink, ToggleEqual}
                         = (Op == 6'b000000) ? 11'b1100001000x  //Opcodeが0b000000の時は問答無用でR形式命令。命令の詳細はfunctフィールドの解読をするしかないので、ALUOpは0b10に。(ディジタル回路設計p363参照)
                        : ((Op == 6'b100011) ? 11'b1010010000x  //Opcodeが0b100011の時はlw命令。よってRegWrite, ALUSrc, MemtoRegだけ立て、アドレスのオフセット計算に足し算を使うのでALUOpは0b00。
                        : ((Op == 6'b101011) ? 11'b0x10100000x  //Opcodeが0b101011の時はsw命令。よってALUSrc, MemWriteだけ立てて、RegDst, MemtoRegはどちらでもよいので不定値xに。アドレスのオフセット計算に足し算を使うのでALUOpは0b00。
                        : ((Op == 6'b000100) ? 11'b0x010x01000  //Opcodeが0b000100の時はbeq命令。よってBranchだけ立てて、イコールの判断は差が0かで行うので、ALUOpは引き算を表す0b01。
                        : ((Op == 6'b000101) ? 11'b0x010001001  //Opcodeが0b000101の時はbne命令。よってbeq命令とほぼ同じだが、ALUのZero bitの01を入れ替えたい。よってそのためのToggleEqualビットを立てる。
                        : ((Op == 6'b001000) ? 11'b1010000000x  //Opcodeが0b001000の時はaddi命令。よって以下略。(p364参照)
                        : ((Op == 6'b000010) ? 11'b0xx000xx10x  //Opcodeが0b000010の時はjump命令。p365
                        : ((Op == 6'b000011) ? 11'b1xx000xx11x  //Opcodeが0b000011の時はjal命令。
                        : 11'b0))))))); //else。とりま全部0に。
    
endmodule

module ALU_decoder
    (input wire [5:0] Op,
     input wire [5:0] Funct,
     input wire [1:0] ALUOp,
     input wire Jump_tmp,
     output wire [2:0] ALUControl,
     output wire RegtoPC,
     output wire Jump); //jr命令専用。jr命令かどうかはfunctフィールドも見ないとわからないからALUdecoderの管轄
    
    assign {ALUControl, RegtoPC} = (ALUOp == 2'b00) ? 4'b0100 //Opcodeフィールドですでにaddと判明してるケース
                                   : ((ALUOp == 2'b01) ? 4'b1100 //Opcodeフィールドですでにsubtractと判明してるケース
                                   : ((Funct == 6'b100000) ? 4'b0100 //add命令
                                   : ((Funct == 6'b100010) ? 4'b1100 //subtract命令
                                   : ((Funct == 6'b100100) ? 4'b0000 //and命令。
                                   : ((Funct == 6'b100101) ? 4'b0010 //or命令。
                                   : ((Funct == 6'b101010) ? 4'b1110 //slt命令。
                                   : ((Funct == 6'b001000) ? 4'b0101 //jr命令。この時だけRegtoPCを立てて置き、他ではすべて下げる。jr命令がなぜかR形式命令のため、回路を複雑化させないためにはレジスタ書き込みは行わなければならない。よって$raレジスタと$0レジスタをaddして、$raに書き戻す、という無意味な操作をするために、ALUにaddの指示を出す。したがって、このために、jrの機械語形式には注意が必要。
                                   : 4'b0))))))); //else. とりま全部0に。
    assign Jump = (Op == 6'b000000 && Funct == 6'b001000) ? 1 : Jump_tmp; // jump asserts when only jr.

endmodule


`default_nettype wire

