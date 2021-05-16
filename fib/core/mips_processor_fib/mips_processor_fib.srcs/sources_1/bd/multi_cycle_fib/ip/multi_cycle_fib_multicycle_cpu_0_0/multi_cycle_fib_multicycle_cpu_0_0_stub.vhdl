-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Tue Oct 27 02:54:25 2020
-- Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ip/multi_cycle_fib_multicycle_cpu_0_0/multi_cycle_fib_multicycle_cpu_0_0_stub.vhdl
-- Design      : multi_cycle_fib_multicycle_cpu_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multi_cycle_fib_multicycle_cpu_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end multi_cycle_fib_multicycle_cpu_0_0;

architecture stub of multi_cycle_fib_multicycle_cpu_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,led[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "multicycle_cpu,Vivado 2019.2.1";
begin
end;
