# Sumii's Makefile for Min-Caml (for GNU Make)

RESULT = min-caml
NCSUFFIX = .opt
CC = gcc
CFLAGS = -g -O2 -Wall
OCAMLLDFLAGS=-warn-error -31
PACKS = extlib

default: native-code top $(RESULT) do_test
$(RESULT): debug-code top
## [??ʬ?ʽ??????Ѥ???]
## ??OCamlMakefile???Ť?GNU Make?ΥХ?(?)?Ǿ??Τ褦?????��?ɬ??(??)
## ??OCamlMakefile?Ǥ?debug-code??native-code?Τ??줾????
##   .mli???????ѥ??뤵???Ƥ??ޤ??Τǡ?ξ???Ȥ?default:?α??դ?????????
##   ??make???ˡ?.mli???ѹ??????Ƥ????Τǡ?.ml???ƥ????ѥ??뤵????
clean:: nobackup

SOURCES = float.c type.ml id.ml m.ml s.ml \
typing.mli typing.ml syntax.ml parser.mly lexer.mll kNormal.mli kNormal.ml \
alpha.mli alpha.ml beta.mli beta.ml assoc.mli assoc.ml \
cse.mli cse.ml \
inline.mli inline.ml constFold.mli constFold.ml elim.mli elim.ml \
fixAddress.mli fixAddress.ml \
closure.mli closure.ml asm.mli asm.ml virtual.mli virtual.ml \
simm.mli simm.ml regAlloc.mli regAlloc.ml \
constFoldAsm.mli constFoldAsm.ml elimAsm.mli elimAsm.ml peephole.mli peephole.ml \
constreg.mli constreg.ml calldefs.mli calldefs.ml \
block.ml toBlock.ml graph.mli graph.ml controlFlow.mli controlFlow.ml \
liveness.mli liveness.ml color.mli color.ml regAllocbyColor.mli regAllocbyColor.ml \
emit.mli emit.ml emit_for_regAllocbyColor.mli emit_for_regAllocbyColor.ml \
assem.ml toAssem.mli toAssem.ml \
elimJump.mli elimJump.ml reduceSpAdd.mli reduceSpAdd.ml emitAssem.mli emitAssem.ml \
output.ml main.mli main.ml

# ???ƥ??ȥץ���???ब?������顢?????????䤹
# TESTS = print sum-tail gcd sum fib ack even-odd \
# adder funcomp cls-rec cls-bug cls-bug2 cls-reg-bug \
# shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 \
# join-reg join-reg2 non-tail-if non-tail-if2 \
# inprod inprod-rec inprod-loop matmul matmul-flat \
# manyargs tmp

#TESTS = fib
#do_test: $(TESTS:%=mytest/%.s)
#
#.PRECIOUS: mytest/%.s
#TRASH = $(TESTS:%=mytest/%.s) $(TESTS:%=mytest/%) $(TESTS:%=mytest/%.res) $(TESTS:%=mytest/%.ans) $(TESTS:%=mytest/%.cmp) $(TESTS:%=mytest/%.iter) $(TESTS:%=mytest/%.closure) $(TESTS:%=mytest/%.cse) $(TESTS:%=test/%.alpha) $(TESTS:%=mytest/%.knormal) $(TESTS:%=mytest/%.synt) $(TESTS:%=mytest/%.data)
#
#mytest/%.s: $(RESULT) mytest/%.ml
#	./$(RESULT) mytest/$*

#TESTS = fib float_fib adder array_make array_put sin cos
TESTS = fib

do_test: $(TESTS:%=../compiler_sim/assembly/%.s)

.PRECIOUS: ../compiler_sim/assembly/%.s
TRASH = $(TESTS:%=mytest/%.s) $(TESTS:%=mytest/%) $(TESTS:%=mytest/%.res) $(TESTS:%=mytest/%.ans) $(TESTS:%=mytest/%.cmp) \
$(TESTS:%=mytest/%.iter) $(TESTS:%=mytest/%.closure) $(TESTS:%=mytest/%.cse) $(TESTS:%=test/%.alpha) \
$(TESTS:%=mytest/%.knormal) $(TESTS:%=mytest/%.synt) $(TESTS:%=mytest/%.data)

../compiler_sim/assembly/%.s: $(RESULT) ../compiler_sim/testcase/%.ml
	./$(RESULT) ../compiler_sim/testcase/$*


include OCamlMakefile
