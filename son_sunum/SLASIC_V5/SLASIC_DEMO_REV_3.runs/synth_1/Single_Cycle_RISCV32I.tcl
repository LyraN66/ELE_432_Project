# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.runs/synth_1/Single_Cycle_RISCV32I.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

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
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param checkpoint.writeSynthRtdsInDcp 1
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/samil/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-3180-DESKTOP-N21QB96/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.cache/wt [current_project]
set_property parent.project_path C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]
set_property ip_output_repo c:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_mem {
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Weights.mem
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Bias.mem
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Neurons.mem
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/instruction_memory_file.mem
}
read_verilog -library xil_defaultlib {
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/ALU_top.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Booth_Radix2_Divider.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Booth_Radix4_Multiplier.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Comparison_Unit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Control_Unit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Data_Memory.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/Debouncer.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Decode_Stage.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/Divided_Clock.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Execute_Stage.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Extend.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Fetch_Stage.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Function_Control.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Hazard_Unit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/I2C_Slave.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/IEEE754_Multiplier.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Instruction_Decoder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Instructrion_Memory.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Logic_Unit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP_Control.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP_TOP.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Memory_Access_Stage.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Mlp_Adder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Mux_2.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Neural_Network.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/PC_Counter.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Bias.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Register_File.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Neurons.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Weights.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Ripple_Carry_Adder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/Seven_Segment_Display_Final_Manual.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Shifter_Unit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/adder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/bootloader.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/comparasor4_2.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/comparasor_64bit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/decision_making_controller.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/fulladder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/fulladder_64bit.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/i2c_driver.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/new/lcd_driver.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/multiplier.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/pc_imm_adder.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/pc_plus_4.v
  C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Single_Cycle_RISCV32I.v
}
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/constrs_1/new/PROJE.xdc
set_property used_in_implementation false [get_files C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/constrs_1/new/PROJE.xdc]

set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental C:/Users/samil/SL-ASIC-NOSE/SLASIC_V5/SLASIC_DEMO_REV_3.srcs/utils_1/imports/synth_1/Single_Cycle_RISCV32I.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top Single_Cycle_RISCV32I -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Single_Cycle_RISCV32I.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Single_Cycle_RISCV32I_utilization_synth.rpt -pb Single_Cycle_RISCV32I_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
