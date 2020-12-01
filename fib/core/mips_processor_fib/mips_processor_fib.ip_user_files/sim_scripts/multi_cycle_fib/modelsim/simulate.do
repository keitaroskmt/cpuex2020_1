onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.multi_cycle_fib xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {multi_cycle_fib.udo}

run -all

quit -force
