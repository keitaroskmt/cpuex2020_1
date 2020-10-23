-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Fri Oct 23 13:55:04 2020
-- Host        : LAPTOP-G1I2TTIP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/mips_processor_win/mips_processor_win.srcs/sources_1/bd/design_1/ip/design_1_multicycle_cpu_sim_0_0/design_1_multicycle_cpu_sim_0_0_sim_netlist.vhdl
-- Design      : design_1_multicycle_cpu_sim_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_alu is
  port (
    out2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \inst_reg_reg[0]\ : out STD_LOGIC;
    \pc[31]_i_12_0\ : out STD_LOGIC;
    \pc[31]_i_14_0\ : out STD_LOGIC;
    \pc[31]_i_13_0\ : out STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \alu_out_reg_reg[15]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \alu_out_reg_reg[15]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \alu_out_reg_reg[23]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[23]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \alu_out_reg_reg[31]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_alu : entity is "alu";
end design_1_multicycle_cpu_sim_0_0_alu;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_alu is
  signal \^out2\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \out2_carry__0_n_0\ : STD_LOGIC;
  signal \out2_carry__0_n_1\ : STD_LOGIC;
  signal \out2_carry__0_n_2\ : STD_LOGIC;
  signal \out2_carry__0_n_3\ : STD_LOGIC;
  signal \out2_carry__0_n_4\ : STD_LOGIC;
  signal \out2_carry__0_n_5\ : STD_LOGIC;
  signal \out2_carry__0_n_6\ : STD_LOGIC;
  signal \out2_carry__0_n_7\ : STD_LOGIC;
  signal \out2_carry__1_n_0\ : STD_LOGIC;
  signal \out2_carry__1_n_1\ : STD_LOGIC;
  signal \out2_carry__1_n_2\ : STD_LOGIC;
  signal \out2_carry__1_n_3\ : STD_LOGIC;
  signal \out2_carry__1_n_4\ : STD_LOGIC;
  signal \out2_carry__1_n_5\ : STD_LOGIC;
  signal \out2_carry__1_n_6\ : STD_LOGIC;
  signal \out2_carry__1_n_7\ : STD_LOGIC;
  signal \out2_carry__2_n_1\ : STD_LOGIC;
  signal \out2_carry__2_n_2\ : STD_LOGIC;
  signal \out2_carry__2_n_3\ : STD_LOGIC;
  signal \out2_carry__2_n_4\ : STD_LOGIC;
  signal \out2_carry__2_n_5\ : STD_LOGIC;
  signal \out2_carry__2_n_6\ : STD_LOGIC;
  signal \out2_carry__2_n_7\ : STD_LOGIC;
  signal out2_carry_n_0 : STD_LOGIC;
  signal out2_carry_n_1 : STD_LOGIC;
  signal out2_carry_n_2 : STD_LOGIC;
  signal out2_carry_n_3 : STD_LOGIC;
  signal out2_carry_n_4 : STD_LOGIC;
  signal out2_carry_n_5 : STD_LOGIC;
  signal out2_carry_n_6 : STD_LOGIC;
  signal out2_carry_n_7 : STD_LOGIC;
  signal \pc[31]_i_10_n_0\ : STD_LOGIC;
  signal \pc[31]_i_11_n_0\ : STD_LOGIC;
  signal \pc[31]_i_12_n_0\ : STD_LOGIC;
  signal \pc[31]_i_13_n_0\ : STD_LOGIC;
  signal \pc[31]_i_14_n_0\ : STD_LOGIC;
  signal \pc[31]_i_9_n_0\ : STD_LOGIC;
  signal \NLW_out2_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
begin
  out2(31 downto 0) <= \^out2\(31 downto 0);
out2_carry: unisim.vcomponents.CARRY8
     port map (
      CI => A(0),
      CI_TOP => '0',
      CO(7) => out2_carry_n_0,
      CO(6) => out2_carry_n_1,
      CO(5) => out2_carry_n_2,
      CO(4) => out2_carry_n_3,
      CO(3) => out2_carry_n_4,
      CO(2) => out2_carry_n_5,
      CO(1) => out2_carry_n_6,
      CO(0) => out2_carry_n_7,
      DI(7 downto 2) => DI(6 downto 1),
      DI(1) => A(1),
      DI(0) => DI(0),
      O(7 downto 0) => \^out2\(7 downto 0),
      S(7 downto 0) => S(7 downto 0)
    );
\out2_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => out2_carry_n_0,
      CI_TOP => '0',
      CO(7) => \out2_carry__0_n_0\,
      CO(6) => \out2_carry__0_n_1\,
      CO(5) => \out2_carry__0_n_2\,
      CO(4) => \out2_carry__0_n_3\,
      CO(3) => \out2_carry__0_n_4\,
      CO(2) => \out2_carry__0_n_5\,
      CO(1) => \out2_carry__0_n_6\,
      CO(0) => \out2_carry__0_n_7\,
      DI(7 downto 0) => \alu_out_reg_reg[15]\(7 downto 0),
      O(7 downto 0) => \^out2\(15 downto 8),
      S(7 downto 0) => \alu_out_reg_reg[15]_0\(7 downto 0)
    );
\out2_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \out2_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \out2_carry__1_n_0\,
      CO(6) => \out2_carry__1_n_1\,
      CO(5) => \out2_carry__1_n_2\,
      CO(4) => \out2_carry__1_n_3\,
      CO(3) => \out2_carry__1_n_4\,
      CO(2) => \out2_carry__1_n_5\,
      CO(1) => \out2_carry__1_n_6\,
      CO(0) => \out2_carry__1_n_7\,
      DI(7 downto 1) => A(8 downto 2),
      DI(0) => \alu_out_reg_reg[23]\(0),
      O(7 downto 0) => \^out2\(23 downto 16),
      S(7 downto 0) => \alu_out_reg_reg[23]_0\(7 downto 0)
    );
\out2_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \out2_carry__1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_out2_carry__2_CO_UNCONNECTED\(7),
      CO(6) => \out2_carry__2_n_1\,
      CO(5) => \out2_carry__2_n_2\,
      CO(4) => \out2_carry__2_n_3\,
      CO(3) => \out2_carry__2_n_4\,
      CO(2) => \out2_carry__2_n_5\,
      CO(1) => \out2_carry__2_n_6\,
      CO(0) => \out2_carry__2_n_7\,
      DI(7) => '0',
      DI(6 downto 0) => A(15 downto 9),
      O(7 downto 0) => \^out2\(31 downto 24),
      S(7 downto 0) => \alu_out_reg_reg[31]\(7 downto 0)
    );
out2_carry_i_19: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      O => \inst_reg_reg[0]\
    );
\pc[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^out2\(9),
      I1 => \^out2\(10),
      I2 => \^out2\(8),
      I3 => \^out2\(11),
      O => \pc[31]_i_10_n_0\
    );
\pc[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^out2\(4),
      I1 => \^out2\(5),
      I2 => \^out2\(6),
      I3 => \^out2\(7),
      O => \pc[31]_i_11_n_0\
    );
\pc[31]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^out2\(1),
      I1 => \^out2\(2),
      I2 => \^out2\(3),
      I3 => \^out2\(0),
      O => \pc[31]_i_12_n_0\
    );
\pc[31]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^out2\(28),
      I1 => \^out2\(29),
      I2 => \^out2\(30),
      I3 => \^out2\(31),
      O => \pc[31]_i_13_n_0\
    );
\pc[31]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^out2\(16),
      I1 => \^out2\(17),
      I2 => \^out2\(18),
      I3 => \^out2\(19),
      O => \pc[31]_i_14_n_0\
    );
\pc[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \pc[31]_i_9_n_0\,
      I1 => \pc[31]_i_10_n_0\,
      I2 => \pc[31]_i_11_n_0\,
      I3 => \pc[31]_i_12_n_0\,
      O => \pc[31]_i_12_0\
    );
\pc[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^out2\(27),
      I1 => \^out2\(24),
      I2 => \^out2\(26),
      I3 => \^out2\(25),
      I4 => \pc[31]_i_13_n_0\,
      O => \pc[31]_i_13_0\
    );
\pc[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^out2\(21),
      I1 => \^out2\(20),
      I2 => \^out2\(23),
      I3 => \^out2\(22),
      I4 => \pc[31]_i_14_n_0\,
      O => \pc[31]_i_14_0\
    );
\pc[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^out2\(12),
      I1 => \^out2\(13),
      I2 => \^out2\(14),
      I3 => \^out2\(15),
      O => \pc[31]_i_9_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_multi_main_decoder is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite_reg_0 : out STD_LOGIC;
    RegWrite : out STD_LOGIC;
    \alu_out_reg_reg[15]\ : out STD_LOGIC;
    \alu_out_reg_reg[13]\ : out STD_LOGIC;
    \alu_out_reg_reg[15]_0\ : out STD_LOGIC;
    \pc_reg[15]\ : out STD_LOGIC;
    MemWrite_reg_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    MemWrite_reg_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[15]_1\ : out STD_LOGIC;
    \pc_reg[14]_0\ : out STD_LOGIC;
    \alu_out_reg_reg[15]_2\ : out STD_LOGIC;
    MemWrite_reg_3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_0\ : out STD_LOGIC;
    \pc_reg[14]_1\ : out STD_LOGIC;
    MemWrite_reg_4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_2\ : out STD_LOGIC;
    \pc_reg[15]_1\ : out STD_LOGIC;
    MemWrite_reg_5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_3\ : out STD_LOGIC;
    \pc_reg[15]_2\ : out STD_LOGIC;
    MemWrite_reg_6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_3\ : out STD_LOGIC;
    \pc_reg[14]_4\ : out STD_LOGIC;
    MemWrite_reg_7 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_5\ : out STD_LOGIC;
    \alu_out_reg_reg[15]_3\ : out STD_LOGIC;
    WEA : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite_reg_8 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_6\ : out STD_LOGIC;
    MemWrite_reg_9 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_7\ : out STD_LOGIC;
    MemWrite_reg_10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[15]_4\ : out STD_LOGIC;
    \pc_reg[14]_8\ : out STD_LOGIC;
    MemWrite_reg_11 : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite_reg_12 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[15]_5\ : out STD_LOGIC;
    \alu_out_reg_reg[14]\ : out STD_LOGIC;
    \pc_reg[15]_4\ : out STD_LOGIC;
    MemWrite_reg_13 : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \inst_reg_reg[1]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \output_rf1_reg_reg[30]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ToggleEqual_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[31]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \pc_reg[24]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_2_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    wd : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sr2_adr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \output_rf1_reg_reg[15]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \output_rf1_reg_reg[16]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_5\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \inst_reg_reg[15]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \output_rf2_reg_reg[29]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \FSM_sequential_state_reg[3]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    output_rf2_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rstn : in STD_LOGIC;
    out2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \pc_reg[0]\ : in STD_LOGIC;
    \pc_reg[0]_0\ : in STD_LOGIC;
    \pc_reg[0]_1\ : in STD_LOGIC;
    \pc[31]_i_7_0\ : in STD_LOGIC;
    \alu_out_reg_reg[31]\ : in STD_LOGIC;
    output_rf1_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out2_carry_i_16_0 : in STD_LOGIC;
    \alu_out_reg_reg[31]_0\ : in STD_LOGIC;
    \led_reg[0]\ : in STD_LOGIC;
    \led_reg[0]_0\ : in STD_LOGIC;
    \output_rf2_reg_reg[29]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_multi_main_decoder : entity is "multi_main_decoder";
end design_1_multicycle_cpu_sim_0_0_multi_main_decoder;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_multi_main_decoder is
  signal A : STD_LOGIC_VECTOR ( 16 downto 2 );
  signal \ALUOp[0]_i_1_n_0\ : STD_LOGIC;
  signal \ALUOp[0]_i_2_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_1_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_2_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_3_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_4_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_5_n_0\ : STD_LOGIC;
  signal \ALUOp[1]_i_6_n_0\ : STD_LOGIC;
  signal ALUSrcA : STD_LOGIC;
  signal ALUSrcA_i_1_n_0 : STD_LOGIC;
  signal \ALUSrcB[0]_i_1_n_0\ : STD_LOGIC;
  signal \ALUSrcB[0]_i_2_n_0\ : STD_LOGIC;
  signal \ALUSrcB[0]_i_3_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_1_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_2_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_3_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_4_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_5_n_0\ : STD_LOGIC;
  signal \ALUSrcB[1]_i_6_n_0\ : STD_LOGIC;
  signal \ALUSrcB_reg_n_0_[0]\ : STD_LOGIC;
  signal \ALUSrcB_reg_n_0_[1]\ : STD_LOGIC;
  signal Branch : STD_LOGIC;
  signal Branch_i_1_n_0 : STD_LOGIC;
  signal Branch_i_2_n_0 : STD_LOGIC;
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_8_n_0\ : STD_LOGIC;
  signal IRWrite_i_1_n_0 : STD_LOGIC;
  signal IorD : STD_LOGIC;
  signal IorD_i_1_n_0 : STD_LOGIC;
  signal IorD_i_2_n_0 : STD_LOGIC;
  signal MemWrite_i_1_n_0 : STD_LOGIC;
  signal MemWrite_i_2_n_0 : STD_LOGIC;
  signal MemWrite_i_3_n_0 : STD_LOGIC;
  signal MemWrite_i_4_n_0 : STD_LOGIC;
  signal \^memwrite_reg_0\ : STD_LOGIC;
  signal \MemtoReg[0]_i_1_n_0\ : STD_LOGIC;
  signal \MemtoReg[0]_i_2_n_0\ : STD_LOGIC;
  signal \MemtoReg[0]_i_3_n_0\ : STD_LOGIC;
  signal \MemtoReg[1]_i_1_n_0\ : STD_LOGIC;
  signal \MemtoReg_reg_n_0_[0]\ : STD_LOGIC;
  signal \MemtoReg_reg_n_0_[1]\ : STD_LOGIC;
  signal PCSrc_temp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \PCSrc_temp[0]_i_1_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[0]_i_2_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[0]_i_3_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[0]_i_4_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[1]_i_1_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[1]_i_2_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[1]_i_3_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[1]_i_4_n_0\ : STD_LOGIC;
  signal \PCSrc_temp[1]_i_5_n_0\ : STD_LOGIC;
  signal PCWrite_temp : STD_LOGIC;
  signal PCWrite_temp_i_1_n_0 : STD_LOGIC;
  signal PCWrite_temp_i_2_n_0 : STD_LOGIC;
  signal PCWrite_temp_i_3_n_0 : STD_LOGIC;
  signal PCWrite_temp_i_4_n_0 : STD_LOGIC;
  signal RegDst : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \RegDst[0]_i_1_n_0\ : STD_LOGIC;
  signal \RegDst[0]_i_2_n_0\ : STD_LOGIC;
  signal \RegDst[0]_i_3_n_0\ : STD_LOGIC;
  signal \RegDst[0]_i_4_n_0\ : STD_LOGIC;
  signal \RegDst[1]_i_1_n_0\ : STD_LOGIC;
  signal \RegDst[1]_i_2_n_0\ : STD_LOGIC;
  signal \^regwrite\ : STD_LOGIC;
  signal RegWrite_i_1_n_0 : STD_LOGIC;
  signal RegWrite_i_2_n_0 : STD_LOGIC;
  signal RegWrite_i_3_n_0 : STD_LOGIC;
  signal ToggleEqual : STD_LOGIC;
  signal ToggleEqual_i_1_n_0 : STD_LOGIC;
  signal ToggleEqual_i_2_n_0 : STD_LOGIC;
  signal ToggleEqual_i_3_n_0 : STD_LOGIC;
  signal \alu_out_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \alu_out_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \alu_out_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \alu_out_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \^alu_out_reg_reg[13]\ : STD_LOGIC;
  signal \^alu_out_reg_reg[15]_1\ : STD_LOGIC;
  signal \in\ : STD_LOGIC;
  signal \^inst_reg_reg[1]\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \led[7]_i_4_n_0\ : STD_LOGIC;
  signal \^output_rf1_reg_reg[30]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \pc[31]_i_15_n_0\ : STD_LOGIC;
  signal \pc[31]_i_17_n_0\ : STD_LOGIC;
  signal \pc[31]_i_6_n_0\ : STD_LOGIC;
  signal \pc[31]_i_7_n_0\ : STD_LOGIC;
  signal \pc[31]_i_8_n_0\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal srcBB : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ALUOp[1]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of ALUSrcA_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ALUSrcB[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ALUSrcB[1]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ALUSrcB[1]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ALUSrcB[1]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_4\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_sequential_state[4]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_state[4]_i_6\ : label is "soft_lutpair12";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[3]\ : label is "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[4]\ : label is "iSTATE:01110,iSTATE0:01101,iSTATE1:01011,iSTATE2:00010,iSTATE3:01100,iSTATE4:10000,iSTATE5:00001,iSTATE6:01010,iSTATE7:00000,iSTATE8:01001,iSTATE9:00110,iSTATE10:00101,iSTATE11:01000,iSTATE12:00111,iSTATE13:00100,iSTATE14:00011,iSTATE15:01111";
  attribute SOFT_HLUTNM of IorD_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of MemWrite_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \MemtoReg[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \MemtoReg[0]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \MemtoReg[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \PCSrc_temp[0]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \PCSrc_temp[0]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \PCSrc_temp[0]_i_4\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \PCSrc_temp[1]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \PCSrc_temp[1]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of PCWrite_temp_i_2 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of PCWrite_temp_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_10 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_11 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_12 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_2 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_3 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_4 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_5 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_6 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_7 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_8 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of RAM_reg_bram_0_i_9 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of RAM_reg_bram_10_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of RAM_reg_bram_10_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of RAM_reg_bram_11_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of RAM_reg_bram_11_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of RAM_reg_bram_12_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of RAM_reg_bram_12_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of RAM_reg_bram_12_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of RAM_reg_bram_13_i_1 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of RAM_reg_bram_13_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of RAM_reg_bram_8_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of RAM_reg_bram_8_i_2 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of RAM_reg_bram_9_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of RAM_reg_bram_9_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \RegDst[0]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \RegDst[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of ToggleEqual_i_3 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \alu_out_reg[10]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \alu_out_reg[11]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \alu_out_reg[12]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \alu_out_reg[13]_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \alu_out_reg[14]_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \alu_out_reg[15]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \alu_out_reg[16]_i_3\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \alu_out_reg[2]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \alu_out_reg[31]_i_5\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \alu_out_reg[3]_i_3\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \alu_out_reg[4]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \alu_out_reg[5]_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \alu_out_reg[6]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \alu_out_reg[7]_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \alu_out_reg[8]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \alu_out_reg[9]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \pc[31]_i_17\ : label is "soft_lutpair31";
begin
  E(0) <= \^e\(0);
  MemWrite_reg_0 <= \^memwrite_reg_0\;
  RegWrite <= \^regwrite\;
  \alu_out_reg_reg[13]\ <= \^alu_out_reg_reg[13]\;
  \alu_out_reg_reg[15]_1\ <= \^alu_out_reg_reg[15]_1\;
  \inst_reg_reg[1]\(31 downto 0) <= \^inst_reg_reg[1]\(31 downto 0);
  \output_rf1_reg_reg[30]\(15 downto 0) <= \^output_rf1_reg_reg[30]\(15 downto 0);
\ALUOp[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D000D0D0D0000000"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => \ALUOp[0]_i_2_n_0\,
      I2 => \ALUSrcB[0]_i_3_n_0\,
      I3 => \PCSrc_temp[1]_i_5_n_0\,
      I4 => \ALUOp[1]_i_3_n_0\,
      I5 => sel0(6),
      O => \ALUOp[0]_i_1_n_0\
    );
\ALUOp[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFF7FFFFFFFE"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(27),
      I1 => \FSM_sequential_state_reg[3]_0\(26),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(28),
      I4 => \FSM_sequential_state_reg[3]_0\(29),
      I5 => \FSM_sequential_state_reg[3]_0\(31),
      O => \ALUOp[0]_i_2_n_0\
    );
\ALUOp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808080888000000"
    )
        port map (
      I0 => \ALUSrcB[0]_i_3_n_0\,
      I1 => \ALUOp[1]_i_2_n_0\,
      I2 => \ALUOp[1]_i_3_n_0\,
      I3 => \ALUOp[1]_i_4_n_0\,
      I4 => \PCSrc_temp[1]_i_3_n_0\,
      I5 => sel0(7),
      O => \ALUOp[1]_i_1_n_0\
    );
\ALUOp[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \ALUOp[1]_i_5_n_0\,
      I1 => \state__0\(3),
      I2 => \state__0\(2),
      I3 => \state__0\(4),
      I4 => \FSM_sequential_state_reg[3]_0\(31),
      O => \ALUOp[1]_i_2_n_0\
    );
\ALUOp[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0C0F0200000F30"
    )
        port map (
      I0 => \ALUOp[1]_i_6_n_0\,
      I1 => \state__0\(2),
      I2 => \state__0\(4),
      I3 => \state__0\(3),
      I4 => \state__0\(0),
      I5 => \state__0\(1),
      O => \ALUOp[1]_i_3_n_0\
    );
\ALUOp[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(30),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(26),
      I4 => \FSM_sequential_state_reg[3]_0\(28),
      I5 => \FSM_sequential_state_reg[3]_0\(27),
      O => \ALUOp[1]_i_4_n_0\
    );
\ALUOp[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(30),
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \FSM_sequential_state_reg[3]_0\(26),
      I5 => \FSM_sequential_state_reg[3]_0\(27),
      O => \ALUOp[1]_i_5_n_0\
    );
\ALUOp[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001010010"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(31),
      I1 => \FSM_sequential_state_reg[3]_0\(30),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(26),
      I4 => \FSM_sequential_state_reg[3]_0\(28),
      I5 => \FSM_sequential_state_reg[3]_0\(27),
      O => \ALUOp[1]_i_6_n_0\
    );
\ALUOp_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \ALUOp[0]_i_1_n_0\,
      Q => sel0(6),
      R => '0'
    );
\ALUOp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \ALUOp[1]_i_1_n_0\,
      Q => sel0(7),
      R => '0'
    );
ALUSrcA_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => ALUSrcA,
      I1 => \ALUSrcB[0]_i_2_n_0\,
      I2 => \PCSrc_temp[1]_i_3_n_0\,
      I3 => \ALUSrcB[0]_i_3_n_0\,
      O => ALUSrcA_i_1_n_0
    );
ALUSrcA_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ALUSrcA_i_1_n_0,
      Q => ALUSrcA,
      R => '0'
    );
\ALUSrcB[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2EFF"
    )
        port map (
      I0 => \ALUSrcB_reg_n_0_[0]\,
      I1 => \ALUSrcB[0]_i_2_n_0\,
      I2 => \PCSrc_temp[1]_i_3_n_0\,
      I3 => \ALUSrcB[0]_i_3_n_0\,
      O => \ALUSrcB[0]_i_1_n_0\
    );
\ALUSrcB[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0C0F0100000F30"
    )
        port map (
      I0 => \ALUSrcB[1]_i_6_n_0\,
      I1 => \state__0\(2),
      I2 => \state__0\(4),
      I3 => \state__0\(3),
      I4 => \state__0\(0),
      I5 => \state__0\(1),
      O => \ALUSrcB[0]_i_2_n_0\
    );
\ALUSrcB[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAA8A"
    )
        port map (
      I0 => rstn,
      I1 => \state__0\(4),
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \state__0\(2),
      I5 => \state__0\(3),
      O => \ALUSrcB[0]_i_3_n_0\
    );
\ALUSrcB[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFAAFFFFBFAA0000"
    )
        port map (
      I0 => \ALUSrcB[1]_i_2_n_0\,
      I1 => \ALUSrcB[1]_i_3_n_0\,
      I2 => \ALUSrcB[1]_i_4_n_0\,
      I3 => \PCSrc_temp[1]_i_3_n_0\,
      I4 => \ALUSrcB[1]_i_5_n_0\,
      I5 => \ALUSrcB_reg_n_0_[1]\,
      O => \ALUSrcB[1]_i_1_n_0\
    );
\ALUSrcB[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \state__0\(3),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      I4 => \state__0\(4),
      O => \ALUSrcB[1]_i_2_n_0\
    );
\ALUSrcB[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(26),
      O => \ALUSrcB[1]_i_3_n_0\
    );
\ALUSrcB[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(31),
      I1 => \FSM_sequential_state_reg[3]_0\(30),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(27),
      O => \ALUSrcB[1]_i_4_n_0\
    );
