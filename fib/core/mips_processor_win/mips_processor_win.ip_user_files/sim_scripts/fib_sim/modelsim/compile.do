vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/sim_clk_gen_v1_0_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib -64 -incr \
"../../../bd/fib_sim/ip/fib_sim_multicycle_cpu_sim_0_0/sim/fib_sim_multicycle_cpu_sim_0_0.v" \

vlog -work sim_clk_gen_v1_0_2 -64 -incr \
"../../../../mips_processor_win.srcs/sources_1/bd/fib_sim/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/fib_sim/ip/fib_sim_sim_clk_gen_0_0/sim/fib_sim_sim_clk_gen_0_0.v" \
"../../../bd/fib_sim/sim/fib_sim.v" \

vlog -work xil_defaultlib \
"glbl.v"

