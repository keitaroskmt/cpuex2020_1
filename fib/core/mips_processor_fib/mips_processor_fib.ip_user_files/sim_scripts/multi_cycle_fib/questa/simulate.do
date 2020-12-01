onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib multi_cycle_fib_opt

do {wave.do}

view wave
view structure
view signals

do {multi_cycle_fib.udo}

run -all

quit -force