\ALUSrcB[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333033010003330C"
    )
        port map (
      I0 => \ALUSrcB[1]_i_6_n_0\,
      I1 => \state__0\(4),
      I2 => \state__0\(2),
      I3 => \state__0\(3),
      I4 => \state__0\(0),
      I5 => \state__0\(1),
      O => \ALUSrcB[1]_i_5_n_0\
    );
\ALUSrcB[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFDFDFFFFFFEBA"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(27),
      I1 => \FSM_sequential_state_reg[3]_0\(28),
      I2 => \FSM_sequential_state_reg[3]_0\(26),
      I3 => \FSM_sequential_state_reg[3]_0\(29),
      I4 => \FSM_sequential_state_reg[3]_0\(30),
      I5 => \FSM_sequential_state_reg[3]_0\(31),
      O => \ALUSrcB[1]_i_6_n_0\
    );
\ALUSrcB_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \ALUSrcB[0]_i_1_n_0\,
      Q => \ALUSrcB_reg_n_0_[0]\,
      R => '0'
    );
\ALUSrcB_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \ALUSrcB[1]_i_1_n_0\,
      Q => \ALUSrcB_reg_n_0_[1]\,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
Branch_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => Branch_i_2_n_0,
      I2 => Branch,
      O => Branch_i_1_n_0
    );
Branch_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003300000000100"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_2_n_0\,
      I1 => \state__0\(4),
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \state__0\(2),
      I5 => \state__0\(3),
      O => Branch_i_2_n_0
    );
Branch_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => Branch_i_1_n_0,
      Q => Branch,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010101000101"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(0),
      I2 => \state__0\(3),
      I3 => \FSM_sequential_state[0]_i_2_n_0\,
      I4 => \state__0\(1),
      I5 => \state__0\(2),
      O => p_0_out(0)
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1100000000000115"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(30),
      I1 => \FSM_sequential_state_reg[3]_0\(28),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(27),
      I4 => \FSM_sequential_state_reg[3]_0\(31),
      I5 => \FSM_sequential_state_reg[3]_0\(26),
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0510051005100500"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(3),
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      I4 => \state__0\(2),
      I5 => \FSM_sequential_state[1]_i_2_n_0\,
      O => p_0_out(1)
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404000000000014"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(30),
      I1 => \FSM_sequential_state_reg[3]_0\(27),
      I2 => \FSM_sequential_state_reg[3]_0\(28),
      I3 => \FSM_sequential_state_reg[3]_0\(29),
      I4 => \FSM_sequential_state_reg[3]_0\(31),
      I5 => \FSM_sequential_state_reg[3]_0\(26),
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAABAAAAAAABAAA"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_2_n_0\,
      I1 => \state__0\(0),
      I2 => \state__0\(1),
      I3 => \FSM_sequential_state[2]_i_3_n_0\,
      I4 => \FSM_sequential_state[2]_i_4_n_0\,
      I5 => \state__0\(2),
      O => p_0_out(2)
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000A010AA"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \FSM_sequential_state[3]_i_2_n_0\,
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \state__0\(3),
      I5 => \state__0\(4),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state__0\(3),
      I1 => \state__0\(4),
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEE7"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(26),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(27),
      I4 => \FSM_sequential_state_reg[3]_0\(30),
      I5 => \FSM_sequential_state_reg[3]_0\(31),
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008ADA"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \FSM_sequential_state[3]_i_2_n_0\,
      I2 => \state__0\(1),
      I3 => \FSM_sequential_state[3]_i_3_n_0\,
      I4 => \FSM_sequential_state[3]_i_4_n_0\,
      O => p_0_out(3)
    );
\FSM_sequential_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFDFFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(26),
      I1 => \FSM_sequential_state_reg[3]_0\(28),
      I2 => \FSM_sequential_state_reg[3]_0\(31),
      I3 => \FSM_sequential_state_reg[3]_0\(27),
      I4 => \FSM_sequential_state_reg[3]_0\(30),
      I5 => \FSM_sequential_state_reg[3]_0\(29),
      O => \FSM_sequential_state[3]_i_2_n_0\
    );
\FSM_sequential_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFDFC"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(26),
      I4 => \FSM_sequential_state_reg[3]_0\(29),
      I5 => \FSM_sequential_state_reg[3]_0\(27),
      O => \FSM_sequential_state[3]_i_3_n_0\
    );
\FSM_sequential_state[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAD"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      O => \FSM_sequential_state[3]_i_4_n_0\
    );
\FSM_sequential_state[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn,
      O => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0DDD0DDD0DDDDDD"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \FSM_sequential_state[4]_i_4_n_0\,
      I2 => \FSM_sequential_state[4]_i_5_n_0\,
      I3 => \FSM_sequential_state[4]_i_6_n_0\,
      I4 => \state__0\(0),
      I5 => \FSM_sequential_state[4]_i_7_n_0\,
      O => \FSM_sequential_state[4]_i_2_n_0\
    );
\FSM_sequential_state[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(4),
      I2 => \state__0\(3),
      I3 => \state__0\(2),
      I4 => \state__0\(1),
      I5 => \FSM_sequential_state[4]_i_8_n_0\,
      O => p_0_out(4)
    );
\FSM_sequential_state[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \state__0\(0),
      I3 => \state__0\(3),
      O => \FSM_sequential_state[4]_i_4_n_0\
    );
\FSM_sequential_state[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(31),
      I1 => \FSM_sequential_state_reg[3]_0\(26),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(28),
      I4 => \FSM_sequential_state_reg[3]_0\(27),
      I5 => \state__0\(0),
      O => \FSM_sequential_state[4]_i_5_n_0\
    );
\FSM_sequential_state[4]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(3),
      I2 => \state__0\(2),
      I3 => \state__0\(1),
      O => \FSM_sequential_state[4]_i_6_n_0\
    );
\FSM_sequential_state[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBBFFF9FFFFFFE8"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(27),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(30),
      I4 => \FSM_sequential_state_reg[3]_0\(31),
      I5 => \FSM_sequential_state_reg[3]_0\(26),
      O => \FSM_sequential_state[4]_i_7_n_0\
    );
\FSM_sequential_state[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000308090101"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(26),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(29),
      I4 => \FSM_sequential_state_reg[3]_0\(27),
      I5 => \FSM_sequential_state_reg[3]_0\(28),
      O => \FSM_sequential_state[4]_i_8_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[4]_i_2_n_0\,
      D => p_0_out(0),
      Q => \state__0\(0),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[4]_i_2_n_0\,
      D => p_0_out(1),
      Q => \state__0\(1),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[4]_i_2_n_0\,
      D => p_0_out(2),
      Q => \state__0\(2),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[4]_i_2_n_0\,
      D => p_0_out(3),
      Q => \state__0\(3),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[4]_i_2_n_0\,
      D => p_0_out(4),
      Q => \state__0\(4),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
IRWrite_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000001"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(4),
      I2 => \state__0\(3),
      I3 => \state__0\(1),
      I4 => \state__0\(2),
      I5 => \^e\(0),
      O => IRWrite_i_1_n_0
    );
IRWrite_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => IRWrite_i_1_n_0,
      Q => \^e\(0),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
IorD_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFAA80AA"
    )
        port map (
      I0 => IorD_i_2_n_0,
      I1 => \FSM_sequential_state[4]_i_6_n_0\,
      I2 => \FSM_sequential_state[4]_i_5_n_0\,
      I3 => \PCSrc_temp[0]_i_2_n_0\,
      I4 => IorD,
      O => IorD_i_1_n_0
    );
IorD_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \state__0\(3),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      I4 => \state__0\(4),
      O => IorD_i_2_n_0
    );
IorD_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => IorD_i_1_n_0,
      Q => IorD,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
MemWrite_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080FFFF00800000"
    )
        port map (
      I0 => MemWrite_i_2_n_0,
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => \state__0\(4),
      I4 => MemWrite_i_3_n_0,
      I5 => \^memwrite_reg_0\,
      O => MemWrite_i_1_n_0
    );
MemWrite_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(3),
      O => MemWrite_i_2_n_0
    );
MemWrite_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FEC00003CCCC"
    )
        port map (
      I0 => MemWrite_i_4_n_0,
      I1 => \state__0\(3),
      I2 => \state__0\(2),
      I3 => \state__0\(1),
      I4 => \state__0\(4),
      I5 => \state__0\(0),
      O => MemWrite_i_3_n_0
    );
MemWrite_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(29),
      I1 => \FSM_sequential_state_reg[3]_0\(27),
      I2 => \FSM_sequential_state_reg[3]_0\(31),
      I3 => \FSM_sequential_state_reg[3]_0\(26),
      I4 => \FSM_sequential_state_reg[3]_0\(30),
      I5 => \FSM_sequential_state_reg[3]_0\(28),
      O => MemWrite_i_4_n_0
    );
MemWrite_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => MemWrite_i_1_n_0,
      Q => \^memwrite_reg_0\,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\MemtoReg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0DDD00000000000"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => \RegDst[0]_i_3_n_0\,
      I2 => \MemtoReg[0]_i_2_n_0\,
      I3 => \MemtoReg[0]_i_3_n_0\,
      I4 => \MemtoReg_reg_n_0_[0]\,
      I5 => rstn,
      O => \MemtoReg[0]_i_1_n_0\
    );
\MemtoReg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(2),
      O => \MemtoReg[0]_i_2_n_0\
    );
\MemtoReg[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020C00"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(0),
      I2 => \state__0\(4),
      I3 => \state__0\(3),
      I4 => \state__0\(1),
      O => \MemtoReg[0]_i_3_n_0\
    );
\MemtoReg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => \RegDst[1]_i_2_n_0\,
      I2 => \MemtoReg_reg_n_0_[1]\,
      O => \MemtoReg[1]_i_1_n_0\
    );
\MemtoReg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \MemtoReg[0]_i_1_n_0\,
      Q => \MemtoReg_reg_n_0_[0]\,
      R => '0'
    );
\MemtoReg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \MemtoReg[1]_i_1_n_0\,
      Q => \MemtoReg_reg_n_0_[1]\,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\PCSrc_temp[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEAEEEEE22A22222"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_5_n_0\,
      I1 => \PCSrc_temp[0]_i_2_n_0\,
      I2 => \PCSrc_temp[1]_i_3_n_0\,
      I3 => \PCSrc_temp[0]_i_3_n_0\,
      I4 => \PCSrc_temp[0]_i_4_n_0\,
      I5 => PCSrc_temp(0),
      O => \PCSrc_temp[0]_i_1_n_0\
    );
\PCSrc_temp[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF47FE4F"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(0),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(2),
      O => \PCSrc_temp[0]_i_2_n_0\
    );
\PCSrc_temp[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(29),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      O => \PCSrc_temp[0]_i_3_n_0\
    );
\PCSrc_temp[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(27),
      O => \PCSrc_temp[0]_i_4_n_0\
    );
\PCSrc_temp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008F800000"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_2_n_0\,
      I1 => \PCSrc_temp[1]_i_3_n_0\,
      I2 => \PCSrc_temp[1]_i_4_n_0\,
      I3 => PCSrc_temp(1),
      I4 => rstn,
      I5 => \PCSrc_temp[1]_i_5_n_0\,
      O => \PCSrc_temp[1]_i_1_n_0\
    );
\PCSrc_temp[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(28),
      I1 => \FSM_sequential_state_reg[3]_0\(27),
      I2 => \FSM_sequential_state_reg[3]_0\(29),
      I3 => \FSM_sequential_state_reg[3]_0\(31),
      I4 => \FSM_sequential_state_reg[3]_0\(30),
      O => \PCSrc_temp[1]_i_2_n_0\
    );
\PCSrc_temp[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(0),
      O => \PCSrc_temp[1]_i_3_n_0\
    );
\PCSrc_temp[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A801F000A801F2"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(0),
      I5 => PCWrite_temp_i_4_n_0,
      O => \PCSrc_temp[1]_i_4_n_0\
    );
\PCSrc_temp[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(0),
      I2 => \state__0\(3),
      I3 => \PCSrc_temp[1]_i_2_n_0\,
      I4 => \state__0\(1),
      I5 => \state__0\(2),
      O => \PCSrc_temp[1]_i_5_n_0\
    );
\PCSrc_temp_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \PCSrc_temp[0]_i_1_n_0\,
      Q => PCSrc_temp(0),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\PCSrc_temp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \PCSrc_temp[1]_i_1_n_0\,
      Q => PCSrc_temp(1),
      R => '0'
    );
PCWrite_temp_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEFFFFFFBEFF0000"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(3),
      I2 => \state__0\(0),
      I3 => PCWrite_temp_i_2_n_0,
      I4 => PCWrite_temp_i_3_n_0,
      I5 => PCWrite_temp,
      O => PCWrite_temp_i_1_n_0
    );
PCWrite_temp_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      O => PCWrite_temp_i_2_n_0
    );
PCWrite_temp_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000003CFC0FF07"
    )
        port map (
      I0 => PCWrite_temp_i_4_n_0,
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      I3 => \state__0\(3),
      I4 => \state__0\(0),
      I5 => \state__0\(4),
      O => PCWrite_temp_i_3_n_0
    );
PCWrite_temp_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(27),
      I1 => \FSM_sequential_state_reg[3]_0\(28),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(31),
      I4 => \FSM_sequential_state_reg[3]_0\(29),
      O => PCWrite_temp_i_4_n_0
    );
PCWrite_temp_reg: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => PCWrite_temp_i_1_n_0,
      Q => PCWrite_temp,
      S => \FSM_sequential_state[4]_i_1_n_0\
    );
RAM_reg_0_31_0_13_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(1),
      I1 => \output_rf2_reg_reg[29]_0\(1),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(1),
      O => wd(1)
    );
RAM_reg_0_31_0_13_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(8),
      I1 => \output_rf2_reg_reg[29]_0\(8),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(8),
      O => wd(8)
    );
RAM_reg_0_31_0_13_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(11),
      I1 => \output_rf2_reg_reg[29]_0\(11),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(11),
      O => wd(11)
    );
RAM_reg_0_31_0_13_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(10),
      I1 => \output_rf2_reg_reg[29]_0\(10),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(10),
      O => wd(10)
    );
RAM_reg_0_31_0_13_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(13),
      I1 => \output_rf2_reg_reg[29]_0\(13),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(13),
      O => wd(13)
    );
RAM_reg_0_31_0_13_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(12),
      I1 => \output_rf2_reg_reg[29]_0\(12),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(12),
      O => wd(12)
    );
RAM_reg_0_31_0_13_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => RegDst(1),
      I1 => \FSM_sequential_state_reg[3]_0\(20),
      I2 => RegDst(0),
      I3 => \FSM_sequential_state_reg[3]_0\(15),
      O => p_2_out(4)
    );
RAM_reg_0_31_0_13_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => RegDst(1),
      I1 => \FSM_sequential_state_reg[3]_0\(19),
      I2 => RegDst(0),
      I3 => \FSM_sequential_state_reg[3]_0\(14),
      O => p_2_out(3)
    );
RAM_reg_0_31_0_13_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => RegDst(1),
      I1 => \FSM_sequential_state_reg[3]_0\(18),
      I2 => RegDst(0),
      I3 => \FSM_sequential_state_reg[3]_0\(13),
      O => p_2_out(2)
    );
RAM_reg_0_31_0_13_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => RegDst(1),
      I1 => \FSM_sequential_state_reg[3]_0\(17),
      I2 => RegDst(0),
      I3 => \FSM_sequential_state_reg[3]_0\(12),
      O => p_2_out(1)
    );
RAM_reg_0_31_0_13_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => RegDst(1),
      I1 => \FSM_sequential_state_reg[3]_0\(16),
      I2 => RegDst(0),
      I3 => \FSM_sequential_state_reg[3]_0\(11),
      O => p_2_out(0)
    );
RAM_reg_0_31_0_13_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(0),
      I1 => \output_rf2_reg_reg[29]_0\(0),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(0),
      O => wd(0)
    );
RAM_reg_0_31_0_13_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(3),
      I1 => \output_rf2_reg_reg[29]_0\(3),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(3),
      O => wd(3)
    );
RAM_reg_0_31_0_13_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(2),
      I1 => \output_rf2_reg_reg[29]_0\(2),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(2),
      O => wd(2)
    );
RAM_reg_0_31_0_13_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(5),
      I1 => \output_rf2_reg_reg[29]_0\(5),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(5),
      O => wd(5)
    );
RAM_reg_0_31_0_13_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(4),
      I1 => \output_rf2_reg_reg[29]_0\(4),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(4),
      O => wd(4)
    );
RAM_reg_0_31_0_13_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(7),
      I1 => \output_rf2_reg_reg[29]_0\(7),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(7),
      O => wd(7)
    );
RAM_reg_0_31_0_13_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(6),
      I1 => \output_rf2_reg_reg[29]_0\(6),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(6),
      O => wd(6)
    );
RAM_reg_0_31_0_13_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(9),
      I1 => \output_rf2_reg_reg[29]_0\(9),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(9),
      O => wd(9)
    );
RAM_reg_0_31_14_27_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(15),
      I1 => \output_rf2_reg_reg[29]_0\(15),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(15),
      O => wd(15)
    );
RAM_reg_0_31_14_27_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(22),
      I1 => \output_rf2_reg_reg[29]_0\(22),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(22),
      O => wd(22)
    );
RAM_reg_0_31_14_27_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(25),
      I1 => \output_rf2_reg_reg[29]_0\(25),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(25),
      O => wd(25)
    );
RAM_reg_0_31_14_27_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(24),
      I1 => \output_rf2_reg_reg[29]_0\(24),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(24),
      O => wd(24)
    );
RAM_reg_0_31_14_27_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(27),
      I1 => \output_rf2_reg_reg[29]_0\(27),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(27),
      O => wd(27)
    );
RAM_reg_0_31_14_27_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(26),
      I1 => \output_rf2_reg_reg[29]_0\(26),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(26),
      O => wd(26)
    );
RAM_reg_0_31_14_27_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => \output_rf2_reg_reg[29]_0\(14),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(14),
      O => wd(14)
    );
RAM_reg_0_31_14_27_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(17),
      I1 => \output_rf2_reg_reg[29]_0\(17),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(17),
      O => wd(17)
    );
RAM_reg_0_31_14_27_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(16),
      I1 => \output_rf2_reg_reg[29]_0\(16),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(16),
      O => wd(16)
    );
RAM_reg_0_31_14_27_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(19),
      I1 => \output_rf2_reg_reg[29]_0\(19),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(19),
      O => wd(19)
    );
RAM_reg_0_31_14_27_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(18),
      I1 => \output_rf2_reg_reg[29]_0\(18),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(18),
      O => wd(18)
    );
RAM_reg_0_31_14_27_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(21),
      I1 => \output_rf2_reg_reg[29]_0\(21),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(21),
      O => wd(21)
    );
RAM_reg_0_31_14_27_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(20),
      I1 => \output_rf2_reg_reg[29]_0\(20),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(20),
      O => wd(20)
    );
RAM_reg_0_31_14_27_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(23),
      I1 => \output_rf2_reg_reg[29]_0\(23),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(23),
      O => wd(23)
    );
RAM_reg_0_31_28_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(29),
      I1 => \output_rf2_reg_reg[29]_0\(29),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(29),
      O => wd(29)
    );
RAM_reg_0_31_28_31_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(28),
      I1 => \output_rf2_reg_reg[29]_0\(28),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(28),
      O => wd(28)
    );
RAM_reg_0_31_28_31_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(31),
      I1 => \output_rf2_reg_reg[29]_0\(31),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(31),
      O => wd(31)
    );
RAM_reg_0_31_28_31_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAFACA0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(30),
      I1 => \output_rf2_reg_reg[29]_0\(30),
      I2 => \MemtoReg_reg_n_0_[1]\,
      I3 => \MemtoReg_reg_n_0_[0]\,
      I4 => Q(30),
      O => wd(30)
    );
RAM_reg_bram_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000440347"
    )
        port map (
      I0 => Q(15),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => Q(14),
      I4 => \output_rf2_reg_reg[29]\(14),
      I5 => \^alu_out_reg_reg[13]\,
      O => \alu_out_reg_reg[15]\
    );
RAM_reg_bram_0_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(4),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(4),
      O => sr2_adr(2)
    );
RAM_reg_bram_0_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(3),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(3),
      O => sr2_adr(1)
    );
RAM_reg_bram_0_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(2),
      O => sr2_adr(0)
    );
RAM_reg_bram_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000022202"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => IorD,
      I4 => Q(14),
      I5 => \^alu_out_reg_reg[15]_1\,
      O => WEA(0)
    );
RAM_reg_bram_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(12),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(12),
      O => sr2_adr(10)
    );
RAM_reg_bram_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(11),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(11),
      O => sr2_adr(9)
    );
RAM_reg_bram_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(10),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(10),
      O => sr2_adr(8)
    );
RAM_reg_bram_0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(9),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(9),
      O => sr2_adr(7)
    );
RAM_reg_bram_0_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(8),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(8),
      O => sr2_adr(6)
    );
RAM_reg_bram_0_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(7),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(7),
      O => sr2_adr(5)
    );
RAM_reg_bram_0_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(6),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(6),
      O => sr2_adr(4)
    );
RAM_reg_bram_0_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(5),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(5),
      O => sr2_adr(3)
    );
RAM_reg_bram_10_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FCBBFF"
    )
        port map (
      I0 => Q(14),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => Q(15),
      I4 => \output_rf2_reg_reg[29]\(15),
      O => \alu_out_reg_reg[14]\
    );
RAM_reg_bram_10_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000ACC0A"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(15),
      I1 => Q(15),
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => IorD,
      I4 => Q(14),
      O => \pc_reg[15]\
    );
RAM_reg_bram_10_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"202A000A20200000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => Q(14),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(14),
      I4 => Q(15),
      I5 => \output_rf2_reg_reg[29]\(15),
      O => MemWrite_reg_12(0)
    );
RAM_reg_bram_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47CF77FF"
    )
        port map (
      I0 => Q(15),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => Q(14),
      I4 => \output_rf2_reg_reg[29]\(14),
      O => \alu_out_reg_reg[15]_4\
    );
RAM_reg_bram_11_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => IorD,
      I4 => Q(15),
      O => \pc_reg[14]_8\
    );
RAM_reg_bram_11_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A800A0080800000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => Q(15),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => MemWrite_reg_10(0)
    );
RAM_reg_bram_12_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(15),
      I1 => IorD,
      I2 => Q(15),
      O => \pc_reg[15]_4\
    );
RAM_reg_bram_12_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(14),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(14),
      O => sr2_adr(11)
    );
RAM_reg_bram_12_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \output_rf2_reg_reg[29]\(15),
      I2 => IorD,
      I3 => Q(15),
      O => MemWrite_reg_1(0)
    );
RAM_reg_bram_13_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(15),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(15),
      O => \^alu_out_reg_reg[15]_1\
    );
RAM_reg_bram_13_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \output_rf2_reg_reg[29]\(15),
      I2 => IorD,
      I3 => Q(15),
      O => MemWrite_reg_13(0)
    );
RAM_reg_bram_1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFACCFAFFFFFFFF"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => IorD,
      I4 => Q(15),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[14]_0\
    );
RAM_reg_bram_1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00002020000A202A"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => Q(15),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => \alu_out_reg_reg[15]_2\
    );
RAM_reg_bram_1_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000002A200000000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => IorD,
      I3 => Q(14),
      I4 => \^alu_out_reg_reg[15]_1\,
      I5 => \^alu_out_reg_reg[13]\,
      O => MemWrite_reg_2(0)
    );
RAM_reg_bram_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAEFEFEFFAFFFFF"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => \output_rf2_reg_reg[29]\(15),
      I2 => IorD,
      I3 => Q(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => \pc_reg[15]_0\
    );
RAM_reg_bram_2_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000C000CAA"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => Q(15),
      I3 => IorD,
      I4 => \output_rf2_reg_reg[29]\(15),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[14]_1\
    );
RAM_reg_bram_2_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200020202000000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \^alu_out_reg_reg[15]_1\,
      I3 => Q(14),
      I4 => IorD,
      I5 => \output_rf2_reg_reg[29]\(14),
      O => MemWrite_reg_3(0)
    );
RAM_reg_bram_3_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5FFFF7F757F7"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => IorD,
      I3 => Q(14),
      I4 => Q(15),
      I5 => \output_rf2_reg_reg[29]\(15),
      O => \pc_reg[14]_2\
    );
RAM_reg_bram_3_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3055300000000000"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(15),
      I1 => Q(15),
      I2 => Q(14),
      I3 => IorD,
      I4 => \output_rf2_reg_reg[29]\(14),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[15]_1\
    );
RAM_reg_bram_3_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088800080"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => IorD,
      I4 => Q(14),
      I5 => \^alu_out_reg_reg[15]_1\,
      O => MemWrite_reg_4(0)
    );
