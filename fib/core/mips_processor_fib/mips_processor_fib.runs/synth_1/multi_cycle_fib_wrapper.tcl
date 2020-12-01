# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xcku040-ffva1156-2-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.cache/wt [current_project]
set_property parent.project_path C:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Users/nowi74/AppData/Roaming/Xilinx/Vivado/2019.2/xhub/board_store} [current_project]
set_property board_part xilinx.com:kcu105:part0:1.6 [current_project]
set_property ip_output_repo c:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  C:/Users/nowi74/cpuex2020_1/fib/core/src/initialize.mem
  C:/Users/nowi74/cpuex2020_1/fib/core/src/t_inst.mem
}
read_verilog -library xil_defaultlib C:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/hdl/multi_cycle_fib_wrapper.v
add_files C:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/multi_cycle_fib.bd
set_property used_in_implementation false [get_files -all c:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ip/multi_cycle_fib_clk_wiz_0_0/multi_cycle_fib_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ip/multi_cycle_fib_clk_wiz_0_0/multi_cycle_fib_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/ip/multi_cycle_fib_clk_wiz_0_0/multi_cycle_fib_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/nowi74/cpuex2020_1/fib/core/mips_processor_fib/mips_processor_fib.srcs/sources_1/bd/multi_cycle_fib/multi_cycle_fib_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/nowi74/Downloads/kcu105-xdc-rdf0349/KCU105_Rev1.0_02292016.xdc
set_property used_in_implementation false [get_files C:/Users/nowi74/Downloads/kcu105-xdc-rdf0349/KCU105_Rev1.0_02292016.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top multi_cycle_fib_wrapper -part xcku040-ffva1156-2-e


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef multi_cycle_fib_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file multi_cycle_fib_wrapper_utilization_synth.rpt -pb multi_cycle_fib_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
