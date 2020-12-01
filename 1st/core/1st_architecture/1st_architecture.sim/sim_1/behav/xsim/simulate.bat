@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun Nov 22 18:49:16 +0900 2020
REM SW Build 2729669 on Thu Dec  5 04:49:17 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim arch_1st_wrapper_behav -key {Behavioral:sim_1:Functional:arch_1st_wrapper} -tclbatch arch_1st_wrapper.tcl -protoinst "protoinst_files/arch_1st.protoinst" -view C:/Users/nowi74/OneDrive/cpuexcore/1st/core/1st_architecture/arch_1st_wrapper_behav.wcfg -log simulate.log"
call xsim  arch_1st_wrapper_behav -key {Behavioral:sim_1:Functional:arch_1st_wrapper} -tclbatch arch_1st_wrapper.tcl -protoinst "protoinst_files/arch_1st.protoinst" -view C:/Users/nowi74/OneDrive/cpuexcore/1st/core/1st_architecture/arch_1st_wrapper_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0