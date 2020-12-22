vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/sim_clk_gen_v1_0_2

vmap xil_defaultlib riviera/xil_defaultlib
vmap sim_clk_gen_v1_0_2 riviera/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/multi_cycle_fib/ip/multi_cycle_fib_multicycle_cpu_0_0/sim/multi_cycle_fib_multicycle_cpu_0_0.v" \

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/multi_cycle_fib/ip/multi_cycle_fib_sim_clk_gen_0_0/sim/multi_cycle_fib_sim_clk_gen_0_0.v" \
"../../../bd/multi_cycle_fib/sim/multi_cycle_fib.v" \

vlog -work xil_defaultlib \
"glbl.v"

