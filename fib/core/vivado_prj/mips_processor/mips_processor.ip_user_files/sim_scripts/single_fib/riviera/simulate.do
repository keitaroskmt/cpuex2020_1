onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+single_fib -L sim_clk_gen_v1_0_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.single_fib xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {single_fib.udo}

run -all

endsim

quit -force
