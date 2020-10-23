// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Oct 23 00:10:29 2020
// Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/mips_processor_win/mips_processor_win.srcs/sources_1/bd/multi_fib_fpga/ip/multi_fib_fpga_multicycle_cpu_0_0/multi_fib_fpga_multicycle_cpu_0_0_sim_netlist.v
// Design      : multi_fib_fpga_multicycle_cpu_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multi_fib_fpga_multicycle_cpu_0_0,multicycle_cpu,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "multicycle_cpu,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module multi_fib_fpga_multicycle_cpu_0_0
   (clk,
    rstn,
    led);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN multi_fib_fpga_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  output [7:0]led;

  wire clk;
  wire [7:0]led;
  wire rstn;

  multi_fib_fpga_multicycle_cpu_0_0_multicycle_cpu inst
       (.clk(clk),
        .led(led),
        .rstn(rstn));
endmodule

(* ORIG_REF_NAME = "alu" *) 
module multi_fib_fpga_multicycle_cpu_0_0_alu
   (out2,
    \inst_reg_reg[0] ,
    \pc[31]_i_12_0 ,
    \pc[31]_i_14_0 ,
    \pc[31]_i_13_0 ,
    A,
    DI,
    S,
    \alu_out_reg_reg[15] ,
    \alu_out_reg_reg[15]_0 ,
    \alu_out_reg_reg[23] ,
    \alu_out_reg_reg[23]_0 ,
    \alu_out_reg_reg[31] ,
    Q);
  output [31:0]out2;
  output \inst_reg_reg[0] ;
  output \pc[31]_i_12_0 ;
  output \pc[31]_i_14_0 ;
  output \pc[31]_i_13_0 ;
  input [15:0]A;
  input [6:0]DI;
  input [7:0]S;
  input [7:0]\alu_out_reg_reg[15] ;
  input [7:0]\alu_out_reg_reg[15]_0 ;
  input [0:0]\alu_out_reg_reg[23] ;
  input [7:0]\alu_out_reg_reg[23]_0 ;
  input [7:0]\alu_out_reg_reg[31] ;
  input [2:0]Q;

  wire [15:0]A;
  wire [6:0]DI;
  wire [2:0]Q;
  wire [7:0]S;
  wire [7:0]\alu_out_reg_reg[15] ;
  wire [7:0]\alu_out_reg_reg[15]_0 ;
  wire [0:0]\alu_out_reg_reg[23] ;
  wire [7:0]\alu_out_reg_reg[23]_0 ;
  wire [7:0]\alu_out_reg_reg[31] ;
  wire \inst_reg_reg[0] ;
  wire [31:0]out2;
  wire out2_carry__0_n_0;
  wire out2_carry__0_n_1;
  wire out2_carry__0_n_2;
  wire out2_carry__0_n_3;
  wire out2_carry__0_n_4;
  wire out2_carry__0_n_5;
  wire out2_carry__0_n_6;
  wire out2_carry__0_n_7;
  wire out2_carry__1_n_0;
  wire out2_carry__1_n_1;
  wire out2_carry__1_n_2;
  wire out2_carry__1_n_3;
  wire out2_carry__1_n_4;
  wire out2_carry__1_n_5;
  wire out2_carry__1_n_6;
  wire out2_carry__1_n_7;
  wire out2_carry__2_n_1;
  wire out2_carry__2_n_2;
  wire out2_carry__2_n_3;
  wire out2_carry__2_n_4;
  wire out2_carry__2_n_5;
  wire out2_carry__2_n_6;
  wire out2_carry__2_n_7;
  wire out2_carry_n_0;
  wire out2_carry_n_1;
  wire out2_carry_n_2;
  wire out2_carry_n_3;
  wire out2_carry_n_4;
  wire out2_carry_n_5;
  wire out2_carry_n_6;
  wire out2_carry_n_7;
  wire \pc[31]_i_10_n_0 ;
  wire \pc[31]_i_11_n_0 ;
  wire \pc[31]_i_12_0 ;
  wire \pc[31]_i_12_n_0 ;
  wire \pc[31]_i_13_0 ;
  wire \pc[31]_i_13_n_0 ;
  wire \pc[31]_i_14_0 ;
  wire \pc[31]_i_14_n_0 ;
  wire \pc[31]_i_9_n_0 ;
  wire [7:7]NLW_out2_carry__2_CO_UNCONNECTED;

  CARRY8 out2_carry
       (.CI(A[0]),
        .CI_TOP(1'b0),
        .CO({out2_carry_n_0,out2_carry_n_1,out2_carry_n_2,out2_carry_n_3,out2_carry_n_4,out2_carry_n_5,out2_carry_n_6,out2_carry_n_7}),
        .DI({DI[6:1],A[1],DI[0]}),
        .O(out2[7:0]),
        .S(S));
  CARRY8 out2_carry__0
       (.CI(out2_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out2_carry__0_n_0,out2_carry__0_n_1,out2_carry__0_n_2,out2_carry__0_n_3,out2_carry__0_n_4,out2_carry__0_n_5,out2_carry__0_n_6,out2_carry__0_n_7}),
        .DI(\alu_out_reg_reg[15] ),
        .O(out2[15:8]),
        .S(\alu_out_reg_reg[15]_0 ));
  CARRY8 out2_carry__1
       (.CI(out2_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({out2_carry__1_n_0,out2_carry__1_n_1,out2_carry__1_n_2,out2_carry__1_n_3,out2_carry__1_n_4,out2_carry__1_n_5,out2_carry__1_n_6,out2_carry__1_n_7}),
        .DI({A[8:2],\alu_out_reg_reg[23] }),
        .O(out2[23:16]),
        .S(\alu_out_reg_reg[23]_0 ));
  CARRY8 out2_carry__2
       (.CI(out2_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out2_carry__2_CO_UNCONNECTED[7],out2_carry__2_n_1,out2_carry__2_n_2,out2_carry__2_n_3,out2_carry__2_n_4,out2_carry__2_n_5,out2_carry__2_n_6,out2_carry__2_n_7}),
        .DI({1'b0,A[15:9]}),
        .O(out2[31:24]),
        .S(\alu_out_reg_reg[31] ));
  LUT3 #(
    .INIT(8'hFB)) 
    out2_carry_i_19
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\inst_reg_reg[0] ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pc[31]_i_10 
       (.I0(out2[21]),
        .I1(out2[22]),
        .I2(out2[20]),
        .I3(out2[23]),
        .O(\pc[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pc[31]_i_11 
       (.I0(out2[29]),
        .I1(out2[30]),
        .I2(out2[28]),
        .I3(out2[31]),
        .O(\pc[31]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pc[31]_i_12 
       (.I0(out2[25]),
        .I1(out2[26]),
        .I2(out2[24]),
        .I3(out2[27]),
        .O(\pc[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pc[31]_i_13 
       (.I0(out2[5]),
        .I1(out2[6]),
        .I2(out2[4]),
        .I3(out2[7]),
        .O(\pc[31]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pc[31]_i_14 
       (.I0(out2[12]),
        .I1(out2[13]),
        .I2(out2[14]),
        .I3(out2[15]),
        .O(\pc[31]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \pc[31]_i_3 
       (.I0(\pc[31]_i_9_n_0 ),
        .I1(\pc[31]_i_10_n_0 ),
        .I2(\pc[31]_i_11_n_0 ),
        .I3(\pc[31]_i_12_n_0 ),
        .O(\pc[31]_i_12_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pc[31]_i_4 
       (.I0(out2[3]),
        .I1(out2[2]),
        .I2(out2[0]),
        .I3(out2[1]),
        .I4(\pc[31]_i_13_n_0 ),
        .O(\pc[31]_i_13_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pc[31]_i_5 
       (.I0(out2[11]),
        .I1(out2[10]),
        .I2(out2[9]),
        .I3(out2[8]),
        .I4(\pc[31]_i_14_n_0 ),
        .O(\pc[31]_i_14_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pc[31]_i_9 
       (.I0(out2[16]),
        .I1(out2[17]),
        .I2(out2[18]),
        .I3(out2[19]),
        .O(\pc[31]_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "multi_control_unit" *) 
module multi_fib_fpga_multicycle_cpu_0_0_multi_control_unit
   (E,
    WEA,
    RegWrite,
    S,
    D,
    \inst_reg_reg[1] ,
    \output_rf1_reg_reg[30] ,
    ToggleEqual_reg,
    \pc_reg[31] ,
    \pc_reg[21] ,
    ADDRARDADDR,
    p_2_out,
    wd,
    DI,
    \output_rf1_reg_reg[15] ,
    \output_rf1_reg_reg[16] ,
    \pc_reg[15] ,
    \inst_reg_reg[15] ,
    clk,
    Q,
    output_rf2_reg,
    rstn,
    \pc_reg[31]_0 ,
    out2,
    \pc_reg[0] ,
    \pc_reg[0]_0 ,
    \pc_reg[0]_1 ,
    \pc[31]_i_7 ,
    \alu_out_reg_reg[31] ,
    \output_rf2_reg_reg[29] ,
    output_rf1_reg,
    out2_carry_i_16,
    \alu_out_reg_reg[31]_0 ,
    \led_reg[0] ,
    \led_reg[0]_0 ,
    \led_reg[0]_1 ,
    \output_rf2_reg_reg[29]_0 );
  output [0:0]E;
  output [0:0]WEA;
  output RegWrite;
  output [7:0]S;
  output [31:0]D;
  output [31:0]\inst_reg_reg[1] ;
  output [15:0]\output_rf1_reg_reg[30] ;
  output [0:0]ToggleEqual_reg;
  output [7:0]\pc_reg[31] ;
  output [0:0]\pc_reg[21] ;
  output [0:0]ADDRARDADDR;
  output [4:0]p_2_out;
  output [31:0]wd;
  output [6:0]DI;
  output [7:0]\output_rf1_reg_reg[15] ;
  output [0:0]\output_rf1_reg_reg[16] ;
  output [7:0]\pc_reg[15] ;
  output [7:0]\inst_reg_reg[15] ;
  input clk;
  input [31:0]Q;
  input [31:0]output_rf2_reg;
  input rstn;
  input [31:0]\pc_reg[31]_0 ;
  input [31:0]out2;
  input \pc_reg[0] ;
  input \pc_reg[0]_0 ;
  input \pc_reg[0]_1 ;
  input \pc[31]_i_7 ;
  input \alu_out_reg_reg[31] ;
  input [31:0]\output_rf2_reg_reg[29] ;
  input [31:0]output_rf1_reg;
  input out2_carry_i_16;
  input \alu_out_reg_reg[31]_0 ;
  input \led_reg[0] ;
  input \led_reg[0]_0 ;
  input \led_reg[0]_1 ;
  input [31:0]\output_rf2_reg_reg[29]_0 ;

  wire [0:0]ADDRARDADDR;
  wire [31:0]D;
  wire [6:0]DI;
  wire [0:0]E;
  wire [31:0]Q;
  wire RegWrite;
  wire [7:0]S;
  wire [0:0]ToggleEqual_reg;
  wire [0:0]WEA;
  wire \alu_out_reg_reg[31] ;
  wire \alu_out_reg_reg[31]_0 ;
  wire clk;
  wire [7:0]\inst_reg_reg[15] ;
  wire [31:0]\inst_reg_reg[1] ;
  wire \led_reg[0] ;
  wire \led_reg[0]_0 ;
  wire \led_reg[0]_1 ;
  wire [31:0]out2;
  wire out2_carry_i_16;
  wire [31:0]output_rf1_reg;
  wire [7:0]\output_rf1_reg_reg[15] ;
  wire [0:0]\output_rf1_reg_reg[16] ;
  wire [15:0]\output_rf1_reg_reg[30] ;
  wire [31:0]output_rf2_reg;
  wire [31:0]\output_rf2_reg_reg[29] ;
  wire [31:0]\output_rf2_reg_reg[29]_0 ;
  wire [4:0]p_2_out;
  wire \pc[31]_i_7 ;
  wire \pc_reg[0] ;
  wire \pc_reg[0]_0 ;
  wire \pc_reg[0]_1 ;
  wire [7:0]\pc_reg[15] ;
  wire [0:0]\pc_reg[21] ;
  wire [7:0]\pc_reg[31] ;
  wire [31:0]\pc_reg[31]_0 ;
  wire rstn;
  wire [31:0]wd;

  multi_fib_fpga_multicycle_cpu_0_0_multi_main_decoder md
       (.ADDRARDADDR(ADDRARDADDR),
        .D(D),
        .DI(DI),
        .E(E),
        .Q(Q),
        .RegWrite(RegWrite),
        .S(S),
        .ToggleEqual_reg_0(ToggleEqual_reg),
        .WEA(WEA),
        .\alu_out_reg_reg[31] (\alu_out_reg_reg[31] ),
        .\alu_out_reg_reg[31]_0 (\alu_out_reg_reg[31]_0 ),
        .clk(clk),
        .\inst_reg_reg[15] (\inst_reg_reg[15] ),
        .\inst_reg_reg[1] (\inst_reg_reg[1] ),
        .\led_reg[0] (\led_reg[0] ),
        .\led_reg[0]_0 (\led_reg[0]_0 ),
        .\led_reg[0]_1 (\led_reg[0]_1 ),
        .out2(out2),
        .out2_carry_i_16_0(out2_carry_i_16),
        .output_rf1_reg(output_rf1_reg),
        .\output_rf1_reg_reg[15] (\output_rf1_reg_reg[15] ),
        .\output_rf1_reg_reg[16] (\output_rf1_reg_reg[16] ),
        .\output_rf1_reg_reg[30] (\output_rf1_reg_reg[30] ),
        .output_rf2_reg(output_rf2_reg),
        .\output_rf2_reg_reg[29] (\output_rf2_reg_reg[29] ),
        .\output_rf2_reg_reg[29]_0 (\output_rf2_reg_reg[29]_0 ),
        .p_2_out(p_2_out),
        .\pc[31]_i_7_0 (\pc[31]_i_7 ),
        .\pc_reg[0] (\pc_reg[0] ),
        .\pc_reg[0]_0 (\pc_reg[0]_0 ),
        .\pc_reg[0]_1 (\pc_reg[0]_1 ),
        .\pc_reg[15] (\pc_reg[15] ),
        .\pc_reg[21] (\pc_reg[21] ),
        .\pc_reg[31] (\pc_reg[31] ),
        .\pc_reg[31]_0 (\pc_reg[31]_0 ),
        .rstn(rstn),
        .wd(wd));
endmodule

(* ORIG_REF_NAME = "multi_main_decoder" *) 
module multi_fib_fpga_multicycle_cpu_0_0_multi_main_decoder
   (E,
    WEA,
    RegWrite,
    S,
    D,
    \inst_reg_reg[1] ,
    \output_rf1_reg_reg[30] ,
    ToggleEqual_reg_0,
    \pc_reg[31] ,
    \pc_reg[21] ,
    ADDRARDADDR,
    p_2_out,
    wd,
    DI,
    \output_rf1_reg_reg[15] ,
    \output_rf1_reg_reg[16] ,
    \pc_reg[15] ,
    \inst_reg_reg[15] ,
    clk,
    Q,
    output_rf2_reg,
    rstn,
    \pc_reg[31]_0 ,
    out2,
    \pc_reg[0] ,
    \pc_reg[0]_0 ,
    \pc_reg[0]_1 ,
    \pc[31]_i_7_0 ,
    \alu_out_reg_reg[31] ,
    \output_rf2_reg_reg[29] ,
    output_rf1_reg,
    out2_carry_i_16_0,
    \alu_out_reg_reg[31]_0 ,
    \led_reg[0] ,
    \led_reg[0]_0 ,
    \led_reg[0]_1 ,
    \output_rf2_reg_reg[29]_0 );
  output [0:0]E;
  output [0:0]WEA;
  output RegWrite;
  output [7:0]S;
  output [31:0]D;
  output [31:0]\inst_reg_reg[1] ;
  output [15:0]\output_rf1_reg_reg[30] ;
  output [0:0]ToggleEqual_reg_0;
  output [7:0]\pc_reg[31] ;
  output [0:0]\pc_reg[21] ;
  output [0:0]ADDRARDADDR;
  output [4:0]p_2_out;
  output [31:0]wd;
  output [6:0]DI;
  output [7:0]\output_rf1_reg_reg[15] ;
  output [0:0]\output_rf1_reg_reg[16] ;
  output [7:0]\pc_reg[15] ;
  output [7:0]\inst_reg_reg[15] ;
  input clk;
  input [31:0]Q;
  input [31:0]output_rf2_reg;
  input rstn;
  input [31:0]\pc_reg[31]_0 ;
  input [31:0]out2;
  input \pc_reg[0] ;
  input \pc_reg[0]_0 ;
  input \pc_reg[0]_1 ;
  input \pc[31]_i_7_0 ;
  input \alu_out_reg_reg[31] ;
  input [31:0]\output_rf2_reg_reg[29] ;
  input [31:0]output_rf1_reg;
  input out2_carry_i_16_0;
  input \alu_out_reg_reg[31]_0 ;
  input \led_reg[0] ;
  input \led_reg[0]_0 ;
  input \led_reg[0]_1 ;
  input [31:0]\output_rf2_reg_reg[29]_0 ;

  wire [16:2]A;
  wire [0:0]ADDRARDADDR;
  wire \ALUOp[0]_i_1_n_0 ;
  wire \ALUOp[0]_i_2_n_0 ;
  wire \ALUOp[0]_i_3_n_0 ;
  wire \ALUOp[0]_i_4_n_0 ;
  wire \ALUOp[1]_i_1_n_0 ;
  wire \ALUOp[1]_i_2_n_0 ;
  wire \ALUOp[1]_i_3_n_0 ;
  wire ALUSrcA;
  wire ALUSrcA_i_1_n_0;
  wire \ALUSrcB[0]_i_1_n_0 ;
  wire \ALUSrcB[0]_i_2_n_0 ;
  wire \ALUSrcB[0]_i_3_n_0 ;
  wire \ALUSrcB[1]_i_1_n_0 ;
  wire \ALUSrcB[1]_i_2_n_0 ;
  wire \ALUSrcB[1]_i_3_n_0 ;
  wire \ALUSrcB[1]_i_4_n_0 ;
  wire \ALUSrcB[1]_i_5_n_0 ;
  wire \ALUSrcB[1]_i_6_n_0 ;
  wire \ALUSrcB_reg_n_0_[0] ;
  wire \ALUSrcB_reg_n_0_[1] ;
  wire Branch;
  wire Branch_i_1_n_0;
  wire Branch_i_2_n_0;
  wire [31:0]D;
  wire [6:0]DI;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[3]_i_2_n_0 ;
  wire \FSM_sequential_state[3]_i_3_n_0 ;
  wire \FSM_sequential_state[3]_i_4_n_0 ;
  wire \FSM_sequential_state[4]_i_1_n_0 ;
  wire \FSM_sequential_state[4]_i_2_n_0 ;
  wire \FSM_sequential_state[4]_i_4_n_0 ;
  wire \FSM_sequential_state[4]_i_5_n_0 ;
  wire \FSM_sequential_state[4]_i_6_n_0 ;
  wire \FSM_sequential_state[4]_i_7_n_0 ;
  wire \FSM_sequential_state[4]_i_8_n_0 ;
  wire IRWrite_i_1_n_0;
  wire IorD;
  wire IorD_i_1_n_0;
  wire IorD_i_2_n_0;
  wire IorD_i_3_n_0;
  wire MemWrite_i_1_n_0;
  wire MemWrite_i_2_n_0;
  wire MemWrite_i_3_n_0;
  wire MemWrite_i_4_n_0;
  wire \MemtoReg[0]_i_1_n_0 ;
  wire \MemtoReg[0]_i_2_n_0 ;
  wire \MemtoReg[1]_i_1_n_0 ;
  wire \MemtoReg_reg_n_0_[0] ;
  wire \MemtoReg_reg_n_0_[1] ;
  wire [1:0]PCSrc_temp;
  wire \PCSrc_temp[0]_i_1_n_0 ;
  wire \PCSrc_temp[0]_i_2_n_0 ;
  wire \PCSrc_temp[1]_i_1_n_0 ;
  wire \PCSrc_temp[1]_i_2_n_0 ;
  wire \PCSrc_temp[1]_i_3_n_0 ;
  wire \PCSrc_temp[1]_i_4_n_0 ;
  wire \PCSrc_temp[1]_i_5_n_0 ;
  wire PCWrite_temp;
  wire PCWrite_temp_i_1_n_0;
  wire PCWrite_temp_i_2_n_0;
  wire PCWrite_temp_i_3_n_0;
  wire PCWrite_temp_i_4_n_0;
  wire [31:0]Q;
  wire [1:0]RegDst;
  wire \RegDst[0]_i_1_n_0 ;
  wire \RegDst[0]_i_2_n_0 ;
  wire \RegDst[0]_i_3_n_0 ;
  wire \RegDst[0]_i_4_n_0 ;
  wire \RegDst[1]_i_1_n_0 ;
  wire \RegDst[1]_i_2_n_0 ;
  wire RegWrite;
  wire RegWrite_i_1_n_0;
  wire RegWrite_i_2_n_0;
  wire RegWrite_i_3_n_0;
  wire [7:0]S;
  wire ToggleEqual;
  wire ToggleEqual_i_1_n_0;
  wire ToggleEqual_i_2_n_0;
  wire ToggleEqual_i_3_n_0;
  wire [0:0]ToggleEqual_reg_0;
  wire [0:0]WEA;
  wire \alu_out_reg[31]_i_2_n_0 ;
  wire \alu_out_reg[31]_i_3_n_0 ;
  wire \alu_out_reg[31]_i_4_n_0 ;
  wire \alu_out_reg[31]_i_5_n_0 ;
  wire \alu_out_reg_reg[31] ;
  wire \alu_out_reg_reg[31]_0 ;
  wire clk;
  wire in;
  wire [7:0]\inst_reg_reg[15] ;
  wire [31:0]\inst_reg_reg[1] ;
  wire \led_reg[0] ;
  wire \led_reg[0]_0 ;
  wire \led_reg[0]_1 ;
  wire [31:0]out2;
  wire out2_carry_i_16_0;
  wire [31:0]output_rf1_reg;
  wire [7:0]\output_rf1_reg_reg[15] ;
  wire [0:0]\output_rf1_reg_reg[16] ;
  wire [15:0]\output_rf1_reg_reg[30] ;
  wire [31:0]output_rf2_reg;
  wire [31:0]\output_rf2_reg_reg[29] ;
  wire [31:0]\output_rf2_reg_reg[29]_0 ;
  wire [4:0]p_0_out;
  wire [4:0]p_2_out;
  wire \pc[31]_i_15_n_0 ;
  wire \pc[31]_i_6_n_0 ;
  wire \pc[31]_i_7_0 ;
  wire \pc[31]_i_7_n_0 ;
  wire \pc[31]_i_8_n_0 ;
  wire \pc_reg[0] ;
  wire \pc_reg[0]_0 ;
  wire \pc_reg[0]_1 ;
  wire [7:0]\pc_reg[15] ;
  wire [0:0]\pc_reg[21] ;
  wire [7:0]\pc_reg[31] ;
  wire [31:0]\pc_reg[31]_0 ;
  wire rstn;
  wire [7:6]sel0;
  wire [30:0]srcBB;
  wire [4:0]state__0;
  wire [31:0]wd;

  LUT6 #(
    .INIT(64'hD000D0D0D0000000)) 
    \ALUOp[0]_i_1 
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(\ALUOp[0]_i_2_n_0 ),
        .I2(\ALUSrcB[0]_i_3_n_0 ),
        .I3(\PCSrc_temp[1]_i_5_n_0 ),
        .I4(\ALUOp[0]_i_3_n_0 ),
        .I5(sel0[6]),
        .O(\ALUOp[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF7FFF7FFFFFFFE)) 
    \ALUOp[0]_i_2 
       (.I0(Q[27]),
        .I1(Q[26]),
        .I2(Q[30]),
        .I3(Q[28]),
        .I4(Q[29]),
        .I5(Q[31]),
        .O(\ALUOp[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0F000F0F0C000130)) 
    \ALUOp[0]_i_3 
       (.I0(\ALUOp[0]_i_4_n_0 ),
        .I1(state__0[2]),
        .I2(state__0[4]),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(state__0[3]),
        .O(\ALUOp[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFAD)) 
    \ALUOp[0]_i_4 
       (.I0(Q[29]),
        .I1(Q[26]),
        .I2(Q[28]),
        .I3(Q[27]),
        .I4(Q[31]),
        .I5(Q[30]),
        .O(\ALUOp[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAA00000000)) 
    \ALUOp[1]_i_1 
       (.I0(\ALUSrcB[0]_i_3_n_0 ),
        .I1(MemWrite_i_2_n_0),
        .I2(state__0[4]),
        .I3(Q[31]),
        .I4(\ALUOp[1]_i_2_n_0 ),
        .I5(\ALUOp[1]_i_3_n_0 ),
        .O(\ALUOp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \ALUOp[1]_i_2 
       (.I0(Q[28]),
        .I1(Q[30]),
        .I2(Q[26]),
        .I3(Q[27]),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\ALUOp[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h555D5555000C0000)) 
    \ALUOp[1]_i_3 
       (.I0(\ALUOp[0]_i_3_n_0 ),
        .I1(\ALUSrcB[1]_i_4_n_0 ),
        .I2(Q[28]),
        .I3(Q[26]),
        .I4(\PCSrc_temp[1]_i_2_n_0 ),
        .I5(sel0[7]),
        .O(\ALUOp[1]_i_3_n_0 ));
  FDRE \ALUOp_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\ALUOp[0]_i_1_n_0 ),
        .Q(sel0[6]),
        .R(1'b0));
  FDRE \ALUOp_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\ALUOp[1]_i_1_n_0 ),
        .Q(sel0[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    ALUSrcA_i_1
       (.I0(ALUSrcA),
        .I1(\ALUSrcB[0]_i_2_n_0 ),
        .I2(\PCSrc_temp[1]_i_2_n_0 ),
        .I3(\ALUSrcB[0]_i_3_n_0 ),
        .O(ALUSrcA_i_1_n_0));
  FDRE ALUSrcA_reg
       (.C(clk),
        .CE(1'b1),
        .D(ALUSrcA_i_1_n_0),
        .Q(ALUSrcA),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2EFF)) 
    \ALUSrcB[0]_i_1 
       (.I0(\ALUSrcB_reg_n_0_[0] ),
        .I1(\ALUSrcB[0]_i_2_n_0 ),
        .I2(\PCSrc_temp[1]_i_2_n_0 ),
        .I3(\ALUSrcB[0]_i_3_n_0 ),
        .O(\ALUSrcB[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F000F0F0C000130)) 
    \ALUSrcB[0]_i_2 
       (.I0(\ALUSrcB[1]_i_6_n_0 ),
        .I1(state__0[2]),
        .I2(state__0[4]),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(state__0[3]),
        .O(\ALUSrcB[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA8AAAA)) 
    \ALUSrcB[0]_i_3 
       (.I0(rstn),
        .I1(state__0[2]),
        .I2(state__0[3]),
        .I3(state__0[4]),
        .I4(state__0[0]),
        .I5(state__0[1]),
        .O(\ALUSrcB[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFAAFFFFBFAA0000)) 
    \ALUSrcB[1]_i_1 
       (.I0(\ALUSrcB[1]_i_2_n_0 ),
        .I1(\ALUSrcB[1]_i_3_n_0 ),
        .I2(\ALUSrcB[1]_i_4_n_0 ),
        .I3(\PCSrc_temp[1]_i_2_n_0 ),
        .I4(\ALUSrcB[1]_i_5_n_0 ),
        .I5(\ALUSrcB_reg_n_0_[1] ),
        .O(\ALUSrcB[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \ALUSrcB[1]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(state__0[4]),
        .I3(state__0[3]),
        .I4(state__0[2]),
        .O(\ALUSrcB[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \ALUSrcB[1]_i_3 
       (.I0(Q[28]),
        .I1(Q[26]),
        .O(\ALUSrcB[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \ALUSrcB[1]_i_4 
       (.I0(Q[31]),
        .I1(Q[30]),
        .I2(Q[29]),
        .I3(Q[27]),
        .O(\ALUSrcB[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h333033010003330C)) 
    \ALUSrcB[1]_i_5 
       (.I0(\ALUSrcB[1]_i_6_n_0 ),
        .I1(state__0[4]),
        .I2(state__0[2]),
        .I3(state__0[3]),
        .I4(state__0[0]),
        .I5(state__0[1]),
        .O(\ALUSrcB[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFEFEBFFEFE)) 
    \ALUSrcB[1]_i_6 
       (.I0(Q[30]),
        .I1(Q[31]),
        .I2(Q[27]),
        .I3(Q[28]),
        .I4(Q[26]),
        .I5(Q[29]),
        .O(\ALUSrcB[1]_i_6_n_0 ));
  FDRE \ALUSrcB_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\ALUSrcB[0]_i_1_n_0 ),
        .Q(\ALUSrcB_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \ALUSrcB_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\ALUSrcB[1]_i_1_n_0 ),
        .Q(\ALUSrcB_reg_n_0_[1] ),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    Branch_i_1
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(Branch_i_2_n_0),
        .I2(Branch),
        .O(Branch_i_1_n_0));
  LUT6 #(
    .INIT(64'h0003000030000200)) 
    Branch_i_2
       (.I0(\PCSrc_temp[1]_i_3_n_0 ),
        .I1(state__0[4]),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .I4(state__0[3]),
        .I5(state__0[2]),
        .O(Branch_i_2_n_0));
  FDRE Branch_reg
       (.C(clk),
        .CE(1'b1),
        .D(Branch_i_1_n_0),
        .Q(Branch),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0101010101000101)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state__0[4]),
        .I1(state__0[0]),
        .I2(state__0[3]),
        .I3(\FSM_sequential_state[0]_i_2_n_0 ),
        .I4(state__0[1]),
        .I5(state__0[2]),
        .O(p_0_out[0]));
  LUT6 #(
    .INIT(64'h1100000000000115)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(Q[30]),
        .I1(Q[28]),
        .I2(Q[29]),
        .I3(Q[27]),
        .I4(Q[31]),
        .I5(Q[26]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000E0F0F0000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state__0[2]),
        .I1(\FSM_sequential_state[1]_i_2_n_0 ),
        .I2(state__0[4]),
        .I3(state__0[3]),
        .I4(state__0[0]),
        .I5(state__0[1]),
        .O(p_0_out[1]));
  LUT6 #(
    .INIT(64'h0404000000000014)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(Q[30]),
        .I1(Q[27]),
        .I2(Q[28]),
        .I3(Q[29]),
        .I4(Q[31]),
        .I5(Q[26]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001F00000010)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state__0[4]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state__0[1]),
        .I3(state__0[3]),
        .I4(state__0[0]),
        .I5(\FSM_sequential_state[2]_i_3_n_0 ),
        .O(p_0_out[2]));
  LUT6 #(
    .INIT(64'h00000000FDFFFFD7)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\FSM_sequential_state[2]_i_4_n_0 ),
        .I1(Q[27]),
        .I2(Q[29]),
        .I3(Q[26]),
        .I4(Q[28]),
        .I5(state__0[2]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h04040414)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(state__0[4]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .I3(state__0[3]),
        .I4(\FSM_sequential_state[3]_i_2_n_0 ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(Q[30]),
        .I1(Q[31]),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00008ADA)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(state__0[0]),
        .I1(\FSM_sequential_state[3]_i_2_n_0 ),
        .I2(state__0[1]),
        .I3(\FSM_sequential_state[3]_i_3_n_0 ),
        .I4(\FSM_sequential_state[3]_i_4_n_0 ),
        .O(p_0_out[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFDFFF)) 
    \FSM_sequential_state[3]_i_2 
       (.I0(Q[26]),
        .I1(Q[28]),
        .I2(Q[31]),
        .I3(Q[27]),
        .I4(Q[30]),
        .I5(Q[29]),
        .O(\FSM_sequential_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFCEA)) 
    \FSM_sequential_state[3]_i_3 
       (.I0(Q[26]),
        .I1(Q[29]),
        .I2(Q[27]),
        .I3(Q[28]),
        .I4(Q[30]),
        .I5(Q[31]),
        .O(\FSM_sequential_state[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFAD)) 
    \FSM_sequential_state[3]_i_4 
       (.I0(state__0[1]),
        .I1(state__0[2]),
        .I2(state__0[3]),
        .I3(state__0[4]),
        .O(\FSM_sequential_state[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_state[4]_i_1 
       (.I0(rstn),
        .O(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hD0DDD0DDD0DDDDDD)) 
    \FSM_sequential_state[4]_i_2 
       (.I0(state__0[4]),
        .I1(\FSM_sequential_state[4]_i_4_n_0 ),
        .I2(\FSM_sequential_state[4]_i_5_n_0 ),
        .I3(\FSM_sequential_state[4]_i_6_n_0 ),
        .I4(state__0[0]),
        .I5(\FSM_sequential_state[4]_i_7_n_0 ),
        .O(\FSM_sequential_state[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \FSM_sequential_state[4]_i_3 
       (.I0(state__0[0]),
        .I1(state__0[4]),
        .I2(state__0[3]),
        .I3(state__0[2]),
        .I4(state__0[1]),
        .I5(\FSM_sequential_state[4]_i_8_n_0 ),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_state[4]_i_4 
       (.I0(state__0[3]),
        .I1(state__0[2]),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .O(\FSM_sequential_state[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \FSM_sequential_state[4]_i_5 
       (.I0(Q[31]),
        .I1(Q[26]),
        .I2(Q[30]),
        .I3(Q[28]),
        .I4(Q[27]),
        .I5(state__0[0]),
        .O(\FSM_sequential_state[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \FSM_sequential_state[4]_i_6 
       (.I0(state__0[4]),
        .I1(state__0[3]),
        .I2(state__0[2]),
        .I3(state__0[1]),
        .O(\FSM_sequential_state[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBBFFF9FFFFFFE8)) 
    \FSM_sequential_state[4]_i_7 
       (.I0(Q[28]),
        .I1(Q[27]),
        .I2(Q[29]),
        .I3(Q[30]),
        .I4(Q[31]),
        .I5(Q[26]),
        .O(\FSM_sequential_state[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000308090101)) 
    \FSM_sequential_state[4]_i_8 
       (.I0(Q[26]),
        .I1(Q[31]),
        .I2(Q[30]),
        .I3(Q[29]),
        .I4(Q[27]),
        .I5(Q[28]),
        .O(\FSM_sequential_state[4]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(\FSM_sequential_state[4]_i_2_n_0 ),
        .D(p_0_out[0]),
        .Q(state__0[0]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(\FSM_sequential_state[4]_i_2_n_0 ),
        .D(p_0_out[1]),
        .Q(state__0[1]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111" *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(\FSM_sequential_state[4]_i_2_n_0 ),
        .D(p_0_out[2]),
        .Q(state__0[2]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111" *) 
  FDRE \FSM_sequential_state_reg[3] 
       (.C(clk),
        .CE(\FSM_sequential_state[4]_i_2_n_0 ),
        .D(p_0_out[3]),
        .Q(state__0[3]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111" *) 
  FDRE \FSM_sequential_state_reg[4] 
       (.C(clk),
        .CE(\FSM_sequential_state[4]_i_2_n_0 ),
        .D(p_0_out[4]),
        .Q(state__0[4]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000001)) 
    IRWrite_i_1
       (.I0(state__0[0]),
        .I1(state__0[4]),
        .I2(state__0[3]),
        .I3(state__0[1]),
        .I4(state__0[2]),
        .I5(E),
        .O(IRWrite_i_1_n_0));
  FDRE IRWrite_reg
       (.C(clk),
        .CE(1'b1),
        .D(IRWrite_i_1_n_0),
        .Q(E),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFAA80AA)) 
    IorD_i_1
       (.I0(IorD_i_2_n_0),
        .I1(\FSM_sequential_state[4]_i_6_n_0 ),
        .I2(\FSM_sequential_state[4]_i_5_n_0 ),
        .I3(IorD_i_3_n_0),
        .I4(IorD),
        .O(IorD_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    IorD_i_2
       (.I0(state__0[3]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(state__0[4]),
        .O(IorD_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF1DFE5D)) 
    IorD_i_3
       (.I0(state__0[3]),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(state__0[4]),
        .I4(state__0[2]),
        .O(IorD_i_3_n_0));
  FDRE IorD_reg
       (.C(clk),
        .CE(1'b1),
        .D(IorD_i_1_n_0),
        .Q(IorD),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080FFFF00800000)) 
    MemWrite_i_1
       (.I0(MemWrite_i_2_n_0),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(state__0[4]),
        .I4(MemWrite_i_3_n_0),
        .I5(WEA),
        .O(MemWrite_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h1)) 
    MemWrite_i_2
       (.I0(state__0[2]),
        .I1(state__0[3]),
        .O(MemWrite_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000FEC00003CCCC)) 
    MemWrite_i_3
       (.I0(MemWrite_i_4_n_0),
        .I1(state__0[3]),
        .I2(state__0[2]),
        .I3(state__0[1]),
        .I4(state__0[4]),
        .I5(state__0[0]),
        .O(MemWrite_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    MemWrite_i_4
       (.I0(Q[29]),
        .I1(Q[27]),
        .I2(Q[31]),
        .I3(Q[26]),
        .I4(Q[30]),
        .I5(Q[28]),
        .O(MemWrite_i_4_n_0));
  FDRE MemWrite_reg
       (.C(clk),
        .CE(1'b1),
        .D(MemWrite_i_1_n_0),
        .Q(WEA),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDDD0D0D000000000)) 
    \MemtoReg[0]_i_1 
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(\RegDst[0]_i_3_n_0 ),
        .I2(\MemtoReg[0]_i_2_n_0 ),
        .I3(\RegDst[0]_i_2_n_0 ),
        .I4(\MemtoReg_reg_n_0_[0] ),
        .I5(rstn),
        .O(\MemtoReg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    \MemtoReg[0]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(state__0[3]),
        .I3(state__0[4]),
        .I4(state__0[2]),
        .O(\MemtoReg[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \MemtoReg[1]_i_1 
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(\RegDst[1]_i_2_n_0 ),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .O(\MemtoReg[1]_i_1_n_0 ));
  FDRE \MemtoReg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\MemtoReg[0]_i_1_n_0 ),
        .Q(\MemtoReg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \MemtoReg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\MemtoReg[1]_i_1_n_0 ),
        .Q(\MemtoReg_reg_n_0_[1] ),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \PCSrc_temp[0]_i_1 
       (.I0(\PCSrc_temp[1]_i_5_n_0 ),
        .I1(IorD_i_3_n_0),
        .I2(\PCSrc_temp[0]_i_2_n_0 ),
        .I3(PCSrc_temp[0]),
        .O(\PCSrc_temp[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF9FFFFFFFF)) 
    \PCSrc_temp[0]_i_2 
       (.I0(Q[28]),
        .I1(Q[27]),
        .I2(Q[29]),
        .I3(Q[31]),
        .I4(Q[30]),
        .I5(\PCSrc_temp[1]_i_2_n_0 ),
        .O(\PCSrc_temp[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000002F200000)) 
    \PCSrc_temp[1]_i_1 
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(\PCSrc_temp[1]_i_3_n_0 ),
        .I2(\PCSrc_temp[1]_i_4_n_0 ),
        .I3(PCSrc_temp[1]),
        .I4(rstn),
        .I5(\PCSrc_temp[1]_i_5_n_0 ),
        .O(\PCSrc_temp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \PCSrc_temp[1]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[2]),
        .I2(state__0[3]),
        .I3(state__0[4]),
        .I4(state__0[0]),
        .O(\PCSrc_temp[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \PCSrc_temp[1]_i_3 
       (.I0(Q[31]),
        .I1(Q[30]),
        .I2(Q[28]),
        .I3(Q[27]),
        .I4(Q[29]),
        .O(\PCSrc_temp[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00A801F000A801F2)) 
    \PCSrc_temp[1]_i_4 
       (.I0(state__0[1]),
        .I1(state__0[2]),
        .I2(state__0[3]),
        .I3(state__0[4]),
        .I4(state__0[0]),
        .I5(PCWrite_temp_i_4_n_0),
        .O(\PCSrc_temp[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \PCSrc_temp[1]_i_5 
       (.I0(state__0[4]),
        .I1(state__0[0]),
        .I2(state__0[3]),
        .I3(state__0[1]),
        .I4(state__0[2]),
        .I5(\PCSrc_temp[1]_i_3_n_0 ),
        .O(\PCSrc_temp[1]_i_5_n_0 ));
  FDRE \PCSrc_temp_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\PCSrc_temp[0]_i_1_n_0 ),
        .Q(PCSrc_temp[0]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  FDRE \PCSrc_temp_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\PCSrc_temp[1]_i_1_n_0 ),
        .Q(PCSrc_temp[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBFFBFFFFBFFB0000)) 
    PCWrite_temp_i_1
       (.I0(state__0[4]),
        .I1(PCWrite_temp_i_2_n_0),
        .I2(state__0[0]),
        .I3(state__0[3]),
        .I4(PCWrite_temp_i_3_n_0),
        .I5(PCWrite_temp),
        .O(PCWrite_temp_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h1)) 
    PCWrite_temp_i_2
       (.I0(state__0[2]),
        .I1(state__0[1]),
        .O(PCWrite_temp_i_2_n_0));
  LUT6 #(
    .INIT(64'h0F0C03000F010F33)) 
    PCWrite_temp_i_3
       (.I0(PCWrite_temp_i_4_n_0),
        .I1(state__0[0]),
        .I2(state__0[4]),
        .I3(state__0[3]),
        .I4(state__0[1]),
        .I5(state__0[2]),
        .O(PCWrite_temp_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    PCWrite_temp_i_4
       (.I0(Q[30]),
        .I1(Q[31]),
        .I2(Q[29]),
        .I3(Q[27]),
        .I4(Q[28]),
        .O(PCWrite_temp_i_4_n_0));
  FDSE PCWrite_temp_reg
       (.C(clk),
        .CE(1'b1),
        .D(PCWrite_temp_i_1_n_0),
        .Q(PCWrite_temp),
        .S(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_1
       (.I0(\output_rf2_reg_reg[29] [1]),
        .I1(\output_rf2_reg_reg[29]_0 [1]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [1]),
        .O(wd[1]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_10
       (.I0(\output_rf2_reg_reg[29] [8]),
        .I1(\output_rf2_reg_reg[29]_0 [8]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [8]),
        .O(wd[8]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_11
       (.I0(\output_rf2_reg_reg[29] [11]),
        .I1(\output_rf2_reg_reg[29]_0 [11]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [11]),
        .O(wd[11]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_12
       (.I0(\output_rf2_reg_reg[29] [10]),
        .I1(\output_rf2_reg_reg[29]_0 [10]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [10]),
        .O(wd[10]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_13
       (.I0(\output_rf2_reg_reg[29] [13]),
        .I1(\output_rf2_reg_reg[29]_0 [13]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [13]),
        .O(wd[13]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_14
       (.I0(\output_rf2_reg_reg[29] [12]),
        .I1(\output_rf2_reg_reg[29]_0 [12]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [12]),
        .O(wd[12]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    RAM_reg_0_31_0_13_i_15
       (.I0(RegDst[1]),
        .I1(Q[20]),
        .I2(RegDst[0]),
        .I3(Q[15]),
        .O(p_2_out[4]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    RAM_reg_0_31_0_13_i_16
       (.I0(RegDst[1]),
        .I1(Q[19]),
        .I2(RegDst[0]),
        .I3(Q[14]),
        .O(p_2_out[3]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    RAM_reg_0_31_0_13_i_17
       (.I0(RegDst[1]),
        .I1(Q[18]),
        .I2(RegDst[0]),
        .I3(Q[13]),
        .O(p_2_out[2]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    RAM_reg_0_31_0_13_i_18
       (.I0(RegDst[1]),
        .I1(Q[17]),
        .I2(RegDst[0]),
        .I3(Q[12]),
        .O(p_2_out[1]));
  LUT4 #(
    .INIT(16'hFEAE)) 
    RAM_reg_0_31_0_13_i_19
       (.I0(RegDst[1]),
        .I1(Q[16]),
        .I2(RegDst[0]),
        .I3(Q[11]),
        .O(p_2_out[0]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_2
       (.I0(\output_rf2_reg_reg[29] [0]),
        .I1(\output_rf2_reg_reg[29]_0 [0]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [0]),
        .O(wd[0]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_3
       (.I0(\output_rf2_reg_reg[29] [3]),
        .I1(\output_rf2_reg_reg[29]_0 [3]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [3]),
        .O(wd[3]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_4
       (.I0(\output_rf2_reg_reg[29] [2]),
        .I1(\output_rf2_reg_reg[29]_0 [2]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [2]),
        .O(wd[2]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_5
       (.I0(\output_rf2_reg_reg[29] [5]),
        .I1(\output_rf2_reg_reg[29]_0 [5]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [5]),
        .O(wd[5]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_6
       (.I0(\output_rf2_reg_reg[29] [4]),
        .I1(\output_rf2_reg_reg[29]_0 [4]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [4]),
        .O(wd[4]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_7
       (.I0(\output_rf2_reg_reg[29] [7]),
        .I1(\output_rf2_reg_reg[29]_0 [7]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [7]),
        .O(wd[7]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_8
       (.I0(\output_rf2_reg_reg[29] [6]),
        .I1(\output_rf2_reg_reg[29]_0 [6]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [6]),
        .O(wd[6]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_0_13_i_9
       (.I0(\output_rf2_reg_reg[29] [9]),
        .I1(\output_rf2_reg_reg[29]_0 [9]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [9]),
        .O(wd[9]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_1
       (.I0(\output_rf2_reg_reg[29] [15]),
        .I1(\output_rf2_reg_reg[29]_0 [15]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [15]),
        .O(wd[15]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_10
       (.I0(\output_rf2_reg_reg[29] [22]),
        .I1(\output_rf2_reg_reg[29]_0 [22]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [22]),
        .O(wd[22]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_11
       (.I0(\output_rf2_reg_reg[29] [25]),
        .I1(\output_rf2_reg_reg[29]_0 [25]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [25]),
        .O(wd[25]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_12
       (.I0(\output_rf2_reg_reg[29] [24]),
        .I1(\output_rf2_reg_reg[29]_0 [24]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [24]),
        .O(wd[24]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_13
       (.I0(\output_rf2_reg_reg[29] [27]),
        .I1(\output_rf2_reg_reg[29]_0 [27]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [27]),
        .O(wd[27]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_14
       (.I0(\output_rf2_reg_reg[29] [26]),
        .I1(\output_rf2_reg_reg[29]_0 [26]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [26]),
        .O(wd[26]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_2
       (.I0(\output_rf2_reg_reg[29] [14]),
        .I1(\output_rf2_reg_reg[29]_0 [14]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [14]),
        .O(wd[14]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_3
       (.I0(\output_rf2_reg_reg[29] [17]),
        .I1(\output_rf2_reg_reg[29]_0 [17]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [17]),
        .O(wd[17]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_4
       (.I0(\output_rf2_reg_reg[29] [16]),
        .I1(\output_rf2_reg_reg[29]_0 [16]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [16]),
        .O(wd[16]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_5
       (.I0(\output_rf2_reg_reg[29] [19]),
        .I1(\output_rf2_reg_reg[29]_0 [19]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [19]),
        .O(wd[19]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_6
       (.I0(\output_rf2_reg_reg[29] [18]),
        .I1(\output_rf2_reg_reg[29]_0 [18]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [18]),
        .O(wd[18]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_7
       (.I0(\output_rf2_reg_reg[29] [21]),
        .I1(\output_rf2_reg_reg[29]_0 [21]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [21]),
        .O(wd[21]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_8
       (.I0(\output_rf2_reg_reg[29] [20]),
        .I1(\output_rf2_reg_reg[29]_0 [20]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [20]),
        .O(wd[20]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_14_27_i_9
       (.I0(\output_rf2_reg_reg[29] [23]),
        .I1(\output_rf2_reg_reg[29]_0 [23]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [23]),
        .O(wd[23]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_28_31_i_1
       (.I0(\output_rf2_reg_reg[29] [29]),
        .I1(\output_rf2_reg_reg[29]_0 [29]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [29]),
        .O(wd[29]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_28_31_i_2
       (.I0(\output_rf2_reg_reg[29] [28]),
        .I1(\output_rf2_reg_reg[29]_0 [28]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [28]),
        .O(wd[28]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_28_31_i_3
       (.I0(\output_rf2_reg_reg[29] [31]),
        .I1(\output_rf2_reg_reg[29]_0 [31]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [31]),
        .O(wd[31]));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    RAM_reg_0_31_28_31_i_4
       (.I0(\output_rf2_reg_reg[29] [30]),
        .I1(\output_rf2_reg_reg[29]_0 [30]),
        .I2(\MemtoReg_reg_n_0_[1] ),
        .I3(\MemtoReg_reg_n_0_[0] ),
        .I4(\pc_reg[31]_0 [30]),
        .O(wd[30]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RAM_reg_bram_0_i_1
       (.I0(\pc_reg[31]_0 [2]),
        .I1(IorD),
        .I2(\output_rf2_reg_reg[29] [2]),
        .O(ADDRARDADDR));
  LUT6 #(
    .INIT(64'h44040000C404C404)) 
    \RegDst[0]_i_1 
       (.I0(state__0[2]),
        .I1(rstn),
        .I2(\RegDst[0]_i_2_n_0 ),
        .I3(RegDst[0]),
        .I4(\RegDst[0]_i_3_n_0 ),
        .I5(\RegDst[0]_i_4_n_0 ),
        .O(\RegDst[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \RegDst[0]_i_2 
       (.I0(state__0[3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(state__0[4]),
        .O(\RegDst[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFBFFFFFFFF)) 
    \RegDst[0]_i_3 
       (.I0(Q[28]),
        .I1(Q[27]),
        .I2(Q[29]),
        .I3(Q[31]),
        .I4(Q[30]),
        .I5(Q[26]),
        .O(\RegDst[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \RegDst[0]_i_4 
       (.I0(state__0[4]),
        .I1(state__0[3]),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .O(\RegDst[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \RegDst[1]_i_1 
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(\RegDst[1]_i_2_n_0 ),
        .I2(RegDst[1]),
        .O(\RegDst[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000C3000000C10)) 
    \RegDst[1]_i_2 
       (.I0(\RegDst[0]_i_3_n_0 ),
        .I1(state__0[3]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(state__0[4]),
        .I5(state__0[2]),
        .O(\RegDst[1]_i_2_n_0 ));
  FDRE \RegDst_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\RegDst[0]_i_1_n_0 ),
        .Q(RegDst[0]),
        .R(1'b0));
  FDRE \RegDst_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\RegDst[1]_i_1_n_0 ),
        .Q(RegDst[1]),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0410FFFF04100000)) 
    RegWrite_i_1
       (.I0(state__0[4]),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(state__0[3]),
        .I4(RegWrite_i_2_n_0),
        .I5(RegWrite),
        .O(RegWrite_i_1_n_0));
  LUT6 #(
    .INIT(64'h5454444655555557)) 
    RegWrite_i_2
       (.I0(state__0[4]),
        .I1(state__0[3]),
        .I2(state__0[2]),
        .I3(state__0[0]),
        .I4(state__0[1]),
        .I5(RegWrite_i_3_n_0),
        .O(RegWrite_i_2_n_0));
  LUT3 #(
    .INIT(8'hEF)) 
    RegWrite_i_3
       (.I0(Q[29]),
        .I1(Q[31]),
        .I2(\ALUOp[1]_i_2_n_0 ),
        .O(RegWrite_i_3_n_0));
  FDRE RegWrite_reg
       (.C(clk),
        .CE(1'b1),
        .D(RegWrite_i_1_n_0),
        .Q(RegWrite),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFAAAA2000AAAA)) 
    ToggleEqual_i_1
       (.I0(\PCSrc_temp[1]_i_2_n_0 ),
        .I1(ToggleEqual_i_2_n_0),
        .I2(state__0[1]),
        .I3(ToggleEqual_i_3_n_0),
        .I4(IorD_i_3_n_0),
        .I5(ToggleEqual),
        .O(ToggleEqual_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    ToggleEqual_i_2
       (.I0(Q[26]),
        .I1(Q[29]),
        .I2(Q[27]),
        .I3(Q[28]),
        .I4(Q[31]),
        .I5(Q[30]),
        .O(ToggleEqual_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00010101)) 
    ToggleEqual_i_3
       (.I0(state__0[4]),
        .I1(state__0[2]),
        .I2(state__0[3]),
        .I3(state__0[0]),
        .I4(state__0[1]),
        .O(ToggleEqual_i_3_n_0));
  FDRE ToggleEqual_reg
       (.C(clk),
        .CE(1'b1),
        .D(ToggleEqual_i_1_n_0),
        .Q(ToggleEqual),
        .R(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFCFA0CFA0CFA0C0)) 
    \alu_out_reg[0]_i_1 
       (.I0(out2[0]),
        .I1(out2[31]),
        .I2(\alu_out_reg[31]_i_2_n_0 ),
        .I3(\alu_out_reg[31]_i_3_n_0 ),
        .I4(srcBB[0]),
        .I5(\output_rf1_reg_reg[30] [0]),
        .O(\inst_reg_reg[1] [0]));
  LUT5 #(
    .INIT(32'h66655565)) 
    \alu_out_reg[0]_i_2 
       (.I0(in),
        .I1(\ALUSrcB_reg_n_0_[0] ),
        .I2(output_rf2_reg[0]),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[0]),
        .O(srcBB[0]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[10]_i_1 
       (.I0(out2[10]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[10]),
        .I4(A[10]),
        .O(\inst_reg_reg[1] [10]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[10]_i_2 
       (.I0(in),
        .I1(Q[8]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[10]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[10]),
        .O(srcBB[10]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[10]_i_3 
       (.I0(output_rf1_reg[10]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [10]),
        .O(A[10]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[11]_i_1 
       (.I0(out2[11]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[11]),
        .I4(A[11]),
        .O(\inst_reg_reg[1] [11]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[11]_i_2 
       (.I0(in),
        .I1(Q[9]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[11]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[11]),
        .O(srcBB[11]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[11]_i_3 
       (.I0(output_rf1_reg[11]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [11]),
        .O(A[11]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[12]_i_1 
       (.I0(out2[12]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[12]),
        .I4(A[12]),
        .O(\inst_reg_reg[1] [12]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[12]_i_2 
       (.I0(in),
        .I1(Q[10]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[12]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[12]),
        .O(srcBB[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[12]_i_3 
       (.I0(output_rf1_reg[12]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [12]),
        .O(A[12]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[13]_i_1 
       (.I0(out2[13]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[13]),
        .I4(A[13]),
        .O(\inst_reg_reg[1] [13]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[13]_i_2 
       (.I0(in),
        .I1(Q[11]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[13]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[13]),
        .O(srcBB[13]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[13]_i_3 
       (.I0(output_rf1_reg[13]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [13]),
        .O(A[13]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[14]_i_1 
       (.I0(out2[14]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[14]),
        .I4(A[14]),
        .O(\inst_reg_reg[1] [14]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[14]_i_2 
       (.I0(in),
        .I1(Q[12]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[14]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[14]),
        .O(srcBB[14]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[14]_i_3 
       (.I0(output_rf1_reg[14]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [14]),
        .O(A[14]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[15]_i_1 
       (.I0(out2[15]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[15]),
        .I4(A[15]),
        .O(\inst_reg_reg[1] [15]));
  LUT6 #(
    .INIT(64'hA59A559AA5955595)) 
    \alu_out_reg[15]_i_2 
       (.I0(in),
        .I1(Q[15]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(\ALUSrcB_reg_n_0_[0] ),
        .I4(Q[13]),
        .I5(output_rf2_reg[15]),
        .O(srcBB[15]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[15]_i_3 
       (.I0(output_rf1_reg[15]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [15]),
        .O(A[15]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[16]_i_1 
       (.I0(out2[16]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[16]),
        .I4(A[16]),
        .O(\inst_reg_reg[1] [16]));
  LUT6 #(
    .INIT(64'hA59A559AA5955595)) 
    \alu_out_reg[16]_i_2 
       (.I0(in),
        .I1(Q[15]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(\ALUSrcB_reg_n_0_[0] ),
        .I4(Q[14]),
        .I5(output_rf2_reg[16]),
        .O(srcBB[16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[16]_i_3 
       (.I0(output_rf1_reg[16]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [16]),
        .O(A[16]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[17]_i_1 
       (.I0(out2[17]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[17]),
        .I4(\output_rf1_reg_reg[30] [2]),
        .O(\inst_reg_reg[1] [17]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[17]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[17]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[17]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[18]_i_1 
       (.I0(out2[18]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[18]),
        .I4(\output_rf1_reg_reg[30] [3]),
        .O(\inst_reg_reg[1] [18]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[18]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[18]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[18]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[19]_i_1 
       (.I0(out2[19]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[19]),
        .I4(\output_rf1_reg_reg[30] [4]),
        .O(\inst_reg_reg[1] [19]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[19]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[19]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[19]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[1]_i_1 
       (.I0(out2[1]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[1]),
        .I4(\output_rf1_reg_reg[30] [1]),
        .O(\inst_reg_reg[1] [1]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    \alu_out_reg[1]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[1]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[1]),
        .O(srcBB[1]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[20]_i_1 
       (.I0(out2[20]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[20]),
        .I4(\output_rf1_reg_reg[30] [5]),
        .O(\inst_reg_reg[1] [20]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[20]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[20]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[20]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[21]_i_1 
       (.I0(out2[21]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[21]),
        .I4(\output_rf1_reg_reg[30] [6]),
        .O(\inst_reg_reg[1] [21]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[21]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[21]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[21]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[22]_i_1 
       (.I0(out2[22]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[22]),
        .I4(\output_rf1_reg_reg[30] [7]),
        .O(\inst_reg_reg[1] [22]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[22]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[22]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[22]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[23]_i_1 
       (.I0(out2[23]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[23]),
        .I4(\output_rf1_reg_reg[30] [8]),
        .O(\inst_reg_reg[1] [23]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[23]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[23]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[23]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[24]_i_1 
       (.I0(out2[24]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[24]),
        .I4(\output_rf1_reg_reg[30] [9]),
        .O(\inst_reg_reg[1] [24]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[24]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[24]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[24]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[25]_i_1 
       (.I0(out2[25]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[25]),
        .I4(\output_rf1_reg_reg[30] [10]),
        .O(\inst_reg_reg[1] [25]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[25]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[25]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[25]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[26]_i_1 
       (.I0(out2[26]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[26]),
        .I4(\output_rf1_reg_reg[30] [11]),
        .O(\inst_reg_reg[1] [26]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[26]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[26]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[26]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[27]_i_1 
       (.I0(out2[27]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[27]),
        .I4(\output_rf1_reg_reg[30] [12]),
        .O(\inst_reg_reg[1] [27]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[27]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[27]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[27]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[28]_i_1 
       (.I0(out2[28]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[28]),
        .I4(\output_rf1_reg_reg[30] [13]),
        .O(\inst_reg_reg[1] [28]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[28]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[28]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[28]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[29]_i_1 
       (.I0(out2[29]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[29]),
        .I4(\output_rf1_reg_reg[30] [14]),
        .O(\inst_reg_reg[1] [29]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[29]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[29]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[29]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[2]_i_1 
       (.I0(out2[2]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[2]),
        .I4(A[2]),
        .O(\inst_reg_reg[1] [2]));
  LUT6 #(
    .INIT(64'hAA5A9A9AAA5A9595)) 
    \alu_out_reg[2]_i_2 
       (.I0(in),
        .I1(Q[2]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[0]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[2]),
        .O(srcBB[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[2]_i_3 
       (.I0(output_rf1_reg[2]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [2]),
        .O(A[2]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[30]_i_1 
       (.I0(out2[30]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[30]),
        .I4(\output_rf1_reg_reg[30] [15]),
        .O(\inst_reg_reg[1] [30]));
  LUT5 #(
    .INIT(32'hAA595559)) 
    \alu_out_reg[30]_i_2 
       (.I0(in),
        .I1(output_rf2_reg[30]),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[15]),
        .O(srcBB[30]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[31]_i_1 
       (.I0(out2[31]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(\alu_out_reg[31]_i_4_n_0 ),
        .I4(\alu_out_reg[31]_i_5_n_0 ),
        .O(\inst_reg_reg[1] [31]));
  LUT5 #(
    .INIT(32'h00B4FFFF)) 
    \alu_out_reg[31]_i_2 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(\alu_out_reg_reg[31]_0 ),
        .I4(sel0[7]),
        .O(\alu_out_reg[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBFDFFF)) 
    \alu_out_reg[31]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(sel0[7]),
        .I3(Q[3]),
        .I4(Q[2]),
        .I5(\alu_out_reg_reg[31] ),
        .O(\alu_out_reg[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h959A9595)) 
    \alu_out_reg[31]_i_4 
       (.I0(in),
        .I1(Q[15]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(\ALUSrcB_reg_n_0_[0] ),
        .I4(output_rf2_reg[31]),
        .O(\alu_out_reg[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[31]_i_5 
       (.I0(output_rf1_reg[31]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [31]),
        .O(\alu_out_reg[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[3]_i_1 
       (.I0(out2[3]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[3]),
        .I4(A[3]),
        .O(\inst_reg_reg[1] [3]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[3]_i_2 
       (.I0(in),
        .I1(Q[1]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[3]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[3]),
        .O(srcBB[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[3]_i_3 
       (.I0(output_rf1_reg[3]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [3]),
        .O(A[3]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[4]_i_1 
       (.I0(out2[4]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[4]),
        .I4(A[4]),
        .O(\inst_reg_reg[1] [4]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[4]_i_2 
       (.I0(in),
        .I1(Q[2]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[4]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[4]),
        .O(srcBB[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[4]_i_3 
       (.I0(output_rf1_reg[4]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [4]),
        .O(A[4]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[5]_i_1 
       (.I0(out2[5]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[5]),
        .I4(A[5]),
        .O(\inst_reg_reg[1] [5]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[5]_i_2 
       (.I0(in),
        .I1(Q[3]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[5]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[5]),
        .O(srcBB[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[5]_i_3 
       (.I0(output_rf1_reg[5]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [5]),
        .O(A[5]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[6]_i_1 
       (.I0(out2[6]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[6]),
        .I4(A[6]),
        .O(\inst_reg_reg[1] [6]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[6]_i_2 
       (.I0(in),
        .I1(Q[4]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[6]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[6]),
        .O(srcBB[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[6]_i_3 
       (.I0(output_rf1_reg[6]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [6]),
        .O(A[6]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[7]_i_1 
       (.I0(out2[7]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[7]),
        .I4(A[7]),
        .O(\inst_reg_reg[1] [7]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[7]_i_2 
       (.I0(in),
        .I1(Q[5]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[7]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[7]),
        .O(srcBB[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[7]_i_3 
       (.I0(output_rf1_reg[7]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [7]),
        .O(A[7]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[8]_i_1 
       (.I0(out2[8]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[8]),
        .I4(A[8]),
        .O(\inst_reg_reg[1] [8]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[8]_i_2 
       (.I0(in),
        .I1(Q[6]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[8]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[8]),
        .O(srcBB[8]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[8]_i_3 
       (.I0(output_rf1_reg[8]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [8]),
        .O(A[8]));
  LUT5 #(
    .INIT(32'hB3838380)) 
    \alu_out_reg[9]_i_1 
       (.I0(out2[9]),
        .I1(\alu_out_reg[31]_i_2_n_0 ),
        .I2(\alu_out_reg[31]_i_3_n_0 ),
        .I3(srcBB[9]),
        .I4(A[9]),
        .O(\inst_reg_reg[1] [9]));
  LUT6 #(
    .INIT(64'h9595AA5A9595A555)) 
    \alu_out_reg[9]_i_2 
       (.I0(in),
        .I1(Q[7]),
        .I2(\ALUSrcB_reg_n_0_[1] ),
        .I3(Q[9]),
        .I4(\ALUSrcB_reg_n_0_[0] ),
        .I5(output_rf2_reg[9]),
        .O(srcBB[9]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_reg[9]_i_3 
       (.I0(output_rf1_reg[9]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [9]),
        .O(A[9]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \led[7]_i_1 
       (.I0(\led_reg[0] ),
        .I1(\output_rf2_reg_reg[29] [21]),
        .I2(RegWrite),
        .I3(\output_rf2_reg_reg[29] [29]),
        .I4(\led_reg[0]_0 ),
        .I5(\led_reg[0]_1 ),
        .O(\pc_reg[21] ));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_1
       (.I0(output_rf1_reg[15]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [15]),
        .O(\output_rf1_reg_reg[15] [7]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_10
       (.I0(srcBB[14]),
        .I1(\output_rf2_reg_reg[29] [14]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[14]),
        .O(\pc_reg[15] [6]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_11
       (.I0(srcBB[13]),
        .I1(\output_rf2_reg_reg[29] [13]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[13]),
        .O(\pc_reg[15] [5]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_12
       (.I0(srcBB[12]),
        .I1(\output_rf2_reg_reg[29] [12]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[12]),
        .O(\pc_reg[15] [4]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_13
       (.I0(srcBB[11]),
        .I1(\output_rf2_reg_reg[29] [11]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[11]),
        .O(\pc_reg[15] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_14
       (.I0(srcBB[10]),
        .I1(\output_rf2_reg_reg[29] [10]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[10]),
        .O(\pc_reg[15] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_15
       (.I0(srcBB[9]),
        .I1(\output_rf2_reg_reg[29] [9]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[9]),
        .O(\pc_reg[15] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_16
       (.I0(srcBB[8]),
        .I1(\output_rf2_reg_reg[29] [8]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[8]),
        .O(\pc_reg[15] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_2
       (.I0(output_rf1_reg[14]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [14]),
        .O(\output_rf1_reg_reg[15] [6]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_3
       (.I0(output_rf1_reg[13]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [13]),
        .O(\output_rf1_reg_reg[15] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_4
       (.I0(output_rf1_reg[12]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [12]),
        .O(\output_rf1_reg_reg[15] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_5
       (.I0(output_rf1_reg[11]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [11]),
        .O(\output_rf1_reg_reg[15] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_6
       (.I0(output_rf1_reg[10]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [10]),
        .O(\output_rf1_reg_reg[15] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_7
       (.I0(output_rf1_reg[9]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [9]),
        .O(\output_rf1_reg_reg[15] [1]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__0_i_8
       (.I0(output_rf1_reg[8]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [8]),
        .O(\output_rf1_reg_reg[15] [0]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__0_i_9
       (.I0(srcBB[15]),
        .I1(\output_rf2_reg_reg[29] [15]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[15]),
        .O(\pc_reg[15] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_1
       (.I0(output_rf1_reg[23]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [23]),
        .O(\output_rf1_reg_reg[30] [8]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_10
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[22]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [7]),
        .O(\inst_reg_reg[15] [6]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_11
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[21]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [6]),
        .O(\inst_reg_reg[15] [5]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_12
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[20]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [5]),
        .O(\inst_reg_reg[15] [4]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_13
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[19]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [4]),
        .O(\inst_reg_reg[15] [3]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_14
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[18]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [3]),
        .O(\inst_reg_reg[15] [2]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_15
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[17]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [2]),
        .O(\inst_reg_reg[15] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__1_i_16
       (.I0(srcBB[16]),
        .I1(\output_rf2_reg_reg[29] [16]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[16]),
        .O(\inst_reg_reg[15] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_2
       (.I0(output_rf1_reg[22]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [22]),
        .O(\output_rf1_reg_reg[30] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_3
       (.I0(output_rf1_reg[21]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [21]),
        .O(\output_rf1_reg_reg[30] [6]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_4
       (.I0(output_rf1_reg[20]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [20]),
        .O(\output_rf1_reg_reg[30] [5]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_5
       (.I0(output_rf1_reg[19]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [19]),
        .O(\output_rf1_reg_reg[30] [4]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_6
       (.I0(output_rf1_reg[18]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [18]),
        .O(\output_rf1_reg_reg[30] [3]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_7
       (.I0(output_rf1_reg[17]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [17]),
        .O(\output_rf1_reg_reg[30] [2]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__1_i_8
       (.I0(output_rf1_reg[16]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [16]),
        .O(\output_rf1_reg_reg[16] ));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__1_i_9
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[23]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [8]),
        .O(\inst_reg_reg[15] [7]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_1
       (.I0(output_rf1_reg[30]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [30]),
        .O(\output_rf1_reg_reg[30] [15]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_10
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[29]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [14]),
        .O(\pc_reg[31] [5]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_11
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[28]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [13]),
        .O(\pc_reg[31] [4]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_12
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[27]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [12]),
        .O(\pc_reg[31] [3]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_13
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[26]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [11]),
        .O(\pc_reg[31] [2]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_14
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[25]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [10]),
        .O(\pc_reg[31] [1]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_15
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[24]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [9]),
        .O(\pc_reg[31] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_2
       (.I0(output_rf1_reg[29]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [29]),
        .O(\output_rf1_reg_reg[30] [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_3
       (.I0(output_rf1_reg[28]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [28]),
        .O(\output_rf1_reg_reg[30] [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_4
       (.I0(output_rf1_reg[27]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [27]),
        .O(\output_rf1_reg_reg[30] [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_5
       (.I0(output_rf1_reg[26]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [26]),
        .O(\output_rf1_reg_reg[30] [11]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_6
       (.I0(output_rf1_reg[25]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [25]),
        .O(\output_rf1_reg_reg[30] [10]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry__2_i_7
       (.I0(output_rf1_reg[24]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [24]),
        .O(\output_rf1_reg_reg[30] [9]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry__2_i_8
       (.I0(\alu_out_reg[31]_i_4_n_0 ),
        .I1(\output_rf2_reg_reg[29] [31]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[31]),
        .O(\pc_reg[31] [7]));
  LUT6 #(
    .INIT(64'h74778B888B887477)) 
    out2_carry__2_i_9
       (.I0(Q[15]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[30]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [15]),
        .O(\pc_reg[31] [6]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_1
       (.I0(output_rf1_reg[0]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [0]),
        .O(\output_rf1_reg_reg[30] [0]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_10
       (.I0(srcBB[7]),
        .I1(\output_rf2_reg_reg[29] [7]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[7]),
        .O(S[7]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_11
       (.I0(srcBB[6]),
        .I1(\output_rf2_reg_reg[29] [6]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[6]),
        .O(S[6]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_12
       (.I0(srcBB[5]),
        .I1(\output_rf2_reg_reg[29] [5]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[5]),
        .O(S[5]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_13
       (.I0(srcBB[4]),
        .I1(\output_rf2_reg_reg[29] [4]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[4]),
        .O(S[4]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_14
       (.I0(srcBB[3]),
        .I1(\output_rf2_reg_reg[29] [3]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[3]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    out2_carry_i_15
       (.I0(srcBB[2]),
        .I1(\output_rf2_reg_reg[29] [2]),
        .I2(ALUSrcA),
        .I3(output_rf1_reg[2]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'hF4F70B080B08F4F7)) 
    out2_carry_i_16
       (.I0(Q[1]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(\ALUSrcB_reg_n_0_[0] ),
        .I3(output_rf2_reg[1]),
        .I4(in),
        .I5(\output_rf1_reg_reg[30] [1]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h00B8)) 
    out2_carry_i_17
       (.I0(Q[0]),
        .I1(\ALUSrcB_reg_n_0_[1] ),
        .I2(output_rf2_reg[0]),
        .I3(\ALUSrcB_reg_n_0_[0] ),
        .O(S[0]));
  LUT5 #(
    .INIT(32'hF5F5C5F5)) 
    out2_carry_i_18
       (.I0(sel0[6]),
        .I1(out2_carry_i_16_0),
        .I2(sel0[7]),
        .I3(Q[5]),
        .I4(Q[4]),
        .O(in));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_2
       (.I0(output_rf1_reg[7]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [7]),
        .O(DI[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_3
       (.I0(output_rf1_reg[6]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [6]),
        .O(DI[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_4
       (.I0(output_rf1_reg[5]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [5]),
        .O(DI[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_5
       (.I0(output_rf1_reg[4]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [4]),
        .O(DI[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_6
       (.I0(output_rf1_reg[3]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [3]),
        .O(DI[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_7
       (.I0(output_rf1_reg[2]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [2]),
        .O(DI[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    out2_carry_i_8
       (.I0(output_rf1_reg[1]),
        .I1(ALUSrcA),
        .I2(\output_rf2_reg_reg[29] [1]),
        .O(\output_rf1_reg_reg[30] [1]));
  LUT5 #(
    .INIT(32'h66655565)) 
    out2_carry_i_9
       (.I0(in),
        .I1(\ALUSrcB_reg_n_0_[0] ),
        .I2(output_rf2_reg[0]),
        .I3(\ALUSrcB_reg_n_0_[1] ),
        .I4(Q[0]),
        .O(DI[0]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[0]_i_1 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [0]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[10]_i_1 
       (.I0(Q[8]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [10]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[11]_i_1 
       (.I0(Q[9]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [11]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [11]),
        .O(D[11]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[12]_i_1 
       (.I0(Q[10]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [12]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[13]_i_1 
       (.I0(Q[11]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [13]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [13]),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[14]_i_1 
       (.I0(Q[12]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [14]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [14]),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[15]_i_1 
       (.I0(Q[13]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [15]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [15]),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[16]_i_1 
       (.I0(Q[14]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [16]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [16]),
        .O(D[16]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[17]_i_1 
       (.I0(Q[15]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [17]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [17]),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[18]_i_1 
       (.I0(Q[16]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [18]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [18]),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[19]_i_1 
       (.I0(Q[17]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [19]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [19]),
        .O(D[19]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[1]_i_1 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [1]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[20]_i_1 
       (.I0(Q[18]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [20]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [20]),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[21]_i_1 
       (.I0(Q[19]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [21]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [21]),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[22]_i_1 
       (.I0(Q[20]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [22]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [22]),
        .O(D[22]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[23]_i_1 
       (.I0(Q[21]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [23]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [23]),
        .O(D[23]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[24]_i_1 
       (.I0(Q[22]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [24]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [24]),
        .O(D[24]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[25]_i_1 
       (.I0(Q[23]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [25]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [25]),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[26]_i_1 
       (.I0(Q[24]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [26]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [26]),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[27]_i_1 
       (.I0(Q[25]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [27]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [27]),
        .O(D[27]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[28]_i_1 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [28]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [28]),
        .O(D[28]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[29]_i_1 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [29]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [29]),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[2]_i_1 
       (.I0(Q[0]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [2]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [2]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[30]_i_1 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [30]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [30]),
        .O(D[30]));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAA60000)) 
    \pc[31]_i_1 
       (.I0(ToggleEqual),
        .I1(\pc_reg[0] ),
        .I2(\pc_reg[0]_0 ),
        .I3(\pc_reg[0]_1 ),
        .I4(Branch),
        .I5(\pc[31]_i_6_n_0 ),
        .O(ToggleEqual_reg_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \pc[31]_i_15 
       (.I0(Q[26]),
        .I1(Q[28]),
        .I2(\ALUSrcB[1]_i_4_n_0 ),
        .I3(\pc[31]_i_7_0 ),
        .I4(state__0[2]),
        .I5(\RegDst[0]_i_2_n_0 ),
        .O(\pc[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \pc[31]_i_2 
       (.I0(\pc[31]_i_7_n_0 ),
        .I1(\pc_reg[31]_0 [31]),
        .I2(\pc[31]_i_8_n_0 ),
        .I3(\inst_reg_reg[1] [31]),
        .O(D[31]));
  LUT2 #(
    .INIT(4'hE)) 
    \pc[31]_i_6 
       (.I0(PCWrite_temp),
        .I1(\pc[31]_i_15_n_0 ),
        .O(\pc[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \pc[31]_i_7 
       (.I0(PCSrc_temp[1]),
        .I1(\pc[31]_i_15_n_0 ),
        .I2(PCSrc_temp[0]),
        .O(\pc[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h0E)) 
    \pc[31]_i_8 
       (.I0(PCSrc_temp[0]),
        .I1(PCSrc_temp[1]),
        .I2(\pc[31]_i_15_n_0 ),
        .O(\pc[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[3]_i_1 
       (.I0(Q[1]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [3]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[4]_i_1 
       (.I0(Q[2]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [4]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[5]_i_1 
       (.I0(Q[3]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [5]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [5]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[6]_i_1 
       (.I0(Q[4]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [6]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[7]_i_1 
       (.I0(Q[5]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [7]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[8]_i_1 
       (.I0(Q[6]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [8]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [8]),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \pc[9]_i_1 
       (.I0(Q[7]),
        .I1(\pc[31]_i_7_n_0 ),
        .I2(\pc_reg[31]_0 [9]),
        .I3(\pc[31]_i_8_n_0 ),
        .I4(\inst_reg_reg[1] [9]),
        .O(D[9]));
endmodule

(* ORIG_REF_NAME = "multicycle_cpu" *) 
module multi_fib_fpga_multicycle_cpu_0_0_multicycle_cpu
   (led,
    clk,
    rstn);
  output [7:0]led;
  input clk;
  input rstn;

  wire [30:0]A;
  wire IRWrite;
  wire MemWrite;
  wire RegWrite;
  wire a_n_32;
  wire a_n_33;
  wire a_n_34;
  wire a_n_35;
  wire [2:2]adr;
  wire [2:0]alu_out_reg;
  wire \alu_out_reg[31]_i_6_n_0 ;
  wire \alu_out_reg[31]_i_7_n_0 ;
  wire \alu_out_reg_reg_n_0_[10] ;
  wire \alu_out_reg_reg_n_0_[11] ;
  wire \alu_out_reg_reg_n_0_[12] ;
  wire \alu_out_reg_reg_n_0_[13] ;
  wire \alu_out_reg_reg_n_0_[14] ;
  wire \alu_out_reg_reg_n_0_[15] ;
  wire \alu_out_reg_reg_n_0_[16] ;
  wire \alu_out_reg_reg_n_0_[17] ;
  wire \alu_out_reg_reg_n_0_[18] ;
  wire \alu_out_reg_reg_n_0_[19] ;
  wire \alu_out_reg_reg_n_0_[20] ;
  wire \alu_out_reg_reg_n_0_[21] ;
  wire \alu_out_reg_reg_n_0_[22] ;
  wire \alu_out_reg_reg_n_0_[23] ;
  wire \alu_out_reg_reg_n_0_[24] ;
  wire \alu_out_reg_reg_n_0_[25] ;
  wire \alu_out_reg_reg_n_0_[26] ;
  wire \alu_out_reg_reg_n_0_[27] ;
  wire \alu_out_reg_reg_n_0_[28] ;
  wire \alu_out_reg_reg_n_0_[29] ;
  wire \alu_out_reg_reg_n_0_[30] ;
  wire \alu_out_reg_reg_n_0_[31] ;
  wire \alu_out_reg_reg_n_0_[3] ;
  wire \alu_out_reg_reg_n_0_[4] ;
  wire \alu_out_reg_reg_n_0_[5] ;
  wire \alu_out_reg_reg_n_0_[6] ;
  wire \alu_out_reg_reg_n_0_[7] ;
  wire \alu_out_reg_reg_n_0_[8] ;
  wire \alu_out_reg_reg_n_0_[9] ;
  wire [31:0]alu_result;
  wire clk;
  wire [31:0]data_reg;
  wire \inst_reg_reg_n_0_[0] ;
  wire \inst_reg_reg_n_0_[10] ;
  wire \inst_reg_reg_n_0_[11] ;
  wire \inst_reg_reg_n_0_[12] ;
  wire \inst_reg_reg_n_0_[13] ;
  wire \inst_reg_reg_n_0_[14] ;
  wire \inst_reg_reg_n_0_[15] ;
  wire \inst_reg_reg_n_0_[1] ;
  wire \inst_reg_reg_n_0_[2] ;
  wire \inst_reg_reg_n_0_[3] ;
  wire \inst_reg_reg_n_0_[4] ;
  wire \inst_reg_reg_n_0_[5] ;
  wire \inst_reg_reg_n_0_[6] ;
  wire \inst_reg_reg_n_0_[7] ;
  wire \inst_reg_reg_n_0_[8] ;
  wire \inst_reg_reg_n_0_[9] ;
  wire [7:0]led;
  wire led0;
  wire \led[7]_i_2_n_0 ;
  wire \led[7]_i_3_n_0 ;
  wire \led[7]_i_4_n_0 ;
  wire \led[7]_i_5_n_0 ;
  wire \led[7]_i_6_n_0 ;
  wire \led[7]_i_7_n_0 ;
  wire \led[7]_i_8_n_0 ;
  wire mcu_n_10;
  wire mcu_n_102;
  wire mcu_n_103;
  wire mcu_n_104;
  wire mcu_n_105;
  wire mcu_n_106;
  wire mcu_n_139;
  wire mcu_n_140;
  wire mcu_n_141;
  wire mcu_n_142;
  wire mcu_n_143;
  wire mcu_n_144;
  wire mcu_n_145;
  wire mcu_n_146;
  wire mcu_n_147;
  wire mcu_n_148;
  wire mcu_n_149;
  wire mcu_n_150;
  wire mcu_n_151;
  wire mcu_n_152;
  wire mcu_n_153;
  wire mcu_n_154;
  wire mcu_n_155;
  wire mcu_n_156;
  wire mcu_n_157;
  wire mcu_n_158;
  wire mcu_n_159;
  wire mcu_n_160;
  wire mcu_n_161;
  wire mcu_n_162;
  wire mcu_n_163;
  wire mcu_n_164;
  wire mcu_n_165;
  wire mcu_n_166;
  wire mcu_n_167;
  wire mcu_n_168;
  wire mcu_n_169;
  wire mcu_n_170;
  wire mcu_n_3;
  wire mcu_n_4;
  wire mcu_n_5;
  wire mcu_n_6;
  wire mcu_n_7;
  wire mcu_n_8;
  wire mcu_n_9;
  wire mcu_n_92;
  wire mcu_n_93;
  wire mcu_n_94;
  wire mcu_n_95;
  wire mcu_n_96;
  wire mcu_n_97;
  wire mcu_n_98;
  wire mcu_n_99;
  wire [4:0]op2;
  wire [5:0]opcode;
  wire [31:0]out2;
  wire [31:0]output_rf1_reg;
  wire [31:0]output_rf2_reg;
  wire [31:0]pc;
  wire \pc[31]_i_16_n_0 ;
  wire [31:0]pc_;
  wire pcen;
  wire [4:0]ra;
  wire [31:0]rd;
  wire [31:0]rd_0;
  wire rf2_n_0;
  wire rf2_n_1;
  wire rf2_n_10;
  wire rf2_n_11;
  wire rf2_n_12;
  wire rf2_n_13;
  wire rf2_n_14;
  wire rf2_n_15;
  wire rf2_n_16;
  wire rf2_n_17;
  wire rf2_n_18;
  wire rf2_n_19;
  wire rf2_n_2;
  wire rf2_n_20;
  wire rf2_n_21;
  wire rf2_n_22;
  wire rf2_n_23;
  wire rf2_n_24;
  wire rf2_n_25;
  wire rf2_n_26;
  wire rf2_n_27;
  wire rf2_n_28;
  wire rf2_n_29;
  wire rf2_n_3;
  wire rf2_n_30;
  wire rf2_n_31;
  wire rf2_n_4;
  wire rf2_n_5;
  wire rf2_n_6;
  wire rf2_n_7;
  wire rf2_n_8;
  wire rf2_n_9;
  wire rstn;
  wire [31:0]wd;

  multi_fib_fpga_multicycle_cpu_0_0_alu a
       (.A({A[30:17],A[1:0]}),
        .DI({mcu_n_139,mcu_n_140,mcu_n_141,mcu_n_142,mcu_n_143,mcu_n_144,mcu_n_145}),
        .Q({\inst_reg_reg_n_0_[2] ,\inst_reg_reg_n_0_[1] ,\inst_reg_reg_n_0_[0] }),
        .S({mcu_n_3,mcu_n_4,mcu_n_5,mcu_n_6,mcu_n_7,mcu_n_8,mcu_n_9,mcu_n_10}),
        .\alu_out_reg_reg[15] ({mcu_n_146,mcu_n_147,mcu_n_148,mcu_n_149,mcu_n_150,mcu_n_151,mcu_n_152,mcu_n_153}),
        .\alu_out_reg_reg[15]_0 ({mcu_n_155,mcu_n_156,mcu_n_157,mcu_n_158,mcu_n_159,mcu_n_160,mcu_n_161,mcu_n_162}),
        .\alu_out_reg_reg[23] (mcu_n_154),
        .\alu_out_reg_reg[23]_0 ({mcu_n_163,mcu_n_164,mcu_n_165,mcu_n_166,mcu_n_167,mcu_n_168,mcu_n_169,mcu_n_170}),
        .\alu_out_reg_reg[31] ({mcu_n_92,mcu_n_93,mcu_n_94,mcu_n_95,mcu_n_96,mcu_n_97,mcu_n_98,mcu_n_99}),
        .\inst_reg_reg[0] (a_n_32),
        .out2(out2),
        .\pc[31]_i_12_0 (a_n_33),
        .\pc[31]_i_13_0 (a_n_35),
        .\pc[31]_i_14_0 (a_n_34));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \alu_out_reg[31]_i_6 
       (.I0(\inst_reg_reg_n_0_[2] ),
        .I1(\inst_reg_reg_n_0_[4] ),
        .I2(\inst_reg_reg_n_0_[0] ),
        .O(\alu_out_reg[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \alu_out_reg[31]_i_7 
       (.I0(\inst_reg_reg_n_0_[4] ),
        .I1(\inst_reg_reg_n_0_[5] ),
        .O(\alu_out_reg[31]_i_7_n_0 ));
  FDRE \alu_out_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[0]),
        .Q(alu_out_reg[0]),
        .R(1'b0));
  FDRE \alu_out_reg_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[10]),
        .Q(\alu_out_reg_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[11]),
        .Q(\alu_out_reg_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[12]),
        .Q(\alu_out_reg_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[13]),
        .Q(\alu_out_reg_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[14]),
        .Q(\alu_out_reg_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[15]),
        .Q(\alu_out_reg_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[16]),
        .Q(\alu_out_reg_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[17]),
        .Q(\alu_out_reg_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[18]),
        .Q(\alu_out_reg_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[19]),
        .Q(\alu_out_reg_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[1]),
        .Q(alu_out_reg[1]),
        .R(1'b0));
  FDRE \alu_out_reg_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[20]),
        .Q(\alu_out_reg_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[21]),
        .Q(\alu_out_reg_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[22]),
        .Q(\alu_out_reg_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[23]),
        .Q(\alu_out_reg_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[24]),
        .Q(\alu_out_reg_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[25]),
        .Q(\alu_out_reg_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[26]),
        .Q(\alu_out_reg_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[27]),
        .Q(\alu_out_reg_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[28]),
        .Q(\alu_out_reg_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[29]),
        .Q(\alu_out_reg_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[2]),
        .Q(alu_out_reg[2]),
        .R(1'b0));
  FDRE \alu_out_reg_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[30]),
        .Q(\alu_out_reg_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[31]),
        .Q(\alu_out_reg_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[3]),
        .Q(\alu_out_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[4]),
        .Q(\alu_out_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[5]),
        .Q(\alu_out_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[6]),
        .Q(\alu_out_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[7]),
        .Q(\alu_out_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[8]),
        .Q(\alu_out_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \alu_out_reg_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(alu_result[9]),
        .Q(\alu_out_reg_reg_n_0_[9] ),
        .R(1'b0));
  FDRE \data_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[0]),
        .Q(data_reg[0]),
        .R(1'b0));
  FDRE \data_reg_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[10]),
        .Q(data_reg[10]),
        .R(1'b0));
  FDRE \data_reg_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[11]),
        .Q(data_reg[11]),
        .R(1'b0));
  FDRE \data_reg_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[12]),
        .Q(data_reg[12]),
        .R(1'b0));
  FDRE \data_reg_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[13]),
        .Q(data_reg[13]),
        .R(1'b0));
  FDRE \data_reg_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[14]),
        .Q(data_reg[14]),
        .R(1'b0));
  FDRE \data_reg_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[15]),
        .Q(data_reg[15]),
        .R(1'b0));
  FDRE \data_reg_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[16]),
        .Q(data_reg[16]),
        .R(1'b0));
  FDRE \data_reg_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[17]),
        .Q(data_reg[17]),
        .R(1'b0));
  FDRE \data_reg_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[18]),
        .Q(data_reg[18]),
        .R(1'b0));
  FDRE \data_reg_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[19]),
        .Q(data_reg[19]),
        .R(1'b0));
  FDRE \data_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[1]),
        .Q(data_reg[1]),
        .R(1'b0));
  FDRE \data_reg_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[20]),
        .Q(data_reg[20]),
        .R(1'b0));
  FDRE \data_reg_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[21]),
        .Q(data_reg[21]),
        .R(1'b0));
  FDRE \data_reg_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[22]),
        .Q(data_reg[22]),
        .R(1'b0));
  FDRE \data_reg_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[23]),
        .Q(data_reg[23]),
        .R(1'b0));
  FDRE \data_reg_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[24]),
        .Q(data_reg[24]),
        .R(1'b0));
  FDRE \data_reg_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[25]),
        .Q(data_reg[25]),
        .R(1'b0));
  FDRE \data_reg_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[26]),
        .Q(data_reg[26]),
        .R(1'b0));
  FDRE \data_reg_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[27]),
        .Q(data_reg[27]),
        .R(1'b0));
  FDRE \data_reg_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[28]),
        .Q(data_reg[28]),
        .R(1'b0));
  FDRE \data_reg_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[29]),
        .Q(data_reg[29]),
        .R(1'b0));
  FDRE \data_reg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[2]),
        .Q(data_reg[2]),
        .R(1'b0));
  FDRE \data_reg_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[30]),
        .Q(data_reg[30]),
        .R(1'b0));
  FDRE \data_reg_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[31]),
        .Q(data_reg[31]),
        .R(1'b0));
  FDRE \data_reg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[3]),
        .Q(data_reg[3]),
        .R(1'b0));
  FDRE \data_reg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[4]),
        .Q(data_reg[4]),
        .R(1'b0));
  FDRE \data_reg_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[5]),
        .Q(data_reg[5]),
        .R(1'b0));
  FDRE \data_reg_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[6]),
        .Q(data_reg[6]),
        .R(1'b0));
  FDRE \data_reg_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[7]),
        .Q(data_reg[7]),
        .R(1'b0));
  FDRE \data_reg_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[8]),
        .Q(data_reg[8]),
        .R(1'b0));
  FDRE \data_reg_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_0[9]),
        .Q(data_reg[9]),
        .R(1'b0));
  multi_fib_fpga_multicycle_cpu_0_0_rams_sp_rf idmd
       (.ADDRARDADDR(adr),
        .WEA(MemWrite),
        .clk(clk),
        .dout(rd_0),
        .output_rf2_reg(output_rf2_reg));
  FDRE \inst_reg_reg[0] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[0]),
        .Q(\inst_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \inst_reg_reg[10] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[10]),
        .Q(\inst_reg_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \inst_reg_reg[11] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[11]),
        .Q(\inst_reg_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \inst_reg_reg[12] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[12]),
        .Q(\inst_reg_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \inst_reg_reg[13] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[13]),
        .Q(\inst_reg_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \inst_reg_reg[14] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[14]),
        .Q(\inst_reg_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \inst_reg_reg[15] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[15]),
        .Q(\inst_reg_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \inst_reg_reg[16] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[16]),
        .Q(op2[0]),
        .R(1'b0));
  FDRE \inst_reg_reg[17] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[17]),
        .Q(op2[1]),
        .R(1'b0));
  FDRE \inst_reg_reg[18] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[18]),
        .Q(op2[2]),
        .R(1'b0));
  FDRE \inst_reg_reg[19] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[19]),
        .Q(op2[3]),
        .R(1'b0));
  FDRE \inst_reg_reg[1] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[1]),
        .Q(\inst_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \inst_reg_reg[20] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[20]),
        .Q(op2[4]),
        .R(1'b0));
  FDRE \inst_reg_reg[21] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[21]),
        .Q(ra[0]),
        .R(1'b0));
  FDRE \inst_reg_reg[22] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[22]),
        .Q(ra[1]),
        .R(1'b0));
  FDRE \inst_reg_reg[23] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[23]),
        .Q(ra[2]),
        .R(1'b0));
  FDRE \inst_reg_reg[24] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[24]),
        .Q(ra[3]),
        .R(1'b0));
  FDRE \inst_reg_reg[25] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[25]),
        .Q(ra[4]),
        .R(1'b0));
  FDRE \inst_reg_reg[26] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[26]),
        .Q(opcode[0]),
        .R(1'b0));
  FDRE \inst_reg_reg[27] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[27]),
        .Q(opcode[1]),
        .R(1'b0));
  FDRE \inst_reg_reg[28] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[28]),
        .Q(opcode[2]),
        .R(1'b0));
  FDRE \inst_reg_reg[29] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[29]),
        .Q(opcode[3]),
        .R(1'b0));
  FDRE \inst_reg_reg[2] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[2]),
        .Q(\inst_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \inst_reg_reg[30] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[30]),
        .Q(opcode[4]),
        .R(1'b0));
  FDRE \inst_reg_reg[31] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[31]),
        .Q(opcode[5]),
        .R(1'b0));
  FDRE \inst_reg_reg[3] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[3]),
        .Q(\inst_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \inst_reg_reg[4] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[4]),
        .Q(\inst_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \inst_reg_reg[5] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[5]),
        .Q(\inst_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \inst_reg_reg[6] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[6]),
        .Q(\inst_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \inst_reg_reg[7] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[7]),
        .Q(\inst_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \inst_reg_reg[8] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[8]),
        .Q(\inst_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \inst_reg_reg[9] 
       (.C(clk),
        .CE(IRWrite),
        .D(rd_0[9]),
        .Q(\inst_reg_reg_n_0_[9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \led[7]_i_2 
       (.I0(pc[0]),
        .I1(pc[2]),
        .I2(pc[28]),
        .I3(pc[6]),
        .I4(\led[7]_i_5_n_0 ),
        .O(\led[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \led[7]_i_3 
       (.I0(\led[7]_i_6_n_0 ),
        .I1(pc[7]),
        .I2(pc[19]),
        .I3(pc[25]),
        .I4(pc[16]),
        .I5(\led[7]_i_7_n_0 ),
        .O(\led[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[7]_i_4 
       (.I0(pc[14]),
        .I1(pc[9]),
        .I2(pc[3]),
        .I3(pc[13]),
        .I4(pc[1]),
        .I5(pc[8]),
        .O(\led[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led[7]_i_5 
       (.I0(pc[24]),
        .I1(pc[31]),
        .I2(pc[22]),
        .I3(pc[12]),
        .O(\led[7]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led[7]_i_6 
       (.I0(pc[11]),
        .I1(pc[5]),
        .I2(pc[26]),
        .I3(pc[15]),
        .O(\led[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led[7]_i_7 
       (.I0(pc[17]),
        .I1(pc[23]),
        .I2(pc[27]),
        .I3(pc[30]),
        .I4(\led[7]_i_8_n_0 ),
        .O(\led[7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \led[7]_i_8 
       (.I0(pc[20]),
        .I1(pc[10]),
        .I2(pc[4]),
        .I3(pc[18]),
        .O(\led[7]_i_8_n_0 ));
  FDRE \led_reg[0] 
       (.C(clk),
        .CE(led0),
        .D(alu_out_reg[0]),
        .Q(led[0]),
        .R(1'b0));
  FDRE \led_reg[1] 
       (.C(clk),
        .CE(led0),
        .D(alu_out_reg[1]),
        .Q(led[1]),
        .R(1'b0));
  FDRE \led_reg[2] 
       (.C(clk),
        .CE(led0),
        .D(alu_out_reg[2]),
        .Q(led[2]),
        .R(1'b0));
  FDRE \led_reg[3] 
       (.C(clk),
        .CE(led0),
        .D(\alu_out_reg_reg_n_0_[3] ),
        .Q(led[3]),
        .R(1'b0));
  FDRE \led_reg[4] 
       (.C(clk),
        .CE(led0),
        .D(\alu_out_reg_reg_n_0_[4] ),
        .Q(led[4]),
        .R(1'b0));
  FDRE \led_reg[5] 
       (.C(clk),
        .CE(led0),
        .D(\alu_out_reg_reg_n_0_[5] ),
        .Q(led[5]),
        .R(1'b0));
  FDRE \led_reg[6] 
       (.C(clk),
        .CE(led0),
        .D(\alu_out_reg_reg_n_0_[6] ),
        .Q(led[6]),
        .R(1'b0));
  FDRE \led_reg[7] 
       (.C(clk),
        .CE(led0),
        .D(\alu_out_reg_reg_n_0_[7] ),
        .Q(led[7]),
        .R(1'b0));
  multi_fib_fpga_multicycle_cpu_0_0_multi_control_unit mcu
       (.ADDRARDADDR(adr),
        .D(pc_),
        .DI({mcu_n_139,mcu_n_140,mcu_n_141,mcu_n_142,mcu_n_143,mcu_n_144,mcu_n_145}),
        .E(IRWrite),
        .Q({opcode,ra,op2,\inst_reg_reg_n_0_[15] ,\inst_reg_reg_n_0_[14] ,\inst_reg_reg_n_0_[13] ,\inst_reg_reg_n_0_[12] ,\inst_reg_reg_n_0_[11] ,\inst_reg_reg_n_0_[10] ,\inst_reg_reg_n_0_[9] ,\inst_reg_reg_n_0_[8] ,\inst_reg_reg_n_0_[7] ,\inst_reg_reg_n_0_[6] ,\inst_reg_reg_n_0_[5] ,\inst_reg_reg_n_0_[4] ,\inst_reg_reg_n_0_[3] ,\inst_reg_reg_n_0_[2] ,\inst_reg_reg_n_0_[1] ,\inst_reg_reg_n_0_[0] }),
        .RegWrite(RegWrite),
        .S({mcu_n_3,mcu_n_4,mcu_n_5,mcu_n_6,mcu_n_7,mcu_n_8,mcu_n_9,mcu_n_10}),
        .ToggleEqual_reg(pcen),
        .WEA(MemWrite),
        .\alu_out_reg_reg[31] (\alu_out_reg[31]_i_7_n_0 ),
        .\alu_out_reg_reg[31]_0 (\alu_out_reg[31]_i_6_n_0 ),
        .clk(clk),
        .\inst_reg_reg[15] ({mcu_n_163,mcu_n_164,mcu_n_165,mcu_n_166,mcu_n_167,mcu_n_168,mcu_n_169,mcu_n_170}),
        .\inst_reg_reg[1] (alu_result),
        .\led_reg[0] (\led[7]_i_2_n_0 ),
        .\led_reg[0]_0 (\led[7]_i_3_n_0 ),
        .\led_reg[0]_1 (\led[7]_i_4_n_0 ),
        .out2(out2),
        .out2_carry_i_16(a_n_32),
        .output_rf1_reg(output_rf1_reg),
        .\output_rf1_reg_reg[15] ({mcu_n_146,mcu_n_147,mcu_n_148,mcu_n_149,mcu_n_150,mcu_n_151,mcu_n_152,mcu_n_153}),
        .\output_rf1_reg_reg[16] (mcu_n_154),
        .\output_rf1_reg_reg[30] ({A[30:17],A[1:0]}),
        .output_rf2_reg(output_rf2_reg),
        .\output_rf2_reg_reg[29] (pc),
        .\output_rf2_reg_reg[29]_0 (data_reg),
        .p_2_out({mcu_n_102,mcu_n_103,mcu_n_104,mcu_n_105,mcu_n_106}),
        .\pc[31]_i_7 (\pc[31]_i_16_n_0 ),
        .\pc_reg[0] (a_n_33),
        .\pc_reg[0]_0 (a_n_35),
        .\pc_reg[0]_1 (a_n_34),
        .\pc_reg[15] ({mcu_n_155,mcu_n_156,mcu_n_157,mcu_n_158,mcu_n_159,mcu_n_160,mcu_n_161,mcu_n_162}),
        .\pc_reg[21] (led0),
        .\pc_reg[31] ({mcu_n_92,mcu_n_93,mcu_n_94,mcu_n_95,mcu_n_96,mcu_n_97,mcu_n_98,mcu_n_99}),
        .\pc_reg[31]_0 ({\alu_out_reg_reg_n_0_[31] ,\alu_out_reg_reg_n_0_[30] ,\alu_out_reg_reg_n_0_[29] ,\alu_out_reg_reg_n_0_[28] ,\alu_out_reg_reg_n_0_[27] ,\alu_out_reg_reg_n_0_[26] ,\alu_out_reg_reg_n_0_[25] ,\alu_out_reg_reg_n_0_[24] ,\alu_out_reg_reg_n_0_[23] ,\alu_out_reg_reg_n_0_[22] ,\alu_out_reg_reg_n_0_[21] ,\alu_out_reg_reg_n_0_[20] ,\alu_out_reg_reg_n_0_[19] ,\alu_out_reg_reg_n_0_[18] ,\alu_out_reg_reg_n_0_[17] ,\alu_out_reg_reg_n_0_[16] ,\alu_out_reg_reg_n_0_[15] ,\alu_out_reg_reg_n_0_[14] ,\alu_out_reg_reg_n_0_[13] ,\alu_out_reg_reg_n_0_[12] ,\alu_out_reg_reg_n_0_[11] ,\alu_out_reg_reg_n_0_[10] ,\alu_out_reg_reg_n_0_[9] ,\alu_out_reg_reg_n_0_[8] ,\alu_out_reg_reg_n_0_[7] ,\alu_out_reg_reg_n_0_[6] ,\alu_out_reg_reg_n_0_[5] ,\alu_out_reg_reg_n_0_[4] ,\alu_out_reg_reg_n_0_[3] ,alu_out_reg}),
        .rstn(rstn),
        .wd(wd));
  FDRE \output_rf1_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[0]),
        .Q(output_rf1_reg[0]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[10]),
        .Q(output_rf1_reg[10]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[11]),
        .Q(output_rf1_reg[11]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[12]),
        .Q(output_rf1_reg[12]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[13]),
        .Q(output_rf1_reg[13]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[14]),
        .Q(output_rf1_reg[14]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[15]),
        .Q(output_rf1_reg[15]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[16]),
        .Q(output_rf1_reg[16]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[17]),
        .Q(output_rf1_reg[17]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[18]),
        .Q(output_rf1_reg[18]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[19]),
        .Q(output_rf1_reg[19]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[1]),
        .Q(output_rf1_reg[1]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[20]),
        .Q(output_rf1_reg[20]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[21]),
        .Q(output_rf1_reg[21]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[22]),
        .Q(output_rf1_reg[22]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[23]),
        .Q(output_rf1_reg[23]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[24]),
        .Q(output_rf1_reg[24]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[25]),
        .Q(output_rf1_reg[25]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[26]),
        .Q(output_rf1_reg[26]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[27]),
        .Q(output_rf1_reg[27]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[28]),
        .Q(output_rf1_reg[28]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[29]),
        .Q(output_rf1_reg[29]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[2]),
        .Q(output_rf1_reg[2]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[30]),
        .Q(output_rf1_reg[30]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[31]),
        .Q(output_rf1_reg[31]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[3]),
        .Q(output_rf1_reg[3]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[4]),
        .Q(output_rf1_reg[4]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[5]),
        .Q(output_rf1_reg[5]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[6]),
        .Q(output_rf1_reg[6]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[7]),
        .Q(output_rf1_reg[7]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[8]),
        .Q(output_rf1_reg[8]),
        .R(1'b0));
  FDRE \output_rf1_reg_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(rd[9]),
        .Q(output_rf1_reg[9]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_31),
        .Q(output_rf2_reg[0]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_21),
        .Q(output_rf2_reg[10]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_20),
        .Q(output_rf2_reg[11]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_19),
        .Q(output_rf2_reg[12]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_18),
        .Q(output_rf2_reg[13]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_17),
        .Q(output_rf2_reg[14]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_16),
        .Q(output_rf2_reg[15]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_15),
        .Q(output_rf2_reg[16]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_14),
        .Q(output_rf2_reg[17]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_13),
        .Q(output_rf2_reg[18]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_12),
        .Q(output_rf2_reg[19]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_30),
        .Q(output_rf2_reg[1]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_11),
        .Q(output_rf2_reg[20]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_10),
        .Q(output_rf2_reg[21]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_9),
        .Q(output_rf2_reg[22]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_8),
        .Q(output_rf2_reg[23]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_7),
        .Q(output_rf2_reg[24]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_6),
        .Q(output_rf2_reg[25]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_5),
        .Q(output_rf2_reg[26]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_4),
        .Q(output_rf2_reg[27]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_3),
        .Q(output_rf2_reg[28]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_2),
        .Q(output_rf2_reg[29]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_29),
        .Q(output_rf2_reg[2]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_1),
        .Q(output_rf2_reg[30]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_0),
        .Q(output_rf2_reg[31]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_28),
        .Q(output_rf2_reg[3]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_27),
        .Q(output_rf2_reg[4]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_26),
        .Q(output_rf2_reg[5]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_25),
        .Q(output_rf2_reg[6]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_24),
        .Q(output_rf2_reg[7]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_23),
        .Q(output_rf2_reg[8]),
        .R(1'b0));
  FDRE \output_rf2_reg_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(rf2_n_22),
        .Q(output_rf2_reg[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \pc[31]_i_16 
       (.I0(\inst_reg_reg_n_0_[0] ),
        .I1(\inst_reg_reg_n_0_[4] ),
        .I2(\inst_reg_reg_n_0_[2] ),
        .I3(\inst_reg_reg_n_0_[1] ),
        .I4(\inst_reg_reg_n_0_[3] ),
        .I5(\inst_reg_reg_n_0_[5] ),
        .O(\pc[31]_i_16_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[0] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[0]),
        .Q(pc[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[10] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[10]),
        .Q(pc[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[11] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[11]),
        .Q(pc[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[12] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[12]),
        .Q(pc[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[13] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[13]),
        .Q(pc[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[14] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[14]),
        .Q(pc[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[15] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[15]),
        .Q(pc[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[16] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[16]),
        .Q(pc[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[17] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[17]),
        .Q(pc[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[18] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[18]),
        .Q(pc[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[19] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[19]),
        .Q(pc[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[1] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[1]),
        .Q(pc[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[20] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[20]),
        .Q(pc[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[21] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[21]),
        .Q(pc[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[22] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[22]),
        .Q(pc[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[23] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[23]),
        .Q(pc[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[24] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[24]),
        .Q(pc[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[25] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[25]),
        .Q(pc[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[26] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[26]),
        .Q(pc[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[27] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[27]),
        .Q(pc[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[28] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[28]),
        .Q(pc[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[29] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[29]),
        .Q(pc[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[2] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[2]),
        .Q(pc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[30] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[30]),
        .Q(pc[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[31] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[31]),
        .Q(pc[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[3] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[3]),
        .Q(pc[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[4] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[4]),
        .Q(pc[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[5] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[5]),
        .Q(pc[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[6] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[6]),
        .Q(pc[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[7] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[7]),
        .Q(pc[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[8] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[8]),
        .Q(pc[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[9] 
       (.C(clk),
        .CE(pcen),
        .D(pc_[9]),
        .Q(pc[9]),
        .R(1'b0));
  multi_fib_fpga_multicycle_cpu_0_0_rams_dp_wf rf1
       (.Q(ra),
        .RegWrite(RegWrite),
        .clk(clk),
        .p_2_out({mcu_n_102,mcu_n_103,mcu_n_104,mcu_n_105,mcu_n_106}),
        .rd(rd),
        .wd(wd));
  multi_fib_fpga_multicycle_cpu_0_0_rams_dp_wf_0 rf2
       (.Q(op2),
        .RegWrite(RegWrite),
        .clk(clk),
        .p_2_out({mcu_n_102,mcu_n_103,mcu_n_104,mcu_n_105,mcu_n_106}),
        .rd({rf2_n_0,rf2_n_1,rf2_n_2,rf2_n_3,rf2_n_4,rf2_n_5,rf2_n_6,rf2_n_7,rf2_n_8,rf2_n_9,rf2_n_10,rf2_n_11,rf2_n_12,rf2_n_13,rf2_n_14,rf2_n_15,rf2_n_16,rf2_n_17,rf2_n_18,rf2_n_19,rf2_n_20,rf2_n_21,rf2_n_22,rf2_n_23,rf2_n_24,rf2_n_25,rf2_n_26,rf2_n_27,rf2_n_28,rf2_n_29,rf2_n_30,rf2_n_31}),
        .wd(wd));
endmodule

(* ORIG_REF_NAME = "rams_dp_wf" *) 
module multi_fib_fpga_multicycle_cpu_0_0_rams_dp_wf
   (rd,
    clk,
    RegWrite,
    wd,
    Q,
    p_2_out);
  output [31:0]rd;
  input clk;
  input RegWrite;
  input [31:0]wd;
  input [4:0]Q;
  input [4:0]p_2_out;

  wire [4:0]Q;
  wire RegWrite;
  wire clk;
  wire [4:0]p_2_out;
  wire [31:0]rd;
  wire [31:0]wd;
  wire [1:0]NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf1/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "13" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h1000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_0_13
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[1:0]),
        .DIB(wd[3:2]),
        .DIC(wd[5:4]),
        .DID(wd[7:6]),
        .DIE(wd[9:8]),
        .DIF(wd[11:10]),
        .DIG(wd[13:12]),
        .DIH({1'b0,1'b0}),
        .DOA(rd[1:0]),
        .DOB(rd[3:2]),
        .DOC(rd[5:4]),
        .DOD(rd[7:6]),
        .DOE(rd[9:8]),
        .DOF(rd[11:10]),
        .DOG(rd[13:12]),
        .DOH(NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf1/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "27" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_14_27
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[15:14]),
        .DIB(wd[17:16]),
        .DIC(wd[19:18]),
        .DID(wd[21:20]),
        .DIE(wd[23:22]),
        .DIF(wd[25:24]),
        .DIG(wd[27:26]),
        .DIH({1'b0,1'b0}),
        .DOA(rd[15:14]),
        .DOB(rd[17:16]),
        .DOC(rd[19:18]),
        .DOD(rd[21:20]),
        .DOE(rd[23:22]),
        .DOF(rd[25:24]),
        .DOG(rd[27:26]),
        .DOH(NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf1/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "28" *) 
  (* ram_slice_end = "31" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_28_31
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[29:28]),
        .DIB(wd[31:30]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(rd[29:28]),
        .DOB(rd[31:30]),
        .DOC(NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED[1:0]),
        .DOE(NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
endmodule

(* ORIG_REF_NAME = "rams_dp_wf" *) 
module multi_fib_fpga_multicycle_cpu_0_0_rams_dp_wf_0
   (rd,
    clk,
    RegWrite,
    wd,
    Q,
    p_2_out);
  output [31:0]rd;
  input clk;
  input RegWrite;
  input [31:0]wd;
  input [4:0]Q;
  input [4:0]p_2_out;

  wire [4:0]Q;
  wire RegWrite;
  wire clk;
  wire [4:0]p_2_out;
  wire [31:0]rd;
  wire [31:0]wd;
  wire [1:0]NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf2/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "13" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h1000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_0_13
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[1:0]),
        .DIB(wd[3:2]),
        .DIC(wd[5:4]),
        .DID(wd[7:6]),
        .DIE(wd[9:8]),
        .DIF(wd[11:10]),
        .DIG(wd[13:12]),
        .DIH({1'b0,1'b0}),
        .DOA(rd[1:0]),
        .DOB(rd[3:2]),
        .DOC(rd[5:4]),
        .DOD(rd[7:6]),
        .DOE(rd[9:8]),
        .DOF(rd[11:10]),
        .DOG(rd[13:12]),
        .DOH(NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf2/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "27" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_14_27
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[15:14]),
        .DIB(wd[17:16]),
        .DIC(wd[19:18]),
        .DID(wd[21:20]),
        .DIE(wd[23:22]),
        .DIF(wd[25:24]),
        .DIG(wd[27:26]),
        .DIH({1'b0,1'b0}),
        .DOA(rd[15:14]),
        .DOB(rd[17:16]),
        .DOC(rd[19:18]),
        .DOD(rd[21:20]),
        .DOE(rd[23:22]),
        .DOF(rd[25:24]),
        .DOG(rd[27:26]),
        .DOH(NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "inst/rf2/RAM" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "28" *) 
  (* ram_slice_end = "31" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    RAM_reg_0_31_28_31
       (.ADDRA(Q),
        .ADDRB(Q),
        .ADDRC(Q),
        .ADDRD(Q),
        .ADDRE(Q),
        .ADDRF(Q),
        .ADDRG(Q),
        .ADDRH(p_2_out),
        .DIA(wd[29:28]),
        .DIB(wd[31:30]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(rd[29:28]),
        .DOB(rd[31:30]),
        .DOC(NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED[1:0]),
        .DOE(NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(RegWrite));
endmodule

(* ORIG_REF_NAME = "rams_sp_rf" *) 
module multi_fib_fpga_multicycle_cpu_0_0_rams_sp_rf
   (dout,
    clk,
    ADDRARDADDR,
    output_rf2_reg,
    WEA);
  output [31:0]dout;
  input clk;
  input [0:0]ADDRARDADDR;
  input [31:0]output_rf2_reg;
  input [0:0]WEA;

  wire [0:0]ADDRARDADDR;
  wire RAM_reg_bram_0_n_134;
  wire RAM_reg_bram_0_n_135;
  wire RAM_reg_bram_0_n_20;
  wire RAM_reg_bram_0_n_21;
  wire RAM_reg_bram_0_n_22;
  wire RAM_reg_bram_0_n_23;
  wire RAM_reg_bram_0_n_24;
  wire RAM_reg_bram_0_n_25;
  wire RAM_reg_bram_0_n_26;
  wire RAM_reg_bram_0_n_27;
  wire RAM_reg_bram_0_n_28;
  wire RAM_reg_bram_0_n_29;
  wire RAM_reg_bram_0_n_30;
  wire RAM_reg_bram_0_n_31;
  wire RAM_reg_bram_0_n_32;
  wire RAM_reg_bram_0_n_33;
  wire RAM_reg_bram_0_n_34;
  wire RAM_reg_bram_0_n_35;
  wire RAM_reg_bram_10_n_135;
  wire RAM_reg_bram_10_n_28;
  wire RAM_reg_bram_10_n_29;
  wire RAM_reg_bram_10_n_30;
  wire RAM_reg_bram_10_n_31;
  wire RAM_reg_bram_10_n_32;
  wire RAM_reg_bram_10_n_33;
  wire RAM_reg_bram_10_n_34;
  wire RAM_reg_bram_10_n_35;
  wire RAM_reg_bram_12_n_132;
  wire RAM_reg_bram_12_n_133;
  wire RAM_reg_bram_12_n_134;
  wire RAM_reg_bram_12_n_135;
  wire RAM_reg_bram_12_n_32;
  wire RAM_reg_bram_12_n_33;
  wire RAM_reg_bram_12_n_34;
  wire RAM_reg_bram_12_n_35;
  wire RAM_reg_bram_1_n_134;
  wire RAM_reg_bram_1_n_135;
  wire RAM_reg_bram_1_n_20;
  wire RAM_reg_bram_1_n_21;
  wire RAM_reg_bram_1_n_22;
  wire RAM_reg_bram_1_n_23;
  wire RAM_reg_bram_1_n_24;
  wire RAM_reg_bram_1_n_25;
  wire RAM_reg_bram_1_n_26;
  wire RAM_reg_bram_1_n_27;
  wire RAM_reg_bram_1_n_28;
  wire RAM_reg_bram_1_n_29;
  wire RAM_reg_bram_1_n_30;
  wire RAM_reg_bram_1_n_31;
  wire RAM_reg_bram_1_n_32;
  wire RAM_reg_bram_1_n_33;
  wire RAM_reg_bram_1_n_34;
  wire RAM_reg_bram_1_n_35;
  wire RAM_reg_bram_2_n_134;
  wire RAM_reg_bram_2_n_135;
  wire RAM_reg_bram_2_n_20;
  wire RAM_reg_bram_2_n_21;
  wire RAM_reg_bram_2_n_22;
  wire RAM_reg_bram_2_n_23;
  wire RAM_reg_bram_2_n_24;
  wire RAM_reg_bram_2_n_25;
  wire RAM_reg_bram_2_n_26;
  wire RAM_reg_bram_2_n_27;
  wire RAM_reg_bram_2_n_28;
  wire RAM_reg_bram_2_n_29;
  wire RAM_reg_bram_2_n_30;
  wire RAM_reg_bram_2_n_31;
  wire RAM_reg_bram_2_n_32;
  wire RAM_reg_bram_2_n_33;
  wire RAM_reg_bram_2_n_34;
  wire RAM_reg_bram_2_n_35;
  wire RAM_reg_bram_3_n_134;
  wire RAM_reg_bram_3_n_135;
  wire RAM_reg_bram_3_n_20;
  wire RAM_reg_bram_3_n_21;
  wire RAM_reg_bram_3_n_22;
  wire RAM_reg_bram_3_n_23;
  wire RAM_reg_bram_3_n_24;
  wire RAM_reg_bram_3_n_25;
  wire RAM_reg_bram_3_n_26;
  wire RAM_reg_bram_3_n_27;
  wire RAM_reg_bram_3_n_28;
  wire RAM_reg_bram_3_n_29;
  wire RAM_reg_bram_3_n_30;
  wire RAM_reg_bram_3_n_31;
  wire RAM_reg_bram_3_n_32;
  wire RAM_reg_bram_3_n_33;
  wire RAM_reg_bram_3_n_34;
  wire RAM_reg_bram_3_n_35;
  wire RAM_reg_bram_4_n_134;
  wire RAM_reg_bram_4_n_135;
  wire RAM_reg_bram_4_n_20;
  wire RAM_reg_bram_4_n_21;
  wire RAM_reg_bram_4_n_22;
  wire RAM_reg_bram_4_n_23;
  wire RAM_reg_bram_4_n_24;
  wire RAM_reg_bram_4_n_25;
  wire RAM_reg_bram_4_n_26;
  wire RAM_reg_bram_4_n_27;
  wire RAM_reg_bram_4_n_28;
  wire RAM_reg_bram_4_n_29;
  wire RAM_reg_bram_4_n_30;
  wire RAM_reg_bram_4_n_31;
  wire RAM_reg_bram_4_n_32;
  wire RAM_reg_bram_4_n_33;
  wire RAM_reg_bram_4_n_34;
  wire RAM_reg_bram_4_n_35;
  wire RAM_reg_bram_5_n_134;
  wire RAM_reg_bram_5_n_135;
  wire RAM_reg_bram_5_n_20;
  wire RAM_reg_bram_5_n_21;
  wire RAM_reg_bram_5_n_22;
  wire RAM_reg_bram_5_n_23;
  wire RAM_reg_bram_5_n_24;
  wire RAM_reg_bram_5_n_25;
  wire RAM_reg_bram_5_n_26;
  wire RAM_reg_bram_5_n_27;
  wire RAM_reg_bram_5_n_28;
  wire RAM_reg_bram_5_n_29;
  wire RAM_reg_bram_5_n_30;
  wire RAM_reg_bram_5_n_31;
  wire RAM_reg_bram_5_n_32;
  wire RAM_reg_bram_5_n_33;
  wire RAM_reg_bram_5_n_34;
  wire RAM_reg_bram_5_n_35;
  wire RAM_reg_bram_6_n_134;
  wire RAM_reg_bram_6_n_135;
  wire RAM_reg_bram_6_n_20;
  wire RAM_reg_bram_6_n_21;
  wire RAM_reg_bram_6_n_22;
  wire RAM_reg_bram_6_n_23;
  wire RAM_reg_bram_6_n_24;
  wire RAM_reg_bram_6_n_25;
  wire RAM_reg_bram_6_n_26;
  wire RAM_reg_bram_6_n_27;
  wire RAM_reg_bram_6_n_28;
  wire RAM_reg_bram_6_n_29;
  wire RAM_reg_bram_6_n_30;
  wire RAM_reg_bram_6_n_31;
  wire RAM_reg_bram_6_n_32;
  wire RAM_reg_bram_6_n_33;
  wire RAM_reg_bram_6_n_34;
  wire RAM_reg_bram_6_n_35;
  wire RAM_reg_bram_8_n_135;
  wire RAM_reg_bram_8_n_28;
  wire RAM_reg_bram_8_n_29;
  wire RAM_reg_bram_8_n_30;
  wire RAM_reg_bram_8_n_31;
  wire RAM_reg_bram_8_n_32;
  wire RAM_reg_bram_8_n_33;
  wire RAM_reg_bram_8_n_34;
  wire RAM_reg_bram_8_n_35;
  wire RAM_reg_bram_9_n_135;
  wire RAM_reg_bram_9_n_28;
  wire RAM_reg_bram_9_n_29;
  wire RAM_reg_bram_9_n_30;
  wire RAM_reg_bram_9_n_31;
  wire RAM_reg_bram_9_n_32;
  wire RAM_reg_bram_9_n_33;
  wire RAM_reg_bram_9_n_34;
  wire RAM_reg_bram_9_n_35;
  wire [0:0]WEA;
  wire clk;
  wire [31:0]dout;
  wire [31:0]output_rf2_reg;
  wire NLW_RAM_reg_bram_0_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_0_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_0_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_0_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_0_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_1_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_1_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_1_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_1_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_1_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_1_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_1_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_1_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_1_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_1_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_1_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_1_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_1_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_1_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_10_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_10_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_10_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_10_SBITERR_UNCONNECTED;
  wire [31:8]NLW_RAM_reg_bram_10_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_10_CASDOUTB_UNCONNECTED;
  wire [3:1]NLW_RAM_reg_bram_10_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_10_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_10_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_10_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_10_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_10_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_10_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_10_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_11_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_11_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_11_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_11_SBITERR_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_11_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_11_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_11_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_11_CASDOUTPB_UNCONNECTED;
  wire [31:8]NLW_RAM_reg_bram_11_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_11_DOUTBDOUT_UNCONNECTED;
  wire [3:1]NLW_RAM_reg_bram_11_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_11_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_11_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_11_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_12_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_12_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_12_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_12_SBITERR_UNCONNECTED;
  wire [31:4]NLW_RAM_reg_bram_12_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_12_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_12_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_12_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_12_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_12_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_12_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_12_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_12_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_13_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_13_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_13_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_13_SBITERR_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_13_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_13_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_13_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_13_CASDOUTPB_UNCONNECTED;
  wire [31:4]NLW_RAM_reg_bram_13_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_13_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_13_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_13_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_13_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_13_RDADDRECC_UNCONNECTED;
  wire [15:0]NLW_RAM_reg_bram_14_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_RAM_reg_bram_14_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_14_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_14_CASDOUTPB_UNCONNECTED;
  wire [15:1]NLW_RAM_reg_bram_14_DOUTADOUT_UNCONNECTED;
  wire [15:0]NLW_RAM_reg_bram_14_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_14_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_bram_14_DOUTPBDOUTP_UNCONNECTED;
  wire NLW_RAM_reg_bram_2_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_2_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_2_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_2_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_2_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_2_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_2_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_2_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_2_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_2_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_2_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_2_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_2_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_2_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_3_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_3_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_3_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_3_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_3_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_3_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_3_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_3_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_3_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_3_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_3_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_3_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_3_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_3_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_4_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_4_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_4_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_4_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_4_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_4_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_4_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_4_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_4_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_4_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_4_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_4_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_4_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_4_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_5_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_5_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_5_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_5_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_5_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_5_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_5_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_5_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_5_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_5_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_5_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_5_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_5_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_5_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_6_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_6_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_6_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_6_SBITERR_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_6_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_6_CASDOUTB_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_6_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_6_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_6_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_6_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_6_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_6_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_6_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_6_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_7_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_7_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_7_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_7_SBITERR_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_7_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_7_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_7_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_7_CASDOUTPB_UNCONNECTED;
  wire [31:16]NLW_RAM_reg_bram_7_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_7_DOUTBDOUT_UNCONNECTED;
  wire [3:2]NLW_RAM_reg_bram_7_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_7_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_7_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_7_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_8_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_8_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_8_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_8_SBITERR_UNCONNECTED;
  wire [31:8]NLW_RAM_reg_bram_8_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_8_CASDOUTB_UNCONNECTED;
  wire [3:1]NLW_RAM_reg_bram_8_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_8_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_8_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_8_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_8_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_8_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_8_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_8_RDADDRECC_UNCONNECTED;
  wire NLW_RAM_reg_bram_9_CASOUTDBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_9_CASOUTSBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_9_DBITERR_UNCONNECTED;
  wire NLW_RAM_reg_bram_9_SBITERR_UNCONNECTED;
  wire [31:8]NLW_RAM_reg_bram_9_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_9_CASDOUTB_UNCONNECTED;
  wire [3:1]NLW_RAM_reg_bram_9_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_9_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_9_DOUTADOUT_UNCONNECTED;
  wire [31:0]NLW_RAM_reg_bram_9_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_9_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_RAM_reg_bram_9_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_RAM_reg_bram_9_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_RAM_reg_bram_9_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "2047" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "2047" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("FIRST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000002E2F8B8BE2EBF8BAC64),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0004FFFE00000004FFF800010008000400000000FFFFF8080001082A00010019),
    .INIT_01(256'h00040004FFF8000100080004000DF80810200004000CFFF000010010000C0000),
    .INIT_02(256'h0000000000000000000000000000000000000000002400000004FFF800000008),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_0
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_0_n_20,RAM_reg_bram_0_n_21,RAM_reg_bram_0_n_22,RAM_reg_bram_0_n_23,RAM_reg_bram_0_n_24,RAM_reg_bram_0_n_25,RAM_reg_bram_0_n_26,RAM_reg_bram_0_n_27,RAM_reg_bram_0_n_28,RAM_reg_bram_0_n_29,RAM_reg_bram_0_n_30,RAM_reg_bram_0_n_31,RAM_reg_bram_0_n_32,RAM_reg_bram_0_n_33,RAM_reg_bram_0_n_34,RAM_reg_bram_0_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_0_n_134,RAM_reg_bram_0_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_0_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_0_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_0_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_0_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_0_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "2048" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "2048" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_1
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_0_n_20,RAM_reg_bram_0_n_21,RAM_reg_bram_0_n_22,RAM_reg_bram_0_n_23,RAM_reg_bram_0_n_24,RAM_reg_bram_0_n_25,RAM_reg_bram_0_n_26,RAM_reg_bram_0_n_27,RAM_reg_bram_0_n_28,RAM_reg_bram_0_n_29,RAM_reg_bram_0_n_30,RAM_reg_bram_0_n_31,RAM_reg_bram_0_n_32,RAM_reg_bram_0_n_33,RAM_reg_bram_0_n_34,RAM_reg_bram_0_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_0_n_134,RAM_reg_bram_0_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_1_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_1_n_20,RAM_reg_bram_1_n_21,RAM_reg_bram_1_n_22,RAM_reg_bram_1_n_23,RAM_reg_bram_1_n_24,RAM_reg_bram_1_n_25,RAM_reg_bram_1_n_26,RAM_reg_bram_1_n_27,RAM_reg_bram_1_n_28,RAM_reg_bram_1_n_29,RAM_reg_bram_1_n_30,RAM_reg_bram_1_n_31,RAM_reg_bram_1_n_32,RAM_reg_bram_1_n_33,RAM_reg_bram_1_n_34,RAM_reg_bram_1_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_1_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_1_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_1_n_134,RAM_reg_bram_1_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_1_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_1_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_1_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_1_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_1_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_1_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_1_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_1_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_1_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_1_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_1_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "8192" *) 
  (* bram_addr_end = "12287" *) 
  (* bram_slice_begin = "18" *) 
  (* bram_slice_end = "26" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "12287" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "26" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_10
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_9_n_28,RAM_reg_bram_9_n_29,RAM_reg_bram_9_n_30,RAM_reg_bram_9_n_31,RAM_reg_bram_9_n_32,RAM_reg_bram_9_n_33,RAM_reg_bram_9_n_34,RAM_reg_bram_9_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,RAM_reg_bram_9_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_10_CASDOUTA_UNCONNECTED[31:8],RAM_reg_bram_10_n_28,RAM_reg_bram_10_n_29,RAM_reg_bram_10_n_30,RAM_reg_bram_10_n_31,RAM_reg_bram_10_n_32,RAM_reg_bram_10_n_33,RAM_reg_bram_10_n_34,RAM_reg_bram_10_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_10_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_10_CASDOUTPA_UNCONNECTED[3:1],RAM_reg_bram_10_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_10_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_10_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_10_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_10_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[25:18]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,output_rf2_reg[26]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_10_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_10_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_10_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_10_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_10_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_10_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_10_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "12288" *) 
  (* bram_addr_end = "16383" *) 
  (* bram_slice_begin = "18" *) 
  (* bram_slice_end = "26" *) 
  (* ram_addr_begin = "12288" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "26" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("LAST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_11
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_10_n_28,RAM_reg_bram_10_n_29,RAM_reg_bram_10_n_30,RAM_reg_bram_10_n_31,RAM_reg_bram_10_n_32,RAM_reg_bram_10_n_33,RAM_reg_bram_10_n_34,RAM_reg_bram_10_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,RAM_reg_bram_10_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_RAM_reg_bram_11_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_RAM_reg_bram_11_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_RAM_reg_bram_11_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_RAM_reg_bram_11_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_11_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_11_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_11_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[25:18]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,output_rf2_reg[26]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT({NLW_RAM_reg_bram_11_DOUTADOUT_UNCONNECTED[31:8],dout[25:18]}),
        .DOUTBDOUT(NLW_RAM_reg_bram_11_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP({NLW_RAM_reg_bram_11_DOUTPADOUTP_UNCONNECTED[3:1],dout[26]}),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_11_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_11_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_11_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_11_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d4" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "8191" *) 
  (* bram_slice_begin = "27" *) 
  (* bram_slice_end = "30" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "30" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("FIRST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000014140451414540011414545411414545402041),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_12
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_12_CASDOUTA_UNCONNECTED[31:4],RAM_reg_bram_12_n_32,RAM_reg_bram_12_n_33,RAM_reg_bram_12_n_34,RAM_reg_bram_12_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_12_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({RAM_reg_bram_12_n_132,RAM_reg_bram_12_n_133,RAM_reg_bram_12_n_134,RAM_reg_bram_12_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_12_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_12_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_12_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_12_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[30:27]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_12_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_12_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_12_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_12_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_12_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_12_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_12_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d4" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "8192" *) 
  (* bram_addr_end = "16383" *) 
  (* bram_slice_begin = "27" *) 
  (* bram_slice_end = "30" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "30" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("LAST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_13
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_12_n_32,RAM_reg_bram_12_n_33,RAM_reg_bram_12_n_34,RAM_reg_bram_12_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({RAM_reg_bram_12_n_132,RAM_reg_bram_12_n_133,RAM_reg_bram_12_n_134,RAM_reg_bram_12_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_RAM_reg_bram_13_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_RAM_reg_bram_13_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_RAM_reg_bram_13_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_RAM_reg_bram_13_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_13_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_13_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_13_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[30:27]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT({NLW_RAM_reg_bram_13_DOUTADOUT_UNCONNECTED[31:4],dout[30:27]}),
        .DOUTBDOUT(NLW_RAM_reg_bram_13_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_13_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_13_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_13_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_13_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_13_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d1" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "16383" *) 
  (* bram_slice_begin = "31" *) 
  (* bram_slice_end = "31" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00000000000000000000000000000000000000000000000000000008C462B140),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_14
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_RAM_reg_bram_14_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_RAM_reg_bram_14_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_RAM_reg_bram_14_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_RAM_reg_bram_14_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[31]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT({NLW_RAM_reg_bram_14_DOUTADOUT_UNCONNECTED[15:1],dout[31]}),
        .DOUTBDOUT(NLW_RAM_reg_bram_14_DOUTBDOUT_UNCONNECTED[15:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_14_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_14_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "4096" *) 
  (* bram_addr_end = "6143" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "4096" *) 
  (* ram_addr_end = "6143" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_2
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_1_n_20,RAM_reg_bram_1_n_21,RAM_reg_bram_1_n_22,RAM_reg_bram_1_n_23,RAM_reg_bram_1_n_24,RAM_reg_bram_1_n_25,RAM_reg_bram_1_n_26,RAM_reg_bram_1_n_27,RAM_reg_bram_1_n_28,RAM_reg_bram_1_n_29,RAM_reg_bram_1_n_30,RAM_reg_bram_1_n_31,RAM_reg_bram_1_n_32,RAM_reg_bram_1_n_33,RAM_reg_bram_1_n_34,RAM_reg_bram_1_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_1_n_134,RAM_reg_bram_1_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_2_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_2_n_20,RAM_reg_bram_2_n_21,RAM_reg_bram_2_n_22,RAM_reg_bram_2_n_23,RAM_reg_bram_2_n_24,RAM_reg_bram_2_n_25,RAM_reg_bram_2_n_26,RAM_reg_bram_2_n_27,RAM_reg_bram_2_n_28,RAM_reg_bram_2_n_29,RAM_reg_bram_2_n_30,RAM_reg_bram_2_n_31,RAM_reg_bram_2_n_32,RAM_reg_bram_2_n_33,RAM_reg_bram_2_n_34,RAM_reg_bram_2_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_2_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_2_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_2_n_134,RAM_reg_bram_2_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_2_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_2_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_2_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_2_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_2_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_2_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_2_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_2_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_2_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_2_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_2_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "6144" *) 
  (* bram_addr_end = "8191" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "6144" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_3
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_2_n_20,RAM_reg_bram_2_n_21,RAM_reg_bram_2_n_22,RAM_reg_bram_2_n_23,RAM_reg_bram_2_n_24,RAM_reg_bram_2_n_25,RAM_reg_bram_2_n_26,RAM_reg_bram_2_n_27,RAM_reg_bram_2_n_28,RAM_reg_bram_2_n_29,RAM_reg_bram_2_n_30,RAM_reg_bram_2_n_31,RAM_reg_bram_2_n_32,RAM_reg_bram_2_n_33,RAM_reg_bram_2_n_34,RAM_reg_bram_2_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_2_n_134,RAM_reg_bram_2_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_3_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_3_n_20,RAM_reg_bram_3_n_21,RAM_reg_bram_3_n_22,RAM_reg_bram_3_n_23,RAM_reg_bram_3_n_24,RAM_reg_bram_3_n_25,RAM_reg_bram_3_n_26,RAM_reg_bram_3_n_27,RAM_reg_bram_3_n_28,RAM_reg_bram_3_n_29,RAM_reg_bram_3_n_30,RAM_reg_bram_3_n_31,RAM_reg_bram_3_n_32,RAM_reg_bram_3_n_33,RAM_reg_bram_3_n_34,RAM_reg_bram_3_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_3_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_3_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_3_n_134,RAM_reg_bram_3_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_3_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_3_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_3_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_3_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_3_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_3_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_3_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_3_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_3_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_3_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_3_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "8192" *) 
  (* bram_addr_end = "10239" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "10239" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_4
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_3_n_20,RAM_reg_bram_3_n_21,RAM_reg_bram_3_n_22,RAM_reg_bram_3_n_23,RAM_reg_bram_3_n_24,RAM_reg_bram_3_n_25,RAM_reg_bram_3_n_26,RAM_reg_bram_3_n_27,RAM_reg_bram_3_n_28,RAM_reg_bram_3_n_29,RAM_reg_bram_3_n_30,RAM_reg_bram_3_n_31,RAM_reg_bram_3_n_32,RAM_reg_bram_3_n_33,RAM_reg_bram_3_n_34,RAM_reg_bram_3_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_3_n_134,RAM_reg_bram_3_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_4_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_4_n_20,RAM_reg_bram_4_n_21,RAM_reg_bram_4_n_22,RAM_reg_bram_4_n_23,RAM_reg_bram_4_n_24,RAM_reg_bram_4_n_25,RAM_reg_bram_4_n_26,RAM_reg_bram_4_n_27,RAM_reg_bram_4_n_28,RAM_reg_bram_4_n_29,RAM_reg_bram_4_n_30,RAM_reg_bram_4_n_31,RAM_reg_bram_4_n_32,RAM_reg_bram_4_n_33,RAM_reg_bram_4_n_34,RAM_reg_bram_4_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_4_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_4_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_4_n_134,RAM_reg_bram_4_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_4_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_4_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_4_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_4_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_4_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_4_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_4_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_4_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_4_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_4_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_4_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "10240" *) 
  (* bram_addr_end = "12287" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "10240" *) 
  (* ram_addr_end = "12287" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_5
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_4_n_20,RAM_reg_bram_4_n_21,RAM_reg_bram_4_n_22,RAM_reg_bram_4_n_23,RAM_reg_bram_4_n_24,RAM_reg_bram_4_n_25,RAM_reg_bram_4_n_26,RAM_reg_bram_4_n_27,RAM_reg_bram_4_n_28,RAM_reg_bram_4_n_29,RAM_reg_bram_4_n_30,RAM_reg_bram_4_n_31,RAM_reg_bram_4_n_32,RAM_reg_bram_4_n_33,RAM_reg_bram_4_n_34,RAM_reg_bram_4_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_4_n_134,RAM_reg_bram_4_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_5_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_5_n_20,RAM_reg_bram_5_n_21,RAM_reg_bram_5_n_22,RAM_reg_bram_5_n_23,RAM_reg_bram_5_n_24,RAM_reg_bram_5_n_25,RAM_reg_bram_5_n_26,RAM_reg_bram_5_n_27,RAM_reg_bram_5_n_28,RAM_reg_bram_5_n_29,RAM_reg_bram_5_n_30,RAM_reg_bram_5_n_31,RAM_reg_bram_5_n_32,RAM_reg_bram_5_n_33,RAM_reg_bram_5_n_34,RAM_reg_bram_5_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_5_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_5_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_5_n_134,RAM_reg_bram_5_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_5_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_5_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_5_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_5_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_5_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_5_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_5_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_5_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_5_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_5_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_5_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "12288" *) 
  (* bram_addr_end = "14335" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "12288" *) 
  (* ram_addr_end = "14335" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_6
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_5_n_20,RAM_reg_bram_5_n_21,RAM_reg_bram_5_n_22,RAM_reg_bram_5_n_23,RAM_reg_bram_5_n_24,RAM_reg_bram_5_n_25,RAM_reg_bram_5_n_26,RAM_reg_bram_5_n_27,RAM_reg_bram_5_n_28,RAM_reg_bram_5_n_29,RAM_reg_bram_5_n_30,RAM_reg_bram_5_n_31,RAM_reg_bram_5_n_32,RAM_reg_bram_5_n_33,RAM_reg_bram_5_n_34,RAM_reg_bram_5_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_5_n_134,RAM_reg_bram_5_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_6_CASDOUTA_UNCONNECTED[31:16],RAM_reg_bram_6_n_20,RAM_reg_bram_6_n_21,RAM_reg_bram_6_n_22,RAM_reg_bram_6_n_23,RAM_reg_bram_6_n_24,RAM_reg_bram_6_n_25,RAM_reg_bram_6_n_26,RAM_reg_bram_6_n_27,RAM_reg_bram_6_n_28,RAM_reg_bram_6_n_29,RAM_reg_bram_6_n_30,RAM_reg_bram_6_n_31,RAM_reg_bram_6_n_32,RAM_reg_bram_6_n_33,RAM_reg_bram_6_n_34,RAM_reg_bram_6_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_6_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_6_CASDOUTPA_UNCONNECTED[3:2],RAM_reg_bram_6_n_134,RAM_reg_bram_6_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_6_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_6_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_6_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_6_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_6_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_6_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_6_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_6_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_6_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_6_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_6_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "14336" *) 
  (* bram_addr_end = "16383" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "17" *) 
  (* ram_addr_begin = "14336" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("LAST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_7
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_6_n_20,RAM_reg_bram_6_n_21,RAM_reg_bram_6_n_22,RAM_reg_bram_6_n_23,RAM_reg_bram_6_n_24,RAM_reg_bram_6_n_25,RAM_reg_bram_6_n_26,RAM_reg_bram_6_n_27,RAM_reg_bram_6_n_28,RAM_reg_bram_6_n_29,RAM_reg_bram_6_n_30,RAM_reg_bram_6_n_31,RAM_reg_bram_6_n_32,RAM_reg_bram_6_n_33,RAM_reg_bram_6_n_34,RAM_reg_bram_6_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,RAM_reg_bram_6_n_134,RAM_reg_bram_6_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_RAM_reg_bram_7_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_RAM_reg_bram_7_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_RAM_reg_bram_7_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_RAM_reg_bram_7_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_7_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_7_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_7_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[15:0]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,output_rf2_reg[17:16]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT({NLW_RAM_reg_bram_7_DOUTADOUT_UNCONNECTED[31:16],dout[15:0]}),
        .DOUTBDOUT(NLW_RAM_reg_bram_7_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP({NLW_RAM_reg_bram_7_DOUTPADOUTP_UNCONNECTED[3:2],dout[17:16]}),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_7_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_7_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_7_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_7_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "18" *) 
  (* bram_slice_end = "26" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "26" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("FIRST"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h00000000000000000000000000000000000000000000000000000008D46AB548),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hF7F7F700F7F700F818F0F7F700F7F718F018F0F7F700F7F718F010F800080000),
    .INIT_01(256'h00000000000000000000000000000000000000000000000000000010F7F700F7),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_8
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_8_CASDOUTA_UNCONNECTED[31:8],RAM_reg_bram_8_n_28,RAM_reg_bram_8_n_29,RAM_reg_bram_8_n_30,RAM_reg_bram_8_n_31,RAM_reg_bram_8_n_32,RAM_reg_bram_8_n_33,RAM_reg_bram_8_n_34,RAM_reg_bram_8_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_8_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_8_CASDOUTPA_UNCONNECTED[3:1],RAM_reg_bram_8_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_8_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_8_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_8_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_8_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[25:18]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,output_rf2_reg[26]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_8_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_8_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_8_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_8_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_8_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_8_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_8_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({WEA,WEA,WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* bram_addr_begin = "4096" *) 
  (* bram_addr_end = "8191" *) 
  (* bram_slice_begin = "18" *) 
  (* bram_slice_end = "26" *) 
  (* ram_addr_begin = "4096" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "26" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    RAM_reg_bram_9
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,RAM_reg_bram_8_n_28,RAM_reg_bram_8_n_29,RAM_reg_bram_8_n_30,RAM_reg_bram_8_n_31,RAM_reg_bram_8_n_32,RAM_reg_bram_8_n_33,RAM_reg_bram_8_n_34,RAM_reg_bram_8_n_35}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,RAM_reg_bram_8_n_135}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b1),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA({NLW_RAM_reg_bram_9_CASDOUTA_UNCONNECTED[31:8],RAM_reg_bram_9_n_28,RAM_reg_bram_9_n_29,RAM_reg_bram_9_n_30,RAM_reg_bram_9_n_31,RAM_reg_bram_9_n_32,RAM_reg_bram_9_n_33,RAM_reg_bram_9_n_34,RAM_reg_bram_9_n_35}),
        .CASDOUTB(NLW_RAM_reg_bram_9_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA({NLW_RAM_reg_bram_9_CASDOUTPA_UNCONNECTED[3:1],RAM_reg_bram_9_n_135}),
        .CASDOUTPB(NLW_RAM_reg_bram_9_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_RAM_reg_bram_9_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_RAM_reg_bram_9_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_RAM_reg_bram_9_DBITERR_UNCONNECTED),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,output_rf2_reg[25:18]}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,output_rf2_reg[26]}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(NLW_RAM_reg_bram_9_DOUTADOUT_UNCONNECTED[31:0]),
        .DOUTBDOUT(NLW_RAM_reg_bram_9_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_RAM_reg_bram_9_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_RAM_reg_bram_9_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_RAM_reg_bram_9_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_RAM_reg_bram_9_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_RAM_reg_bram_9_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