RAM_reg_bram_4_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAEFEFEFFAFFFFF"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => IorD,
      I3 => Q(14),
      I4 => Q(15),
      I5 => \output_rf2_reg_reg[29]\(15),
      O => \pc_reg[14]_3\
    );
RAM_reg_bram_4_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000C000CAA"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(15),
      I1 => Q(15),
      I2 => Q(14),
      I3 => IorD,
      I4 => \output_rf2_reg_reg[29]\(14),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[15]_2\
    );
RAM_reg_bram_4_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002220200000000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => IorD,
      I4 => Q(14),
      I5 => \^alu_out_reg_reg[15]_1\,
      O => MemWrite_reg_5(0)
    );
RAM_reg_bram_5_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5FFFF7F757F7"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => \output_rf2_reg_reg[29]\(15),
      I2 => IorD,
      I3 => Q(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => \pc_reg[15]_3\
    );
RAM_reg_bram_5_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3055300000000000"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => Q(15),
      I3 => IorD,
      I4 => \output_rf2_reg_reg[29]\(15),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[14]_4\
    );
RAM_reg_bram_5_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000808080"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \^alu_out_reg_reg[15]_1\,
      I3 => Q(14),
      I4 => IorD,
      I5 => \output_rf2_reg_reg[29]\(14),
      O => MemWrite_reg_6(0)
    );
RAM_reg_bram_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAFBBFFFFFFBBFF"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => Q(14),
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => IorD,
      I5 => Q(15),
      O => \pc_reg[14]_6\
    );
RAM_reg_bram_6_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8308800"
    )
        port map (
      I0 => Q(15),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => Q(14),
      I4 => \output_rf2_reg_reg[29]\(14),
      I5 => \^alu_out_reg_reg[13]\,
      O => \alu_out_reg_reg[15]_0\
    );
RAM_reg_bram_6_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2220002000000000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \^alu_out_reg_reg[13]\,
      I2 => \output_rf2_reg_reg[29]\(14),
      I3 => IorD,
      I4 => Q(14),
      I5 => \^alu_out_reg_reg[15]_1\,
      O => MemWrite_reg_8(0)
    );
RAM_reg_bram_7_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"335FFF5FFFFFFFFF"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => IorD,
      I4 => Q(15),
      I5 => \^alu_out_reg_reg[13]\,
      O => \pc_reg[14]_5\
    );
RAM_reg_bram_7_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A800A0080800000"
    )
        port map (
      I0 => \^alu_out_reg_reg[13]\,
      I1 => Q(15),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => \alu_out_reg_reg[15]_3\
    );
RAM_reg_bram_7_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A808000000000000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => IorD,
      I3 => Q(14),
      I4 => \^alu_out_reg_reg[15]_1\,
      I5 => \^alu_out_reg_reg[13]\,
      O => MemWrite_reg_7(0)
    );
RAM_reg_bram_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => IorD,
      I4 => Q(15),
      O => \pc_reg[14]_7\
    );
RAM_reg_bram_8_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(13),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(13),
      O => \^alu_out_reg_reg[13]\
    );
RAM_reg_bram_8_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00002020000A202A"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => Q(15),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => MemWrite_reg_9(0)
    );
RAM_reg_bram_9_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FCBBFF"
    )
        port map (
      I0 => Q(15),
      I1 => IorD,
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => Q(14),
      I4 => \output_rf2_reg_reg[29]\(14),
      O => \alu_out_reg_reg[15]_5\
    );
RAM_reg_bram_9_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000ACC0A"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(14),
      I1 => Q(14),
      I2 => \output_rf2_reg_reg[29]\(15),
      I3 => IorD,
      I4 => Q(15),
      O => \pc_reg[14]\
    );
RAM_reg_bram_9_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"202A000A20200000"
    )
        port map (
      I0 => \^memwrite_reg_0\,
      I1 => Q(15),
      I2 => IorD,
      I3 => \output_rf2_reg_reg[29]\(15),
      I4 => Q(14),
      I5 => \output_rf2_reg_reg[29]\(14),
      O => MemWrite_reg_11(0)
    );
\RegDst[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4000C0C0"
    )
        port map (
      I0 => \state__0\(2),
      I1 => rstn,
      I2 => \RegDst[0]_i_2_n_0\,
      I3 => \RegDst[0]_i_3_n_0\,
      I4 => \RegDst[0]_i_4_n_0\,
      O => \RegDst[0]_i_1_n_0\
    );
\RegDst[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00100000"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(0),
      I5 => RegDst(0),
      O => \RegDst[0]_i_2_n_0\
    );
\RegDst[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(29),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \FSM_sequential_state_reg[3]_0\(30),
      I3 => \FSM_sequential_state_reg[3]_0\(28),
      I4 => \FSM_sequential_state_reg[3]_0\(27),
      I5 => \FSM_sequential_state_reg[3]_0\(26),
      O => \RegDst[0]_i_3_n_0\
    );
\RegDst[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(3),
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      O => \RegDst[0]_i_4_n_0\
    );
\RegDst[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => \RegDst[1]_i_2_n_0\,
      I2 => RegDst(1),
      O => \RegDst[1]_i_1_n_0\
    );
\RegDst[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0030000C00300004"
    )
        port map (
      I0 => \RegDst[0]_i_3_n_0\,
      I1 => \state__0\(1),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => \state__0\(0),
      I5 => \state__0\(2),
      O => \RegDst[1]_i_2_n_0\
    );
\RegDst_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \RegDst[0]_i_1_n_0\,
      Q => RegDst(0),
      R => '0'
    );
\RegDst_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \RegDst[1]_i_1_n_0\,
      Q => RegDst(1),
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
RegWrite_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0024FFFF00240000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \state__0\(3),
      I3 => \state__0\(4),
      I4 => RegWrite_i_2_n_0,
      I5 => \^regwrite\,
      O => RegWrite_i_1_n_0
    );
RegWrite_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555404255555557"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      I3 => \state__0\(0),
      I4 => \state__0\(3),
      I5 => RegWrite_i_3_n_0,
      O => RegWrite_i_2_n_0
    );
RegWrite_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(29),
      I1 => \FSM_sequential_state_reg[3]_0\(31),
      I2 => \ALUOp[1]_i_5_n_0\,
      O => RegWrite_i_3_n_0
    );
RegWrite_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => RegWrite_i_1_n_0,
      Q => \^regwrite\,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
ToggleEqual_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFAAAA2000AAAA"
    )
        port map (
      I0 => \PCSrc_temp[1]_i_3_n_0\,
      I1 => ToggleEqual_i_2_n_0,
      I2 => \state__0\(1),
      I3 => ToggleEqual_i_3_n_0,
      I4 => \PCSrc_temp[0]_i_2_n_0\,
      I5 => ToggleEqual,
      O => ToggleEqual_i_1_n_0
    );
ToggleEqual_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFDFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(26),
      I1 => \FSM_sequential_state_reg[3]_0\(29),
      I2 => \FSM_sequential_state_reg[3]_0\(27),
      I3 => \FSM_sequential_state_reg[3]_0\(28),
      I4 => \FSM_sequential_state_reg[3]_0\(31),
      I5 => \FSM_sequential_state_reg[3]_0\(30),
      O => ToggleEqual_i_2_n_0
    );
ToggleEqual_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010101"
    )
        port map (
      I0 => \state__0\(4),
      I1 => \state__0\(2),
      I2 => \state__0\(3),
      I3 => \state__0\(0),
      I4 => \state__0\(1),
      O => ToggleEqual_i_3_n_0
    );
ToggleEqual_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ToggleEqual_i_1_n_0,
      Q => ToggleEqual,
      R => \FSM_sequential_state[4]_i_1_n_0\
    );
\alu_out_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFCFA0CFA0CFA0C0"
    )
        port map (
      I0 => out2(0),
      I1 => out2(31),
      I2 => \alu_out_reg[31]_i_2_n_0\,
      I3 => \alu_out_reg[31]_i_3_n_0\,
      I4 => srcBB(0),
      I5 => \^output_rf1_reg_reg[30]\(0),
      O => \^inst_reg_reg[1]\(0)
    );
\alu_out_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66655565"
    )
        port map (
      I0 => \in\,
      I1 => \ALUSrcB_reg_n_0_[0]\,
      I2 => output_rf2_reg(0),
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(0),
      O => srcBB(0)
    );
\alu_out_reg[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(10),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(10),
      I3 => A(10),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(10)
    );
\alu_out_reg[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95AA955A95A59555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(8),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(10),
      I5 => output_rf2_reg(10),
      O => srcBB(10)
    );
\alu_out_reg[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(10),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(10),
      O => A(10)
    );
\alu_out_reg[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(11),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(11),
      I3 => A(11),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(11)
    );
\alu_out_reg[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(9),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(11),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(11),
      O => srcBB(11)
    );
\alu_out_reg[11]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(11),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(11),
      O => A(11)
    );
\alu_out_reg[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(12),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(12),
      I3 => A(12),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(12)
    );
\alu_out_reg[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(10),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(12),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(12),
      O => srcBB(12)
    );
\alu_out_reg[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(12),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(12),
      O => A(12)
    );
\alu_out_reg[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(13),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(13),
      I3 => A(13),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(13)
    );
\alu_out_reg[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(11),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(13),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(13),
      O => srcBB(13)
    );
\alu_out_reg[13]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(13),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(13),
      O => A(13)
    );
\alu_out_reg[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(14),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(14),
      I3 => A(14),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(14)
    );
\alu_out_reg[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(12),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(14),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(14),
      O => srcBB(14)
    );
\alu_out_reg[14]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(14),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(14),
      O => A(14)
    );
\alu_out_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(15),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(15),
      I3 => A(15),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(15)
    );
\alu_out_reg[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A59A559AA5955595"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(15),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(13),
      I5 => output_rf2_reg(15),
      O => srcBB(15)
    );
\alu_out_reg[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(15),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(15),
      O => A(15)
    );
\alu_out_reg[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(16),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(16),
      I3 => A(16),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(16)
    );
\alu_out_reg[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A59A559AA5955595"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(15),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(14),
      I5 => output_rf2_reg(16),
      O => srcBB(16)
    );
\alu_out_reg[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(16),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(16),
      O => A(16)
    );
\alu_out_reg[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(17),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(17),
      I3 => \^output_rf1_reg_reg[30]\(2),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(17)
    );
\alu_out_reg[17]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(17),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(17)
    );
\alu_out_reg[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(18),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(18),
      I3 => \^output_rf1_reg_reg[30]\(3),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(18)
    );
\alu_out_reg[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(18),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(18)
    );
\alu_out_reg[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(19),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(19),
      I3 => \^output_rf1_reg_reg[30]\(4),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(19)
    );
\alu_out_reg[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(19),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(19)
    );
\alu_out_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(1),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(1),
      I3 => \^output_rf1_reg_reg[30]\(1),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(1)
    );
\alu_out_reg[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5A595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(1),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(1),
      O => srcBB(1)
    );
\alu_out_reg[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(20),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(20),
      I3 => \^output_rf1_reg_reg[30]\(5),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(20)
    );
\alu_out_reg[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(20),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(20)
    );
\alu_out_reg[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(21),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(21),
      I3 => \^output_rf1_reg_reg[30]\(6),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(21)
    );
\alu_out_reg[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(21),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(21)
    );
\alu_out_reg[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(22),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(22),
      I3 => \^output_rf1_reg_reg[30]\(7),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(22)
    );
\alu_out_reg[22]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(22),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(22)
    );
\alu_out_reg[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(23),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(23),
      I3 => \^output_rf1_reg_reg[30]\(8),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(23)
    );
\alu_out_reg[23]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(23),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(23)
    );
\alu_out_reg[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(24),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(24),
      I3 => \^output_rf1_reg_reg[30]\(9),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(24)
    );
\alu_out_reg[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(24),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(24)
    );
\alu_out_reg[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(25),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(25),
      I3 => \^output_rf1_reg_reg[30]\(10),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(25)
    );
\alu_out_reg[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(25),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(25)
    );
\alu_out_reg[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(26),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(26),
      I3 => \^output_rf1_reg_reg[30]\(11),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(26)
    );
\alu_out_reg[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(26),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(26)
    );
\alu_out_reg[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(27),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(27),
      I3 => \^output_rf1_reg_reg[30]\(12),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(27)
    );
\alu_out_reg[27]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(27),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(27)
    );
\alu_out_reg[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(28),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(28),
      I3 => \^output_rf1_reg_reg[30]\(13),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(28)
    );
\alu_out_reg[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(28),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(28)
    );
\alu_out_reg[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(29),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(29),
      I3 => \^output_rf1_reg_reg[30]\(14),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(29)
    );
\alu_out_reg[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(29),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(29)
    );
\alu_out_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(2),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(2),
      I3 => A(2),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(2)
    );
\alu_out_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA5A9A9AAA5A9595"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(2),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(0),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(2),
      O => srcBB(2)
    );
\alu_out_reg[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(2),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(2),
      O => A(2)
    );
\alu_out_reg[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(30),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(30),
      I3 => \^output_rf1_reg_reg[30]\(15),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(30)
    );
\alu_out_reg[30]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA595559"
    )
        port map (
      I0 => \in\,
      I1 => output_rf2_reg(30),
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(15),
      O => srcBB(30)
    );
\alu_out_reg[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B3838380"
    )
        port map (
      I0 => out2(31),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => \alu_out_reg[31]_i_3_n_0\,
      I3 => \alu_out_reg[31]_i_4_n_0\,
      I4 => \alu_out_reg[31]_i_5_n_0\,
      O => \^inst_reg_reg[1]\(31)
    );
\alu_out_reg[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B4FFFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(1),
      I1 => \FSM_sequential_state_reg[3]_0\(3),
      I2 => \FSM_sequential_state_reg[3]_0\(5),
      I3 => \alu_out_reg_reg[31]_0\,
      I4 => sel0(7),
      O => \alu_out_reg[31]_i_2_n_0\
    );
\alu_out_reg[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFBFDFFF"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(1),
      I1 => \FSM_sequential_state_reg[3]_0\(0),
      I2 => sel0(7),
      I3 => \FSM_sequential_state_reg[3]_0\(3),
      I4 => \FSM_sequential_state_reg[3]_0\(2),
      I5 => \alu_out_reg_reg[31]\,
      O => \alu_out_reg[31]_i_3_n_0\
    );
\alu_out_reg[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"959A9595"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(15),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => output_rf2_reg(31),
      O => \alu_out_reg[31]_i_4_n_0\
    );
\alu_out_reg[31]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(31),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(31),
      O => \alu_out_reg[31]_i_5_n_0\
    );
\alu_out_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(3),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(3),
      I3 => A(3),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(3)
    );
\alu_out_reg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(1),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(3),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(3),
      O => srcBB(3)
    );
\alu_out_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(3),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(3),
      O => A(3)
    );
\alu_out_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(4),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(4),
      I3 => A(4),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(4)
    );
\alu_out_reg[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(2),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(4),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(4),
      O => srcBB(4)
    );
\alu_out_reg[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(4),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(4),
      O => A(4)
    );
\alu_out_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(5),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(5),
      I3 => A(5),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(5)
    );
\alu_out_reg[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595AA5A9595A555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(3),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \FSM_sequential_state_reg[3]_0\(5),
      I4 => \ALUSrcB_reg_n_0_[0]\,
      I5 => output_rf2_reg(5),
      O => srcBB(5)
    );
\alu_out_reg[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(5),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(5),
      O => A(5)
    );
\alu_out_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(6),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(6),
      I3 => A(6),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(6)
    );
\alu_out_reg[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95AA955A95A59555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(4),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(6),
      I5 => output_rf2_reg(6),
      O => srcBB(6)
    );
\alu_out_reg[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(6),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(6),
      O => A(6)
    );
\alu_out_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(7),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(7),
      I3 => A(7),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(7)
    );
\alu_out_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95AA955A95A59555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(5),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(7),
      I5 => output_rf2_reg(7),
      O => srcBB(7)
    );
\alu_out_reg[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(7),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(7),
      O => A(7)
    );
\alu_out_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(8),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(8),
      I3 => A(8),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(8)
    );
\alu_out_reg[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95AA955A95A59555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(6),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(8),
      I5 => output_rf2_reg(8),
      O => srcBB(8)
    );
\alu_out_reg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(8),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(8),
      O => A(8)
    );
\alu_out_reg[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8883330"
    )
        port map (
      I0 => out2(9),
      I1 => \alu_out_reg[31]_i_2_n_0\,
      I2 => srcBB(9),
      I3 => A(9),
      I4 => \alu_out_reg[31]_i_3_n_0\,
      O => \^inst_reg_reg[1]\(9)
    );
\alu_out_reg[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95AA955A95A59555"
    )
        port map (
      I0 => \in\,
      I1 => \FSM_sequential_state_reg[3]_0\(7),
      I2 => \ALUSrcB_reg_n_0_[1]\,
      I3 => \ALUSrcB_reg_n_0_[0]\,
      I4 => \FSM_sequential_state_reg[3]_0\(9),
      I5 => output_rf2_reg(9),
      O => srcBB(9)
    );
\alu_out_reg[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(9),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(9),
      O => A(9)
    );
\led[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \led_reg[0]\,
      I1 => \output_rf2_reg_reg[29]\(24),
      I2 => \output_rf2_reg_reg[29]\(10),
      I3 => \output_rf2_reg_reg[29]\(23),
      I4 => \led_reg[0]_0\,
      I5 => \led[7]_i_4_n_0\,
      O => \pc_reg[24]\(0)
    );
\led[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \output_rf2_reg_reg[29]\(26),
      I1 => \output_rf2_reg_reg[29]\(29),
      I2 => \output_rf2_reg_reg[29]\(8),
      I3 => \output_rf2_reg_reg[29]\(16),
      I4 => \output_rf2_reg_reg[29]\(15),
      I5 => \^regwrite\,
      O => \led[7]_i_4_n_0\
    );
\out2_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(15),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(15),
      O => \output_rf1_reg_reg[15]\(7)
    );
\out2_carry__0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(14),
      I1 => \output_rf2_reg_reg[29]\(14),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(14),
      O => \pc_reg[15]_5\(6)
    );
\out2_carry__0_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(13),
      I1 => \output_rf2_reg_reg[29]\(13),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(13),
      O => \pc_reg[15]_5\(5)
    );
\out2_carry__0_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(12),
      I1 => \output_rf2_reg_reg[29]\(12),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(12),
      O => \pc_reg[15]_5\(4)
    );
\out2_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(11),
      I1 => \output_rf2_reg_reg[29]\(11),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(11),
      O => \pc_reg[15]_5\(3)
    );
\out2_carry__0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(10),
      I1 => \output_rf2_reg_reg[29]\(10),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(10),
      O => \pc_reg[15]_5\(2)
    );
\out2_carry__0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(9),
      I1 => \output_rf2_reg_reg[29]\(9),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(9),
      O => \pc_reg[15]_5\(1)
    );
\out2_carry__0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(8),
      I1 => \output_rf2_reg_reg[29]\(8),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(8),
      O => \pc_reg[15]_5\(0)
    );
\out2_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(14),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(14),
      O => \output_rf1_reg_reg[15]\(6)
    );
\out2_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(13),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(13),
      O => \output_rf1_reg_reg[15]\(5)
    );
\out2_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(12),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(12),
      O => \output_rf1_reg_reg[15]\(4)
    );
\out2_carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(11),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(11),
      O => \output_rf1_reg_reg[15]\(3)
    );
\out2_carry__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(10),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(10),
      O => \output_rf1_reg_reg[15]\(2)
    );
\out2_carry__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(9),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(9),
      O => \output_rf1_reg_reg[15]\(1)
    );
\out2_carry__0_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(8),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(8),
      O => \output_rf1_reg_reg[15]\(0)
    );
\out2_carry__0_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(15),
      I1 => \output_rf2_reg_reg[29]\(15),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(15),
      O => \pc_reg[15]_5\(7)
    );
\out2_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(23),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(23),
      O => \^output_rf1_reg_reg[30]\(8)
    );
\out2_carry__1_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(22),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(7),
      O => \inst_reg_reg[15]\(6)
    );
\out2_carry__1_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(21),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(6),
      O => \inst_reg_reg[15]\(5)
    );
\out2_carry__1_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(20),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(5),
      O => \inst_reg_reg[15]\(4)
    );
\out2_carry__1_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(19),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(4),
      O => \inst_reg_reg[15]\(3)
    );
\out2_carry__1_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(18),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(3),
      O => \inst_reg_reg[15]\(2)
    );
\out2_carry__1_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(17),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(2),
      O => \inst_reg_reg[15]\(1)
    );
\out2_carry__1_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(16),
      I1 => \output_rf2_reg_reg[29]\(16),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(16),
      O => \inst_reg_reg[15]\(0)
    );
\out2_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(22),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(22),
      O => \^output_rf1_reg_reg[30]\(7)
    );
\out2_carry__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(21),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(21),
      O => \^output_rf1_reg_reg[30]\(6)
    );
\out2_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(20),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(20),
      O => \^output_rf1_reg_reg[30]\(5)
    );
\out2_carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(19),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(19),
      O => \^output_rf1_reg_reg[30]\(4)
    );
\out2_carry__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(18),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(18),
      O => \^output_rf1_reg_reg[30]\(3)
    );
\out2_carry__1_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(17),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(17),
      O => \^output_rf1_reg_reg[30]\(2)
    );
\out2_carry__1_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(16),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(16),
      O => \output_rf1_reg_reg[16]\(0)
    );
\out2_carry__1_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(23),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(8),
      O => \inst_reg_reg[15]\(7)
    );
\out2_carry__2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(30),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(30),
      O => \^output_rf1_reg_reg[30]\(15)
    );
\out2_carry__2_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(29),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(14),
      O => \pc_reg[31]\(5)
    );
\out2_carry__2_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(28),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(13),
      O => \pc_reg[31]\(4)
    );
\out2_carry__2_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(27),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(12),
      O => \pc_reg[31]\(3)
    );
\out2_carry__2_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(26),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(11),
      O => \pc_reg[31]\(2)
    );
\out2_carry__2_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(25),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(10),
      O => \pc_reg[31]\(1)
    );
\out2_carry__2_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(24),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(9),
      O => \pc_reg[31]\(0)
    );
\out2_carry__2_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(29),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(29),
      O => \^output_rf1_reg_reg[30]\(14)
    );
\out2_carry__2_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(28),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(28),
      O => \^output_rf1_reg_reg[30]\(13)
    );
\out2_carry__2_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(27),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(27),
      O => \^output_rf1_reg_reg[30]\(12)
    );
\out2_carry__2_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(26),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(26),
      O => \^output_rf1_reg_reg[30]\(11)
    );
\out2_carry__2_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(25),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(25),
      O => \^output_rf1_reg_reg[30]\(10)
    );
\out2_carry__2_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(24),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(24),
      O => \^output_rf1_reg_reg[30]\(9)
    );
\out2_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \alu_out_reg[31]_i_4_n_0\,
      I1 => \output_rf2_reg_reg[29]\(31),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(31),
      O => \pc_reg[31]\(7)
    );
\out2_carry__2_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74778B888B887477"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(30),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(15),
      O => \pc_reg[31]\(6)
    );
out2_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(0),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(0),
      O => \^output_rf1_reg_reg[30]\(0)
    );
out2_carry_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(7),
      I1 => \output_rf2_reg_reg[29]\(7),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(7),
      O => S(7)
    );
out2_carry_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(6),
      I1 => \output_rf2_reg_reg[29]\(6),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(6),
      O => S(6)
    );
out2_carry_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(5),
      I1 => \output_rf2_reg_reg[29]\(5),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(5),
      O => S(5)
    );
out2_carry_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(4),
      I1 => \output_rf2_reg_reg[29]\(4),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(4),
      O => S(4)
    );
out2_carry_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(3),
      I1 => \output_rf2_reg_reg[29]\(3),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(3),
      O => S(3)
    );
out2_carry_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => srcBB(2),
      I1 => \output_rf2_reg_reg[29]\(2),
      I2 => ALUSrcA,
      I3 => output_rf1_reg(2),
      O => S(2)
    );
out2_carry_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4F70B080B08F4F7"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(1),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => \ALUSrcB_reg_n_0_[0]\,
      I3 => output_rf2_reg(1),
      I4 => \in\,
      I5 => \^output_rf1_reg_reg[30]\(1),
      O => S(1)
    );
out2_carry_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(0),
      I1 => \ALUSrcB_reg_n_0_[1]\,
      I2 => output_rf2_reg(0),
      I3 => \ALUSrcB_reg_n_0_[0]\,
      O => S(0)
    );
