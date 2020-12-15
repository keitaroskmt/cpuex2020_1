#!/bin/sh
cd raytracer
make main.ml
cd ..
./min-caml ./raytracer/main
cp ./min-caml/main.ml ./mytest
cp ./min-caml/main.s ./mytest


