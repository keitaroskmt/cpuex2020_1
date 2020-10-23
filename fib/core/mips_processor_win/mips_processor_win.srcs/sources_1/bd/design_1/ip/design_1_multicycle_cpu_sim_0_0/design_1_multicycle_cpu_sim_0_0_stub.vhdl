-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Fri Oct 23 13:55:04 2020
-- Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/mips_processor_win/mips_processor_win.srcs/sources_1/bd/design_1/ip/design_1_multicycle_cpu_sim_0_0/design_1_multicycle_cpu_sim_0_0_stub.vhdl
-- Design      : design_1_multicycle_cpu_sim_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_multicycle_cpu_sim_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_multicycle_cpu_sim_0_0;

architecture stub of design_1_multicycle_cpu_sim_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,led[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "multicycle_cpu_sim,Vivado 2019.2.1";
begin
end;
