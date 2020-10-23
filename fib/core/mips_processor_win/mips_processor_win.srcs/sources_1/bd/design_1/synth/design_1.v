//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Fri Oct 23 13:54:16 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (led,
    sysclk_125_clk_n,
    sysclk_125_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LED, LAYERED_METADATA undef" *) output [7:0]led;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sysclk_125 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sysclk_125, CAN_DEBUG false, FREQ_HZ 125000000" *) input sysclk_125_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sysclk_125 CLK_P" *) input sysclk_125_clk_p;

  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire [7:0]multicycle_cpu_sim_0_led;
  wire sysclk_125_1_CLK_N;
  wire sysclk_125_1_CLK_P;

  assign led[7:0] = multicycle_cpu_sim_0_led;
  assign sysclk_125_1_CLK_N = sysclk_125_clk_n;
  assign sysclk_125_1_CLK_P = sysclk_125_clk_p;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1_n(sysclk_125_1_CLK_N),
        .clk_in1_p(sysclk_125_1_CLK_P),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .reset(1'b0));
  design_1_multicycle_cpu_sim_0_0 multicycle_cpu_sim_0
       (.clk(clk_wiz_0_clk_out1),
        .led(multicycle_cpu_sim_0_led),
        .rstn(clk_wiz_0_locked));
endmodule
