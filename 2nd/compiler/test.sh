#!/bin/sh
make
mv ../compiler_sim/testcase/*.s ../compiler_sim/assembly/
mv ../compiler_sim/testcase/*.mem ../compiler_sim/data/

cd ../compiler_sim
make

#./sim -n fib | head -n 1 > ./answer/fib.res
#./sim -n float_fib | tail -n 1 > ./answer/float_fib.res
#./sim -n adder | head -n 1 > ./answer/adder.res
./sim -n array_make | tail -n 1 > ./answer/array_make.res
#./sim -n array_put | tail -n 1 > ./answer/array_put.res
#./sim -n sin | tail -n 1 > ./answer/sin.res
#./sim -n cos | tail -n 1 > ./answer/cos.res

for f in ./answer/*.res
do
  diff $f ${f%.res}.ans
  if [ $? -eq 0 ]
  then
    file=${f##*/}
    printf "OK! %s\n" ${file%.res}
  else
    file=${f##*/}
    printf "NG! %s\n" ${file%.res}
  fi
done

