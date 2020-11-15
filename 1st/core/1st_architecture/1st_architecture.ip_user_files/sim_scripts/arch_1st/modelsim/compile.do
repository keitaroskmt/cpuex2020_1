vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/sim_clk_gen_v1_0_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib -64 -incr \
"../../../bd/arch_1st/ip/arch_1st_multicycle_cpu_0_0/sim/arch_1st_multicycle_cpu_0_0.v" \
"../../../bd/arch_1st/sim/arch_1st.v" \

vlog -work sim_clk_gen_v1_0_2 -64 -incr \
"../../../../1st_architecture.srcs/sources_1/bd/arch_1st/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/arch_1st/ip/arch_1st_sim_clk_gen_0_0/sim/arch_1st_sim_clk_gen_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

