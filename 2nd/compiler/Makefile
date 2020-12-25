# Sumii's Makefile for Min-Caml (for GNU Make)

RESULT = min-caml
NCSUFFIX = .opt
CC = gcc
CFLAGS = -g -O2 -Wall
OCAMLLDFLAGS=-warn-error -31

default: debug-code top $(RESULT) do_test
$(RESULT): debug-code top
## [自分（住井）用の注]
## ・OCamlMakefileや古いGNU Makeのバグ(?)で上のような定義が必要(??)
## ・OCamlMakefileではdebug-codeとnative-codeのそれぞれで
##   .mliがコンパイルされてしまうので、両方ともdefault:の右辺に入れると
##   再make時に（.mliが変更されているので）.mlも再コンパイルされる
clean:: nobackup

SOURCES = float.c type.ml id.ml m.ml s.ml \
typing.mli typing.ml syntax.ml parser.mly lexer.mll kNormal.mli kNormal.ml \
alpha.mli alpha.ml beta.mli beta.ml assoc.mli assoc.ml \
cse.mli cse.ml \
inline.mli inline.ml constFold.mli constFold.ml elim.mli elim.ml \
fixAddress.mli fixAddress.ml \
closure.mli closure.ml asm.mli asm.ml virtual.mli virtual.ml \
simm.mli simm.ml regAlloc.mli regAlloc.ml emit.mli emit.ml \
output.ml main.mli main.ml

# ↓テストプログラムが増えたら、これも増やす
# TESTS = print sum-tail gcd sum fib ack even-odd \
# adder funcomp cls-rec cls-bug cls-bug2 cls-reg-bug \
# shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 \
# join-reg join-reg2 non-tail-if non-tail-if2 \
# inprod inprod-rec inprod-loop matmul matmul-flat \
# manyargs tmp

TESTS = fib float_fib adder array_make array_put sin cos

do_test: $(TESTS:%=../compiler_sim/assembly/%.s)

.PRECIOUS: ../compiler_sim/assembly/%.s
TRASH = $(TESTS:%=mytest/%.s) $(TESTS:%=mytest/%) $(TESTS:%=mytest/%.res) $(TESTS:%=mytest/%.ans) $(TESTS:%=mytest/%.cmp) \
	$(TESTS:%=mytest/%.iter) $(TESTS:%=mytest/%.closure) $(TESTS:%=mytest/%.cse) $(TESTS:%=test/%.alpha) \
	$(TESTS:%=mytest/%.knormal) $(TESTS:%=mytest/%.synt) $(TESTS:%=mytest/%.data)

../compiler_sim/assembly/%.s: $(RESULT) ../compiler_sim/testcase/%.ml
	./$(RESULT) ../compiler_sim/testcase/$*

# do_test: $(TESTS:%=test/%.cmp)
#
# .PRECIOUS: test/%.s test/% test/%.res test/%.ans test/%.cmp
# TRASH = $(TESTS:%=test/%.s) $(TESTS:%=test/%) $(TESTS:%=test/%.res) $(TESTS:%=test/%.ans) $(TESTS:%=test/%.cmp) \
# 	$(TESTS:%=test/%.iter) $(TESTS:%=test/%.closure) $(TESTS:%=test/%.cse) $(TESTS:%=test/%.alpha) \
# 	$(TESTS:%=test/%.knormal) $(TESTS:%=test/%.synt)
#
# test/%.s: $(RESULT) test/%.ml
# 	./$(RESULT) test/$*
# test/%: test/%.s libmincaml.S stub.c
# 	$(CC) $(CFLAGS) -m32 $^ -lm -o $@
# test/%.res: test/%
# 	$< > $@
# test/%.ans: test/%.ml
# 	ocaml $< > $@
# test/%.cmp: test/%.res test/%.ans
# 	diff $^ > $@

include OCamlMakefile
