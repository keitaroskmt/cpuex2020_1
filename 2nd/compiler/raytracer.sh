#!/bin/sh
make

file="main_${1}"
target="contest_${1}.ppm"
answer="answer_${1}.ppm"

./min-caml ../compiler_sim/testcase/$file
mv ../compiler_sim/testcase/*.s ../compiler_sim/assembly/
mv ../compiler_sim/testcase/*.mem ../compiler_sim/data/

cd ../compiler_sim
./sim -n $file -i sld/contest.sld -o $target

diff ./io/out/$target ./io/out/$answer
if [ $? -eq 0 ]
then
  printf "OK! size %s\n" $1
fi

# 2   ->    1955126 1.4s
# 4   ->    5012279 2.3s
# 8   ->   20061675 6.9s
# 16  ->   70726882 22.2s
# 32  ->  227669008 70.1s
# 64  ->  692674861 210.3s
# 128 -> 2124418506 648.3s

