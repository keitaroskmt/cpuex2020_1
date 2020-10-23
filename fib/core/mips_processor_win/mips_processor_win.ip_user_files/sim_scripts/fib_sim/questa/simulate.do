onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fib_sim_opt

do {wave.do}

view wave
view structure
view signals

do {fib_sim.udo}

run -all

quit -force
