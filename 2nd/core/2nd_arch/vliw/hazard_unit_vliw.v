`timescale 1ns / 100ps
`default_nettype none

module hazard_unit_vliw(
    input wire          clk,
    input wire          rstn,
    input wire          Rx_ready,
    input wire          InD1,
    input wire [1:0]    BranchD1,
    input wire          BiD1,
    input wire [1:0]    BranchE1,
    input wire          BiE1,
    input wire [5:0]    rsD1,
    input wire [5:0]    rtD1,
    input wire [5:0]    rsD2,
    input wire [5:0]    rtD2,
    input wire [5:0]    rsD3,
    input wire [5:0]    rtD3,
    input wire [5:0]    rsD4,
    input wire [5:0]    rtD4,
    input wire [5:0]    rsE1,
    input wire [5:0]    rtE1,
    input wire [5:0]    writeRegE1,
    input wire [5:0]    rsE2,
    input wire [5:0]    rtE2,
    input wire [5:0]    writeRegE2,
    input wire [5:0]    rsE3,
    input wire [5:0]    writeRegE3, // == rtE3
    input wire [5:0]    rsE4,
    input wire [5:0]    writeRegE4, // == rtE4
    input wire [5:0]    rsM1,
    input wire [5:0]    rtM1,
    input wire [5:0]    writeRegM1,
    input wire [5:0]    writeRegM2,
    input wire [5:0]    writeRegM3,
    input wire [5:0]    writeRegM4,
    input wire [5:0]    writeRegW3,
    input wire [5:0]    writeRegW4,
    input wire [5:0]    writeRegKept1,
    input wire [5:0]    writeRegKept2,
    input wire [5:0]    writeRegKept3,
    input wire [5:0]    writeRegKept4,
    input wire          RegWriteE1,
    input wire          RegWriteE2,
    input wire          RegWriteE3,
    input wire          RegWriteE4,
    input wire          RegWriteM1,
    input wire          RegWriteM2,
    input wire          RegWriteM3,
    input wire          RegWriteM4,
    input wire          RegWriteW3,
    input wire          RegWriteW4,
    input wire          RegWriteKept1,
    input wire          RegWriteKept2,
    input wire          RegWriteKept3,
    input wire          RegWriteKept4,
    input wire          RegtoPCD1,
    input wire  [4:0]   FPUControlE1,
    input wire  [4:0]   FPUControlE2,
    output wire         StallF,
    output wire         StallD,
    output wire         StallE,
    output wire         Hazard_existenceD1,
    output wire         Hazard_existenceE1,
    output wire         FlushE,
    output wire         FlushM,
    output wire [3:0]   ForwardaE1,
    output wire [3:0]   ForwardbE1,
    output wire [3:0]   ForwardaE2,
    output wire [3:0]   ForwardbE2,
    output wire [3:0]   ForwardaE3,
    output wire [3:0]   ForwardbE3,
    output wire [3:0]   ForwardaE4,
    output wire [3:0]   ForwardbE4,
    output wire [1:0]   ForwardaM1,
    output wire [1:0]   ForwardbM1,
    output wire         Read_data_keep
);
wire lwstall;
wire jrstall;
wire floatstall;
wire install;
reg fstalled;

assign StallF = lwstall || jrstall || floatstall || install;
assign StallD = lwstall || jrstall || floatstall || install;
assign StallE = floatstall;
assign FlushM = floatstall;
assign FlushE = lwstall || jrstall || install;


assign ForwardaE1 = ((rsE1 != 0) && (rsE1 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rsE1 != 0) && (rsE1 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rsE1 != 0) && (rsE1 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rsE1 != 0) && (rsE1 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rsE1 != 0) && (rsE1 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rsE1 != 0) && (rsE1 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rsE1 != 0) && (rsE1 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rsE1 != 0) && (rsE1 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));
assign ForwardbE1 = ((rtE1 != 0) && (rtE1 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rtE1 != 0) && (rtE1 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rtE1 != 0) && (rtE1 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rtE1 != 0) && (rtE1 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rtE1 != 0) && (rtE1 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rtE1 != 0) && (rtE1 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rtE1 != 0) && (rtE1 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rtE1 != 0) && (rtE1 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));

assign ForwardaE2 = ((rsE2 != 0) && (rsE2 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rsE2 != 0) && (rsE2 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rsE2 != 0) && (rsE2 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rsE2 != 0) && (rsE2 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rsE2 != 0) && (rsE2 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rsE2 != 0) && (rsE2 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rsE2 != 0) && (rsE2 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rsE2 != 0) && (rsE2 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));
assign ForwardbE2 = ((rtE2 != 0) && (rtE2 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rtE2 != 0) && (rtE2 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rtE2 != 0) && (rtE2 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rtE2 != 0) && (rtE2 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rtE2 != 0) && (rtE2 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rtE2 != 0) && (rtE2 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rtE2 != 0) && (rtE2 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rtE2 != 0) && (rtE2 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));

