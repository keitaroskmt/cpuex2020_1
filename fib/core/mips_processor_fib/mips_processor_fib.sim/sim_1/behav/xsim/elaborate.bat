@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Oct 25 12:03:34 +0900 2020
REM SW Build 2729669 on Thu Dec  5 04:49:17 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto b1d205e009fb43a388ed201dc5a6eb08 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot multi_cycle_fib_wrapper_behav xil_defaultlib.multi_cycle_fib_wrapper xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto b1d205e009fb43a388ed201dc5a6eb08 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot multi_cycle_fib_wrapper_behav xil_defaultlib.multi_cycle_fib_wrapper xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0