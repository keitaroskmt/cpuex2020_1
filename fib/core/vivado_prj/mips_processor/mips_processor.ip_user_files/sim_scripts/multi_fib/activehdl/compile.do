vlib work
vlib activehdl

vlib activehdl/sim_clk_gen_v1_0_2
vlib activehdl/xil_defaultlib

vmap sim_clk_gen_v1_0_2 activehdl/sim_clk_gen_v1_0_2
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../mips_processor.srcs/sources_1/bd/multi_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/multi_fib/ip/multi_fib_sim_clk_gen_0_0/sim/multi_fib_sim_clk_gen_0_0.v" \
"../../../bd/multi_fib/ip/multi_fib_multicycle_cpu_0_1/sim/multi_fib_multicycle_cpu_0_1.v" \
"../../../bd/multi_fib/sim/multi_fib.v" \

vlog -work xil_defaultlib \
"glbl.v"

