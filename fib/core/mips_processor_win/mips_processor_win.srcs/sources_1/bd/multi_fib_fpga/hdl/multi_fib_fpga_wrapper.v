//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Fri Oct 23 12:01:38 2020
//Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
//Command     : generate_target multi_fib_fpga_wrapper.bd
//Design      : multi_fib_fpga_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module multi_fib_fpga_wrapper
   (led,
    sysclk_125_clk_n,
    sysclk_125_clk_p);
  output [7:0]led;
  input sysclk_125_clk_n;
  input sysclk_125_clk_p;

  wire [7:0]led;
  wire sysclk_125_clk_n;
  wire sysclk_125_clk_p;

  multi_fib_fpga multi_fib_fpga_i
       (.led(led),
        .sysclk_125_clk_n(sysclk_125_clk_n),
        .sysclk_125_clk_p(sysclk_125_clk_p));
endmodule
