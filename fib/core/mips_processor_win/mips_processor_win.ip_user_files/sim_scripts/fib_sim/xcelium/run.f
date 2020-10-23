-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/fib_sim/ip/fib_sim_multicycle_cpu_sim_0_0/sim/fib_sim_multicycle_cpu_sim_0_0.v" \
-endlib
-makelib xcelium_lib/sim_clk_gen_v1_0_2 \
  "../../../../mips_processor_win.srcs/sources_1/bd/fib_sim/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/fib_sim/ip/fib_sim_sim_clk_gen_0_0/sim/fib_sim_sim_clk_gen_0_0.v" \
  "../../../bd/fib_sim/sim/fib_sim.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

