// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sun Nov 22 18:53:57 2020
// Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/nowi74/OneDrive/cpuexcore/1st/core/1st_architecture/1st_architecture.srcs/sources_1/bd/arch_1st/ip/arch_1st_multicycle_cpu_0_0/arch_1st_multicycle_cpu_0_0_stub.v
// Design      : arch_1st_multicycle_cpu_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "multicycle_cpu,Vivado 2019.2.1" *)
module arch_1st_multicycle_cpu_0_0(clk, rstn_, rxd, txd)
/* synthesis syn_black_box black_box_pad_pin="clk,rstn_,rxd,txd" */;
  input clk;
  input rstn_;
  input rxd;
  output txd;
endmodule
