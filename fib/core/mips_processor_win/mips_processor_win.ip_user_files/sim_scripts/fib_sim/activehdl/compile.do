vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/sim_clk_gen_v1_0_2

vmap xil_defaultlib activehdl/xil_defaultlib
vmap sim_clk_gen_v1_0_2 activehdl/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/fib_sim/ip/fib_sim_multicycle_cpu_sim_0_0/sim/fib_sim_multicycle_cpu_sim_0_0.v" \

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../mips_processor_win.srcs/sources_1/bd/fib_sim/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/fib_sim/ip/fib_sim_sim_clk_gen_0_0/sim/fib_sim_sim_clk_gen_0_0.v" \
"../../../bd/fib_sim/sim/fib_sim.v" \

vlog -work xil_defaultlib \
"glbl.v"

