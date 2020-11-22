//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Sun Nov 22 18:51:55 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target arch_1st.bd
//Design      : arch_1st
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "arch_1st,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=arch_1st,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "arch_1st.hwdef" *) 
module arch_1st
   (USB_UART_RX,
    USB_UART_TX,
    reset,
    sysclk_125_clk_n,
    sysclk_125_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.USB_UART_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.USB_UART_RX, LAYERED_METADATA undef" *) output USB_UART_RX;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.USB_UART_TX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.USB_UART_TX, LAYERED_METADATA undef" *) input USB_UART_TX;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sysclk_125 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sysclk_125, CAN_DEBUG false, FREQ_HZ 125000000" *) input sysclk_125_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sysclk_125 CLK_P" *) input sysclk_125_clk_p;

  wire USB_UART_TX_1;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire multicycle_cpu_0_txd;
  wire reset_1;
  wire sysclk_125_1_CLK_N;
  wire sysclk_125_1_CLK_P;

  assign USB_UART_RX = multicycle_cpu_0_txd;
  assign USB_UART_TX_1 = USB_UART_TX;
  assign reset_1 = reset;
  assign sysclk_125_1_CLK_N = sysclk_125_clk_n;
  assign sysclk_125_1_CLK_P = sysclk_125_clk_p;
  arch_1st_clk_wiz_0_0 clk_wiz_0
       (.clk_in1_n(sysclk_125_1_CLK_N),
        .clk_in1_p(sysclk_125_1_CLK_P),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .reset(reset_1));
  arch_1st_multicycle_cpu_0_0 multicycle_cpu_0
       (.clk(clk_wiz_0_clk_out1),
        .rstn_(clk_wiz_0_locked),
        .rxd(USB_UART_TX_1),
        .txd(multicycle_cpu_0_txd));
endmodule
