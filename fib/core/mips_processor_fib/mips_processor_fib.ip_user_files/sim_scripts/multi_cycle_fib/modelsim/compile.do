vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/sim_clk_gen_v1_0_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib -64 -incr \
"../../../bd/multi_cycle_fib/ip/multi_cycle_fib_multicycle_cpu_0_0/sim/multi_cycle_fib_multicycle_cpu_0_0.v" \

vlog -work sim_clk_gen_v1_0_2 -64 -incr \
"../../../../mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/multi_cycle_fib/ip/multi_cycle_fib_sim_clk_gen_0_0/sim/multi_cycle_fib_sim_clk_gen_0_0.v" \
"../../../bd/multi_cycle_fib/sim/multi_cycle_fib.v" \

vlog -work xil_defaultlib \
"glbl.v"

