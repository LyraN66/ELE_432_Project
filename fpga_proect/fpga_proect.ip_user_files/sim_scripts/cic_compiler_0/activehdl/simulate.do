transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cic_compiler_0  -L xbip_utils_v3_0_11 -L axi_utils_v2_0_7 -L cic_compiler_v4_0_17 -L xil_defaultlib -L secureip -O5 xil_defaultlib.cic_compiler_0

do {cic_compiler_0.udo}

run 1000ns

endsim

quit -force