out2_carry_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5F5C5F5"
    )
        port map (
      I0 => sel0(6),
      I1 => out2_carry_i_16_0,
      I2 => sel0(7),
      I3 => \FSM_sequential_state_reg[3]_0\(5),
      I4 => \FSM_sequential_state_reg[3]_0\(4),
      O => \in\
    );
out2_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(7),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(7),
      O => DI(6)
    );
out2_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(6),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(6),
      O => DI(5)
    );
out2_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(5),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(5),
      O => DI(4)
    );
out2_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(4),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(4),
      O => DI(3)
    );
out2_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(3),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(3),
      O => DI(2)
    );
out2_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(2),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(2),
      O => DI(1)
    );
out2_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => output_rf1_reg(1),
      I1 => ALUSrcA,
      I2 => \output_rf2_reg_reg[29]\(1),
      O => \^output_rf1_reg_reg[30]\(1)
    );
out2_carry_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66655565"
    )
        port map (
      I0 => \in\,
      I1 => \ALUSrcB_reg_n_0_[0]\,
      I2 => output_rf2_reg(0),
      I3 => \ALUSrcB_reg_n_0_[1]\,
      I4 => \FSM_sequential_state_reg[3]_0\(0),
      O => DI(0)
    );
\pc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(0),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(0),
      O => D(0)
    );
\pc[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(8),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(10),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(10),
      O => D(10)
    );
\pc[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(9),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(11),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(11),
      O => D(11)
    );
\pc[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(10),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(12),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(12),
      O => D(12)
    );
\pc[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(11),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(13),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(13),
      O => D(13)
    );
\pc[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(12),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(14),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(14),
      O => D(14)
    );
\pc[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(13),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(15),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(15),
      O => D(15)
    );
\pc[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(14),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(16),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(16),
      O => D(16)
    );
\pc[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(15),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(17),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(17),
      O => D(17)
    );
\pc[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(16),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(18),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(18),
      O => D(18)
    );
\pc[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(17),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(19),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(19),
      O => D(19)
    );
\pc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(1),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(1),
      O => D(1)
    );
\pc[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(18),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(20),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(20),
      O => D(20)
    );
\pc[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(19),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(21),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(21),
      O => D(21)
    );
\pc[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(20),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(22),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(22),
      O => D(22)
    );
\pc[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(21),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(23),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(23),
      O => D(23)
    );
\pc[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(22),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(24),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(24),
      O => D(24)
    );
\pc[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(23),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(25),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(25),
      O => D(25)
    );
\pc[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(24),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(26),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(26),
      O => D(26)
    );
\pc[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(25),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(27),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(27),
      O => D(27)
    );
\pc[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(28),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(28),
      O => D(28)
    );
\pc[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(29),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(29),
      O => D(29)
    );
\pc[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(0),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(2),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(2),
      O => D(2)
    );
\pc[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(30),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(30),
      O => D(30)
    );
\pc[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAA60000"
    )
        port map (
      I0 => ToggleEqual,
      I1 => \pc_reg[0]\,
      I2 => \pc_reg[0]_0\,
      I3 => \pc_reg[0]_1\,
      I4 => Branch,
      I5 => \pc[31]_i_6_n_0\,
      O => ToggleEqual_reg_0(0)
    );
\pc[31]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000200"
    )
        port map (
      I0 => \ALUOp[1]_i_4_n_0\,
      I1 => \pc[31]_i_7_0\,
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      I4 => \state__0\(4),
      I5 => \pc[31]_i_17_n_0\,
      O => \pc[31]_i_15_n_0\
    );
\pc[31]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(3),
      O => \pc[31]_i_17_n_0\
    );
\pc[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \pc[31]_i_7_n_0\,
      I1 => Q(31),
      I2 => \pc[31]_i_8_n_0\,
      I3 => \^inst_reg_reg[1]\(31),
      O => D(31)
    );
\pc[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => PCWrite_temp,
      I1 => \pc[31]_i_15_n_0\,
      O => \pc[31]_i_6_n_0\
    );
\pc[31]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => PCSrc_temp(1),
      I1 => \pc[31]_i_15_n_0\,
      I2 => PCSrc_temp(0),
      O => \pc[31]_i_7_n_0\
    );
\pc[31]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => PCSrc_temp(0),
      I1 => PCSrc_temp(1),
      I2 => \pc[31]_i_15_n_0\,
      O => \pc[31]_i_8_n_0\
    );
\pc[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(1),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(3),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(3),
      O => D(3)
    );
\pc[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(2),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(4),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(4),
      O => D(4)
    );
\pc[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(3),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(5),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(5),
      O => D(5)
    );
\pc[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(4),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(6),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(6),
      O => D(6)
    );
\pc[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(5),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(7),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(7),
      O => D(7)
    );
\pc[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(6),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(8),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(8),
      O => D(8)
    );
