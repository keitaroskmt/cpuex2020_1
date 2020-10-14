//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Mon Oct 12 17:02:50 2020
//Host        : nowi74 running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target single_fib.bd
//Design      : single_fib
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "single_fib,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=single_fib,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "single_fib.hwdef" *) 
module single_fib
   ();

  wire sim_clk_gen_0_clk;
  wire sim_clk_gen_0_sync_rst;

  single_fib_cpu_0_0 cpu_0
       (.clk(sim_clk_gen_0_clk),
        .rstn(sim_clk_gen_0_sync_rst));
  single_fib_sim_clk_gen_0_0 sim_clk_gen_0
       (.clk(sim_clk_gen_0_clk),
        .sync_rst(sim_clk_gen_0_sync_rst));
endmodule
