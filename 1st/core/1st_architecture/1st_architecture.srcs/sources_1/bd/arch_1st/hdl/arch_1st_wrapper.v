//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Sun Nov 22 18:51:55 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target arch_1st_wrapper.bd
//Design      : arch_1st_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module arch_1st_wrapper
   (USB_UART_RX,
    USB_UART_TX,
    reset,
    sysclk_125_clk_n,
    sysclk_125_clk_p);
  output USB_UART_RX;
  input USB_UART_TX;
  input reset;
  input sysclk_125_clk_n;
  input sysclk_125_clk_p;

  wire USB_UART_RX;
  wire USB_UART_TX;
  wire reset;
  wire sysclk_125_clk_n;
  wire sysclk_125_clk_p;

  arch_1st arch_1st_i
       (.USB_UART_RX(USB_UART_RX),
        .USB_UART_TX(USB_UART_TX),
        .reset(reset),
        .sysclk_125_clk_n(sysclk_125_clk_n),
        .sysclk_125_clk_p(sysclk_125_clk_p));
endmodule