\pc[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \FSM_sequential_state_reg[3]_0\(7),
      I1 => \pc[31]_i_7_n_0\,
      I2 => Q(9),
      I3 => \pc[31]_i_8_n_0\,
      I4 => \^inst_reg_reg[1]\(9),
      O => D(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_rams_dp_wf is
  port (
    rd : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    RegWrite : in STD_LOGIC;
    wd : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    p_2_out : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_rams_dp_wf : entity is "rams_dp_wf";
end design_1_multicycle_cpu_sim_0_0_rams_dp_wf;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_rams_dp_wf is
  signal NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_0_13 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_31_0_13 : label is 1024;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_31_0_13 : label is "inst/rf1/RAM";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_31_0_13 : label is 31;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_31_0_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_14_27 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_31_14_27 : label is 1024;
  attribute RTL_RAM_NAME of RAM_reg_0_31_14_27 : label is "inst/rf1/RAM";
  attribute ram_addr_begin of RAM_reg_0_31_14_27 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_14_27 : label is 31;
  attribute ram_offset of RAM_reg_0_31_14_27 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_14_27 : label is 14;
  attribute ram_slice_end of RAM_reg_0_31_14_27 : label is 27;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_28_31 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_31_28_31 : label is 1024;
  attribute RTL_RAM_NAME of RAM_reg_0_31_28_31 : label is "inst/rf1/RAM";
  attribute ram_addr_begin of RAM_reg_0_31_28_31 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_28_31 : label is 31;
  attribute ram_offset of RAM_reg_0_31_28_31 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_28_31 : label is 28;
  attribute ram_slice_end of RAM_reg_0_31_28_31 : label is 31;
begin
RAM_reg_0_31_0_13: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"1000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(1 downto 0),
      DIB(1 downto 0) => wd(3 downto 2),
      DIC(1 downto 0) => wd(5 downto 4),
      DID(1 downto 0) => wd(7 downto 6),
      DIE(1 downto 0) => wd(9 downto 8),
      DIF(1 downto 0) => wd(11 downto 10),
      DIG(1 downto 0) => wd(13 downto 12),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(1 downto 0),
      DOB(1 downto 0) => rd(3 downto 2),
      DOC(1 downto 0) => rd(5 downto 4),
      DOD(1 downto 0) => rd(7 downto 6),
      DOE(1 downto 0) => rd(9 downto 8),
      DOF(1 downto 0) => rd(11 downto 10),
      DOG(1 downto 0) => rd(13 downto 12),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
RAM_reg_0_31_14_27: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(15 downto 14),
      DIB(1 downto 0) => wd(17 downto 16),
      DIC(1 downto 0) => wd(19 downto 18),
      DID(1 downto 0) => wd(21 downto 20),
      DIE(1 downto 0) => wd(23 downto 22),
      DIF(1 downto 0) => wd(25 downto 24),
      DIG(1 downto 0) => wd(27 downto 26),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(15 downto 14),
      DOB(1 downto 0) => rd(17 downto 16),
      DOC(1 downto 0) => rd(19 downto 18),
      DOD(1 downto 0) => rd(21 downto 20),
      DOE(1 downto 0) => rd(23 downto 22),
      DOF(1 downto 0) => rd(25 downto 24),
      DOG(1 downto 0) => rd(27 downto 26),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
RAM_reg_0_31_28_31: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(29 downto 28),
      DIB(1 downto 0) => wd(31 downto 30),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DIE(1 downto 0) => B"00",
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(29 downto 28),
      DOB(1 downto 0) => rd(31 downto 30),
      DOC(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED(1 downto 0),
      DOE(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED(1 downto 0),
      DOF(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED(1 downto 0),
      DOG(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED(1 downto 0),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_rams_dp_wf_0 is
  port (
    rd : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    RegWrite : in STD_LOGIC;
    wd : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    p_2_out : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_rams_dp_wf_0 : entity is "rams_dp_wf";
end design_1_multicycle_cpu_sim_0_0_rams_dp_wf_0;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_rams_dp_wf_0 is
  signal NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_0_13 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_31_0_13 : label is 1024;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_31_0_13 : label is "inst/rf2/RAM";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_31_0_13 : label is 31;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_31_0_13 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_31_0_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_14_27 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_31_14_27 : label is 1024;
  attribute RTL_RAM_NAME of RAM_reg_0_31_14_27 : label is "inst/rf2/RAM";
  attribute ram_addr_begin of RAM_reg_0_31_14_27 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_14_27 : label is 31;
  attribute ram_offset of RAM_reg_0_31_14_27 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_14_27 : label is 14;
  attribute ram_slice_end of RAM_reg_0_31_14_27 : label is 27;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_31_28_31 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_31_28_31 : label is 1024;
  attribute RTL_RAM_NAME of RAM_reg_0_31_28_31 : label is "inst/rf2/RAM";
  attribute ram_addr_begin of RAM_reg_0_31_28_31 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_28_31 : label is 31;
  attribute ram_offset of RAM_reg_0_31_28_31 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_28_31 : label is 28;
  attribute ram_slice_end of RAM_reg_0_31_28_31 : label is 31;
begin
RAM_reg_0_31_0_13: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"1000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(1 downto 0),
      DIB(1 downto 0) => wd(3 downto 2),
      DIC(1 downto 0) => wd(5 downto 4),
      DID(1 downto 0) => wd(7 downto 6),
      DIE(1 downto 0) => wd(9 downto 8),
      DIF(1 downto 0) => wd(11 downto 10),
      DIG(1 downto 0) => wd(13 downto 12),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(1 downto 0),
      DOB(1 downto 0) => rd(3 downto 2),
      DOC(1 downto 0) => rd(5 downto 4),
      DOD(1 downto 0) => rd(7 downto 6),
      DOE(1 downto 0) => rd(9 downto 8),
      DOF(1 downto 0) => rd(11 downto 10),
      DOG(1 downto 0) => rd(13 downto 12),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_0_13_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
RAM_reg_0_31_14_27: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(15 downto 14),
      DIB(1 downto 0) => wd(17 downto 16),
      DIC(1 downto 0) => wd(19 downto 18),
      DID(1 downto 0) => wd(21 downto 20),
      DIE(1 downto 0) => wd(23 downto 22),
      DIF(1 downto 0) => wd(25 downto 24),
      DIG(1 downto 0) => wd(27 downto 26),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(15 downto 14),
      DOB(1 downto 0) => rd(17 downto 16),
      DOC(1 downto 0) => rd(19 downto 18),
      DOD(1 downto 0) => rd(21 downto 20),
      DOE(1 downto 0) => rd(23 downto 22),
      DOF(1 downto 0) => rd(25 downto 24),
      DOG(1 downto 0) => rd(27 downto 26),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_14_27_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
RAM_reg_0_31_28_31: unisim.vcomponents.RAM32M16
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => Q(4 downto 0),
      ADDRB(4 downto 0) => Q(4 downto 0),
      ADDRC(4 downto 0) => Q(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      ADDRE(4 downto 0) => Q(4 downto 0),
      ADDRF(4 downto 0) => Q(4 downto 0),
      ADDRG(4 downto 0) => Q(4 downto 0),
      ADDRH(4 downto 0) => p_2_out(4 downto 0),
      DIA(1 downto 0) => wd(29 downto 28),
      DIB(1 downto 0) => wd(31 downto 30),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DIE(1 downto 0) => B"00",
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => rd(29 downto 28),
      DOB(1 downto 0) => rd(31 downto 30),
      DOC(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOD_UNCONNECTED(1 downto 0),
      DOE(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOE_UNCONNECTED(1 downto 0),
      DOF(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOF_UNCONNECTED(1 downto 0),
      DOG(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOG_UNCONNECTED(1 downto 0),
      DOH(1 downto 0) => NLW_RAM_reg_0_31_28_31_DOH_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => RegWrite
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_rams_sp_rf is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    RAM_reg_bram_0_0 : in STD_LOGIC;
    sr2_adr : in STD_LOGIC_VECTOR ( 13 downto 0 );
    output_rf2_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_1_0 : in STD_LOGIC;
    RAM_reg_bram_1_1 : in STD_LOGIC;
    RAM_reg_bram_1_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_2_0 : in STD_LOGIC;
    RAM_reg_bram_2_1 : in STD_LOGIC;
    RAM_reg_bram_2_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_3_0 : in STD_LOGIC;
    RAM_reg_bram_3_1 : in STD_LOGIC;
    RAM_reg_bram_3_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_4_0 : in STD_LOGIC;
    RAM_reg_bram_4_1 : in STD_LOGIC;
    RAM_reg_bram_4_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_5_0 : in STD_LOGIC;
    RAM_reg_bram_5_1 : in STD_LOGIC;
    RAM_reg_bram_5_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_6_0 : in STD_LOGIC;
    RAM_reg_bram_6_1 : in STD_LOGIC;
    RAM_reg_bram_6_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_7_0 : in STD_LOGIC;
    RAM_reg_bram_7_1 : in STD_LOGIC;
    RAM_reg_bram_7_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_8_0 : in STD_LOGIC;
    RAM_reg_bram_8_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_9_0 : in STD_LOGIC;
    RAM_reg_bram_9_1 : in STD_LOGIC;
    RAM_reg_bram_9_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_10_0 : in STD_LOGIC;
    RAM_reg_bram_10_1 : in STD_LOGIC;
    RAM_reg_bram_10_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_11_0 : in STD_LOGIC;
    RAM_reg_bram_11_1 : in STD_LOGIC;
    RAM_reg_bram_11_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_13_0 : in STD_LOGIC;
    RAM_reg_bram_12_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    RAM_reg_bram_13_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_rams_sp_rf : entity is "rams_sp_rf";
end design_1_multicycle_cpu_sim_0_0_rams_sp_rf;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_rams_sp_rf is
  signal RAM_reg_bram_0_n_134 : STD_LOGIC;
  signal RAM_reg_bram_0_n_135 : STD_LOGIC;
  signal RAM_reg_bram_0_n_20 : STD_LOGIC;
  signal RAM_reg_bram_0_n_21 : STD_LOGIC;
  signal RAM_reg_bram_0_n_22 : STD_LOGIC;
  signal RAM_reg_bram_0_n_23 : STD_LOGIC;
  signal RAM_reg_bram_0_n_24 : STD_LOGIC;
  signal RAM_reg_bram_0_n_25 : STD_LOGIC;
  signal RAM_reg_bram_0_n_26 : STD_LOGIC;
  signal RAM_reg_bram_0_n_27 : STD_LOGIC;
  signal RAM_reg_bram_0_n_28 : STD_LOGIC;
  signal RAM_reg_bram_0_n_29 : STD_LOGIC;
  signal RAM_reg_bram_0_n_30 : STD_LOGIC;
  signal RAM_reg_bram_0_n_31 : STD_LOGIC;
  signal RAM_reg_bram_0_n_32 : STD_LOGIC;
  signal RAM_reg_bram_0_n_33 : STD_LOGIC;
  signal RAM_reg_bram_0_n_34 : STD_LOGIC;
  signal RAM_reg_bram_0_n_35 : STD_LOGIC;
  signal RAM_reg_bram_10_n_135 : STD_LOGIC;
  signal RAM_reg_bram_10_n_28 : STD_LOGIC;
  signal RAM_reg_bram_10_n_29 : STD_LOGIC;
  signal RAM_reg_bram_10_n_30 : STD_LOGIC;
  signal RAM_reg_bram_10_n_31 : STD_LOGIC;
  signal RAM_reg_bram_10_n_32 : STD_LOGIC;
  signal RAM_reg_bram_10_n_33 : STD_LOGIC;
  signal RAM_reg_bram_10_n_34 : STD_LOGIC;
  signal RAM_reg_bram_10_n_35 : STD_LOGIC;
  signal RAM_reg_bram_12_n_132 : STD_LOGIC;
  signal RAM_reg_bram_12_n_133 : STD_LOGIC;
  signal RAM_reg_bram_12_n_134 : STD_LOGIC;
  signal RAM_reg_bram_12_n_135 : STD_LOGIC;
  signal RAM_reg_bram_12_n_32 : STD_LOGIC;
  signal RAM_reg_bram_12_n_33 : STD_LOGIC;
  signal RAM_reg_bram_12_n_34 : STD_LOGIC;
  signal RAM_reg_bram_12_n_35 : STD_LOGIC;
  signal RAM_reg_bram_1_n_134 : STD_LOGIC;
  signal RAM_reg_bram_1_n_135 : STD_LOGIC;
  signal RAM_reg_bram_1_n_20 : STD_LOGIC;
  signal RAM_reg_bram_1_n_21 : STD_LOGIC;
  signal RAM_reg_bram_1_n_22 : STD_LOGIC;
  signal RAM_reg_bram_1_n_23 : STD_LOGIC;
  signal RAM_reg_bram_1_n_24 : STD_LOGIC;
  signal RAM_reg_bram_1_n_25 : STD_LOGIC;
  signal RAM_reg_bram_1_n_26 : STD_LOGIC;
  signal RAM_reg_bram_1_n_27 : STD_LOGIC;
  signal RAM_reg_bram_1_n_28 : STD_LOGIC;
  signal RAM_reg_bram_1_n_29 : STD_LOGIC;
  signal RAM_reg_bram_1_n_30 : STD_LOGIC;
  signal RAM_reg_bram_1_n_31 : STD_LOGIC;
  signal RAM_reg_bram_1_n_32 : STD_LOGIC;
  signal RAM_reg_bram_1_n_33 : STD_LOGIC;
  signal RAM_reg_bram_1_n_34 : STD_LOGIC;
  signal RAM_reg_bram_1_n_35 : STD_LOGIC;
  signal RAM_reg_bram_2_n_134 : STD_LOGIC;
  signal RAM_reg_bram_2_n_135 : STD_LOGIC;
  signal RAM_reg_bram_2_n_20 : STD_LOGIC;
  signal RAM_reg_bram_2_n_21 : STD_LOGIC;
  signal RAM_reg_bram_2_n_22 : STD_LOGIC;
  signal RAM_reg_bram_2_n_23 : STD_LOGIC;
  signal RAM_reg_bram_2_n_24 : STD_LOGIC;
  signal RAM_reg_bram_2_n_25 : STD_LOGIC;
  signal RAM_reg_bram_2_n_26 : STD_LOGIC;
  signal RAM_reg_bram_2_n_27 : STD_LOGIC;
  signal RAM_reg_bram_2_n_28 : STD_LOGIC;
  signal RAM_reg_bram_2_n_29 : STD_LOGIC;
  signal RAM_reg_bram_2_n_30 : STD_LOGIC;
  signal RAM_reg_bram_2_n_31 : STD_LOGIC;
  signal RAM_reg_bram_2_n_32 : STD_LOGIC;
  signal RAM_reg_bram_2_n_33 : STD_LOGIC;
  signal RAM_reg_bram_2_n_34 : STD_LOGIC;
  signal RAM_reg_bram_2_n_35 : STD_LOGIC;
  signal RAM_reg_bram_3_n_134 : STD_LOGIC;
  signal RAM_reg_bram_3_n_135 : STD_LOGIC;
  signal RAM_reg_bram_3_n_20 : STD_LOGIC;
  signal RAM_reg_bram_3_n_21 : STD_LOGIC;
  signal RAM_reg_bram_3_n_22 : STD_LOGIC;
  signal RAM_reg_bram_3_n_23 : STD_LOGIC;
  signal RAM_reg_bram_3_n_24 : STD_LOGIC;
  signal RAM_reg_bram_3_n_25 : STD_LOGIC;
  signal RAM_reg_bram_3_n_26 : STD_LOGIC;
  signal RAM_reg_bram_3_n_27 : STD_LOGIC;
  signal RAM_reg_bram_3_n_28 : STD_LOGIC;
  signal RAM_reg_bram_3_n_29 : STD_LOGIC;
  signal RAM_reg_bram_3_n_30 : STD_LOGIC;
  signal RAM_reg_bram_3_n_31 : STD_LOGIC;
  signal RAM_reg_bram_3_n_32 : STD_LOGIC;
  signal RAM_reg_bram_3_n_33 : STD_LOGIC;
  signal RAM_reg_bram_3_n_34 : STD_LOGIC;
  signal RAM_reg_bram_3_n_35 : STD_LOGIC;
  signal RAM_reg_bram_4_n_134 : STD_LOGIC;
  signal RAM_reg_bram_4_n_135 : STD_LOGIC;
  signal RAM_reg_bram_4_n_20 : STD_LOGIC;
  signal RAM_reg_bram_4_n_21 : STD_LOGIC;
  signal RAM_reg_bram_4_n_22 : STD_LOGIC;
  signal RAM_reg_bram_4_n_23 : STD_LOGIC;
  signal RAM_reg_bram_4_n_24 : STD_LOGIC;
  signal RAM_reg_bram_4_n_25 : STD_LOGIC;
  signal RAM_reg_bram_4_n_26 : STD_LOGIC;
  signal RAM_reg_bram_4_n_27 : STD_LOGIC;
  signal RAM_reg_bram_4_n_28 : STD_LOGIC;
  signal RAM_reg_bram_4_n_29 : STD_LOGIC;
  signal RAM_reg_bram_4_n_30 : STD_LOGIC;
  signal RAM_reg_bram_4_n_31 : STD_LOGIC;
  signal RAM_reg_bram_4_n_32 : STD_LOGIC;
  signal RAM_reg_bram_4_n_33 : STD_LOGIC;
  signal RAM_reg_bram_4_n_34 : STD_LOGIC;
  signal RAM_reg_bram_4_n_35 : STD_LOGIC;
  signal RAM_reg_bram_5_n_134 : STD_LOGIC;
  signal RAM_reg_bram_5_n_135 : STD_LOGIC;
  signal RAM_reg_bram_5_n_20 : STD_LOGIC;
  signal RAM_reg_bram_5_n_21 : STD_LOGIC;
  signal RAM_reg_bram_5_n_22 : STD_LOGIC;
  signal RAM_reg_bram_5_n_23 : STD_LOGIC;
  signal RAM_reg_bram_5_n_24 : STD_LOGIC;
  signal RAM_reg_bram_5_n_25 : STD_LOGIC;
  signal RAM_reg_bram_5_n_26 : STD_LOGIC;
  signal RAM_reg_bram_5_n_27 : STD_LOGIC;
  signal RAM_reg_bram_5_n_28 : STD_LOGIC;
  signal RAM_reg_bram_5_n_29 : STD_LOGIC;
  signal RAM_reg_bram_5_n_30 : STD_LOGIC;
  signal RAM_reg_bram_5_n_31 : STD_LOGIC;
  signal RAM_reg_bram_5_n_32 : STD_LOGIC;
  signal RAM_reg_bram_5_n_33 : STD_LOGIC;
  signal RAM_reg_bram_5_n_34 : STD_LOGIC;
  signal RAM_reg_bram_5_n_35 : STD_LOGIC;
  signal RAM_reg_bram_6_n_134 : STD_LOGIC;
  signal RAM_reg_bram_6_n_135 : STD_LOGIC;
  signal RAM_reg_bram_6_n_20 : STD_LOGIC;
  signal RAM_reg_bram_6_n_21 : STD_LOGIC;
  signal RAM_reg_bram_6_n_22 : STD_LOGIC;
  signal RAM_reg_bram_6_n_23 : STD_LOGIC;
  signal RAM_reg_bram_6_n_24 : STD_LOGIC;
  signal RAM_reg_bram_6_n_25 : STD_LOGIC;
  signal RAM_reg_bram_6_n_26 : STD_LOGIC;
  signal RAM_reg_bram_6_n_27 : STD_LOGIC;
  signal RAM_reg_bram_6_n_28 : STD_LOGIC;
  signal RAM_reg_bram_6_n_29 : STD_LOGIC;
  signal RAM_reg_bram_6_n_30 : STD_LOGIC;
  signal RAM_reg_bram_6_n_31 : STD_LOGIC;
  signal RAM_reg_bram_6_n_32 : STD_LOGIC;
  signal RAM_reg_bram_6_n_33 : STD_LOGIC;
  signal RAM_reg_bram_6_n_34 : STD_LOGIC;
  signal RAM_reg_bram_6_n_35 : STD_LOGIC;
  signal RAM_reg_bram_8_n_135 : STD_LOGIC;
  signal RAM_reg_bram_8_n_28 : STD_LOGIC;
  signal RAM_reg_bram_8_n_29 : STD_LOGIC;
  signal RAM_reg_bram_8_n_30 : STD_LOGIC;
  signal RAM_reg_bram_8_n_31 : STD_LOGIC;
  signal RAM_reg_bram_8_n_32 : STD_LOGIC;
  signal RAM_reg_bram_8_n_33 : STD_LOGIC;
  signal RAM_reg_bram_8_n_34 : STD_LOGIC;
  signal RAM_reg_bram_8_n_35 : STD_LOGIC;
  signal RAM_reg_bram_9_n_135 : STD_LOGIC;
  signal RAM_reg_bram_9_n_28 : STD_LOGIC;
  signal RAM_reg_bram_9_n_29 : STD_LOGIC;
  signal RAM_reg_bram_9_n_30 : STD_LOGIC;
  signal RAM_reg_bram_9_n_31 : STD_LOGIC;
  signal RAM_reg_bram_9_n_32 : STD_LOGIC;
  signal RAM_reg_bram_9_n_33 : STD_LOGIC;
  signal RAM_reg_bram_9_n_34 : STD_LOGIC;
  signal RAM_reg_bram_9_n_35 : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_0_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_0_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_1_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_1_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_1_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_1_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_1_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_1_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_1_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_1_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_1_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_1_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_1_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_1_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_1_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_1_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_10_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_10_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_10_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_10_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_10_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal NLW_RAM_reg_bram_10_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_10_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_RAM_reg_bram_10_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_10_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_10_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_10_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_10_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_10_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_10_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_11_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_11_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_11_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_11_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_11_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_11_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_11_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_11_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_11_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal NLW_RAM_reg_bram_11_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_11_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_RAM_reg_bram_11_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_11_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_11_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_12_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_12_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_12_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_12_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_12_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 4 );
  signal NLW_RAM_reg_bram_12_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_12_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_12_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_12_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_12_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_12_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_12_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_12_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_13_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_13_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_13_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_13_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_13_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_13_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_13_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_13_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_13_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 4 );
  signal NLW_RAM_reg_bram_13_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_13_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_13_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_13_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_13_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_14_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_14_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_14_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_14_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_14_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal NLW_RAM_reg_bram_14_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_bram_14_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_14_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_bram_2_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_2_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_2_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_2_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_2_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_2_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_2_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_2_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_2_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_2_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_2_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_2_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_2_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_2_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_3_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_3_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_3_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_3_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_3_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_3_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_3_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_3_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_3_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_3_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_3_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_3_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_3_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_3_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_4_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_4_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_4_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_4_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_4_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_4_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_4_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_4_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_4_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_4_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_4_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_4_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_4_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_4_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_5_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_5_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_5_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_5_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_5_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_5_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_5_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_5_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_5_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_5_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_5_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_5_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_5_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_5_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_6_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_6_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_6_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_6_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_6_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_6_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_6_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_6_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_6_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_6_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_6_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_6_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_6_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_6_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_7_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_7_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_7_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_7_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_7_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_7_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_7_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_7_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_7_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_RAM_reg_bram_7_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_7_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_RAM_reg_bram_7_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_7_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_7_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_8_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_8_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_8_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_8_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_8_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal NLW_RAM_reg_bram_8_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_8_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_RAM_reg_bram_8_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_8_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_8_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_8_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_8_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_8_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_8_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_RAM_reg_bram_9_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_9_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_9_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_9_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_bram_9_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal NLW_RAM_reg_bram_9_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_9_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_RAM_reg_bram_9_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_9_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_9_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_RAM_reg_bram_9_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_9_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_RAM_reg_bram_9_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_RAM_reg_bram_9_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_0 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_0 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_0 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_bram_0 : label is 524288;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_bram_0 : label is "inst/idmd/RAM";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of RAM_reg_bram_0 : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of RAM_reg_bram_0 : label is 2047;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of RAM_reg_bram_0 : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of RAM_reg_bram_0 : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_bram_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_bram_0 : label is 2047;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_bram_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_bram_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_bram_0 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_1 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_1 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_1 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_1 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_1 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_1 : label is 2048;
  attribute bram_addr_end of RAM_reg_bram_1 : label is 4095;
  attribute bram_slice_begin of RAM_reg_bram_1 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_1 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_1 : label is 2048;
  attribute ram_addr_end of RAM_reg_bram_1 : label is 4095;
  attribute ram_offset of RAM_reg_bram_1 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_1 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_1 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_10 : label is "p1_d8";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_10 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_10 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_10 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_10 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_10 : label is 8192;
  attribute bram_addr_end of RAM_reg_bram_10 : label is 12287;
  attribute bram_slice_begin of RAM_reg_bram_10 : label is 18;
  attribute bram_slice_end of RAM_reg_bram_10 : label is 26;
  attribute ram_addr_begin of RAM_reg_bram_10 : label is 8192;
  attribute ram_addr_end of RAM_reg_bram_10 : label is 12287;
  attribute ram_offset of RAM_reg_bram_10 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_10 : label is 18;
  attribute ram_slice_end of RAM_reg_bram_10 : label is 26;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_11 : label is "p1_d8";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_11 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_11 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_11 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_11 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_11 : label is 12288;
  attribute bram_addr_end of RAM_reg_bram_11 : label is 16383;
  attribute bram_slice_begin of RAM_reg_bram_11 : label is 18;
  attribute bram_slice_end of RAM_reg_bram_11 : label is 26;
  attribute ram_addr_begin of RAM_reg_bram_11 : label is 12288;
  attribute ram_addr_end of RAM_reg_bram_11 : label is 16383;
  attribute ram_offset of RAM_reg_bram_11 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_11 : label is 18;
  attribute ram_slice_end of RAM_reg_bram_11 : label is 26;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_12 : label is "p0_d4";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_12 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_12 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_12 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_12 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_12 : label is 0;
  attribute bram_addr_end of RAM_reg_bram_12 : label is 8191;
  attribute bram_slice_begin of RAM_reg_bram_12 : label is 27;
  attribute bram_slice_end of RAM_reg_bram_12 : label is 30;
  attribute ram_addr_begin of RAM_reg_bram_12 : label is 0;
  attribute ram_addr_end of RAM_reg_bram_12 : label is 8191;
  attribute ram_offset of RAM_reg_bram_12 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_12 : label is 27;
  attribute ram_slice_end of RAM_reg_bram_12 : label is 30;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_13 : label is "p0_d4";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_13 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_13 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_13 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_13 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_13 : label is 8192;
  attribute bram_addr_end of RAM_reg_bram_13 : label is 16383;
  attribute bram_slice_begin of RAM_reg_bram_13 : label is 27;
  attribute bram_slice_end of RAM_reg_bram_13 : label is 30;
  attribute ram_addr_begin of RAM_reg_bram_13 : label is 8192;
  attribute ram_addr_end of RAM_reg_bram_13 : label is 16383;
  attribute ram_offset of RAM_reg_bram_13 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_13 : label is 27;
  attribute ram_slice_end of RAM_reg_bram_13 : label is 30;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_14 : label is "p0_d1";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_14 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_14 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_14 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_14 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_14 : label is 0;
  attribute bram_addr_end of RAM_reg_bram_14 : label is 16383;
  attribute bram_slice_begin of RAM_reg_bram_14 : label is 31;
  attribute bram_slice_end of RAM_reg_bram_14 : label is 31;
  attribute ram_addr_begin of RAM_reg_bram_14 : label is 0;
  attribute ram_addr_end of RAM_reg_bram_14 : label is 16383;
  attribute ram_offset of RAM_reg_bram_14 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_14 : label is 31;
  attribute ram_slice_end of RAM_reg_bram_14 : label is 31;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_2 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_2 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_2 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_2 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_2 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_2 : label is 4096;
  attribute bram_addr_end of RAM_reg_bram_2 : label is 6143;
  attribute bram_slice_begin of RAM_reg_bram_2 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_2 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_2 : label is 4096;
  attribute ram_addr_end of RAM_reg_bram_2 : label is 6143;
  attribute ram_offset of RAM_reg_bram_2 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_2 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_2 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_3 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_3 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_3 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_3 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_3 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_3 : label is 6144;
  attribute bram_addr_end of RAM_reg_bram_3 : label is 8191;
  attribute bram_slice_begin of RAM_reg_bram_3 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_3 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_3 : label is 6144;
  attribute ram_addr_end of RAM_reg_bram_3 : label is 8191;
  attribute ram_offset of RAM_reg_bram_3 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_3 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_3 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_4 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_4 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_4 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_4 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_4 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_4 : label is 8192;
  attribute bram_addr_end of RAM_reg_bram_4 : label is 10239;
  attribute bram_slice_begin of RAM_reg_bram_4 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_4 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_4 : label is 8192;
  attribute ram_addr_end of RAM_reg_bram_4 : label is 10239;
  attribute ram_offset of RAM_reg_bram_4 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_4 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_4 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_5 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_5 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_5 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_5 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_5 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_5 : label is 10240;
  attribute bram_addr_end of RAM_reg_bram_5 : label is 12287;
  attribute bram_slice_begin of RAM_reg_bram_5 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_5 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_5 : label is 10240;
  attribute ram_addr_end of RAM_reg_bram_5 : label is 12287;
  attribute ram_offset of RAM_reg_bram_5 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_5 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_5 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_6 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_6 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_6 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_6 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_6 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_6 : label is 12288;
  attribute bram_addr_end of RAM_reg_bram_6 : label is 14335;
  attribute bram_slice_begin of RAM_reg_bram_6 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_6 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_6 : label is 12288;
  attribute ram_addr_end of RAM_reg_bram_6 : label is 14335;
  attribute ram_offset of RAM_reg_bram_6 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_6 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_6 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_7 : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_7 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_7 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_7 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_7 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_7 : label is 14336;
  attribute bram_addr_end of RAM_reg_bram_7 : label is 16383;
  attribute bram_slice_begin of RAM_reg_bram_7 : label is 0;
  attribute bram_slice_end of RAM_reg_bram_7 : label is 17;
  attribute ram_addr_begin of RAM_reg_bram_7 : label is 14336;
  attribute ram_addr_end of RAM_reg_bram_7 : label is 16383;
  attribute ram_offset of RAM_reg_bram_7 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_7 : label is 0;
  attribute ram_slice_end of RAM_reg_bram_7 : label is 17;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_8 : label is "p1_d8";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_8 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_8 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_8 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_8 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_8 : label is 0;
  attribute bram_addr_end of RAM_reg_bram_8 : label is 4095;
  attribute bram_slice_begin of RAM_reg_bram_8 : label is 18;
  attribute bram_slice_end of RAM_reg_bram_8 : label is 26;
  attribute ram_addr_begin of RAM_reg_bram_8 : label is 0;
  attribute ram_addr_end of RAM_reg_bram_8 : label is 4095;
  attribute ram_offset of RAM_reg_bram_8 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_8 : label is 18;
  attribute ram_slice_end of RAM_reg_bram_8 : label is 26;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg_bram_9 : label is "p1_d8";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_bram_9 : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of RAM_reg_bram_9 : label is "PERFORMANCE";
  attribute RTL_RAM_BITS of RAM_reg_bram_9 : label is 524288;
  attribute RTL_RAM_NAME of RAM_reg_bram_9 : label is "inst/idmd/RAM";
  attribute bram_addr_begin of RAM_reg_bram_9 : label is 4096;
  attribute bram_addr_end of RAM_reg_bram_9 : label is 8191;
  attribute bram_slice_begin of RAM_reg_bram_9 : label is 18;
  attribute bram_slice_end of RAM_reg_bram_9 : label is 26;
  attribute ram_addr_begin of RAM_reg_bram_9 : label is 4096;
  attribute ram_addr_end of RAM_reg_bram_9 : label is 8191;
  attribute ram_offset of RAM_reg_bram_9 : label is 0;
  attribute ram_slice_begin of RAM_reg_bram_9 : label is 18;
  attribute ram_slice_end of RAM_reg_bram_9 : label is 26;
begin
RAM_reg_bram_0: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "FIRST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000002E2F8B8BE2EBF8BAC64",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0004FFFE00000004FFF800010008000400000000FFFFF8080001082A00010019",
      INIT_01 => X"00040004FFF8000100080004000DF80810200004000CFFF000010010000C0000",
      INIT_02 => X"0000000000000000000000000000000000000000002400000004FFF800000008",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_0_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_0_n_20,
      CASDOUTA(14) => RAM_reg_bram_0_n_21,
      CASDOUTA(13) => RAM_reg_bram_0_n_22,
      CASDOUTA(12) => RAM_reg_bram_0_n_23,
      CASDOUTA(11) => RAM_reg_bram_0_n_24,
      CASDOUTA(10) => RAM_reg_bram_0_n_25,
      CASDOUTA(9) => RAM_reg_bram_0_n_26,
      CASDOUTA(8) => RAM_reg_bram_0_n_27,
      CASDOUTA(7) => RAM_reg_bram_0_n_28,
      CASDOUTA(6) => RAM_reg_bram_0_n_29,
      CASDOUTA(5) => RAM_reg_bram_0_n_30,
      CASDOUTA(4) => RAM_reg_bram_0_n_31,
      CASDOUTA(3) => RAM_reg_bram_0_n_32,
      CASDOUTA(2) => RAM_reg_bram_0_n_33,
      CASDOUTA(1) => RAM_reg_bram_0_n_34,
      CASDOUTA(0) => RAM_reg_bram_0_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_0_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_0_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_0_n_134,
      CASDOUTPA(0) => RAM_reg_bram_0_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_0_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_0_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_0_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_0_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_0_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_0_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_0_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_0_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_0_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_0_0,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_0_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_0_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => WEA(0),
      WEA(2) => WEA(0),
      WEA(1) => WEA(0),
      WEA(0) => WEA(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_1: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_0_n_20,
      CASDINA(14) => RAM_reg_bram_0_n_21,
      CASDINA(13) => RAM_reg_bram_0_n_22,
      CASDINA(12) => RAM_reg_bram_0_n_23,
      CASDINA(11) => RAM_reg_bram_0_n_24,
      CASDINA(10) => RAM_reg_bram_0_n_25,
      CASDINA(9) => RAM_reg_bram_0_n_26,
      CASDINA(8) => RAM_reg_bram_0_n_27,
      CASDINA(7) => RAM_reg_bram_0_n_28,
      CASDINA(6) => RAM_reg_bram_0_n_29,
      CASDINA(5) => RAM_reg_bram_0_n_30,
      CASDINA(4) => RAM_reg_bram_0_n_31,
      CASDINA(3) => RAM_reg_bram_0_n_32,
      CASDINA(2) => RAM_reg_bram_0_n_33,
      CASDINA(1) => RAM_reg_bram_0_n_34,
      CASDINA(0) => RAM_reg_bram_0_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_0_n_134,
      CASDINPA(0) => RAM_reg_bram_0_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_1_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_1_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_1_n_20,
      CASDOUTA(14) => RAM_reg_bram_1_n_21,
      CASDOUTA(13) => RAM_reg_bram_1_n_22,
      CASDOUTA(12) => RAM_reg_bram_1_n_23,
      CASDOUTA(11) => RAM_reg_bram_1_n_24,
      CASDOUTA(10) => RAM_reg_bram_1_n_25,
      CASDOUTA(9) => RAM_reg_bram_1_n_26,
      CASDOUTA(8) => RAM_reg_bram_1_n_27,
      CASDOUTA(7) => RAM_reg_bram_1_n_28,
      CASDOUTA(6) => RAM_reg_bram_1_n_29,
      CASDOUTA(5) => RAM_reg_bram_1_n_30,
      CASDOUTA(4) => RAM_reg_bram_1_n_31,
      CASDOUTA(3) => RAM_reg_bram_1_n_32,
      CASDOUTA(2) => RAM_reg_bram_1_n_33,
      CASDOUTA(1) => RAM_reg_bram_1_n_34,
      CASDOUTA(0) => RAM_reg_bram_1_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_1_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_1_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_1_n_134,
      CASDOUTPA(0) => RAM_reg_bram_1_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_1_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_1_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_1_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_1_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_1_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_1_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_1_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_1_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_1_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_1_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_1_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_1_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_1_2(0),
      WEA(2) => RAM_reg_bram_1_2(0),
      WEA(1) => RAM_reg_bram_1_2(0),
      WEA(0) => RAM_reg_bram_1_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_10: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 3) => sr2_adr(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 8) => B"000000000000000000000000",
      CASDINA(7) => RAM_reg_bram_9_n_28,
      CASDINA(6) => RAM_reg_bram_9_n_29,
      CASDINA(5) => RAM_reg_bram_9_n_30,
      CASDINA(4) => RAM_reg_bram_9_n_31,
      CASDINA(3) => RAM_reg_bram_9_n_32,
      CASDINA(2) => RAM_reg_bram_9_n_33,
      CASDINA(1) => RAM_reg_bram_9_n_34,
      CASDINA(0) => RAM_reg_bram_9_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 1) => B"000",
      CASDINPA(0) => RAM_reg_bram_9_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_10_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 8) => NLW_RAM_reg_bram_10_CASDOUTA_UNCONNECTED(31 downto 8),
      CASDOUTA(7) => RAM_reg_bram_10_n_28,
      CASDOUTA(6) => RAM_reg_bram_10_n_29,
      CASDOUTA(5) => RAM_reg_bram_10_n_30,
      CASDOUTA(4) => RAM_reg_bram_10_n_31,
      CASDOUTA(3) => RAM_reg_bram_10_n_32,
      CASDOUTA(2) => RAM_reg_bram_10_n_33,
      CASDOUTA(1) => RAM_reg_bram_10_n_34,
      CASDOUTA(0) => RAM_reg_bram_10_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_10_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 1) => NLW_RAM_reg_bram_10_CASDOUTPA_UNCONNECTED(3 downto 1),
      CASDOUTPA(0) => RAM_reg_bram_10_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_10_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_10_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_10_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_10_DBITERR_UNCONNECTED,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => output_rf2_reg(25 downto 18),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => output_rf2_reg(26),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_10_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_10_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_10_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_10_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_10_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_10_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_10_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_10_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_10_2(0),
      WEA(2) => RAM_reg_bram_10_2(0),
      WEA(1) => RAM_reg_bram_10_2(0),
      WEA(0) => RAM_reg_bram_10_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_11: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "LAST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 3) => sr2_adr(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 8) => B"000000000000000000000000",
      CASDINA(7) => RAM_reg_bram_10_n_28,
      CASDINA(6) => RAM_reg_bram_10_n_29,
      CASDINA(5) => RAM_reg_bram_10_n_30,
      CASDINA(4) => RAM_reg_bram_10_n_31,
      CASDINA(3) => RAM_reg_bram_10_n_32,
      CASDINA(2) => RAM_reg_bram_10_n_33,
      CASDINA(1) => RAM_reg_bram_10_n_34,
      CASDINA(0) => RAM_reg_bram_10_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 1) => B"000",
      CASDINPA(0) => RAM_reg_bram_10_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_11_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => NLW_RAM_reg_bram_11_CASDOUTA_UNCONNECTED(31 downto 0),
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_11_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 0) => NLW_RAM_reg_bram_11_CASDOUTPA_UNCONNECTED(3 downto 0),
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_11_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_11_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_11_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_11_DBITERR_UNCONNECTED,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => output_rf2_reg(25 downto 18),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => output_rf2_reg(26),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 8) => NLW_RAM_reg_bram_11_DOUTADOUT_UNCONNECTED(31 downto 8),
      DOUTADOUT(7 downto 0) => dout(25 downto 18),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_11_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 1) => NLW_RAM_reg_bram_11_DOUTPADOUTP_UNCONNECTED(3 downto 1),
      DOUTPADOUTP(0) => dout(26),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_11_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_11_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_11_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_11_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_11_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_11_2(0),
      WEA(2) => RAM_reg_bram_11_2(0),
      WEA(1) => RAM_reg_bram_11_2(0),
      WEA(0) => RAM_reg_bram_11_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_12: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "FIRST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000014140451414540011414545411414545402041",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 2) => sr2_adr(12 downto 0),
      ADDRARDADDR(1 downto 0) => B"00",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 4) => NLW_RAM_reg_bram_12_CASDOUTA_UNCONNECTED(31 downto 4),
      CASDOUTA(3) => RAM_reg_bram_12_n_32,
      CASDOUTA(2) => RAM_reg_bram_12_n_33,
      CASDOUTA(1) => RAM_reg_bram_12_n_34,
      CASDOUTA(0) => RAM_reg_bram_12_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_12_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3) => RAM_reg_bram_12_n_132,
      CASDOUTPA(2) => RAM_reg_bram_12_n_133,
      CASDOUTPA(1) => RAM_reg_bram_12_n_134,
      CASDOUTPA(0) => RAM_reg_bram_12_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_12_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_12_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_12_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_12_DBITERR_UNCONNECTED,
      DINADIN(31 downto 4) => B"0000000000000000000000000000",
      DINADIN(3 downto 0) => output_rf2_reg(30 downto 27),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => B"0000",
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_12_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_12_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_12_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_12_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_12_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_13_0,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_12_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_12_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_12_0(0),
      WEA(2) => RAM_reg_bram_12_0(0),
      WEA(1) => RAM_reg_bram_12_0(0),
      WEA(0) => RAM_reg_bram_12_0(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_13: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "LAST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 2) => sr2_adr(12 downto 0),
      ADDRARDADDR(1 downto 0) => B"00",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 4) => B"0000000000000000000000000000",
      CASDINA(3) => RAM_reg_bram_12_n_32,
      CASDINA(2) => RAM_reg_bram_12_n_33,
      CASDINA(1) => RAM_reg_bram_12_n_34,
      CASDINA(0) => RAM_reg_bram_12_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3) => RAM_reg_bram_12_n_132,
      CASDINPA(2) => RAM_reg_bram_12_n_133,
      CASDINPA(1) => RAM_reg_bram_12_n_134,
      CASDINPA(0) => RAM_reg_bram_12_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_13_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => NLW_RAM_reg_bram_13_CASDOUTA_UNCONNECTED(31 downto 0),
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_13_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 0) => NLW_RAM_reg_bram_13_CASDOUTPA_UNCONNECTED(3 downto 0),
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_13_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_13_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_13_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_13_DBITERR_UNCONNECTED,
      DINADIN(31 downto 4) => B"0000000000000000000000000000",
      DINADIN(3 downto 0) => output_rf2_reg(30 downto 27),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => B"0000",
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 4) => NLW_RAM_reg_bram_13_DOUTADOUT_UNCONNECTED(31 downto 4),
      DOUTADOUT(3 downto 0) => dout(30 downto 27),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_13_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_13_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_13_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_13_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => sr2_adr(13),
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_13_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_13_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_13_1(0),
      WEA(2) => RAM_reg_bram_13_1(0),
      WEA(1) => RAM_reg_bram_13_1(0),
      WEA(0) => RAM_reg_bram_13_1(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_14: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"00000000000000000000000000000000000000000000000000000008C462B140",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13 downto 0) => sr2_adr(13 downto 0),
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => NLW_RAM_reg_bram_14_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_RAM_reg_bram_14_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_RAM_reg_bram_14_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_RAM_reg_bram_14_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DINADIN(15 downto 1) => B"000000000000000",
      DINADIN(0) => output_rf2_reg(31),
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 1) => NLW_RAM_reg_bram_14_DOUTADOUT_UNCONNECTED(15 downto 1),
      DOUTADOUT(0) => dout(31),
      DOUTBDOUT(15 downto 0) => NLW_RAM_reg_bram_14_DOUTBDOUT_UNCONNECTED(15 downto 0),
      DOUTPADOUTP(1 downto 0) => NLW_RAM_reg_bram_14_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_RAM_reg_bram_14_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1) => MemWrite,
      WEA(0) => MemWrite,
      WEBWE(3 downto 0) => B"0000"
    );
