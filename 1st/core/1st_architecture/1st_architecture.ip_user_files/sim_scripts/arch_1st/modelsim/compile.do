vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/sim_clk_gen_v1_0_2
vlib modelsim_lib/msim/util_vector_logic_v2_0_1

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2
vmap util_vector_logic_v2_0_1 modelsim_lib/msim/util_vector_logic_v2_0_1

vlog -work xil_defaultlib -64 -incr \
"../../../bd/arch_1st/ip/arch_1st_multicycle_cpu_0_0/sim/arch_1st_multicycle_cpu_0_0.v" \

vlog -work sim_clk_gen_v1_0_2 -64 -incr \
"../../../../1st_architecture.srcs/sources_1/bd/arch_1st/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/arch_1st/ip/arch_1st_sim_clk_gen_0_0/sim/arch_1st_sim_clk_gen_0_0.v" \
"../../../bd/arch_1st/ip/arch_1st_sim_clk_gen_1_0/sim/arch_1st_sim_clk_gen_1_0.v" \
"../../../bd/arch_1st/ip/arch_1st_send_reset_0_0/sim/arch_1st_send_reset_0_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 -incr \
"../../../../1st_architecture.srcs/sources_1/bd/arch_1st/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/arch_1st/ip/arch_1st_util_vector_logic_0_0/sim/arch_1st_util_vector_logic_0_0.v" \
"../../../bd/arch_1st/sim/arch_1st.v" \

vlog -work xil_defaultlib \
"glbl.v"

