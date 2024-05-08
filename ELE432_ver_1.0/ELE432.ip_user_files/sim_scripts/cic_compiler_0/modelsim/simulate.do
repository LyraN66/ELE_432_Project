onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xbip_utils_v3_0_11 -L axi_utils_v2_0_7 -L cic_compiler_v4_0_17 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.cic_compiler_0

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cic_compiler_0.udo}

run 1000ns

quit -force
