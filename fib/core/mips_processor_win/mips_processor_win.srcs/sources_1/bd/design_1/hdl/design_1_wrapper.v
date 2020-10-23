//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Fri Oct 23 13:54:16 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (led,
    sysclk_125_clk_n,
    sysclk_125_clk_p);
  output [7:0]led;
  input sysclk_125_clk_n;
  input sysclk_125_clk_p;

  wire [7:0]led;
  wire sysclk_125_clk_n;
  wire sysclk_125_clk_p;

  design_1 design_1_i
       (.led(led),
        .sysclk_125_clk_n(sysclk_125_clk_n),
        .sysclk_125_clk_p(sysclk_125_clk_p));
endmodule
