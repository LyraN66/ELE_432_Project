transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_utils_v3_0_11
vlib riviera/axi_utils_v2_0_7
vlib riviera/cic_compiler_v4_0_17
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_11 riviera/xbip_utils_v3_0_11
vmap axi_utils_v2_0_7 riviera/axi_utils_v2_0_7
vmap cic_compiler_v4_0_17 riviera/cic_compiler_v4_0_17
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_11 -93  -incr \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_7 -93  -incr \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cic_compiler_v4_0_17 -93  -incr \
"../../../ipstatic/hdl/cic_compiler_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../mic.gen/sources_1/ip/cic_compiler_0/sim/cic_compiler_0.vhd" \


