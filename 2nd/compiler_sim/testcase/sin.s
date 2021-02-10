.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 28
# ------------ Text Section -------------------
.section	".text"
	j	min_caml_start
# ------------ libmincaml.S -------------------
# min_caml_print_char
min_caml_print_char:
	out	%v0
	jr	%ra
# min_caml_read_int
min_caml_read_int:
	addi	%v0, %zero, 0
	in	%v0
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 8
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 16
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 24
	or	%v0, %v0, %v1
	jr	%ra
# min_caml_read_float
min_caml_read_float:
	addi	%v0, %zero, 0
	in	%v0
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 8
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 16
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 24
	or	%v0, %v0, %v1
	sw	%v0, 0(%hp)
	flw	%f0, 0(%hp)
	jr	%ra
#  min_caml_create_array
min_caml_create_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_array_loop:
	bne	%a0, %zero, create_array_cont
	jr	%ra
create_array_cont:
	sw	%v1, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 1
	j	create_array_loop
#  min_caml_create_float_array
min_caml_create_float_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	bne	%a0, %zero, create_float_array_cont
	jr	%ra
create_float_array_cont:
	fsw	%f0, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 1
	j	create_float_array_loop
#  min_caml_create_extarray
min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
create_extarray_loop:
	bne	%a1, %zero, create_extarray_cont
	jr	%ra
create_extarray_cont:
	sw	%v1, 0(%a0)
	addi	%a1, %a1, -1
	addi	%a0, %a0, 1
	j	create_extarray_loop
#  min_caml_create_float_extarray
min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
create_float_extarray_loop:
	bne	%a0, %zero, create_float_extarray_cont
	jr	%ra
create_float_extarray_cont:
	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -1
	addi	%v1, %v1, 1
	j	create_float_extarray_loop
# ------------ body ---------------------------
f.295.768:
	fblt	%f0, %f1, fbgt_else.999
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1000
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1001
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1002
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1003
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1004
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1005
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1006
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1007
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1008
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1009
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1010
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1011
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1012
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1013
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.1014
	fmul	%f1, %f2, %f1
	j	f.295.768
fbgt_else.1014:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1013:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1012:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1011:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1010:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1009:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1008:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1007:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1006:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1005:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1004:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1003:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1002:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1001:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.1000:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.999:
	fmov	%f0, %f1
	jr	%ra
g.299.772:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.1015
	fblt	%f0, %f1, fbgt_else.1016
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1017
	fblt	%f0, %f1, fbgt_else.1018
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1019
	fblt	%f0, %f1, fbgt_else.1020
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1021
	fblt	%f0, %f1, fbgt_else.1022
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1022:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1021:
	jr	%ra
fbgt_else.1020:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1023
	fblt	%f0, %f1, fbgt_else.1024
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1024:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1023:
	jr	%ra
fbgt_else.1019:
	jr	%ra
fbgt_else.1018:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1025
	fblt	%f0, %f1, fbgt_else.1026
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1027
	fblt	%f0, %f1, fbgt_else.1028
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1028:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1027:
	jr	%ra
fbgt_else.1026:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1029
	fblt	%f0, %f1, fbgt_else.1030
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1030:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1029:
	jr	%ra
fbgt_else.1025:
	jr	%ra
fbgt_else.1017:
	jr	%ra
fbgt_else.1016:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1031
	fblt	%f0, %f1, fbgt_else.1032
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1033
	fblt	%f0, %f1, fbgt_else.1034
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1035
	fblt	%f0, %f1, fbgt_else.1036
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1036:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1035:
	jr	%ra
fbgt_else.1034:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1037
	fblt	%f0, %f1, fbgt_else.1038
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1038:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1037:
	jr	%ra
fbgt_else.1033:
	jr	%ra
fbgt_else.1032:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1039
	fblt	%f0, %f1, fbgt_else.1040
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1041
	fblt	%f0, %f1, fbgt_else.1042
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1042:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1041:
	jr	%ra
fbgt_else.1040:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.1043
	fblt	%f0, %f1, fbgt_else.1044
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1044:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1043:
	jr	%ra
fbgt_else.1039:
	jr	%ra
fbgt_else.1031:
	jr	%ra
fbgt_else.1015:
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 25(%zero)
	flw	%f1, 26(%zero)
	flw	%f2, 24(%zero)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %zero, g.299.772
	sw	%v1, 0(%v0)
	fsw	%f2, 1(%v0)
	beqi	%zero, 0, bnei_else.1045
	j	bnei_cont.1046
bnei_else.1045:
bnei_cont.1046:
	fblt	%f1, %f0, fbgt_else.1047
	addi	%v0, %zero, 0
	j	fbgt_cont.1048
fbgt_else.1047:
	addi	%v0, %zero, 1
fbgt_cont.1048:
	fblt	%f1, %f0, fbgt_else.1049
	fsub	%f1, %f1, %f0
	j	fbgt_cont.1050
fbgt_else.1049:
fbgt_cont.1050:
	flw	%f2, 8(%zero)
	fblt	%f1, %f2, fbgt_else.1051
	fsub	%f0, %f0, %f1
	j	fbgt_cont.1052
fbgt_else.1051:
	fmov	%f0, %f1
fbgt_cont.1052:
	flw	%f1, 7(%zero)
	fblt	%f1, %f0, fbgt_else.1053
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 2(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 0(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.1054
fbgt_else.1053:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 6(%zero)
	flw	%f3, 5(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 4(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 3(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.1054:
	beqi	%v0, 0, bnei_else.1055
	j	bnei_cont.1056
bnei_else.1055:
	fneg	%f0, %f0
bnei_cont.1056:
	fmov	%g0, %f0
	ret