RAM_reg_bram_2: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_1_n_20,
      CASDINA(14) => RAM_reg_bram_1_n_21,
      CASDINA(13) => RAM_reg_bram_1_n_22,
      CASDINA(12) => RAM_reg_bram_1_n_23,
      CASDINA(11) => RAM_reg_bram_1_n_24,
      CASDINA(10) => RAM_reg_bram_1_n_25,
      CASDINA(9) => RAM_reg_bram_1_n_26,
      CASDINA(8) => RAM_reg_bram_1_n_27,
      CASDINA(7) => RAM_reg_bram_1_n_28,
      CASDINA(6) => RAM_reg_bram_1_n_29,
      CASDINA(5) => RAM_reg_bram_1_n_30,
      CASDINA(4) => RAM_reg_bram_1_n_31,
      CASDINA(3) => RAM_reg_bram_1_n_32,
      CASDINA(2) => RAM_reg_bram_1_n_33,
      CASDINA(1) => RAM_reg_bram_1_n_34,
      CASDINA(0) => RAM_reg_bram_1_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_1_n_134,
      CASDINPA(0) => RAM_reg_bram_1_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_2_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_2_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_2_n_20,
      CASDOUTA(14) => RAM_reg_bram_2_n_21,
      CASDOUTA(13) => RAM_reg_bram_2_n_22,
      CASDOUTA(12) => RAM_reg_bram_2_n_23,
      CASDOUTA(11) => RAM_reg_bram_2_n_24,
      CASDOUTA(10) => RAM_reg_bram_2_n_25,
      CASDOUTA(9) => RAM_reg_bram_2_n_26,
      CASDOUTA(8) => RAM_reg_bram_2_n_27,
      CASDOUTA(7) => RAM_reg_bram_2_n_28,
      CASDOUTA(6) => RAM_reg_bram_2_n_29,
      CASDOUTA(5) => RAM_reg_bram_2_n_30,
      CASDOUTA(4) => RAM_reg_bram_2_n_31,
      CASDOUTA(3) => RAM_reg_bram_2_n_32,
      CASDOUTA(2) => RAM_reg_bram_2_n_33,
      CASDOUTA(1) => RAM_reg_bram_2_n_34,
      CASDOUTA(0) => RAM_reg_bram_2_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_2_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_2_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_2_n_134,
      CASDOUTPA(0) => RAM_reg_bram_2_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_2_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_2_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_2_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_2_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_2_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_2_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_2_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_2_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_2_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_2_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_2_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_2_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_2_2(0),
      WEA(2) => RAM_reg_bram_2_2(0),
      WEA(1) => RAM_reg_bram_2_2(0),
      WEA(0) => RAM_reg_bram_2_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_3: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_2_n_20,
      CASDINA(14) => RAM_reg_bram_2_n_21,
      CASDINA(13) => RAM_reg_bram_2_n_22,
      CASDINA(12) => RAM_reg_bram_2_n_23,
      CASDINA(11) => RAM_reg_bram_2_n_24,
      CASDINA(10) => RAM_reg_bram_2_n_25,
      CASDINA(9) => RAM_reg_bram_2_n_26,
      CASDINA(8) => RAM_reg_bram_2_n_27,
      CASDINA(7) => RAM_reg_bram_2_n_28,
      CASDINA(6) => RAM_reg_bram_2_n_29,
      CASDINA(5) => RAM_reg_bram_2_n_30,
      CASDINA(4) => RAM_reg_bram_2_n_31,
      CASDINA(3) => RAM_reg_bram_2_n_32,
      CASDINA(2) => RAM_reg_bram_2_n_33,
      CASDINA(1) => RAM_reg_bram_2_n_34,
      CASDINA(0) => RAM_reg_bram_2_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_2_n_134,
      CASDINPA(0) => RAM_reg_bram_2_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_3_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_3_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_3_n_20,
      CASDOUTA(14) => RAM_reg_bram_3_n_21,
      CASDOUTA(13) => RAM_reg_bram_3_n_22,
      CASDOUTA(12) => RAM_reg_bram_3_n_23,
      CASDOUTA(11) => RAM_reg_bram_3_n_24,
      CASDOUTA(10) => RAM_reg_bram_3_n_25,
      CASDOUTA(9) => RAM_reg_bram_3_n_26,
      CASDOUTA(8) => RAM_reg_bram_3_n_27,
      CASDOUTA(7) => RAM_reg_bram_3_n_28,
      CASDOUTA(6) => RAM_reg_bram_3_n_29,
      CASDOUTA(5) => RAM_reg_bram_3_n_30,
      CASDOUTA(4) => RAM_reg_bram_3_n_31,
      CASDOUTA(3) => RAM_reg_bram_3_n_32,
      CASDOUTA(2) => RAM_reg_bram_3_n_33,
      CASDOUTA(1) => RAM_reg_bram_3_n_34,
      CASDOUTA(0) => RAM_reg_bram_3_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_3_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_3_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_3_n_134,
      CASDOUTPA(0) => RAM_reg_bram_3_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_3_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_3_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_3_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_3_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_3_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_3_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_3_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_3_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_3_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_3_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_3_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_3_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_3_2(0),
      WEA(2) => RAM_reg_bram_3_2(0),
      WEA(1) => RAM_reg_bram_3_2(0),
      WEA(0) => RAM_reg_bram_3_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_4: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_3_n_20,
      CASDINA(14) => RAM_reg_bram_3_n_21,
      CASDINA(13) => RAM_reg_bram_3_n_22,
      CASDINA(12) => RAM_reg_bram_3_n_23,
      CASDINA(11) => RAM_reg_bram_3_n_24,
      CASDINA(10) => RAM_reg_bram_3_n_25,
      CASDINA(9) => RAM_reg_bram_3_n_26,
      CASDINA(8) => RAM_reg_bram_3_n_27,
      CASDINA(7) => RAM_reg_bram_3_n_28,
      CASDINA(6) => RAM_reg_bram_3_n_29,
      CASDINA(5) => RAM_reg_bram_3_n_30,
      CASDINA(4) => RAM_reg_bram_3_n_31,
      CASDINA(3) => RAM_reg_bram_3_n_32,
      CASDINA(2) => RAM_reg_bram_3_n_33,
      CASDINA(1) => RAM_reg_bram_3_n_34,
      CASDINA(0) => RAM_reg_bram_3_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_3_n_134,
      CASDINPA(0) => RAM_reg_bram_3_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_4_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_4_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_4_n_20,
      CASDOUTA(14) => RAM_reg_bram_4_n_21,
      CASDOUTA(13) => RAM_reg_bram_4_n_22,
      CASDOUTA(12) => RAM_reg_bram_4_n_23,
      CASDOUTA(11) => RAM_reg_bram_4_n_24,
      CASDOUTA(10) => RAM_reg_bram_4_n_25,
      CASDOUTA(9) => RAM_reg_bram_4_n_26,
      CASDOUTA(8) => RAM_reg_bram_4_n_27,
      CASDOUTA(7) => RAM_reg_bram_4_n_28,
      CASDOUTA(6) => RAM_reg_bram_4_n_29,
      CASDOUTA(5) => RAM_reg_bram_4_n_30,
      CASDOUTA(4) => RAM_reg_bram_4_n_31,
      CASDOUTA(3) => RAM_reg_bram_4_n_32,
      CASDOUTA(2) => RAM_reg_bram_4_n_33,
      CASDOUTA(1) => RAM_reg_bram_4_n_34,
      CASDOUTA(0) => RAM_reg_bram_4_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_4_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_4_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_4_n_134,
      CASDOUTPA(0) => RAM_reg_bram_4_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_4_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_4_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_4_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_4_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_4_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_4_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_4_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_4_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_4_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_4_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_4_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_4_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_4_2(0),
      WEA(2) => RAM_reg_bram_4_2(0),
      WEA(1) => RAM_reg_bram_4_2(0),
      WEA(0) => RAM_reg_bram_4_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_5: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_4_n_20,
      CASDINA(14) => RAM_reg_bram_4_n_21,
      CASDINA(13) => RAM_reg_bram_4_n_22,
      CASDINA(12) => RAM_reg_bram_4_n_23,
      CASDINA(11) => RAM_reg_bram_4_n_24,
      CASDINA(10) => RAM_reg_bram_4_n_25,
      CASDINA(9) => RAM_reg_bram_4_n_26,
      CASDINA(8) => RAM_reg_bram_4_n_27,
      CASDINA(7) => RAM_reg_bram_4_n_28,
      CASDINA(6) => RAM_reg_bram_4_n_29,
      CASDINA(5) => RAM_reg_bram_4_n_30,
      CASDINA(4) => RAM_reg_bram_4_n_31,
      CASDINA(3) => RAM_reg_bram_4_n_32,
      CASDINA(2) => RAM_reg_bram_4_n_33,
      CASDINA(1) => RAM_reg_bram_4_n_34,
      CASDINA(0) => RAM_reg_bram_4_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_4_n_134,
      CASDINPA(0) => RAM_reg_bram_4_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_5_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_5_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_5_n_20,
      CASDOUTA(14) => RAM_reg_bram_5_n_21,
      CASDOUTA(13) => RAM_reg_bram_5_n_22,
      CASDOUTA(12) => RAM_reg_bram_5_n_23,
      CASDOUTA(11) => RAM_reg_bram_5_n_24,
      CASDOUTA(10) => RAM_reg_bram_5_n_25,
      CASDOUTA(9) => RAM_reg_bram_5_n_26,
      CASDOUTA(8) => RAM_reg_bram_5_n_27,
      CASDOUTA(7) => RAM_reg_bram_5_n_28,
      CASDOUTA(6) => RAM_reg_bram_5_n_29,
      CASDOUTA(5) => RAM_reg_bram_5_n_30,
      CASDOUTA(4) => RAM_reg_bram_5_n_31,
      CASDOUTA(3) => RAM_reg_bram_5_n_32,
      CASDOUTA(2) => RAM_reg_bram_5_n_33,
      CASDOUTA(1) => RAM_reg_bram_5_n_34,
      CASDOUTA(0) => RAM_reg_bram_5_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_5_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_5_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_5_n_134,
      CASDOUTPA(0) => RAM_reg_bram_5_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_5_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_5_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_5_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_5_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_5_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_5_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_5_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_5_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_5_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_5_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_5_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_5_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_5_2(0),
      WEA(2) => RAM_reg_bram_5_2(0),
      WEA(1) => RAM_reg_bram_5_2(0),
      WEA(0) => RAM_reg_bram_5_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_6: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_5_n_20,
      CASDINA(14) => RAM_reg_bram_5_n_21,
      CASDINA(13) => RAM_reg_bram_5_n_22,
      CASDINA(12) => RAM_reg_bram_5_n_23,
      CASDINA(11) => RAM_reg_bram_5_n_24,
      CASDINA(10) => RAM_reg_bram_5_n_25,
      CASDINA(9) => RAM_reg_bram_5_n_26,
      CASDINA(8) => RAM_reg_bram_5_n_27,
      CASDINA(7) => RAM_reg_bram_5_n_28,
      CASDINA(6) => RAM_reg_bram_5_n_29,
      CASDINA(5) => RAM_reg_bram_5_n_30,
      CASDINA(4) => RAM_reg_bram_5_n_31,
      CASDINA(3) => RAM_reg_bram_5_n_32,
      CASDINA(2) => RAM_reg_bram_5_n_33,
      CASDINA(1) => RAM_reg_bram_5_n_34,
      CASDINA(0) => RAM_reg_bram_5_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_5_n_134,
      CASDINPA(0) => RAM_reg_bram_5_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_6_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 16) => NLW_RAM_reg_bram_6_CASDOUTA_UNCONNECTED(31 downto 16),
      CASDOUTA(15) => RAM_reg_bram_6_n_20,
      CASDOUTA(14) => RAM_reg_bram_6_n_21,
      CASDOUTA(13) => RAM_reg_bram_6_n_22,
      CASDOUTA(12) => RAM_reg_bram_6_n_23,
      CASDOUTA(11) => RAM_reg_bram_6_n_24,
      CASDOUTA(10) => RAM_reg_bram_6_n_25,
      CASDOUTA(9) => RAM_reg_bram_6_n_26,
      CASDOUTA(8) => RAM_reg_bram_6_n_27,
      CASDOUTA(7) => RAM_reg_bram_6_n_28,
      CASDOUTA(6) => RAM_reg_bram_6_n_29,
      CASDOUTA(5) => RAM_reg_bram_6_n_30,
      CASDOUTA(4) => RAM_reg_bram_6_n_31,
      CASDOUTA(3) => RAM_reg_bram_6_n_32,
      CASDOUTA(2) => RAM_reg_bram_6_n_33,
      CASDOUTA(1) => RAM_reg_bram_6_n_34,
      CASDOUTA(0) => RAM_reg_bram_6_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_6_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 2) => NLW_RAM_reg_bram_6_CASDOUTPA_UNCONNECTED(3 downto 2),
      CASDOUTPA(1) => RAM_reg_bram_6_n_134,
      CASDOUTPA(0) => RAM_reg_bram_6_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_6_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_6_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_6_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_6_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_6_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_6_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_6_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_6_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_6_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_6_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_6_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_6_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_6_2(0),
      WEA(2) => RAM_reg_bram_6_2(0),
      WEA(1) => RAM_reg_bram_6_2(0),
      WEA(0) => RAM_reg_bram_6_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_7: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "LAST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 4) => sr2_adr(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 16) => B"0000000000000000",
      CASDINA(15) => RAM_reg_bram_6_n_20,
      CASDINA(14) => RAM_reg_bram_6_n_21,
      CASDINA(13) => RAM_reg_bram_6_n_22,
      CASDINA(12) => RAM_reg_bram_6_n_23,
      CASDINA(11) => RAM_reg_bram_6_n_24,
      CASDINA(10) => RAM_reg_bram_6_n_25,
      CASDINA(9) => RAM_reg_bram_6_n_26,
      CASDINA(8) => RAM_reg_bram_6_n_27,
      CASDINA(7) => RAM_reg_bram_6_n_28,
      CASDINA(6) => RAM_reg_bram_6_n_29,
      CASDINA(5) => RAM_reg_bram_6_n_30,
      CASDINA(4) => RAM_reg_bram_6_n_31,
      CASDINA(3) => RAM_reg_bram_6_n_32,
      CASDINA(2) => RAM_reg_bram_6_n_33,
      CASDINA(1) => RAM_reg_bram_6_n_34,
      CASDINA(0) => RAM_reg_bram_6_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 2) => B"00",
      CASDINPA(1) => RAM_reg_bram_6_n_134,
      CASDINPA(0) => RAM_reg_bram_6_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_7_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => NLW_RAM_reg_bram_7_CASDOUTA_UNCONNECTED(31 downto 0),
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_7_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 0) => NLW_RAM_reg_bram_7_CASDOUTPA_UNCONNECTED(3 downto 0),
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_7_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_7_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_7_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_7_DBITERR_UNCONNECTED,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => output_rf2_reg(15 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => output_rf2_reg(17 downto 16),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 16) => NLW_RAM_reg_bram_7_DOUTADOUT_UNCONNECTED(31 downto 16),
      DOUTADOUT(15 downto 0) => dout(15 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_7_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 2) => NLW_RAM_reg_bram_7_DOUTPADOUTP_UNCONNECTED(3 downto 2),
      DOUTPADOUTP(1 downto 0) => dout(17 downto 16),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_7_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_7_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_7_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_7_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_7_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_7_2(0),
      WEA(2) => RAM_reg_bram_7_2(0),
      WEA(1) => RAM_reg_bram_7_2(0),
      WEA(0) => RAM_reg_bram_7_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_8: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "FIRST",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"00000000000000000000000000000000000000000000000000000008D46AB548",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"F7F7F700F7F700F818F0F7F700F7F718F018F0F7F700F7F718F010F800080000",
      INIT_01 => X"00000000000000000000000000000000000000000000000000000010F7F700F7",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 3) => sr2_adr(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 8) => NLW_RAM_reg_bram_8_CASDOUTA_UNCONNECTED(31 downto 8),
      CASDOUTA(7) => RAM_reg_bram_8_n_28,
      CASDOUTA(6) => RAM_reg_bram_8_n_29,
      CASDOUTA(5) => RAM_reg_bram_8_n_30,
      CASDOUTA(4) => RAM_reg_bram_8_n_31,
      CASDOUTA(3) => RAM_reg_bram_8_n_32,
      CASDOUTA(2) => RAM_reg_bram_8_n_33,
      CASDOUTA(1) => RAM_reg_bram_8_n_34,
      CASDOUTA(0) => RAM_reg_bram_8_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_8_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 1) => NLW_RAM_reg_bram_8_CASDOUTPA_UNCONNECTED(3 downto 1),
      CASDOUTPA(0) => RAM_reg_bram_8_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_8_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_8_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_8_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_8_DBITERR_UNCONNECTED,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => output_rf2_reg(25 downto 18),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => output_rf2_reg(26),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_8_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_8_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_8_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_8_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_8_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_8_0,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_8_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_8_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_8_1(0),
      WEA(2) => RAM_reg_bram_8_1(0),
      WEA(1) => RAM_reg_bram_8_1(0),
      WEA(0) => RAM_reg_bram_8_1(0),
      WEBWE(7 downto 0) => B"00000000"
    );
RAM_reg_bram_9: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "MIDDLE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(14 downto 3) => sr2_adr(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 0) => B"111111111111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 8) => B"000000000000000000000000",
      CASDINA(7) => RAM_reg_bram_8_n_28,
      CASDINA(6) => RAM_reg_bram_8_n_29,
      CASDINA(5) => RAM_reg_bram_8_n_30,
      CASDINA(4) => RAM_reg_bram_8_n_31,
      CASDINA(3) => RAM_reg_bram_8_n_32,
      CASDINA(2) => RAM_reg_bram_8_n_33,
      CASDINA(1) => RAM_reg_bram_8_n_34,
      CASDINA(0) => RAM_reg_bram_8_n_35,
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 1) => B"000",
      CASDINPA(0) => RAM_reg_bram_8_n_135,
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => RAM_reg_bram_9_0,
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 8) => NLW_RAM_reg_bram_9_CASDOUTA_UNCONNECTED(31 downto 8),
      CASDOUTA(7) => RAM_reg_bram_9_n_28,
      CASDOUTA(6) => RAM_reg_bram_9_n_29,
      CASDOUTA(5) => RAM_reg_bram_9_n_30,
      CASDOUTA(4) => RAM_reg_bram_9_n_31,
      CASDOUTA(3) => RAM_reg_bram_9_n_32,
      CASDOUTA(2) => RAM_reg_bram_9_n_33,
      CASDOUTA(1) => RAM_reg_bram_9_n_34,
      CASDOUTA(0) => RAM_reg_bram_9_n_35,
      CASDOUTB(31 downto 0) => NLW_RAM_reg_bram_9_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 1) => NLW_RAM_reg_bram_9_CASDOUTPA_UNCONNECTED(3 downto 1),
      CASDOUTPA(0) => RAM_reg_bram_9_n_135,
      CASDOUTPB(3 downto 0) => NLW_RAM_reg_bram_9_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_RAM_reg_bram_9_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_RAM_reg_bram_9_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => clk,
      CLKBWRCLK => '0',
      DBITERR => NLW_RAM_reg_bram_9_DBITERR_UNCONNECTED,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => output_rf2_reg(25 downto 18),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => output_rf2_reg(26),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => NLW_RAM_reg_bram_9_DOUTADOUT_UNCONNECTED(31 downto 0),
      DOUTBDOUT(31 downto 0) => NLW_RAM_reg_bram_9_DOUTBDOUT_UNCONNECTED(31 downto 0),
      DOUTPADOUTP(3 downto 0) => NLW_RAM_reg_bram_9_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_RAM_reg_bram_9_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_RAM_reg_bram_9_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => RAM_reg_bram_9_1,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_RAM_reg_bram_9_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_RAM_reg_bram_9_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3) => RAM_reg_bram_9_2(0),
      WEA(2) => RAM_reg_bram_9_2(0),
      WEA(1) => RAM_reg_bram_9_2(0),
      WEA(0) => RAM_reg_bram_9_2(0),
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_multi_control_unit is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite : out STD_LOGIC;
    RegWrite : out STD_LOGIC;
    \alu_out_reg_reg[15]\ : out STD_LOGIC;
    sr2_adr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \alu_out_reg_reg[15]_0\ : out STD_LOGIC;
    \pc_reg[15]\ : out STD_LOGIC;
    MemWrite_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    MemWrite_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_0\ : out STD_LOGIC;
    \alu_out_reg_reg[15]_1\ : out STD_LOGIC;
    MemWrite_reg_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_0\ : out STD_LOGIC;
    \pc_reg[14]_1\ : out STD_LOGIC;
    MemWrite_reg_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_2\ : out STD_LOGIC;
    \pc_reg[15]_1\ : out STD_LOGIC;
    MemWrite_reg_3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_3\ : out STD_LOGIC;
    \pc_reg[15]_2\ : out STD_LOGIC;
    MemWrite_reg_4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_3\ : out STD_LOGIC;
    \pc_reg[14]_4\ : out STD_LOGIC;
    MemWrite_reg_5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_5\ : out STD_LOGIC;
    \alu_out_reg_reg[15]_2\ : out STD_LOGIC;
    WEA : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite_reg_6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_6\ : out STD_LOGIC;
    MemWrite_reg_7 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[14]_7\ : out STD_LOGIC;
    MemWrite_reg_8 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[15]_3\ : out STD_LOGIC;
    \pc_reg[14]_8\ : out STD_LOGIC;
    MemWrite_reg_9 : out STD_LOGIC_VECTOR ( 0 to 0 );
    MemWrite_reg_10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \alu_out_reg_reg[15]_4\ : out STD_LOGIC;
    \alu_out_reg_reg[14]\ : out STD_LOGIC;
    \pc_reg[15]_4\ : out STD_LOGIC;
    MemWrite_reg_11 : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \inst_reg_reg[1]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \output_rf1_reg_reg[30]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ToggleEqual_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[31]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \pc_reg[24]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_2_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    wd : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \output_rf1_reg_reg[15]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \output_rf1_reg_reg[16]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \pc_reg[15]_5\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \inst_reg_reg[15]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \output_rf2_reg_reg[29]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \FSM_sequential_state_reg[3]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    output_rf2_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rstn : in STD_LOGIC;
    out2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \pc_reg[0]\ : in STD_LOGIC;
    \pc_reg[0]_0\ : in STD_LOGIC;
    \pc_reg[0]_1\ : in STD_LOGIC;
    \pc[31]_i_7\ : in STD_LOGIC;
    \alu_out_reg_reg[31]\ : in STD_LOGIC;
    output_rf1_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out2_carry_i_16 : in STD_LOGIC;
    \alu_out_reg_reg[31]_0\ : in STD_LOGIC;
    \led_reg[0]\ : in STD_LOGIC;
    \led_reg[0]_0\ : in STD_LOGIC;
    \output_rf2_reg_reg[29]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_multi_control_unit : entity is "multi_control_unit";
