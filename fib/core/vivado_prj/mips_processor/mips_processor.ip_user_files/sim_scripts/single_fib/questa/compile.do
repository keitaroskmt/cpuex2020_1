vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/sim_clk_gen_v1_0_2
vlib questa_lib/msim/xil_defaultlib

vmap sim_clk_gen_v1_0_2 questa_lib/msim/sim_clk_gen_v1_0_2
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work sim_clk_gen_v1_0_2 -64 \
"../../../../mips_processor.srcs/sources_1/bd/single_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/single_fib/ip/single_fib_sim_clk_gen_0_0/sim/single_fib_sim_clk_gen_0_0.v" \
"../../../bd/single_fib/ip/single_fib_cpu_0_0/sim/single_fib_cpu_0_0.v" \
"../../../bd/single_fib/sim/single_fib.v" \

vlog -work xil_defaultlib \
"glbl.v"

