-makelib ies_lib/xil_defaultlib \
  "../../../bd/multi_cycle_fib/ip/multi_cycle_fib_multicycle_cpu_0_0/sim/multi_cycle_fib_multicycle_cpu_0_0.v" \
-endlib
-makelib ies_lib/sim_clk_gen_v1_0_2 \
  "../../../../mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/multi_cycle_fib/ip/multi_cycle_fib_sim_clk_gen_0_0/sim/multi_cycle_fib_sim_clk_gen_0_0.v" \
  "../../../bd/multi_cycle_fib/sim/multi_cycle_fib.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

