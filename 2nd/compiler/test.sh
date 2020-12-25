#!/bin/sh
make
mv ../compiler_sim/testcase/*.s ../compiler_sim/assembly/
mv ../compiler_sim/testcase/*.mem ../compiler_sim/data/

../compiler_sim/sim -n fib

