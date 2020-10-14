vlib work
vlib riviera

vlib riviera/sim_clk_gen_v1_0_2
vlib riviera/xil_defaultlib

vmap sim_clk_gen_v1_0_2 riviera/sim_clk_gen_v1_0_2
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../mips_processor.srcs/sources_1/bd/single_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/single_fib/ip/single_fib_sim_clk_gen_0_0/sim/single_fib_sim_clk_gen_0_0.v" \
"../../../bd/single_fib/ip/single_fib_cpu_0_0/sim/single_fib_cpu_0_0.v" \
"../../../bd/single_fib/sim/single_fib.v" \

vlog -work xil_defaultlib \
"glbl.v"

