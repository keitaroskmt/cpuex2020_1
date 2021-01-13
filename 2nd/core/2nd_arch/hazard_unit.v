`timescale 1ns / 100ps
`default_nettype none

module hazard_unit(
    input wire          clk,
    input wire          rstn,
    input wire          Rx_ready,
    input wire          InD,
    input wire          BranchD,
    input wire          BiD,
    input wire          BranchE,
    input wire          BiE,
    input wire [5:0]    RsD,
    input wire [5:0]    RtD,
    input wire [5:0]    RsE,
    input wire [5:0]    RtE,
    input wire [5:0]    RsM,
    input wire [5:0]    RtM,
    input wire [5:0]    WriteRegE,
    input wire [5:0]    WriteRegM,
    input wire [5:0]    WriteRegW,
    input wire          MemtoRegE,
    input wire          MemtoRegM,
    input wire          RegWriteE,
    input wire          RegWriteM,
    input wire          RegWriteW,
    input wire          RegtoPCD,
    //input wire          LeavelinkW,
    //input wire          LeavelinkM,
    input wire  [4:0]   FPUControlE,
    output wire         StallF,
    output wire         StallD,
    output wire         StallE,
    output wire         Hazard_existenceD,
    output wire         Hazard_existenceE,
    output wire [1:0]   ForwardAD,
    output wire [1:0]   ForwardBD,
    output wire         FlushE,
    output wire         FlushM,
    output wire [1:0]   ForwardAE,
    output wire [1:0]   ForwardBE,
    output wire         ForwardAM,
    output wire         ForwardBM
);

wire lwstall;
wire branchstall;
wire jrstall;
//wire jrforward;
wire floatstall;
wire install;


assign StallF = lwstall || jrstall || floatstall || install;
assign StallD = lwstall || jrstall || floatstall || install;
assign StallE = floatstall;
assign FlushM = floatstall;
assign FlushE = lwstall || jrstall || install; //|| jrforward;

