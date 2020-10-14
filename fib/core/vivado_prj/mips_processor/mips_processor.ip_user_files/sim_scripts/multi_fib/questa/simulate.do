onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib multi_fib_opt

do {wave.do}

view wave
view structure
view signals

do {multi_fib.udo}

run -all

quit -force
