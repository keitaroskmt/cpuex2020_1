-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sun Nov 22 18:53:57 2020
-- Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/nowi74/OneDrive/cpuexcore/1st/core/1st_architecture/1st_architecture.srcs/sources_1/bd/arch_1st/ip/arch_1st_multicycle_cpu_0_0/arch_1st_multicycle_cpu_0_0_stub.vhdl
-- Design      : arch_1st_multicycle_cpu_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arch_1st_multicycle_cpu_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    \rstn_\ : in STD_LOGIC;
    rxd : in STD_LOGIC;
    txd : out STD_LOGIC
  );

end arch_1st_multicycle_cpu_0_0;

architecture stub of arch_1st_multicycle_cpu_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,\rstn_\,rxd,txd";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "multicycle_cpu,Vivado 2019.2.1";
begin
end;
