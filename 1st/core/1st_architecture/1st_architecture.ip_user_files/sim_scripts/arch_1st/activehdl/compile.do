vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/sim_clk_gen_v1_0_2

vmap xil_defaultlib activehdl/xil_defaultlib
vmap sim_clk_gen_v1_0_2 activehdl/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/arch_1st/ip/arch_1st_multicycle_cpu_0_0/sim/arch_1st_multicycle_cpu_0_0.v" \
"../../../bd/arch_1st/sim/arch_1st.v" \

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../1st_architecture.srcs/sources_1/bd/arch_1st/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/arch_1st/ip/arch_1st_sim_clk_gen_0_0/sim/arch_1st_sim_clk_gen_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