end design_1_multicycle_cpu_sim_0_0_multi_control_unit;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_multi_control_unit is
begin
md: entity work.design_1_multicycle_cpu_sim_0_0_multi_main_decoder
     port map (
      D(31 downto 0) => D(31 downto 0),
      DI(6 downto 0) => DI(6 downto 0),
      E(0) => E(0),
      \FSM_sequential_state_reg[3]_0\(31 downto 0) => \FSM_sequential_state_reg[3]\(31 downto 0),
      MemWrite_reg_0 => MemWrite,
      MemWrite_reg_1(0) => MemWrite_reg(0),
      MemWrite_reg_10(0) => MemWrite_reg_8(0),
      MemWrite_reg_11(0) => MemWrite_reg_9(0),
      MemWrite_reg_12(0) => MemWrite_reg_10(0),
      MemWrite_reg_13(0) => MemWrite_reg_11(0),
      MemWrite_reg_2(0) => MemWrite_reg_0(0),
      MemWrite_reg_3(0) => MemWrite_reg_1(0),
      MemWrite_reg_4(0) => MemWrite_reg_2(0),
      MemWrite_reg_5(0) => MemWrite_reg_3(0),
      MemWrite_reg_6(0) => MemWrite_reg_4(0),
      MemWrite_reg_7(0) => MemWrite_reg_5(0),
      MemWrite_reg_8(0) => MemWrite_reg_6(0),
      MemWrite_reg_9(0) => MemWrite_reg_7(0),
      Q(31 downto 0) => Q(31 downto 0),
      RegWrite => RegWrite,
      S(7 downto 0) => S(7 downto 0),
      ToggleEqual_reg_0(0) => ToggleEqual_reg(0),
      WEA(0) => WEA(0),
      \alu_out_reg_reg[13]\ => sr2_adr(11),
      \alu_out_reg_reg[14]\ => \alu_out_reg_reg[14]\,
      \alu_out_reg_reg[15]\ => \alu_out_reg_reg[15]\,
      \alu_out_reg_reg[15]_0\ => \alu_out_reg_reg[15]_0\,
      \alu_out_reg_reg[15]_1\ => sr2_adr(13),
      \alu_out_reg_reg[15]_2\ => \alu_out_reg_reg[15]_1\,
      \alu_out_reg_reg[15]_3\ => \alu_out_reg_reg[15]_2\,
      \alu_out_reg_reg[15]_4\ => \alu_out_reg_reg[15]_3\,
      \alu_out_reg_reg[15]_5\ => \alu_out_reg_reg[15]_4\,
      \alu_out_reg_reg[31]\ => \alu_out_reg_reg[31]\,
      \alu_out_reg_reg[31]_0\ => \alu_out_reg_reg[31]_0\,
      clk => clk,
      \inst_reg_reg[15]\(7 downto 0) => \inst_reg_reg[15]\(7 downto 0),
      \inst_reg_reg[1]\(31 downto 0) => \inst_reg_reg[1]\(31 downto 0),
      \led_reg[0]\ => \led_reg[0]\,
      \led_reg[0]_0\ => \led_reg[0]_0\,
      out2(31 downto 0) => out2(31 downto 0),
      out2_carry_i_16_0 => out2_carry_i_16,
      output_rf1_reg(31 downto 0) => output_rf1_reg(31 downto 0),
      \output_rf1_reg_reg[15]\(7 downto 0) => \output_rf1_reg_reg[15]\(7 downto 0),
      \output_rf1_reg_reg[16]\(0) => \output_rf1_reg_reg[16]\(0),
      \output_rf1_reg_reg[30]\(15 downto 0) => \output_rf1_reg_reg[30]\(15 downto 0),
      output_rf2_reg(31 downto 0) => output_rf2_reg(31 downto 0),
      \output_rf2_reg_reg[29]\(31 downto 0) => \output_rf2_reg_reg[29]\(31 downto 0),
      \output_rf2_reg_reg[29]_0\(31 downto 0) => \output_rf2_reg_reg[29]_0\(31 downto 0),
      p_2_out(4 downto 0) => p_2_out(4 downto 0),
      \pc[31]_i_7_0\ => \pc[31]_i_7\,
      \pc_reg[0]\ => \pc_reg[0]\,
      \pc_reg[0]_0\ => \pc_reg[0]_0\,
      \pc_reg[0]_1\ => \pc_reg[0]_1\,
      \pc_reg[14]\ => \pc_reg[14]\,
      \pc_reg[14]_0\ => \pc_reg[14]_0\,
      \pc_reg[14]_1\ => \pc_reg[14]_1\,
      \pc_reg[14]_2\ => \pc_reg[14]_2\,
      \pc_reg[14]_3\ => \pc_reg[14]_3\,
      \pc_reg[14]_4\ => \pc_reg[14]_4\,
      \pc_reg[14]_5\ => \pc_reg[14]_5\,
      \pc_reg[14]_6\ => \pc_reg[14]_6\,
      \pc_reg[14]_7\ => \pc_reg[14]_7\,
      \pc_reg[14]_8\ => \pc_reg[14]_8\,
      \pc_reg[15]\ => \pc_reg[15]\,
      \pc_reg[15]_0\ => \pc_reg[15]_0\,
      \pc_reg[15]_1\ => \pc_reg[15]_1\,
      \pc_reg[15]_2\ => \pc_reg[15]_2\,
      \pc_reg[15]_3\ => \pc_reg[15]_3\,
      \pc_reg[15]_4\ => \pc_reg[15]_4\,
      \pc_reg[15]_5\(7 downto 0) => \pc_reg[15]_5\(7 downto 0),
      \pc_reg[24]\(0) => \pc_reg[24]\(0),
      \pc_reg[31]\(7 downto 0) => \pc_reg[31]\(7 downto 0),
      rstn => rstn,
      sr2_adr(11) => sr2_adr(12),
      sr2_adr(10 downto 0) => sr2_adr(10 downto 0),
      wd(31 downto 0) => wd(31 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0_multicycle_cpu_sim is
  port (
    led : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_multicycle_cpu_sim_0_0_multicycle_cpu_sim : entity is "multicycle_cpu_sim";
end design_1_multicycle_cpu_sim_0_0_multicycle_cpu_sim;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0_multicycle_cpu_sim is
  signal \^a\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal IRWrite : STD_LOGIC;
  signal MemWrite : STD_LOGIC;
  signal RegWrite : STD_LOGIC;
  signal a_n_32 : STD_LOGIC;
  signal a_n_33 : STD_LOGIC;
  signal a_n_34 : STD_LOGIC;
  signal a_n_35 : STD_LOGIC;
  signal alu_out_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \alu_out_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \alu_out_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal alu_result : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \inst_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \inst_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal led0 : STD_LOGIC;
  signal \led[7]_i_2_n_0\ : STD_LOGIC;
  signal \led[7]_i_3_n_0\ : STD_LOGIC;
  signal \led[7]_i_5_n_0\ : STD_LOGIC;
  signal \led[7]_i_6_n_0\ : STD_LOGIC;
  signal \led[7]_i_7_n_0\ : STD_LOGIC;
  signal \led[7]_i_8_n_0\ : STD_LOGIC;
  signal mcu_n_143 : STD_LOGIC;
  signal mcu_n_144 : STD_LOGIC;
  signal mcu_n_145 : STD_LOGIC;
  signal mcu_n_146 : STD_LOGIC;
  signal mcu_n_147 : STD_LOGIC;
  signal mcu_n_148 : STD_LOGIC;
  signal mcu_n_149 : STD_LOGIC;
  signal mcu_n_150 : STD_LOGIC;
  signal mcu_n_152 : STD_LOGIC;
  signal mcu_n_153 : STD_LOGIC;
  signal mcu_n_154 : STD_LOGIC;
  signal mcu_n_155 : STD_LOGIC;
  signal mcu_n_156 : STD_LOGIC;
  signal mcu_n_18 : STD_LOGIC;
  signal mcu_n_189 : STD_LOGIC;
  signal mcu_n_19 : STD_LOGIC;
  signal mcu_n_190 : STD_LOGIC;
  signal mcu_n_191 : STD_LOGIC;
  signal mcu_n_192 : STD_LOGIC;
  signal mcu_n_193 : STD_LOGIC;
  signal mcu_n_194 : STD_LOGIC;
  signal mcu_n_195 : STD_LOGIC;
  signal mcu_n_196 : STD_LOGIC;
  signal mcu_n_197 : STD_LOGIC;
  signal mcu_n_198 : STD_LOGIC;
  signal mcu_n_199 : STD_LOGIC;
  signal mcu_n_20 : STD_LOGIC;
  signal mcu_n_200 : STD_LOGIC;
  signal mcu_n_201 : STD_LOGIC;
  signal mcu_n_202 : STD_LOGIC;
  signal mcu_n_203 : STD_LOGIC;
  signal mcu_n_204 : STD_LOGIC;
  signal mcu_n_205 : STD_LOGIC;
  signal mcu_n_206 : STD_LOGIC;
  signal mcu_n_207 : STD_LOGIC;
  signal mcu_n_208 : STD_LOGIC;
  signal mcu_n_209 : STD_LOGIC;
  signal mcu_n_21 : STD_LOGIC;
  signal mcu_n_210 : STD_LOGIC;
  signal mcu_n_211 : STD_LOGIC;
  signal mcu_n_212 : STD_LOGIC;
  signal mcu_n_213 : STD_LOGIC;
  signal mcu_n_214 : STD_LOGIC;
  signal mcu_n_215 : STD_LOGIC;
  signal mcu_n_216 : STD_LOGIC;
  signal mcu_n_217 : STD_LOGIC;
  signal mcu_n_218 : STD_LOGIC;
  signal mcu_n_219 : STD_LOGIC;
  signal mcu_n_22 : STD_LOGIC;
  signal mcu_n_220 : STD_LOGIC;
  signal mcu_n_23 : STD_LOGIC;
  signal mcu_n_24 : STD_LOGIC;
  signal mcu_n_25 : STD_LOGIC;
  signal mcu_n_26 : STD_LOGIC;
  signal mcu_n_27 : STD_LOGIC;
  signal mcu_n_28 : STD_LOGIC;
  signal mcu_n_29 : STD_LOGIC;
  signal mcu_n_3 : STD_LOGIC;
  signal mcu_n_30 : STD_LOGIC;
  signal mcu_n_31 : STD_LOGIC;
  signal mcu_n_32 : STD_LOGIC;
  signal mcu_n_33 : STD_LOGIC;
  signal mcu_n_34 : STD_LOGIC;
  signal mcu_n_35 : STD_LOGIC;
  signal mcu_n_36 : STD_LOGIC;
  signal mcu_n_37 : STD_LOGIC;
  signal mcu_n_38 : STD_LOGIC;
  signal mcu_n_39 : STD_LOGIC;
  signal mcu_n_40 : STD_LOGIC;
  signal mcu_n_41 : STD_LOGIC;
  signal mcu_n_42 : STD_LOGIC;
  signal mcu_n_43 : STD_LOGIC;
  signal mcu_n_44 : STD_LOGIC;
  signal mcu_n_45 : STD_LOGIC;
  signal mcu_n_46 : STD_LOGIC;
  signal mcu_n_47 : STD_LOGIC;
  signal mcu_n_48 : STD_LOGIC;
  signal mcu_n_49 : STD_LOGIC;
  signal mcu_n_50 : STD_LOGIC;
  signal mcu_n_51 : STD_LOGIC;
  signal mcu_n_52 : STD_LOGIC;
  signal mcu_n_53 : STD_LOGIC;
  signal mcu_n_54 : STD_LOGIC;
  signal mcu_n_55 : STD_LOGIC;
  signal mcu_n_56 : STD_LOGIC;
  signal mcu_n_57 : STD_LOGIC;
  signal mcu_n_58 : STD_LOGIC;
  signal mcu_n_59 : STD_LOGIC;
  signal mcu_n_60 : STD_LOGIC;
  signal mcu_n_61 : STD_LOGIC;
  signal op2 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal opcode : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal out2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal output_rf1_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal output_rf2_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal pc : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \pc[31]_i_16_n_0\ : STD_LOGIC;
  signal \pc_\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal pcen : STD_LOGIC;
  signal ra : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rd : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rd_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rf2_n_0 : STD_LOGIC;
  signal rf2_n_1 : STD_LOGIC;
  signal rf2_n_10 : STD_LOGIC;
  signal rf2_n_11 : STD_LOGIC;
  signal rf2_n_12 : STD_LOGIC;
  signal rf2_n_13 : STD_LOGIC;
  signal rf2_n_14 : STD_LOGIC;
  signal rf2_n_15 : STD_LOGIC;
  signal rf2_n_16 : STD_LOGIC;
  signal rf2_n_17 : STD_LOGIC;
  signal rf2_n_18 : STD_LOGIC;
  signal rf2_n_19 : STD_LOGIC;
  signal rf2_n_2 : STD_LOGIC;
  signal rf2_n_20 : STD_LOGIC;
  signal rf2_n_21 : STD_LOGIC;
  signal rf2_n_22 : STD_LOGIC;
  signal rf2_n_23 : STD_LOGIC;
  signal rf2_n_24 : STD_LOGIC;
  signal rf2_n_25 : STD_LOGIC;
  signal rf2_n_26 : STD_LOGIC;
  signal rf2_n_27 : STD_LOGIC;
  signal rf2_n_28 : STD_LOGIC;
  signal rf2_n_29 : STD_LOGIC;
  signal rf2_n_3 : STD_LOGIC;
  signal rf2_n_30 : STD_LOGIC;
  signal rf2_n_31 : STD_LOGIC;
  signal rf2_n_4 : STD_LOGIC;
  signal rf2_n_5 : STD_LOGIC;
  signal rf2_n_6 : STD_LOGIC;
  signal rf2_n_7 : STD_LOGIC;
  signal rf2_n_8 : STD_LOGIC;
  signal rf2_n_9 : STD_LOGIC;
  signal sr2_adr : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal wd : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \alu_out_reg[31]_i_6\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \alu_out_reg[31]_i_7\ : label is "soft_lutpair33";
begin
a: entity work.design_1_multicycle_cpu_sim_0_0_alu
     port map (
      A(15 downto 2) => \^a\(30 downto 17),
      A(1 downto 0) => \^a\(1 downto 0),
      DI(6) => mcu_n_189,
      DI(5) => mcu_n_190,
      DI(4) => mcu_n_191,
      DI(3) => mcu_n_192,
      DI(2) => mcu_n_193,
      DI(1) => mcu_n_194,
      DI(0) => mcu_n_195,
      Q(2) => \inst_reg_reg_n_0_[2]\,
      Q(1) => \inst_reg_reg_n_0_[1]\,
      Q(0) => \inst_reg_reg_n_0_[0]\,
      S(7) => mcu_n_22,
      S(6) => mcu_n_23,
      S(5) => mcu_n_24,
      S(4) => mcu_n_25,
      S(3) => mcu_n_26,
      S(2) => mcu_n_27,
      S(1) => mcu_n_28,
      S(0) => mcu_n_29,
      \alu_out_reg_reg[15]\(7) => mcu_n_196,
      \alu_out_reg_reg[15]\(6) => mcu_n_197,
      \alu_out_reg_reg[15]\(5) => mcu_n_198,
      \alu_out_reg_reg[15]\(4) => mcu_n_199,
      \alu_out_reg_reg[15]\(3) => mcu_n_200,
      \alu_out_reg_reg[15]\(2) => mcu_n_201,
      \alu_out_reg_reg[15]\(1) => mcu_n_202,
      \alu_out_reg_reg[15]\(0) => mcu_n_203,
      \alu_out_reg_reg[15]_0\(7) => mcu_n_205,
      \alu_out_reg_reg[15]_0\(6) => mcu_n_206,
      \alu_out_reg_reg[15]_0\(5) => mcu_n_207,
      \alu_out_reg_reg[15]_0\(4) => mcu_n_208,
      \alu_out_reg_reg[15]_0\(3) => mcu_n_209,
      \alu_out_reg_reg[15]_0\(2) => mcu_n_210,
      \alu_out_reg_reg[15]_0\(1) => mcu_n_211,
      \alu_out_reg_reg[15]_0\(0) => mcu_n_212,
      \alu_out_reg_reg[23]\(0) => mcu_n_204,
      \alu_out_reg_reg[23]_0\(7) => mcu_n_213,
      \alu_out_reg_reg[23]_0\(6) => mcu_n_214,
      \alu_out_reg_reg[23]_0\(5) => mcu_n_215,
      \alu_out_reg_reg[23]_0\(4) => mcu_n_216,
      \alu_out_reg_reg[23]_0\(3) => mcu_n_217,
      \alu_out_reg_reg[23]_0\(2) => mcu_n_218,
      \alu_out_reg_reg[23]_0\(1) => mcu_n_219,
      \alu_out_reg_reg[23]_0\(0) => mcu_n_220,
      \alu_out_reg_reg[31]\(7) => mcu_n_143,
      \alu_out_reg_reg[31]\(6) => mcu_n_144,
      \alu_out_reg_reg[31]\(5) => mcu_n_145,
      \alu_out_reg_reg[31]\(4) => mcu_n_146,
      \alu_out_reg_reg[31]\(3) => mcu_n_147,
      \alu_out_reg_reg[31]\(2) => mcu_n_148,
      \alu_out_reg_reg[31]\(1) => mcu_n_149,
      \alu_out_reg_reg[31]\(0) => mcu_n_150,
      \inst_reg_reg[0]\ => a_n_32,
      out2(31 downto 0) => out2(31 downto 0),
      \pc[31]_i_12_0\ => a_n_33,
      \pc[31]_i_13_0\ => a_n_35,
      \pc[31]_i_14_0\ => a_n_34
    );
\alu_out_reg[31]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \inst_reg_reg_n_0_[2]\,
      I1 => \inst_reg_reg_n_0_[4]\,
      I2 => \inst_reg_reg_n_0_[0]\,
      O => \alu_out_reg[31]_i_6_n_0\
    );
\alu_out_reg[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \inst_reg_reg_n_0_[4]\,
      I1 => \inst_reg_reg_n_0_[5]\,
      O => \alu_out_reg[31]_i_7_n_0\
    );
\alu_out_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(0),
      Q => alu_out_reg(0),
      R => '0'
    );
\alu_out_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(10),
      Q => alu_out_reg(10),
      R => '0'
    );
\alu_out_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(11),
      Q => alu_out_reg(11),
      R => '0'
    );
\alu_out_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(12),
      Q => alu_out_reg(12),
      R => '0'
    );
\alu_out_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(13),
      Q => alu_out_reg(13),
      R => '0'
    );
\alu_out_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(14),
      Q => alu_out_reg(14),
      R => '0'
    );
\alu_out_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(15),
      Q => alu_out_reg(15),
      R => '0'
    );
\alu_out_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(16),
      Q => alu_out_reg(16),
      R => '0'
    );
\alu_out_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(17),
      Q => alu_out_reg(17),
      R => '0'
    );
\alu_out_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(18),
      Q => alu_out_reg(18),
      R => '0'
    );
\alu_out_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(19),
      Q => alu_out_reg(19),
      R => '0'
    );
\alu_out_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(1),
      Q => alu_out_reg(1),
      R => '0'
    );
\alu_out_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(20),
      Q => alu_out_reg(20),
      R => '0'
    );
\alu_out_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(21),
      Q => alu_out_reg(21),
      R => '0'
    );
\alu_out_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(22),
      Q => alu_out_reg(22),
      R => '0'
    );
\alu_out_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(23),
      Q => alu_out_reg(23),
      R => '0'
    );
\alu_out_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(24),
      Q => alu_out_reg(24),
      R => '0'
    );
\alu_out_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(25),
      Q => alu_out_reg(25),
      R => '0'
    );
\alu_out_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(26),
      Q => alu_out_reg(26),
      R => '0'
    );
\alu_out_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(27),
      Q => alu_out_reg(27),
      R => '0'
    );
\alu_out_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(28),
      Q => alu_out_reg(28),
      R => '0'
    );
\alu_out_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(29),
      Q => alu_out_reg(29),
      R => '0'
    );
\alu_out_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(2),
      Q => alu_out_reg(2),
      R => '0'
    );
\alu_out_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(30),
      Q => alu_out_reg(30),
      R => '0'
    );
\alu_out_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(31),
      Q => alu_out_reg(31),
      R => '0'
    );
\alu_out_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(3),
      Q => alu_out_reg(3),
      R => '0'
    );
\alu_out_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(4),
      Q => alu_out_reg(4),
      R => '0'
    );
\alu_out_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(5),
      Q => alu_out_reg(5),
      R => '0'
    );
\alu_out_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(6),
      Q => alu_out_reg(6),
      R => '0'
    );
\alu_out_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(7),
      Q => alu_out_reg(7),
      R => '0'
    );
\alu_out_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(8),
      Q => alu_out_reg(8),
      R => '0'
    );
\alu_out_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => alu_result(9),
      Q => alu_out_reg(9),
      R => '0'
    );
\data_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(0),
      Q => data_reg(0),
      R => '0'
    );
\data_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(10),
      Q => data_reg(10),
      R => '0'
    );
\data_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(11),
      Q => data_reg(11),
      R => '0'
    );
\data_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(12),
      Q => data_reg(12),
      R => '0'
    );
\data_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(13),
      Q => data_reg(13),
      R => '0'
    );
\data_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(14),
      Q => data_reg(14),
      R => '0'
    );
\data_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(15),
      Q => data_reg(15),
      R => '0'
    );
\data_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(16),
      Q => data_reg(16),
      R => '0'
    );
\data_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(17),
      Q => data_reg(17),
      R => '0'
    );
\data_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(18),
      Q => data_reg(18),
      R => '0'
    );
\data_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(19),
      Q => data_reg(19),
      R => '0'
    );
\data_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(1),
      Q => data_reg(1),
      R => '0'
    );
\data_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(20),
      Q => data_reg(20),
      R => '0'
    );
\data_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(21),
      Q => data_reg(21),
      R => '0'
    );
\data_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(22),
      Q => data_reg(22),
      R => '0'
    );
\data_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(23),
      Q => data_reg(23),
      R => '0'
    );
\data_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(24),
      Q => data_reg(24),
      R => '0'
    );
\data_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(25),
      Q => data_reg(25),
      R => '0'
    );
\data_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(26),
      Q => data_reg(26),
      R => '0'
    );
\data_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(27),
      Q => data_reg(27),
      R => '0'
    );
\data_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(28),
      Q => data_reg(28),
      R => '0'
    );
\data_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(29),
      Q => data_reg(29),
      R => '0'
    );
\data_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(2),
      Q => data_reg(2),
      R => '0'
    );
\data_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(30),
      Q => data_reg(30),
      R => '0'
    );
\data_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(31),
      Q => data_reg(31),
      R => '0'
    );
\data_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(3),
      Q => data_reg(3),
      R => '0'
    );
\data_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(4),
      Q => data_reg(4),
      R => '0'
    );
\data_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(5),
      Q => data_reg(5),
      R => '0'
    );
\data_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(6),
      Q => data_reg(6),
      R => '0'
    );
\data_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(7),
      Q => data_reg(7),
      R => '0'
    );
\data_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(8),
      Q => data_reg(8),
      R => '0'
    );
\data_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_0(9),
      Q => data_reg(9),
      R => '0'
    );
idmd: entity work.design_1_multicycle_cpu_sim_0_0_rams_sp_rf
     port map (
      MemWrite => MemWrite,
      RAM_reg_bram_0_0 => mcu_n_3,
      RAM_reg_bram_10_0 => mcu_n_59,
      RAM_reg_bram_10_1 => mcu_n_19,
      RAM_reg_bram_10_2(0) => mcu_n_57,
      RAM_reg_bram_11_0 => mcu_n_54,
      RAM_reg_bram_11_1 => mcu_n_55,
      RAM_reg_bram_11_2(0) => mcu_n_53,
      RAM_reg_bram_12_0(0) => mcu_n_20,
      RAM_reg_bram_13_0 => mcu_n_60,
      RAM_reg_bram_13_1(0) => mcu_n_61,
      RAM_reg_bram_1_0 => mcu_n_31,
      RAM_reg_bram_1_1 => mcu_n_32,
      RAM_reg_bram_1_2(0) => mcu_n_30,
      RAM_reg_bram_2_0 => mcu_n_34,
      RAM_reg_bram_2_1 => mcu_n_35,
      RAM_reg_bram_2_2(0) => mcu_n_33,
      RAM_reg_bram_3_0 => mcu_n_37,
      RAM_reg_bram_3_1 => mcu_n_38,
      RAM_reg_bram_3_2(0) => mcu_n_36,
      RAM_reg_bram_4_0 => mcu_n_40,
      RAM_reg_bram_4_1 => mcu_n_41,
      RAM_reg_bram_4_2(0) => mcu_n_39,
      RAM_reg_bram_5_0 => mcu_n_43,
      RAM_reg_bram_5_1 => mcu_n_44,
      RAM_reg_bram_5_2(0) => mcu_n_42,
      RAM_reg_bram_6_0 => mcu_n_50,
      RAM_reg_bram_6_1 => mcu_n_18,
      RAM_reg_bram_6_2(0) => mcu_n_49,
      RAM_reg_bram_7_0 => mcu_n_46,
      RAM_reg_bram_7_1 => mcu_n_47,
      RAM_reg_bram_7_2(0) => mcu_n_45,
      RAM_reg_bram_8_0 => mcu_n_52,
      RAM_reg_bram_8_1(0) => mcu_n_51,
      RAM_reg_bram_9_0 => mcu_n_58,
      RAM_reg_bram_9_1 => mcu_n_21,
      RAM_reg_bram_9_2(0) => mcu_n_56,
      WEA(0) => mcu_n_48,
      clk => clk,
      dout(31 downto 0) => rd_0(31 downto 0),
      output_rf2_reg(31 downto 0) => output_rf2_reg(31 downto 0),
      sr2_adr(13 downto 0) => sr2_adr(13 downto 0)
    );
\inst_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(0),
      Q => \inst_reg_reg_n_0_[0]\,
      R => '0'
    );
\inst_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(10),
      Q => \inst_reg_reg_n_0_[10]\,
      R => '0'
    );
\inst_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(11),
      Q => \inst_reg_reg_n_0_[11]\,
      R => '0'
    );
\inst_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(12),
      Q => \inst_reg_reg_n_0_[12]\,
      R => '0'
    );
\inst_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(13),
      Q => \inst_reg_reg_n_0_[13]\,
      R => '0'
    );
\inst_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(14),
      Q => \inst_reg_reg_n_0_[14]\,
      R => '0'
    );
