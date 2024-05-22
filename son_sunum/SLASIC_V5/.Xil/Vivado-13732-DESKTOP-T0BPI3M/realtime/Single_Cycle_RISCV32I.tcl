# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/ethem/SLASIC_DEMO_REV_3/.Xil/Vivado-13732-DESKTOP-T0BPI3M/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7a100tcsg324-1
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib
    rt::set_parameter defaultVhdlWorkLib xil_defaultlib

    rt::set_parameter loadVhdl2008Libs false
    rt::set_parameter loadVhdl2019Libs false
    rt::set_parameter deferParseUntilElab true
    rt::set_parameter sortHdlCommandLine true
    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -include {
    C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new
    C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/new
  } {
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/ALU_top.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Booth_Radix2_Divider.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Booth_Radix4_Multiplier.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Comparison_Unit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Control_Unit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Data_Memory.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Decode_Stage.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/new/Divided_Clock.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Execute_Stage.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Extend.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Fetch_Stage.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Function_Control.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Hazard_Unit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/I2C_Slave.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/IEEE754_Multiplier.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Instruction_Decoder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Instructrion_Memory.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Logic_Unit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP_Control.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/MLP_TOP.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Memory_Access_Stage.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Mlp_Adder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Mux_2.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Neural_Network.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/PC_Counter.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Bias.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Register_File.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Neurons.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/Register_Weights.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Ripple_Carry_Adder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Shifter_Unit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/adder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/bootloader.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/comparasor4_2.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/comparasor_64bit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/decision_making_controller.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/fulladder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/fulladder_64bit.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/i2c_driver.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/lcd_driver.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/mlp1/new/multiplier.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/pc_imm_adder.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/pc_plus_4.v
      C:/Users/ethem/SLASIC_DEMO_REV_3/SLASIC_DEMO_REV_3.srcs/sources_1/imports/Masa�st�/SLASIC_V0/SLASIC_V0.srcs/sources_1/new/Single_Cycle_RISCV32I.v
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top Single_Cycle_RISCV32I
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter dataflowBusHighlighting false
    rt::set_parameter generateDataflowBusNetlist false
    rt::set_parameter dataFlowViewInElab false
    rt::set_parameter busViewFixBrokenConnections false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "C:/Users/ethem/SLASIC_DEMO_REV_3/.Xil/Vivado-13732-DESKTOP-T0BPI3M/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
