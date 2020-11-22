//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Sun Nov 22 18:49:00 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target arch_1st.bd
//Design      : arch_1st
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "arch_1st,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=arch_1st,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "arch_1st.hwdef" *) 
module arch_1st
   ();

  wire send_reset_0_reset;
  wire sim_clk_gen_0_clk;
  wire sim_clk_gen_0_sync_rst;
  wire sim_clk_gen_1_clk;
  wire sim_clk_gen_1_sync_rst;
  wire [7:0]util_vector_logic_0_Res;

  arch_1st_multicycle_cpu_0_0 multicycle_cpu_0
       (.clk(sim_clk_gen_0_clk),
        .rstn_(util_vector_logic_0_Res[0]),
        .rxd(1'b0));
  arch_1st_send_reset_0_0 send_reset_0
       (.clk(sim_clk_gen_1_clk),
        .reset(send_reset_0_reset),
        .rstn(sim_clk_gen_1_sync_rst));
  arch_1st_sim_clk_gen_0_0 sim_clk_gen_0
       (.clk(sim_clk_gen_0_clk),
        .sync_rst(sim_clk_gen_0_sync_rst));
  arch_1st_sim_clk_gen_1_0 sim_clk_gen_1
       (.clk(sim_clk_gen_1_clk),
        .sync_rst(sim_clk_gen_1_sync_rst));
  arch_1st_util_vector_logic_0_0 util_vector_logic_0
       (.Op1({sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst,sim_clk_gen_0_sync_rst}),
        .Op2({send_reset_0_reset,send_reset_0_reset,send_reset_0_reset,send_reset_0_reset,send_reset_0_reset,send_reset_0_reset,send_reset_0_reset,send_reset_0_reset}),
        .Res(util_vector_logic_0_Res));
endmodule
