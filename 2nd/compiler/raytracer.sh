#!/bin/sh
make

file="main_${1}"
target="contest_${1}.ppm"
answer="answer_${1}.ppm"

cd ./raytracer
make main.ml
sed -i -e "$(($(wc -l < main.ml)-2))s/.*/let _ = rt ${1} ${1}/g" main.ml
cd ..

cp ./raytracer/main.ml ../compiler_sim/testcase/"${file}.ml"

./min-caml ../compiler_sim/testcase/$file
mv ../compiler_sim/testcase/*.s ../compiler_sim/assembly/
mv ../compiler_sim/testcase/*.mem ../compiler_sim/data/

echo "Simulation has started!"
cd ../compiler_sim
./sim -n $file -i sld/contest.sld -o $target

diff ./io/out/$target ./io/out/$answer
if [ $? -eq 0 ]
then
  printf "OK! size %s\n" $1
fi

