onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.arch_1st xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {arch_1st.udo}

run -all

quit -force