assign ForwardAM = ((RsM != 0) && (RsM == WriteRegW) && (RegWriteW == 1'b1)) ? 1'b1 : 1'b0;

assign ForwardBM = ((RtM != 0) && (RtM == WriteRegW) && (RegWriteW == 1'b1)) ? 1'b1 : 1'b0;

assign ForwardAE = //((RsE != 4'b0) && (RsE == WriteRegW) && (RegWriteW == 1'b1) && LeavelinkW) ? 2'b11 :
                        //ExSt:addi %ra, %ra, 4 WBSt: jal Label
                         ((RsE != 0) && (RsE == WriteRegM) && (RegWriteM == 1'b1)) ? 2'b10 :
                        //ExSt:add %a0, %a0, %a1  MASt:add %a1, %a1, %a2
                        (((RsE != 0) && (RsE == WriteRegW) && (RegWriteW == 1'b1)) ? 2'b01 :
                        //ExSt:add %a0, %a0, %a1  WBSt:add %a1, %a1, %a2
                          2'b00);

assign ForwardBE = //((RtE != 0) && (RtE == WriteRegW) && RegWriteW && LeavelinkW) ? 2'b11 :
                         ((RtE != 0) && (RtE == WriteRegM) && RegWriteM) ? 2'b10 :
                        (((RtE != 0) && (RtE == WriteRegW) && RegWriteW) ? 2'b01 :
                          2'b00 );


assign ForwardAD = ((RsD != 0) && (RsD == WriteRegM) && RegWriteM ) ? 2'b01 : 2'b00;
                        //Dest:add %a0, %a0, %a1 MA:add %a1, %a1, %a2
                        //:((LeavelinkM && (RsD == 5'd31) && RegWriteM) ? 2'b10 : 2'b00);
                        //Dest:add %ra, %a0, %a1 MA:jal Label

assign ForwardBD = ((RtD != 0) && (RtD == WriteRegM) && RegWriteM ) ? 2'b01 : 2'b00;
                        //((LeavelinkM && (RtD == 5'd31) && RegWriteM) ? 2'b10 : 2'b00);


//assign branchstall = ((BranchD == 1'b1)&& (RegWriteE == 1'b1) && ((WriteRegE == RsD) || (WriteRegE == RtD)))
                        ////DeSt:beq %a0, %a1, Label ExSt:add %a0, %a0, %a1
                    //|| ((BranchD == 1'b1) && (MemtoRegM == 1'b1) && ((WriteRegM == RsD) || (WriteRegM == RtD)));
                        ////DeSt:beq %a0, %a1, Label MASt:lw %a1, 4(sp)         �?If lw is in MA stage the value will be written back in reg file in the next stage <-Write First premised. Using BRAM it will be more complexed.

assign lwstall = (((RsD == RtE) || (RtD == RtE)) && MemtoRegE && !BranchD); //when a branch-type instruction is in the decode stage, it will be treated by "Hazard_existence" -> not necessary to be treated here by "lwstall"
                        //DeSt:add %a0, %a0, %a1 ExSt:lw %a0, 0(%sp)  using the register right after lw <- Improvement required using BRAM

assign jrstall = (((RsD == WriteRegE) && (RegWriteE == 1'b1) && (RegtoPCD == 1'b1))
                    //DeSt:jr %ra ExSt:addi %ra, %ra, 1
                 || ((RegtoPCD == 1'b1) && (RsD == WriteRegM) && (MemtoRegM == 1'b1)))
                    //DeSt:jr %ra MASt:lw %ra, 4(sp)   If lw is in MA stage the value will be written back in reg file in the next stage <-Write First premised.<-Write First premised. Using BRAM it will be more complicated.
                    ? 1'b1
                    : 1'b0;

assign Hazard_existenceD = BranchD && BiD && ((RegWriteE && (WriteRegE == RsD)) || (MemtoRegM && (WriteRegM == RsD))) ? 1'b1 //branch immidiate type instruction
                            : (BranchD && !BiD && ((RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)) || (MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD))) ? 1'b1
                            : 1'b0);

assign Hazard_existenceE = BranchE && BiE && (MemtoRegM && (WriteRegM == RsE)) ? 1'b1 //branch immidiate type instruction
                            : (BranchE && !BiE && (MemtoRegM && (WriteRegM == RsE || WriteRegM == RtE)) ? 1'b1
                            : 1'b0);
//assign jrforward = ((RsD == WriteRegM) && (RegWriteM  == 1'b1)&& (RegtoPCD == 1'b1)) ? 1'b1 : 1'b0;
                   //DeSt:jr %ra MASt:addi %ra, %ra, 1 �?古�?値を用�?たjr命令(ALUではEx)の結果�?%raレジスタに書き込まれるので%raをまた使おうとするとバグ�? -> jrがR形式でな�?ので解決


wire [4:0] fstallN; //wait for "fstallN" clocks
reg [4:0] counter;
always @(posedge clk) begin
    if(~rstn)begin
        counter <= 0;
    end else begin
        if (fstallN != counter) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
        end
    end
end

assign floatstall = (counter == fstallN) ? 1'b0 : 1'b1; //wait until counter reaches fstallN

assign fstallN = (FPUControlE == 5'b00001) ? 5'd3 //fadd
                        :((FPUControlE == 5'b00011) ? 5'd3 //fsub
                        :((FPUControlE == 5'b00101) ? 5'd2 //fmul
                        :((FPUControlE == 5'b00111) ? 5'd5 //fdiv
                        :((FPUControlE == 5'b01001) ? 5'd0 //fneg
                        :((FPUControlE == 5'b01011) ? 5'd0 //fabs
                        :((FPUControlE == 5'b01101) ? 5'd2 //fsqrt
                        :((FPUControlE == 5'b01111) ? 5'd0 //fmov
                        :((FPUControlE == 5'b10001) ? 5'd1 //ftoi
                        :((FPUControlE == 5'b10011) ? 5'd1 //itof
                        :((FPUControlE == 5'b10101) ? 5'd1 //floor
                        : 5'd0))))))))));


assign install = (InD == 1'b1 && Rx_ready == 1'b0) ? 1'b1 : 1'b0;

endmodule

`default_nettype wire
