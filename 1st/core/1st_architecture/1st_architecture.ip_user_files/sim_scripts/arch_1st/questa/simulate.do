onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib arch_1st_opt

do {wave.do}

view wave
view structure
view signals

do {arch_1st.udo}

run -all

quit -force
