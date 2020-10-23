set_property SRC_FILE_INFO {cfile:c:/mips_processor_win/mips_processor_win.srcs/sources_1/bd/multi_fib_fpga/ip/multi_fib_fpga_clk_wiz_0_1/multi_fib_fpga_clk_wiz_0_1.xdc rfile:../../../mips_processor_win.srcs/sources_1/bd/multi_fib_fpga/ip/multi_fib_fpga_clk_wiz_0_1/multi_fib_fpga_clk_wiz_0_1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.08
