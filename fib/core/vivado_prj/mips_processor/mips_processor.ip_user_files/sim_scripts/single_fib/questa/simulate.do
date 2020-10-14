onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib single_fib_opt

do {wave.do}

view wave
view structure
view signals

do {single_fib.udo}

run -all

quit -force
