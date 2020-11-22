onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+arch_1st -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L util_vector_logic_v2_0_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.arch_1st xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {arch_1st.udo}

run -all

endsim

quit -force