assign ForwardaE3 = ((rsE3 != 0) && (rsE3 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rsE3 != 0) && (rsE3 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rsE3 != 0) && (rsE3 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rsE3 != 0) && (rsE3 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rsE3 != 0) && (rsE3 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rsE3 != 0) && (rsE3 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rsE3 != 0) && (rsE3 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rsE3 != 0) && (rsE3 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));
assign ForwardbE3 = ((writeRegE3 != 0) && (writeRegE3 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((writeRegE3 != 0) && (writeRegE3 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));

assign ForwardaE4 = ((rsE4 != 0) && (rsE4 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((rsE4 != 0) && (rsE4 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((rsE4 != 0) && (rsE4 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((rsE4 != 0) && (rsE4 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((rsE4 != 0) && (rsE4 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((rsE4 != 0) && (rsE4 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((rsE4 != 0) && (rsE4 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((rsE4 != 0) && (rsE4 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));
assign ForwardbE4 = ((writeRegE4 != 0) && (writeRegE4 == writeRegKept3) && RegWriteKept3 && fstalled) ? 4'b0101
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegKept4) && RegWriteKept4 && fstalled) ? 4'b0110
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegKept1) && RegWriteKept1 && fstalled) ? 4'b1000
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegKept2) && RegWriteKept2 && fstalled) ? 4'b1001
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegM1) && RegWriteM1) ? 4'b0001
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegM2) && RegWriteM2) ? 4'b0010
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegW3) && RegWriteW3) ? 4'b0011
                    :(((writeRegE4 != 0) && (writeRegE4 == writeRegW4) && RegWriteW4) ? 4'b0100
                    : 4'd0)))))));

assign ForwardaM1 = ((rsM1 != 0) && (rsM1 == writeRegW3) && RegWriteW3) ? 2'b01
                    :(((rsM1 != 0) && (rsM1 == writeRegW4) && RegWriteW4) ? 2'b10
                    : 2'd0);
assign ForwardbM1 = ((rtM1 != 0) && (rtM1 == writeRegW3) && RegWriteW3) ? 2'b01
                    :(((rtM1 != 0) && (rtM1 == writeRegW4) && RegWriteW4) ? 2'b10
                    : 2'd0);

assign Hazard_existenceE1 = BranchE1[0] && BiE1 && (RegWriteM3 && (writeRegM3 == rsE1)) ? 1'b1 //branch immidiate type instruction
                            : (BranchE1[0] && BiE1 && (RegWriteM4 && (writeRegM4 == rsE1)) ? 1'b1
                            : (BranchE1[0] && !BiE1 && (RegWriteM3 && (writeRegM3 == rsE1 || writeRegM3 == rtE1)) ? 1'b1
                            : (BranchE1[0] && !BiE1 && (RegWriteM4 && (writeRegM4 == rsE1 || writeRegM4 == rtE1)) ? 1'b1
                            : 1'b0)));


assign Hazard_existenceD1 = (BranchD1[0] && BiD1 && ((RegWriteE1 && (writeRegE1 == rsD1)) || (RegWriteE2 && (writeRegE2 == rsD1)))) ? 1'b1 //branch immidiate type instruction
                            :((BranchD1[0] && BiD1 && ((RegWriteE3 && (writeRegE3 == rsD1)) || (RegWriteM3 && (writeRegM3 == rsD1)))) ? 1'b1
                            :((BranchD1[0] && BiD1 && ((RegWriteE4 && (writeRegE4 == rsD1)) || (RegWriteM4 && (writeRegM4 == rsD1)))) ? 1'b1
                            : (BranchD1[0] && !BiD1 && ((RegWriteE1 && (writeRegE1 == rsD1 || writeRegE1 == rtD1)) || (RegWriteE2 && (writeRegE2 == rsD1 || writeRegE2 == rtD1))) ? 1'b1
                            : (BranchD1[0] && !BiD1 && ((RegWriteE3 && (writeRegE3 == rsD1 || writeRegE3 == rtD1)) || (RegWriteM3 && (writeRegM3 == rsD1 || writeRegM3 == rtD1))) ? 1'b1
                            : (BranchD1[0] && !BiD1 && ((RegWriteE4 && (writeRegE4 == rsD1 || writeRegE4 == rtD1)) || (RegWriteM4 && (writeRegM4 == rsD1 || writeRegM4 == rtD1))) ? 1'b1
                            : 1'b0)))));

wire lwstall3,lwstall4;
assign lwstall3 = (((rsD1 != 0 && rsD1 == writeRegE3) || (rtD1 != 0 && rtD1 == writeRegE3)) && RegWriteE3 && !BranchD1[0]) ? 1'b1
                :((((rsD2 != 0 && rsD2 == writeRegE3) || (rtD2 != 0 && rtD2 == writeRegE3)) && RegWriteE3) ? 1'b1
                :((((rsD3 != 0 && rsD3 == writeRegE3) || (rtD3 != 0 && rtD3 == writeRegE3)) && RegWriteE3) ? 1'b1
                :((((rsD4 != 0 && rsD4 == writeRegE3) || (rtD4 != 0 && rtD4 == writeRegE3)) && RegWriteE3) ? 1'b1
                :1'b0)));

assign lwstall4 = (((rsD1 != 0 && rsD1 == writeRegE4) || (rtD1 != 0 && rtD1 == writeRegE4)) && RegWriteE4 && !BranchD1[0]) ? 1'b1
                :((((rsD2 != 0 && rsD2 == writeRegE4) || (rtD2 != 0 && rtD2 == writeRegE4)) && RegWriteE4) ? 1'b1
                :((((rsD3 != 0 && rsD3 == writeRegE4) || (rtD3 != 0 && rtD3 == writeRegE4)) && RegWriteE4) ? 1'b1
                :((((rsD4 != 0 && rsD4 == writeRegE4) || (rtD4 != 0 && rtD4 == writeRegE4)) && RegWriteE4) ? 1'b1
                :1'b0)));

assign lwstall = lwstall3 || lwstall4;

assign jrstall = ((rsD1 == writeRegE1) && RegWriteE1 && RegtoPCD1) ? 1'b1
                :(((rsD1 == writeRegE2) && RegWriteE2 && RegtoPCD1) ? 1'b1
                :(((rsD1 == writeRegE3) && RegWriteE3 && RegtoPCD1) ? 1'b1
                :(((rsD1 == writeRegM3) && RegWriteM3 && RegtoPCD1) ? 1'b1
                :(((rsD1 == writeRegE4) && RegWriteE4 && RegtoPCD1) ? 1'b1
                :(((rsD1 == writeRegM4) && RegWriteM4 && RegtoPCD1) ? 1'b1
                : 1'b0)))));

assign install = (InD1 && !Rx_ready) ? 1'b1 : 1'b0;


wire [4:0] fstallN1; //wait for "fstallN" clocks
wire [4:0] fstallN2; //wait for "fstallN" clocks
wire [4:0] floatstall1;
wire [4:0] floatstall2;
reg [4:0] counter1;
reg [4:0] counter2;

always @(posedge clk) begin
    if(~rstn)begin
        counter1 <= 0;
        counter2 <= 0;
        fstalled <= 0;
    end else begin
        if (fstallN1 != counter1) begin
            counter1 <= counter1 + 1;
        end else if(fstallN1 == counter1 && fstallN2 == counter2)begin
            counter1 <= 0;
        end
        if (fstallN2 != counter2) begin
            counter2 <= counter2 + 1;
        end else if(fstallN1 == counter1 && fstallN2 == counter2)begin
            counter2 <= 0;
        end
        if(fstallN1 != counter1 || fstallN2 != counter2) begin
            fstalled <= 1'b1;
        end else begin
            fstalled <= 1'b0;
        end
    end
end

assign floatstall1 = (counter1 == fstallN1) ? 1'b0 : 1'b1; //wait until counter reaches fstallN
assign floatstall2 = (counter2 == fstallN2) ? 1'b0 : 1'b1; //wait until counter reaches fstallN
assign floatstall = floatstall1 || floatstall2;


assign fstallN1 = (FPUControlE1 == 5'b00001) ? 5'd1 //fadd
                        :((FPUControlE1 == 5'b00011) ? 5'd1 //fsub
                        :((FPUControlE1 == 5'b00101) ? 5'd1 //fmul
                        :((FPUControlE1 == 5'b00111) ? 5'd3 //fdiv
                        :((FPUControlE1 == 5'b01001) ? 5'd0 //fneg
                        :((FPUControlE1 == 5'b01011) ? 5'd0 //fabs
                        :((FPUControlE1 == 5'b01101) ? 5'd2 //fsqrt
                        :((FPUControlE1 == 5'b01111) ? 5'd0 //fmov
                        :((FPUControlE1 == 5'b10001) ? 5'd0 //ftoi
                        :((FPUControlE1 == 5'b10011) ? 5'd0 //itof
                        :((FPUControlE1 == 5'b10101) ? 5'd0 //floor
                        : 5'd0))))))))));

assign fstallN2 = (FPUControlE2 == 5'b00001) ? 5'd1 //fadd
                        :((FPUControlE2 == 5'b00011) ? 5'd1 //fsub
                        :((FPUControlE2 == 5'b00101) ? 5'd1 //fmul
                        :((FPUControlE2 == 5'b00111) ? 5'd3 //fdiv
                        :((FPUControlE2 == 5'b01001) ? 5'd0 //fneg
                        :((FPUControlE2 == 5'b01011) ? 5'd0 //fabs
                        :((FPUControlE2 == 5'b01101) ? 5'd2 //fsqrt
                        :((FPUControlE2 == 5'b01111) ? 5'd0 //fmov
                        :((FPUControlE2 == 5'b10001) ? 5'd0 //ftoi
                        :((FPUControlE2 == 5'b10011) ? 5'd0 //itof
                        :((FPUControlE2 == 5'b10101) ? 5'd0 //floor
                        : 5'd0))))))))));

assign Read_data_keep = (counter1 == 0 && counter2 == 0 && floatstall) ? 1'b1 : 1'b0;

endmodule

`default_nettype wire