\inst_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(15),
      Q => \inst_reg_reg_n_0_[15]\,
      R => '0'
    );
\inst_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(16),
      Q => op2(0),
      R => '0'
    );
\inst_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(17),
      Q => op2(1),
      R => '0'
    );
\inst_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(18),
      Q => op2(2),
      R => '0'
    );
\inst_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(19),
      Q => op2(3),
      R => '0'
    );
\inst_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(1),
      Q => \inst_reg_reg_n_0_[1]\,
      R => '0'
    );
\inst_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(20),
      Q => op2(4),
      R => '0'
    );
\inst_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(21),
      Q => ra(0),
      R => '0'
    );
\inst_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(22),
      Q => ra(1),
      R => '0'
    );
\inst_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(23),
      Q => ra(2),
      R => '0'
    );
\inst_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(24),
      Q => ra(3),
      R => '0'
    );
\inst_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(25),
      Q => ra(4),
      R => '0'
    );
\inst_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(26),
      Q => opcode(0),
      R => '0'
    );
\inst_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(27),
      Q => opcode(1),
      R => '0'
    );
\inst_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(28),
      Q => opcode(2),
      R => '0'
    );
\inst_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(29),
      Q => opcode(3),
      R => '0'
    );
\inst_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(2),
      Q => \inst_reg_reg_n_0_[2]\,
      R => '0'
    );
\inst_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(30),
      Q => opcode(4),
      R => '0'
    );
\inst_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(31),
      Q => opcode(5),
      R => '0'
    );
\inst_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(3),
      Q => \inst_reg_reg_n_0_[3]\,
      R => '0'
    );
\inst_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(4),
      Q => \inst_reg_reg_n_0_[4]\,
      R => '0'
    );
\inst_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(5),
      Q => \inst_reg_reg_n_0_[5]\,
      R => '0'
    );
\inst_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(6),
      Q => \inst_reg_reg_n_0_[6]\,
      R => '0'
    );
\inst_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(7),
      Q => \inst_reg_reg_n_0_[7]\,
      R => '0'
    );
\inst_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(8),
      Q => \inst_reg_reg_n_0_[8]\,
      R => '0'
    );
\inst_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => IRWrite,
      D => rd_0(9),
      Q => \inst_reg_reg_n_0_[9]\,
      R => '0'
    );
\led[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => pc(12),
      I1 => pc(27),
      I2 => pc(30),
      I3 => pc(7),
      I4 => \led[7]_i_5_n_0\,
      O => \led[7]_i_2_n_0\
    );
\led[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \led[7]_i_6_n_0\,
      I1 => pc(25),
      I2 => pc(5),
      I3 => pc(11),
      I4 => pc(6),
      I5 => \led[7]_i_7_n_0\,
      O => \led[7]_i_3_n_0\
    );
\led[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pc(9),
      I1 => pc(1),
      I2 => pc(0),
      I3 => pc(3),
      O => \led[7]_i_5_n_0\
    );
\led[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => pc(4),
      I1 => pc(22),
      I2 => pc(17),
      I3 => pc(28),
      O => \led[7]_i_6_n_0\
    );
\led[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => pc(14),
      I1 => pc(2),
      I2 => pc(18),
      I3 => pc(20),
      I4 => \led[7]_i_8_n_0\,
      O => \led[7]_i_7_n_0\
    );
\led[7]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pc(21),
      I1 => pc(31),
      I2 => pc(19),
      I3 => pc(13),
      O => \led[7]_i_8_n_0\
    );
\led_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(0),
      Q => led(0),
      R => '0'
    );
\led_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(1),
      Q => led(1),
      R => '0'
    );
\led_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(2),
      Q => led(2),
      R => '0'
    );
\led_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(3),
      Q => led(3),
      R => '0'
    );
\led_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(4),
      Q => led(4),
      R => '0'
    );
\led_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(5),
      Q => led(5),
      R => '0'
    );
\led_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(6),
      Q => led(6),
      R => '0'
    );
\led_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => led0,
      D => alu_out_reg(7),
      Q => led(7),
      R => '0'
    );
mcu: entity work.design_1_multicycle_cpu_sim_0_0_multi_control_unit
     port map (
      D(31 downto 0) => \pc_\(31 downto 0),
      DI(6) => mcu_n_189,
      DI(5) => mcu_n_190,
      DI(4) => mcu_n_191,
      DI(3) => mcu_n_192,
      DI(2) => mcu_n_193,
      DI(1) => mcu_n_194,
      DI(0) => mcu_n_195,
      E(0) => IRWrite,
      \FSM_sequential_state_reg[3]\(31 downto 26) => opcode(5 downto 0),
      \FSM_sequential_state_reg[3]\(25 downto 21) => ra(4 downto 0),
      \FSM_sequential_state_reg[3]\(20 downto 16) => op2(4 downto 0),
      \FSM_sequential_state_reg[3]\(15) => \inst_reg_reg_n_0_[15]\,
      \FSM_sequential_state_reg[3]\(14) => \inst_reg_reg_n_0_[14]\,
      \FSM_sequential_state_reg[3]\(13) => \inst_reg_reg_n_0_[13]\,
      \FSM_sequential_state_reg[3]\(12) => \inst_reg_reg_n_0_[12]\,
      \FSM_sequential_state_reg[3]\(11) => \inst_reg_reg_n_0_[11]\,
      \FSM_sequential_state_reg[3]\(10) => \inst_reg_reg_n_0_[10]\,
      \FSM_sequential_state_reg[3]\(9) => \inst_reg_reg_n_0_[9]\,
      \FSM_sequential_state_reg[3]\(8) => \inst_reg_reg_n_0_[8]\,
      \FSM_sequential_state_reg[3]\(7) => \inst_reg_reg_n_0_[7]\,
      \FSM_sequential_state_reg[3]\(6) => \inst_reg_reg_n_0_[6]\,
      \FSM_sequential_state_reg[3]\(5) => \inst_reg_reg_n_0_[5]\,
      \FSM_sequential_state_reg[3]\(4) => \inst_reg_reg_n_0_[4]\,
      \FSM_sequential_state_reg[3]\(3) => \inst_reg_reg_n_0_[3]\,
      \FSM_sequential_state_reg[3]\(2) => \inst_reg_reg_n_0_[2]\,
      \FSM_sequential_state_reg[3]\(1) => \inst_reg_reg_n_0_[1]\,
      \FSM_sequential_state_reg[3]\(0) => \inst_reg_reg_n_0_[0]\,
      MemWrite => MemWrite,
      MemWrite_reg(0) => mcu_n_20,
      MemWrite_reg_0(0) => mcu_n_30,
      MemWrite_reg_1(0) => mcu_n_33,
      MemWrite_reg_10(0) => mcu_n_57,
      MemWrite_reg_11(0) => mcu_n_61,
      MemWrite_reg_2(0) => mcu_n_36,
      MemWrite_reg_3(0) => mcu_n_39,
      MemWrite_reg_4(0) => mcu_n_42,
      MemWrite_reg_5(0) => mcu_n_45,
      MemWrite_reg_6(0) => mcu_n_49,
      MemWrite_reg_7(0) => mcu_n_51,
      MemWrite_reg_8(0) => mcu_n_53,
      MemWrite_reg_9(0) => mcu_n_56,
      Q(31 downto 0) => alu_out_reg(31 downto 0),
      RegWrite => RegWrite,
      S(7) => mcu_n_22,
      S(6) => mcu_n_23,
      S(5) => mcu_n_24,
      S(4) => mcu_n_25,
      S(3) => mcu_n_26,
      S(2) => mcu_n_27,
      S(1) => mcu_n_28,
      S(0) => mcu_n_29,
      ToggleEqual_reg(0) => pcen,
      WEA(0) => mcu_n_48,
      \alu_out_reg_reg[14]\ => mcu_n_59,
      \alu_out_reg_reg[15]\ => mcu_n_3,
      \alu_out_reg_reg[15]_0\ => mcu_n_18,
      \alu_out_reg_reg[15]_1\ => mcu_n_32,
      \alu_out_reg_reg[15]_2\ => mcu_n_47,
      \alu_out_reg_reg[15]_3\ => mcu_n_54,
      \alu_out_reg_reg[15]_4\ => mcu_n_58,
      \alu_out_reg_reg[31]\ => \alu_out_reg[31]_i_7_n_0\,
      \alu_out_reg_reg[31]_0\ => \alu_out_reg[31]_i_6_n_0\,
      clk => clk,
      \inst_reg_reg[15]\(7) => mcu_n_213,
      \inst_reg_reg[15]\(6) => mcu_n_214,
      \inst_reg_reg[15]\(5) => mcu_n_215,
      \inst_reg_reg[15]\(4) => mcu_n_216,
      \inst_reg_reg[15]\(3) => mcu_n_217,
      \inst_reg_reg[15]\(2) => mcu_n_218,
      \inst_reg_reg[15]\(1) => mcu_n_219,
      \inst_reg_reg[15]\(0) => mcu_n_220,
      \inst_reg_reg[1]\(31 downto 0) => alu_result(31 downto 0),
      \led_reg[0]\ => \led[7]_i_2_n_0\,
      \led_reg[0]_0\ => \led[7]_i_3_n_0\,
      out2(31 downto 0) => out2(31 downto 0),
      out2_carry_i_16 => a_n_32,
      output_rf1_reg(31 downto 0) => output_rf1_reg(31 downto 0),
      \output_rf1_reg_reg[15]\(7) => mcu_n_196,
      \output_rf1_reg_reg[15]\(6) => mcu_n_197,
      \output_rf1_reg_reg[15]\(5) => mcu_n_198,
      \output_rf1_reg_reg[15]\(4) => mcu_n_199,
      \output_rf1_reg_reg[15]\(3) => mcu_n_200,
      \output_rf1_reg_reg[15]\(2) => mcu_n_201,
      \output_rf1_reg_reg[15]\(1) => mcu_n_202,
      \output_rf1_reg_reg[15]\(0) => mcu_n_203,
      \output_rf1_reg_reg[16]\(0) => mcu_n_204,
      \output_rf1_reg_reg[30]\(15 downto 2) => \^a\(30 downto 17),
      \output_rf1_reg_reg[30]\(1 downto 0) => \^a\(1 downto 0),
      output_rf2_reg(31 downto 0) => output_rf2_reg(31 downto 0),
      \output_rf2_reg_reg[29]\(31 downto 0) => pc(31 downto 0),
      \output_rf2_reg_reg[29]_0\(31 downto 0) => data_reg(31 downto 0),
      p_2_out(4) => mcu_n_152,
      p_2_out(3) => mcu_n_153,
      p_2_out(2) => mcu_n_154,
      p_2_out(1) => mcu_n_155,
      p_2_out(0) => mcu_n_156,
      \pc[31]_i_7\ => \pc[31]_i_16_n_0\,
      \pc_reg[0]\ => a_n_33,
      \pc_reg[0]_0\ => a_n_35,
      \pc_reg[0]_1\ => a_n_34,
      \pc_reg[14]\ => mcu_n_21,
      \pc_reg[14]_0\ => mcu_n_31,
      \pc_reg[14]_1\ => mcu_n_35,
      \pc_reg[14]_2\ => mcu_n_37,
      \pc_reg[14]_3\ => mcu_n_40,
      \pc_reg[14]_4\ => mcu_n_44,
      \pc_reg[14]_5\ => mcu_n_46,
      \pc_reg[14]_6\ => mcu_n_50,
      \pc_reg[14]_7\ => mcu_n_52,
      \pc_reg[14]_8\ => mcu_n_55,
      \pc_reg[15]\ => mcu_n_19,
      \pc_reg[15]_0\ => mcu_n_34,
      \pc_reg[15]_1\ => mcu_n_38,
      \pc_reg[15]_2\ => mcu_n_41,
      \pc_reg[15]_3\ => mcu_n_43,
      \pc_reg[15]_4\ => mcu_n_60,
      \pc_reg[15]_5\(7) => mcu_n_205,
      \pc_reg[15]_5\(6) => mcu_n_206,
      \pc_reg[15]_5\(5) => mcu_n_207,
      \pc_reg[15]_5\(4) => mcu_n_208,
      \pc_reg[15]_5\(3) => mcu_n_209,
      \pc_reg[15]_5\(2) => mcu_n_210,
      \pc_reg[15]_5\(1) => mcu_n_211,
      \pc_reg[15]_5\(0) => mcu_n_212,
      \pc_reg[24]\(0) => led0,
      \pc_reg[31]\(7) => mcu_n_143,
      \pc_reg[31]\(6) => mcu_n_144,
      \pc_reg[31]\(5) => mcu_n_145,
      \pc_reg[31]\(4) => mcu_n_146,
      \pc_reg[31]\(3) => mcu_n_147,
      \pc_reg[31]\(2) => mcu_n_148,
      \pc_reg[31]\(1) => mcu_n_149,
      \pc_reg[31]\(0) => mcu_n_150,
      rstn => rstn,
      sr2_adr(13 downto 0) => sr2_adr(13 downto 0),
      wd(31 downto 0) => wd(31 downto 0)
    );
\output_rf1_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(0),
      Q => output_rf1_reg(0),
      R => '0'
    );
\output_rf1_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(10),
      Q => output_rf1_reg(10),
      R => '0'
    );
\output_rf1_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(11),
      Q => output_rf1_reg(11),
      R => '0'
    );
\output_rf1_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(12),
      Q => output_rf1_reg(12),
      R => '0'
    );
\output_rf1_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(13),
      Q => output_rf1_reg(13),
      R => '0'
    );
\output_rf1_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(14),
      Q => output_rf1_reg(14),
      R => '0'
    );
\output_rf1_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(15),
      Q => output_rf1_reg(15),
      R => '0'
    );
\output_rf1_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(16),
      Q => output_rf1_reg(16),
      R => '0'
    );
\output_rf1_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(17),
      Q => output_rf1_reg(17),
      R => '0'
    );
\output_rf1_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(18),
      Q => output_rf1_reg(18),
      R => '0'
    );
\output_rf1_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(19),
      Q => output_rf1_reg(19),
      R => '0'
    );
\output_rf1_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(1),
      Q => output_rf1_reg(1),
      R => '0'
    );
\output_rf1_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(20),
      Q => output_rf1_reg(20),
      R => '0'
    );
\output_rf1_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(21),
      Q => output_rf1_reg(21),
      R => '0'
    );
\output_rf1_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(22),
      Q => output_rf1_reg(22),
      R => '0'
    );
\output_rf1_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(23),
      Q => output_rf1_reg(23),
      R => '0'
    );
\output_rf1_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(24),
      Q => output_rf1_reg(24),
      R => '0'
    );
\output_rf1_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(25),
      Q => output_rf1_reg(25),
      R => '0'
    );
\output_rf1_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(26),
      Q => output_rf1_reg(26),
      R => '0'
    );
\output_rf1_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(27),
      Q => output_rf1_reg(27),
      R => '0'
    );
\output_rf1_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(28),
      Q => output_rf1_reg(28),
      R => '0'
    );
\output_rf1_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(29),
      Q => output_rf1_reg(29),
      R => '0'
    );
\output_rf1_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(2),
      Q => output_rf1_reg(2),
      R => '0'
    );
\output_rf1_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(30),
      Q => output_rf1_reg(30),
      R => '0'
    );
\output_rf1_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(31),
      Q => output_rf1_reg(31),
      R => '0'
    );
\output_rf1_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(3),
      Q => output_rf1_reg(3),
      R => '0'
    );
\output_rf1_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(4),
      Q => output_rf1_reg(4),
      R => '0'
    );
\output_rf1_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(5),
      Q => output_rf1_reg(5),
      R => '0'
    );
\output_rf1_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(6),
      Q => output_rf1_reg(6),
      R => '0'
    );
\output_rf1_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(7),
      Q => output_rf1_reg(7),
      R => '0'
    );
\output_rf1_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(8),
      Q => output_rf1_reg(8),
      R => '0'
    );
\output_rf1_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd(9),
      Q => output_rf1_reg(9),
      R => '0'
    );
\output_rf2_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_31,
      Q => output_rf2_reg(0),
      R => '0'
    );
\output_rf2_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_21,
      Q => output_rf2_reg(10),
      R => '0'
    );
\output_rf2_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_20,
      Q => output_rf2_reg(11),
      R => '0'
    );
\output_rf2_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_19,
      Q => output_rf2_reg(12),
      R => '0'
    );
\output_rf2_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_18,
      Q => output_rf2_reg(13),
      R => '0'
    );
\output_rf2_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_17,
      Q => output_rf2_reg(14),
      R => '0'
    );
\output_rf2_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_16,
      Q => output_rf2_reg(15),
      R => '0'
    );
\output_rf2_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_15,
      Q => output_rf2_reg(16),
      R => '0'
    );
\output_rf2_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_14,
      Q => output_rf2_reg(17),
      R => '0'
    );
\output_rf2_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_13,
      Q => output_rf2_reg(18),
      R => '0'
    );
\output_rf2_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_12,
      Q => output_rf2_reg(19),
      R => '0'
    );
\output_rf2_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_30,
      Q => output_rf2_reg(1),
      R => '0'
    );
\output_rf2_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_11,
      Q => output_rf2_reg(20),
      R => '0'
    );
\output_rf2_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_10,
      Q => output_rf2_reg(21),
      R => '0'
    );
\output_rf2_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_9,
      Q => output_rf2_reg(22),
      R => '0'
    );
\output_rf2_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_8,
      Q => output_rf2_reg(23),
      R => '0'
    );
\output_rf2_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_7,
      Q => output_rf2_reg(24),
      R => '0'
    );
\output_rf2_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_6,
      Q => output_rf2_reg(25),
      R => '0'
    );
\output_rf2_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_5,
      Q => output_rf2_reg(26),
      R => '0'
    );
\output_rf2_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_4,
      Q => output_rf2_reg(27),
      R => '0'
    );
\output_rf2_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_3,
      Q => output_rf2_reg(28),
      R => '0'
    );
\output_rf2_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_2,
      Q => output_rf2_reg(29),
      R => '0'
    );
\output_rf2_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_29,
      Q => output_rf2_reg(2),
      R => '0'
    );
\output_rf2_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_1,
      Q => output_rf2_reg(30),
      R => '0'
    );
\output_rf2_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_0,
      Q => output_rf2_reg(31),
      R => '0'
    );
\output_rf2_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_28,
      Q => output_rf2_reg(3),
      R => '0'
    );
\output_rf2_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_27,
      Q => output_rf2_reg(4),
      R => '0'
    );
\output_rf2_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_26,
      Q => output_rf2_reg(5),
      R => '0'
    );
\output_rf2_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_25,
      Q => output_rf2_reg(6),
      R => '0'
    );
\output_rf2_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_24,
      Q => output_rf2_reg(7),
      R => '0'
    );
\output_rf2_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_23,
      Q => output_rf2_reg(8),
      R => '0'
    );
\output_rf2_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rf2_n_22,
      Q => output_rf2_reg(9),
      R => '0'
    );
\pc[31]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \inst_reg_reg_n_0_[0]\,
      I1 => \inst_reg_reg_n_0_[4]\,
      I2 => \inst_reg_reg_n_0_[2]\,
      I3 => \inst_reg_reg_n_0_[1]\,
      I4 => \inst_reg_reg_n_0_[3]\,
      I5 => \inst_reg_reg_n_0_[5]\,
      O => \pc[31]_i_16_n_0\
    );
\pc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(0),
      Q => pc(0),
      R => '0'
    );
\pc_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(10),
      Q => pc(10),
      R => '0'
    );
\pc_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(11),
      Q => pc(11),
      R => '0'
    );
\pc_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(12),
      Q => pc(12),
      R => '0'
    );
\pc_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(13),
      Q => pc(13),
      R => '0'
    );
\pc_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(14),
      Q => pc(14),
      R => '0'
    );
\pc_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(15),
      Q => pc(15),
      R => '0'
    );
\pc_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(16),
      Q => pc(16),
      R => '0'
    );
\pc_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(17),
      Q => pc(17),
      R => '0'
    );
\pc_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(18),
      Q => pc(18),
      R => '0'
    );
\pc_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(19),
      Q => pc(19),
      R => '0'
    );
\pc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(1),
      Q => pc(1),
      R => '0'
    );
\pc_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(20),
      Q => pc(20),
      R => '0'
    );
\pc_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(21),
      Q => pc(21),
      R => '0'
    );
\pc_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(22),
      Q => pc(22),
      R => '0'
    );
\pc_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(23),
      Q => pc(23),
      R => '0'
    );
\pc_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(24),
      Q => pc(24),
      R => '0'
    );
\pc_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(25),
      Q => pc(25),
      R => '0'
    );
\pc_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(26),
      Q => pc(26),
      R => '0'
    );
\pc_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(27),
      Q => pc(27),
      R => '0'
    );
\pc_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(28),
      Q => pc(28),
      R => '0'
    );
\pc_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(29),
      Q => pc(29),
      R => '0'
    );
\pc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(2),
      Q => pc(2),
      R => '0'
    );
\pc_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(30),
      Q => pc(30),
      R => '0'
    );
\pc_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(31),
      Q => pc(31),
      R => '0'
    );
\pc_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(3),
      Q => pc(3),
      R => '0'
    );
\pc_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(4),
      Q => pc(4),
      R => '0'
    );
\pc_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(5),
      Q => pc(5),
      R => '0'
    );
\pc_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(6),
      Q => pc(6),
      R => '0'
    );
\pc_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(7),
      Q => pc(7),
      R => '0'
    );
\pc_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(8),
      Q => pc(8),
      R => '0'
    );
\pc_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pcen,
      D => \pc_\(9),
      Q => pc(9),
      R => '0'
    );
rf1: entity work.design_1_multicycle_cpu_sim_0_0_rams_dp_wf
     port map (
      Q(4 downto 0) => ra(4 downto 0),
      RegWrite => RegWrite,
      clk => clk,
      p_2_out(4) => mcu_n_152,
      p_2_out(3) => mcu_n_153,
      p_2_out(2) => mcu_n_154,
      p_2_out(1) => mcu_n_155,
      p_2_out(0) => mcu_n_156,
      rd(31 downto 0) => rd(31 downto 0),
      wd(31 downto 0) => wd(31 downto 0)
    );
rf2: entity work.design_1_multicycle_cpu_sim_0_0_rams_dp_wf_0
     port map (
      Q(4 downto 0) => op2(4 downto 0),
      RegWrite => RegWrite,
      clk => clk,
      p_2_out(4) => mcu_n_152,
      p_2_out(3) => mcu_n_153,
      p_2_out(2) => mcu_n_154,
      p_2_out(1) => mcu_n_155,
      p_2_out(0) => mcu_n_156,
      rd(31) => rf2_n_0,
      rd(30) => rf2_n_1,
      rd(29) => rf2_n_2,
      rd(28) => rf2_n_3,
      rd(27) => rf2_n_4,
      rd(26) => rf2_n_5,
      rd(25) => rf2_n_6,
      rd(24) => rf2_n_7,
      rd(23) => rf2_n_8,
      rd(22) => rf2_n_9,
      rd(21) => rf2_n_10,
      rd(20) => rf2_n_11,
      rd(19) => rf2_n_12,
      rd(18) => rf2_n_13,
      rd(17) => rf2_n_14,
      rd(16) => rf2_n_15,
      rd(15) => rf2_n_16,
      rd(14) => rf2_n_17,
      rd(13) => rf2_n_18,
      rd(12) => rf2_n_19,
      rd(11) => rf2_n_20,
      rd(10) => rf2_n_21,
      rd(9) => rf2_n_22,
      rd(8) => rf2_n_23,
      rd(7) => rf2_n_24,
      rd(6) => rf2_n_25,
      rd(5) => rf2_n_26,
      rd(4) => rf2_n_27,
      rd(3) => rf2_n_28,
      rd(2) => rf2_n_29,
      rd(1) => rf2_n_30,
      rd(0) => rf2_n_31,
      wd(31 downto 0) => wd(31 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_multicycle_cpu_sim_0_0 is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_multicycle_cpu_sim_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_multicycle_cpu_sim_0_0 : entity is "design_1_multicycle_cpu_sim_0_0,multicycle_cpu_sim,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_multicycle_cpu_sim_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_multicycle_cpu_sim_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_multicycle_cpu_sim_0_0 : entity is "multicycle_cpu_sim,Vivado 2019.2.1";
end design_1_multicycle_cpu_sim_0_0;

architecture STRUCTURE of design_1_multicycle_cpu_sim_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_multicycle_cpu_sim_0_0_multicycle_cpu_sim
     port map (
      clk => clk,
      led(7 downto 0) => led(7 downto 0),
      rstn => rstn
    );
end STRUCTURE;
