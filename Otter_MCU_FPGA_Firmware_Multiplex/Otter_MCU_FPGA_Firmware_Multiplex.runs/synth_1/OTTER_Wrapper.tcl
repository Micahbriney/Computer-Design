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
set_param chipscope.maxJobs 3
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.cache/wt} [current_project]
set_property parent.project_path {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {{C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/new/otter_memory.mem}}
read_verilog -library xil_defaultlib -sv {
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/ALU.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/CSR_v1_01.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/CU_Decoder_full.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/CU_FSM_full.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/new/Debouncer.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/new/Mono-Stable_Multivibrator.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/otter_memory_v1_05.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/reg_file_v_1_00.sv}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/OTTER_Wrapper_v1_04.sv}
}
read_verilog -library xil_defaultlib {
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/Branch_Adder_Gen.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/Branch_Cond_Gen.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/Immed_Gen.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/Otter_MCU.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/PC.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/n-bit 2 to 1 MUX.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/n-bit 8 to 1 MUX.v}
  {C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/sources_1/imports/sources_1/imports/new/n_bit_4t1_MUX.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/constrs_1/new/cnst.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Shared With Mealy/Otter_MCU_FPGA_Firmware_Multiplex/Otter_MCU_FPGA_Firmware_Multiplex.srcs/constrs_1/new/cnst.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top OTTER_Wrapper -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef OTTER_Wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file OTTER_Wrapper_utilization_synth.rpt -pb OTTER_Wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
