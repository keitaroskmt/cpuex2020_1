.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 12
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
float_of_int_sub1.236:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.955
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.956
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.957
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.958
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.959
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.960
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.961
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	blt	%v0, %a0, bgt_else.962
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.236
bgt_else.962:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.961:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.960:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.959:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.958:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.957:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.956:
	add	%v0, %zero, %v1
	jr	%ra
bgt_else.955:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.239:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.963
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.964
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.965
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.966
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.967
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.968
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.969
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.970
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.239
bgt_else.970:
	jr	%ra
bgt_else.969:
	jr	%ra
bgt_else.968:
	jr	%ra
bgt_else.967:
	jr	%ra
bgt_else.966:
	jr	%ra
bgt_else.965:
	jr	%ra
bgt_else.964:
	jr	%ra
bgt_else.963:
	jr	%ra
float_of_int_sub3.241:
	beqi	%v0, 0, bnei_else.971
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.972
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.973
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.974
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.975
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.976
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.977
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	beqi	%v0, 0, bnei_else.978
	addi	%v0, %v0, -1
	flw	%f1, 11(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.241
bnei_else.978:
	jr	%ra
bnei_else.977:
	jr	%ra
bnei_else.976:
	jr	%ra
bnei_else.975:
	jr	%ra
bnei_else.974:
	jr	%ra
bnei_else.973:
	jr	%ra
bnei_else.972:
	jr	%ra
bnei_else.971:
	jr	%ra
float_of_int.244:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.979
	addi	%v1, %zero, 0
	j	bgt_cont.980
bgt_else.979:
	addi	%v1, %zero, 1
bgt_cont.980:
	blti	%v0, 0, bgti_else.981
	j	bgti_cont.982
bgti_else.981:
	sub	%v0, %zero, %v0
bgti_cont.982:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	blt	%v0, %a0, bgt_else.983
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v0, 1(%sp)
	blt	%v0, %a0, bgt_else.985
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%a0, %v0, %a0
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.987
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.989
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.991
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.993
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.995
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	blt	%a0, %a1, bgt_else.997
	lui	%at, 128
	ori	%at, %at, 0
	add	%a1, %zero, %at
	sub	%a0, %a0, %a1
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int_sub2.239
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgt_cont.998
bgt_else.997:
	add	%v0, %zero, %a0
bgt_cont.998:
	j	bgt_cont.996
bgt_else.995:
	add	%v0, %zero, %a0
bgt_cont.996:
	j	bgt_cont.994
bgt_else.993:
	add	%v0, %zero, %a0
bgt_cont.994:
	j	bgt_cont.992
bgt_else.991:
	add	%v0, %zero, %a0
bgt_cont.992:
	j	bgt_cont.990
bgt_else.989:
	add	%v0, %zero, %a0
bgt_cont.990:
	j	bgt_cont.988
bgt_else.987:
	add	%v0, %zero, %a0
bgt_cont.988:
	j	bgt_cont.986
bgt_else.985:
bgt_cont.986:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_itof
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 11(%zero)
	fsub	%f0, %f0, %f1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v0, %zero, %at
	lw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	blt	%v1, %v0, bgt_else.999
	lui	%at, 128
	ori	%at, %at, 0
	add	%v0, %zero, %at
	sub	%v0, %v1, %v0
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1001
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1003
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1005
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1007
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1009
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	blt	%v0, %v1, bgt_else.1011
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	addi	%v1, %zero, 7
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub1.236
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgt_cont.1012
bgt_else.1011:
	addi	%v0, %zero, 6
bgt_cont.1012:
	j	bgt_cont.1010
bgt_else.1009:
	addi	%v0, %zero, 5
bgt_cont.1010:
	j	bgt_cont.1008
bgt_else.1007:
	addi	%v0, %zero, 4
bgt_cont.1008:
	j	bgt_cont.1006
bgt_else.1005:
	addi	%v0, %zero, 3
bgt_cont.1006:
	j	bgt_cont.1004
bgt_else.1003:
	addi	%v0, %zero, 2
bgt_cont.1004:
	j	bgt_cont.1002
bgt_else.1001:
	addi	%v0, %zero, 1
bgt_cont.1002:
	j	bgt_cont.1000
bgt_else.999:
	addi	%v0, %zero, 0
bgt_cont.1000:
	flw	%f0, 10(%zero)
	beqi	%v0, 0, bnei_else.1013
	addi	%v0, %v0, -1
	flw	%f0, 11(%zero)
	beqi	%v0, 0, bnei_else.1015
	addi	%v0, %v0, -1
	flw	%f0, 9(%zero)
	beqi	%v0, 0, bnei_else.1017
	addi	%v0, %v0, -1
	flw	%f0, 8(%zero)
	beqi	%v0, 0, bnei_else.1019
	addi	%v0, %v0, -1
	flw	%f0, 7(%zero)
	beqi	%v0, 0, bnei_else.1021
	addi	%v0, %v0, -1
	flw	%f0, 6(%zero)
	beqi	%v0, 0, bnei_else.1023
	addi	%v0, %v0, -1
	flw	%f0, 5(%zero)
	beqi	%v0, 0, bnei_else.1025
	addi	%v0, %v0, -1
	flw	%f0, 4(%zero)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub3.241
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.1026
bnei_else.1025:
bnei_cont.1026:
	j	bnei_cont.1024
bnei_else.1023:
bnei_cont.1024:
	j	bnei_cont.1022
bnei_else.1021:
bnei_cont.1022:
	j	bnei_cont.1020
bnei_else.1019:
bnei_cont.1020:
	j	bnei_cont.1018
bnei_else.1017:
bnei_cont.1018:
	j	bnei_cont.1016
bnei_else.1015:
bnei_cont.1016:
	j	bnei_cont.1014
bnei_else.1013:
bnei_cont.1014:
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	j	bgt_cont.984
bgt_else.983:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_itof
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 11(%zero)
	fsub	%f0, %f0, %f1
bgt_cont.984:
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.1027
	jr	%ra
bnei_else.1027:
	fneg	%f0, %f0
	jr	%ra
iloop.278:
	beqi	%v0, 0, bnei_else.1028
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	fadd	%f0, %f0, %f0
	fmul	%f0, %f0, %f1
	fadd	%f0, %f0, %f5
	fmul	%f1, %f2, %f2
	fmul	%f3, %f0, %f0
	fadd	%f6, %f1, %f3
	flw	%f7, 3(%zero)
	fblt	%f7, %f6, fbgt_else.1029
	addi	%v0, %v0, -1
	beqi	%v0, 0, bnei_else.1030
	fsub	%f1, %f1, %f3
	fadd	%f1, %f1, %f4
	fadd	%f2, %f2, %f2
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f5
	fmul	%f2, %f1, %f1
	fmul	%f3, %f0, %f0
	fadd	%f6, %f2, %f3
	flw	%f7, 3(%zero)
	fblt	%f7, %f6, fbgt_else.1031
	addi	%v0, %v0, -1
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	j	iloop.278
fbgt_else.1031:
	addi	%v0, %zero, 0
	j	min_caml_print_int
bnei_else.1030:
	addi	%v0, %zero, 1
	j	min_caml_print_int
fbgt_else.1029:
	addi	%v0, %zero, 0
	j	min_caml_print_int
bnei_else.1028:
	addi	%v0, %zero, 1
	j	min_caml_print_int
xloop.268:
	addi	%at, %zero, 400
	blt	%v0, %at, bgt_else.1032
	jr	%ra
bgt_else.1032:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int.244
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fadd	%f0, %f0, %f0
	flw	%f1, 2(%zero)
	fdiv	%f0, %f0, %f1
	flw	%f1, 1(%zero)
	fsub	%f0, %f0, %f1
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int.244
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fadd	%f0, %f0, %f0
	flw	%f1, 2(%zero)
	fdiv	%f0, %f0, %f1
	flw	%f1, 0(%zero)
	fsub	%f5, %f0, %f1
	flw	%f0, 10(%zero)
	flw	%f4, 2(%sp)
	fadd	%f0, %f0, %f4
	flw	%f1, 10(%zero)
	fadd	%f1, %f1, %f5
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f6, %f2, %f3
	flw	%f7, 3(%zero)
	fblt	%f7, %f6, fbgt_else.1034
	addi	%v0, %zero, 999
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	iloop.278
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.1035
fbgt_else.1034:
	addi	%v0, %zero, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_print_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.1035:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	xloop.268
yloop.264:
	addi	%at, %zero, 400
	blt	%v0, %at, bgt_else.1036
	jr	%ra
bgt_else.1036:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	xloop.268
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	yloop.264
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	yloop.264
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
