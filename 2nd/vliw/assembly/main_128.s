.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 495
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
reduction_2pi_sub1.2614:
	fblt	%f0, %f1, fbgt_else.88978
	flw	%f2, 494(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88979
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88980
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88981
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88982
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88983
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88984
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88985
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88986
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88987
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88988
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88989
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88990
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88991
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88992
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.88993
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2614
fbgt_else.88993:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88992:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88991:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88990:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88989:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88988:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88987:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88986:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88985:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88984:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88983:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88982:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88981:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88980:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88979:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.88978:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.88994
	fblt	%f0, %f1, fbgt_else.88995
	fsub	%f0, %f0, %f1
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.88996
	fblt	%f0, %f1, fbgt_else.88997
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.88998
	fblt	%f0, %f1, fbgt_else.88999
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89000
	fblt	%f0, %f1, fbgt_else.89001
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89001:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89000:
	jr	%ra
fbgt_else.88999:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89002
	fblt	%f0, %f1, fbgt_else.89003
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89003:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89002:
	jr	%ra
fbgt_else.88998:
	jr	%ra
fbgt_else.88997:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89004
	fblt	%f0, %f1, fbgt_else.89005
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89006
	fblt	%f0, %f1, fbgt_else.89007
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89007:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89006:
	jr	%ra
fbgt_else.89005:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89008
	fblt	%f0, %f1, fbgt_else.89009
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89009:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89008:
	jr	%ra
fbgt_else.89004:
	jr	%ra
fbgt_else.88996:
	jr	%ra
fbgt_else.88995:
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89010
	fblt	%f0, %f1, fbgt_else.89011
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89012
	fblt	%f0, %f1, fbgt_else.89013
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89014
	fblt	%f0, %f1, fbgt_else.89015
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89015:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89014:
	jr	%ra
fbgt_else.89013:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89016
	fblt	%f0, %f1, fbgt_else.89017
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89017:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89016:
	jr	%ra
fbgt_else.89012:
	jr	%ra
fbgt_else.89011:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89018
	fblt	%f0, %f1, fbgt_else.89019
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89020
	fblt	%f0, %f1, fbgt_else.89021
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89021:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89020:
	jr	%ra
fbgt_else.89019:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.89022
	fblt	%f0, %f1, fbgt_else.89023
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89023:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.89022:
	jr	%ra
fbgt_else.89018:
	jr	%ra
fbgt_else.89010:
	jr	%ra
fbgt_else.88994:
	jr	%ra
print_int_sub1.2629:
	blti	%v0, 10, bgti_else.89024
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89025
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89026
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89027
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89028
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89029
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89030
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.89031
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2629
bgti_else.89031:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89030:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89029:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89028:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89027:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89026:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89025:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.89024:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.89032
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89033
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89034
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89035
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89036
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89037
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89038
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89039
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89040
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89041
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89042
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89043
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89044
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89045
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89046
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.89047
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.89047:
	jr	%ra
bgti_else.89046:
	jr	%ra
bgti_else.89045:
	jr	%ra
bgti_else.89044:
	jr	%ra
bgti_else.89043:
	jr	%ra
bgti_else.89042:
	jr	%ra
bgti_else.89041:
	jr	%ra
bgti_else.89040:
	jr	%ra
bgti_else.89039:
	jr	%ra
bgti_else.89038:
	jr	%ra
bgti_else.89037:
	jr	%ra
bgti_else.89036:
	jr	%ra
bgti_else.89035:
	jr	%ra
bgti_else.89034:
	jr	%ra
bgti_else.89033:
	jr	%ra
bgti_else.89032:
	jr	%ra
read_object.2772:
	blti	%v0, 60, bgti_else.89048
	jr	%ra
bgti_else.89048:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.89050
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 493(%zero)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_float
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_float
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 2
	sw	%v1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 2(%v0)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 5(%sp)
	fblt	%f0, %f1, fbgt_else.89052
	addi	%v0, %zero, 0
	j	fbgt_cont.89053
fbgt_else.89052:
	addi	%v0, %zero, 1
fbgt_cont.89053:
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 4(%sp)
	beqi	%v1, 0, bnei_else.89054
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 492(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 0(%v0)
	fsw	%f1, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.89055
bnei_else.89054:
bnei_cont.89055:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.89056
	lw	%a0, 10(%sp)
	j	bnei_cont.89057
bnei_else.89056:
	addi	%a0, %zero, 1
bnei_cont.89057:
	addi	%a1, %zero, 4
	flw	%f0, 5(%sp)
	sw	%a0, 15(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_float_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 12(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 11(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 15(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 9(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 7(%sp)
	sw	%a0, 4(%v1)
	lw	%a1, 4(%sp)
	sw	%a1, 3(%v1)
	lw	%a2, 3(%sp)
	sw	%a2, 2(%v1)
	lw	%a2, 2(%sp)
	sw	%a2, 1(%v1)
	lw	%a3, 1(%sp)
	sw	%a3, 0(%v1)
	lw	%a3, 0(%sp)
	sw	%v1, 12(%a3)
	beqi	%a2, 3, bnei_else.89058
	beqi	%a2, 2, bnei_else.89060
	j	bnei_cont.89059
bnei_else.89060:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.89062
	addi	%v1, %zero, 0
	j	bnei_cont.89063
bnei_else.89062:
	addi	%v1, %zero, 1
bnei_cont.89063:
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%a0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 5(%sp)
	fbne	%f1, %f4, fbeq_else.89064
	addi	%a2, %zero, 1
	j	fbeq_cont.89065
fbeq_else.89064:
	addi	%a2, %zero, 0
fbeq_cont.89065:
	beqi	%a2, 0, bnei_else.89066
	flw	%f1, 491(%zero)
	j	bnei_cont.89067
bnei_else.89066:
	beqi	%v1, 0, bnei_else.89068
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.89069
bnei_else.89068:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.89069:
bnei_cont.89067:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.89061:
	j	bnei_cont.89059
bnei_else.89058:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.89070
	addi	%v1, %zero, 1
	j	fbeq_cont.89071
fbeq_else.89070:
	addi	%v1, %zero, 0
fbeq_cont.89071:
	beqi	%v1, 0, bnei_else.89072
	fmov	%f0, %f1
	j	bnei_cont.89073
bnei_else.89072:
	fbne	%f0, %f1, fbeq_else.89074
	addi	%v1, %zero, 1
	j	fbeq_cont.89075
fbeq_else.89074:
	addi	%v1, %zero, 0
fbeq_cont.89075:
	beqi	%v1, 0, bnei_else.89076
	fmov	%f2, %f1
	j	bnei_cont.89077
bnei_else.89076:
	fblt	%f1, %f0, fbgt_else.89078
	addi	%v1, %zero, 0
	j	fbgt_cont.89079
fbgt_else.89078:
	addi	%v1, %zero, 1
fbgt_cont.89079:
	beqi	%v1, 0, bnei_else.89080
	flw	%f2, 491(%zero)
	j	bnei_cont.89081
bnei_else.89080:
	flw	%f2, 490(%zero)
bnei_cont.89081:
bnei_cont.89077:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89073:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.89082
	addi	%v1, %zero, 1
	j	fbeq_cont.89083
fbeq_else.89082:
	addi	%v1, %zero, 0
fbeq_cont.89083:
	beqi	%v1, 0, bnei_else.89084
	fmov	%f0, %f1
	j	bnei_cont.89085
bnei_else.89084:
	fbne	%f0, %f1, fbeq_else.89086
	addi	%v1, %zero, 1
	j	fbeq_cont.89087
fbeq_else.89086:
	addi	%v1, %zero, 0
fbeq_cont.89087:
	beqi	%v1, 0, bnei_else.89088
	fmov	%f2, %f1
	j	bnei_cont.89089
bnei_else.89088:
	fblt	%f1, %f0, fbgt_else.89090
	addi	%v1, %zero, 0
	j	fbgt_cont.89091
fbgt_else.89090:
	addi	%v1, %zero, 1
fbgt_cont.89091:
	beqi	%v1, 0, bnei_else.89092
	flw	%f2, 491(%zero)
	j	bnei_cont.89093
bnei_else.89092:
	flw	%f2, 490(%zero)
bnei_cont.89093:
bnei_cont.89089:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89085:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.89094
	addi	%v1, %zero, 1
	j	fbeq_cont.89095
fbeq_else.89094:
	addi	%v1, %zero, 0
fbeq_cont.89095:
	beqi	%v1, 0, bnei_else.89096
	fmov	%f0, %f1
	j	bnei_cont.89097
bnei_else.89096:
	fbne	%f0, %f1, fbeq_else.89098
	addi	%v1, %zero, 1
	j	fbeq_cont.89099
fbeq_else.89098:
	addi	%v1, %zero, 0
fbeq_cont.89099:
	beqi	%v1, 0, bnei_else.89100
	fmov	%f2, %f1
	j	bnei_cont.89101
bnei_else.89100:
	fblt	%f1, %f0, fbgt_else.89102
	addi	%v1, %zero, 0
	j	fbgt_cont.89103
fbgt_else.89102:
	addi	%v1, %zero, 1
fbgt_cont.89103:
	beqi	%v1, 0, bnei_else.89104
	flw	%f2, 491(%zero)
	j	bnei_cont.89105
bnei_else.89104:
	flw	%f2, 490(%zero)
bnei_cont.89105:
bnei_cont.89101:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89097:
	fsw	%f0, 2(%a0)
bnei_cont.89059:
	beqi	%a1, 0, bnei_else.89106
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f2, 18(%sp)
	fsw	%f3, 19(%sp)
	fblt	%f2, %f3, fbgt_else.89108
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.89110
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.89112
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.89114
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.89116
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.89118
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.89120
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.89122
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.89124
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.89126
	flw	%f4, 478(%zero)
	fblt	%f2, %f4, fbgt_else.89128
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.89109
fbgt_else.89128:
	fmov	%f0, %f4
fbgt_cont.89129:
	j	fbgt_cont.89109
fbgt_else.89126:
	fmov	%f0, %f4
fbgt_cont.89127:
	j	fbgt_cont.89109
fbgt_else.89124:
	fmov	%f0, %f4
fbgt_cont.89125:
	j	fbgt_cont.89109
fbgt_else.89122:
	fmov	%f0, %f4
fbgt_cont.89123:
	j	fbgt_cont.89109
fbgt_else.89120:
	fmov	%f0, %f4
fbgt_cont.89121:
	j	fbgt_cont.89109
fbgt_else.89118:
	fmov	%f0, %f4
fbgt_cont.89119:
	j	fbgt_cont.89109
fbgt_else.89116:
	fmov	%f0, %f4
fbgt_cont.89117:
	j	fbgt_cont.89109
fbgt_else.89114:
	fmov	%f0, %f4
fbgt_cont.89115:
	j	fbgt_cont.89109
fbgt_else.89112:
	fmov	%f0, %f4
fbgt_cont.89113:
	j	fbgt_cont.89109
fbgt_else.89110:
	fmov	%f0, %f4
fbgt_cont.89111:
	j	fbgt_cont.89109
fbgt_else.89108:
	fmov	%f0, %f3
fbgt_cont.89109:
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89130
	fblt	%f1, %f0, fbgt_else.89132
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89134
	fblt	%f1, %f0, fbgt_else.89136
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89138
	fblt	%f1, %f0, fbgt_else.89140
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.89131
fbgt_else.89140:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.89141:
	j	fbgt_cont.89131
fbgt_else.89138:
	fmov	%f0, %f1
fbgt_cont.89139:
	j	fbgt_cont.89131
fbgt_else.89136:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89142
	fblt	%f1, %f0, fbgt_else.89144
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.89143
fbgt_else.89144:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.89145:
	j	fbgt_cont.89143
fbgt_else.89142:
	fmov	%f0, %f1
fbgt_cont.89143:
fbgt_cont.89137:
	j	fbgt_cont.89131
fbgt_else.89134:
	fmov	%f0, %f1
fbgt_cont.89135:
	j	fbgt_cont.89131
fbgt_else.89132:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89146
	fblt	%f1, %f0, fbgt_else.89148
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89150
	fblt	%f1, %f0, fbgt_else.89152
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.89147
fbgt_else.89152:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.89153:
	j	fbgt_cont.89147
fbgt_else.89150:
	fmov	%f0, %f1
fbgt_cont.89151:
	j	fbgt_cont.89147
fbgt_else.89148:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89154
	fblt	%f1, %f0, fbgt_else.89156
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.89155
fbgt_else.89156:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.89157:
	j	fbgt_cont.89155
fbgt_else.89154:
	fmov	%f0, %f1
fbgt_cont.89155:
fbgt_cont.89149:
	j	fbgt_cont.89147
fbgt_else.89146:
	fmov	%f0, %f1
fbgt_cont.89147:
fbgt_cont.89133:
	j	fbgt_cont.89131
fbgt_else.89130:
	fmov	%f0, %f1
fbgt_cont.89131:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89158
	addi	%v0, %zero, 0
	j	fbgt_cont.89159
fbgt_else.89158:
	addi	%v0, %zero, 1
fbgt_cont.89159:
	fblt	%f0, %f1, fbgt_else.89160
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89161
fbgt_else.89160:
fbgt_cont.89161:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.89162
	beqi	%v0, 0, bnei_else.89164
	addi	%v0, %zero, 0
	j	fbgt_cont.89163
bnei_else.89164:
	addi	%v0, %zero, 1
bnei_cont.89165:
	j	fbgt_cont.89163
fbgt_else.89162:
fbgt_cont.89163:
	fblt	%f0, %f2, fbgt_else.89166
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89167
fbgt_else.89166:
fbgt_cont.89167:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.89168
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89169
fbgt_else.89168:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89169:
	beqi	%v0, 0, bnei_else.89170
	j	bnei_cont.89171
bnei_else.89170:
	fneg	%f0, %f0
bnei_cont.89171:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.89172
	addi	%v0, %zero, 1
	j	fbgt_cont.89173
fbgt_else.89172:
	addi	%v0, %zero, 0
fbgt_cont.89173:
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fsw	%f2, 22(%sp)
	sw	%v0, 23(%sp)
	fsw	%f4, 24(%sp)
	fblt	%f4, %f6, fbgt_else.89174
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.89176
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.89178
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.89180
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.89182
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.89184
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.89186
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.89188
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.89190
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.89192
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.89194
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.89175
fbgt_else.89194:
	fmov	%f0, %f7
fbgt_cont.89195:
	j	fbgt_cont.89175
fbgt_else.89192:
	fmov	%f0, %f7
fbgt_cont.89193:
	j	fbgt_cont.89175
fbgt_else.89190:
	fmov	%f0, %f7
fbgt_cont.89191:
	j	fbgt_cont.89175
fbgt_else.89188:
	fmov	%f0, %f7
fbgt_cont.89189:
	j	fbgt_cont.89175
fbgt_else.89186:
	fmov	%f0, %f7
fbgt_cont.89187:
	j	fbgt_cont.89175
fbgt_else.89184:
	fmov	%f0, %f7
fbgt_cont.89185:
	j	fbgt_cont.89175
fbgt_else.89182:
	fmov	%f0, %f7
fbgt_cont.89183:
	j	fbgt_cont.89175
fbgt_else.89180:
	fmov	%f0, %f7
fbgt_cont.89181:
	j	fbgt_cont.89175
fbgt_else.89178:
	fmov	%f0, %f7
fbgt_cont.89179:
	j	fbgt_cont.89175
fbgt_else.89176:
	fmov	%f0, %f7
fbgt_cont.89177:
	j	fbgt_cont.89175
fbgt_else.89174:
	fmov	%f0, %f6
fbgt_cont.89175:
	flw	%f1, 24(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89196
	fblt	%f1, %f0, fbgt_else.89198
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89200
	fblt	%f1, %f0, fbgt_else.89202
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89204
	fblt	%f1, %f0, fbgt_else.89206
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.89197
fbgt_else.89206:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.89207:
	j	fbgt_cont.89197
fbgt_else.89204:
	fmov	%f0, %f1
fbgt_cont.89205:
	j	fbgt_cont.89197
fbgt_else.89202:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89208
	fblt	%f1, %f0, fbgt_else.89210
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.89209
fbgt_else.89210:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.89211:
	j	fbgt_cont.89209
fbgt_else.89208:
	fmov	%f0, %f1
fbgt_cont.89209:
fbgt_cont.89203:
	j	fbgt_cont.89197
fbgt_else.89200:
	fmov	%f0, %f1
fbgt_cont.89201:
	j	fbgt_cont.89197
fbgt_else.89198:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89212
	fblt	%f1, %f0, fbgt_else.89214
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89216
	fblt	%f1, %f0, fbgt_else.89218
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.89213
fbgt_else.89218:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.89219:
	j	fbgt_cont.89213
fbgt_else.89216:
	fmov	%f0, %f1
fbgt_cont.89217:
	j	fbgt_cont.89213
fbgt_else.89214:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89220
	fblt	%f1, %f0, fbgt_else.89222
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.89221
fbgt_else.89222:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.89223:
	j	fbgt_cont.89221
fbgt_else.89220:
	fmov	%f0, %f1
fbgt_cont.89221:
fbgt_cont.89215:
	j	fbgt_cont.89213
fbgt_else.89212:
	fmov	%f0, %f1
fbgt_cont.89213:
fbgt_cont.89199:
	j	fbgt_cont.89197
fbgt_else.89196:
	fmov	%f0, %f1
fbgt_cont.89197:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89224
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.89226
	addi	%v0, %zero, 0
	j	fbgt_cont.89225
bnei_else.89226:
	addi	%v0, %zero, 1
bnei_cont.89227:
	j	fbgt_cont.89225
fbgt_else.89224:
	lw	%v0, 23(%sp)
fbgt_cont.89225:
	fblt	%f0, %f1, fbgt_else.89228
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89229
fbgt_else.89228:
fbgt_cont.89229:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.89230
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89231
fbgt_else.89230:
fbgt_cont.89231:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.89232
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.89233
fbgt_else.89232:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.89233:
	beqi	%v0, 0, bnei_else.89234
	j	bnei_cont.89235
bnei_else.89234:
	fneg	%f0, %f0
bnei_cont.89235:
	lw	%v0, 13(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fsw	%f5, 27(%sp)
	fblt	%f5, %f6, fbgt_else.89236
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.89238
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.89240
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.89242
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.89244
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.89246
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.89248
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.89250
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.89252
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.89254
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.89256
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.89237
fbgt_else.89256:
	fmov	%f0, %f7
fbgt_cont.89257:
	j	fbgt_cont.89237
fbgt_else.89254:
	fmov	%f0, %f7
fbgt_cont.89255:
	j	fbgt_cont.89237
fbgt_else.89252:
	fmov	%f0, %f7
fbgt_cont.89253:
	j	fbgt_cont.89237
fbgt_else.89250:
	fmov	%f0, %f7
fbgt_cont.89251:
	j	fbgt_cont.89237
fbgt_else.89248:
	fmov	%f0, %f7
fbgt_cont.89249:
	j	fbgt_cont.89237
fbgt_else.89246:
	fmov	%f0, %f7
fbgt_cont.89247:
	j	fbgt_cont.89237
fbgt_else.89244:
	fmov	%f0, %f7
fbgt_cont.89245:
	j	fbgt_cont.89237
fbgt_else.89242:
	fmov	%f0, %f7
fbgt_cont.89243:
	j	fbgt_cont.89237
fbgt_else.89240:
	fmov	%f0, %f7
fbgt_cont.89241:
	j	fbgt_cont.89237
fbgt_else.89238:
	fmov	%f0, %f7
fbgt_cont.89239:
	j	fbgt_cont.89237
fbgt_else.89236:
	fmov	%f0, %f6
fbgt_cont.89237:
	flw	%f1, 27(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89258
	fblt	%f1, %f0, fbgt_else.89260
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89262
	fblt	%f1, %f0, fbgt_else.89264
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89266
	fblt	%f1, %f0, fbgt_else.89268
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.89259
fbgt_else.89268:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.89269:
	j	fbgt_cont.89259
fbgt_else.89266:
	fmov	%f0, %f1
fbgt_cont.89267:
	j	fbgt_cont.89259
fbgt_else.89264:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89270
	fblt	%f1, %f0, fbgt_else.89272
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.89271
fbgt_else.89272:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.89273:
	j	fbgt_cont.89271
fbgt_else.89270:
	fmov	%f0, %f1
fbgt_cont.89271:
fbgt_cont.89265:
	j	fbgt_cont.89259
fbgt_else.89262:
	fmov	%f0, %f1
fbgt_cont.89263:
	j	fbgt_cont.89259
fbgt_else.89260:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89274
	fblt	%f1, %f0, fbgt_else.89276
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89278
	fblt	%f1, %f0, fbgt_else.89280
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.89275
fbgt_else.89280:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.89281:
	j	fbgt_cont.89275
fbgt_else.89278:
	fmov	%f0, %f1
fbgt_cont.89279:
	j	fbgt_cont.89275
fbgt_else.89276:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89282
	fblt	%f1, %f0, fbgt_else.89284
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.89283
fbgt_else.89284:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.89285:
	j	fbgt_cont.89283
fbgt_else.89282:
	fmov	%f0, %f1
fbgt_cont.89283:
fbgt_cont.89277:
	j	fbgt_cont.89275
fbgt_else.89274:
	fmov	%f0, %f1
fbgt_cont.89275:
fbgt_cont.89261:
	j	fbgt_cont.89259
fbgt_else.89258:
	fmov	%f0, %f1
fbgt_cont.89259:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89286
	addi	%v0, %zero, 0
	j	fbgt_cont.89287
fbgt_else.89286:
	addi	%v0, %zero, 1
fbgt_cont.89287:
	fblt	%f0, %f1, fbgt_else.89288
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89289
fbgt_else.89288:
fbgt_cont.89289:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.89290
	beqi	%v0, 0, bnei_else.89292
	addi	%v0, %zero, 0
	j	fbgt_cont.89291
bnei_else.89292:
	addi	%v0, %zero, 1
bnei_cont.89293:
	j	fbgt_cont.89291
fbgt_else.89290:
fbgt_cont.89291:
	fblt	%f0, %f2, fbgt_else.89294
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89295
fbgt_else.89294:
fbgt_cont.89295:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.89296
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89297
fbgt_else.89296:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89297:
	beqi	%v0, 0, bnei_else.89298
	j	bnei_cont.89299
bnei_else.89298:
	fneg	%f0, %f0
bnei_cont.89299:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.89300
	addi	%v0, %zero, 1
	j	fbgt_cont.89301
fbgt_else.89300:
	addi	%v0, %zero, 0
fbgt_cont.89301:
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 28(%sp)
	sw	%v0, 29(%sp)
	fsw	%f4, 30(%sp)
	fblt	%f4, %f6, fbgt_else.89302
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.89304
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.89306
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.89308
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.89310
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.89312
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.89314
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.89316
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.89318
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.89320
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.89322
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.89303
fbgt_else.89322:
	fmov	%f0, %f7
fbgt_cont.89323:
	j	fbgt_cont.89303
fbgt_else.89320:
	fmov	%f0, %f7
fbgt_cont.89321:
	j	fbgt_cont.89303
fbgt_else.89318:
	fmov	%f0, %f7
fbgt_cont.89319:
	j	fbgt_cont.89303
fbgt_else.89316:
	fmov	%f0, %f7
fbgt_cont.89317:
	j	fbgt_cont.89303
fbgt_else.89314:
	fmov	%f0, %f7
fbgt_cont.89315:
	j	fbgt_cont.89303
fbgt_else.89312:
	fmov	%f0, %f7
fbgt_cont.89313:
	j	fbgt_cont.89303
fbgt_else.89310:
	fmov	%f0, %f7
fbgt_cont.89311:
	j	fbgt_cont.89303
fbgt_else.89308:
	fmov	%f0, %f7
fbgt_cont.89309:
	j	fbgt_cont.89303
fbgt_else.89306:
	fmov	%f0, %f7
fbgt_cont.89307:
	j	fbgt_cont.89303
fbgt_else.89304:
	fmov	%f0, %f7
fbgt_cont.89305:
	j	fbgt_cont.89303
fbgt_else.89302:
	fmov	%f0, %f6
fbgt_cont.89303:
	flw	%f1, 30(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89324
	fblt	%f1, %f0, fbgt_else.89326
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89328
	fblt	%f1, %f0, fbgt_else.89330
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89332
	fblt	%f1, %f0, fbgt_else.89334
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.89325
fbgt_else.89334:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.89335:
	j	fbgt_cont.89325
fbgt_else.89332:
	fmov	%f0, %f1
fbgt_cont.89333:
	j	fbgt_cont.89325
fbgt_else.89330:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89336
	fblt	%f1, %f0, fbgt_else.89338
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.89337
fbgt_else.89338:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.89339:
	j	fbgt_cont.89337
fbgt_else.89336:
	fmov	%f0, %f1
fbgt_cont.89337:
fbgt_cont.89331:
	j	fbgt_cont.89325
fbgt_else.89328:
	fmov	%f0, %f1
fbgt_cont.89329:
	j	fbgt_cont.89325
fbgt_else.89326:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89340
	fblt	%f1, %f0, fbgt_else.89342
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89344
	fblt	%f1, %f0, fbgt_else.89346
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.89341
fbgt_else.89346:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.89347:
	j	fbgt_cont.89341
fbgt_else.89344:
	fmov	%f0, %f1
fbgt_cont.89345:
	j	fbgt_cont.89341
fbgt_else.89342:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89348
	fblt	%f1, %f0, fbgt_else.89350
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.89349
fbgt_else.89350:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.89351:
	j	fbgt_cont.89349
fbgt_else.89348:
	fmov	%f0, %f1
fbgt_cont.89349:
fbgt_cont.89343:
	j	fbgt_cont.89341
fbgt_else.89340:
	fmov	%f0, %f1
fbgt_cont.89341:
fbgt_cont.89327:
	j	fbgt_cont.89325
fbgt_else.89324:
	fmov	%f0, %f1
fbgt_cont.89325:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89352
	lw	%v0, 29(%sp)
	beqi	%v0, 0, bnei_else.89354
	addi	%v0, %zero, 0
	j	fbgt_cont.89353
bnei_else.89354:
	addi	%v0, %zero, 1
bnei_cont.89355:
	j	fbgt_cont.89353
fbgt_else.89352:
	lw	%v0, 29(%sp)
fbgt_cont.89353:
	fblt	%f0, %f1, fbgt_else.89356
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89357
fbgt_else.89356:
fbgt_cont.89357:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.89358
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89359
fbgt_else.89358:
fbgt_cont.89359:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.89360
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.89361
fbgt_else.89360:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.89361:
	beqi	%v0, 0, bnei_else.89362
	j	bnei_cont.89363
bnei_else.89362:
	fneg	%f0, %f0
bnei_cont.89363:
	lw	%v0, 13(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 31(%sp)
	fsw	%f4, 32(%sp)
	fsw	%f5, 33(%sp)
	fblt	%f5, %f6, fbgt_else.89364
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.89366
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.89368
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.89370
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.89372
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.89374
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.89376
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.89378
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.89380
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.89382
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.89384
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.89365
fbgt_else.89384:
	fmov	%f0, %f7
fbgt_cont.89385:
	j	fbgt_cont.89365
fbgt_else.89382:
	fmov	%f0, %f7
fbgt_cont.89383:
	j	fbgt_cont.89365
fbgt_else.89380:
	fmov	%f0, %f7
fbgt_cont.89381:
	j	fbgt_cont.89365
fbgt_else.89378:
	fmov	%f0, %f7
fbgt_cont.89379:
	j	fbgt_cont.89365
fbgt_else.89376:
	fmov	%f0, %f7
fbgt_cont.89377:
	j	fbgt_cont.89365
fbgt_else.89374:
	fmov	%f0, %f7
fbgt_cont.89375:
	j	fbgt_cont.89365
fbgt_else.89372:
	fmov	%f0, %f7
fbgt_cont.89373:
	j	fbgt_cont.89365
fbgt_else.89370:
	fmov	%f0, %f7
fbgt_cont.89371:
	j	fbgt_cont.89365
fbgt_else.89368:
	fmov	%f0, %f7
fbgt_cont.89369:
	j	fbgt_cont.89365
fbgt_else.89366:
	fmov	%f0, %f7
fbgt_cont.89367:
	j	fbgt_cont.89365
fbgt_else.89364:
	fmov	%f0, %f6
fbgt_cont.89365:
	flw	%f1, 33(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89386
	fblt	%f1, %f0, fbgt_else.89388
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89390
	fblt	%f1, %f0, fbgt_else.89392
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89394
	fblt	%f1, %f0, fbgt_else.89396
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.89387
fbgt_else.89396:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.89397:
	j	fbgt_cont.89387
fbgt_else.89394:
	fmov	%f0, %f1
fbgt_cont.89395:
	j	fbgt_cont.89387
fbgt_else.89392:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89398
	fblt	%f1, %f0, fbgt_else.89400
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.89399
fbgt_else.89400:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.89401:
	j	fbgt_cont.89399
fbgt_else.89398:
	fmov	%f0, %f1
fbgt_cont.89399:
fbgt_cont.89393:
	j	fbgt_cont.89387
fbgt_else.89390:
	fmov	%f0, %f1
fbgt_cont.89391:
	j	fbgt_cont.89387
fbgt_else.89388:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89402
	fblt	%f1, %f0, fbgt_else.89404
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89406
	fblt	%f1, %f0, fbgt_else.89408
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.89403
fbgt_else.89408:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.89409:
	j	fbgt_cont.89403
fbgt_else.89406:
	fmov	%f0, %f1
fbgt_cont.89407:
	j	fbgt_cont.89403
fbgt_else.89404:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89410
	fblt	%f1, %f0, fbgt_else.89412
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.89411
fbgt_else.89412:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.89413:
	j	fbgt_cont.89411
fbgt_else.89410:
	fmov	%f0, %f1
fbgt_cont.89411:
fbgt_cont.89405:
	j	fbgt_cont.89403
fbgt_else.89402:
	fmov	%f0, %f1
fbgt_cont.89403:
fbgt_cont.89389:
	j	fbgt_cont.89387
fbgt_else.89386:
	fmov	%f0, %f1
fbgt_cont.89387:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89414
	addi	%v0, %zero, 0
	j	fbgt_cont.89415
fbgt_else.89414:
	addi	%v0, %zero, 1
fbgt_cont.89415:
	fblt	%f0, %f1, fbgt_else.89416
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89417
fbgt_else.89416:
fbgt_cont.89417:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.89418
	beqi	%v0, 0, bnei_else.89420
	addi	%v0, %zero, 0
	j	fbgt_cont.89419
bnei_else.89420:
	addi	%v0, %zero, 1
bnei_cont.89421:
	j	fbgt_cont.89419
fbgt_else.89418:
fbgt_cont.89419:
	fblt	%f0, %f2, fbgt_else.89422
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89423
fbgt_else.89422:
fbgt_cont.89423:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.89424
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89425
fbgt_else.89424:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89425:
	beqi	%v0, 0, bnei_else.89426
	j	bnei_cont.89427
bnei_else.89426:
	fneg	%f0, %f0
bnei_cont.89427:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.89428
	addi	%v0, %zero, 1
	j	fbgt_cont.89429
fbgt_else.89428:
	addi	%v0, %zero, 0
fbgt_cont.89429:
	fabs	%f4, %f4
	flw	%f5, 19(%sp)
	fsw	%f0, 34(%sp)
	sw	%v0, 35(%sp)
	fsw	%f4, 36(%sp)
	fblt	%f4, %f5, fbgt_else.89430
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.89432
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.89434
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.89436
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.89438
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.89440
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.89442
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.89444
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.89446
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.89448
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.89450
	flw	%f6, 477(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.89431
fbgt_else.89450:
	fmov	%f0, %f6
fbgt_cont.89451:
	j	fbgt_cont.89431
fbgt_else.89448:
	fmov	%f0, %f6
fbgt_cont.89449:
	j	fbgt_cont.89431
fbgt_else.89446:
	fmov	%f0, %f6
fbgt_cont.89447:
	j	fbgt_cont.89431
fbgt_else.89444:
	fmov	%f0, %f6
fbgt_cont.89445:
	j	fbgt_cont.89431
fbgt_else.89442:
	fmov	%f0, %f6
fbgt_cont.89443:
	j	fbgt_cont.89431
fbgt_else.89440:
	fmov	%f0, %f6
fbgt_cont.89441:
	j	fbgt_cont.89431
fbgt_else.89438:
	fmov	%f0, %f6
fbgt_cont.89439:
	j	fbgt_cont.89431
fbgt_else.89436:
	fmov	%f0, %f6
fbgt_cont.89437:
	j	fbgt_cont.89431
fbgt_else.89434:
	fmov	%f0, %f6
fbgt_cont.89435:
	j	fbgt_cont.89431
fbgt_else.89432:
	fmov	%f0, %f6
fbgt_cont.89433:
	j	fbgt_cont.89431
fbgt_else.89430:
	fmov	%f0, %f5
fbgt_cont.89431:
	flw	%f1, 36(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.89452
	fblt	%f1, %f0, fbgt_else.89454
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89456
	fblt	%f1, %f0, fbgt_else.89458
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89460
	fblt	%f1, %f0, fbgt_else.89462
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.89453
fbgt_else.89462:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.89463:
	j	fbgt_cont.89453
fbgt_else.89460:
	fmov	%f0, %f1
fbgt_cont.89461:
	j	fbgt_cont.89453
fbgt_else.89458:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89464
	fblt	%f1, %f0, fbgt_else.89466
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.89465
fbgt_else.89466:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.89467:
	j	fbgt_cont.89465
fbgt_else.89464:
	fmov	%f0, %f1
fbgt_cont.89465:
fbgt_cont.89459:
	j	fbgt_cont.89453
fbgt_else.89456:
	fmov	%f0, %f1
fbgt_cont.89457:
	j	fbgt_cont.89453
fbgt_else.89454:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89468
	fblt	%f1, %f0, fbgt_else.89470
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89472
	fblt	%f1, %f0, fbgt_else.89474
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.89469
fbgt_else.89474:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.89475:
	j	fbgt_cont.89469
fbgt_else.89472:
	fmov	%f0, %f1
fbgt_cont.89473:
	j	fbgt_cont.89469
fbgt_else.89470:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89476
	fblt	%f1, %f0, fbgt_else.89478
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.89477
fbgt_else.89478:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.89479:
	j	fbgt_cont.89477
fbgt_else.89476:
	fmov	%f0, %f1
fbgt_cont.89477:
fbgt_cont.89471:
	j	fbgt_cont.89469
fbgt_else.89468:
	fmov	%f0, %f1
fbgt_cont.89469:
fbgt_cont.89455:
	j	fbgt_cont.89453
fbgt_else.89452:
	fmov	%f0, %f1
fbgt_cont.89453:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.89480
	lw	%v0, 35(%sp)
	beqi	%v0, 0, bnei_else.89482
	addi	%v0, %zero, 0
	j	fbgt_cont.89481
bnei_else.89482:
	addi	%v0, %zero, 1
bnei_cont.89483:
	j	fbgt_cont.89481
fbgt_else.89480:
	lw	%v0, 35(%sp)
fbgt_cont.89481:
	fblt	%f0, %f1, fbgt_else.89484
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89485
fbgt_else.89484:
fbgt_cont.89485:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.89486
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89487
fbgt_else.89486:
fbgt_cont.89487:
	flw	%f1, 21(%sp)
	fblt	%f1, %f0, fbgt_else.89488
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.89489
fbgt_else.89488:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.89489:
	beqi	%v0, 0, bnei_else.89490
	j	bnei_cont.89491
bnei_else.89490:
	fneg	%f0, %f0
bnei_cont.89491:
	flw	%f1, 34(%sp)
	flw	%f2, 28(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 31(%sp)
	flw	%f5, 25(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 20(%sp)
	fmul	%f9, %f8, %f0
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4
	fmul	%f10, %f9, %f1
	fmul	%f11, %f5, %f0
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0
	fmul	%f6, %f6, %f0
	fmul	%f12, %f8, %f1
	fadd	%f6, %f6, %f12
	fmul	%f0, %f9, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	lw	%v0, 7(%sp)
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)
	flw	%f9, 2(%v0)
	fmul	%f12, %f3, %f3
	fmul	%f12, %f5, %f12
	fmul	%f13, %f11, %f11
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f12, %f5, %f12
	fmul	%f13, %f6, %f6
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f12, %f5, %f12
	fmul	%f13, %f0, %f0
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 2(%v0)
	flw	%f12, 494(%zero)
	fmul	%f13, %f5, %f7
	fmul	%f13, %f13, %f10
	fmul	%f14, %f8, %f6
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f13, %f12, %f13
	lw	%v0, 13(%sp)
	fsw	%f13, 0(%v0)
	fmul	%f3, %f5, %f3
	fmul	%f5, %f3, %f10
	fmul	%f8, %f8, %f11
	fmul	%f0, %f8, %f0
	fadd	%f0, %f5, %f0
	fmul	%f1, %f9, %f1
	fmul	%f2, %f1, %f2
	fadd	%f0, %f0, %f2
	fmul	%f0, %f12, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7
	fmul	%f2, %f8, %f6
	fadd	%f0, %f0, %f2
	fmul	%f1, %f1, %f4
	fadd	%f0, %f0, %f1
	fmul	%f0, %f12, %f0
	fsw	%f0, 2(%v0)
	j	bnei_cont.89107
bnei_else.89106:
bnei_cont.89107:
	addi	%v0, %zero, 1
	j	bnei_cont.89051
bnei_else.89050:
	addi	%v0, %zero, 0
bnei_cont.89051:
	beqi	%v0, 0, bnei_else.89492
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.89493
	jr	%ra
bgti_else.89493:
	sw	%v0, 37(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_read_int
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	beqi	%v0, -1, bnei_else.89495
	sw	%v0, 38(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_int
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	sw	%v0, 39(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_read_int
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	sw	%v0, 40(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_read_int
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 493(%zero)
	sw	%v0, 41(%sp)
	fsw	%f0, 42(%sp)
	sw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_create_float_array
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	sw	%v0, 44(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_read_float
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_read_float
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 2
	sw	%v1, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_read_float
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	sw	%v0, 46(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 2(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.89497
	addi	%v0, %zero, 0
	j	fbgt_cont.89498
fbgt_else.89497:
	addi	%v0, %zero, 1
fbgt_cont.89498:
	lw	%v1, 45(%sp)
	sw	%v0, 47(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f1
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_create_float_array
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	sw	%v0, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_read_float
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_read_float
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	sw	%v0, 49(%sp)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_create_float_array
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v1, 41(%sp)
	beqi	%v1, 0, bnei_else.89499
	sw	%v0, 50(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_read_float
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 492(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 0(%v0)
	fsw	%f1, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_read_float
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_read_float
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.89500
bnei_else.89499:
bnei_cont.89500:
	lw	%v1, 39(%sp)
	beqi	%v1, 2, bnei_else.89501
	lw	%a0, 47(%sp)
	j	bnei_cont.89502
bnei_else.89501:
	addi	%a0, %zero, 1
bnei_cont.89502:
	addi	%a1, %zero, 4
	flw	%f0, 42(%sp)
	sw	%a0, 52(%sp)
	sw	%v0, 50(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_create_float_array
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 50(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 49(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 48(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 52(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 46(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 44(%sp)
	sw	%a0, 4(%v1)
	lw	%a1, 41(%sp)
	sw	%a1, 3(%v1)
	lw	%a2, 40(%sp)
	sw	%a2, 2(%v1)
	lw	%a2, 39(%sp)
	sw	%a2, 1(%v1)
	lw	%a3, 38(%sp)
	sw	%a3, 0(%v1)
	lw	%a3, 37(%sp)
	sw	%v1, 12(%a3)
	beqi	%a2, 3, bnei_else.89503
	beqi	%a2, 2, bnei_else.89505
	j	bnei_cont.89504
bnei_else.89505:
	lw	%v1, 47(%sp)
	beqi	%v1, 0, bnei_else.89507
	addi	%v1, %zero, 0
	j	bnei_cont.89508
bnei_else.89507:
	addi	%v1, %zero, 1
bnei_cont.89508:
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%a0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 42(%sp)
	fbne	%f1, %f4, fbeq_else.89509
	addi	%a2, %zero, 1
	j	fbeq_cont.89510
fbeq_else.89509:
	addi	%a2, %zero, 0
fbeq_cont.89510:
	beqi	%a2, 0, bnei_else.89511
	flw	%f1, 491(%zero)
	j	bnei_cont.89512
bnei_else.89511:
	beqi	%v1, 0, bnei_else.89513
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.89514
bnei_else.89513:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.89514:
bnei_cont.89512:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.89506:
	j	bnei_cont.89504
bnei_else.89503:
	flw	%f0, 0(%a0)
	flw	%f1, 42(%sp)
	fbne	%f0, %f1, fbeq_else.89515
	addi	%v1, %zero, 1
	j	fbeq_cont.89516
fbeq_else.89515:
	addi	%v1, %zero, 0
fbeq_cont.89516:
	beqi	%v1, 0, bnei_else.89517
	fmov	%f0, %f1
	j	bnei_cont.89518
bnei_else.89517:
	fbne	%f0, %f1, fbeq_else.89519
	addi	%v1, %zero, 1
	j	fbeq_cont.89520
fbeq_else.89519:
	addi	%v1, %zero, 0
fbeq_cont.89520:
	beqi	%v1, 0, bnei_else.89521
	fmov	%f2, %f1
	j	bnei_cont.89522
bnei_else.89521:
	fblt	%f1, %f0, fbgt_else.89523
	addi	%v1, %zero, 0
	j	fbgt_cont.89524
fbgt_else.89523:
	addi	%v1, %zero, 1
fbgt_cont.89524:
	beqi	%v1, 0, bnei_else.89525
	flw	%f2, 491(%zero)
	j	bnei_cont.89526
bnei_else.89525:
	flw	%f2, 490(%zero)
bnei_cont.89526:
bnei_cont.89522:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89518:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.89527
	addi	%v1, %zero, 1
	j	fbeq_cont.89528
fbeq_else.89527:
	addi	%v1, %zero, 0
fbeq_cont.89528:
	beqi	%v1, 0, bnei_else.89529
	fmov	%f0, %f1
	j	bnei_cont.89530
bnei_else.89529:
	fbne	%f0, %f1, fbeq_else.89531
	addi	%v1, %zero, 1
	j	fbeq_cont.89532
fbeq_else.89531:
	addi	%v1, %zero, 0
fbeq_cont.89532:
	beqi	%v1, 0, bnei_else.89533
	fmov	%f2, %f1
	j	bnei_cont.89534
bnei_else.89533:
	fblt	%f1, %f0, fbgt_else.89535
	addi	%v1, %zero, 0
	j	fbgt_cont.89536
fbgt_else.89535:
	addi	%v1, %zero, 1
fbgt_cont.89536:
	beqi	%v1, 0, bnei_else.89537
	flw	%f2, 491(%zero)
	j	bnei_cont.89538
bnei_else.89537:
	flw	%f2, 490(%zero)
bnei_cont.89538:
bnei_cont.89534:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89530:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.89539
	addi	%v1, %zero, 1
	j	fbeq_cont.89540
fbeq_else.89539:
	addi	%v1, %zero, 0
fbeq_cont.89540:
	beqi	%v1, 0, bnei_else.89541
	fmov	%f0, %f1
	j	bnei_cont.89542
bnei_else.89541:
	fbne	%f0, %f1, fbeq_else.89543
	addi	%v1, %zero, 1
	j	fbeq_cont.89544
fbeq_else.89543:
	addi	%v1, %zero, 0
fbeq_cont.89544:
	beqi	%v1, 0, bnei_else.89545
	fmov	%f2, %f1
	j	bnei_cont.89546
bnei_else.89545:
	fblt	%f1, %f0, fbgt_else.89547
	addi	%v1, %zero, 0
	j	fbgt_cont.89548
fbgt_else.89547:
	addi	%v1, %zero, 1
fbgt_cont.89548:
	beqi	%v1, 0, bnei_else.89549
	flw	%f2, 491(%zero)
	j	bnei_cont.89550
bnei_else.89549:
	flw	%f2, 490(%zero)
bnei_cont.89550:
bnei_cont.89546:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.89542:
	fsw	%f0, 2(%a0)
bnei_cont.89504:
	beqi	%a1, 0, bnei_else.89551
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 53(%sp)
	fsw	%f1, 54(%sp)
	fsw	%f2, 55(%sp)
	fsw	%f3, 56(%sp)
	fblt	%f2, %f3, fbgt_else.89553
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.89555
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.89557
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.89559
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.89561
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.89563
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.89565
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.89567
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.89569
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.89571
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.89554
fbgt_else.89571:
	fmov	%f0, %f4
fbgt_cont.89572:
	j	fbgt_cont.89554
fbgt_else.89569:
	fmov	%f0, %f4
fbgt_cont.89570:
	j	fbgt_cont.89554
fbgt_else.89567:
	fmov	%f0, %f4
fbgt_cont.89568:
	j	fbgt_cont.89554
fbgt_else.89565:
	fmov	%f0, %f4
fbgt_cont.89566:
	j	fbgt_cont.89554
fbgt_else.89563:
	fmov	%f0, %f4
fbgt_cont.89564:
	j	fbgt_cont.89554
fbgt_else.89561:
	fmov	%f0, %f4
fbgt_cont.89562:
	j	fbgt_cont.89554
fbgt_else.89559:
	fmov	%f0, %f4
fbgt_cont.89560:
	j	fbgt_cont.89554
fbgt_else.89557:
	fmov	%f0, %f4
fbgt_cont.89558:
	j	fbgt_cont.89554
fbgt_else.89555:
	fmov	%f0, %f4
fbgt_cont.89556:
	j	fbgt_cont.89554
fbgt_else.89553:
	fmov	%f0, %f3
fbgt_cont.89554:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89573
	fblt	%f1, %f0, fbgt_else.89575
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89577
	fblt	%f1, %f0, fbgt_else.89579
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.89574
fbgt_else.89579:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.89580:
	j	fbgt_cont.89574
fbgt_else.89577:
	fmov	%f0, %f1
fbgt_cont.89578:
	j	fbgt_cont.89574
fbgt_else.89575:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89581
	fblt	%f1, %f0, fbgt_else.89583
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.89582
fbgt_else.89583:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.89584:
	j	fbgt_cont.89582
fbgt_else.89581:
	fmov	%f0, %f1
fbgt_cont.89582:
fbgt_cont.89576:
	j	fbgt_cont.89574
fbgt_else.89573:
	fmov	%f0, %f1
fbgt_cont.89574:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89585
	addi	%v0, %zero, 0
	j	fbgt_cont.89586
fbgt_else.89585:
	addi	%v0, %zero, 1
fbgt_cont.89586:
	fblt	%f0, %f1, fbgt_else.89587
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89588
fbgt_else.89587:
fbgt_cont.89588:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.89589
	beqi	%v0, 0, bnei_else.89591
	addi	%v0, %zero, 0
	j	fbgt_cont.89590
bnei_else.89591:
	addi	%v0, %zero, 1
bnei_cont.89592:
	j	fbgt_cont.89590
fbgt_else.89589:
fbgt_cont.89590:
	fblt	%f0, %f2, fbgt_else.89593
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89594
fbgt_else.89593:
fbgt_cont.89594:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.89595
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89596
fbgt_else.89595:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89596:
	beqi	%v0, 0, bnei_else.89597
	j	bnei_cont.89598
bnei_else.89597:
	fneg	%f0, %f0
bnei_cont.89598:
	flw	%f4, 53(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.89599
	addi	%v0, %zero, 1
	j	fbgt_cont.89600
fbgt_else.89599:
	addi	%v0, %zero, 0
fbgt_cont.89600:
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 57(%sp)
	fsw	%f3, 58(%sp)
	fsw	%f2, 59(%sp)
	sw	%v0, 60(%sp)
	fsw	%f4, 61(%sp)
	fblt	%f4, %f6, fbgt_else.89601
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.89603
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.89605
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.89607
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.89609
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.89611
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.89613
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.89615
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.89617
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.89619
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.89602
fbgt_else.89619:
	fmov	%f0, %f7
fbgt_cont.89620:
	j	fbgt_cont.89602
fbgt_else.89617:
	fmov	%f0, %f7
fbgt_cont.89618:
	j	fbgt_cont.89602
fbgt_else.89615:
	fmov	%f0, %f7
fbgt_cont.89616:
	j	fbgt_cont.89602
fbgt_else.89613:
	fmov	%f0, %f7
fbgt_cont.89614:
	j	fbgt_cont.89602
fbgt_else.89611:
	fmov	%f0, %f7
fbgt_cont.89612:
	j	fbgt_cont.89602
fbgt_else.89609:
	fmov	%f0, %f7
fbgt_cont.89610:
	j	fbgt_cont.89602
fbgt_else.89607:
	fmov	%f0, %f7
fbgt_cont.89608:
	j	fbgt_cont.89602
fbgt_else.89605:
	fmov	%f0, %f7
fbgt_cont.89606:
	j	fbgt_cont.89602
fbgt_else.89603:
	fmov	%f0, %f7
fbgt_cont.89604:
	j	fbgt_cont.89602
fbgt_else.89601:
	fmov	%f0, %f6
fbgt_cont.89602:
	flw	%f1, 61(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89621
	fblt	%f1, %f0, fbgt_else.89623
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89625
	fblt	%f1, %f0, fbgt_else.89627
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.89622
fbgt_else.89627:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
fbgt_cont.89628:
	j	fbgt_cont.89622
fbgt_else.89625:
	fmov	%f0, %f1
fbgt_cont.89626:
	j	fbgt_cont.89622
fbgt_else.89623:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89629
	fblt	%f1, %f0, fbgt_else.89631
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.89630
fbgt_else.89631:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
fbgt_cont.89632:
	j	fbgt_cont.89630
fbgt_else.89629:
	fmov	%f0, %f1
fbgt_cont.89630:
fbgt_cont.89624:
	j	fbgt_cont.89622
fbgt_else.89621:
	fmov	%f0, %f1
fbgt_cont.89622:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89633
	lw	%v0, 60(%sp)
	beqi	%v0, 0, bnei_else.89635
	addi	%v0, %zero, 0
	j	fbgt_cont.89634
bnei_else.89635:
	addi	%v0, %zero, 1
bnei_cont.89636:
	j	fbgt_cont.89634
fbgt_else.89633:
	lw	%v0, 60(%sp)
fbgt_cont.89634:
	fblt	%f0, %f1, fbgt_else.89637
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89638
fbgt_else.89637:
fbgt_cont.89638:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.89639
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89640
fbgt_else.89639:
fbgt_cont.89640:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.89641
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.89642
fbgt_else.89641:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.89642:
	beqi	%v0, 0, bnei_else.89643
	j	bnei_cont.89644
bnei_else.89643:
	fneg	%f0, %f0
bnei_cont.89644:
	lw	%v0, 50(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 62(%sp)
	fsw	%f4, 63(%sp)
	fsw	%f5, 64(%sp)
	fblt	%f5, %f6, fbgt_else.89645
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.89647
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.89649
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.89651
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.89653
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.89655
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.89657
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.89659
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.89661
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.89663
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.89646
fbgt_else.89663:
	fmov	%f0, %f7
fbgt_cont.89664:
	j	fbgt_cont.89646
fbgt_else.89661:
	fmov	%f0, %f7
fbgt_cont.89662:
	j	fbgt_cont.89646
fbgt_else.89659:
	fmov	%f0, %f7
fbgt_cont.89660:
	j	fbgt_cont.89646
fbgt_else.89657:
	fmov	%f0, %f7
fbgt_cont.89658:
	j	fbgt_cont.89646
fbgt_else.89655:
	fmov	%f0, %f7
fbgt_cont.89656:
	j	fbgt_cont.89646
fbgt_else.89653:
	fmov	%f0, %f7
fbgt_cont.89654:
	j	fbgt_cont.89646
fbgt_else.89651:
	fmov	%f0, %f7
fbgt_cont.89652:
	j	fbgt_cont.89646
fbgt_else.89649:
	fmov	%f0, %f7
fbgt_cont.89650:
	j	fbgt_cont.89646
fbgt_else.89647:
	fmov	%f0, %f7
fbgt_cont.89648:
	j	fbgt_cont.89646
fbgt_else.89645:
	fmov	%f0, %f6
fbgt_cont.89646:
	flw	%f1, 64(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89665
	fblt	%f1, %f0, fbgt_else.89667
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89669
	fblt	%f1, %f0, fbgt_else.89671
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.89666
fbgt_else.89671:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.89672:
	j	fbgt_cont.89666
fbgt_else.89669:
	fmov	%f0, %f1
fbgt_cont.89670:
	j	fbgt_cont.89666
fbgt_else.89667:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89673
	fblt	%f1, %f0, fbgt_else.89675
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.89674
fbgt_else.89675:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.89676:
	j	fbgt_cont.89674
fbgt_else.89673:
	fmov	%f0, %f1
fbgt_cont.89674:
fbgt_cont.89668:
	j	fbgt_cont.89666
fbgt_else.89665:
	fmov	%f0, %f1
fbgt_cont.89666:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89677
	addi	%v0, %zero, 0
	j	fbgt_cont.89678
fbgt_else.89677:
	addi	%v0, %zero, 1
fbgt_cont.89678:
	fblt	%f0, %f1, fbgt_else.89679
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89680
fbgt_else.89679:
fbgt_cont.89680:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.89681
	beqi	%v0, 0, bnei_else.89683
	addi	%v0, %zero, 0
	j	fbgt_cont.89682
bnei_else.89683:
	addi	%v0, %zero, 1
bnei_cont.89684:
	j	fbgt_cont.89682
fbgt_else.89681:
fbgt_cont.89682:
	fblt	%f0, %f2, fbgt_else.89685
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89686
fbgt_else.89685:
fbgt_cont.89686:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.89687
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89688
fbgt_else.89687:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89688:
	beqi	%v0, 0, bnei_else.89689
	j	bnei_cont.89690
bnei_else.89689:
	fneg	%f0, %f0
bnei_cont.89690:
	flw	%f4, 63(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.89691
	addi	%v0, %zero, 1
	j	fbgt_cont.89692
fbgt_else.89691:
	addi	%v0, %zero, 0
fbgt_cont.89692:
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 65(%sp)
	sw	%v0, 66(%sp)
	fsw	%f4, 67(%sp)
	fblt	%f4, %f6, fbgt_else.89693
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.89695
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.89697
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.89699
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.89701
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.89703
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.89705
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.89707
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.89709
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.89711
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.89694
fbgt_else.89711:
	fmov	%f0, %f7
fbgt_cont.89712:
	j	fbgt_cont.89694
fbgt_else.89709:
	fmov	%f0, %f7
fbgt_cont.89710:
	j	fbgt_cont.89694
fbgt_else.89707:
	fmov	%f0, %f7
fbgt_cont.89708:
	j	fbgt_cont.89694
fbgt_else.89705:
	fmov	%f0, %f7
fbgt_cont.89706:
	j	fbgt_cont.89694
fbgt_else.89703:
	fmov	%f0, %f7
fbgt_cont.89704:
	j	fbgt_cont.89694
fbgt_else.89701:
	fmov	%f0, %f7
fbgt_cont.89702:
	j	fbgt_cont.89694
fbgt_else.89699:
	fmov	%f0, %f7
fbgt_cont.89700:
	j	fbgt_cont.89694
fbgt_else.89697:
	fmov	%f0, %f7
fbgt_cont.89698:
	j	fbgt_cont.89694
fbgt_else.89695:
	fmov	%f0, %f7
fbgt_cont.89696:
	j	fbgt_cont.89694
fbgt_else.89693:
	fmov	%f0, %f6
fbgt_cont.89694:
	flw	%f1, 67(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89713
	fblt	%f1, %f0, fbgt_else.89715
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89717
	fblt	%f1, %f0, fbgt_else.89719
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.89714
fbgt_else.89719:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.89720:
	j	fbgt_cont.89714
fbgt_else.89717:
	fmov	%f0, %f1
fbgt_cont.89718:
	j	fbgt_cont.89714
fbgt_else.89715:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89721
	fblt	%f1, %f0, fbgt_else.89723
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.89722
fbgt_else.89723:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.89724:
	j	fbgt_cont.89722
fbgt_else.89721:
	fmov	%f0, %f1
fbgt_cont.89722:
fbgt_cont.89716:
	j	fbgt_cont.89714
fbgt_else.89713:
	fmov	%f0, %f1
fbgt_cont.89714:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89725
	lw	%v0, 66(%sp)
	beqi	%v0, 0, bnei_else.89727
	addi	%v0, %zero, 0
	j	fbgt_cont.89726
bnei_else.89727:
	addi	%v0, %zero, 1
bnei_cont.89728:
	j	fbgt_cont.89726
fbgt_else.89725:
	lw	%v0, 66(%sp)
fbgt_cont.89726:
	fblt	%f0, %f1, fbgt_else.89729
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89730
fbgt_else.89729:
fbgt_cont.89730:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.89731
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89732
fbgt_else.89731:
fbgt_cont.89732:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.89733
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.89734
fbgt_else.89733:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.89734:
	beqi	%v0, 0, bnei_else.89735
	j	bnei_cont.89736
bnei_else.89735:
	fneg	%f0, %f0
bnei_cont.89736:
	lw	%v0, 50(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 68(%sp)
	fsw	%f4, 69(%sp)
	fsw	%f5, 70(%sp)
	fblt	%f5, %f6, fbgt_else.89737
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.89739
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.89741
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.89743
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.89745
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.89747
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.89749
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.89751
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.89753
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.89755
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.89738
fbgt_else.89755:
	fmov	%f0, %f7
fbgt_cont.89756:
	j	fbgt_cont.89738
fbgt_else.89753:
	fmov	%f0, %f7
fbgt_cont.89754:
	j	fbgt_cont.89738
fbgt_else.89751:
	fmov	%f0, %f7
fbgt_cont.89752:
	j	fbgt_cont.89738
fbgt_else.89749:
	fmov	%f0, %f7
fbgt_cont.89750:
	j	fbgt_cont.89738
fbgt_else.89747:
	fmov	%f0, %f7
fbgt_cont.89748:
	j	fbgt_cont.89738
fbgt_else.89745:
	fmov	%f0, %f7
fbgt_cont.89746:
	j	fbgt_cont.89738
fbgt_else.89743:
	fmov	%f0, %f7
fbgt_cont.89744:
	j	fbgt_cont.89738
fbgt_else.89741:
	fmov	%f0, %f7
fbgt_cont.89742:
	j	fbgt_cont.89738
fbgt_else.89739:
	fmov	%f0, %f7
fbgt_cont.89740:
	j	fbgt_cont.89738
fbgt_else.89737:
	fmov	%f0, %f6
fbgt_cont.89738:
	flw	%f1, 70(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89757
	fblt	%f1, %f0, fbgt_else.89759
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89761
	fblt	%f1, %f0, fbgt_else.89763
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.89758
fbgt_else.89763:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
fbgt_cont.89764:
	j	fbgt_cont.89758
fbgt_else.89761:
	fmov	%f0, %f1
fbgt_cont.89762:
	j	fbgt_cont.89758
fbgt_else.89759:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89765
	fblt	%f1, %f0, fbgt_else.89767
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.89766
fbgt_else.89767:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
fbgt_cont.89768:
	j	fbgt_cont.89766
fbgt_else.89765:
	fmov	%f0, %f1
fbgt_cont.89766:
fbgt_cont.89760:
	j	fbgt_cont.89758
fbgt_else.89757:
	fmov	%f0, %f1
fbgt_cont.89758:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89769
	addi	%v0, %zero, 0
	j	fbgt_cont.89770
fbgt_else.89769:
	addi	%v0, %zero, 1
fbgt_cont.89770:
	fblt	%f0, %f1, fbgt_else.89771
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89772
fbgt_else.89771:
fbgt_cont.89772:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.89773
	beqi	%v0, 0, bnei_else.89775
	addi	%v0, %zero, 0
	j	fbgt_cont.89774
bnei_else.89775:
	addi	%v0, %zero, 1
bnei_cont.89776:
	j	fbgt_cont.89774
fbgt_else.89773:
fbgt_cont.89774:
	fblt	%f0, %f2, fbgt_else.89777
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89778
fbgt_else.89777:
fbgt_cont.89778:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.89779
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.89780
fbgt_else.89779:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.89780:
	beqi	%v0, 0, bnei_else.89781
	j	bnei_cont.89782
bnei_else.89781:
	fneg	%f0, %f0
bnei_cont.89782:
	flw	%f4, 69(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.89783
	addi	%v0, %zero, 1
	j	fbgt_cont.89784
fbgt_else.89783:
	addi	%v0, %zero, 0
fbgt_cont.89784:
	fabs	%f4, %f4
	flw	%f5, 56(%sp)
	fsw	%f0, 71(%sp)
	sw	%v0, 72(%sp)
	fsw	%f4, 73(%sp)
	fblt	%f4, %f5, fbgt_else.89785
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.89787
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.89789
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.89791
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.89793
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.89795
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.89797
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.89799
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.89801
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.89803
	flw	%f6, 478(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.89786
fbgt_else.89803:
	fmov	%f0, %f6
fbgt_cont.89804:
	j	fbgt_cont.89786
fbgt_else.89801:
	fmov	%f0, %f6
fbgt_cont.89802:
	j	fbgt_cont.89786
fbgt_else.89799:
	fmov	%f0, %f6
fbgt_cont.89800:
	j	fbgt_cont.89786
fbgt_else.89797:
	fmov	%f0, %f6
fbgt_cont.89798:
	j	fbgt_cont.89786
fbgt_else.89795:
	fmov	%f0, %f6
fbgt_cont.89796:
	j	fbgt_cont.89786
fbgt_else.89793:
	fmov	%f0, %f6
fbgt_cont.89794:
	j	fbgt_cont.89786
fbgt_else.89791:
	fmov	%f0, %f6
fbgt_cont.89792:
	j	fbgt_cont.89786
fbgt_else.89789:
	fmov	%f0, %f6
fbgt_cont.89790:
	j	fbgt_cont.89786
fbgt_else.89787:
	fmov	%f0, %f6
fbgt_cont.89788:
	j	fbgt_cont.89786
fbgt_else.89785:
	fmov	%f0, %f5
fbgt_cont.89786:
	flw	%f1, 73(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.89805
	fblt	%f1, %f0, fbgt_else.89807
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89809
	fblt	%f1, %f0, fbgt_else.89811
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.89806
fbgt_else.89811:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.89812:
	j	fbgt_cont.89806
fbgt_else.89809:
	fmov	%f0, %f1
fbgt_cont.89810:
	j	fbgt_cont.89806
fbgt_else.89807:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.89813
	fblt	%f1, %f0, fbgt_else.89815
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.89814
fbgt_else.89815:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.89816:
	j	fbgt_cont.89814
fbgt_else.89813:
	fmov	%f0, %f1
fbgt_cont.89814:
fbgt_cont.89808:
	j	fbgt_cont.89806
fbgt_else.89805:
	fmov	%f0, %f1
fbgt_cont.89806:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.89817
	lw	%v0, 72(%sp)
	beqi	%v0, 0, bnei_else.89819
	addi	%v0, %zero, 0
	j	fbgt_cont.89818
bnei_else.89819:
	addi	%v0, %zero, 1
bnei_cont.89820:
	j	fbgt_cont.89818
fbgt_else.89817:
	lw	%v0, 72(%sp)
fbgt_cont.89818:
	fblt	%f0, %f1, fbgt_else.89821
	fsub	%f0, %f0, %f1
	j	fbgt_cont.89822
fbgt_else.89821:
fbgt_cont.89822:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.89823
	fsub	%f0, %f1, %f0
	j	fbgt_cont.89824
fbgt_else.89823:
fbgt_cont.89824:
	flw	%f1, 58(%sp)
	fblt	%f1, %f0, fbgt_else.89825
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.89826
fbgt_else.89825:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.89826:
	beqi	%v0, 0, bnei_else.89827
	j	bnei_cont.89828
bnei_else.89827:
	fneg	%f0, %f0
bnei_cont.89828:
	flw	%f1, 71(%sp)
	flw	%f2, 65(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 68(%sp)
	flw	%f5, 62(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 57(%sp)
	fmul	%f9, %f8, %f0
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4
	fmul	%f10, %f9, %f1
	fmul	%f11, %f5, %f0
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0
	fmul	%f6, %f6, %f0
	fmul	%f12, %f8, %f1
	fadd	%f6, %f6, %f12
	fmul	%f0, %f9, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	lw	%v0, 44(%sp)
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)
	flw	%f9, 2(%v0)
	fmul	%f12, %f3, %f3
	fmul	%f12, %f5, %f12
	fmul	%f13, %f11, %f11
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f12, %f5, %f12
	fmul	%f13, %f6, %f6
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f12, %f5, %f12
	fmul	%f13, %f0, %f0
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 2(%v0)
	flw	%f12, 494(%zero)
	fmul	%f13, %f5, %f7
	fmul	%f13, %f13, %f10
	fmul	%f14, %f8, %f6
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f13, %f12, %f13
	lw	%v0, 50(%sp)
	fsw	%f13, 0(%v0)
	fmul	%f3, %f5, %f3
	fmul	%f5, %f3, %f10
	fmul	%f8, %f8, %f11
	fmul	%f0, %f8, %f0
	fadd	%f0, %f5, %f0
	fmul	%f1, %f9, %f1
	fmul	%f2, %f1, %f2
	fadd	%f0, %f0, %f2
	fmul	%f0, %f12, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7
	fmul	%f2, %f8, %f6
	fadd	%f0, %f0, %f2
	fmul	%f1, %f1, %f4
	fadd	%f0, %f0, %f1
	fmul	%f0, %f12, %f0
	fsw	%f0, 2(%v0)
	j	bnei_cont.89552
bnei_else.89551:
bnei_cont.89552:
	addi	%v0, %zero, 1
	j	bnei_cont.89496
bnei_else.89495:
	addi	%v0, %zero, 0
bnei_cont.89496:
	beqi	%v0, 0, bnei_else.89829
	lw	%v0, 37(%sp)
	addi	%v0, %v0, 1
	j	read_object.2772
bnei_else.89829:
	lw	%v0, 37(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.89492:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2776:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.89832
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.89833
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.89835
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.89837
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2776
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.89838
bnei_else.89837:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.89838:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.89836
bnei_else.89835:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.89836:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.89834
bnei_else.89833:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.89834:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.89832:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2778:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.89839
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.89841
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.89843
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2776
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.89844
bnei_else.89843:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.89844:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.89842
bnei_else.89841:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.89842:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.89840
bnei_else.89839:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.89840:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.89845
	addi	%v0, %zero, 1
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%v1, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.89846
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.89848
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.89849
bnei_else.89848:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.89849:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.89847
bnei_else.89846:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.89847:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.89850
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2778
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.89851
bnei_else.89850:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.89851:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.89845:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2780:
	addi	%v1, %zero, 0
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 2(%sp)
	beqi	%v0, -1, bnei_else.89852
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.89854
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.89856
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2776
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.89857
bnei_else.89856:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.89857:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.89855
bnei_else.89854:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.89855:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.89853
bnei_else.89852:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.89853:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.89858
	lw	%v1, 1(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %zero, 1
	addi	%v1, %v1, 1
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.89859
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.89861
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.89862
bnei_else.89861:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.89862:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.89860
bnei_else.89859:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.89860:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.89863
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.89864
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2776
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.89865
bnei_else.89864:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.89865:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.89866
	lw	%v1, 10(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	read_net_item.2776
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.89867
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2780
bnei_else.89867:
	jr	%ra
bnei_else.89866:
	jr	%ra
bnei_else.89863:
	jr	%ra
bnei_else.89858:
	jr	%ra
iter_setup_dirvec_constants.2877:
	blti	%v1, 0, bgti_else.89872
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.89873
	beqi	%a3, 2, bnei_else.89875
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 4(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.89877
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.89878
bnei_else.89877:
bnei_cont.89878:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.89879
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f8, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f9, 2(%a0)
	fmul	%f10, %f1, %f9
	fadd	%f8, %f8, %f10
	flw	%f10, 471(%zero)
	fmul	%f8, %f8, %f10
	fsub	%f4, %f4, %f8
	fsw	%f4, 1(%v0)
	lw	%v1, 9(%v1)
	flw	%f4, 0(%v1)
	fmul	%f2, %f2, %f4
	fmul	%f8, %f0, %f9
	fadd	%f2, %f2, %f8
	fmul	%f2, %f2, %f10
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	fmul	%f1, %f1, %f4
	fmul	%f0, %f0, %f7
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f10
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.89880
bnei_else.89879:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.89880:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.89881
	addi	%v1, %zero, 1
	j	fbeq_cont.89882
fbeq_else.89881:
	addi	%v1, %zero, 0
fbeq_cont.89882:
	beqi	%v1, 0, bnei_else.89883
	j	bnei_cont.89884
bnei_else.89883:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.89884:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.89874
bnei_else.89875:
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 6(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)
	lw	%a1, 4(%a0)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f2, 1(%v1)
	lw	%a1, 4(%a0)
	flw	%f3, 1(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 6(%sp)
	fblt	%f2, %f0, fbgt_else.89885
	addi	%v1, %zero, 0
	j	fbgt_cont.89886
fbgt_else.89885:
	addi	%v1, %zero, 1
fbgt_cont.89886:
	beqi	%v1, 0, bnei_else.89887
	flw	%f2, 490(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f2, 0(%v0)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	fdiv	%f1, %f3, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	fdiv	%f0, %f4, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.89888
bnei_else.89887:
	fsw	%f2, 0(%v0)
bnei_cont.89888:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.89876:
	j	bnei_cont.89874
bnei_else.89873:
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 4(%sp)
	fsw	%f0, 7(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 7(%sp)
	fbne	%f0, %f1, fbeq_else.89889
	addi	%a0, %zero, 1
	j	fbeq_cont.89890
fbeq_else.89889:
	addi	%a0, %zero, 0
fbeq_cont.89890:
	beqi	%a0, 0, bnei_else.89891
	fsw	%f1, 1(%v0)
	j	bnei_cont.89892
bnei_else.89891:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.89893
	addi	%a2, %zero, 0
	j	fbgt_cont.89894
fbgt_else.89893:
	addi	%a2, %zero, 1
fbgt_cont.89894:
	beqi	%a1, 0, bnei_else.89895
	beqi	%a2, 0, bnei_else.89897
	addi	%a1, %zero, 0
	j	bnei_cont.89896
bnei_else.89897:
	addi	%a1, %zero, 1
bnei_cont.89898:
	j	bnei_cont.89896
bnei_else.89895:
	add	%a1, %zero, %a2
bnei_cont.89896:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.89899
	j	bnei_cont.89900
bnei_else.89899:
	fneg	%f2, %f2
bnei_cont.89900:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.89892:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.89901
	addi	%a0, %zero, 1
	j	fbeq_cont.89902
fbeq_else.89901:
	addi	%a0, %zero, 0
fbeq_cont.89902:
	beqi	%a0, 0, bnei_else.89903
	fsw	%f1, 3(%v0)
	j	bnei_cont.89904
bnei_else.89903:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.89905
	addi	%a2, %zero, 0
	j	fbgt_cont.89906
fbgt_else.89905:
	addi	%a2, %zero, 1
fbgt_cont.89906:
	beqi	%a1, 0, bnei_else.89907
	beqi	%a2, 0, bnei_else.89909
	addi	%a1, %zero, 0
	j	bnei_cont.89908
bnei_else.89909:
	addi	%a1, %zero, 1
bnei_cont.89910:
	j	bnei_cont.89908
bnei_else.89907:
	add	%a1, %zero, %a2
bnei_cont.89908:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.89911
	j	bnei_cont.89912
bnei_else.89911:
	fneg	%f2, %f2
bnei_cont.89912:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.89904:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.89913
	addi	%v1, %zero, 1
	j	fbeq_cont.89914
fbeq_else.89913:
	addi	%v1, %zero, 0
fbeq_cont.89914:
	beqi	%v1, 0, bnei_else.89915
	fsw	%f1, 5(%v0)
	j	bnei_cont.89916
bnei_else.89915:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.89917
	addi	%a1, %zero, 0
	j	fbgt_cont.89918
fbgt_else.89917:
	addi	%a1, %zero, 1
fbgt_cont.89918:
	beqi	%a0, 0, bnei_else.89919
	beqi	%a1, 0, bnei_else.89921
	addi	%a0, %zero, 0
	j	bnei_cont.89920
bnei_else.89921:
	addi	%a0, %zero, 1
bnei_cont.89922:
	j	bnei_cont.89920
bnei_else.89919:
	add	%a0, %zero, %a1
bnei_cont.89920:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.89923
	j	bnei_cont.89924
bnei_else.89923:
	fneg	%f1, %f1
bnei_cont.89924:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.89916:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.89874:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.89925
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.89926
	beqi	%a3, 2, bnei_else.89928
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	fsw	%f0, 10(%sp)
	sw	%v1, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 11(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.89930
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.89931
bnei_else.89930:
bnei_cont.89931:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.89932
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.89933
bnei_else.89932:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.89933:
	flw	%f0, 10(%sp)
	fbne	%f3, %f0, fbeq_else.89934
	addi	%v1, %zero, 1
	j	fbeq_cont.89935
fbeq_else.89934:
	addi	%v1, %zero, 0
fbeq_cont.89935:
	beqi	%v1, 0, bnei_else.89936
	j	bnei_cont.89937
bnei_else.89936:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.89937:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.89927
bnei_else.89928:
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	fsw	%f0, 13(%sp)
	sw	%v1, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 11(%sp)
	lw	%a1, 4(%a0)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	lw	%a1, 4(%a0)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 13(%sp)
	fblt	%f1, %f0, fbgt_else.89938
	addi	%v1, %zero, 0
	j	fbgt_cont.89939
fbgt_else.89938:
	addi	%v1, %zero, 1
fbgt_cont.89939:
	beqi	%v1, 0, bnei_else.89940
	flw	%f1, 490(%zero)
	fdiv	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 0(%v1)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 1(%v1)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f1, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.89941
bnei_else.89940:
	fsw	%f1, 0(%v0)
bnei_cont.89941:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.89929:
	j	bnei_cont.89927
bnei_else.89926:
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	sw	%v1, 11(%sp)
	fsw	%f0, 14(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 14(%sp)
	fbne	%f0, %f1, fbeq_else.89942
	addi	%a0, %zero, 1
	j	fbeq_cont.89943
fbeq_else.89942:
	addi	%a0, %zero, 0
fbeq_cont.89943:
	beqi	%a0, 0, bnei_else.89944
	fsw	%f1, 1(%v0)
	j	bnei_cont.89945
bnei_else.89944:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.89946
	addi	%a2, %zero, 0
	j	fbgt_cont.89947
fbgt_else.89946:
	addi	%a2, %zero, 1
fbgt_cont.89947:
	beqi	%a1, 0, bnei_else.89948
	beqi	%a2, 0, bnei_else.89950
	addi	%a1, %zero, 0
	j	bnei_cont.89949
bnei_else.89950:
	addi	%a1, %zero, 1
bnei_cont.89951:
	j	bnei_cont.89949
bnei_else.89948:
	add	%a1, %zero, %a2
bnei_cont.89949:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.89952
	j	bnei_cont.89953
bnei_else.89952:
	fneg	%f2, %f2
bnei_cont.89953:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.89945:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.89954
	addi	%a0, %zero, 1
	j	fbeq_cont.89955
fbeq_else.89954:
	addi	%a0, %zero, 0
fbeq_cont.89955:
	beqi	%a0, 0, bnei_else.89956
	fsw	%f1, 3(%v0)
	j	bnei_cont.89957
bnei_else.89956:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.89958
	addi	%a2, %zero, 0
	j	fbgt_cont.89959
fbgt_else.89958:
	addi	%a2, %zero, 1
fbgt_cont.89959:
	beqi	%a1, 0, bnei_else.89960
	beqi	%a2, 0, bnei_else.89962
	addi	%a1, %zero, 0
	j	bnei_cont.89961
bnei_else.89962:
	addi	%a1, %zero, 1
bnei_cont.89963:
	j	bnei_cont.89961
bnei_else.89960:
	add	%a1, %zero, %a2
bnei_cont.89961:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.89964
	j	bnei_cont.89965
bnei_else.89964:
	fneg	%f2, %f2
bnei_cont.89965:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.89957:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.89966
	addi	%v1, %zero, 1
	j	fbeq_cont.89967
fbeq_else.89966:
	addi	%v1, %zero, 0
fbeq_cont.89967:
	beqi	%v1, 0, bnei_else.89968
	fsw	%f1, 5(%v0)
	j	bnei_cont.89969
bnei_else.89968:
	lw	%v1, 11(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.89970
	addi	%a1, %zero, 0
	j	fbgt_cont.89971
fbgt_else.89970:
	addi	%a1, %zero, 1
fbgt_cont.89971:
	beqi	%a0, 0, bnei_else.89972
	beqi	%a1, 0, bnei_else.89974
	addi	%a0, %zero, 0
	j	bnei_cont.89973
bnei_else.89974:
	addi	%a0, %zero, 1
bnei_cont.89975:
	j	bnei_cont.89973
bnei_else.89972:
	add	%a0, %zero, %a1
bnei_cont.89973:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.89976
	j	bnei_cont.89977
bnei_else.89976:
	fneg	%f1, %f1
bnei_cont.89977:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.89969:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.89927:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.89925:
	jr	%ra
bgti_else.89872:
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.89980
	lw	%a0, 12(%v1)
	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)
	flw	%f0, 0(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 1(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 2(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 2(%a1)
	beqi	%a2, 2, bnei_else.89981
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.89983
	j	bnei_cont.89982
bgt_else.89983:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	fmul	%f3, %f0, %f0
	lw	%a3, 4(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a3, 4(%a0)
	flw	%f5, 1(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a3, 4(%a0)
	flw	%f5, 2(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a3, 3(%a0)
	beqi	%a3, 0, bnei_else.89985
	fmul	%f4, %f1, %f2
	lw	%a3, 9(%a0)
	flw	%f5, 0(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lw	%a3, 9(%a0)
	flw	%f4, 1(%a3)
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lw	%a0, 9(%a0)
	flw	%f1, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.89986
bnei_else.89985:
	fmov	%f0, %f3
bnei_cont.89986:
	beqi	%a2, 3, bnei_else.89987
	j	bnei_cont.89988
bnei_else.89987:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.89988:
	fsw	%f0, 3(%a1)
bgt_cont.89984:
	j	bnei_cont.89982
bnei_else.89981:
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	flw	%f3, 0(%a0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%a0)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 3(%a1)
bnei_cont.89982:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.89980:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.89990
	lw	%a0, 12(%a0)
	lw	%a1, 5(%a0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f0, %f3
	lw	%a1, 5(%a0)
	flw	%f4, 1(%a1)
	fsub	%f4, %f1, %f4
	lw	%a1, 5(%a0)
	flw	%f5, 2(%a1)
	fsub	%f5, %f2, %f5
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.89991
	beqi	%a1, 2, bnei_else.89993
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.89995
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.89996
bnei_else.89995:
	fmov	%f3, %f6
bnei_cont.89996:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.89997
	j	bnei_cont.89998
bnei_else.89997:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.89998:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.89999
	addi	%a1, %zero, 0
	j	fbgt_cont.90000
fbgt_else.89999:
	addi	%a1, %zero, 1
fbgt_cont.90000:
	beqi	%a0, 0, bnei_else.90001
	beqi	%a1, 0, bnei_else.90003
	addi	%a0, %zero, 0
	j	bnei_cont.90002
bnei_else.90003:
	addi	%a0, %zero, 1
bnei_cont.90004:
	j	bnei_cont.90002
bnei_else.90001:
	add	%a0, %zero, %a1
bnei_cont.90002:
	beqi	%a0, 0, bnei_else.90005
	addi	%a0, %zero, 0
	j	bnei_cont.89992
bnei_else.90005:
	addi	%a0, %zero, 1
bnei_cont.90006:
	j	bnei_cont.89992
bnei_else.89993:
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90007
	addi	%a1, %zero, 0
	j	fbgt_cont.90008
fbgt_else.90007:
	addi	%a1, %zero, 1
fbgt_cont.90008:
	beqi	%a0, 0, bnei_else.90009
	beqi	%a1, 0, bnei_else.90011
	addi	%a0, %zero, 0
	j	bnei_cont.90010
bnei_else.90011:
	addi	%a0, %zero, 1
bnei_cont.90012:
	j	bnei_cont.90010
bnei_else.90009:
	add	%a0, %zero, %a1
bnei_cont.90010:
	beqi	%a0, 0, bnei_else.90013
	addi	%a0, %zero, 0
	j	bnei_cont.90014
bnei_else.90013:
	addi	%a0, %zero, 1
bnei_cont.90014:
bnei_cont.89994:
	j	bnei_cont.89992
bnei_else.89991:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.90015
	addi	%a1, %zero, 0
	j	fbgt_cont.90016
fbgt_else.90015:
	addi	%a1, %zero, 1
fbgt_cont.90016:
	beqi	%a1, 0, bnei_else.90017
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.90019
	addi	%a1, %zero, 0
	j	fbgt_cont.90020
fbgt_else.90019:
	addi	%a1, %zero, 1
fbgt_cont.90020:
	beqi	%a1, 0, bnei_else.90021
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.90023
	addi	%a1, %zero, 0
	j	bnei_cont.90018
fbgt_else.90023:
	addi	%a1, %zero, 1
fbgt_cont.90024:
	j	bnei_cont.90018
bnei_else.90021:
	addi	%a1, %zero, 0
bnei_cont.90022:
	j	bnei_cont.90018
bnei_else.90017:
	addi	%a1, %zero, 0
bnei_cont.90018:
	beqi	%a1, 0, bnei_else.90025
	lw	%a0, 6(%a0)
	j	bnei_cont.90026
bnei_else.90025:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.90027
	addi	%a0, %zero, 0
	j	bnei_cont.90028
bnei_else.90027:
	addi	%a0, %zero, 1
bnei_cont.90028:
bnei_cont.90026:
bnei_cont.89992:
	beqi	%a0, 0, bnei_else.90029
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90029:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90030
	lw	%a0, 12(%a0)
	lw	%a1, 5(%a0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f0, %f3
	lw	%a1, 5(%a0)
	flw	%f4, 1(%a1)
	fsub	%f4, %f1, %f4
	lw	%a1, 5(%a0)
	flw	%f5, 2(%a1)
	fsub	%f5, %f2, %f5
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.90031
	beqi	%a1, 2, bnei_else.90033
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.90035
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.90036
bnei_else.90035:
	fmov	%f3, %f6
bnei_cont.90036:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.90037
	j	bnei_cont.90038
bnei_else.90037:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.90038:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90039
	addi	%a1, %zero, 0
	j	fbgt_cont.90040
fbgt_else.90039:
	addi	%a1, %zero, 1
fbgt_cont.90040:
	beqi	%a0, 0, bnei_else.90041
	beqi	%a1, 0, bnei_else.90043
	addi	%a0, %zero, 0
	j	bnei_cont.90042
bnei_else.90043:
	addi	%a0, %zero, 1
bnei_cont.90044:
	j	bnei_cont.90042
bnei_else.90041:
	add	%a0, %zero, %a1
bnei_cont.90042:
	beqi	%a0, 0, bnei_else.90045
	addi	%a0, %zero, 0
	j	bnei_cont.90032
bnei_else.90045:
	addi	%a0, %zero, 1
bnei_cont.90046:
	j	bnei_cont.90032
bnei_else.90033:
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90047
	addi	%a1, %zero, 0
	j	fbgt_cont.90048
fbgt_else.90047:
	addi	%a1, %zero, 1
fbgt_cont.90048:
	beqi	%a0, 0, bnei_else.90049
	beqi	%a1, 0, bnei_else.90051
	addi	%a0, %zero, 0
	j	bnei_cont.90050
bnei_else.90051:
	addi	%a0, %zero, 1
bnei_cont.90052:
	j	bnei_cont.90050
bnei_else.90049:
	add	%a0, %zero, %a1
bnei_cont.90050:
	beqi	%a0, 0, bnei_else.90053
	addi	%a0, %zero, 0
	j	bnei_cont.90054
bnei_else.90053:
	addi	%a0, %zero, 1
bnei_cont.90054:
bnei_cont.90034:
	j	bnei_cont.90032
bnei_else.90031:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.90055
	addi	%a1, %zero, 0
	j	fbgt_cont.90056
fbgt_else.90055:
	addi	%a1, %zero, 1
fbgt_cont.90056:
	beqi	%a1, 0, bnei_else.90057
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.90059
	addi	%a1, %zero, 0
	j	fbgt_cont.90060
fbgt_else.90059:
	addi	%a1, %zero, 1
fbgt_cont.90060:
	beqi	%a1, 0, bnei_else.90061
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.90063
	addi	%a1, %zero, 0
	j	bnei_cont.90058
fbgt_else.90063:
	addi	%a1, %zero, 1
fbgt_cont.90064:
	j	bnei_cont.90058
bnei_else.90061:
	addi	%a1, %zero, 0
bnei_cont.90062:
	j	bnei_cont.90058
bnei_else.90057:
	addi	%a1, %zero, 0
bnei_cont.90058:
	beqi	%a1, 0, bnei_else.90065
	lw	%a0, 6(%a0)
	j	bnei_cont.90066
bnei_else.90065:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.90067
	addi	%a0, %zero, 0
	j	bnei_cont.90068
bnei_else.90067:
	addi	%a0, %zero, 1
bnei_cont.90068:
bnei_cont.90066:
bnei_cont.90032:
	beqi	%a0, 0, bnei_else.90069
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90069:
	addi	%v0, %v0, 1
	j	check_all_inside.2907
bnei_else.90030:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.89990:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90070
	lw	%a1, 12(%a0)
	flw	%f0, 138(%zero)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f1, %f0, %f1
	addi	%a2, %zero, 1
	flw	%f2, 139(%zero)
	lw	%a3, 5(%a1)
	flw	%f3, 1(%a3)
	fsub	%f3, %f2, %f3
	flw	%f4, 140(%zero)
	lw	%a3, 5(%a1)
	flw	%f5, 2(%a3)
	fsub	%f5, %f4, %f5
	lw	%a0, 187(%a0)
	lw	%a3, 1(%a1)
	beqi	%a3, 1, bnei_else.90071
	beqi	%a3, 2, bnei_else.90073
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.90075
	addi	%a3, %zero, 1
	j	fbeq_cont.90076
fbeq_else.90075:
	addi	%a3, %zero, 0
fbeq_cont.90076:
	beqi	%a3, 0, bnei_else.90077
	addi	%a0, %zero, 0
	j	bnei_cont.90072
bnei_else.90077:
	flw	%f8, 1(%a0)
	fmul	%f8, %f8, %f1
	flw	%f9, 2(%a0)
	fmul	%f9, %f9, %f3
	fadd	%f8, %f8, %f9
	flw	%f9, 3(%a0)
	fmul	%f9, %f9, %f5
	fadd	%f8, %f8, %f9
	fmul	%f9, %f1, %f1
	lw	%a3, 4(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f3
	lw	%a3, 4(%a1)
	flw	%f11, 1(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	fmul	%f10, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.90079
	fmul	%f10, %f3, %f5
	lw	%a3, 9(%a1)
	flw	%f11, 0(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	fmul	%f5, %f5, %f1
	lw	%a3, 9(%a1)
	flw	%f10, 1(%a3)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f1, %f1, %f3
	lw	%a3, 9(%a1)
	flw	%f3, 2(%a3)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f5, %f1
	j	bnei_cont.90080
bnei_else.90079:
	fmov	%f1, %f9
bnei_cont.90080:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.90081
	j	bnei_cont.90082
bnei_else.90081:
	flw	%f3, 491(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.90082:
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	fblt	%f7, %f1, fbgt_else.90083
	addi	%a3, %zero, 0
	j	fbgt_cont.90084
fbgt_else.90083:
	addi	%a3, %zero, 1
fbgt_cont.90084:
	beqi	%a3, 0, bnei_else.90085
	lw	%a3, 6(%a1)
	beqi	%a3, 0, bnei_else.90087
	fsqrt	%f1, %f1
	fadd	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	j	bnei_cont.90088
bnei_else.90087:
	fsqrt	%f1, %f1
	fsub	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
bnei_cont.90088:
	addi	%a0, %zero, 1
	j	bnei_cont.90086
bnei_else.90085:
	addi	%a0, %zero, 0
bnei_cont.90086:
bnei_cont.90078:
	j	bnei_cont.90072
bnei_else.90073:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.90089
	addi	%a3, %zero, 0
	j	fbgt_cont.90090
fbgt_else.90089:
	addi	%a3, %zero, 1
fbgt_cont.90090:
	beqi	%a3, 0, bnei_else.90091
	flw	%f6, 1(%a0)
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)
	fmul	%f3, %f6, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)
	fmul	%f3, %f3, %f5
	fadd	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.90092
bnei_else.90091:
	addi	%a0, %zero, 0
bnei_cont.90092:
bnei_cont.90074:
	j	bnei_cont.90072
bnei_else.90071:
	flw	%f6, 0(%a0)
	fsub	%f6, %f6, %f1
	flw	%f7, 1(%a0)
	fmul	%f6, %f6, %f7
	flw	%f8, 185(%zero)
	fmul	%f9, %f6, %f8
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fblt	%f9, %f10, fbgt_else.90093
	addi	%a3, %zero, 0
	j	fbgt_cont.90094
fbgt_else.90093:
	addi	%a3, %zero, 1
fbgt_cont.90094:
	beqi	%a3, 0, bnei_else.90095
	flw	%f9, 186(%zero)
	fmul	%f9, %f6, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fblt	%f9, %f10, fbgt_else.90097
	addi	%a3, %zero, 0
	j	fbgt_cont.90098
fbgt_else.90097:
	addi	%a3, %zero, 1
fbgt_cont.90098:
	beqi	%a3, 0, bnei_else.90099
	flw	%f9, 493(%zero)
	fbne	%f7, %f9, fbeq_else.90101
	addi	%a3, %zero, 1
	j	fbeq_cont.90102
fbeq_else.90101:
	addi	%a3, %zero, 0
fbeq_cont.90102:
	beqi	%a3, 0, bnei_else.90103
	addi	%a3, %zero, 0
	j	bnei_cont.90096
bnei_else.90103:
	addi	%a3, %zero, 1
bnei_cont.90104:
	j	bnei_cont.90096
bnei_else.90099:
	addi	%a3, %zero, 0
bnei_cont.90100:
	j	bnei_cont.90096
bnei_else.90095:
	addi	%a3, %zero, 0
bnei_cont.90096:
	beqi	%a3, 0, bnei_else.90105
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.90106
bnei_else.90105:
	flw	%f6, 2(%a0)
	fsub	%f6, %f6, %f3
	flw	%f7, 3(%a0)
	fmul	%f6, %f6, %f7
	flw	%f9, 184(%zero)
	fmul	%f10, %f6, %f9
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 0(%a3)
	fblt	%f10, %f11, fbgt_else.90107
	addi	%a3, %zero, 0
	j	fbgt_cont.90108
fbgt_else.90107:
	addi	%a3, %zero, 1
fbgt_cont.90108:
	beqi	%a3, 0, bnei_else.90109
	flw	%f10, 186(%zero)
	fmul	%f10, %f6, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fblt	%f10, %f11, fbgt_else.90111
	addi	%a3, %zero, 0
	j	fbgt_cont.90112
fbgt_else.90111:
	addi	%a3, %zero, 1
fbgt_cont.90112:
	beqi	%a3, 0, bnei_else.90113
	flw	%f10, 493(%zero)
	fbne	%f7, %f10, fbeq_else.90115
	addi	%a3, %zero, 1
	j	fbeq_cont.90116
fbeq_else.90115:
	addi	%a3, %zero, 0
fbeq_cont.90116:
	beqi	%a3, 0, bnei_else.90117
	addi	%a3, %zero, 0
	j	bnei_cont.90110
bnei_else.90117:
	addi	%a3, %zero, 1
bnei_cont.90118:
	j	bnei_cont.90110
bnei_else.90113:
	addi	%a3, %zero, 0
bnei_cont.90114:
	j	bnei_cont.90110
bnei_else.90109:
	addi	%a3, %zero, 0
bnei_cont.90110:
	beqi	%a3, 0, bnei_else.90119
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.90120
bnei_else.90119:
	flw	%f6, 4(%a0)
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	fmul	%f5, %f5, %f6
	fmul	%f7, %f5, %f9
	fadd	%f1, %f7, %f1
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f7, 0(%a0)
	fblt	%f1, %f7, fbgt_else.90121
	addi	%a0, %zero, 0
	j	fbgt_cont.90122
fbgt_else.90121:
	addi	%a0, %zero, 1
fbgt_cont.90122:
	beqi	%a0, 0, bnei_else.90123
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f3, 1(%a0)
	fblt	%f1, %f3, fbgt_else.90125
	addi	%a0, %zero, 0
	j	fbgt_cont.90126
fbgt_else.90125:
	addi	%a0, %zero, 1
fbgt_cont.90126:
	beqi	%a0, 0, bnei_else.90127
	flw	%f1, 493(%zero)
	fbne	%f6, %f1, fbeq_else.90129
	addi	%a0, %zero, 1
	j	fbeq_cont.90130
fbeq_else.90129:
	addi	%a0, %zero, 0
fbeq_cont.90130:
	beqi	%a0, 0, bnei_else.90131
	addi	%a0, %zero, 0
	j	bnei_cont.90124
bnei_else.90131:
	addi	%a0, %zero, 1
bnei_cont.90132:
	j	bnei_cont.90124
bnei_else.90127:
	addi	%a0, %zero, 0
bnei_cont.90128:
	j	bnei_cont.90124
bnei_else.90123:
	addi	%a0, %zero, 0
bnei_cont.90124:
	beqi	%a0, 0, bnei_else.90133
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.90134
bnei_else.90133:
	addi	%a0, %zero, 0
bnei_cont.90134:
bnei_cont.90120:
bnei_cont.90106:
bnei_cont.90072:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.90135
	flw	%f3, 468(%zero)
	fblt	%f1, %f3, fbgt_else.90137
	addi	%a0, %zero, 0
	j	bnei_cont.90136
fbgt_else.90137:
	addi	%a0, %zero, 1
fbgt_cont.90138:
	j	bnei_cont.90136
bnei_else.90135:
	addi	%a0, %zero, 0
bnei_cont.90136:
	beqi	%a0, 0, bnei_else.90139
	flw	%f3, 467(%zero)
	fadd	%f1, %f1, %f3
	flw	%f3, 78(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f0, %f3, %f0
	flw	%f3, 79(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f3, %f2
	flw	%f3, 80(%zero)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f1, %f4
	lw	%a0, 0(%v1)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	beqi	%a0, -1, bnei_else.90140
	lw	%a0, 12(%a0)
	lw	%a1, 5(%a0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f0, %f3
	lw	%a1, 5(%a0)
	flw	%f4, 1(%a1)
	fsub	%f4, %f2, %f4
	lw	%a1, 5(%a0)
	flw	%f5, 2(%a1)
	fsub	%f5, %f1, %f5
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.90142
	beqi	%a1, 2, bnei_else.90144
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.90146
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.90147
bnei_else.90146:
	fmov	%f3, %f6
bnei_cont.90147:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.90148
	j	bnei_cont.90149
bnei_else.90148:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.90149:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90150
	addi	%a1, %zero, 0
	j	fbgt_cont.90151
fbgt_else.90150:
	addi	%a1, %zero, 1
fbgt_cont.90151:
	beqi	%a0, 0, bnei_else.90152
	beqi	%a1, 0, bnei_else.90154
	addi	%a0, %zero, 0
	j	bnei_cont.90153
bnei_else.90154:
	addi	%a0, %zero, 1
bnei_cont.90155:
	j	bnei_cont.90153
bnei_else.90152:
	add	%a0, %zero, %a1
bnei_cont.90153:
	beqi	%a0, 0, bnei_else.90156
	addi	%a0, %zero, 0
	j	bnei_cont.90143
bnei_else.90156:
	addi	%a0, %zero, 1
bnei_cont.90157:
	j	bnei_cont.90143
bnei_else.90144:
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90158
	addi	%a1, %zero, 0
	j	fbgt_cont.90159
fbgt_else.90158:
	addi	%a1, %zero, 1
fbgt_cont.90159:
	beqi	%a0, 0, bnei_else.90160
	beqi	%a1, 0, bnei_else.90162
	addi	%a0, %zero, 0
	j	bnei_cont.90161
bnei_else.90162:
	addi	%a0, %zero, 1
bnei_cont.90163:
	j	bnei_cont.90161
bnei_else.90160:
	add	%a0, %zero, %a1
bnei_cont.90161:
	beqi	%a0, 0, bnei_else.90164
	addi	%a0, %zero, 0
	j	bnei_cont.90165
bnei_else.90164:
	addi	%a0, %zero, 1
bnei_cont.90165:
bnei_cont.90145:
	j	bnei_cont.90143
bnei_else.90142:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.90166
	addi	%a1, %zero, 0
	j	fbgt_cont.90167
fbgt_else.90166:
	addi	%a1, %zero, 1
fbgt_cont.90167:
	beqi	%a1, 0, bnei_else.90168
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.90170
	addi	%a1, %zero, 0
	j	fbgt_cont.90171
fbgt_else.90170:
	addi	%a1, %zero, 1
fbgt_cont.90171:
	beqi	%a1, 0, bnei_else.90172
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.90174
	addi	%a1, %zero, 0
	j	bnei_cont.90169
fbgt_else.90174:
	addi	%a1, %zero, 1
fbgt_cont.90175:
	j	bnei_cont.90169
bnei_else.90172:
	addi	%a1, %zero, 0
bnei_cont.90173:
	j	bnei_cont.90169
bnei_else.90168:
	addi	%a1, %zero, 0
bnei_cont.90169:
	beqi	%a1, 0, bnei_else.90176
	lw	%a0, 6(%a0)
	j	bnei_cont.90177
bnei_else.90176:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.90178
	addi	%a0, %zero, 0
	j	bnei_cont.90179
bnei_else.90178:
	addi	%a0, %zero, 1
bnei_cont.90179:
bnei_cont.90177:
bnei_cont.90143:
	beqi	%a0, 0, bnei_else.90180
	addi	%v0, %zero, 0
	j	bnei_cont.90141
bnei_else.90180:
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	fmov	%f2, %f1
	fmov	%f1, %f29
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	check_all_inside.2907
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
bnei_cont.90181:
	j	bnei_cont.90141
bnei_else.90140:
	addi	%v0, %zero, 1
bnei_cont.90141:
	beqi	%v0, 0, bnei_else.90182
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90182:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2913
bnei_else.90139:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.90183
	addi	%v0, %v0, 1
	j	shadow_check_and_group.2913
bnei_else.90183:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90070:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90184
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.90185
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90185:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90186
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90187
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90187:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90188
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.90189
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90189:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90190
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.90191
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90191:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.90190:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90188:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90186:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.90184:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.90192
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.90193
	lw	%a3, 12(%a2)
	flw	%f0, 138(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	lw	%a2, 187(%a2)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.90195
	beqi	%t0, 2, bnei_else.90197
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90199
	addi	%t0, %zero, 1
	j	fbeq_cont.90200
fbeq_else.90199:
	addi	%t0, %zero, 0
fbeq_cont.90200:
	beqi	%t0, 0, bnei_else.90201
	addi	%a2, %zero, 0
	j	bnei_cont.90196
bnei_else.90201:
	flw	%f5, 1(%a2)
	fmul	%f5, %f5, %f0
	flw	%f6, 2(%a2)
	fmul	%f6, %f6, %f1
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%a2)
	fmul	%f6, %f6, %f2
	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	lw	%t0, 4(%a3)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1
	lw	%t0, 4(%a3)
	flw	%f8, 1(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%t0, 3(%a3)
	beqi	%t0, 0, bnei_else.90203
	fmul	%f7, %f1, %f2
	lw	%t0, 9(%a3)
	flw	%f8, 0(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f2, %f2, %f0
	lw	%t0, 9(%a3)
	flw	%f7, 1(%t0)
	fmul	%f2, %f2, %f7
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1
	lw	%t0, 9(%a3)
	flw	%f1, 2(%t0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.90204
bnei_else.90203:
	fmov	%f0, %f6
bnei_cont.90204:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.90205
	j	bnei_cont.90206
bnei_else.90205:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.90206:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.90207
	addi	%t0, %zero, 0
	j	fbgt_cont.90208
fbgt_else.90207:
	addi	%t0, %zero, 1
fbgt_cont.90208:
	beqi	%t0, 0, bnei_else.90209
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.90211
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.90212
bnei_else.90211:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.90212:
	addi	%a2, %zero, 1
	j	bnei_cont.90210
bnei_else.90209:
	addi	%a2, %zero, 0
bnei_cont.90210:
bnei_cont.90202:
	j	bnei_cont.90196
bnei_else.90197:
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.90213
	addi	%a3, %zero, 0
	j	fbgt_cont.90214
fbgt_else.90213:
	addi	%a3, %zero, 1
fbgt_cont.90214:
	beqi	%a3, 0, bnei_else.90215
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.90216
bnei_else.90215:
	addi	%a2, %zero, 0
bnei_cont.90216:
bnei_cont.90198:
	j	bnei_cont.90196
bnei_else.90195:
	flw	%f3, 0(%a2)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a2)
	fmul	%f3, %f3, %f4
	flw	%f5, 185(%zero)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.90217
	addi	%t0, %zero, 0
	j	fbgt_cont.90218
fbgt_else.90217:
	addi	%t0, %zero, 1
fbgt_cont.90218:
	beqi	%t0, 0, bnei_else.90219
	flw	%f6, 186(%zero)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.90221
	addi	%t0, %zero, 0
	j	fbgt_cont.90222
fbgt_else.90221:
	addi	%t0, %zero, 1
fbgt_cont.90222:
	beqi	%t0, 0, bnei_else.90223
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.90225
	addi	%t0, %zero, 1
	j	fbeq_cont.90226
fbeq_else.90225:
	addi	%t0, %zero, 0
fbeq_cont.90226:
	beqi	%t0, 0, bnei_else.90227
	addi	%t0, %zero, 0
	j	bnei_cont.90220
bnei_else.90227:
	addi	%t0, %zero, 1
bnei_cont.90228:
	j	bnei_cont.90220
bnei_else.90223:
	addi	%t0, %zero, 0
bnei_cont.90224:
	j	bnei_cont.90220
bnei_else.90219:
	addi	%t0, %zero, 0
bnei_cont.90220:
	beqi	%t0, 0, bnei_else.90229
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.90230
bnei_else.90229:
	flw	%f3, 2(%a2)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a2)
	fmul	%f3, %f3, %f4
	flw	%f6, 184(%zero)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.90231
	addi	%t0, %zero, 0
	j	fbgt_cont.90232
fbgt_else.90231:
	addi	%t0, %zero, 1
fbgt_cont.90232:
	beqi	%t0, 0, bnei_else.90233
	flw	%f7, 186(%zero)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.90235
	addi	%t0, %zero, 0
	j	fbgt_cont.90236
fbgt_else.90235:
	addi	%t0, %zero, 1
fbgt_cont.90236:
	beqi	%t0, 0, bnei_else.90237
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.90239
	addi	%t0, %zero, 1
	j	fbeq_cont.90240
fbeq_else.90239:
	addi	%t0, %zero, 0
fbeq_cont.90240:
	beqi	%t0, 0, bnei_else.90241
	addi	%t0, %zero, 0
	j	bnei_cont.90234
bnei_else.90241:
	addi	%t0, %zero, 1
bnei_cont.90242:
	j	bnei_cont.90234
bnei_else.90237:
	addi	%t0, %zero, 0
bnei_cont.90238:
	j	bnei_cont.90234
bnei_else.90233:
	addi	%t0, %zero, 0
bnei_cont.90234:
	beqi	%t0, 0, bnei_else.90243
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 2
	j	bnei_cont.90244
bnei_else.90243:
	flw	%f3, 4(%a2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f4, 0(%a2)
	fblt	%f0, %f4, fbgt_else.90245
	addi	%a2, %zero, 0
	j	fbgt_cont.90246
fbgt_else.90245:
	addi	%a2, %zero, 1
fbgt_cont.90246:
	beqi	%a2, 0, bnei_else.90247
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f1, 1(%a2)
	fblt	%f0, %f1, fbgt_else.90249
	addi	%a2, %zero, 0
	j	fbgt_cont.90250
fbgt_else.90249:
	addi	%a2, %zero, 1
fbgt_cont.90250:
	beqi	%a2, 0, bnei_else.90251
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.90253
	addi	%a2, %zero, 1
	j	fbeq_cont.90254
fbeq_else.90253:
	addi	%a2, %zero, 0
fbeq_cont.90254:
	beqi	%a2, 0, bnei_else.90255
	addi	%a2, %zero, 0
	j	bnei_cont.90248
bnei_else.90255:
	addi	%a2, %zero, 1
bnei_cont.90256:
	j	bnei_cont.90248
bnei_else.90251:
	addi	%a2, %zero, 0
bnei_cont.90252:
	j	bnei_cont.90248
bnei_else.90247:
	addi	%a2, %zero, 0
bnei_cont.90248:
	beqi	%a2, 0, bnei_else.90257
	fsw	%f2, 135(%zero)
	addi	%a2, %zero, 3
	j	bnei_cont.90258
bnei_else.90257:
	addi	%a2, %zero, 0
bnei_cont.90258:
bnei_cont.90244:
bnei_cont.90230:
bnei_cont.90196:
	beqi	%a2, 0, bnei_else.90259
	flw	%f0, 135(%zero)
	flw	%f1, 466(%zero)
	fblt	%f0, %f1, fbgt_else.90261
	addi	%a2, %zero, 0
	j	fbgt_cont.90262
fbgt_else.90261:
	addi	%a2, %zero, 1
fbgt_cont.90262:
	beqi	%a2, 0, bnei_else.90263
	lw	%a2, 1(%a0)
	beqi	%a2, -1, bnei_else.90265
	lw	%a2, 83(%a2)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90267
	addi	%v0, %zero, 1
	j	bnei_cont.90266
bnei_else.90267:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90269
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90271
	addi	%v0, %zero, 1
	j	bnei_cont.90270
bnei_else.90271:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90273
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90275
	addi	%v0, %zero, 1
	j	bnei_cont.90274
bnei_else.90275:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.90276:
	j	bnei_cont.90274
bnei_else.90273:
	addi	%v0, %zero, 0
bnei_cont.90274:
bnei_cont.90272:
	j	bnei_cont.90270
bnei_else.90269:
	addi	%v0, %zero, 0
bnei_cont.90270:
bnei_cont.90268:
	j	bnei_cont.90266
bnei_else.90265:
	addi	%v0, %zero, 0
bnei_cont.90266:
	beqi	%v0, 0, bnei_else.90277
	addi	%v0, %zero, 1
	j	bnei_cont.90194
bnei_else.90277:
	addi	%v0, %zero, 0
bnei_cont.90278:
	j	bnei_cont.90194
bnei_else.90263:
	addi	%v0, %zero, 0
bnei_cont.90264:
	j	bnei_cont.90194
bnei_else.90259:
	addi	%v0, %zero, 0
bnei_cont.90260:
	j	bnei_cont.90194
bnei_else.90193:
	addi	%v0, %zero, 1
bnei_cont.90194:
	beqi	%v0, 0, bnei_else.90279
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.90280
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90282
	addi	%v0, %zero, 1
	j	bnei_cont.90281
bnei_else.90282:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90284
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90286
	addi	%v0, %zero, 1
	j	bnei_cont.90285
bnei_else.90286:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90288
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.90290
	addi	%v0, %zero, 1
	j	bnei_cont.90289
bnei_else.90290:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.90291:
	j	bnei_cont.90289
bnei_else.90288:
	addi	%v0, %zero, 0
bnei_cont.90289:
bnei_cont.90287:
	j	bnei_cont.90285
bnei_else.90284:
	addi	%v0, %zero, 0
bnei_cont.90285:
bnei_cont.90283:
	j	bnei_cont.90281
bnei_else.90280:
	addi	%v0, %zero, 0
bnei_cont.90281:
	beqi	%v0, 0, bnei_else.90292
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.90292:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.90279:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.90192:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.90293
	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f1, %f0, %f1
	addi	%a3, %zero, 1
	flw	%f2, 160(%zero)
	lw	%t0, 5(%a2)
	flw	%f3, 1(%t0)
	fsub	%f3, %f2, %f3
	flw	%f4, 161(%zero)
	lw	%t0, 5(%a2)
	flw	%f5, 2(%t0)
	fsub	%f5, %f4, %f5
	lw	%t0, 1(%a2)
	beqi	%t0, 1, bnei_else.90294
	beqi	%t0, 2, bnei_else.90296
	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)
	flw	%f8, 2(%a0)
	fmul	%f9, %f6, %f6
	lw	%t0, 4(%a2)
	flw	%f10, 0(%t0)
	fmul	%f9, %f9, %f10
	fmul	%f11, %f7, %f7
	lw	%t0, 4(%a2)
	flw	%f12, 1(%t0)
	fmul	%f11, %f11, %f12
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f8
	lw	%t0, 4(%a2)
	flw	%f13, 2(%t0)
	fmul	%f11, %f11, %f13
	fadd	%f9, %f9, %f11
	lw	%t0, 3(%a2)
	beqi	%t0, 0, bnei_else.90298
	fmul	%f11, %f7, %f8
	lw	%t1, 9(%a2)
	flw	%f14, 0(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f6
	lw	%t1, 9(%a2)
	flw	%f14, 1(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	fmul	%f11, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f14, 2(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	j	bnei_cont.90299
bnei_else.90298:
bnei_cont.90299:
	flw	%f11, 493(%zero)
	fbne	%f9, %f11, fbeq_else.90300
	addi	%t1, %zero, 1
	j	fbeq_cont.90301
fbeq_else.90300:
	addi	%t1, %zero, 0
fbeq_cont.90301:
	beqi	%t1, 0, bnei_else.90302
	addi	%t0, %zero, 0
	j	bnei_cont.90295
bnei_else.90302:
	fmul	%f14, %f6, %f1
	fmul	%f14, %f14, %f10
	fmul	%f15, %f7, %f3
	fmul	%f15, %f15, %f12
	fadd	%f14, %f14, %f15
	fmul	%f15, %f8, %f5
	fmul	%f15, %f15, %f13
	fadd	%f14, %f14, %f15
	beqi	%t0, 0, bnei_else.90304
	fmul	%f15, %f8, %f3
	fmul	%f16, %f7, %f5
	fadd	%f15, %f15, %f16
	lw	%t1, 9(%a2)
	flw	%f16, 0(%t1)
	fmul	%f15, %f15, %f16
	fmul	%f16, %f6, %f5
	fmul	%f8, %f8, %f1
	fadd	%f8, %f16, %f8
	lw	%t1, 9(%a2)
	flw	%f16, 1(%t1)
	fmul	%f8, %f8, %f16
	fadd	%f8, %f15, %f8
	fmul	%f6, %f6, %f3
	fmul	%f7, %f7, %f1
	fadd	%f6, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f7, 2(%t1)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f8, %f6
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f14, %f6
	j	bnei_cont.90305
bnei_else.90304:
	fmov	%f6, %f14
bnei_cont.90305:
	fmul	%f7, %f1, %f1
	fmul	%f7, %f7, %f10
	fmul	%f8, %f3, %f3
	fmul	%f8, %f8, %f12
	fadd	%f7, %f7, %f8
	fmul	%f8, %f5, %f5
	fmul	%f8, %f8, %f13
	fadd	%f7, %f7, %f8
	beqi	%t0, 0, bnei_else.90306
	fmul	%f8, %f3, %f5
	lw	%t0, 9(%a2)
	flw	%f10, 0(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f7, %f7, %f8
	fmul	%f5, %f5, %f1
	lw	%t0, 9(%a2)
	flw	%f8, 1(%t0)
	fmul	%f5, %f5, %f8
	fadd	%f5, %f7, %f5
	fmul	%f1, %f1, %f3
	lw	%t0, 9(%a2)
	flw	%f3, 2(%t0)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f5, %f1
	j	bnei_cont.90307
bnei_else.90306:
	fmov	%f1, %f7
bnei_cont.90307:
	lw	%t0, 1(%a2)
	beqi	%t0, 3, bnei_else.90308
	j	bnei_cont.90309
bnei_else.90308:
	flw	%f3, 491(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.90309:
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1
	fsub	%f1, %f3, %f1
	fblt	%f11, %f1, fbgt_else.90310
	addi	%t0, %zero, 0
	j	fbgt_cont.90311
fbgt_else.90310:
	addi	%t0, %zero, 1
fbgt_cont.90311:
	beqi	%t0, 0, bnei_else.90312
	fsqrt	%f1, %f1
	lw	%t0, 6(%a2)
	beqi	%t0, 0, bnei_else.90314
	j	bnei_cont.90315
bnei_else.90314:
	fneg	%f1, %f1
bnei_cont.90315:
	fsub	%f1, %f1, %f6
	fdiv	%f1, %f1, %f9
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90313
bnei_else.90312:
	addi	%t0, %zero, 0
bnei_cont.90313:
bnei_cont.90303:
	j	bnei_cont.90295
bnei_else.90296:
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	flw	%f8, 1(%a0)
	flw	%f9, 1(%t0)
	fmul	%f8, %f8, %f9
	fadd	%f6, %f6, %f8
	flw	%f8, 2(%a0)
	flw	%f10, 2(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f6, %f6, %f8
	flw	%f8, 493(%zero)
	fblt	%f8, %f6, fbgt_else.90316
	addi	%t0, %zero, 0
	j	fbgt_cont.90317
fbgt_else.90316:
	addi	%t0, %zero, 1
fbgt_cont.90317:
	beqi	%t0, 0, bnei_else.90318
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90319
bnei_else.90318:
	addi	%t0, %zero, 0
bnei_cont.90319:
bnei_cont.90297:
	j	bnei_cont.90295
bnei_else.90294:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.90320
	addi	%t0, %zero, 1
	j	fbeq_cont.90321
fbeq_else.90320:
	addi	%t0, %zero, 0
fbeq_cont.90321:
	beqi	%t0, 0, bnei_else.90322
	addi	%t0, %zero, 0
	j	bnei_cont.90323
bnei_else.90322:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f6, %f7, fbgt_else.90324
	addi	%t2, %zero, 0
	j	fbgt_cont.90325
fbgt_else.90324:
	addi	%t2, %zero, 1
fbgt_cont.90325:
	beqi	%t1, 0, bnei_else.90326
	beqi	%t2, 0, bnei_else.90328
	addi	%t1, %zero, 0
	j	bnei_cont.90327
bnei_else.90328:
	addi	%t1, %zero, 1
bnei_cont.90329:
	j	bnei_cont.90327
bnei_else.90326:
	add	%t1, %zero, %t2
bnei_cont.90327:
	flw	%f8, 0(%t0)
	beqi	%t1, 0, bnei_else.90330
	j	bnei_cont.90331
bnei_else.90330:
	fneg	%f8, %f8
bnei_cont.90331:
	fsub	%f8, %f8, %f1
	fdiv	%f8, %f8, %f6
	flw	%f9, 1(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	flw	%f10, 1(%t0)
	fblt	%f9, %f10, fbgt_else.90332
	addi	%t1, %zero, 0
	j	fbgt_cont.90333
fbgt_else.90332:
	addi	%t1, %zero, 1
fbgt_cont.90333:
	beqi	%t1, 0, bnei_else.90334
	flw	%f9, 2(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	flw	%f10, 2(%t0)
	fblt	%f9, %f10, fbgt_else.90336
	addi	%t0, %zero, 0
	j	fbgt_cont.90337
fbgt_else.90336:
	addi	%t0, %zero, 1
fbgt_cont.90337:
	beqi	%t0, 0, bnei_else.90338
	fsw	%f8, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90335
bnei_else.90338:
	addi	%t0, %zero, 0
bnei_cont.90339:
	j	bnei_cont.90335
bnei_else.90334:
	addi	%t0, %zero, 0
bnei_cont.90335:
bnei_cont.90323:
	beqi	%t0, 0, bnei_else.90340
	addi	%t0, %zero, 1
	j	bnei_cont.90341
bnei_else.90340:
	flw	%f8, 1(%a0)
	fbne	%f8, %f7, fbeq_else.90342
	addi	%t0, %zero, 1
	j	fbeq_cont.90343
fbeq_else.90342:
	addi	%t0, %zero, 0
fbeq_cont.90343:
	beqi	%t0, 0, bnei_else.90344
	addi	%t0, %zero, 0
	j	bnei_cont.90345
bnei_else.90344:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f8, %f7, fbgt_else.90346
	addi	%t2, %zero, 0
	j	fbgt_cont.90347
fbgt_else.90346:
	addi	%t2, %zero, 1
fbgt_cont.90347:
	beqi	%t1, 0, bnei_else.90348
	beqi	%t2, 0, bnei_else.90350
	addi	%t1, %zero, 0
	j	bnei_cont.90349
bnei_else.90350:
	addi	%t1, %zero, 1
bnei_cont.90351:
	j	bnei_cont.90349
bnei_else.90348:
	add	%t1, %zero, %t2
bnei_cont.90349:
	flw	%f9, 1(%t0)
	beqi	%t1, 0, bnei_else.90352
	j	bnei_cont.90353
bnei_else.90352:
	fneg	%f9, %f9
bnei_cont.90353:
	fsub	%f9, %f9, %f3
	fdiv	%f9, %f9, %f8
	flw	%f10, 2(%a0)
	fmul	%f10, %f9, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	flw	%f11, 2(%t0)
	fblt	%f10, %f11, fbgt_else.90354
	addi	%t1, %zero, 0
	j	fbgt_cont.90355
fbgt_else.90354:
	addi	%t1, %zero, 1
fbgt_cont.90355:
	beqi	%t1, 0, bnei_else.90356
	fmul	%f10, %f9, %f6
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	flw	%f11, 0(%t0)
	fblt	%f10, %f11, fbgt_else.90358
	addi	%t0, %zero, 0
	j	fbgt_cont.90359
fbgt_else.90358:
	addi	%t0, %zero, 1
fbgt_cont.90359:
	beqi	%t0, 0, bnei_else.90360
	fsw	%f9, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90357
bnei_else.90360:
	addi	%t0, %zero, 0
bnei_cont.90361:
	j	bnei_cont.90357
bnei_else.90356:
	addi	%t0, %zero, 0
bnei_cont.90357:
bnei_cont.90345:
	beqi	%t0, 0, bnei_else.90362
	addi	%t0, %zero, 2
	j	bnei_cont.90363
bnei_else.90362:
	flw	%f9, 2(%a0)
	fbne	%f9, %f7, fbeq_else.90364
	addi	%t0, %zero, 1
	j	fbeq_cont.90365
fbeq_else.90364:
	addi	%t0, %zero, 0
fbeq_cont.90365:
	beqi	%t0, 0, bnei_else.90366
	addi	%t0, %zero, 0
	j	bnei_cont.90367
bnei_else.90366:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f9, %f7, fbgt_else.90368
	addi	%t2, %zero, 0
	j	fbgt_cont.90369
fbgt_else.90368:
	addi	%t2, %zero, 1
fbgt_cont.90369:
	beqi	%t1, 0, bnei_else.90370
	beqi	%t2, 0, bnei_else.90372
	addi	%t1, %zero, 0
	j	bnei_cont.90371
bnei_else.90372:
	addi	%t1, %zero, 1
bnei_cont.90373:
	j	bnei_cont.90371
bnei_else.90370:
	add	%t1, %zero, %t2
bnei_cont.90371:
	flw	%f7, 2(%t0)
	beqi	%t1, 0, bnei_else.90374
	j	bnei_cont.90375
bnei_else.90374:
	fneg	%f7, %f7
bnei_cont.90375:
	fsub	%f5, %f7, %f5
	fdiv	%f5, %f5, %f9
	fmul	%f6, %f5, %f6
	fadd	%f1, %f6, %f1
	fabs	%f1, %f1
	flw	%f6, 0(%t0)
	fblt	%f1, %f6, fbgt_else.90376
	addi	%t1, %zero, 0
	j	fbgt_cont.90377
fbgt_else.90376:
	addi	%t1, %zero, 1
fbgt_cont.90377:
	beqi	%t1, 0, bnei_else.90378
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	flw	%f3, 1(%t0)
	fblt	%f1, %f3, fbgt_else.90380
	addi	%t0, %zero, 0
	j	fbgt_cont.90381
fbgt_else.90380:
	addi	%t0, %zero, 1
fbgt_cont.90381:
	beqi	%t0, 0, bnei_else.90382
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90379
bnei_else.90382:
	addi	%t0, %zero, 0
bnei_cont.90383:
	j	bnei_cont.90379
bnei_else.90378:
	addi	%t0, %zero, 0
bnei_cont.90379:
bnei_cont.90367:
	beqi	%t0, 0, bnei_else.90384
	addi	%t0, %zero, 3
	j	bnei_cont.90385
bnei_else.90384:
	addi	%t0, %zero, 0
bnei_cont.90385:
bnei_cont.90363:
bnei_cont.90341:
bnei_cont.90295:
	beqi	%t0, 0, bnei_else.90386
	flw	%f1, 135(%zero)
	flw	%f3, 493(%zero)
	fblt	%f3, %f1, fbgt_else.90387
	addi	%a2, %zero, 0
	j	fbgt_cont.90388
fbgt_else.90387:
	addi	%a2, %zero, 1
fbgt_cont.90388:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 0, bnei_else.90389
	flw	%f5, 137(%zero)
	fblt	%f1, %f5, fbgt_else.90391
	addi	%a2, %zero, 0
	j	fbgt_cont.90392
fbgt_else.90391:
	addi	%a2, %zero, 1
fbgt_cont.90392:
	beqi	%a2, 0, bnei_else.90393
	flw	%f5, 467(%zero)
	fadd	%f1, %f1, %f5
	flw	%f5, 0(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f0, %f5, %f0
	flw	%f5, 1(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f2, %f5, %f2
	flw	%f5, 2(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f4, %f5, %f4
	lw	%a2, 0(%v1)
	sw	%t0, 3(%sp)
	sw	%a1, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	beqi	%a2, -1, bnei_else.90395
	lw	%a2, 12(%a2)
	lw	%t1, 5(%a2)
	flw	%f5, 0(%t1)
	fsub	%f5, %f0, %f5
	lw	%t1, 5(%a2)
	flw	%f6, 1(%t1)
	fsub	%f6, %f2, %f6
	lw	%t1, 5(%a2)
	flw	%f7, 2(%t1)
	fsub	%f7, %f4, %f7
	lw	%t1, 1(%a2)
	beqi	%t1, 1, bnei_else.90397
	beqi	%t1, 2, bnei_else.90399
	fmul	%f8, %f5, %f5
	lw	%t1, 4(%a2)
	flw	%f9, 0(%t1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%t1, 4(%a2)
	flw	%f10, 1(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%t1, 4(%a2)
	flw	%f10, 2(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%t1, 3(%a2)
	beqi	%t1, 0, bnei_else.90401
	fmul	%f9, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f10, 0(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%t1, 9(%a2)
	flw	%f9, 1(%t1)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%t1, 9(%a2)
	flw	%f6, 2(%t1)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.90402
bnei_else.90401:
	fmov	%f5, %f8
bnei_cont.90402:
	lw	%t1, 1(%a2)
	beqi	%t1, 3, bnei_else.90403
	j	bnei_cont.90404
bnei_else.90403:
	flw	%f6, 491(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.90404:
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.90405
	addi	%t1, %zero, 0
	j	fbgt_cont.90406
fbgt_else.90405:
	addi	%t1, %zero, 1
fbgt_cont.90406:
	beqi	%a2, 0, bnei_else.90407
	beqi	%t1, 0, bnei_else.90409
	addi	%a2, %zero, 0
	j	bnei_cont.90408
bnei_else.90409:
	addi	%a2, %zero, 1
bnei_cont.90410:
	j	bnei_cont.90408
bnei_else.90407:
	add	%a2, %zero, %t1
bnei_cont.90408:
	beqi	%a2, 0, bnei_else.90411
	addi	%a2, %zero, 0
	j	bnei_cont.90398
bnei_else.90411:
	addi	%a2, %zero, 1
bnei_cont.90412:
	j	bnei_cont.90398
bnei_else.90399:
	lw	%t1, 4(%a2)
	flw	%f8, 0(%t1)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%t1)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%t1)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.90413
	addi	%t1, %zero, 0
	j	fbgt_cont.90414
fbgt_else.90413:
	addi	%t1, %zero, 1
fbgt_cont.90414:
	beqi	%a2, 0, bnei_else.90415
	beqi	%t1, 0, bnei_else.90417
	addi	%a2, %zero, 0
	j	bnei_cont.90416
bnei_else.90417:
	addi	%a2, %zero, 1
bnei_cont.90418:
	j	bnei_cont.90416
bnei_else.90415:
	add	%a2, %zero, %t1
bnei_cont.90416:
	beqi	%a2, 0, bnei_else.90419
	addi	%a2, %zero, 0
	j	bnei_cont.90420
bnei_else.90419:
	addi	%a2, %zero, 1
bnei_cont.90420:
bnei_cont.90400:
	j	bnei_cont.90398
bnei_else.90397:
	fabs	%f3, %f5
	lw	%t1, 4(%a2)
	flw	%f5, 0(%t1)
	fblt	%f3, %f5, fbgt_else.90421
	addi	%t1, %zero, 0
	j	fbgt_cont.90422
fbgt_else.90421:
	addi	%t1, %zero, 1
fbgt_cont.90422:
	beqi	%t1, 0, bnei_else.90423
	fabs	%f3, %f6
	lw	%t1, 4(%a2)
	flw	%f5, 1(%t1)
	fblt	%f3, %f5, fbgt_else.90425
	addi	%t1, %zero, 0
	j	fbgt_cont.90426
fbgt_else.90425:
	addi	%t1, %zero, 1
fbgt_cont.90426:
	beqi	%t1, 0, bnei_else.90427
	fabs	%f3, %f7
	lw	%t1, 4(%a2)
	flw	%f5, 2(%t1)
	fblt	%f3, %f5, fbgt_else.90429
	addi	%t1, %zero, 0
	j	bnei_cont.90424
fbgt_else.90429:
	addi	%t1, %zero, 1
fbgt_cont.90430:
	j	bnei_cont.90424
bnei_else.90427:
	addi	%t1, %zero, 0
bnei_cont.90428:
	j	bnei_cont.90424
bnei_else.90423:
	addi	%t1, %zero, 0
bnei_cont.90424:
	beqi	%t1, 0, bnei_else.90431
	lw	%a2, 6(%a2)
	j	bnei_cont.90432
bnei_else.90431:
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.90433
	addi	%a2, %zero, 0
	j	bnei_cont.90434
bnei_else.90433:
	addi	%a2, %zero, 1
bnei_cont.90434:
bnei_cont.90432:
bnei_cont.90398:
	beqi	%a2, 0, bnei_else.90435
	addi	%v0, %zero, 0
	j	bnei_cont.90396
bnei_else.90435:
	addi	%v0, %a3, 0
	fmov	%f1, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.90436:
	j	bnei_cont.90396
bnei_else.90395:
	addi	%v0, %zero, 1
bnei_cont.90396:
	beqi	%v0, 0, bnei_else.90437
	flw	%f0, 8(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 7(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 5(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 4(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.90390
bnei_else.90437:
bnei_cont.90438:
	j	bnei_cont.90390
bnei_else.90393:
bnei_cont.90394:
	j	bnei_cont.90390
bnei_else.90389:
bnei_cont.90390:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2922
bnei_else.90386:
	lw	%a1, 6(%a2)
	beqi	%a1, 0, bnei_else.90439
	addi	%v0, %v0, 1
	j	solve_each_element.2922
bnei_else.90439:
	jr	%ra
bnei_else.90293:
	jr	%ra
solve_one_or_network.2926:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.90442
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90443
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90444
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2922
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90445
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90446
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2922
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90447
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element.2922
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90448
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2922
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90449
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2926
bnei_else.90449:
	jr	%ra
bnei_else.90448:
	jr	%ra
bnei_else.90447:
	jr	%ra
bnei_else.90446:
	jr	%ra
bnei_else.90445:
	jr	%ra
bnei_else.90444:
	jr	%ra
bnei_else.90443:
	jr	%ra
bnei_else.90442:
	jr	%ra
trace_or_matrix.2930:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.90458
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.90459
	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.90461
	beqi	%t0, 2, bnei_else.90463
	flw	%f3, 0(%a0)
	flw	%f4, 1(%a0)
	flw	%f5, 2(%a0)
	fmul	%f6, %f3, %f3
	lw	%t0, 4(%a3)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	fmul	%f8, %f4, %f4
	lw	%t0, 4(%a3)
	flw	%f9, 1(%t0)
	fmul	%f8, %f8, %f9
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f5
	lw	%t0, 4(%a3)
	flw	%f10, 2(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f6, %f6, %f8
	lw	%t0, 3(%a3)
	beqi	%t0, 0, bnei_else.90465
	fmul	%f8, %f4, %f5
	lw	%t1, 9(%a3)
	flw	%f11, 0(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f3
	lw	%t1, 9(%a3)
	flw	%f11, 1(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	fmul	%f8, %f3, %f4
	lw	%t1, 9(%a3)
	flw	%f11, 2(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	j	bnei_cont.90466
bnei_else.90465:
bnei_cont.90466:
	flw	%f8, 493(%zero)
	fbne	%f6, %f8, fbeq_else.90467
	addi	%t1, %zero, 1
	j	fbeq_cont.90468
fbeq_else.90467:
	addi	%t1, %zero, 0
fbeq_cont.90468:
	beqi	%t1, 0, bnei_else.90469
	addi	%a3, %zero, 0
	j	bnei_cont.90462
bnei_else.90469:
	fmul	%f11, %f3, %f0
	fmul	%f11, %f11, %f7
	fmul	%f12, %f4, %f1
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	fmul	%f12, %f5, %f2
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	beqi	%t0, 0, bnei_else.90471
	fmul	%f12, %f5, %f1
	fmul	%f13, %f4, %f2
	fadd	%f12, %f12, %f13
	lw	%t1, 9(%a3)
	flw	%f13, 0(%t1)
	fmul	%f12, %f12, %f13
	fmul	%f13, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f13, %f5
	lw	%t1, 9(%a3)
	flw	%f13, 1(%t1)
	fmul	%f5, %f5, %f13
	fadd	%f5, %f12, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%t1, 9(%a3)
	flw	%f4, 2(%t1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 471(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f11, %f3
	j	bnei_cont.90472
bnei_else.90471:
	fmov	%f3, %f11
bnei_cont.90472:
	fmul	%f4, %f0, %f0
	fmul	%f4, %f4, %f7
	fmul	%f5, %f1, %f1
	fmul	%f5, %f5, %f9
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	fmul	%f5, %f5, %f10
	fadd	%f4, %f4, %f5
	beqi	%t0, 0, bnei_else.90473
	fmul	%f5, %f1, %f2
	lw	%t0, 9(%a3)
	flw	%f7, 0(%t0)
	fmul	%f5, %f5, %f7
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%t0, 9(%a3)
	flw	%f5, 1(%t0)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%t0, 9(%a3)
	flw	%f1, 2(%t0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.90474
bnei_else.90473:
	fmov	%f0, %f4
bnei_cont.90474:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.90475
	j	bnei_cont.90476
bnei_else.90475:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.90476:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f8, %f0, fbgt_else.90477
	addi	%t0, %zero, 0
	j	fbgt_cont.90478
fbgt_else.90477:
	addi	%t0, %zero, 1
fbgt_cont.90478:
	beqi	%t0, 0, bnei_else.90479
	fsqrt	%f0, %f0
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.90481
	j	bnei_cont.90482
bnei_else.90481:
	fneg	%f0, %f0
bnei_cont.90482:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90480
bnei_else.90479:
	addi	%a3, %zero, 0
bnei_cont.90480:
bnei_cont.90470:
	j	bnei_cont.90462
bnei_else.90463:
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a0)
	flw	%f6, 1(%a3)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a0)
	flw	%f7, 2(%a3)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 493(%zero)
	fblt	%f5, %f3, fbgt_else.90483
	addi	%a3, %zero, 0
	j	fbgt_cont.90484
fbgt_else.90483:
	addi	%a3, %zero, 1
fbgt_cont.90484:
	beqi	%a3, 0, bnei_else.90485
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90486
bnei_else.90485:
	addi	%a3, %zero, 0
bnei_cont.90486:
bnei_cont.90464:
	j	bnei_cont.90462
bnei_else.90461:
	flw	%f3, 0(%a0)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90487
	addi	%t0, %zero, 1
	j	fbeq_cont.90488
fbeq_else.90487:
	addi	%t0, %zero, 0
fbeq_cont.90488:
	beqi	%t0, 0, bnei_else.90489
	addi	%t0, %zero, 0
	j	bnei_cont.90490
bnei_else.90489:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f3, %f4, fbgt_else.90491
	addi	%t2, %zero, 0
	j	fbgt_cont.90492
fbgt_else.90491:
	addi	%t2, %zero, 1
fbgt_cont.90492:
	beqi	%t1, 0, bnei_else.90493
	beqi	%t2, 0, bnei_else.90495
	addi	%t1, %zero, 0
	j	bnei_cont.90494
bnei_else.90495:
	addi	%t1, %zero, 1
bnei_cont.90496:
	j	bnei_cont.90494
bnei_else.90493:
	add	%t1, %zero, %t2
bnei_cont.90494:
	flw	%f5, 0(%t0)
	beqi	%t1, 0, bnei_else.90497
	j	bnei_cont.90498
bnei_else.90497:
	fneg	%f5, %f5
bnei_cont.90498:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.90499
	addi	%t1, %zero, 0
	j	fbgt_cont.90500
fbgt_else.90499:
	addi	%t1, %zero, 1
fbgt_cont.90500:
	beqi	%t1, 0, bnei_else.90501
	flw	%f6, 2(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.90503
	addi	%t0, %zero, 0
	j	fbgt_cont.90504
fbgt_else.90503:
	addi	%t0, %zero, 1
fbgt_cont.90504:
	beqi	%t0, 0, bnei_else.90505
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90502
bnei_else.90505:
	addi	%t0, %zero, 0
bnei_cont.90506:
	j	bnei_cont.90502
bnei_else.90501:
	addi	%t0, %zero, 0
bnei_cont.90502:
bnei_cont.90490:
	beqi	%t0, 0, bnei_else.90507
	addi	%a3, %zero, 1
	j	bnei_cont.90508
bnei_else.90507:
	flw	%f5, 1(%a0)
	fbne	%f5, %f4, fbeq_else.90509
	addi	%t0, %zero, 1
	j	fbeq_cont.90510
fbeq_else.90509:
	addi	%t0, %zero, 0
fbeq_cont.90510:
	beqi	%t0, 0, bnei_else.90511
	addi	%t0, %zero, 0
	j	bnei_cont.90512
bnei_else.90511:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f5, %f4, fbgt_else.90513
	addi	%t2, %zero, 0
	j	fbgt_cont.90514
fbgt_else.90513:
	addi	%t2, %zero, 1
fbgt_cont.90514:
	beqi	%t1, 0, bnei_else.90515
	beqi	%t2, 0, bnei_else.90517
	addi	%t1, %zero, 0
	j	bnei_cont.90516
bnei_else.90517:
	addi	%t1, %zero, 1
bnei_cont.90518:
	j	bnei_cont.90516
bnei_else.90515:
	add	%t1, %zero, %t2
bnei_cont.90516:
	flw	%f6, 1(%t0)
	beqi	%t1, 0, bnei_else.90519
	j	bnei_cont.90520
bnei_else.90519:
	fneg	%f6, %f6
bnei_cont.90520:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a0)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.90521
	addi	%t1, %zero, 0
	j	fbgt_cont.90522
fbgt_else.90521:
	addi	%t1, %zero, 1
fbgt_cont.90522:
	beqi	%t1, 0, bnei_else.90523
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.90525
	addi	%t0, %zero, 0
	j	fbgt_cont.90526
fbgt_else.90525:
	addi	%t0, %zero, 1
fbgt_cont.90526:
	beqi	%t0, 0, bnei_else.90527
	fsw	%f6, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90524
bnei_else.90527:
	addi	%t0, %zero, 0
bnei_cont.90528:
	j	bnei_cont.90524
bnei_else.90523:
	addi	%t0, %zero, 0
bnei_cont.90524:
bnei_cont.90512:
	beqi	%t0, 0, bnei_else.90529
	addi	%a3, %zero, 2
	j	bnei_cont.90530
bnei_else.90529:
	flw	%f6, 2(%a0)
	fbne	%f6, %f4, fbeq_else.90531
	addi	%t0, %zero, 1
	j	fbeq_cont.90532
fbeq_else.90531:
	addi	%t0, %zero, 0
fbeq_cont.90532:
	beqi	%t0, 0, bnei_else.90533
	addi	%a3, %zero, 0
	j	bnei_cont.90534
bnei_else.90533:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	fblt	%f6, %f4, fbgt_else.90535
	addi	%t1, %zero, 0
	j	fbgt_cont.90536
fbgt_else.90535:
	addi	%t1, %zero, 1
fbgt_cont.90536:
	beqi	%a3, 0, bnei_else.90537
	beqi	%t1, 0, bnei_else.90539
	addi	%a3, %zero, 0
	j	bnei_cont.90538
bnei_else.90539:
	addi	%a3, %zero, 1
bnei_cont.90540:
	j	bnei_cont.90538
bnei_else.90537:
	add	%a3, %zero, %t1
bnei_cont.90538:
	flw	%f4, 2(%t0)
	beqi	%a3, 0, bnei_else.90541
	j	bnei_cont.90542
bnei_else.90541:
	fneg	%f4, %f4
bnei_cont.90542:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%t0)
	fblt	%f0, %f3, fbgt_else.90543
	addi	%a3, %zero, 0
	j	fbgt_cont.90544
fbgt_else.90543:
	addi	%a3, %zero, 1
fbgt_cont.90544:
	beqi	%a3, 0, bnei_else.90545
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.90547
	addi	%a3, %zero, 0
	j	fbgt_cont.90548
fbgt_else.90547:
	addi	%a3, %zero, 1
fbgt_cont.90548:
	beqi	%a3, 0, bnei_else.90549
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90546
bnei_else.90549:
	addi	%a3, %zero, 0
bnei_cont.90550:
	j	bnei_cont.90546
bnei_else.90545:
	addi	%a3, %zero, 0
bnei_cont.90546:
bnei_cont.90534:
	beqi	%a3, 0, bnei_else.90551
	addi	%a3, %zero, 3
	j	bnei_cont.90552
bnei_else.90551:
	addi	%a3, %zero, 0
bnei_cont.90552:
bnei_cont.90530:
bnei_cont.90508:
bnei_cont.90462:
	beqi	%a3, 0, bnei_else.90553
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.90555
	addi	%a3, %zero, 0
	j	fbgt_cont.90556
fbgt_else.90555:
	addi	%a3, %zero, 1
fbgt_cont.90556:
	beqi	%a3, 0, bnei_else.90557
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.90559
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90561
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90563
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90565
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90567
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90569
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.90571
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.90460
bnei_else.90571:
bnei_cont.90572:
	j	bnei_cont.90460
bnei_else.90569:
bnei_cont.90570:
	j	bnei_cont.90460
bnei_else.90567:
bnei_cont.90568:
	j	bnei_cont.90460
bnei_else.90565:
bnei_cont.90566:
	j	bnei_cont.90460
bnei_else.90563:
bnei_cont.90564:
	j	bnei_cont.90460
bnei_else.90561:
bnei_cont.90562:
	j	bnei_cont.90460
bnei_else.90559:
bnei_cont.90560:
	j	bnei_cont.90460
bnei_else.90557:
bnei_cont.90558:
	j	bnei_cont.90460
bnei_else.90553:
bnei_cont.90554:
	j	bnei_cont.90460
bnei_else.90459:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.90573
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90575
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90577
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90579
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90581
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90583
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.90585
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.90574
bnei_else.90585:
bnei_cont.90586:
	j	bnei_cont.90574
bnei_else.90583:
bnei_cont.90584:
	j	bnei_cont.90574
bnei_else.90581:
bnei_cont.90582:
	j	bnei_cont.90574
bnei_else.90579:
bnei_cont.90580:
	j	bnei_cont.90574
bnei_else.90577:
bnei_cont.90578:
	j	bnei_cont.90574
bnei_else.90575:
bnei_cont.90576:
	j	bnei_cont.90574
bnei_else.90573:
bnei_cont.90574:
bnei_cont.90460:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.90587
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.90588
	lw	%a1, 12(%a1)
	flw	%f0, 159(%zero)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	lw	%a2, 5(%a1)
	flw	%f2, 1(%a2)
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%a2, 5(%a1)
	flw	%f3, 2(%a2)
	fsub	%f2, %f2, %f3
	lw	%a2, 1(%a1)
	beqi	%a2, 1, bnei_else.90590
	beqi	%a2, 2, bnei_else.90592
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)
	flw	%f5, 2(%a2)
	fmul	%f6, %f3, %f3
	lw	%a3, 4(%a1)
	flw	%f7, 0(%a3)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a3, 4(%a1)
	flw	%f8, 1(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f8, 2(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.90594
	fmul	%f7, %f4, %f5
	lw	%a3, 9(%a1)
	flw	%f8, 0(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3
	lw	%a3, 9(%a1)
	flw	%f8, 1(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4
	lw	%a3, 9(%a1)
	flw	%f8, 2(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	j	bnei_cont.90595
bnei_else.90594:
bnei_cont.90595:
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.90596
	addi	%a3, %zero, 1
	j	fbeq_cont.90597
fbeq_else.90596:
	addi	%a3, %zero, 0
fbeq_cont.90597:
	beqi	%a3, 0, bnei_else.90598
	addi	%a1, %zero, 0
	j	bnei_cont.90591
bnei_else.90598:
	fmul	%f8, %f3, %f0
	lw	%a3, 4(%a1)
	flw	%f9, 0(%a3)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.90600
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	fadd	%f9, %f9, %f10
	lw	%a3, 9(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f10, %f5
	lw	%a3, 9(%a1)
	flw	%f10, 1(%a3)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%a3, 9(%a1)
	flw	%f4, 2(%a3)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 471(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.90601
bnei_else.90600:
	fmov	%f3, %f8
bnei_cont.90601:
	fmul	%f4, %f0, %f0
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	lw	%a3, 4(%a1)
	flw	%f8, 1(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	lw	%a3, 4(%a1)
	flw	%f8, 2(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.90602
	fmul	%f5, %f1, %f2
	lw	%a3, 9(%a1)
	flw	%f8, 0(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%a3, 9(%a1)
	flw	%f5, 1(%a3)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%a3, 9(%a1)
	flw	%f1, 2(%a3)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.90603
bnei_else.90602:
	fmov	%f0, %f4
bnei_cont.90603:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.90604
	j	bnei_cont.90605
bnei_else.90604:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.90605:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.90606
	addi	%a3, %zero, 0
	j	fbgt_cont.90607
fbgt_else.90606:
	addi	%a3, %zero, 1
fbgt_cont.90607:
	beqi	%a3, 0, bnei_else.90608
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.90610
	j	bnei_cont.90611
bnei_else.90610:
	fneg	%f0, %f0
bnei_cont.90611:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.90609
bnei_else.90608:
	addi	%a1, %zero, 0
bnei_cont.90609:
bnei_cont.90599:
	j	bnei_cont.90591
bnei_else.90592:
	lw	%a1, 4(%a1)
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 0(%a1)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a2)
	flw	%f6, 1(%a1)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a2)
	flw	%f7, 2(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 493(%zero)
	fblt	%f5, %f3, fbgt_else.90612
	addi	%a1, %zero, 0
	j	fbgt_cont.90613
fbgt_else.90612:
	addi	%a1, %zero, 1
fbgt_cont.90613:
	beqi	%a1, 0, bnei_else.90614
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.90615
bnei_else.90614:
	addi	%a1, %zero, 0
bnei_cont.90615:
bnei_cont.90593:
	j	bnei_cont.90591
bnei_else.90590:
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90616
	addi	%a3, %zero, 1
	j	fbeq_cont.90617
fbeq_else.90616:
	addi	%a3, %zero, 0
fbeq_cont.90617:
	beqi	%a3, 0, bnei_else.90618
	addi	%a3, %zero, 0
	j	bnei_cont.90619
bnei_else.90618:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f3, %f4, fbgt_else.90620
	addi	%t1, %zero, 0
	j	fbgt_cont.90621
fbgt_else.90620:
	addi	%t1, %zero, 1
fbgt_cont.90621:
	beqi	%t0, 0, bnei_else.90622
	beqi	%t1, 0, bnei_else.90624
	addi	%t0, %zero, 0
	j	bnei_cont.90623
bnei_else.90624:
	addi	%t0, %zero, 1
bnei_cont.90625:
	j	bnei_cont.90623
bnei_else.90622:
	add	%t0, %zero, %t1
bnei_cont.90623:
	flw	%f5, 0(%a3)
	beqi	%t0, 0, bnei_else.90626
	j	bnei_cont.90627
bnei_else.90626:
	fneg	%f5, %f5
bnei_cont.90627:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a3)
	fblt	%f6, %f7, fbgt_else.90628
	addi	%t0, %zero, 0
	j	fbgt_cont.90629
fbgt_else.90628:
	addi	%t0, %zero, 1
fbgt_cont.90629:
	beqi	%t0, 0, bnei_else.90630
	flw	%f6, 2(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a3)
	fblt	%f6, %f7, fbgt_else.90632
	addi	%a3, %zero, 0
	j	fbgt_cont.90633
fbgt_else.90632:
	addi	%a3, %zero, 1
fbgt_cont.90633:
	beqi	%a3, 0, bnei_else.90634
	fsw	%f5, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90631
bnei_else.90634:
	addi	%a3, %zero, 0
bnei_cont.90635:
	j	bnei_cont.90631
bnei_else.90630:
	addi	%a3, %zero, 0
bnei_cont.90631:
bnei_cont.90619:
	beqi	%a3, 0, bnei_else.90636
	addi	%a1, %zero, 1
	j	bnei_cont.90637
bnei_else.90636:
	flw	%f5, 1(%a2)
	fbne	%f5, %f4, fbeq_else.90638
	addi	%a3, %zero, 1
	j	fbeq_cont.90639
fbeq_else.90638:
	addi	%a3, %zero, 0
fbeq_cont.90639:
	beqi	%a3, 0, bnei_else.90640
	addi	%a3, %zero, 0
	j	bnei_cont.90641
bnei_else.90640:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f5, %f4, fbgt_else.90642
	addi	%t1, %zero, 0
	j	fbgt_cont.90643
fbgt_else.90642:
	addi	%t1, %zero, 1
fbgt_cont.90643:
	beqi	%t0, 0, bnei_else.90644
	beqi	%t1, 0, bnei_else.90646
	addi	%t0, %zero, 0
	j	bnei_cont.90645
bnei_else.90646:
	addi	%t0, %zero, 1
bnei_cont.90647:
	j	bnei_cont.90645
bnei_else.90644:
	add	%t0, %zero, %t1
bnei_cont.90645:
	flw	%f6, 1(%a3)
	beqi	%t0, 0, bnei_else.90648
	j	bnei_cont.90649
bnei_else.90648:
	fneg	%f6, %f6
bnei_cont.90649:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a2)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a3)
	fblt	%f7, %f8, fbgt_else.90650
	addi	%t0, %zero, 0
	j	fbgt_cont.90651
fbgt_else.90650:
	addi	%t0, %zero, 1
fbgt_cont.90651:
	beqi	%t0, 0, bnei_else.90652
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a3)
	fblt	%f7, %f8, fbgt_else.90654
	addi	%a3, %zero, 0
	j	fbgt_cont.90655
fbgt_else.90654:
	addi	%a3, %zero, 1
fbgt_cont.90655:
	beqi	%a3, 0, bnei_else.90656
	fsw	%f6, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90653
bnei_else.90656:
	addi	%a3, %zero, 0
bnei_cont.90657:
	j	bnei_cont.90653
bnei_else.90652:
	addi	%a3, %zero, 0
bnei_cont.90653:
bnei_cont.90641:
	beqi	%a3, 0, bnei_else.90658
	addi	%a1, %zero, 2
	j	bnei_cont.90659
bnei_else.90658:
	flw	%f6, 2(%a2)
	fbne	%f6, %f4, fbeq_else.90660
	addi	%a3, %zero, 1
	j	fbeq_cont.90661
fbeq_else.90660:
	addi	%a3, %zero, 0
fbeq_cont.90661:
	beqi	%a3, 0, bnei_else.90662
	addi	%a1, %zero, 0
	j	bnei_cont.90663
bnei_else.90662:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f6, %f4, fbgt_else.90664
	addi	%t0, %zero, 0
	j	fbgt_cont.90665
fbgt_else.90664:
	addi	%t0, %zero, 1
fbgt_cont.90665:
	beqi	%a1, 0, bnei_else.90666
	beqi	%t0, 0, bnei_else.90668
	addi	%a1, %zero, 0
	j	bnei_cont.90667
bnei_else.90668:
	addi	%a1, %zero, 1
bnei_cont.90669:
	j	bnei_cont.90667
bnei_else.90666:
	add	%a1, %zero, %t0
bnei_cont.90667:
	flw	%f4, 2(%a3)
	beqi	%a1, 0, bnei_else.90670
	j	bnei_cont.90671
bnei_else.90670:
	fneg	%f4, %f4
bnei_cont.90671:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%a3)
	fblt	%f0, %f3, fbgt_else.90672
	addi	%a1, %zero, 0
	j	fbgt_cont.90673
fbgt_else.90672:
	addi	%a1, %zero, 1
fbgt_cont.90673:
	beqi	%a1, 0, bnei_else.90674
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.90676
	addi	%a1, %zero, 0
	j	fbgt_cont.90677
fbgt_else.90676:
	addi	%a1, %zero, 1
fbgt_cont.90677:
	beqi	%a1, 0, bnei_else.90678
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.90675
bnei_else.90678:
	addi	%a1, %zero, 0
bnei_cont.90679:
	j	bnei_cont.90675
bnei_else.90674:
	addi	%a1, %zero, 0
bnei_cont.90675:
bnei_cont.90663:
	beqi	%a1, 0, bnei_else.90680
	addi	%a1, %zero, 3
	j	bnei_cont.90681
bnei_else.90680:
	addi	%a1, %zero, 0
bnei_cont.90681:
bnei_cont.90659:
bnei_cont.90637:
bnei_cont.90591:
	beqi	%a1, 0, bnei_else.90682
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.90684
	addi	%a1, %zero, 0
	j	fbgt_cont.90685
fbgt_else.90684:
	addi	%a1, %zero, 1
fbgt_cont.90685:
	beqi	%a1, 0, bnei_else.90686
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.90688
	lw	%a1, 83(%a1)
	lw	%a3, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90690
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90692
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90694
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90696
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90698
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.90589
bnei_else.90698:
bnei_cont.90699:
	j	bnei_cont.90589
bnei_else.90696:
bnei_cont.90697:
	j	bnei_cont.90589
bnei_else.90694:
bnei_cont.90695:
	j	bnei_cont.90589
bnei_else.90692:
bnei_cont.90693:
	j	bnei_cont.90589
bnei_else.90690:
bnei_cont.90691:
	j	bnei_cont.90589
bnei_else.90688:
bnei_cont.90689:
	j	bnei_cont.90589
bnei_else.90686:
bnei_cont.90687:
	j	bnei_cont.90589
bnei_else.90682:
bnei_cont.90683:
	j	bnei_cont.90589
bnei_else.90588:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.90700
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90702
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90704
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90706
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90708
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90710
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.90701
bnei_else.90710:
bnei_cont.90711:
	j	bnei_cont.90701
bnei_else.90708:
bnei_cont.90709:
	j	bnei_cont.90701
bnei_else.90706:
bnei_cont.90707:
	j	bnei_cont.90701
bnei_else.90704:
bnei_cont.90705:
	j	bnei_cont.90701
bnei_else.90702:
bnei_cont.90703:
	j	bnei_cont.90701
bnei_else.90700:
bnei_cont.90701:
bnei_cont.90589:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2930
bnei_else.90587:
	jr	%ra
bnei_else.90458:
	jr	%ra
solve_each_element_fast.2936:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.90714
	lw	%a3, 12(%a2)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	addi	%t1, %zero, 1
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a2
	lw	%t2, 0(%at)
	lw	%t3, 1(%a3)
	beqi	%t3, 1, bnei_else.90715
	beqi	%t3, 2, bnei_else.90717
	flw	%f3, 0(%t2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90719
	addi	%t3, %zero, 1
	j	fbeq_cont.90720
fbeq_else.90719:
	addi	%t3, %zero, 0
fbeq_cont.90720:
	beqi	%t3, 0, bnei_else.90721
	addi	%t0, %zero, 0
	j	bnei_cont.90716
bnei_else.90721:
	flw	%f5, 1(%t2)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%t2)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t0)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.90723
	addi	%t0, %zero, 0
	j	fbgt_cont.90724
fbgt_else.90723:
	addi	%t0, %zero, 1
fbgt_cont.90724:
	beqi	%t0, 0, bnei_else.90725
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.90727
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.90728
bnei_else.90727:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.90728:
	addi	%t0, %zero, 1
	j	bnei_cont.90726
bnei_else.90725:
	addi	%t0, %zero, 0
bnei_cont.90726:
bnei_cont.90722:
	j	bnei_cont.90716
bnei_else.90717:
	flw	%f0, 0(%t2)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.90729
	addi	%t2, %zero, 0
	j	fbgt_cont.90730
fbgt_else.90729:
	addi	%t2, %zero, 1
fbgt_cont.90730:
	beqi	%t2, 0, bnei_else.90731
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90732
bnei_else.90731:
	addi	%t0, %zero, 0
bnei_cont.90732:
bnei_cont.90718:
	j	bnei_cont.90716
bnei_else.90715:
	lw	%t0, 0(%a0)
	flw	%f3, 0(%t2)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%t2)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%t0)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 1(%t3)
	fblt	%f6, %f7, fbgt_else.90733
	addi	%t3, %zero, 0
	j	fbgt_cont.90734
fbgt_else.90733:
	addi	%t3, %zero, 1
fbgt_cont.90734:
	beqi	%t3, 0, bnei_else.90735
	flw	%f6, 2(%t0)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 2(%t3)
	fblt	%f6, %f7, fbgt_else.90737
	addi	%t3, %zero, 0
	j	fbgt_cont.90738
fbgt_else.90737:
	addi	%t3, %zero, 1
fbgt_cont.90738:
	beqi	%t3, 0, bnei_else.90739
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.90741
	addi	%t3, %zero, 1
	j	fbeq_cont.90742
fbeq_else.90741:
	addi	%t3, %zero, 0
fbeq_cont.90742:
	beqi	%t3, 0, bnei_else.90743
	addi	%t3, %zero, 0
	j	bnei_cont.90736
bnei_else.90743:
	addi	%t3, %zero, 1
bnei_cont.90744:
	j	bnei_cont.90736
bnei_else.90739:
	addi	%t3, %zero, 0
bnei_cont.90740:
	j	bnei_cont.90736
bnei_else.90735:
	addi	%t3, %zero, 0
bnei_cont.90736:
	beqi	%t3, 0, bnei_else.90745
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.90746
bnei_else.90745:
	flw	%f3, 2(%t2)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%t2)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%t0)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t3, 4(%a3)
	flw	%f8, 0(%t3)
	fblt	%f7, %f8, fbgt_else.90747
	addi	%t3, %zero, 0
	j	fbgt_cont.90748
fbgt_else.90747:
	addi	%t3, %zero, 1
fbgt_cont.90748:
	beqi	%t3, 0, bnei_else.90749
	flw	%f7, 2(%t0)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.90751
	addi	%t0, %zero, 0
	j	fbgt_cont.90752
fbgt_else.90751:
	addi	%t0, %zero, 1
fbgt_cont.90752:
	beqi	%t0, 0, bnei_else.90753
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.90755
	addi	%t0, %zero, 1
	j	fbeq_cont.90756
fbeq_else.90755:
	addi	%t0, %zero, 0
fbeq_cont.90756:
	beqi	%t0, 0, bnei_else.90757
	addi	%t0, %zero, 0
	j	bnei_cont.90750
bnei_else.90757:
	addi	%t0, %zero, 1
bnei_cont.90758:
	j	bnei_cont.90750
bnei_else.90753:
	addi	%t0, %zero, 0
bnei_cont.90754:
	j	bnei_cont.90750
bnei_else.90749:
	addi	%t0, %zero, 0
bnei_cont.90750:
	beqi	%t0, 0, bnei_else.90759
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 2
	j	bnei_cont.90760
bnei_else.90759:
	flw	%f3, 4(%t2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f4, 0(%t0)
	fblt	%f0, %f4, fbgt_else.90761
	addi	%t0, %zero, 0
	j	fbgt_cont.90762
fbgt_else.90761:
	addi	%t0, %zero, 1
fbgt_cont.90762:
	beqi	%t0, 0, bnei_else.90763
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.90765
	addi	%t0, %zero, 0
	j	fbgt_cont.90766
fbgt_else.90765:
	addi	%t0, %zero, 1
fbgt_cont.90766:
	beqi	%t0, 0, bnei_else.90767
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.90769
	addi	%t0, %zero, 1
	j	fbeq_cont.90770
fbeq_else.90769:
	addi	%t0, %zero, 0
fbeq_cont.90770:
	beqi	%t0, 0, bnei_else.90771
	addi	%t0, %zero, 0
	j	bnei_cont.90764
bnei_else.90771:
	addi	%t0, %zero, 1
bnei_cont.90772:
	j	bnei_cont.90764
bnei_else.90767:
	addi	%t0, %zero, 0
bnei_cont.90768:
	j	bnei_cont.90764
bnei_else.90763:
	addi	%t0, %zero, 0
bnei_cont.90764:
	beqi	%t0, 0, bnei_else.90773
	fsw	%f2, 135(%zero)
	addi	%t0, %zero, 3
	j	bnei_cont.90774
bnei_else.90773:
	addi	%t0, %zero, 0
bnei_cont.90774:
bnei_cont.90760:
bnei_cont.90746:
bnei_cont.90716:
	beqi	%t0, 0, bnei_else.90775
	flw	%f0, 135(%zero)
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.90776
	addi	%a3, %zero, 0
	j	fbgt_cont.90777
fbgt_else.90776:
	addi	%a3, %zero, 1
fbgt_cont.90777:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a3, 0, bnei_else.90778
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.90780
	addi	%a3, %zero, 0
	j	fbgt_cont.90781
fbgt_else.90780:
	addi	%a3, %zero, 1
fbgt_cont.90781:
	beqi	%a3, 0, bnei_else.90782
	flw	%f2, 467(%zero)
	fadd	%f0, %f0, %f2
	flw	%f2, 0(%a1)
	fmul	%f2, %f2, %f0
	flw	%f3, 162(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a1)
	fmul	%f3, %f3, %f0
	flw	%f4, 163(%zero)
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f0
	flw	%f5, 164(%zero)
	fadd	%f4, %f4, %f5
	lw	%a1, 0(%v1)
	sw	%t0, 3(%sp)
	sw	%a2, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f0, 8(%sp)
	beqi	%a1, -1, bnei_else.90784
	lw	%a1, 12(%a1)
	lw	%a3, 5(%a1)
	flw	%f5, 0(%a3)
	fsub	%f5, %f2, %f5
	lw	%a3, 5(%a1)
	flw	%f6, 1(%a3)
	fsub	%f6, %f3, %f6
	lw	%a3, 5(%a1)
	flw	%f7, 2(%a3)
	fsub	%f7, %f4, %f7
	lw	%a3, 1(%a1)
	beqi	%a3, 1, bnei_else.90786
	beqi	%a3, 2, bnei_else.90788
	fmul	%f8, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f9, 0(%a3)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.90790
	fmul	%f9, %f6, %f7
	lw	%a3, 9(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%a3, 9(%a1)
	flw	%f9, 1(%a3)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%a3, 9(%a1)
	flw	%f6, 2(%a3)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.90791
bnei_else.90790:
	fmov	%f5, %f8
bnei_cont.90791:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.90792
	j	bnei_cont.90793
bnei_else.90792:
	flw	%f6, 491(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.90793:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.90794
	addi	%a3, %zero, 0
	j	fbgt_cont.90795
fbgt_else.90794:
	addi	%a3, %zero, 1
fbgt_cont.90795:
	beqi	%a1, 0, bnei_else.90796
	beqi	%a3, 0, bnei_else.90798
	addi	%a1, %zero, 0
	j	bnei_cont.90797
bnei_else.90798:
	addi	%a1, %zero, 1
bnei_cont.90799:
	j	bnei_cont.90797
bnei_else.90796:
	add	%a1, %zero, %a3
bnei_cont.90797:
	beqi	%a1, 0, bnei_else.90800
	addi	%a1, %zero, 0
	j	bnei_cont.90787
bnei_else.90800:
	addi	%a1, %zero, 1
bnei_cont.90801:
	j	bnei_cont.90787
bnei_else.90788:
	lw	%a3, 4(%a1)
	flw	%f8, 0(%a3)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a3)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.90802
	addi	%a3, %zero, 0
	j	fbgt_cont.90803
fbgt_else.90802:
	addi	%a3, %zero, 1
fbgt_cont.90803:
	beqi	%a1, 0, bnei_else.90804
	beqi	%a3, 0, bnei_else.90806
	addi	%a1, %zero, 0
	j	bnei_cont.90805
bnei_else.90806:
	addi	%a1, %zero, 1
bnei_cont.90807:
	j	bnei_cont.90805
bnei_else.90804:
	add	%a1, %zero, %a3
bnei_cont.90805:
	beqi	%a1, 0, bnei_else.90808
	addi	%a1, %zero, 0
	j	bnei_cont.90809
bnei_else.90808:
	addi	%a1, %zero, 1
bnei_cont.90809:
bnei_cont.90789:
	j	bnei_cont.90787
bnei_else.90786:
	fabs	%f1, %f5
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fblt	%f1, %f5, fbgt_else.90810
	addi	%a3, %zero, 0
	j	fbgt_cont.90811
fbgt_else.90810:
	addi	%a3, %zero, 1
fbgt_cont.90811:
	beqi	%a3, 0, bnei_else.90812
	fabs	%f1, %f6
	lw	%a3, 4(%a1)
	flw	%f5, 1(%a3)
	fblt	%f1, %f5, fbgt_else.90814
	addi	%a3, %zero, 0
	j	fbgt_cont.90815
fbgt_else.90814:
	addi	%a3, %zero, 1
fbgt_cont.90815:
	beqi	%a3, 0, bnei_else.90816
	fabs	%f1, %f7
	lw	%a3, 4(%a1)
	flw	%f5, 2(%a3)
	fblt	%f1, %f5, fbgt_else.90818
	addi	%a3, %zero, 0
	j	bnei_cont.90813
fbgt_else.90818:
	addi	%a3, %zero, 1
fbgt_cont.90819:
	j	bnei_cont.90813
bnei_else.90816:
	addi	%a3, %zero, 0
bnei_cont.90817:
	j	bnei_cont.90813
bnei_else.90812:
	addi	%a3, %zero, 0
bnei_cont.90813:
	beqi	%a3, 0, bnei_else.90820
	lw	%a1, 6(%a1)
	j	bnei_cont.90821
bnei_else.90820:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.90822
	addi	%a1, %zero, 0
	j	bnei_cont.90823
bnei_else.90822:
	addi	%a1, %zero, 1
bnei_cont.90823:
bnei_cont.90821:
bnei_cont.90787:
	beqi	%a1, 0, bnei_else.90824
	addi	%v0, %zero, 0
	j	bnei_cont.90785
bnei_else.90824:
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.90825:
	j	bnei_cont.90785
bnei_else.90784:
	addi	%v0, %zero, 1
bnei_cont.90785:
	beqi	%v0, 0, bnei_else.90826
	flw	%f0, 8(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 7(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 5(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 4(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.90779
bnei_else.90826:
bnei_cont.90827:
	j	bnei_cont.90779
bnei_else.90782:
bnei_cont.90783:
	j	bnei_cont.90779
bnei_else.90778:
bnei_cont.90779:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2936
bnei_else.90775:
	lw	%a1, 6(%a3)
	beqi	%a1, 0, bnei_else.90828
	addi	%v0, %v0, 1
	j	solve_each_element_fast.2936
bnei_else.90828:
	jr	%ra
bnei_else.90714:
	jr	%ra
solve_one_or_network_fast.2940:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.90831
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90832
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90833
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90834
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90835
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90836
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90837
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.90838
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2940
bnei_else.90838:
	jr	%ra
bnei_else.90837:
	jr	%ra
bnei_else.90836:
	jr	%ra
bnei_else.90835:
	jr	%ra
bnei_else.90834:
	jr	%ra
bnei_else.90833:
	jr	%ra
bnei_else.90832:
	jr	%ra
bnei_else.90831:
	jr	%ra
trace_or_matrix_fast.2944:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.90847
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.90848
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	beqi	%t2, 1, bnei_else.90850
	beqi	%t2, 2, bnei_else.90852
	flw	%f3, 0(%a3)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90854
	addi	%t2, %zero, 1
	j	fbeq_cont.90855
fbeq_else.90854:
	addi	%t2, %zero, 0
fbeq_cont.90855:
	beqi	%t2, 0, bnei_else.90856
	addi	%a3, %zero, 0
	j	bnei_cont.90851
bnei_else.90856:
	flw	%f5, 1(%a3)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a3)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t1)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.90858
	addi	%t1, %zero, 0
	j	fbgt_cont.90859
fbgt_else.90858:
	addi	%t1, %zero, 1
fbgt_cont.90859:
	beqi	%t1, 0, bnei_else.90860
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.90862
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.90863
bnei_else.90862:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.90863:
	addi	%a3, %zero, 1
	j	bnei_cont.90861
bnei_else.90860:
	addi	%a3, %zero, 0
bnei_cont.90861:
bnei_cont.90857:
	j	bnei_cont.90851
bnei_else.90852:
	flw	%f0, 0(%a3)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.90864
	addi	%a3, %zero, 0
	j	fbgt_cont.90865
fbgt_else.90864:
	addi	%a3, %zero, 1
fbgt_cont.90865:
	beqi	%a3, 0, bnei_else.90866
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90867
bnei_else.90866:
	addi	%a3, %zero, 0
bnei_cont.90867:
bnei_cont.90853:
	j	bnei_cont.90851
bnei_else.90850:
	lw	%t1, 0(%a0)
	flw	%f3, 0(%a3)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a3)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%t1)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 1(%t2)
	fblt	%f6, %f7, fbgt_else.90868
	addi	%t2, %zero, 0
	j	fbgt_cont.90869
fbgt_else.90868:
	addi	%t2, %zero, 1
fbgt_cont.90869:
	beqi	%t2, 0, bnei_else.90870
	flw	%f6, 2(%t1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 2(%t2)
	fblt	%f6, %f7, fbgt_else.90872
	addi	%t2, %zero, 0
	j	fbgt_cont.90873
fbgt_else.90872:
	addi	%t2, %zero, 1
fbgt_cont.90873:
	beqi	%t2, 0, bnei_else.90874
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.90876
	addi	%t2, %zero, 1
	j	fbeq_cont.90877
fbeq_else.90876:
	addi	%t2, %zero, 0
fbeq_cont.90877:
	beqi	%t2, 0, bnei_else.90878
	addi	%t2, %zero, 0
	j	bnei_cont.90871
bnei_else.90878:
	addi	%t2, %zero, 1
bnei_cont.90879:
	j	bnei_cont.90871
bnei_else.90874:
	addi	%t2, %zero, 0
bnei_cont.90875:
	j	bnei_cont.90871
bnei_else.90870:
	addi	%t2, %zero, 0
bnei_cont.90871:
	beqi	%t2, 0, bnei_else.90880
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.90881
bnei_else.90880:
	flw	%f3, 2(%a3)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a3)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%t1)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t2, 4(%t0)
	flw	%f8, 0(%t2)
	fblt	%f7, %f8, fbgt_else.90882
	addi	%t2, %zero, 0
	j	fbgt_cont.90883
fbgt_else.90882:
	addi	%t2, %zero, 1
fbgt_cont.90883:
	beqi	%t2, 0, bnei_else.90884
	flw	%f7, 2(%t1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t1, 4(%t0)
	flw	%f8, 2(%t1)
	fblt	%f7, %f8, fbgt_else.90886
	addi	%t1, %zero, 0
	j	fbgt_cont.90887
fbgt_else.90886:
	addi	%t1, %zero, 1
fbgt_cont.90887:
	beqi	%t1, 0, bnei_else.90888
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.90890
	addi	%t1, %zero, 1
	j	fbeq_cont.90891
fbeq_else.90890:
	addi	%t1, %zero, 0
fbeq_cont.90891:
	beqi	%t1, 0, bnei_else.90892
	addi	%t1, %zero, 0
	j	bnei_cont.90885
bnei_else.90892:
	addi	%t1, %zero, 1
bnei_cont.90893:
	j	bnei_cont.90885
bnei_else.90888:
	addi	%t1, %zero, 0
bnei_cont.90889:
	j	bnei_cont.90885
bnei_else.90884:
	addi	%t1, %zero, 0
bnei_cont.90885:
	beqi	%t1, 0, bnei_else.90894
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 2
	j	bnei_cont.90895
bnei_else.90894:
	flw	%f3, 4(%a3)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f4, 0(%a3)
	fblt	%f0, %f4, fbgt_else.90896
	addi	%a3, %zero, 0
	j	fbgt_cont.90897
fbgt_else.90896:
	addi	%a3, %zero, 1
fbgt_cont.90897:
	beqi	%a3, 0, bnei_else.90898
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.90900
	addi	%a3, %zero, 0
	j	fbgt_cont.90901
fbgt_else.90900:
	addi	%a3, %zero, 1
fbgt_cont.90901:
	beqi	%a3, 0, bnei_else.90902
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.90904
	addi	%a3, %zero, 1
	j	fbeq_cont.90905
fbeq_else.90904:
	addi	%a3, %zero, 0
fbeq_cont.90905:
	beqi	%a3, 0, bnei_else.90906
	addi	%a3, %zero, 0
	j	bnei_cont.90899
bnei_else.90906:
	addi	%a3, %zero, 1
bnei_cont.90907:
	j	bnei_cont.90899
bnei_else.90902:
	addi	%a3, %zero, 0
bnei_cont.90903:
	j	bnei_cont.90899
bnei_else.90898:
	addi	%a3, %zero, 0
bnei_cont.90899:
	beqi	%a3, 0, bnei_else.90908
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 3
	j	bnei_cont.90909
bnei_else.90908:
	addi	%a3, %zero, 0
bnei_cont.90909:
bnei_cont.90895:
bnei_cont.90881:
bnei_cont.90851:
	beqi	%a3, 0, bnei_else.90910
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.90912
	addi	%a3, %zero, 0
	j	fbgt_cont.90913
fbgt_else.90912:
	addi	%a3, %zero, 1
fbgt_cont.90913:
	beqi	%a3, 0, bnei_else.90914
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.90916
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90918
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90920
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90922
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90924
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90926
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.90928
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.90849
bnei_else.90928:
bnei_cont.90929:
	j	bnei_cont.90849
bnei_else.90926:
bnei_cont.90927:
	j	bnei_cont.90849
bnei_else.90924:
bnei_cont.90925:
	j	bnei_cont.90849
bnei_else.90922:
bnei_cont.90923:
	j	bnei_cont.90849
bnei_else.90920:
bnei_cont.90921:
	j	bnei_cont.90849
bnei_else.90918:
bnei_cont.90919:
	j	bnei_cont.90849
bnei_else.90916:
bnei_cont.90917:
	j	bnei_cont.90849
bnei_else.90914:
bnei_cont.90915:
	j	bnei_cont.90849
bnei_else.90910:
bnei_cont.90911:
	j	bnei_cont.90849
bnei_else.90848:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.90930
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.90932
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.90934
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.90936
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.90938
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.90940
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.90942
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.90931
bnei_else.90942:
bnei_cont.90943:
	j	bnei_cont.90931
bnei_else.90940:
bnei_cont.90941:
	j	bnei_cont.90931
bnei_else.90938:
bnei_cont.90939:
	j	bnei_cont.90931
bnei_else.90936:
bnei_cont.90937:
	j	bnei_cont.90931
bnei_else.90934:
bnei_cont.90935:
	j	bnei_cont.90931
bnei_else.90932:
bnei_cont.90933:
	j	bnei_cont.90931
bnei_else.90930:
bnei_cont.90931:
bnei_cont.90849:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.90944
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.90945
	lw	%a2, 12(%a1)
	lw	%a3, 10(%a2)
	flw	%f0, 0(%a3)
	flw	%f1, 1(%a3)
	flw	%f2, 2(%a3)
	lw	%t0, 0(%sp)
	lw	%t1, 1(%t0)
	add	%at, %t1, %a1
	lw	%a1, 0(%at)
	lw	%t1, 1(%a2)
	beqi	%t1, 1, bnei_else.90947
	beqi	%t1, 2, bnei_else.90949
	flw	%f3, 0(%a1)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.90951
	addi	%t1, %zero, 1
	j	fbeq_cont.90952
fbeq_else.90951:
	addi	%t1, %zero, 0
fbeq_cont.90952:
	beqi	%t1, 0, bnei_else.90953
	addi	%a1, %zero, 0
	j	bnei_cont.90948
bnei_else.90953:
	flw	%f5, 1(%a1)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a1)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.90955
	addi	%a3, %zero, 0
	j	fbgt_cont.90956
fbgt_else.90955:
	addi	%a3, %zero, 1
fbgt_cont.90956:
	beqi	%a3, 0, bnei_else.90957
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.90959
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.90960
bnei_else.90959:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.90960:
	addi	%a1, %zero, 1
	j	bnei_cont.90958
bnei_else.90957:
	addi	%a1, %zero, 0
bnei_cont.90958:
bnei_cont.90954:
	j	bnei_cont.90948
bnei_else.90949:
	flw	%f0, 0(%a1)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.90961
	addi	%a1, %zero, 0
	j	fbgt_cont.90962
fbgt_else.90961:
	addi	%a1, %zero, 1
fbgt_cont.90962:
	beqi	%a1, 0, bnei_else.90963
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.90964
bnei_else.90963:
	addi	%a1, %zero, 0
bnei_cont.90964:
bnei_cont.90950:
	j	bnei_cont.90948
bnei_else.90947:
	lw	%a3, 0(%t0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a1)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a3)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f7, 1(%t1)
	fblt	%f6, %f7, fbgt_else.90965
	addi	%t1, %zero, 0
	j	fbgt_cont.90966
fbgt_else.90965:
	addi	%t1, %zero, 1
fbgt_cont.90966:
	beqi	%t1, 0, bnei_else.90967
	flw	%f6, 2(%a3)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f8, 2(%t1)
	fblt	%f6, %f8, fbgt_else.90969
	addi	%t1, %zero, 0
	j	fbgt_cont.90970
fbgt_else.90969:
	addi	%t1, %zero, 1
fbgt_cont.90970:
	beqi	%t1, 0, bnei_else.90971
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.90973
	addi	%t1, %zero, 1
	j	fbeq_cont.90974
fbeq_else.90973:
	addi	%t1, %zero, 0
fbeq_cont.90974:
	beqi	%t1, 0, bnei_else.90975
	addi	%t1, %zero, 0
	j	bnei_cont.90968
bnei_else.90975:
	addi	%t1, %zero, 1
bnei_cont.90976:
	j	bnei_cont.90968
bnei_else.90971:
	addi	%t1, %zero, 0
bnei_cont.90972:
	j	bnei_cont.90968
bnei_else.90967:
	addi	%t1, %zero, 0
bnei_cont.90968:
	beqi	%t1, 0, bnei_else.90977
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.90978
bnei_else.90977:
	flw	%f3, 2(%a1)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a1)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%a3)
	fmul	%f8, %f3, %f6
	fadd	%f8, %f8, %f0
	fabs	%f8, %f8
	lw	%t1, 4(%a2)
	flw	%f9, 0(%t1)
	fblt	%f8, %f9, fbgt_else.90979
	addi	%t1, %zero, 0
	j	fbgt_cont.90980
fbgt_else.90979:
	addi	%t1, %zero, 1
fbgt_cont.90980:
	beqi	%t1, 0, bnei_else.90981
	flw	%f8, 2(%a3)
	fmul	%f8, %f3, %f8
	fadd	%f8, %f8, %f2
	fabs	%f8, %f8
	lw	%a2, 4(%a2)
	flw	%f10, 2(%a2)
	fblt	%f8, %f10, fbgt_else.90983
	addi	%a2, %zero, 0
	j	fbgt_cont.90984
fbgt_else.90983:
	addi	%a2, %zero, 1
fbgt_cont.90984:
	beqi	%a2, 0, bnei_else.90985
	flw	%f8, 493(%zero)
	fbne	%f4, %f8, fbeq_else.90987
	addi	%a2, %zero, 1
	j	fbeq_cont.90988
fbeq_else.90987:
	addi	%a2, %zero, 0
fbeq_cont.90988:
	beqi	%a2, 0, bnei_else.90989
	addi	%a2, %zero, 0
	j	bnei_cont.90982
bnei_else.90989:
	addi	%a2, %zero, 1
bnei_cont.90990:
	j	bnei_cont.90982
bnei_else.90985:
	addi	%a2, %zero, 0
bnei_cont.90986:
	j	bnei_cont.90982
bnei_else.90981:
	addi	%a2, %zero, 0
bnei_cont.90982:
	beqi	%a2, 0, bnei_else.90991
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 2
	j	bnei_cont.90992
bnei_else.90991:
	flw	%f3, 4(%a1)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	fblt	%f0, %f9, fbgt_else.90993
	addi	%a1, %zero, 0
	j	fbgt_cont.90994
fbgt_else.90993:
	addi	%a1, %zero, 1
fbgt_cont.90994:
	beqi	%a1, 0, bnei_else.90995
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fblt	%f0, %f7, fbgt_else.90997
	addi	%a1, %zero, 0
	j	fbgt_cont.90998
fbgt_else.90997:
	addi	%a1, %zero, 1
fbgt_cont.90998:
	beqi	%a1, 0, bnei_else.90999
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.91001
	addi	%a1, %zero, 1
	j	fbeq_cont.91002
fbeq_else.91001:
	addi	%a1, %zero, 0
fbeq_cont.91002:
	beqi	%a1, 0, bnei_else.91003
	addi	%a1, %zero, 0
	j	bnei_cont.90996
bnei_else.91003:
	addi	%a1, %zero, 1
bnei_cont.91004:
	j	bnei_cont.90996
bnei_else.90999:
	addi	%a1, %zero, 0
bnei_cont.91000:
	j	bnei_cont.90996
bnei_else.90995:
	addi	%a1, %zero, 0
bnei_cont.90996:
	beqi	%a1, 0, bnei_else.91005
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 3
	j	bnei_cont.91006
bnei_else.91005:
	addi	%a1, %zero, 0
bnei_cont.91006:
bnei_cont.90992:
bnei_cont.90978:
bnei_cont.90948:
	beqi	%a1, 0, bnei_else.91007
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.91009
	addi	%a1, %zero, 0
	j	fbgt_cont.91010
fbgt_else.91009:
	addi	%a1, %zero, 1
fbgt_cont.91010:
	beqi	%a1, 0, bnei_else.91011
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.91013
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91015
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91017
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91019
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.91021
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.91023
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.90946
bnei_else.91023:
bnei_cont.91024:
	j	bnei_cont.90946
bnei_else.91021:
bnei_cont.91022:
	j	bnei_cont.90946
bnei_else.91019:
bnei_cont.91020:
	j	bnei_cont.90946
bnei_else.91017:
bnei_cont.91018:
	j	bnei_cont.90946
bnei_else.91015:
bnei_cont.91016:
	j	bnei_cont.90946
bnei_else.91013:
bnei_cont.91014:
	j	bnei_cont.90946
bnei_else.91011:
bnei_cont.91012:
	j	bnei_cont.90946
bnei_else.91007:
bnei_cont.91008:
	j	bnei_cont.90946
bnei_else.90945:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.91025
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91027
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91029
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91031
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.91033
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.91035
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.91026
bnei_else.91035:
bnei_cont.91036:
	j	bnei_cont.91026
bnei_else.91033:
bnei_cont.91034:
	j	bnei_cont.91026
bnei_else.91031:
bnei_cont.91032:
	j	bnei_cont.91026
bnei_else.91029:
bnei_cont.91030:
	j	bnei_cont.91026
bnei_else.91027:
bnei_cont.91028:
	j	bnei_cont.91026
bnei_else.91025:
bnei_cont.91026:
bnei_cont.90946:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.90944:
	jr	%ra
bnei_else.90847:
	jr	%ra
trace_reflections.2966:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.91039
	lw	%a1, 254(%v0)
	lw	%a2, 1(%a1)
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a3, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91040
	addi	%v0, %zero, 0
	j	fbgt_cont.91041
fbgt_else.91040:
	addi	%v0, %zero, 1
fbgt_cont.91041:
	beqi	%v0, 0, bnei_else.91042
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.91044
	addi	%v0, %zero, 0
	j	bnei_cont.91043
fbgt_else.91044:
	addi	%v0, %zero, 1
fbgt_cont.91045:
	j	bnei_cont.91043
bnei_else.91042:
	addi	%v0, %zero, 0
bnei_cont.91043:
	beqi	%v0, 0, bnei_else.91046
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.91048
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.91050
	j	bnei_cont.91047
bnei_else.91050:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 142(%zero)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lw	%v1, 7(%sp)
	flw	%f1, 2(%v1)
	flw	%f2, 3(%sp)
	fmul	%f3, %f1, %f2
	fmul	%f0, %f3, %f0
	lw	%v0, 0(%v0)
	lw	%v1, 2(%sp)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	flw	%f5, 1(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	flw	%f5, 2(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f1, %f1, %f3
	flw	%f3, 493(%zero)
	fblt	%f3, %f0, fbgt_else.91052
	addi	%v0, %zero, 0
	j	fbgt_cont.91053
fbgt_else.91052:
	addi	%v0, %zero, 1
fbgt_cont.91053:
	beqi	%v0, 0, bnei_else.91054
	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 151(%zero)
	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 152(%zero)
	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f0, %f0, %f5
	fadd	%f0, %f4, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.91055
bnei_else.91054:
bnei_cont.91055:
	fblt	%f3, %f1, fbgt_else.91056
	addi	%v0, %zero, 0
	j	fbgt_cont.91057
fbgt_else.91056:
	addi	%v0, %zero, 1
fbgt_cont.91057:
	beqi	%v0, 0, bnei_else.91058
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	flw	%f3, 151(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	fadd	%f0, %f3, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.91059
bnei_else.91058:
bnei_cont.91059:
bnei_cont.91051:
	j	bnei_cont.91047
beq_else.91048:
beq_cont.91049:
	j	bnei_cont.91047
bnei_else.91046:
bnei_cont.91047:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2966
bgti_else.91039:
	jr	%ra
trace_ray.2971:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.91061
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
	fsw	%f1, 0(%sp)
	sw	%a3, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%a0, %v1, 0
	addi	%v0, %a2, 0
	addi	%v1, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_or_matrix.2930
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91062
	addi	%v0, %zero, 0
	j	fbgt_cont.91063
fbgt_else.91062:
	addi	%v0, %zero, 1
fbgt_cont.91063:
	beqi	%v0, 0, bnei_else.91064
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.91066
	addi	%v0, %zero, 0
	j	bnei_cont.91065
fbgt_else.91066:
	addi	%v0, %zero, 1
fbgt_cont.91067:
	j	bnei_cont.91065
bnei_else.91064:
	addi	%v0, %zero, 0
bnei_cont.91065:
	beqi	%v0, 0, bnei_else.91068
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	beqi	%a1, 1, bnei_else.91069
	beqi	%a1, 2, bnei_else.91071
	flw	%f3, 138(%zero)
	lw	%a1, 5(%v1)
	flw	%f4, 0(%a1)
	fsub	%f3, %f3, %f4
	flw	%f4, 139(%zero)
	lw	%a1, 5(%v1)
	flw	%f5, 1(%a1)
	fsub	%f4, %f4, %f5
	flw	%f5, 140(%zero)
	lw	%a1, 5(%v1)
	flw	%f6, 2(%a1)
	fsub	%f5, %f5, %f6
	lw	%a1, 4(%v1)
	flw	%f6, 0(%a1)
	fmul	%f6, %f3, %f6
	lw	%a1, 4(%v1)
	flw	%f7, 1(%a1)
	fmul	%f7, %f4, %f7
	lw	%a1, 4(%v1)
	flw	%f8, 2(%a1)
	fmul	%f8, %f5, %f8
	lw	%a1, 3(%v1)
	beqi	%a1, 0, bnei_else.91073
	lw	%a1, 9(%v1)
	flw	%f9, 2(%a1)
	fmul	%f9, %f4, %f9
	lw	%a1, 9(%v1)
	flw	%f10, 1(%a1)
	fmul	%f10, %f5, %f10
	fadd	%f9, %f9, %f10
	flw	%f10, 471(%zero)
	fmul	%f9, %f9, %f10
	fadd	%f6, %f6, %f9
	fsw	%f6, 142(%zero)
	lw	%a1, 9(%v1)
	flw	%f6, 2(%a1)
	fmul	%f6, %f3, %f6
	lw	%a1, 9(%v1)
	flw	%f9, 0(%a1)
	fmul	%f5, %f5, %f9
	fadd	%f5, %f6, %f5
	fmul	%f5, %f5, %f10
	fadd	%f5, %f7, %f5
	fsw	%f5, 143(%zero)
	lw	%a1, 9(%v1)
	flw	%f5, 1(%a1)
	fmul	%f3, %f3, %f5
	lw	%a1, 9(%v1)
	flw	%f5, 0(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f3, %f3, %f10
	fadd	%f3, %f8, %f3
	fsw	%f3, 144(%zero)
	j	bnei_cont.91074
bnei_else.91073:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.91074:
	lw	%a1, 6(%v1)
	flw	%f3, 142(%zero)
	fmul	%f4, %f3, %f3
	flw	%f5, 143(%zero)
	fmul	%f6, %f5, %f5
	fadd	%f4, %f4, %f6
	flw	%f6, 144(%zero)
	fmul	%f7, %f6, %f6
	fadd	%f4, %f4, %f7
	fsqrt	%f4, %f4
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.91075
	addi	%a3, %zero, 1
	j	fbeq_cont.91076
fbeq_else.91075:
	addi	%a3, %zero, 0
fbeq_cont.91076:
	beqi	%a3, 0, bnei_else.91077
	flw	%f4, 491(%zero)
	j	bnei_cont.91078
bnei_else.91077:
	beqi	%a1, 0, bnei_else.91079
	flw	%f7, 490(%zero)
	fdiv	%f4, %f7, %f4
	j	bnei_cont.91080
bnei_else.91079:
	flw	%f7, 491(%zero)
	fdiv	%f4, %f7, %f4
bnei_cont.91080:
bnei_cont.91078:
	fmul	%f3, %f3, %f4
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 144(%zero)
	j	bnei_cont.91070
bnei_else.91071:
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fneg	%f3, %f3
	fsw	%f3, 142(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 1(%a1)
	fneg	%f3, %f3
	fsw	%f3, 143(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 2(%a1)
	fneg	%f3, %f3
	fsw	%f3, 144(%zero)
bnei_cont.91072:
	j	bnei_cont.91070
bnei_else.91069:
	lw	%a1, 136(%zero)
	flw	%f3, 493(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.91081
	addi	%t0, %zero, 1
	j	fbeq_cont.91082
fbeq_else.91081:
	addi	%t0, %zero, 0
fbeq_cont.91082:
	beqi	%t0, 0, bnei_else.91083
	j	bnei_cont.91084
bnei_else.91083:
	fblt	%f3, %f4, fbgt_else.91085
	addi	%t0, %zero, 0
	j	fbgt_cont.91086
fbgt_else.91085:
	addi	%t0, %zero, 1
fbgt_cont.91086:
	beqi	%t0, 0, bnei_else.91087
	flw	%f3, 491(%zero)
	j	bnei_cont.91088
bnei_else.91087:
	flw	%f3, 490(%zero)
bnei_cont.91088:
bnei_cont.91084:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.91070:
	flw	%f3, 138(%zero)
	fsw	%f3, 159(%zero)
	flw	%f4, 139(%zero)
	fsw	%f4, 160(%zero)
	flw	%f5, 140(%zero)
	fsw	%f5, 161(%zero)
	lw	%a1, 0(%v1)
	lw	%a3, 8(%v1)
	flw	%f6, 0(%a3)
	fsw	%f6, 145(%zero)
	lw	%a3, 8(%v1)
	flw	%f6, 1(%a3)
	fsw	%f6, 146(%zero)
	lw	%a3, 8(%v1)
	flw	%f6, 2(%a3)
	fsw	%f6, 147(%zero)
	fsw	%f0, 8(%sp)
	sw	%a0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%a2, 11(%sp)
	sw	%v1, 12(%sp)
	fsw	%f5, 13(%sp)
	fsw	%f4, 14(%sp)
	fsw	%f3, 15(%sp)
	sw	%v0, 16(%sp)
	beqi	%a1, 1, bnei_else.91089
	beqi	%a1, 2, bnei_else.91091
	beqi	%a1, 3, bnei_else.91093
	beqi	%a1, 4, bnei_else.91095
	j	bnei_cont.91090
bnei_else.91095:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	lw	%a1, 4(%v1)
	flw	%f7, 0(%a1)
	fsqrt	%f7, %f7
	fmul	%f6, %f6, %f7
	lw	%a1, 5(%v1)
	flw	%f7, 2(%a1)
	fsub	%f7, %f5, %f7
	lw	%a1, 4(%v1)
	flw	%f8, 2(%a1)
	fsqrt	%f8, %f8
	fmul	%f7, %f7, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f7, %f7
	fadd	%f8, %f8, %f9
	fabs	%f9, %f6
	flw	%f10, 463(%zero)
	fblt	%f9, %f10, fbgt_else.91097
	addi	%a1, %zero, 0
	j	fbgt_cont.91098
fbgt_else.91097:
	addi	%a1, %zero, 1
fbgt_cont.91098:
	beqi	%a1, 0, bnei_else.91099
	flw	%f6, 462(%zero)
	j	bnei_cont.91100
bnei_else.91099:
	fdiv	%f6, %f7, %f6
	fabs	%f6, %f6
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.91101
	addi	%a1, %zero, 1
	j	fbgt_cont.91102
fbgt_else.91101:
	addi	%a1, %zero, 0
fbgt_cont.91102:
	fabs	%f7, %f6
	flw	%f9, 461(%zero)
	fblt	%f7, %f9, fbgt_else.91103
	flw	%f6, 454(%zero)
	fblt	%f7, %f6, fbgt_else.91105
	flw	%f6, 476(%zero)
	flw	%f9, 491(%zero)
	fdiv	%f7, %f9, %f7
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	fmul	%f12, %f11, %f11
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f13, %f7, %f13
	flw	%f14, 459(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f11
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f9
	fmul	%f14, %f14, %f11
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f12
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f9, %f14, %f9
	fmul	%f9, %f9, %f12
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fmul	%f7, %f7, %f12
	fadd	%f7, %f9, %f7
	fsub	%f6, %f6, %f7
	j	fbgt_cont.91106
fbgt_else.91105:
	flw	%f6, 475(%zero)
	flw	%f9, 491(%zero)
	fsub	%f11, %f7, %f9
	fadd	%f7, %f7, %f9
	fdiv	%f7, %f11, %f7
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	fmul	%f12, %f11, %f11
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f13, %f7, %f13
	flw	%f14, 459(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f11
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f9
	fmul	%f14, %f14, %f11
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f12
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f9, %f14, %f9
	fmul	%f9, %f9, %f12
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fmul	%f7, %f7, %f12
	fadd	%f7, %f9, %f7
	fadd	%f6, %f6, %f7
fbgt_cont.91106:
	beqi	%a1, 0, bnei_else.91107
	j	fbgt_cont.91104
bnei_else.91107:
	fneg	%f6, %f6
bnei_cont.91108:
	j	fbgt_cont.91104
fbgt_else.91103:
	fmul	%f7, %f6, %f6
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f7
	fsub	%f12, %f6, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f9
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fsub	%f7, %f12, %f7
	flw	%f12, 455(%zero)
	fmul	%f6, %f12, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f11
	fadd	%f6, %f7, %f6
fbgt_cont.91104:
	flw	%f7, 453(%zero)
	fmul	%f6, %f6, %f7
	flw	%f7, 452(%zero)
	fdiv	%f6, %f6, %f7
bnei_cont.91100:
	floor	%f7, %f6
	fsub	%f6, %f6, %f7
	lw	%a1, 5(%v1)
	flw	%f7, 1(%a1)
	fsub	%f7, %f4, %f7
	lw	%a1, 4(%v1)
	flw	%f9, 1(%a1)
	fsqrt	%f9, %f9
	fmul	%f7, %f7, %f9
	fabs	%f9, %f8
	fblt	%f9, %f10, fbgt_else.91109
	addi	%a1, %zero, 0
	j	fbgt_cont.91110
fbgt_else.91109:
	addi	%a1, %zero, 1
fbgt_cont.91110:
	beqi	%a1, 0, bnei_else.91111
	flw	%f7, 462(%zero)
	j	bnei_cont.91112
bnei_else.91111:
	fdiv	%f7, %f7, %f8
	fabs	%f7, %f7
	flw	%f8, 493(%zero)
	fblt	%f7, %f8, fbgt_else.91113
	addi	%a1, %zero, 1
	j	fbgt_cont.91114
fbgt_else.91113:
	addi	%a1, %zero, 0
fbgt_cont.91114:
	fabs	%f8, %f7
	flw	%f9, 461(%zero)
	fblt	%f8, %f9, fbgt_else.91115
	flw	%f7, 454(%zero)
	fblt	%f8, %f7, fbgt_else.91117
	flw	%f7, 476(%zero)
	flw	%f9, 491(%zero)
	fdiv	%f8, %f9, %f8
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f12, %f8, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fmul	%f8, %f8, %f11
	fadd	%f8, %f9, %f8
	fsub	%f7, %f7, %f8
	j	fbgt_cont.91118
fbgt_else.91117:
	flw	%f7, 475(%zero)
	flw	%f9, 491(%zero)
	fsub	%f10, %f8, %f9
	fadd	%f8, %f8, %f9
	fdiv	%f8, %f10, %f8
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f12, %f8, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fmul	%f8, %f8, %f11
	fadd	%f8, %f9, %f8
	fadd	%f7, %f7, %f8
fbgt_cont.91118:
	beqi	%a1, 0, bnei_else.91119
	j	fbgt_cont.91116
bnei_else.91119:
	fneg	%f7, %f7
bnei_cont.91120:
	j	fbgt_cont.91116
fbgt_else.91115:
	fmul	%f8, %f7, %f7
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f7
	fmul	%f11, %f11, %f8
	fsub	%f11, %f7, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)
	fmul	%f7, %f11, %f7
	fmul	%f7, %f7, %f9
	fmul	%f7, %f7, %f10
	fadd	%f7, %f8, %f7
fbgt_cont.91116:
	flw	%f8, 453(%zero)
	fmul	%f7, %f7, %f8
	flw	%f8, 452(%zero)
	fdiv	%f7, %f7, %f8
bnei_cont.91112:
	floor	%f8, %f7
	fsub	%f7, %f7, %f8
	flw	%f8, 451(%zero)
	flw	%f9, 471(%zero)
	fsub	%f6, %f9, %f6
	fmul	%f6, %f6, %f6
	fsub	%f6, %f8, %f6
	fsub	%f7, %f9, %f7
	fmul	%f7, %f7, %f7
	fsub	%f6, %f6, %f7
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.91121
	addi	%a1, %zero, 0
	j	fbgt_cont.91122
fbgt_else.91121:
	addi	%a1, %zero, 1
fbgt_cont.91122:
	beqi	%a1, 0, bnei_else.91123
	fmov	%f6, %f7
	j	bnei_cont.91124
bnei_else.91123:
bnei_cont.91124:
	flw	%f7, 450(%zero)
	fmul	%f6, %f7, %f6
	flw	%f7, 449(%zero)
	fdiv	%f6, %f6, %f7
	fsw	%f6, 147(%zero)
bnei_cont.91096:
	j	bnei_cont.91090
bnei_else.91093:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	lw	%a1, 5(%v1)
	flw	%f7, 2(%a1)
	fsub	%f7, %f5, %f7
	fmul	%f6, %f6, %f6
	fmul	%f7, %f7, %f7
	fadd	%f6, %f6, %f7
	fsqrt	%f6, %f6
	flw	%f7, 448(%zero)
	fdiv	%f6, %f6, %f7
	floor	%f7, %f6
	fsub	%f6, %f6, %f7
	flw	%f7, 452(%zero)
	fmul	%f6, %f6, %f7
	flw	%f7, 489(%zero)
	fabs	%f6, %f6
	flw	%f8, 488(%zero)
	fsw	%f7, 17(%sp)
	fsw	%f8, 18(%sp)
	fsw	%f6, 19(%sp)
	fblt	%f6, %f8, fbgt_else.91125
	flw	%f9, 487(%zero)
	fblt	%f6, %f9, fbgt_else.91127
	flw	%f9, 486(%zero)
	fblt	%f6, %f9, fbgt_else.91129
	flw	%f9, 485(%zero)
	fblt	%f6, %f9, fbgt_else.91131
	flw	%f9, 484(%zero)
	fblt	%f6, %f9, fbgt_else.91133
	flw	%f9, 483(%zero)
	fblt	%f6, %f9, fbgt_else.91135
	flw	%f9, 482(%zero)
	fblt	%f6, %f9, fbgt_else.91137
	flw	%f9, 481(%zero)
	fblt	%f6, %f9, fbgt_else.91139
	flw	%f9, 480(%zero)
	fblt	%f6, %f9, fbgt_else.91141
	flw	%f9, 479(%zero)
	fblt	%f6, %f9, fbgt_else.91143
	flw	%f9, 478(%zero)
	fblt	%f6, %f9, fbgt_else.91145
	flw	%f9, 477(%zero)
	fblt	%f6, %f9, fbgt_else.91147
	flw	%f9, 447(%zero)
	fmov	%f1, %f9
	fmov	%f0, %f6
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.91126
fbgt_else.91147:
	fmov	%f1, %f9
fbgt_cont.91148:
	j	fbgt_cont.91126
fbgt_else.91145:
	fmov	%f1, %f9
fbgt_cont.91146:
	j	fbgt_cont.91126
fbgt_else.91143:
	fmov	%f1, %f9
fbgt_cont.91144:
	j	fbgt_cont.91126
fbgt_else.91141:
	fmov	%f1, %f9
fbgt_cont.91142:
	j	fbgt_cont.91126
fbgt_else.91139:
	fmov	%f1, %f9
fbgt_cont.91140:
	j	fbgt_cont.91126
fbgt_else.91137:
	fmov	%f1, %f9
fbgt_cont.91138:
	j	fbgt_cont.91126
fbgt_else.91135:
	fmov	%f1, %f9
fbgt_cont.91136:
	j	fbgt_cont.91126
fbgt_else.91133:
	fmov	%f1, %f9
fbgt_cont.91134:
	j	fbgt_cont.91126
fbgt_else.91131:
	fmov	%f1, %f9
fbgt_cont.91132:
	j	fbgt_cont.91126
fbgt_else.91129:
	fmov	%f1, %f9
fbgt_cont.91130:
	j	fbgt_cont.91126
fbgt_else.91127:
	fmov	%f1, %f9
fbgt_cont.91128:
	j	fbgt_cont.91126
fbgt_else.91125:
	fmov	%f1, %f8
fbgt_cont.91126:
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.91149
	addi	%v0, %zero, 0
	j	fbgt_cont.91150
fbgt_else.91149:
	addi	%v0, %zero, 1
fbgt_cont.91150:
	fblt	%f0, %f1, fbgt_else.91151
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91152
fbgt_else.91151:
fbgt_cont.91152:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91153
	beqi	%v0, 0, bnei_else.91155
	addi	%v0, %zero, 0
	j	fbgt_cont.91154
bnei_else.91155:
	addi	%v0, %zero, 1
bnei_cont.91156:
	j	fbgt_cont.91154
fbgt_else.91153:
fbgt_cont.91154:
	fblt	%f0, %f2, fbgt_else.91157
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91158
fbgt_else.91157:
fbgt_cont.91158:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91159
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.91160
fbgt_else.91159:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.91160:
	beqi	%v0, 0, bnei_else.91161
	j	bnei_cont.91162
bnei_else.91161:
	fneg	%f0, %f0
bnei_cont.91162:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.91094:
	j	bnei_cont.91090
bnei_else.91091:
	flw	%f6, 446(%zero)
	fmul	%f6, %f4, %f6
	flw	%f7, 489(%zero)
	flw	%f8, 493(%zero)
	fblt	%f6, %f8, fbgt_else.91163
	addi	%a1, %zero, 1
	j	fbgt_cont.91164
fbgt_else.91163:
	addi	%a1, %zero, 0
fbgt_cont.91164:
	fabs	%f6, %f6
	flw	%f8, 488(%zero)
	sw	%a1, 20(%sp)
	fsw	%f7, 21(%sp)
	fsw	%f8, 22(%sp)
	fsw	%f6, 23(%sp)
	fblt	%f6, %f8, fbgt_else.91165
	flw	%f9, 487(%zero)
	fblt	%f6, %f9, fbgt_else.91167
	flw	%f9, 486(%zero)
	fblt	%f6, %f9, fbgt_else.91169
	flw	%f9, 485(%zero)
	fblt	%f6, %f9, fbgt_else.91171
	flw	%f9, 484(%zero)
	fblt	%f6, %f9, fbgt_else.91173
	flw	%f9, 483(%zero)
	fblt	%f6, %f9, fbgt_else.91175
	flw	%f9, 482(%zero)
	fblt	%f6, %f9, fbgt_else.91177
	flw	%f9, 481(%zero)
	fblt	%f6, %f9, fbgt_else.91179
	flw	%f9, 480(%zero)
	fblt	%f6, %f9, fbgt_else.91181
	flw	%f9, 479(%zero)
	fblt	%f6, %f9, fbgt_else.91183
	flw	%f9, 478(%zero)
	fblt	%f6, %f9, fbgt_else.91185
	flw	%f9, 477(%zero)
	fblt	%f6, %f9, fbgt_else.91187
	flw	%f9, 447(%zero)
	fmov	%f1, %f9
	fmov	%f0, %f6
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.91166
fbgt_else.91187:
	fmov	%f1, %f9
fbgt_cont.91188:
	j	fbgt_cont.91166
fbgt_else.91185:
	fmov	%f1, %f9
fbgt_cont.91186:
	j	fbgt_cont.91166
fbgt_else.91183:
	fmov	%f1, %f9
fbgt_cont.91184:
	j	fbgt_cont.91166
fbgt_else.91181:
	fmov	%f1, %f9
fbgt_cont.91182:
	j	fbgt_cont.91166
fbgt_else.91179:
	fmov	%f1, %f9
fbgt_cont.91180:
	j	fbgt_cont.91166
fbgt_else.91177:
	fmov	%f1, %f9
fbgt_cont.91178:
	j	fbgt_cont.91166
fbgt_else.91175:
	fmov	%f1, %f9
fbgt_cont.91176:
	j	fbgt_cont.91166
fbgt_else.91173:
	fmov	%f1, %f9
fbgt_cont.91174:
	j	fbgt_cont.91166
fbgt_else.91171:
	fmov	%f1, %f9
fbgt_cont.91172:
	j	fbgt_cont.91166
fbgt_else.91169:
	fmov	%f1, %f9
fbgt_cont.91170:
	j	fbgt_cont.91166
fbgt_else.91167:
	fmov	%f1, %f9
fbgt_cont.91168:
	j	fbgt_cont.91166
fbgt_else.91165:
	fmov	%f1, %f8
fbgt_cont.91166:
	flw	%f0, 23(%sp)
	flw	%f2, 22(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 21(%sp)
	fblt	%f0, %f1, fbgt_else.91189
	lw	%v0, 20(%sp)
	beqi	%v0, 0, bnei_else.91191
	addi	%v0, %zero, 0
	j	fbgt_cont.91190
bnei_else.91191:
	addi	%v0, %zero, 1
bnei_cont.91192:
	j	fbgt_cont.91190
fbgt_else.91189:
	lw	%v0, 20(%sp)
fbgt_cont.91190:
	fblt	%f0, %f1, fbgt_else.91193
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91194
fbgt_else.91193:
fbgt_cont.91194:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91195
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91196
fbgt_else.91195:
fbgt_cont.91196:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91197
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.91198
fbgt_else.91197:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.91198:
	beqi	%v0, 0, bnei_else.91199
	j	bnei_cont.91200
bnei_else.91199:
	fneg	%f0, %f0
bnei_cont.91200:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.91092:
	j	bnei_cont.91090
bnei_else.91089:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	flw	%f7, 445(%zero)
	fmul	%f8, %f6, %f7
	floor	%f8, %f8
	flw	%f9, 444(%zero)
	fmul	%f8, %f8, %f9
	fsub	%f6, %f6, %f8
	flw	%f8, 448(%zero)
	fblt	%f6, %f8, fbgt_else.91201
	addi	%a1, %zero, 0
	j	fbgt_cont.91202
fbgt_else.91201:
	addi	%a1, %zero, 1
fbgt_cont.91202:
	lw	%a3, 5(%v1)
	flw	%f6, 2(%a3)
	fsub	%f6, %f5, %f6
	fmul	%f7, %f6, %f7
	floor	%f7, %f7
	fmul	%f7, %f7, %f9
	fsub	%f6, %f6, %f7
	fblt	%f6, %f8, fbgt_else.91203
	addi	%a3, %zero, 0
	j	fbgt_cont.91204
fbgt_else.91203:
	addi	%a3, %zero, 1
fbgt_cont.91204:
	beqi	%a1, 0, bnei_else.91205
	beqi	%a3, 0, bnei_else.91207
	flw	%f6, 450(%zero)
	j	bnei_cont.91206
bnei_else.91207:
	flw	%f6, 493(%zero)
bnei_cont.91208:
	j	bnei_cont.91206
bnei_else.91205:
	beqi	%a3, 0, bnei_else.91209
	flw	%f6, 493(%zero)
	j	bnei_cont.91210
bnei_else.91209:
	flw	%f6, 450(%zero)
bnei_cont.91210:
bnei_cont.91206:
	fsw	%f6, 146(%zero)
bnei_cont.91090:
	lw	%v0, 16(%sp)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)
	lw	%a1, 1(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f0, 15(%sp)
	fsw	%f0, 0(%a1)
	flw	%f1, 14(%sp)
	fsw	%f1, 1(%a1)
	flw	%f2, 13(%sp)
	fsw	%f2, 2(%a1)
	lw	%a1, 3(%v0)
	lw	%a2, 12(%sp)
	lw	%a3, 7(%a2)
	flw	%f3, 0(%a3)
	flw	%f4, 471(%zero)
	fblt	%f3, %f4, fbgt_else.91211
	addi	%a3, %zero, 0
	j	fbgt_cont.91212
fbgt_else.91211:
	addi	%a3, %zero, 1
fbgt_cont.91212:
	beqi	%a3, 0, bnei_else.91213
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.91214
bnei_else.91213:
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f3, 145(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 146(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 147(%zero)
	fsw	%f3, 2(%a1)
	flw	%f3, 443(%zero)
	flw	%f4, 10(%sp)
	fmul	%f3, %f3, %f4
	flw	%f5, 0(%a1)
	fmul	%f5, %f5, %f3
	fsw	%f5, 0(%a1)
	flw	%f5, 1(%a1)
	fmul	%f5, %f5, %f3
	fsw	%f5, 1(%a1)
	flw	%f5, 2(%a1)
	fmul	%f3, %f5, %f3
	fsw	%f3, 2(%a1)
	lw	%a1, 7(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f3, 142(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)
	fsw	%f3, 2(%a1)
bnei_cont.91214:
	flw	%f3, 442(%zero)
	lw	%a1, 5(%sp)
	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)
	fmul	%f9, %f7, %f8
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	flw	%f10, 144(%zero)
	fmul	%f11, %f9, %f10
	fadd	%f6, %f6, %f11
	fmul	%f3, %f3, %f6
	fmul	%f6, %f3, %f5
	fadd	%f4, %f4, %f6
	fsw	%f4, 0(%a1)
	fmul	%f4, %f3, %f8
	fadd	%f4, %f7, %f4
	fsw	%f4, 1(%a1)
	fmul	%f3, %f3, %f10
	fadd	%f3, %f9, %f3
	fsw	%f3, 2(%a1)
	lw	%a3, 7(%a2)
	flw	%f3, 1(%a3)
	flw	%f4, 4(%sp)
	fmul	%f3, %f4, %f3
	lw	%a3, 2(%sp)
	lw	%t0, 1(%sp)
	fsw	%f3, 24(%sp)
	fsw	%f10, 25(%sp)
	fsw	%f8, 26(%sp)
	fsw	%f5, 27(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	beqi	%v0, 0, bnei_else.91215
	j	bnei_cont.91216
bnei_else.91215:
	flw	%f0, 78(%zero)
	flw	%f1, 27(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 26(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
	flw	%f4, 25(%sp)
	fmul	%f4, %f4, %f3
	fadd	%f1, %f1, %f4
	fneg	%f1, %f1
	flw	%f4, 10(%sp)
	fmul	%f1, %f1, %f4
	lw	%v0, 5(%sp)
	flw	%f5, 0(%v0)
	fmul	%f0, %f5, %f0
	flw	%f5, 1(%v0)
	fmul	%f2, %f5, %f2
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v0)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	fneg	%f0, %f0
	flw	%f2, 493(%zero)
	fblt	%f2, %f1, fbgt_else.91217
	addi	%v1, %zero, 0
	j	fbgt_cont.91218
fbgt_else.91217:
	addi	%v1, %zero, 1
fbgt_cont.91218:
	beqi	%v1, 0, bnei_else.91219
	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
	fsw	%f1, 153(%zero)
	j	bnei_cont.91220
bnei_else.91219:
bnei_cont.91220:
	fblt	%f2, %f0, fbgt_else.91221
	addi	%v1, %zero, 0
	j	fbgt_cont.91222
fbgt_else.91221:
	addi	%v1, %zero, 1
fbgt_cont.91222:
	beqi	%v1, 0, bnei_else.91223
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 24(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 151(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 151(%zero)
	flw	%f2, 152(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 152(%zero)
	flw	%f2, 153(%zero)
	fadd	%f0, %f2, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.91224
bnei_else.91223:
bnei_cont.91224:
bnei_cont.91216:
	flw	%f0, 15(%sp)
	fsw	%f0, 162(%zero)
	flw	%f0, 14(%sp)
	fsw	%f0, 163(%zero)
	flw	%f0, 13(%sp)
	fsw	%f0, 164(%zero)
	lw	%v0, 0(%zero)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 24(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	trace_reflections.2966
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.91225
	addi	%v0, %zero, 0
	j	fbgt_cont.91226
fbgt_else.91225:
	addi	%v0, %zero, 1
fbgt_cont.91226:
	beqi	%v0, 0, bnei_else.91227
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.91228
	j	bgti_cont.91229
bgti_else.91228:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.91229:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.91230
	jr	%ra
bnei_else.91230:
	flw	%f0, 491(%zero)
	lw	%v1, 12(%sp)
	lw	%v1, 7(%v1)
	flw	%f2, 0(%v1)
	fsub	%f0, %f0, %f2
	fmul	%f0, %f1, %f0
	addi	%v0, %v0, 1
	flw	%f1, 8(%sp)
	flw	%f2, 0(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 5(%sp)
	lw	%a0, 3(%sp)
	j	trace_ray.2971
bnei_else.91227:
	jr	%ra
bnei_else.91068:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.91233
	lw	%v0, 5(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.91234
	addi	%v0, %zero, 0
	j	fbgt_cont.91235
fbgt_else.91234:
	addi	%v0, %zero, 1
fbgt_cont.91235:
	beqi	%v0, 0, bnei_else.91236
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 81(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 151(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 151(%zero)
	flw	%f1, 152(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 152(%zero)
	flw	%f1, 153(%zero)
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.91236:
	jr	%ra
bnei_else.91233:
	jr	%ra
bgt_else.91061:
	jr	%ra
trace_diffuse_ray.2977:
	addi	%v1, %zero, 0
	flw	%f1, 465(%zero)
	fsw	%f1, 137(%zero)
	lw	%a0, 134(%zero)
	fsw	%f0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91241
	addi	%v0, %zero, 0
	j	fbgt_cont.91242
fbgt_else.91241:
	addi	%v0, %zero, 1
fbgt_cont.91242:
	beqi	%v0, 0, bnei_else.91243
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.91245
	addi	%v0, %zero, 0
	j	bnei_cont.91244
fbgt_else.91245:
	addi	%v0, %zero, 1
fbgt_cont.91246:
	j	bnei_cont.91244
bnei_else.91243:
	addi	%v0, %zero, 0
bnei_cont.91244:
	beqi	%v0, 0, bnei_else.91247
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.91248
	beqi	%a0, 2, bnei_else.91250
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.91252
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.91253
bnei_else.91252:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.91253:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 493(%zero)
	fbne	%f1, %f4, fbeq_else.91254
	addi	%a0, %zero, 1
	j	fbeq_cont.91255
fbeq_else.91254:
	addi	%a0, %zero, 0
fbeq_cont.91255:
	beqi	%a0, 0, bnei_else.91256
	flw	%f1, 491(%zero)
	j	bnei_cont.91257
bnei_else.91256:
	beqi	%v1, 0, bnei_else.91258
	flw	%f4, 490(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.91259
bnei_else.91258:
	flw	%f4, 491(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.91259:
bnei_cont.91257:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.91249
bnei_else.91250:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.91251:
	j	bnei_cont.91249
bnei_else.91248:
	lw	%a0, 136(%zero)
	flw	%f0, 493(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.91260
	addi	%v1, %zero, 1
	j	fbeq_cont.91261
fbeq_else.91260:
	addi	%v1, %zero, 0
fbeq_cont.91261:
	beqi	%v1, 0, bnei_else.91262
	j	bnei_cont.91263
bnei_else.91262:
	fblt	%f0, %f1, fbgt_else.91264
	addi	%v1, %zero, 0
	j	fbgt_cont.91265
fbgt_else.91264:
	addi	%v1, %zero, 1
fbgt_cont.91265:
	beqi	%v1, 0, bnei_else.91266
	flw	%f0, 491(%zero)
	j	bnei_cont.91267
bnei_else.91266:
	flw	%f0, 490(%zero)
bnei_cont.91267:
bnei_cont.91263:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.91249:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 4(%sp)
	beqi	%v1, 1, bnei_else.91268
	beqi	%v1, 2, bnei_else.91270
	beqi	%v1, 3, bnei_else.91272
	beqi	%v1, 4, bnei_else.91274
	j	bnei_cont.91269
bnei_else.91274:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.91276
	addi	%v1, %zero, 0
	j	fbgt_cont.91277
fbgt_else.91276:
	addi	%v1, %zero, 1
fbgt_cont.91277:
	beqi	%v1, 0, bnei_else.91278
	flw	%f0, 462(%zero)
	j	bnei_cont.91279
bnei_else.91278:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.91280
	addi	%v1, %zero, 1
	j	fbgt_cont.91281
fbgt_else.91280:
	addi	%v1, %zero, 0
fbgt_cont.91281:
	fabs	%f1, %f0
	flw	%f3, 461(%zero)
	fblt	%f1, %f3, fbgt_else.91282
	flw	%f0, 454(%zero)
	fblt	%f1, %f0, fbgt_else.91284
	flw	%f0, 476(%zero)
	flw	%f3, 491(%zero)
	fdiv	%f1, %f3, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91285
fbgt_else.91284:
	flw	%f0, 475(%zero)
	flw	%f3, 491(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.91285:
	beqi	%v1, 0, bnei_else.91286
	j	fbgt_cont.91283
bnei_else.91286:
	fneg	%f0, %f0
bnei_cont.91287:
	j	fbgt_cont.91283
fbgt_else.91282:
	fmul	%f1, %f0, %f0
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f1
	fsub	%f6, %f0, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fsub	%f1, %f6, %f1
	flw	%f6, 455(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f3
	fmul	%f0, %f0, %f5
	fadd	%f0, %f1, %f0
fbgt_cont.91283:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.91279:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.91288
	addi	%v1, %zero, 0
	j	fbgt_cont.91289
fbgt_else.91288:
	addi	%v1, %zero, 1
fbgt_cont.91289:
	beqi	%v1, 0, bnei_else.91290
	flw	%f1, 462(%zero)
	j	bnei_cont.91291
bnei_else.91290:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 493(%zero)
	fblt	%f1, %f2, fbgt_else.91292
	addi	%v1, %zero, 1
	j	fbgt_cont.91293
fbgt_else.91292:
	addi	%v1, %zero, 0
fbgt_cont.91293:
	fabs	%f2, %f1
	flw	%f3, 461(%zero)
	fblt	%f2, %f3, fbgt_else.91294
	flw	%f1, 454(%zero)
	fblt	%f2, %f1, fbgt_else.91296
	flw	%f1, 476(%zero)
	flw	%f3, 491(%zero)
	fdiv	%f2, %f3, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fsub	%f1, %f1, %f2
	j	fbgt_cont.91297
fbgt_else.91296:
	flw	%f1, 475(%zero)
	flw	%f3, 491(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
fbgt_cont.91297:
	beqi	%v1, 0, bnei_else.91298
	j	fbgt_cont.91295
bnei_else.91298:
	fneg	%f1, %f1
bnei_cont.91299:
	j	fbgt_cont.91295
fbgt_else.91294:
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 460(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 459(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 458(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 457(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 456(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 455(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
fbgt_cont.91295:
	flw	%f2, 453(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 452(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.91291:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.91300
	addi	%v1, %zero, 0
	j	fbgt_cont.91301
fbgt_else.91300:
	addi	%v1, %zero, 1
fbgt_cont.91301:
	beqi	%v1, 0, bnei_else.91302
	fmov	%f0, %f1
	j	bnei_cont.91303
bnei_else.91302:
bnei_cont.91303:
	flw	%f1, 450(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.91275:
	j	bnei_cont.91269
bnei_else.91272:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f0, 7(%sp)
	fblt	%f0, %f2, fbgt_else.91304
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.91306
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.91308
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.91310
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.91312
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.91314
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.91316
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.91318
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.91320
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.91322
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.91324
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.91326
	flw	%f3, 447(%zero)
	fmov	%f1, %f3
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.91305
fbgt_else.91326:
	fmov	%f1, %f3
fbgt_cont.91327:
	j	fbgt_cont.91305
fbgt_else.91324:
	fmov	%f1, %f3
fbgt_cont.91325:
	j	fbgt_cont.91305
fbgt_else.91322:
	fmov	%f1, %f3
fbgt_cont.91323:
	j	fbgt_cont.91305
fbgt_else.91320:
	fmov	%f1, %f3
fbgt_cont.91321:
	j	fbgt_cont.91305
fbgt_else.91318:
	fmov	%f1, %f3
fbgt_cont.91319:
	j	fbgt_cont.91305
fbgt_else.91316:
	fmov	%f1, %f3
fbgt_cont.91317:
	j	fbgt_cont.91305
fbgt_else.91314:
	fmov	%f1, %f3
fbgt_cont.91315:
	j	fbgt_cont.91305
fbgt_else.91312:
	fmov	%f1, %f3
fbgt_cont.91313:
	j	fbgt_cont.91305
fbgt_else.91310:
	fmov	%f1, %f3
fbgt_cont.91311:
	j	fbgt_cont.91305
fbgt_else.91308:
	fmov	%f1, %f3
fbgt_cont.91309:
	j	fbgt_cont.91305
fbgt_else.91306:
	fmov	%f1, %f3
fbgt_cont.91307:
	j	fbgt_cont.91305
fbgt_else.91304:
	fmov	%f1, %f2
fbgt_cont.91305:
	flw	%f0, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 5(%sp)
	fblt	%f0, %f1, fbgt_else.91328
	addi	%v0, %zero, 0
	j	fbgt_cont.91329
fbgt_else.91328:
	addi	%v0, %zero, 1
fbgt_cont.91329:
	fblt	%f0, %f1, fbgt_else.91330
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91331
fbgt_else.91330:
fbgt_cont.91331:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91332
	beqi	%v0, 0, bnei_else.91334
	addi	%v0, %zero, 0
	j	fbgt_cont.91333
bnei_else.91334:
	addi	%v0, %zero, 1
bnei_cont.91335:
	j	fbgt_cont.91333
fbgt_else.91332:
fbgt_cont.91333:
	fblt	%f0, %f2, fbgt_else.91336
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91337
fbgt_else.91336:
fbgt_cont.91337:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91338
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.91339
fbgt_else.91338:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.91339:
	beqi	%v0, 0, bnei_else.91340
	j	bnei_cont.91341
bnei_else.91340:
	fneg	%f0, %f0
bnei_cont.91341:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.91273:
	j	bnei_cont.91269
bnei_else.91270:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 493(%zero)
	fblt	%f0, %f2, fbgt_else.91342
	addi	%v1, %zero, 1
	j	fbgt_cont.91343
fbgt_else.91342:
	addi	%v1, %zero, 0
fbgt_cont.91343:
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	sw	%v1, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	fblt	%f0, %f2, fbgt_else.91344
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.91346
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.91348
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.91350
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.91352
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.91354
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.91356
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.91358
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.91360
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.91362
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.91364
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.91366
	flw	%f3, 447(%zero)
	fmov	%f1, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.91345
fbgt_else.91366:
	fmov	%f1, %f3
fbgt_cont.91367:
	j	fbgt_cont.91345
fbgt_else.91364:
	fmov	%f1, %f3
fbgt_cont.91365:
	j	fbgt_cont.91345
fbgt_else.91362:
	fmov	%f1, %f3
fbgt_cont.91363:
	j	fbgt_cont.91345
fbgt_else.91360:
	fmov	%f1, %f3
fbgt_cont.91361:
	j	fbgt_cont.91345
fbgt_else.91358:
	fmov	%f1, %f3
fbgt_cont.91359:
	j	fbgt_cont.91345
fbgt_else.91356:
	fmov	%f1, %f3
fbgt_cont.91357:
	j	fbgt_cont.91345
fbgt_else.91354:
	fmov	%f1, %f3
fbgt_cont.91355:
	j	fbgt_cont.91345
fbgt_else.91352:
	fmov	%f1, %f3
fbgt_cont.91353:
	j	fbgt_cont.91345
fbgt_else.91350:
	fmov	%f1, %f3
fbgt_cont.91351:
	j	fbgt_cont.91345
fbgt_else.91348:
	fmov	%f1, %f3
fbgt_cont.91349:
	j	fbgt_cont.91345
fbgt_else.91346:
	fmov	%f1, %f3
fbgt_cont.91347:
	j	fbgt_cont.91345
fbgt_else.91344:
	fmov	%f1, %f2
fbgt_cont.91345:
	flw	%f0, 11(%sp)
	flw	%f2, 10(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 9(%sp)
	fblt	%f0, %f1, fbgt_else.91368
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.91370
	addi	%v0, %zero, 0
	j	fbgt_cont.91369
bnei_else.91370:
	addi	%v0, %zero, 1
bnei_cont.91371:
	j	fbgt_cont.91369
fbgt_else.91368:
	lw	%v0, 8(%sp)
fbgt_cont.91369:
	fblt	%f0, %f1, fbgt_else.91372
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91373
fbgt_else.91372:
fbgt_cont.91373:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91374
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91375
fbgt_else.91374:
fbgt_cont.91375:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91376
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.91377
fbgt_else.91376:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.91377:
	beqi	%v0, 0, bnei_else.91378
	j	bnei_cont.91379
bnei_else.91378:
	fneg	%f0, %f0
bnei_cont.91379:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.91271:
	j	bnei_cont.91269
bnei_else.91268:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.91380
	addi	%v1, %zero, 0
	j	fbgt_cont.91381
fbgt_else.91380:
	addi	%v1, %zero, 1
fbgt_cont.91381:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.91382
	addi	%a0, %zero, 0
	j	fbgt_cont.91383
fbgt_else.91382:
	addi	%a0, %zero, 1
fbgt_cont.91383:
	beqi	%v1, 0, bnei_else.91384
	beqi	%a0, 0, bnei_else.91386
	flw	%f0, 450(%zero)
	j	bnei_cont.91385
bnei_else.91386:
	flw	%f0, 493(%zero)
bnei_cont.91387:
	j	bnei_cont.91385
bnei_else.91384:
	beqi	%a0, 0, bnei_else.91388
	flw	%f0, 493(%zero)
	j	bnei_cont.91389
bnei_else.91388:
	flw	%f0, 450(%zero)
bnei_cont.91389:
bnei_cont.91385:
	fsw	%f0, 146(%zero)
bnei_cont.91269:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.91390
	jr	%ra
bnei_else.91390:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.91392
	addi	%v0, %zero, 0
	j	fbgt_cont.91393
fbgt_else.91392:
	addi	%v0, %zero, 1
fbgt_cont.91393:
	beqi	%v0, 0, bnei_else.91394
	j	bnei_cont.91395
bnei_else.91394:
	fmov	%f0, %f1
bnei_cont.91395:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.91247:
	jr	%ra
iter_trace_diffuse_rays.2980:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.91398
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	lw	%t0, 0(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%t1, %zero, 1
	flw	%f2, 1(%t0)
	flw	%f3, 1(%v1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 493(%zero)
	fblt	%f0, %f2, fbgt_else.91399
	addi	%t0, %zero, 0
	j	fbgt_cont.91400
fbgt_else.91399:
	addi	%t0, %zero, 1
fbgt_cont.91400:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a1, 8(%sp)
	beqi	%t0, 0, bnei_else.91401
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 440(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 9(%sp)
	sw	%t0, 10(%sp)
	sw	%a3, 11(%sp)
	beqi	%t3, -1, bnei_else.91403
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.91405
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.91407
	beqi	%t6, 2, bnei_else.91409
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.91411
	addi	%t6, %zero, 1
	j	fbeq_cont.91412
fbeq_else.91411:
	addi	%t6, %zero, 0
fbeq_cont.91412:
	beqi	%t6, 0, bnei_else.91413
	addi	%t3, %zero, 0
	j	bnei_cont.91408
bnei_else.91413:
	flw	%f9, 1(%t3)
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)
	fmul	%f6, %f9, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6
	fsub	%f6, %f7, %f6
	fblt	%f2, %f6, fbgt_else.91415
	addi	%t5, %zero, 0
	j	fbgt_cont.91416
fbgt_else.91415:
	addi	%t5, %zero, 1
fbgt_cont.91416:
	beqi	%t5, 0, bnei_else.91417
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.91419
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.91420
bnei_else.91419:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.91420:
	addi	%t3, %zero, 1
	j	bnei_cont.91418
bnei_else.91417:
	addi	%t3, %zero, 0
bnei_cont.91418:
bnei_cont.91414:
	j	bnei_cont.91408
bnei_else.91409:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.91421
	addi	%t3, %zero, 0
	j	fbgt_cont.91422
fbgt_else.91421:
	addi	%t3, %zero, 1
fbgt_cont.91422:
	beqi	%t3, 0, bnei_else.91423
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.91424
bnei_else.91423:
	addi	%t3, %zero, 0
bnei_cont.91424:
bnei_cont.91410:
	j	bnei_cont.91408
bnei_else.91407:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	fmul	%f8, %f8, %f9
	flw	%f10, 1(%t5)
	fmul	%f11, %f8, %f10
	fadd	%f11, %f11, %f6
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f12, 1(%t6)
	fblt	%f11, %f12, fbgt_else.91425
	addi	%t6, %zero, 0
	j	fbgt_cont.91426
fbgt_else.91425:
	addi	%t6, %zero, 1
fbgt_cont.91426:
	beqi	%t6, 0, bnei_else.91427
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.91429
	addi	%t6, %zero, 0
	j	fbgt_cont.91430
fbgt_else.91429:
	addi	%t6, %zero, 1
fbgt_cont.91430:
	beqi	%t6, 0, bnei_else.91431
	fbne	%f9, %f2, fbeq_else.91433
	addi	%t6, %zero, 1
	j	fbeq_cont.91434
fbeq_else.91433:
	addi	%t6, %zero, 0
fbeq_cont.91434:
	beqi	%t6, 0, bnei_else.91435
	addi	%t6, %zero, 0
	j	bnei_cont.91428
bnei_else.91435:
	addi	%t6, %zero, 1
bnei_cont.91436:
	j	bnei_cont.91428
bnei_else.91431:
	addi	%t6, %zero, 0
bnei_cont.91432:
	j	bnei_cont.91428
bnei_else.91427:
	addi	%t6, %zero, 0
bnei_cont.91428:
	beqi	%t6, 0, bnei_else.91437
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.91438
bnei_else.91437:
	flw	%f8, 2(%t3)
	fsub	%f8, %f8, %f6
	flw	%f9, 3(%t3)
	fmul	%f8, %f8, %f9
	flw	%f11, 0(%t5)
	fmul	%f13, %f8, %f11
	fadd	%f13, %f13, %f5
	fabs	%f13, %f13
	lw	%t6, 4(%t4)
	flw	%f14, 0(%t6)
	fblt	%f13, %f14, fbgt_else.91439
	addi	%t6, %zero, 0
	j	fbgt_cont.91440
fbgt_else.91439:
	addi	%t6, %zero, 1
fbgt_cont.91440:
	beqi	%t6, 0, bnei_else.91441
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.91443
	addi	%t4, %zero, 0
	j	fbgt_cont.91444
fbgt_else.91443:
	addi	%t4, %zero, 1
fbgt_cont.91444:
	beqi	%t4, 0, bnei_else.91445
	fbne	%f9, %f2, fbeq_else.91447
	addi	%t4, %zero, 1
	j	fbeq_cont.91448
fbeq_else.91447:
	addi	%t4, %zero, 0
fbeq_cont.91448:
	beqi	%t4, 0, bnei_else.91449
	addi	%t4, %zero, 0
	j	bnei_cont.91442
bnei_else.91449:
	addi	%t4, %zero, 1
bnei_cont.91450:
	j	bnei_cont.91442
bnei_else.91445:
	addi	%t4, %zero, 0
bnei_cont.91446:
	j	bnei_cont.91442
bnei_else.91441:
	addi	%t4, %zero, 0
bnei_cont.91442:
	beqi	%t4, 0, bnei_else.91451
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.91452
bnei_else.91451:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.91453
	addi	%t3, %zero, 0
	j	fbgt_cont.91454
fbgt_else.91453:
	addi	%t3, %zero, 1
fbgt_cont.91454:
	beqi	%t3, 0, bnei_else.91455
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.91457
	addi	%t3, %zero, 0
	j	fbgt_cont.91458
fbgt_else.91457:
	addi	%t3, %zero, 1
fbgt_cont.91458:
	beqi	%t3, 0, bnei_else.91459
	fbne	%f8, %f2, fbeq_else.91461
	addi	%t3, %zero, 1
	j	fbeq_cont.91462
fbeq_else.91461:
	addi	%t3, %zero, 0
fbeq_cont.91462:
	beqi	%t3, 0, bnei_else.91463
	addi	%t3, %zero, 0
	j	bnei_cont.91456
bnei_else.91463:
	addi	%t3, %zero, 1
bnei_cont.91464:
	j	bnei_cont.91456
bnei_else.91459:
	addi	%t3, %zero, 0
bnei_cont.91460:
	j	bnei_cont.91456
bnei_else.91455:
	addi	%t3, %zero, 0
bnei_cont.91456:
	beqi	%t3, 0, bnei_else.91465
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.91466
bnei_else.91465:
	addi	%t3, %zero, 0
bnei_cont.91466:
bnei_cont.91452:
bnei_cont.91438:
bnei_cont.91408:
	beqi	%t3, 0, bnei_else.91467
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.91469
	addi	%t3, %zero, 0
	j	fbgt_cont.91470
fbgt_else.91469:
	addi	%t3, %zero, 1
fbgt_cont.91470:
	beqi	%t3, 0, bnei_else.91471
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.91473
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91475
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91477
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91479
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.91406
bnei_else.91479:
bnei_cont.91480:
	j	bnei_cont.91406
bnei_else.91477:
bnei_cont.91478:
	j	bnei_cont.91406
bnei_else.91475:
bnei_cont.91476:
	j	bnei_cont.91406
bnei_else.91473:
bnei_cont.91474:
	j	bnei_cont.91406
bnei_else.91471:
bnei_cont.91472:
	j	bnei_cont.91406
bnei_else.91467:
bnei_cont.91468:
	j	bnei_cont.91406
bnei_else.91405:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.91481
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91483
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91485
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91487
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.91482
bnei_else.91487:
bnei_cont.91488:
	j	bnei_cont.91482
bnei_else.91485:
bnei_cont.91486:
	j	bnei_cont.91482
bnei_else.91483:
bnei_cont.91484:
	j	bnei_cont.91482
bnei_else.91481:
bnei_cont.91482:
bnei_cont.91406:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.91404
bnei_else.91403:
bnei_cont.91404:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91489
	addi	%v0, %zero, 0
	j	fbgt_cont.91490
fbgt_else.91489:
	addi	%v0, %zero, 1
fbgt_cont.91490:
	beqi	%v0, 0, bnei_else.91491
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.91493
	addi	%v0, %zero, 0
	j	bnei_cont.91492
fbgt_else.91493:
	addi	%v0, %zero, 1
fbgt_cont.91494:
	j	bnei_cont.91492
bnei_else.91491:
	addi	%v0, %zero, 0
bnei_cont.91492:
	beqi	%v0, 0, bnei_else.91495
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.91497
	beqi	%a0, 2, bnei_else.91499
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.91501
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)
	fmul	%f7, %f7, %f9
	fadd	%f3, %f3, %f7
	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f9
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	fmul	%f0, %f0, %f8
	fmul	%f1, %f1, %f6
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f9
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.91502
bnei_else.91501:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.91502:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.91503
	addi	%a0, %zero, 1
	j	fbeq_cont.91504
fbeq_else.91503:
	addi	%a0, %zero, 0
fbeq_cont.91504:
	beqi	%a0, 0, bnei_else.91505
	flw	%f1, 491(%zero)
	j	bnei_cont.91506
bnei_else.91505:
	beqi	%v1, 0, bnei_else.91507
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.91508
bnei_else.91507:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.91508:
bnei_cont.91506:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.91498
bnei_else.91499:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.91500:
	j	bnei_cont.91498
bnei_else.91497:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.91509
	addi	%v1, %zero, 1
	j	fbeq_cont.91510
fbeq_else.91509:
	addi	%v1, %zero, 0
fbeq_cont.91510:
	beqi	%v1, 0, bnei_else.91511
	fmov	%f1, %f0
	j	bnei_cont.91512
bnei_else.91511:
	fblt	%f0, %f1, fbgt_else.91513
	addi	%v1, %zero, 0
	j	fbgt_cont.91514
fbgt_else.91513:
	addi	%v1, %zero, 1
fbgt_cont.91514:
	beqi	%v1, 0, bnei_else.91515
	flw	%f1, 491(%zero)
	j	bnei_cont.91516
bnei_else.91515:
	flw	%f1, 490(%zero)
bnei_cont.91516:
bnei_cont.91512:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.91498:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 14(%sp)
	beqi	%v1, 1, bnei_else.91517
	beqi	%v1, 2, bnei_else.91519
	beqi	%v1, 3, bnei_else.91521
	beqi	%v1, 4, bnei_else.91523
	j	bnei_cont.91518
bnei_else.91523:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.91525
	addi	%v1, %zero, 0
	j	fbgt_cont.91526
fbgt_else.91525:
	addi	%v1, %zero, 1
fbgt_cont.91526:
	beqi	%v1, 0, bnei_else.91527
	flw	%f0, 462(%zero)
	j	bnei_cont.91528
bnei_else.91527:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.91529
	addi	%v1, %zero, 1
	j	fbgt_cont.91530
fbgt_else.91529:
	addi	%v1, %zero, 0
fbgt_cont.91530:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.91531
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.91533
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.91534
fbgt_else.91533:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.91534:
	beqi	%v1, 0, bnei_else.91535
	j	fbgt_cont.91532
bnei_else.91535:
	fneg	%f0, %f0
bnei_cont.91536:
	j	fbgt_cont.91532
fbgt_else.91531:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.91532:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.91528:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.91537
	addi	%v1, %zero, 0
	j	fbgt_cont.91538
fbgt_else.91537:
	addi	%v1, %zero, 1
fbgt_cont.91538:
	beqi	%v1, 0, bnei_else.91539
	flw	%f1, 462(%zero)
	j	bnei_cont.91540
bnei_else.91539:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.91541
	addi	%v1, %zero, 1
	j	fbgt_cont.91542
fbgt_else.91541:
	addi	%v1, %zero, 0
fbgt_cont.91542:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.91543
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.91545
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.91546
fbgt_else.91545:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.91546:
	beqi	%v1, 0, bnei_else.91547
	j	fbgt_cont.91544
bnei_else.91547:
	fneg	%f1, %f1
bnei_cont.91548:
	j	fbgt_cont.91544
fbgt_else.91543:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.91544:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.91540:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.91549
	addi	%v1, %zero, 0
	j	fbgt_cont.91550
fbgt_else.91549:
	addi	%v1, %zero, 1
fbgt_cont.91550:
	beqi	%v1, 0, bnei_else.91551
	fmov	%f0, %f1
	j	bnei_cont.91552
bnei_else.91551:
bnei_cont.91552:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.91524:
	j	bnei_cont.91518
bnei_else.91521:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 15(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.91553
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.91555
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.91557
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.91559
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.91561
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.91563
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.91565
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.91567
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.91569
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.91571
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.91573
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.91554
fbgt_else.91573:
	fmov	%f0, %f3
fbgt_cont.91574:
	j	fbgt_cont.91554
fbgt_else.91571:
	fmov	%f0, %f3
fbgt_cont.91572:
	j	fbgt_cont.91554
fbgt_else.91569:
	fmov	%f0, %f3
fbgt_cont.91570:
	j	fbgt_cont.91554
fbgt_else.91567:
	fmov	%f0, %f3
fbgt_cont.91568:
	j	fbgt_cont.91554
fbgt_else.91565:
	fmov	%f0, %f3
fbgt_cont.91566:
	j	fbgt_cont.91554
fbgt_else.91563:
	fmov	%f0, %f3
fbgt_cont.91564:
	j	fbgt_cont.91554
fbgt_else.91561:
	fmov	%f0, %f3
fbgt_cont.91562:
	j	fbgt_cont.91554
fbgt_else.91559:
	fmov	%f0, %f3
fbgt_cont.91560:
	j	fbgt_cont.91554
fbgt_else.91557:
	fmov	%f0, %f3
fbgt_cont.91558:
	j	fbgt_cont.91554
fbgt_else.91555:
	fmov	%f0, %f3
fbgt_cont.91556:
	j	fbgt_cont.91554
fbgt_else.91553:
	fmov	%f0, %f2
fbgt_cont.91554:
	flw	%f1, 16(%sp)
	flw	%f2, 17(%sp)
	fblt	%f1, %f2, fbgt_else.91575
	fblt	%f1, %f0, fbgt_else.91577
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91579
	fblt	%f1, %f0, fbgt_else.91581
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91583
	fblt	%f1, %f0, fbgt_else.91585
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.91576
fbgt_else.91585:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.91586:
	j	fbgt_cont.91576
fbgt_else.91583:
	fmov	%f0, %f1
fbgt_cont.91584:
	j	fbgt_cont.91576
fbgt_else.91581:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91587
	fblt	%f1, %f0, fbgt_else.91589
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.91588
fbgt_else.91589:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.91590:
	j	fbgt_cont.91588
fbgt_else.91587:
	fmov	%f0, %f1
fbgt_cont.91588:
fbgt_cont.91582:
	j	fbgt_cont.91576
fbgt_else.91579:
	fmov	%f0, %f1
fbgt_cont.91580:
	j	fbgt_cont.91576
fbgt_else.91577:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91591
	fblt	%f1, %f0, fbgt_else.91593
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91595
	fblt	%f1, %f0, fbgt_else.91597
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.91592
fbgt_else.91597:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.91598:
	j	fbgt_cont.91592
fbgt_else.91595:
	fmov	%f0, %f1
fbgt_cont.91596:
	j	fbgt_cont.91592
fbgt_else.91593:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91599
	fblt	%f1, %f0, fbgt_else.91601
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.91600
fbgt_else.91601:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.91602:
	j	fbgt_cont.91600
fbgt_else.91599:
	fmov	%f0, %f1
fbgt_cont.91600:
fbgt_cont.91594:
	j	fbgt_cont.91592
fbgt_else.91591:
	fmov	%f0, %f1
fbgt_cont.91592:
fbgt_cont.91578:
	j	fbgt_cont.91576
fbgt_else.91575:
	fmov	%f0, %f1
fbgt_cont.91576:
	flw	%f1, 15(%sp)
	fblt	%f0, %f1, fbgt_else.91603
	addi	%v0, %zero, 0
	j	fbgt_cont.91604
fbgt_else.91603:
	addi	%v0, %zero, 1
fbgt_cont.91604:
	fblt	%f0, %f1, fbgt_else.91605
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91606
fbgt_else.91605:
fbgt_cont.91606:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91607
	beqi	%v0, 0, bnei_else.91609
	addi	%v0, %zero, 0
	j	fbgt_cont.91608
bnei_else.91609:
	addi	%v0, %zero, 1
bnei_cont.91610:
	j	fbgt_cont.91608
fbgt_else.91607:
fbgt_cont.91608:
	fblt	%f0, %f2, fbgt_else.91611
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91612
fbgt_else.91611:
fbgt_cont.91612:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91613
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.91614
fbgt_else.91613:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.91614:
	beqi	%v0, 0, bnei_else.91615
	j	bnei_cont.91616
bnei_else.91615:
	fneg	%f0, %f0
bnei_cont.91616:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.91522:
	j	bnei_cont.91518
bnei_else.91519:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.91617
	addi	%v1, %zero, 1
	j	fbgt_cont.91618
fbgt_else.91617:
	addi	%v1, %zero, 0
fbgt_cont.91618:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 18(%sp)
	fsw	%f1, 19(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fblt	%f0, %f3, fbgt_else.91619
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.91621
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.91623
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.91625
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.91627
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.91629
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.91631
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.91633
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.91635
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.91637
	flw	%f4, 478(%zero)
	fblt	%f0, %f4, fbgt_else.91639
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.91620
fbgt_else.91639:
	fmov	%f0, %f4
fbgt_cont.91640:
	j	fbgt_cont.91620
fbgt_else.91637:
	fmov	%f0, %f4
fbgt_cont.91638:
	j	fbgt_cont.91620
fbgt_else.91635:
	fmov	%f0, %f4
fbgt_cont.91636:
	j	fbgt_cont.91620
fbgt_else.91633:
	fmov	%f0, %f4
fbgt_cont.91634:
	j	fbgt_cont.91620
fbgt_else.91631:
	fmov	%f0, %f4
fbgt_cont.91632:
	j	fbgt_cont.91620
fbgt_else.91629:
	fmov	%f0, %f4
fbgt_cont.91630:
	j	fbgt_cont.91620
fbgt_else.91627:
	fmov	%f0, %f4
fbgt_cont.91628:
	j	fbgt_cont.91620
fbgt_else.91625:
	fmov	%f0, %f4
fbgt_cont.91626:
	j	fbgt_cont.91620
fbgt_else.91623:
	fmov	%f0, %f4
fbgt_cont.91624:
	j	fbgt_cont.91620
fbgt_else.91621:
	fmov	%f0, %f4
fbgt_cont.91622:
	j	fbgt_cont.91620
fbgt_else.91619:
	fmov	%f0, %f3
fbgt_cont.91620:
	flw	%f1, 20(%sp)
	flw	%f2, 21(%sp)
	fblt	%f1, %f2, fbgt_else.91641
	fblt	%f1, %f0, fbgt_else.91643
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91645
	fblt	%f1, %f0, fbgt_else.91647
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91649
	fblt	%f1, %f0, fbgt_else.91651
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.91642
fbgt_else.91651:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.91652:
	j	fbgt_cont.91642
fbgt_else.91649:
	fmov	%f0, %f1
fbgt_cont.91650:
	j	fbgt_cont.91642
fbgt_else.91647:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91653
	fblt	%f1, %f0, fbgt_else.91655
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.91654
fbgt_else.91655:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.91656:
	j	fbgt_cont.91654
fbgt_else.91653:
	fmov	%f0, %f1
fbgt_cont.91654:
fbgt_cont.91648:
	j	fbgt_cont.91642
fbgt_else.91645:
	fmov	%f0, %f1
fbgt_cont.91646:
	j	fbgt_cont.91642
fbgt_else.91643:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91657
	fblt	%f1, %f0, fbgt_else.91659
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91661
	fblt	%f1, %f0, fbgt_else.91663
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.91658
fbgt_else.91663:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.91664:
	j	fbgt_cont.91658
fbgt_else.91661:
	fmov	%f0, %f1
fbgt_cont.91662:
	j	fbgt_cont.91658
fbgt_else.91659:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91665
	fblt	%f1, %f0, fbgt_else.91667
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.91666
fbgt_else.91667:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.91668:
	j	fbgt_cont.91666
fbgt_else.91665:
	fmov	%f0, %f1
fbgt_cont.91666:
fbgt_cont.91660:
	j	fbgt_cont.91658
fbgt_else.91657:
	fmov	%f0, %f1
fbgt_cont.91658:
fbgt_cont.91644:
	j	fbgt_cont.91642
fbgt_else.91641:
	fmov	%f0, %f1
fbgt_cont.91642:
	flw	%f1, 19(%sp)
	fblt	%f0, %f1, fbgt_else.91669
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.91671
	addi	%v0, %zero, 0
	j	fbgt_cont.91670
bnei_else.91671:
	addi	%v0, %zero, 1
bnei_cont.91672:
	j	fbgt_cont.91670
fbgt_else.91669:
	lw	%v0, 18(%sp)
fbgt_cont.91670:
	fblt	%f0, %f1, fbgt_else.91673
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91674
fbgt_else.91673:
fbgt_cont.91674:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91675
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91676
fbgt_else.91675:
fbgt_cont.91676:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91677
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.91678
fbgt_else.91677:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.91678:
	beqi	%v0, 0, bnei_else.91679
	j	bnei_cont.91680
bnei_else.91679:
	fneg	%f0, %f0
bnei_cont.91680:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.91520:
	j	bnei_cont.91518
bnei_else.91517:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.91681
	addi	%v1, %zero, 0
	j	fbgt_cont.91682
fbgt_else.91681:
	addi	%v1, %zero, 1
fbgt_cont.91682:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.91683
	addi	%a0, %zero, 0
	j	fbgt_cont.91684
fbgt_else.91683:
	addi	%a0, %zero, 1
fbgt_cont.91684:
	beqi	%v1, 0, bnei_else.91685
	beqi	%a0, 0, bnei_else.91687
	flw	%f0, 450(%zero)
	j	bnei_cont.91686
bnei_else.91687:
	flw	%f0, 3(%sp)
bnei_cont.91688:
	j	bnei_cont.91686
bnei_else.91685:
	beqi	%a0, 0, bnei_else.91689
	flw	%f0, 3(%sp)
	j	bnei_cont.91690
bnei_else.91689:
	flw	%f0, 450(%zero)
bnei_cont.91690:
bnei_cont.91686:
	fsw	%f0, 146(%zero)
bnei_cont.91518:
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	beqi	%v0, 0, bnei_else.91691
	j	bnei_cont.91402
bnei_else.91691:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.91693
	addi	%v0, %zero, 0
	j	fbgt_cont.91694
fbgt_else.91693:
	addi	%v0, %zero, 1
fbgt_cont.91694:
	beqi	%v0, 0, bnei_else.91695
	j	bnei_cont.91696
bnei_else.91695:
	fmov	%f0, %f1
bnei_cont.91696:
	flw	%f2, 9(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 14(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.91692:
	j	bnei_cont.91402
bnei_else.91495:
bnei_cont.91496:
	j	bnei_cont.91402
bnei_else.91401:
	flw	%f5, 439(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 22(%sp)
	sw	%t0, 23(%sp)
	sw	%a3, 24(%sp)
	beqi	%t3, -1, bnei_else.91697
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.91699
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.91701
	beqi	%t6, 2, bnei_else.91703
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.91705
	addi	%t6, %zero, 1
	j	fbeq_cont.91706
fbeq_else.91705:
	addi	%t6, %zero, 0
fbeq_cont.91706:
	beqi	%t6, 0, bnei_else.91707
	addi	%t3, %zero, 0
	j	bnei_cont.91702
bnei_else.91707:
	flw	%f9, 1(%t3)
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)
	fmul	%f6, %f9, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6
	fsub	%f6, %f7, %f6
	fblt	%f2, %f6, fbgt_else.91709
	addi	%t5, %zero, 0
	j	fbgt_cont.91710
fbgt_else.91709:
	addi	%t5, %zero, 1
fbgt_cont.91710:
	beqi	%t5, 0, bnei_else.91711
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.91713
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.91714
bnei_else.91713:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.91714:
	addi	%t3, %zero, 1
	j	bnei_cont.91712
bnei_else.91711:
	addi	%t3, %zero, 0
bnei_cont.91712:
bnei_cont.91708:
	j	bnei_cont.91702
bnei_else.91703:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.91715
	addi	%t3, %zero, 0
	j	fbgt_cont.91716
fbgt_else.91715:
	addi	%t3, %zero, 1
fbgt_cont.91716:
	beqi	%t3, 0, bnei_else.91717
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.91718
bnei_else.91717:
	addi	%t3, %zero, 0
bnei_cont.91718:
bnei_cont.91704:
	j	bnei_cont.91702
bnei_else.91701:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	fmul	%f8, %f8, %f9
	flw	%f10, 1(%t5)
	fmul	%f11, %f8, %f10
	fadd	%f11, %f11, %f6
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f12, 1(%t6)
	fblt	%f11, %f12, fbgt_else.91719
	addi	%t6, %zero, 0
	j	fbgt_cont.91720
fbgt_else.91719:
	addi	%t6, %zero, 1
fbgt_cont.91720:
	beqi	%t6, 0, bnei_else.91721
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.91723
	addi	%t6, %zero, 0
	j	fbgt_cont.91724
fbgt_else.91723:
	addi	%t6, %zero, 1
fbgt_cont.91724:
	beqi	%t6, 0, bnei_else.91725
	fbne	%f9, %f2, fbeq_else.91727
	addi	%t6, %zero, 1
	j	fbeq_cont.91728
fbeq_else.91727:
	addi	%t6, %zero, 0
fbeq_cont.91728:
	beqi	%t6, 0, bnei_else.91729
	addi	%t6, %zero, 0
	j	bnei_cont.91722
bnei_else.91729:
	addi	%t6, %zero, 1
bnei_cont.91730:
	j	bnei_cont.91722
bnei_else.91725:
	addi	%t6, %zero, 0
bnei_cont.91726:
	j	bnei_cont.91722
bnei_else.91721:
	addi	%t6, %zero, 0
bnei_cont.91722:
	beqi	%t6, 0, bnei_else.91731
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.91732
bnei_else.91731:
	flw	%f8, 2(%t3)
	fsub	%f8, %f8, %f6
	flw	%f9, 3(%t3)
	fmul	%f8, %f8, %f9
	flw	%f11, 0(%t5)
	fmul	%f13, %f8, %f11
	fadd	%f13, %f13, %f5
	fabs	%f13, %f13
	lw	%t6, 4(%t4)
	flw	%f14, 0(%t6)
	fblt	%f13, %f14, fbgt_else.91733
	addi	%t6, %zero, 0
	j	fbgt_cont.91734
fbgt_else.91733:
	addi	%t6, %zero, 1
fbgt_cont.91734:
	beqi	%t6, 0, bnei_else.91735
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.91737
	addi	%t4, %zero, 0
	j	fbgt_cont.91738
fbgt_else.91737:
	addi	%t4, %zero, 1
fbgt_cont.91738:
	beqi	%t4, 0, bnei_else.91739
	fbne	%f9, %f2, fbeq_else.91741
	addi	%t4, %zero, 1
	j	fbeq_cont.91742
fbeq_else.91741:
	addi	%t4, %zero, 0
fbeq_cont.91742:
	beqi	%t4, 0, bnei_else.91743
	addi	%t4, %zero, 0
	j	bnei_cont.91736
bnei_else.91743:
	addi	%t4, %zero, 1
bnei_cont.91744:
	j	bnei_cont.91736
bnei_else.91739:
	addi	%t4, %zero, 0
bnei_cont.91740:
	j	bnei_cont.91736
bnei_else.91735:
	addi	%t4, %zero, 0
bnei_cont.91736:
	beqi	%t4, 0, bnei_else.91745
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.91746
bnei_else.91745:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.91747
	addi	%t3, %zero, 0
	j	fbgt_cont.91748
fbgt_else.91747:
	addi	%t3, %zero, 1
fbgt_cont.91748:
	beqi	%t3, 0, bnei_else.91749
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.91751
	addi	%t3, %zero, 0
	j	fbgt_cont.91752
fbgt_else.91751:
	addi	%t3, %zero, 1
fbgt_cont.91752:
	beqi	%t3, 0, bnei_else.91753
	fbne	%f8, %f2, fbeq_else.91755
	addi	%t3, %zero, 1
	j	fbeq_cont.91756
fbeq_else.91755:
	addi	%t3, %zero, 0
fbeq_cont.91756:
	beqi	%t3, 0, bnei_else.91757
	addi	%t3, %zero, 0
	j	bnei_cont.91750
bnei_else.91757:
	addi	%t3, %zero, 1
bnei_cont.91758:
	j	bnei_cont.91750
bnei_else.91753:
	addi	%t3, %zero, 0
bnei_cont.91754:
	j	bnei_cont.91750
bnei_else.91749:
	addi	%t3, %zero, 0
bnei_cont.91750:
	beqi	%t3, 0, bnei_else.91759
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.91760
bnei_else.91759:
	addi	%t3, %zero, 0
bnei_cont.91760:
bnei_cont.91746:
bnei_cont.91732:
bnei_cont.91702:
	beqi	%t3, 0, bnei_else.91761
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.91763
	addi	%t3, %zero, 0
	j	fbgt_cont.91764
fbgt_else.91763:
	addi	%t3, %zero, 1
fbgt_cont.91764:
	beqi	%t3, 0, bnei_else.91765
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.91767
	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91769
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91771
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91773
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 25(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.91700
bnei_else.91773:
bnei_cont.91774:
	j	bnei_cont.91700
bnei_else.91771:
bnei_cont.91772:
	j	bnei_cont.91700
bnei_else.91769:
bnei_cont.91770:
	j	bnei_cont.91700
bnei_else.91767:
bnei_cont.91768:
	j	bnei_cont.91700
bnei_else.91765:
bnei_cont.91766:
	j	bnei_cont.91700
bnei_else.91761:
bnei_cont.91762:
	j	bnei_cont.91700
bnei_else.91699:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.91775
	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.91777
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.91779
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.91781
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 25(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.91776
bnei_else.91781:
bnei_cont.91782:
	j	bnei_cont.91776
bnei_else.91779:
bnei_cont.91780:
	j	bnei_cont.91776
bnei_else.91777:
bnei_cont.91778:
	j	bnei_cont.91776
bnei_else.91775:
bnei_cont.91776:
bnei_cont.91700:
	lw	%v0, 12(%sp)
	lw	%v1, 23(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.91698
bnei_else.91697:
bnei_cont.91698:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91783
	addi	%v0, %zero, 0
	j	fbgt_cont.91784
fbgt_else.91783:
	addi	%v0, %zero, 1
fbgt_cont.91784:
	beqi	%v0, 0, bnei_else.91785
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.91787
	addi	%v0, %zero, 0
	j	bnei_cont.91786
fbgt_else.91787:
	addi	%v0, %zero, 1
fbgt_cont.91788:
	j	bnei_cont.91786
bnei_else.91785:
	addi	%v0, %zero, 0
bnei_cont.91786:
	beqi	%v0, 0, bnei_else.91789
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 24(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.91791
	beqi	%a0, 2, bnei_else.91793
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.91795
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)
	fmul	%f7, %f7, %f9
	fadd	%f3, %f3, %f7
	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f9
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	fmul	%f0, %f0, %f8
	fmul	%f1, %f1, %f6
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f9
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.91796
bnei_else.91795:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.91796:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.91797
	addi	%a0, %zero, 1
	j	fbeq_cont.91798
fbeq_else.91797:
	addi	%a0, %zero, 0
fbeq_cont.91798:
	beqi	%a0, 0, bnei_else.91799
	flw	%f1, 491(%zero)
	j	bnei_cont.91800
bnei_else.91799:
	beqi	%v1, 0, bnei_else.91801
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.91802
bnei_else.91801:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.91802:
bnei_cont.91800:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.91792
bnei_else.91793:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.91794:
	j	bnei_cont.91792
bnei_else.91791:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.91803
	addi	%v1, %zero, 1
	j	fbeq_cont.91804
fbeq_else.91803:
	addi	%v1, %zero, 0
fbeq_cont.91804:
	beqi	%v1, 0, bnei_else.91805
	fmov	%f1, %f0
	j	bnei_cont.91806
bnei_else.91805:
	fblt	%f0, %f1, fbgt_else.91807
	addi	%v1, %zero, 0
	j	fbgt_cont.91808
fbgt_else.91807:
	addi	%v1, %zero, 1
fbgt_cont.91808:
	beqi	%v1, 0, bnei_else.91809
	flw	%f1, 491(%zero)
	j	bnei_cont.91810
bnei_else.91809:
	flw	%f1, 490(%zero)
bnei_cont.91810:
bnei_cont.91806:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.91792:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 26(%sp)
	beqi	%v1, 1, bnei_else.91811
	beqi	%v1, 2, bnei_else.91813
	beqi	%v1, 3, bnei_else.91815
	beqi	%v1, 4, bnei_else.91817
	j	bnei_cont.91812
bnei_else.91817:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.91819
	addi	%v1, %zero, 0
	j	fbgt_cont.91820
fbgt_else.91819:
	addi	%v1, %zero, 1
fbgt_cont.91820:
	beqi	%v1, 0, bnei_else.91821
	flw	%f0, 462(%zero)
	j	bnei_cont.91822
bnei_else.91821:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.91823
	addi	%v1, %zero, 1
	j	fbgt_cont.91824
fbgt_else.91823:
	addi	%v1, %zero, 0
fbgt_cont.91824:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.91825
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.91827
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.91828
fbgt_else.91827:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.91828:
	beqi	%v1, 0, bnei_else.91829
	j	fbgt_cont.91826
bnei_else.91829:
	fneg	%f0, %f0
bnei_cont.91830:
	j	fbgt_cont.91826
fbgt_else.91825:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.91826:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.91822:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.91831
	addi	%v1, %zero, 0
	j	fbgt_cont.91832
fbgt_else.91831:
	addi	%v1, %zero, 1
fbgt_cont.91832:
	beqi	%v1, 0, bnei_else.91833
	flw	%f1, 462(%zero)
	j	bnei_cont.91834
bnei_else.91833:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.91835
	addi	%v1, %zero, 1
	j	fbgt_cont.91836
fbgt_else.91835:
	addi	%v1, %zero, 0
fbgt_cont.91836:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.91837
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.91839
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.91840
fbgt_else.91839:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.91840:
	beqi	%v1, 0, bnei_else.91841
	j	fbgt_cont.91838
bnei_else.91841:
	fneg	%f1, %f1
bnei_cont.91842:
	j	fbgt_cont.91838
fbgt_else.91837:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.91838:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.91834:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.91843
	addi	%v1, %zero, 0
	j	fbgt_cont.91844
fbgt_else.91843:
	addi	%v1, %zero, 1
fbgt_cont.91844:
	beqi	%v1, 0, bnei_else.91845
	fmov	%f0, %f1
	j	bnei_cont.91846
bnei_else.91845:
bnei_cont.91846:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.91818:
	j	bnei_cont.91812
bnei_else.91815:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 27(%sp)
	fsw	%f0, 28(%sp)
	fsw	%f2, 29(%sp)
	fblt	%f0, %f2, fbgt_else.91847
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.91849
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.91851
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.91853
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.91855
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.91857
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.91859
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.91861
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.91863
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.91865
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.91867
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.91848
fbgt_else.91867:
	fmov	%f0, %f3
fbgt_cont.91868:
	j	fbgt_cont.91848
fbgt_else.91865:
	fmov	%f0, %f3
fbgt_cont.91866:
	j	fbgt_cont.91848
fbgt_else.91863:
	fmov	%f0, %f3
fbgt_cont.91864:
	j	fbgt_cont.91848
fbgt_else.91861:
	fmov	%f0, %f3
fbgt_cont.91862:
	j	fbgt_cont.91848
fbgt_else.91859:
	fmov	%f0, %f3
fbgt_cont.91860:
	j	fbgt_cont.91848
fbgt_else.91857:
	fmov	%f0, %f3
fbgt_cont.91858:
	j	fbgt_cont.91848
fbgt_else.91855:
	fmov	%f0, %f3
fbgt_cont.91856:
	j	fbgt_cont.91848
fbgt_else.91853:
	fmov	%f0, %f3
fbgt_cont.91854:
	j	fbgt_cont.91848
fbgt_else.91851:
	fmov	%f0, %f3
fbgt_cont.91852:
	j	fbgt_cont.91848
fbgt_else.91849:
	fmov	%f0, %f3
fbgt_cont.91850:
	j	fbgt_cont.91848
fbgt_else.91847:
	fmov	%f0, %f2
fbgt_cont.91848:
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)
	fblt	%f1, %f2, fbgt_else.91869
	fblt	%f1, %f0, fbgt_else.91871
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91873
	fblt	%f1, %f0, fbgt_else.91875
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91877
	fblt	%f1, %f0, fbgt_else.91879
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.91870
fbgt_else.91879:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.91880:
	j	fbgt_cont.91870
fbgt_else.91877:
	fmov	%f0, %f1
fbgt_cont.91878:
	j	fbgt_cont.91870
fbgt_else.91875:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91881
	fblt	%f1, %f0, fbgt_else.91883
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.91882
fbgt_else.91883:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.91884:
	j	fbgt_cont.91882
fbgt_else.91881:
	fmov	%f0, %f1
fbgt_cont.91882:
fbgt_cont.91876:
	j	fbgt_cont.91870
fbgt_else.91873:
	fmov	%f0, %f1
fbgt_cont.91874:
	j	fbgt_cont.91870
fbgt_else.91871:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91885
	fblt	%f1, %f0, fbgt_else.91887
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91889
	fblt	%f1, %f0, fbgt_else.91891
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.91886
fbgt_else.91891:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.91892:
	j	fbgt_cont.91886
fbgt_else.91889:
	fmov	%f0, %f1
fbgt_cont.91890:
	j	fbgt_cont.91886
fbgt_else.91887:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91893
	fblt	%f1, %f0, fbgt_else.91895
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.91894
fbgt_else.91895:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.91896:
	j	fbgt_cont.91894
fbgt_else.91893:
	fmov	%f0, %f1
fbgt_cont.91894:
fbgt_cont.91888:
	j	fbgt_cont.91886
fbgt_else.91885:
	fmov	%f0, %f1
fbgt_cont.91886:
fbgt_cont.91872:
	j	fbgt_cont.91870
fbgt_else.91869:
	fmov	%f0, %f1
fbgt_cont.91870:
	flw	%f1, 27(%sp)
	fblt	%f0, %f1, fbgt_else.91897
	addi	%v0, %zero, 0
	j	fbgt_cont.91898
fbgt_else.91897:
	addi	%v0, %zero, 1
fbgt_cont.91898:
	fblt	%f0, %f1, fbgt_else.91899
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91900
fbgt_else.91899:
fbgt_cont.91900:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91901
	beqi	%v0, 0, bnei_else.91903
	addi	%v0, %zero, 0
	j	fbgt_cont.91902
bnei_else.91903:
	addi	%v0, %zero, 1
bnei_cont.91904:
	j	fbgt_cont.91902
fbgt_else.91901:
fbgt_cont.91902:
	fblt	%f0, %f2, fbgt_else.91905
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91906
fbgt_else.91905:
fbgt_cont.91906:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91907
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.91908
fbgt_else.91907:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.91908:
	beqi	%v0, 0, bnei_else.91909
	j	bnei_cont.91910
bnei_else.91909:
	fneg	%f0, %f0
bnei_cont.91910:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.91816:
	j	bnei_cont.91812
bnei_else.91813:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.91911
	addi	%v1, %zero, 1
	j	fbgt_cont.91912
fbgt_else.91911:
	addi	%v1, %zero, 0
fbgt_cont.91912:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 30(%sp)
	fsw	%f1, 31(%sp)
	fsw	%f0, 32(%sp)
	fsw	%f3, 33(%sp)
	fblt	%f0, %f3, fbgt_else.91913
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.91915
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.91917
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.91919
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.91921
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.91923
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.91925
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.91927
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.91929
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.91931
	flw	%f4, 478(%zero)
	fblt	%f0, %f4, fbgt_else.91933
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.91914
fbgt_else.91933:
	fmov	%f0, %f4
fbgt_cont.91934:
	j	fbgt_cont.91914
fbgt_else.91931:
	fmov	%f0, %f4
fbgt_cont.91932:
	j	fbgt_cont.91914
fbgt_else.91929:
	fmov	%f0, %f4
fbgt_cont.91930:
	j	fbgt_cont.91914
fbgt_else.91927:
	fmov	%f0, %f4
fbgt_cont.91928:
	j	fbgt_cont.91914
fbgt_else.91925:
	fmov	%f0, %f4
fbgt_cont.91926:
	j	fbgt_cont.91914
fbgt_else.91923:
	fmov	%f0, %f4
fbgt_cont.91924:
	j	fbgt_cont.91914
fbgt_else.91921:
	fmov	%f0, %f4
fbgt_cont.91922:
	j	fbgt_cont.91914
fbgt_else.91919:
	fmov	%f0, %f4
fbgt_cont.91920:
	j	fbgt_cont.91914
fbgt_else.91917:
	fmov	%f0, %f4
fbgt_cont.91918:
	j	fbgt_cont.91914
fbgt_else.91915:
	fmov	%f0, %f4
fbgt_cont.91916:
	j	fbgt_cont.91914
fbgt_else.91913:
	fmov	%f0, %f3
fbgt_cont.91914:
	flw	%f1, 32(%sp)
	flw	%f2, 33(%sp)
	fblt	%f1, %f2, fbgt_else.91935
	fblt	%f1, %f0, fbgt_else.91937
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91939
	fblt	%f1, %f0, fbgt_else.91941
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91943
	fblt	%f1, %f0, fbgt_else.91945
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.91936
fbgt_else.91945:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.91946:
	j	fbgt_cont.91936
fbgt_else.91943:
	fmov	%f0, %f1
fbgt_cont.91944:
	j	fbgt_cont.91936
fbgt_else.91941:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91947
	fblt	%f1, %f0, fbgt_else.91949
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.91948
fbgt_else.91949:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.91950:
	j	fbgt_cont.91948
fbgt_else.91947:
	fmov	%f0, %f1
fbgt_cont.91948:
fbgt_cont.91942:
	j	fbgt_cont.91936
fbgt_else.91939:
	fmov	%f0, %f1
fbgt_cont.91940:
	j	fbgt_cont.91936
fbgt_else.91937:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91951
	fblt	%f1, %f0, fbgt_else.91953
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91955
	fblt	%f1, %f0, fbgt_else.91957
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.91952
fbgt_else.91957:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.91958:
	j	fbgt_cont.91952
fbgt_else.91955:
	fmov	%f0, %f1
fbgt_cont.91956:
	j	fbgt_cont.91952
fbgt_else.91953:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.91959
	fblt	%f1, %f0, fbgt_else.91961
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.91960
fbgt_else.91961:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.91962:
	j	fbgt_cont.91960
fbgt_else.91959:
	fmov	%f0, %f1
fbgt_cont.91960:
fbgt_cont.91954:
	j	fbgt_cont.91952
fbgt_else.91951:
	fmov	%f0, %f1
fbgt_cont.91952:
fbgt_cont.91938:
	j	fbgt_cont.91936
fbgt_else.91935:
	fmov	%f0, %f1
fbgt_cont.91936:
	flw	%f1, 31(%sp)
	fblt	%f0, %f1, fbgt_else.91963
	lw	%v0, 30(%sp)
	beqi	%v0, 0, bnei_else.91965
	addi	%v0, %zero, 0
	j	fbgt_cont.91964
bnei_else.91965:
	addi	%v0, %zero, 1
bnei_cont.91966:
	j	fbgt_cont.91964
fbgt_else.91963:
	lw	%v0, 30(%sp)
fbgt_cont.91964:
	fblt	%f0, %f1, fbgt_else.91967
	fsub	%f0, %f0, %f1
	j	fbgt_cont.91968
fbgt_else.91967:
fbgt_cont.91968:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.91969
	fsub	%f0, %f1, %f0
	j	fbgt_cont.91970
fbgt_else.91969:
fbgt_cont.91970:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.91971
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.91972
fbgt_else.91971:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.91972:
	beqi	%v0, 0, bnei_else.91973
	j	bnei_cont.91974
bnei_else.91973:
	fneg	%f0, %f0
bnei_cont.91974:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.91814:
	j	bnei_cont.91812
bnei_else.91811:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.91975
	addi	%v1, %zero, 0
	j	fbgt_cont.91976
fbgt_else.91975:
	addi	%v1, %zero, 1
fbgt_cont.91976:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.91977
	addi	%a0, %zero, 0
	j	fbgt_cont.91978
fbgt_else.91977:
	addi	%a0, %zero, 1
fbgt_cont.91978:
	beqi	%v1, 0, bnei_else.91979
	beqi	%a0, 0, bnei_else.91981
	flw	%f0, 450(%zero)
	j	bnei_cont.91980
bnei_else.91981:
	flw	%f0, 3(%sp)
bnei_cont.91982:
	j	bnei_cont.91980
bnei_else.91979:
	beqi	%a0, 0, bnei_else.91983
	flw	%f0, 3(%sp)
	j	bnei_cont.91984
bnei_else.91983:
	flw	%f0, 450(%zero)
bnei_cont.91984:
bnei_cont.91980:
	fsw	%f0, 146(%zero)
bnei_cont.91812:
	lw	%v0, 2(%sp)
	lw	%v1, 23(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	beqi	%v0, 0, bnei_else.91985
	j	bnei_cont.91790
bnei_else.91985:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.91987
	addi	%v0, %zero, 0
	j	fbgt_cont.91988
fbgt_else.91987:
	addi	%v0, %zero, 1
fbgt_cont.91988:
	beqi	%v0, 0, bnei_else.91989
	j	bnei_cont.91990
bnei_else.91989:
	fmov	%f0, %f1
bnei_cont.91990:
	flw	%f2, 22(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 26(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.91986:
	j	bnei_cont.91790
bnei_else.91789:
bnei_cont.91790:
bnei_cont.91402:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.91991
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a1)
	flw	%f2, 5(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.91992
	addi	%a1, %zero, 0
	j	fbgt_cont.91993
fbgt_else.91992:
	addi	%a1, %zero, 1
fbgt_cont.91993:
	sw	%v0, 34(%sp)
	beqi	%a1, 0, bnei_else.91994
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 35(%sp)
	sw	%a1, 36(%sp)
	sw	%a0, 37(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.91996
	addi	%v0, %zero, 0
	j	fbgt_cont.91997
fbgt_else.91996:
	addi	%v0, %zero, 1
fbgt_cont.91997:
	beqi	%v0, 0, bnei_else.91998
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92000
	addi	%v0, %zero, 0
	j	bnei_cont.91999
fbgt_else.92000:
	addi	%v0, %zero, 1
fbgt_cont.92001:
	j	bnei_cont.91999
bnei_else.91998:
	addi	%v0, %zero, 0
bnei_cont.91999:
	beqi	%v0, 0, bnei_else.92002
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 37(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92004
	beqi	%a0, 2, bnei_else.92006
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92008
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92009
bnei_else.92008:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92009:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.92010
	addi	%a0, %zero, 1
	j	fbeq_cont.92011
fbeq_else.92010:
	addi	%a0, %zero, 0
fbeq_cont.92011:
	beqi	%a0, 0, bnei_else.92012
	flw	%f1, 491(%zero)
	j	bnei_cont.92013
bnei_else.92012:
	beqi	%v1, 0, bnei_else.92014
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92015
bnei_else.92014:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92015:
bnei_cont.92013:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92005
bnei_else.92006:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92007:
	j	bnei_cont.92005
bnei_else.92004:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92016
	addi	%v1, %zero, 1
	j	fbeq_cont.92017
fbeq_else.92016:
	addi	%v1, %zero, 0
fbeq_cont.92017:
	beqi	%v1, 0, bnei_else.92018
	fmov	%f1, %f0
	j	bnei_cont.92019
bnei_else.92018:
	fblt	%f0, %f1, fbgt_else.92020
	addi	%v1, %zero, 0
	j	fbgt_cont.92021
fbgt_else.92020:
	addi	%v1, %zero, 1
fbgt_cont.92021:
	beqi	%v1, 0, bnei_else.92022
	flw	%f1, 491(%zero)
	j	bnei_cont.92023
bnei_else.92022:
	flw	%f1, 490(%zero)
bnei_cont.92023:
bnei_cont.92019:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92005:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 38(%sp)
	beqi	%v1, 1, bnei_else.92024
	beqi	%v1, 2, bnei_else.92026
	beqi	%v1, 3, bnei_else.92028
	beqi	%v1, 4, bnei_else.92030
	j	bnei_cont.92025
bnei_else.92030:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92032
	addi	%v1, %zero, 0
	j	fbgt_cont.92033
fbgt_else.92032:
	addi	%v1, %zero, 1
fbgt_cont.92033:
	beqi	%v1, 0, bnei_else.92034
	flw	%f0, 462(%zero)
	j	bnei_cont.92035
bnei_else.92034:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.92036
	addi	%v1, %zero, 1
	j	fbgt_cont.92037
fbgt_else.92036:
	addi	%v1, %zero, 0
fbgt_cont.92037:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92038
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92040
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92041
fbgt_else.92040:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92041:
	beqi	%v1, 0, bnei_else.92042
	j	fbgt_cont.92039
bnei_else.92042:
	fneg	%f0, %f0
bnei_cont.92043:
	j	fbgt_cont.92039
fbgt_else.92038:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92039:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92035:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92044
	addi	%v1, %zero, 0
	j	fbgt_cont.92045
fbgt_else.92044:
	addi	%v1, %zero, 1
fbgt_cont.92045:
	beqi	%v1, 0, bnei_else.92046
	flw	%f1, 462(%zero)
	j	bnei_cont.92047
bnei_else.92046:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.92048
	addi	%v1, %zero, 1
	j	fbgt_cont.92049
fbgt_else.92048:
	addi	%v1, %zero, 0
fbgt_cont.92049:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92050
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92052
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92053
fbgt_else.92052:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92053:
	beqi	%v1, 0, bnei_else.92054
	j	fbgt_cont.92051
bnei_else.92054:
	fneg	%f1, %f1
bnei_cont.92055:
	j	fbgt_cont.92051
fbgt_else.92050:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92051:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92047:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.92056
	addi	%v1, %zero, 0
	j	fbgt_cont.92057
fbgt_else.92056:
	addi	%v1, %zero, 1
fbgt_cont.92057:
	beqi	%v1, 0, bnei_else.92058
	fmov	%f0, %f1
	j	bnei_cont.92059
bnei_else.92058:
bnei_cont.92059:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92031:
	j	bnei_cont.92025
bnei_else.92028:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 39(%sp)
	fsw	%f0, 40(%sp)
	fsw	%f2, 41(%sp)
	fblt	%f0, %f2, fbgt_else.92060
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92062
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92064
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92066
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92068
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92070
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.92072
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.92074
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.92076
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.92078
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.92061
fbgt_else.92078:
	fmov	%f0, %f3
fbgt_cont.92079:
	j	fbgt_cont.92061
fbgt_else.92076:
	fmov	%f0, %f3
fbgt_cont.92077:
	j	fbgt_cont.92061
fbgt_else.92074:
	fmov	%f0, %f3
fbgt_cont.92075:
	j	fbgt_cont.92061
fbgt_else.92072:
	fmov	%f0, %f3
fbgt_cont.92073:
	j	fbgt_cont.92061
fbgt_else.92070:
	fmov	%f0, %f3
fbgt_cont.92071:
	j	fbgt_cont.92061
fbgt_else.92068:
	fmov	%f0, %f3
fbgt_cont.92069:
	j	fbgt_cont.92061
fbgt_else.92066:
	fmov	%f0, %f3
fbgt_cont.92067:
	j	fbgt_cont.92061
fbgt_else.92064:
	fmov	%f0, %f3
fbgt_cont.92065:
	j	fbgt_cont.92061
fbgt_else.92062:
	fmov	%f0, %f3
fbgt_cont.92063:
	j	fbgt_cont.92061
fbgt_else.92060:
	fmov	%f0, %f2
fbgt_cont.92061:
	flw	%f1, 40(%sp)
	flw	%f2, 41(%sp)
	fblt	%f1, %f2, fbgt_else.92080
	fblt	%f1, %f0, fbgt_else.92082
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92084
	fblt	%f1, %f0, fbgt_else.92086
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.92081
fbgt_else.92086:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
fbgt_cont.92087:
	j	fbgt_cont.92081
fbgt_else.92084:
	fmov	%f0, %f1
fbgt_cont.92085:
	j	fbgt_cont.92081
fbgt_else.92082:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92088
	fblt	%f1, %f0, fbgt_else.92090
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.92089
fbgt_else.92090:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
fbgt_cont.92091:
	j	fbgt_cont.92089
fbgt_else.92088:
	fmov	%f0, %f1
fbgt_cont.92089:
fbgt_cont.92083:
	j	fbgt_cont.92081
fbgt_else.92080:
	fmov	%f0, %f1
fbgt_cont.92081:
	flw	%f1, 39(%sp)
	fblt	%f0, %f1, fbgt_else.92092
	addi	%v0, %zero, 0
	j	fbgt_cont.92093
fbgt_else.92092:
	addi	%v0, %zero, 1
fbgt_cont.92093:
	fblt	%f0, %f1, fbgt_else.92094
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92095
fbgt_else.92094:
fbgt_cont.92095:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92096
	beqi	%v0, 0, bnei_else.92098
	addi	%v0, %zero, 0
	j	fbgt_cont.92097
bnei_else.92098:
	addi	%v0, %zero, 1
bnei_cont.92099:
	j	fbgt_cont.92097
fbgt_else.92096:
fbgt_cont.92097:
	fblt	%f0, %f2, fbgt_else.92100
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92101
fbgt_else.92100:
fbgt_cont.92101:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92102
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92103
fbgt_else.92102:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92103:
	beqi	%v0, 0, bnei_else.92104
	j	bnei_cont.92105
bnei_else.92104:
	fneg	%f0, %f0
bnei_cont.92105:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92029:
	j	bnei_cont.92025
bnei_else.92026:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.92106
	addi	%v1, %zero, 1
	j	fbgt_cont.92107
fbgt_else.92106:
	addi	%v1, %zero, 0
fbgt_cont.92107:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 42(%sp)
	fsw	%f1, 43(%sp)
	fsw	%f0, 44(%sp)
	fsw	%f3, 45(%sp)
	fblt	%f0, %f3, fbgt_else.92108
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92110
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92112
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92114
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92116
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92118
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.92120
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.92122
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.92124
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.92126
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.92109
fbgt_else.92126:
	fmov	%f0, %f4
fbgt_cont.92127:
	j	fbgt_cont.92109
fbgt_else.92124:
	fmov	%f0, %f4
fbgt_cont.92125:
	j	fbgt_cont.92109
fbgt_else.92122:
	fmov	%f0, %f4
fbgt_cont.92123:
	j	fbgt_cont.92109
fbgt_else.92120:
	fmov	%f0, %f4
fbgt_cont.92121:
	j	fbgt_cont.92109
fbgt_else.92118:
	fmov	%f0, %f4
fbgt_cont.92119:
	j	fbgt_cont.92109
fbgt_else.92116:
	fmov	%f0, %f4
fbgt_cont.92117:
	j	fbgt_cont.92109
fbgt_else.92114:
	fmov	%f0, %f4
fbgt_cont.92115:
	j	fbgt_cont.92109
fbgt_else.92112:
	fmov	%f0, %f4
fbgt_cont.92113:
	j	fbgt_cont.92109
fbgt_else.92110:
	fmov	%f0, %f4
fbgt_cont.92111:
	j	fbgt_cont.92109
fbgt_else.92108:
	fmov	%f0, %f3
fbgt_cont.92109:
	flw	%f1, 44(%sp)
	flw	%f2, 45(%sp)
	fblt	%f1, %f2, fbgt_else.92128
	fblt	%f1, %f0, fbgt_else.92130
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92132
	fblt	%f1, %f0, fbgt_else.92134
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.92129
fbgt_else.92134:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
fbgt_cont.92135:
	j	fbgt_cont.92129
fbgt_else.92132:
	fmov	%f0, %f1
fbgt_cont.92133:
	j	fbgt_cont.92129
fbgt_else.92130:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92136
	fblt	%f1, %f0, fbgt_else.92138
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.92137
fbgt_else.92138:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
fbgt_cont.92139:
	j	fbgt_cont.92137
fbgt_else.92136:
	fmov	%f0, %f1
fbgt_cont.92137:
fbgt_cont.92131:
	j	fbgt_cont.92129
fbgt_else.92128:
	fmov	%f0, %f1
fbgt_cont.92129:
	flw	%f1, 43(%sp)
	fblt	%f0, %f1, fbgt_else.92140
	lw	%v0, 42(%sp)
	beqi	%v0, 0, bnei_else.92142
	addi	%v0, %zero, 0
	j	fbgt_cont.92141
bnei_else.92142:
	addi	%v0, %zero, 1
bnei_cont.92143:
	j	fbgt_cont.92141
fbgt_else.92140:
	lw	%v0, 42(%sp)
fbgt_cont.92141:
	fblt	%f0, %f1, fbgt_else.92144
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92145
fbgt_else.92144:
fbgt_cont.92145:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92146
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92147
fbgt_else.92146:
fbgt_cont.92147:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92148
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92149
fbgt_else.92148:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92149:
	beqi	%v0, 0, bnei_else.92150
	j	bnei_cont.92151
bnei_else.92150:
	fneg	%f0, %f0
bnei_cont.92151:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92027:
	j	bnei_cont.92025
bnei_else.92024:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92152
	addi	%v1, %zero, 0
	j	fbgt_cont.92153
fbgt_else.92152:
	addi	%v1, %zero, 1
fbgt_cont.92153:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92154
	addi	%a0, %zero, 0
	j	fbgt_cont.92155
fbgt_else.92154:
	addi	%a0, %zero, 1
fbgt_cont.92155:
	beqi	%v1, 0, bnei_else.92156
	beqi	%a0, 0, bnei_else.92158
	flw	%f0, 450(%zero)
	j	bnei_cont.92157
bnei_else.92158:
	flw	%f0, 3(%sp)
bnei_cont.92159:
	j	bnei_cont.92157
bnei_else.92156:
	beqi	%a0, 0, bnei_else.92160
	flw	%f0, 3(%sp)
	j	bnei_cont.92161
bnei_else.92160:
	flw	%f0, 450(%zero)
bnei_cont.92161:
bnei_cont.92157:
	fsw	%f0, 146(%zero)
bnei_cont.92025:
	lw	%v0, 2(%sp)
	lw	%v1, 36(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	beqi	%v0, 0, bnei_else.92162
	j	bnei_cont.91995
bnei_else.92162:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.92164
	addi	%v0, %zero, 0
	j	fbgt_cont.92165
fbgt_else.92164:
	addi	%v0, %zero, 1
fbgt_cont.92165:
	beqi	%v0, 0, bnei_else.92166
	j	bnei_cont.92167
bnei_else.92166:
	fmov	%f0, %f1
bnei_cont.92167:
	flw	%f1, 35(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 38(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92163:
	j	bnei_cont.91995
bnei_else.92002:
bnei_cont.92003:
	j	bnei_cont.91995
bnei_else.91994:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 46(%sp)
	sw	%a1, 47(%sp)
	sw	%a0, 48(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.92168
	addi	%v0, %zero, 0
	j	fbgt_cont.92169
fbgt_else.92168:
	addi	%v0, %zero, 1
fbgt_cont.92169:
	beqi	%v0, 0, bnei_else.92170
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92172
	addi	%v0, %zero, 0
	j	bnei_cont.92171
fbgt_else.92172:
	addi	%v0, %zero, 1
fbgt_cont.92173:
	j	bnei_cont.92171
bnei_else.92170:
	addi	%v0, %zero, 0
bnei_cont.92171:
	beqi	%v0, 0, bnei_else.92174
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 48(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92176
	beqi	%a0, 2, bnei_else.92178
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92180
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92181
bnei_else.92180:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92181:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.92182
	addi	%a0, %zero, 1
	j	fbeq_cont.92183
fbeq_else.92182:
	addi	%a0, %zero, 0
fbeq_cont.92183:
	beqi	%a0, 0, bnei_else.92184
	flw	%f1, 491(%zero)
	j	bnei_cont.92185
bnei_else.92184:
	beqi	%v1, 0, bnei_else.92186
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92187
bnei_else.92186:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92187:
bnei_cont.92185:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92177
bnei_else.92178:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92179:
	j	bnei_cont.92177
bnei_else.92176:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92188
	addi	%v1, %zero, 1
	j	fbeq_cont.92189
fbeq_else.92188:
	addi	%v1, %zero, 0
fbeq_cont.92189:
	beqi	%v1, 0, bnei_else.92190
	fmov	%f1, %f0
	j	bnei_cont.92191
bnei_else.92190:
	fblt	%f0, %f1, fbgt_else.92192
	addi	%v1, %zero, 0
	j	fbgt_cont.92193
fbgt_else.92192:
	addi	%v1, %zero, 1
fbgt_cont.92193:
	beqi	%v1, 0, bnei_else.92194
	flw	%f1, 491(%zero)
	j	bnei_cont.92195
bnei_else.92194:
	flw	%f1, 490(%zero)
bnei_cont.92195:
bnei_cont.92191:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92177:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 49(%sp)
	beqi	%v1, 1, bnei_else.92196
	beqi	%v1, 2, bnei_else.92198
	beqi	%v1, 3, bnei_else.92200
	beqi	%v1, 4, bnei_else.92202
	j	bnei_cont.92197
bnei_else.92202:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92204
	addi	%v1, %zero, 0
	j	fbgt_cont.92205
fbgt_else.92204:
	addi	%v1, %zero, 1
fbgt_cont.92205:
	beqi	%v1, 0, bnei_else.92206
	flw	%f0, 462(%zero)
	j	bnei_cont.92207
bnei_else.92206:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.92208
	addi	%v1, %zero, 1
	j	fbgt_cont.92209
fbgt_else.92208:
	addi	%v1, %zero, 0
fbgt_cont.92209:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92210
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92212
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92213
fbgt_else.92212:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92213:
	beqi	%v1, 0, bnei_else.92214
	j	fbgt_cont.92211
bnei_else.92214:
	fneg	%f0, %f0
bnei_cont.92215:
	j	fbgt_cont.92211
fbgt_else.92210:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92211:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92207:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92216
	addi	%v1, %zero, 0
	j	fbgt_cont.92217
fbgt_else.92216:
	addi	%v1, %zero, 1
fbgt_cont.92217:
	beqi	%v1, 0, bnei_else.92218
	flw	%f1, 462(%zero)
	j	bnei_cont.92219
bnei_else.92218:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.92220
	addi	%v1, %zero, 1
	j	fbgt_cont.92221
fbgt_else.92220:
	addi	%v1, %zero, 0
fbgt_cont.92221:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92222
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92224
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92225
fbgt_else.92224:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92225:
	beqi	%v1, 0, bnei_else.92226
	j	fbgt_cont.92223
bnei_else.92226:
	fneg	%f1, %f1
bnei_cont.92227:
	j	fbgt_cont.92223
fbgt_else.92222:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92223:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92219:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.92228
	addi	%v1, %zero, 0
	j	fbgt_cont.92229
fbgt_else.92228:
	addi	%v1, %zero, 1
fbgt_cont.92229:
	beqi	%v1, 0, bnei_else.92230
	fmov	%f0, %f1
	j	bnei_cont.92231
bnei_else.92230:
bnei_cont.92231:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92203:
	j	bnei_cont.92197
bnei_else.92200:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 50(%sp)
	fsw	%f0, 51(%sp)
	fsw	%f2, 52(%sp)
	fblt	%f0, %f2, fbgt_else.92232
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92234
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92236
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92238
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92240
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92242
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.92244
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.92246
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.92248
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.92250
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.92233
fbgt_else.92250:
	fmov	%f0, %f3
fbgt_cont.92251:
	j	fbgt_cont.92233
fbgt_else.92248:
	fmov	%f0, %f3
fbgt_cont.92249:
	j	fbgt_cont.92233
fbgt_else.92246:
	fmov	%f0, %f3
fbgt_cont.92247:
	j	fbgt_cont.92233
fbgt_else.92244:
	fmov	%f0, %f3
fbgt_cont.92245:
	j	fbgt_cont.92233
fbgt_else.92242:
	fmov	%f0, %f3
fbgt_cont.92243:
	j	fbgt_cont.92233
fbgt_else.92240:
	fmov	%f0, %f3
fbgt_cont.92241:
	j	fbgt_cont.92233
fbgt_else.92238:
	fmov	%f0, %f3
fbgt_cont.92239:
	j	fbgt_cont.92233
fbgt_else.92236:
	fmov	%f0, %f3
fbgt_cont.92237:
	j	fbgt_cont.92233
fbgt_else.92234:
	fmov	%f0, %f3
fbgt_cont.92235:
	j	fbgt_cont.92233
fbgt_else.92232:
	fmov	%f0, %f2
fbgt_cont.92233:
	flw	%f1, 51(%sp)
	flw	%f2, 52(%sp)
	fblt	%f1, %f2, fbgt_else.92252
	fblt	%f1, %f0, fbgt_else.92254
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92256
	fblt	%f1, %f0, fbgt_else.92258
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.92253
fbgt_else.92258:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
fbgt_cont.92259:
	j	fbgt_cont.92253
fbgt_else.92256:
	fmov	%f0, %f1
fbgt_cont.92257:
	j	fbgt_cont.92253
fbgt_else.92254:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92260
	fblt	%f1, %f0, fbgt_else.92262
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.92261
fbgt_else.92262:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
fbgt_cont.92263:
	j	fbgt_cont.92261
fbgt_else.92260:
	fmov	%f0, %f1
fbgt_cont.92261:
fbgt_cont.92255:
	j	fbgt_cont.92253
fbgt_else.92252:
	fmov	%f0, %f1
fbgt_cont.92253:
	flw	%f1, 50(%sp)
	fblt	%f0, %f1, fbgt_else.92264
	addi	%v0, %zero, 0
	j	fbgt_cont.92265
fbgt_else.92264:
	addi	%v0, %zero, 1
fbgt_cont.92265:
	fblt	%f0, %f1, fbgt_else.92266
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92267
fbgt_else.92266:
fbgt_cont.92267:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92268
	beqi	%v0, 0, bnei_else.92270
	addi	%v0, %zero, 0
	j	fbgt_cont.92269
bnei_else.92270:
	addi	%v0, %zero, 1
bnei_cont.92271:
	j	fbgt_cont.92269
fbgt_else.92268:
fbgt_cont.92269:
	fblt	%f0, %f2, fbgt_else.92272
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92273
fbgt_else.92272:
fbgt_cont.92273:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92274
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92275
fbgt_else.92274:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92275:
	beqi	%v0, 0, bnei_else.92276
	j	bnei_cont.92277
bnei_else.92276:
	fneg	%f0, %f0
bnei_cont.92277:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92201:
	j	bnei_cont.92197
bnei_else.92198:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.92278
	addi	%v1, %zero, 1
	j	fbgt_cont.92279
fbgt_else.92278:
	addi	%v1, %zero, 0
fbgt_cont.92279:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 53(%sp)
	fsw	%f1, 54(%sp)
	fsw	%f0, 55(%sp)
	fsw	%f3, 56(%sp)
	fblt	%f0, %f3, fbgt_else.92280
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92282
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92284
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92286
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92288
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92290
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.92292
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.92294
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.92296
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.92298
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.92281
fbgt_else.92298:
	fmov	%f0, %f4
fbgt_cont.92299:
	j	fbgt_cont.92281
fbgt_else.92296:
	fmov	%f0, %f4
fbgt_cont.92297:
	j	fbgt_cont.92281
fbgt_else.92294:
	fmov	%f0, %f4
fbgt_cont.92295:
	j	fbgt_cont.92281
fbgt_else.92292:
	fmov	%f0, %f4
fbgt_cont.92293:
	j	fbgt_cont.92281
fbgt_else.92290:
	fmov	%f0, %f4
fbgt_cont.92291:
	j	fbgt_cont.92281
fbgt_else.92288:
	fmov	%f0, %f4
fbgt_cont.92289:
	j	fbgt_cont.92281
fbgt_else.92286:
	fmov	%f0, %f4
fbgt_cont.92287:
	j	fbgt_cont.92281
fbgt_else.92284:
	fmov	%f0, %f4
fbgt_cont.92285:
	j	fbgt_cont.92281
fbgt_else.92282:
	fmov	%f0, %f4
fbgt_cont.92283:
	j	fbgt_cont.92281
fbgt_else.92280:
	fmov	%f0, %f3
fbgt_cont.92281:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.92300
	fblt	%f1, %f0, fbgt_else.92302
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92304
	fblt	%f1, %f0, fbgt_else.92306
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.92301
fbgt_else.92306:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.92307:
	j	fbgt_cont.92301
fbgt_else.92304:
	fmov	%f0, %f1
fbgt_cont.92305:
	j	fbgt_cont.92301
fbgt_else.92302:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92308
	fblt	%f1, %f0, fbgt_else.92310
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.92309
fbgt_else.92310:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.92311:
	j	fbgt_cont.92309
fbgt_else.92308:
	fmov	%f0, %f1
fbgt_cont.92309:
fbgt_cont.92303:
	j	fbgt_cont.92301
fbgt_else.92300:
	fmov	%f0, %f1
fbgt_cont.92301:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.92312
	lw	%v0, 53(%sp)
	beqi	%v0, 0, bnei_else.92314
	addi	%v0, %zero, 0
	j	fbgt_cont.92313
bnei_else.92314:
	addi	%v0, %zero, 1
bnei_cont.92315:
	j	fbgt_cont.92313
fbgt_else.92312:
	lw	%v0, 53(%sp)
fbgt_cont.92313:
	fblt	%f0, %f1, fbgt_else.92316
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92317
fbgt_else.92316:
fbgt_cont.92317:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92318
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92319
fbgt_else.92318:
fbgt_cont.92319:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92320
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92321
fbgt_else.92320:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92321:
	beqi	%v0, 0, bnei_else.92322
	j	bnei_cont.92323
bnei_else.92322:
	fneg	%f0, %f0
bnei_cont.92323:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92199:
	j	bnei_cont.92197
bnei_else.92196:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92324
	addi	%v1, %zero, 0
	j	fbgt_cont.92325
fbgt_else.92324:
	addi	%v1, %zero, 1
fbgt_cont.92325:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92326
	addi	%a0, %zero, 0
	j	fbgt_cont.92327
fbgt_else.92326:
	addi	%a0, %zero, 1
fbgt_cont.92327:
	beqi	%v1, 0, bnei_else.92328
	beqi	%a0, 0, bnei_else.92330
	flw	%f0, 450(%zero)
	j	bnei_cont.92329
bnei_else.92330:
	flw	%f0, 3(%sp)
bnei_cont.92331:
	j	bnei_cont.92329
bnei_else.92328:
	beqi	%a0, 0, bnei_else.92332
	flw	%f0, 3(%sp)
	j	bnei_cont.92333
bnei_else.92332:
	flw	%f0, 450(%zero)
bnei_cont.92333:
bnei_cont.92329:
	fsw	%f0, 146(%zero)
bnei_cont.92197:
	lw	%v0, 2(%sp)
	lw	%v1, 47(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	beqi	%v0, 0, bnei_else.92334
	j	bnei_cont.92175
bnei_else.92334:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.92336
	addi	%v0, %zero, 0
	j	fbgt_cont.92337
fbgt_else.92336:
	addi	%v0, %zero, 1
fbgt_cont.92337:
	beqi	%v0, 0, bnei_else.92338
	j	bnei_cont.92339
bnei_else.92338:
	fmov	%f0, %f1
bnei_cont.92339:
	flw	%f1, 46(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 49(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92335:
	j	bnei_cont.92175
bnei_else.92174:
bnei_cont.92175:
bnei_cont.91995:
	lw	%v0, 34(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.91991:
	jr	%ra
bgti_else.91398:
	jr	%ra
do_without_neighbors.3002:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.92342
	lw	%a0, 2(%v0)
	addi	%a1, %zero, 0
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.92343
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%a1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	beqi	%a0, 0, bnei_else.92344
	lw	%a0, 5(%v0)
	lw	%a2, 7(%v0)
	lw	%a3, 1(%v0)
	lw	%t0, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	sw	%t0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a3, 5(%sp)
	sw	%a0, 6(%sp)
	beqi	%a0, 0, bnei_else.92346
	lw	%t1, 179(%zero)
	flw	%f0, 0(%a3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 164(%zero)
	lw	%t2, 0(%zero)
	addi	%t2, %t2, -1
	sw	%t1, 7(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.92347
bnei_else.92346:
bnei_cont.92347:
	lw	%v0, 6(%sp)
	beqi	%v0, 1, bnei_else.92348
	lw	%v1, 180(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 8(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 8(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.92349
bnei_else.92348:
bnei_cont.92349:
	lw	%v0, 6(%sp)
	beqi	%v0, 2, bnei_else.92350
	lw	%v1, 181(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 9(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.92351
bnei_else.92350:
bnei_cont.92351:
	lw	%v0, 6(%sp)
	beqi	%v0, 3, bnei_else.92352
	lw	%v1, 182(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 10(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 10(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.92353
bnei_else.92352:
bnei_cont.92353:
	lw	%v0, 6(%sp)
	beqi	%v0, 4, bnei_else.92354
	lw	%v0, 183(%zero)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 11(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.92355
bnei_else.92354:
bnei_cont.92355:
	lw	%v0, 2(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.92345
bnei_else.92344:
bnei_cont.92345:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.92356
	lw	%v1, 1(%sp)
	lw	%a0, 2(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.92357
	lw	%a0, 3(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.92358
	lw	%a0, 5(%v1)
	lw	%a1, 7(%v1)
	lw	%a2, 1(%v1)
	lw	%a3, 4(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v1)
	lw	%a0, 0(%a0)
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	add	%at, %a2, %v0
	lw	%a2, 0(%at)
	sw	%v0, 12(%sp)
	sw	%a3, 13(%sp)
	sw	%a1, 14(%sp)
	sw	%a2, 15(%sp)
	sw	%a0, 16(%sp)
	beqi	%a0, 0, bnei_else.92360
	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%t1, 0(%zero)
	addi	%t1, %t1, -1
	sw	%t0, 17(%sp)
	addi	%v1, %t1, 0
	addi	%v0, %a2, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 17(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 14(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.92362
	addi	%v1, %zero, 0
	j	fbgt_cont.92363
fbgt_else.92362:
	addi	%v1, %zero, 1
fbgt_cont.92363:
	beqi	%v1, 0, bnei_else.92364
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 18(%sp)
	sw	%v1, 19(%sp)
	fsw	%f1, 20(%sp)
	sw	%a0, 21(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.92366
	addi	%v0, %zero, 0
	j	fbgt_cont.92367
fbgt_else.92366:
	addi	%v0, %zero, 1
fbgt_cont.92367:
	beqi	%v0, 0, bnei_else.92368
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92370
	addi	%v0, %zero, 0
	j	bnei_cont.92369
fbgt_else.92370:
	addi	%v0, %zero, 1
fbgt_cont.92371:
	j	bnei_cont.92369
bnei_else.92368:
	addi	%v0, %zero, 0
bnei_cont.92369:
	beqi	%v0, 0, bnei_else.92372
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 21(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92374
	beqi	%a0, 2, bnei_else.92376
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92378
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92379
bnei_else.92378:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92379:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 20(%sp)
	fbne	%f1, %f4, fbeq_else.92380
	addi	%a0, %zero, 1
	j	fbeq_cont.92381
fbeq_else.92380:
	addi	%a0, %zero, 0
fbeq_cont.92381:
	beqi	%a0, 0, bnei_else.92382
	flw	%f1, 491(%zero)
	j	bnei_cont.92383
bnei_else.92382:
	beqi	%v1, 0, bnei_else.92384
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92385
bnei_else.92384:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92385:
bnei_cont.92383:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92375
bnei_else.92376:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92377:
	j	bnei_cont.92375
bnei_else.92374:
	lw	%a0, 136(%zero)
	flw	%f0, 20(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92386
	addi	%v1, %zero, 1
	j	fbeq_cont.92387
fbeq_else.92386:
	addi	%v1, %zero, 0
fbeq_cont.92387:
	beqi	%v1, 0, bnei_else.92388
	fmov	%f1, %f0
	j	bnei_cont.92389
bnei_else.92388:
	fblt	%f0, %f1, fbgt_else.92390
	addi	%v1, %zero, 0
	j	fbgt_cont.92391
fbgt_else.92390:
	addi	%v1, %zero, 1
fbgt_cont.92391:
	beqi	%v1, 0, bnei_else.92392
	flw	%f1, 491(%zero)
	j	bnei_cont.92393
bnei_else.92392:
	flw	%f1, 490(%zero)
bnei_cont.92393:
bnei_cont.92389:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92375:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 22(%sp)
	beqi	%v1, 1, bnei_else.92394
	beqi	%v1, 2, bnei_else.92396
	beqi	%v1, 3, bnei_else.92398
	beqi	%v1, 4, bnei_else.92400
	j	bnei_cont.92395
bnei_else.92400:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92402
	addi	%v1, %zero, 0
	j	fbgt_cont.92403
fbgt_else.92402:
	addi	%v1, %zero, 1
fbgt_cont.92403:
	beqi	%v1, 0, bnei_else.92404
	flw	%f0, 462(%zero)
	j	bnei_cont.92405
bnei_else.92404:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 20(%sp)
	fblt	%f0, %f1, fbgt_else.92406
	addi	%v1, %zero, 1
	j	fbgt_cont.92407
fbgt_else.92406:
	addi	%v1, %zero, 0
fbgt_cont.92407:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92408
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92410
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92411
fbgt_else.92410:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92411:
	beqi	%v1, 0, bnei_else.92412
	j	fbgt_cont.92409
bnei_else.92412:
	fneg	%f0, %f0
bnei_cont.92413:
	j	fbgt_cont.92409
fbgt_else.92408:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92409:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92405:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92414
	addi	%v1, %zero, 0
	j	fbgt_cont.92415
fbgt_else.92414:
	addi	%v1, %zero, 1
fbgt_cont.92415:
	beqi	%v1, 0, bnei_else.92416
	flw	%f1, 462(%zero)
	j	bnei_cont.92417
bnei_else.92416:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 20(%sp)
	fblt	%f1, %f2, fbgt_else.92418
	addi	%v1, %zero, 1
	j	fbgt_cont.92419
fbgt_else.92418:
	addi	%v1, %zero, 0
fbgt_cont.92419:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92420
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92422
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92423
fbgt_else.92422:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92423:
	beqi	%v1, 0, bnei_else.92424
	j	fbgt_cont.92421
bnei_else.92424:
	fneg	%f1, %f1
bnei_cont.92425:
	j	fbgt_cont.92421
fbgt_else.92420:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92421:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92417:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 20(%sp)
	fblt	%f0, %f1, fbgt_else.92426
	addi	%v1, %zero, 0
	j	fbgt_cont.92427
fbgt_else.92426:
	addi	%v1, %zero, 1
fbgt_cont.92427:
	beqi	%v1, 0, bnei_else.92428
	fmov	%f0, %f1
	j	bnei_cont.92429
bnei_else.92428:
bnei_cont.92429:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92401:
	j	bnei_cont.92395
bnei_else.92398:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 23(%sp)
	fsw	%f0, 24(%sp)
	fsw	%f2, 25(%sp)
	fblt	%f0, %f2, fbgt_else.92430
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92432
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92434
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92436
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92438
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92440
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.92431
fbgt_else.92440:
	fmov	%f0, %f3
fbgt_cont.92441:
	j	fbgt_cont.92431
fbgt_else.92438:
	fmov	%f0, %f3
fbgt_cont.92439:
	j	fbgt_cont.92431
fbgt_else.92436:
	fmov	%f0, %f3
fbgt_cont.92437:
	j	fbgt_cont.92431
fbgt_else.92434:
	fmov	%f0, %f3
fbgt_cont.92435:
	j	fbgt_cont.92431
fbgt_else.92432:
	fmov	%f0, %f3
fbgt_cont.92433:
	j	fbgt_cont.92431
fbgt_else.92430:
	fmov	%f0, %f2
fbgt_cont.92431:
	flw	%f1, 24(%sp)
	flw	%f2, 25(%sp)
	fblt	%f1, %f2, fbgt_else.92442
	fblt	%f1, %f0, fbgt_else.92444
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92446
	fblt	%f1, %f0, fbgt_else.92448
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.92443
fbgt_else.92448:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.92449:
	j	fbgt_cont.92443
fbgt_else.92446:
	fmov	%f0, %f1
fbgt_cont.92447:
	j	fbgt_cont.92443
fbgt_else.92444:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92450
	fblt	%f1, %f0, fbgt_else.92452
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.92451
fbgt_else.92452:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.92453:
	j	fbgt_cont.92451
fbgt_else.92450:
	fmov	%f0, %f1
fbgt_cont.92451:
fbgt_cont.92445:
	j	fbgt_cont.92443
fbgt_else.92442:
	fmov	%f0, %f1
fbgt_cont.92443:
	flw	%f1, 23(%sp)
	fblt	%f0, %f1, fbgt_else.92454
	addi	%v0, %zero, 0
	j	fbgt_cont.92455
fbgt_else.92454:
	addi	%v0, %zero, 1
fbgt_cont.92455:
	fblt	%f0, %f1, fbgt_else.92456
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92457
fbgt_else.92456:
fbgt_cont.92457:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92458
	beqi	%v0, 0, bnei_else.92460
	addi	%v0, %zero, 0
	j	fbgt_cont.92459
bnei_else.92460:
	addi	%v0, %zero, 1
bnei_cont.92461:
	j	fbgt_cont.92459
fbgt_else.92458:
fbgt_cont.92459:
	fblt	%f0, %f2, fbgt_else.92462
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92463
fbgt_else.92462:
fbgt_cont.92463:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92464
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92465
fbgt_else.92464:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92465:
	beqi	%v0, 0, bnei_else.92466
	j	bnei_cont.92467
bnei_else.92466:
	fneg	%f0, %f0
bnei_cont.92467:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92399:
	j	bnei_cont.92395
bnei_else.92396:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 20(%sp)
	fblt	%f0, %f2, fbgt_else.92468
	addi	%v1, %zero, 1
	j	fbgt_cont.92469
fbgt_else.92468:
	addi	%v1, %zero, 0
fbgt_cont.92469:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 26(%sp)
	fsw	%f1, 27(%sp)
	fsw	%f0, 28(%sp)
	fsw	%f3, 29(%sp)
	fblt	%f0, %f3, fbgt_else.92470
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92472
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92474
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92476
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92478
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92480
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.92471
fbgt_else.92480:
	fmov	%f0, %f4
fbgt_cont.92481:
	j	fbgt_cont.92471
fbgt_else.92478:
	fmov	%f0, %f4
fbgt_cont.92479:
	j	fbgt_cont.92471
fbgt_else.92476:
	fmov	%f0, %f4
fbgt_cont.92477:
	j	fbgt_cont.92471
fbgt_else.92474:
	fmov	%f0, %f4
fbgt_cont.92475:
	j	fbgt_cont.92471
fbgt_else.92472:
	fmov	%f0, %f4
fbgt_cont.92473:
	j	fbgt_cont.92471
fbgt_else.92470:
	fmov	%f0, %f3
fbgt_cont.92471:
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)
	fblt	%f1, %f2, fbgt_else.92482
	fblt	%f1, %f0, fbgt_else.92484
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92486
	fblt	%f1, %f0, fbgt_else.92488
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.92483
fbgt_else.92488:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.92489:
	j	fbgt_cont.92483
fbgt_else.92486:
	fmov	%f0, %f1
fbgt_cont.92487:
	j	fbgt_cont.92483
fbgt_else.92484:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92490
	fblt	%f1, %f0, fbgt_else.92492
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.92491
fbgt_else.92492:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.92493:
	j	fbgt_cont.92491
fbgt_else.92490:
	fmov	%f0, %f1
fbgt_cont.92491:
fbgt_cont.92485:
	j	fbgt_cont.92483
fbgt_else.92482:
	fmov	%f0, %f1
fbgt_cont.92483:
	flw	%f1, 27(%sp)
	fblt	%f0, %f1, fbgt_else.92494
	lw	%v0, 26(%sp)
	beqi	%v0, 0, bnei_else.92496
	addi	%v0, %zero, 0
	j	fbgt_cont.92495
bnei_else.92496:
	addi	%v0, %zero, 1
bnei_cont.92497:
	j	fbgt_cont.92495
fbgt_else.92494:
	lw	%v0, 26(%sp)
fbgt_cont.92495:
	fblt	%f0, %f1, fbgt_else.92498
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92499
fbgt_else.92498:
fbgt_cont.92499:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92500
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92501
fbgt_else.92500:
fbgt_cont.92501:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92502
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92503
fbgt_else.92502:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92503:
	beqi	%v0, 0, bnei_else.92504
	j	bnei_cont.92505
bnei_else.92504:
	fneg	%f0, %f0
bnei_cont.92505:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92397:
	j	bnei_cont.92395
bnei_else.92394:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92506
	addi	%v1, %zero, 0
	j	fbgt_cont.92507
fbgt_else.92506:
	addi	%v1, %zero, 1
fbgt_cont.92507:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92508
	addi	%a0, %zero, 0
	j	fbgt_cont.92509
fbgt_else.92508:
	addi	%a0, %zero, 1
fbgt_cont.92509:
	beqi	%v1, 0, bnei_else.92510
	beqi	%a0, 0, bnei_else.92512
	flw	%f0, 450(%zero)
	j	bnei_cont.92511
bnei_else.92512:
	flw	%f0, 20(%sp)
bnei_cont.92513:
	j	bnei_cont.92511
bnei_else.92510:
	beqi	%a0, 0, bnei_else.92514
	flw	%f0, 20(%sp)
	j	bnei_cont.92515
bnei_else.92514:
	flw	%f0, 450(%zero)
bnei_cont.92515:
bnei_cont.92511:
	fsw	%f0, 146(%zero)
bnei_cont.92395:
	lw	%v0, 0(%sp)
	lw	%v1, 19(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	beqi	%v0, 0, bnei_else.92516
	j	bnei_cont.92365
bnei_else.92516:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 20(%sp)
	fblt	%f1, %f0, fbgt_else.92518
	addi	%v0, %zero, 0
	j	fbgt_cont.92519
fbgt_else.92518:
	addi	%v0, %zero, 1
fbgt_cont.92519:
	beqi	%v0, 0, bnei_else.92520
	j	bnei_cont.92521
bnei_else.92520:
	fmov	%f0, %f1
bnei_cont.92521:
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 22(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92517:
	j	bnei_cont.92365
bnei_else.92372:
bnei_cont.92373:
	j	bnei_cont.92365
bnei_else.92364:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 30(%sp)
	sw	%v1, 31(%sp)
	fsw	%f1, 20(%sp)
	sw	%a0, 32(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.92522
	addi	%v0, %zero, 0
	j	fbgt_cont.92523
fbgt_else.92522:
	addi	%v0, %zero, 1
fbgt_cont.92523:
	beqi	%v0, 0, bnei_else.92524
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92526
	addi	%v0, %zero, 0
	j	bnei_cont.92525
fbgt_else.92526:
	addi	%v0, %zero, 1
fbgt_cont.92527:
	j	bnei_cont.92525
bnei_else.92524:
	addi	%v0, %zero, 0
bnei_cont.92525:
	beqi	%v0, 0, bnei_else.92528
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 32(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92530
	beqi	%a0, 2, bnei_else.92532
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92534
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92535
bnei_else.92534:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92535:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 20(%sp)
	fbne	%f1, %f4, fbeq_else.92536
	addi	%a0, %zero, 1
	j	fbeq_cont.92537
fbeq_else.92536:
	addi	%a0, %zero, 0
fbeq_cont.92537:
	beqi	%a0, 0, bnei_else.92538
	flw	%f1, 491(%zero)
	j	bnei_cont.92539
bnei_else.92538:
	beqi	%v1, 0, bnei_else.92540
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92541
bnei_else.92540:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92541:
bnei_cont.92539:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92531
bnei_else.92532:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92533:
	j	bnei_cont.92531
bnei_else.92530:
	lw	%a0, 136(%zero)
	flw	%f0, 20(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92542
	addi	%v1, %zero, 1
	j	fbeq_cont.92543
fbeq_else.92542:
	addi	%v1, %zero, 0
fbeq_cont.92543:
	beqi	%v1, 0, bnei_else.92544
	fmov	%f1, %f0
	j	bnei_cont.92545
bnei_else.92544:
	fblt	%f0, %f1, fbgt_else.92546
	addi	%v1, %zero, 0
	j	fbgt_cont.92547
fbgt_else.92546:
	addi	%v1, %zero, 1
fbgt_cont.92547:
	beqi	%v1, 0, bnei_else.92548
	flw	%f1, 491(%zero)
	j	bnei_cont.92549
bnei_else.92548:
	flw	%f1, 490(%zero)
bnei_cont.92549:
bnei_cont.92545:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92531:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 33(%sp)
	beqi	%v1, 1, bnei_else.92550
	beqi	%v1, 2, bnei_else.92552
	beqi	%v1, 3, bnei_else.92554
	beqi	%v1, 4, bnei_else.92556
	j	bnei_cont.92551
bnei_else.92556:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92558
	addi	%v1, %zero, 0
	j	fbgt_cont.92559
fbgt_else.92558:
	addi	%v1, %zero, 1
fbgt_cont.92559:
	beqi	%v1, 0, bnei_else.92560
	flw	%f0, 462(%zero)
	j	bnei_cont.92561
bnei_else.92560:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 20(%sp)
	fblt	%f0, %f1, fbgt_else.92562
	addi	%v1, %zero, 1
	j	fbgt_cont.92563
fbgt_else.92562:
	addi	%v1, %zero, 0
fbgt_cont.92563:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92564
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92566
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92567
fbgt_else.92566:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92567:
	beqi	%v1, 0, bnei_else.92568
	j	fbgt_cont.92565
bnei_else.92568:
	fneg	%f0, %f0
bnei_cont.92569:
	j	fbgt_cont.92565
fbgt_else.92564:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92565:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92561:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92570
	addi	%v1, %zero, 0
	j	fbgt_cont.92571
fbgt_else.92570:
	addi	%v1, %zero, 1
fbgt_cont.92571:
	beqi	%v1, 0, bnei_else.92572
	flw	%f1, 462(%zero)
	j	bnei_cont.92573
bnei_else.92572:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 20(%sp)
	fblt	%f1, %f2, fbgt_else.92574
	addi	%v1, %zero, 1
	j	fbgt_cont.92575
fbgt_else.92574:
	addi	%v1, %zero, 0
fbgt_cont.92575:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92576
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92578
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92579
fbgt_else.92578:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92579:
	beqi	%v1, 0, bnei_else.92580
	j	fbgt_cont.92577
bnei_else.92580:
	fneg	%f1, %f1
bnei_cont.92581:
	j	fbgt_cont.92577
fbgt_else.92576:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92577:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92573:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 20(%sp)
	fblt	%f0, %f1, fbgt_else.92582
	addi	%v1, %zero, 0
	j	fbgt_cont.92583
fbgt_else.92582:
	addi	%v1, %zero, 1
fbgt_cont.92583:
	beqi	%v1, 0, bnei_else.92584
	fmov	%f0, %f1
	j	bnei_cont.92585
bnei_else.92584:
bnei_cont.92585:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92557:
	j	bnei_cont.92551
bnei_else.92554:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 34(%sp)
	fsw	%f0, 35(%sp)
	fsw	%f2, 36(%sp)
	fblt	%f0, %f2, fbgt_else.92586
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92588
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92590
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92592
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92594
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92596
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.92587
fbgt_else.92596:
	fmov	%f0, %f3
fbgt_cont.92597:
	j	fbgt_cont.92587
fbgt_else.92594:
	fmov	%f0, %f3
fbgt_cont.92595:
	j	fbgt_cont.92587
fbgt_else.92592:
	fmov	%f0, %f3
fbgt_cont.92593:
	j	fbgt_cont.92587
fbgt_else.92590:
	fmov	%f0, %f3
fbgt_cont.92591:
	j	fbgt_cont.92587
fbgt_else.92588:
	fmov	%f0, %f3
fbgt_cont.92589:
	j	fbgt_cont.92587
fbgt_else.92586:
	fmov	%f0, %f2
fbgt_cont.92587:
	flw	%f1, 35(%sp)
	flw	%f2, 36(%sp)
	fblt	%f1, %f2, fbgt_else.92598
	fblt	%f1, %f0, fbgt_else.92600
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92602
	fblt	%f1, %f0, fbgt_else.92604
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.92599
fbgt_else.92604:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.92605:
	j	fbgt_cont.92599
fbgt_else.92602:
	fmov	%f0, %f1
fbgt_cont.92603:
	j	fbgt_cont.92599
fbgt_else.92600:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92606
	fblt	%f1, %f0, fbgt_else.92608
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.92607
fbgt_else.92608:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.92609:
	j	fbgt_cont.92607
fbgt_else.92606:
	fmov	%f0, %f1
fbgt_cont.92607:
fbgt_cont.92601:
	j	fbgt_cont.92599
fbgt_else.92598:
	fmov	%f0, %f1
fbgt_cont.92599:
	flw	%f1, 34(%sp)
	fblt	%f0, %f1, fbgt_else.92610
	addi	%v0, %zero, 0
	j	fbgt_cont.92611
fbgt_else.92610:
	addi	%v0, %zero, 1
fbgt_cont.92611:
	fblt	%f0, %f1, fbgt_else.92612
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92613
fbgt_else.92612:
fbgt_cont.92613:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92614
	beqi	%v0, 0, bnei_else.92616
	addi	%v0, %zero, 0
	j	fbgt_cont.92615
bnei_else.92616:
	addi	%v0, %zero, 1
bnei_cont.92617:
	j	fbgt_cont.92615
fbgt_else.92614:
fbgt_cont.92615:
	fblt	%f0, %f2, fbgt_else.92618
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92619
fbgt_else.92618:
fbgt_cont.92619:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92620
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92621
fbgt_else.92620:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92621:
	beqi	%v0, 0, bnei_else.92622
	j	bnei_cont.92623
bnei_else.92622:
	fneg	%f0, %f0
bnei_cont.92623:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92555:
	j	bnei_cont.92551
bnei_else.92552:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 20(%sp)
	fblt	%f0, %f2, fbgt_else.92624
	addi	%v1, %zero, 1
	j	fbgt_cont.92625
fbgt_else.92624:
	addi	%v1, %zero, 0
fbgt_cont.92625:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 37(%sp)
	fsw	%f1, 38(%sp)
	fsw	%f0, 39(%sp)
	fsw	%f3, 40(%sp)
	fblt	%f0, %f3, fbgt_else.92626
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92628
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92630
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92632
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92634
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92636
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	fbgt_cont.92627
fbgt_else.92636:
	fmov	%f0, %f4
fbgt_cont.92637:
	j	fbgt_cont.92627
fbgt_else.92634:
	fmov	%f0, %f4
fbgt_cont.92635:
	j	fbgt_cont.92627
fbgt_else.92632:
	fmov	%f0, %f4
fbgt_cont.92633:
	j	fbgt_cont.92627
fbgt_else.92630:
	fmov	%f0, %f4
fbgt_cont.92631:
	j	fbgt_cont.92627
fbgt_else.92628:
	fmov	%f0, %f4
fbgt_cont.92629:
	j	fbgt_cont.92627
fbgt_else.92626:
	fmov	%f0, %f3
fbgt_cont.92627:
	flw	%f1, 39(%sp)
	flw	%f2, 40(%sp)
	fblt	%f1, %f2, fbgt_else.92638
	fblt	%f1, %f0, fbgt_else.92640
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92642
	fblt	%f1, %f0, fbgt_else.92644
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	fbgt_cont.92639
fbgt_else.92644:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
fbgt_cont.92645:
	j	fbgt_cont.92639
fbgt_else.92642:
	fmov	%f0, %f1
fbgt_cont.92643:
	j	fbgt_cont.92639
fbgt_else.92640:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92646
	fblt	%f1, %f0, fbgt_else.92648
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	fbgt_cont.92647
fbgt_else.92648:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
fbgt_cont.92649:
	j	fbgt_cont.92647
fbgt_else.92646:
	fmov	%f0, %f1
fbgt_cont.92647:
fbgt_cont.92641:
	j	fbgt_cont.92639
fbgt_else.92638:
	fmov	%f0, %f1
fbgt_cont.92639:
	flw	%f1, 38(%sp)
	fblt	%f0, %f1, fbgt_else.92650
	lw	%v0, 37(%sp)
	beqi	%v0, 0, bnei_else.92652
	addi	%v0, %zero, 0
	j	fbgt_cont.92651
bnei_else.92652:
	addi	%v0, %zero, 1
bnei_cont.92653:
	j	fbgt_cont.92651
fbgt_else.92650:
	lw	%v0, 37(%sp)
fbgt_cont.92651:
	fblt	%f0, %f1, fbgt_else.92654
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92655
fbgt_else.92654:
fbgt_cont.92655:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92656
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92657
fbgt_else.92656:
fbgt_cont.92657:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92658
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92659
fbgt_else.92658:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92659:
	beqi	%v0, 0, bnei_else.92660
	j	bnei_cont.92661
bnei_else.92660:
	fneg	%f0, %f0
bnei_cont.92661:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92553:
	j	bnei_cont.92551
bnei_else.92550:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92662
	addi	%v1, %zero, 0
	j	fbgt_cont.92663
fbgt_else.92662:
	addi	%v1, %zero, 1
fbgt_cont.92663:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92664
	addi	%a0, %zero, 0
	j	fbgt_cont.92665
fbgt_else.92664:
	addi	%a0, %zero, 1
fbgt_cont.92665:
	beqi	%v1, 0, bnei_else.92666
	beqi	%a0, 0, bnei_else.92668
	flw	%f0, 450(%zero)
	j	bnei_cont.92667
bnei_else.92668:
	flw	%f0, 20(%sp)
bnei_cont.92669:
	j	bnei_cont.92667
bnei_else.92666:
	beqi	%a0, 0, bnei_else.92670
	flw	%f0, 20(%sp)
	j	bnei_cont.92671
bnei_else.92670:
	flw	%f0, 450(%zero)
bnei_cont.92671:
bnei_cont.92667:
	fsw	%f0, 146(%zero)
bnei_cont.92551:
	lw	%v0, 0(%sp)
	lw	%v1, 31(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	beqi	%v0, 0, bnei_else.92672
	j	bnei_cont.92529
bnei_else.92672:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 20(%sp)
	fblt	%f1, %f0, fbgt_else.92674
	addi	%v0, %zero, 0
	j	fbgt_cont.92675
fbgt_else.92674:
	addi	%v0, %zero, 1
fbgt_cont.92675:
	beqi	%v0, 0, bnei_else.92676
	j	bnei_cont.92677
bnei_else.92676:
	fmov	%f0, %f1
bnei_cont.92677:
	flw	%f1, 30(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 33(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92673:
	j	bnei_cont.92529
bnei_else.92528:
bnei_cont.92529:
bnei_cont.92365:
	addi	%a1, %zero, 116
	lw	%v0, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 15(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	bnei_cont.92361
bnei_else.92360:
bnei_cont.92361:
	lw	%v0, 16(%sp)
	beqi	%v0, 1, bnei_else.92678
	lw	%v1, 180(%zero)
	lw	%a0, 15(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 41(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v0, 41(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 14(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.92680
	addi	%v1, %zero, 0
	j	fbgt_cont.92681
fbgt_else.92680:
	addi	%v1, %zero, 1
fbgt_cont.92681:
	beqi	%v1, 0, bnei_else.92682
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 42(%sp)
	sw	%v1, 43(%sp)
	fsw	%f1, 44(%sp)
	sw	%a0, 45(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.92684
	addi	%v0, %zero, 0
	j	fbgt_cont.92685
fbgt_else.92684:
	addi	%v0, %zero, 1
fbgt_cont.92685:
	beqi	%v0, 0, bnei_else.92686
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92688
	addi	%v0, %zero, 0
	j	bnei_cont.92687
fbgt_else.92688:
	addi	%v0, %zero, 1
fbgt_cont.92689:
	j	bnei_cont.92687
bnei_else.92686:
	addi	%v0, %zero, 0
bnei_cont.92687:
	beqi	%v0, 0, bnei_else.92690
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 45(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92692
	beqi	%a0, 2, bnei_else.92694
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92696
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92697
bnei_else.92696:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92697:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 44(%sp)
	fbne	%f1, %f4, fbeq_else.92698
	addi	%a0, %zero, 1
	j	fbeq_cont.92699
fbeq_else.92698:
	addi	%a0, %zero, 0
fbeq_cont.92699:
	beqi	%a0, 0, bnei_else.92700
	flw	%f1, 491(%zero)
	j	bnei_cont.92701
bnei_else.92700:
	beqi	%v1, 0, bnei_else.92702
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92703
bnei_else.92702:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92703:
bnei_cont.92701:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92693
bnei_else.92694:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92695:
	j	bnei_cont.92693
bnei_else.92692:
	lw	%a0, 136(%zero)
	flw	%f0, 44(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92704
	addi	%v1, %zero, 1
	j	fbeq_cont.92705
fbeq_else.92704:
	addi	%v1, %zero, 0
fbeq_cont.92705:
	beqi	%v1, 0, bnei_else.92706
	fmov	%f1, %f0
	j	bnei_cont.92707
bnei_else.92706:
	fblt	%f0, %f1, fbgt_else.92708
	addi	%v1, %zero, 0
	j	fbgt_cont.92709
fbgt_else.92708:
	addi	%v1, %zero, 1
fbgt_cont.92709:
	beqi	%v1, 0, bnei_else.92710
	flw	%f1, 491(%zero)
	j	bnei_cont.92711
bnei_else.92710:
	flw	%f1, 490(%zero)
bnei_cont.92711:
bnei_cont.92707:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92693:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 46(%sp)
	beqi	%v1, 1, bnei_else.92712
	beqi	%v1, 2, bnei_else.92714
	beqi	%v1, 3, bnei_else.92716
	beqi	%v1, 4, bnei_else.92718
	j	bnei_cont.92713
bnei_else.92718:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92720
	addi	%v1, %zero, 0
	j	fbgt_cont.92721
fbgt_else.92720:
	addi	%v1, %zero, 1
fbgt_cont.92721:
	beqi	%v1, 0, bnei_else.92722
	flw	%f0, 462(%zero)
	j	bnei_cont.92723
bnei_else.92722:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 44(%sp)
	fblt	%f0, %f1, fbgt_else.92724
	addi	%v1, %zero, 1
	j	fbgt_cont.92725
fbgt_else.92724:
	addi	%v1, %zero, 0
fbgt_cont.92725:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92726
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92728
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92729
fbgt_else.92728:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92729:
	beqi	%v1, 0, bnei_else.92730
	j	fbgt_cont.92727
bnei_else.92730:
	fneg	%f0, %f0
bnei_cont.92731:
	j	fbgt_cont.92727
fbgt_else.92726:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92727:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92723:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92732
	addi	%v1, %zero, 0
	j	fbgt_cont.92733
fbgt_else.92732:
	addi	%v1, %zero, 1
fbgt_cont.92733:
	beqi	%v1, 0, bnei_else.92734
	flw	%f1, 462(%zero)
	j	bnei_cont.92735
bnei_else.92734:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 44(%sp)
	fblt	%f1, %f2, fbgt_else.92736
	addi	%v1, %zero, 1
	j	fbgt_cont.92737
fbgt_else.92736:
	addi	%v1, %zero, 0
fbgt_cont.92737:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92738
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92740
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92741
fbgt_else.92740:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92741:
	beqi	%v1, 0, bnei_else.92742
	j	fbgt_cont.92739
bnei_else.92742:
	fneg	%f1, %f1
bnei_cont.92743:
	j	fbgt_cont.92739
fbgt_else.92738:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92739:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92735:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 44(%sp)
	fblt	%f0, %f1, fbgt_else.92744
	addi	%v1, %zero, 0
	j	fbgt_cont.92745
fbgt_else.92744:
	addi	%v1, %zero, 1
fbgt_cont.92745:
	beqi	%v1, 0, bnei_else.92746
	fmov	%f0, %f1
	j	bnei_cont.92747
bnei_else.92746:
bnei_cont.92747:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92719:
	j	bnei_cont.92713
bnei_else.92716:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 47(%sp)
	fsw	%f0, 48(%sp)
	fsw	%f2, 49(%sp)
	fblt	%f0, %f2, fbgt_else.92748
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92750
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92752
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92754
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92756
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92758
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	j	fbgt_cont.92749
fbgt_else.92758:
	fmov	%f0, %f3
fbgt_cont.92759:
	j	fbgt_cont.92749
fbgt_else.92756:
	fmov	%f0, %f3
fbgt_cont.92757:
	j	fbgt_cont.92749
fbgt_else.92754:
	fmov	%f0, %f3
fbgt_cont.92755:
	j	fbgt_cont.92749
fbgt_else.92752:
	fmov	%f0, %f3
fbgt_cont.92753:
	j	fbgt_cont.92749
fbgt_else.92750:
	fmov	%f0, %f3
fbgt_cont.92751:
	j	fbgt_cont.92749
fbgt_else.92748:
	fmov	%f0, %f2
fbgt_cont.92749:
	flw	%f1, 48(%sp)
	flw	%f2, 49(%sp)
	fblt	%f1, %f2, fbgt_else.92760
	fblt	%f1, %f0, fbgt_else.92762
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92764
	fblt	%f1, %f0, fbgt_else.92766
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	j	fbgt_cont.92761
fbgt_else.92766:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
fbgt_cont.92767:
	j	fbgt_cont.92761
fbgt_else.92764:
	fmov	%f0, %f1
fbgt_cont.92765:
	j	fbgt_cont.92761
fbgt_else.92762:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92768
	fblt	%f1, %f0, fbgt_else.92770
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	j	fbgt_cont.92769
fbgt_else.92770:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
fbgt_cont.92771:
	j	fbgt_cont.92769
fbgt_else.92768:
	fmov	%f0, %f1
fbgt_cont.92769:
fbgt_cont.92763:
	j	fbgt_cont.92761
fbgt_else.92760:
	fmov	%f0, %f1
fbgt_cont.92761:
	flw	%f1, 47(%sp)
	fblt	%f0, %f1, fbgt_else.92772
	addi	%v0, %zero, 0
	j	fbgt_cont.92773
fbgt_else.92772:
	addi	%v0, %zero, 1
fbgt_cont.92773:
	fblt	%f0, %f1, fbgt_else.92774
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92775
fbgt_else.92774:
fbgt_cont.92775:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92776
	beqi	%v0, 0, bnei_else.92778
	addi	%v0, %zero, 0
	j	fbgt_cont.92777
bnei_else.92778:
	addi	%v0, %zero, 1
bnei_cont.92779:
	j	fbgt_cont.92777
fbgt_else.92776:
fbgt_cont.92777:
	fblt	%f0, %f2, fbgt_else.92780
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92781
fbgt_else.92780:
fbgt_cont.92781:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92782
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92783
fbgt_else.92782:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92783:
	beqi	%v0, 0, bnei_else.92784
	j	bnei_cont.92785
bnei_else.92784:
	fneg	%f0, %f0
bnei_cont.92785:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92717:
	j	bnei_cont.92713
bnei_else.92714:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 44(%sp)
	fblt	%f0, %f2, fbgt_else.92786
	addi	%v1, %zero, 1
	j	fbgt_cont.92787
fbgt_else.92786:
	addi	%v1, %zero, 0
fbgt_cont.92787:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 50(%sp)
	fsw	%f1, 51(%sp)
	fsw	%f0, 52(%sp)
	fsw	%f3, 53(%sp)
	fblt	%f0, %f3, fbgt_else.92788
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92790
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92792
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92794
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92796
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92798
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	fbgt_cont.92789
fbgt_else.92798:
	fmov	%f0, %f4
fbgt_cont.92799:
	j	fbgt_cont.92789
fbgt_else.92796:
	fmov	%f0, %f4
fbgt_cont.92797:
	j	fbgt_cont.92789
fbgt_else.92794:
	fmov	%f0, %f4
fbgt_cont.92795:
	j	fbgt_cont.92789
fbgt_else.92792:
	fmov	%f0, %f4
fbgt_cont.92793:
	j	fbgt_cont.92789
fbgt_else.92790:
	fmov	%f0, %f4
fbgt_cont.92791:
	j	fbgt_cont.92789
fbgt_else.92788:
	fmov	%f0, %f3
fbgt_cont.92789:
	flw	%f1, 52(%sp)
	flw	%f2, 53(%sp)
	fblt	%f1, %f2, fbgt_else.92800
	fblt	%f1, %f0, fbgt_else.92802
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92804
	fblt	%f1, %f0, fbgt_else.92806
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	fbgt_cont.92801
fbgt_else.92806:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
fbgt_cont.92807:
	j	fbgt_cont.92801
fbgt_else.92804:
	fmov	%f0, %f1
fbgt_cont.92805:
	j	fbgt_cont.92801
fbgt_else.92802:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92808
	fblt	%f1, %f0, fbgt_else.92810
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	fbgt_cont.92809
fbgt_else.92810:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
fbgt_cont.92811:
	j	fbgt_cont.92809
fbgt_else.92808:
	fmov	%f0, %f1
fbgt_cont.92809:
fbgt_cont.92803:
	j	fbgt_cont.92801
fbgt_else.92800:
	fmov	%f0, %f1
fbgt_cont.92801:
	flw	%f1, 51(%sp)
	fblt	%f0, %f1, fbgt_else.92812
	lw	%v0, 50(%sp)
	beqi	%v0, 0, bnei_else.92814
	addi	%v0, %zero, 0
	j	fbgt_cont.92813
bnei_else.92814:
	addi	%v0, %zero, 1
bnei_cont.92815:
	j	fbgt_cont.92813
fbgt_else.92812:
	lw	%v0, 50(%sp)
fbgt_cont.92813:
	fblt	%f0, %f1, fbgt_else.92816
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92817
fbgt_else.92816:
fbgt_cont.92817:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92818
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92819
fbgt_else.92818:
fbgt_cont.92819:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92820
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92821
fbgt_else.92820:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92821:
	beqi	%v0, 0, bnei_else.92822
	j	bnei_cont.92823
bnei_else.92822:
	fneg	%f0, %f0
bnei_cont.92823:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92715:
	j	bnei_cont.92713
bnei_else.92712:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92824
	addi	%v1, %zero, 0
	j	fbgt_cont.92825
fbgt_else.92824:
	addi	%v1, %zero, 1
fbgt_cont.92825:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92826
	addi	%a0, %zero, 0
	j	fbgt_cont.92827
fbgt_else.92826:
	addi	%a0, %zero, 1
fbgt_cont.92827:
	beqi	%v1, 0, bnei_else.92828
	beqi	%a0, 0, bnei_else.92830
	flw	%f0, 450(%zero)
	j	bnei_cont.92829
bnei_else.92830:
	flw	%f0, 44(%sp)
bnei_cont.92831:
	j	bnei_cont.92829
bnei_else.92828:
	beqi	%a0, 0, bnei_else.92832
	flw	%f0, 44(%sp)
	j	bnei_cont.92833
bnei_else.92832:
	flw	%f0, 450(%zero)
bnei_cont.92833:
bnei_cont.92829:
	fsw	%f0, 146(%zero)
bnei_cont.92713:
	lw	%v0, 0(%sp)
	lw	%v1, 43(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	beqi	%v0, 0, bnei_else.92834
	j	bnei_cont.92683
bnei_else.92834:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 44(%sp)
	fblt	%f1, %f0, fbgt_else.92836
	addi	%v0, %zero, 0
	j	fbgt_cont.92837
fbgt_else.92836:
	addi	%v0, %zero, 1
fbgt_cont.92837:
	beqi	%v0, 0, bnei_else.92838
	j	bnei_cont.92839
bnei_else.92838:
	fmov	%f0, %f1
bnei_cont.92839:
	flw	%f1, 42(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 46(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92835:
	j	bnei_cont.92683
bnei_else.92690:
bnei_cont.92691:
	j	bnei_cont.92683
bnei_else.92682:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 54(%sp)
	sw	%v1, 55(%sp)
	fsw	%f1, 44(%sp)
	sw	%a0, 56(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.92840
	addi	%v0, %zero, 0
	j	fbgt_cont.92841
fbgt_else.92840:
	addi	%v0, %zero, 1
fbgt_cont.92841:
	beqi	%v0, 0, bnei_else.92842
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.92844
	addi	%v0, %zero, 0
	j	bnei_cont.92843
fbgt_else.92844:
	addi	%v0, %zero, 1
fbgt_cont.92845:
	j	bnei_cont.92843
bnei_else.92842:
	addi	%v0, %zero, 0
bnei_cont.92843:
	beqi	%v0, 0, bnei_else.92846
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 56(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.92848
	beqi	%a0, 2, bnei_else.92850
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.92852
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.92853
bnei_else.92852:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.92853:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 44(%sp)
	fbne	%f1, %f4, fbeq_else.92854
	addi	%a0, %zero, 1
	j	fbeq_cont.92855
fbeq_else.92854:
	addi	%a0, %zero, 0
fbeq_cont.92855:
	beqi	%a0, 0, bnei_else.92856
	flw	%f1, 491(%zero)
	j	bnei_cont.92857
bnei_else.92856:
	beqi	%v1, 0, bnei_else.92858
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.92859
bnei_else.92858:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.92859:
bnei_cont.92857:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.92849
bnei_else.92850:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.92851:
	j	bnei_cont.92849
bnei_else.92848:
	lw	%a0, 136(%zero)
	flw	%f0, 44(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.92860
	addi	%v1, %zero, 1
	j	fbeq_cont.92861
fbeq_else.92860:
	addi	%v1, %zero, 0
fbeq_cont.92861:
	beqi	%v1, 0, bnei_else.92862
	fmov	%f1, %f0
	j	bnei_cont.92863
bnei_else.92862:
	fblt	%f0, %f1, fbgt_else.92864
	addi	%v1, %zero, 0
	j	fbgt_cont.92865
fbgt_else.92864:
	addi	%v1, %zero, 1
fbgt_cont.92865:
	beqi	%v1, 0, bnei_else.92866
	flw	%f1, 491(%zero)
	j	bnei_cont.92867
bnei_else.92866:
	flw	%f1, 490(%zero)
bnei_cont.92867:
bnei_cont.92863:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.92849:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 57(%sp)
	beqi	%v1, 1, bnei_else.92868
	beqi	%v1, 2, bnei_else.92870
	beqi	%v1, 3, bnei_else.92872
	beqi	%v1, 4, bnei_else.92874
	j	bnei_cont.92869
bnei_else.92874:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.92876
	addi	%v1, %zero, 0
	j	fbgt_cont.92877
fbgt_else.92876:
	addi	%v1, %zero, 1
fbgt_cont.92877:
	beqi	%v1, 0, bnei_else.92878
	flw	%f0, 462(%zero)
	j	bnei_cont.92879
bnei_else.92878:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 44(%sp)
	fblt	%f0, %f1, fbgt_else.92880
	addi	%v1, %zero, 1
	j	fbgt_cont.92881
fbgt_else.92880:
	addi	%v1, %zero, 0
fbgt_cont.92881:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.92882
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.92884
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.92885
fbgt_else.92884:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.92885:
	beqi	%v1, 0, bnei_else.92886
	j	fbgt_cont.92883
bnei_else.92886:
	fneg	%f0, %f0
bnei_cont.92887:
	j	fbgt_cont.92883
fbgt_else.92882:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.92883:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.92879:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.92888
	addi	%v1, %zero, 0
	j	fbgt_cont.92889
fbgt_else.92888:
	addi	%v1, %zero, 1
fbgt_cont.92889:
	beqi	%v1, 0, bnei_else.92890
	flw	%f1, 462(%zero)
	j	bnei_cont.92891
bnei_else.92890:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 44(%sp)
	fblt	%f1, %f2, fbgt_else.92892
	addi	%v1, %zero, 1
	j	fbgt_cont.92893
fbgt_else.92892:
	addi	%v1, %zero, 0
fbgt_cont.92893:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.92894
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.92896
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.92897
fbgt_else.92896:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.92897:
	beqi	%v1, 0, bnei_else.92898
	j	fbgt_cont.92895
bnei_else.92898:
	fneg	%f1, %f1
bnei_cont.92899:
	j	fbgt_cont.92895
fbgt_else.92894:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.92895:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.92891:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 44(%sp)
	fblt	%f0, %f1, fbgt_else.92900
	addi	%v1, %zero, 0
	j	fbgt_cont.92901
fbgt_else.92900:
	addi	%v1, %zero, 1
fbgt_cont.92901:
	beqi	%v1, 0, bnei_else.92902
	fmov	%f0, %f1
	j	bnei_cont.92903
bnei_else.92902:
bnei_cont.92903:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.92875:
	j	bnei_cont.92869
bnei_else.92872:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 58(%sp)
	fsw	%f0, 59(%sp)
	fsw	%f2, 60(%sp)
	fblt	%f0, %f2, fbgt_else.92904
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.92906
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.92908
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.92910
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.92912
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.92914
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	j	fbgt_cont.92905
fbgt_else.92914:
	fmov	%f0, %f3
fbgt_cont.92915:
	j	fbgt_cont.92905
fbgt_else.92912:
	fmov	%f0, %f3
fbgt_cont.92913:
	j	fbgt_cont.92905
fbgt_else.92910:
	fmov	%f0, %f3
fbgt_cont.92911:
	j	fbgt_cont.92905
fbgt_else.92908:
	fmov	%f0, %f3
fbgt_cont.92909:
	j	fbgt_cont.92905
fbgt_else.92906:
	fmov	%f0, %f3
fbgt_cont.92907:
	j	fbgt_cont.92905
fbgt_else.92904:
	fmov	%f0, %f2
fbgt_cont.92905:
	flw	%f1, 59(%sp)
	flw	%f2, 60(%sp)
	fblt	%f1, %f2, fbgt_else.92916
	fblt	%f1, %f0, fbgt_else.92918
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92920
	fblt	%f1, %f0, fbgt_else.92922
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	j	fbgt_cont.92917
fbgt_else.92922:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
fbgt_cont.92923:
	j	fbgt_cont.92917
fbgt_else.92920:
	fmov	%f0, %f1
fbgt_cont.92921:
	j	fbgt_cont.92917
fbgt_else.92918:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92924
	fblt	%f1, %f0, fbgt_else.92926
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	j	fbgt_cont.92925
fbgt_else.92926:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
fbgt_cont.92927:
	j	fbgt_cont.92925
fbgt_else.92924:
	fmov	%f0, %f1
fbgt_cont.92925:
fbgt_cont.92919:
	j	fbgt_cont.92917
fbgt_else.92916:
	fmov	%f0, %f1
fbgt_cont.92917:
	flw	%f1, 58(%sp)
	fblt	%f0, %f1, fbgt_else.92928
	addi	%v0, %zero, 0
	j	fbgt_cont.92929
fbgt_else.92928:
	addi	%v0, %zero, 1
fbgt_cont.92929:
	fblt	%f0, %f1, fbgt_else.92930
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92931
fbgt_else.92930:
fbgt_cont.92931:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92932
	beqi	%v0, 0, bnei_else.92934
	addi	%v0, %zero, 0
	j	fbgt_cont.92933
bnei_else.92934:
	addi	%v0, %zero, 1
bnei_cont.92935:
	j	fbgt_cont.92933
fbgt_else.92932:
fbgt_cont.92933:
	fblt	%f0, %f2, fbgt_else.92936
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92937
fbgt_else.92936:
fbgt_cont.92937:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92938
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.92939
fbgt_else.92938:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.92939:
	beqi	%v0, 0, bnei_else.92940
	j	bnei_cont.92941
bnei_else.92940:
	fneg	%f0, %f0
bnei_cont.92941:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.92873:
	j	bnei_cont.92869
bnei_else.92870:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 44(%sp)
	fblt	%f0, %f2, fbgt_else.92942
	addi	%v1, %zero, 1
	j	fbgt_cont.92943
fbgt_else.92942:
	addi	%v1, %zero, 0
fbgt_cont.92943:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 61(%sp)
	fsw	%f1, 62(%sp)
	fsw	%f0, 63(%sp)
	fsw	%f3, 64(%sp)
	fblt	%f0, %f3, fbgt_else.92944
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.92946
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.92948
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.92950
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.92952
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.92954
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.92945
fbgt_else.92954:
	fmov	%f0, %f4
fbgt_cont.92955:
	j	fbgt_cont.92945
fbgt_else.92952:
	fmov	%f0, %f4
fbgt_cont.92953:
	j	fbgt_cont.92945
fbgt_else.92950:
	fmov	%f0, %f4
fbgt_cont.92951:
	j	fbgt_cont.92945
fbgt_else.92948:
	fmov	%f0, %f4
fbgt_cont.92949:
	j	fbgt_cont.92945
fbgt_else.92946:
	fmov	%f0, %f4
fbgt_cont.92947:
	j	fbgt_cont.92945
fbgt_else.92944:
	fmov	%f0, %f3
fbgt_cont.92945:
	flw	%f1, 63(%sp)
	flw	%f2, 64(%sp)
	fblt	%f1, %f2, fbgt_else.92956
	fblt	%f1, %f0, fbgt_else.92958
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92960
	fblt	%f1, %f0, fbgt_else.92962
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.92957
fbgt_else.92962:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.92963:
	j	fbgt_cont.92957
fbgt_else.92960:
	fmov	%f0, %f1
fbgt_cont.92961:
	j	fbgt_cont.92957
fbgt_else.92958:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.92964
	fblt	%f1, %f0, fbgt_else.92966
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.92965
fbgt_else.92966:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.92967:
	j	fbgt_cont.92965
fbgt_else.92964:
	fmov	%f0, %f1
fbgt_cont.92965:
fbgt_cont.92959:
	j	fbgt_cont.92957
fbgt_else.92956:
	fmov	%f0, %f1
fbgt_cont.92957:
	flw	%f1, 62(%sp)
	fblt	%f0, %f1, fbgt_else.92968
	lw	%v0, 61(%sp)
	beqi	%v0, 0, bnei_else.92970
	addi	%v0, %zero, 0
	j	fbgt_cont.92969
bnei_else.92970:
	addi	%v0, %zero, 1
bnei_cont.92971:
	j	fbgt_cont.92969
fbgt_else.92968:
	lw	%v0, 61(%sp)
fbgt_cont.92969:
	fblt	%f0, %f1, fbgt_else.92972
	fsub	%f0, %f0, %f1
	j	fbgt_cont.92973
fbgt_else.92972:
fbgt_cont.92973:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.92974
	fsub	%f0, %f1, %f0
	j	fbgt_cont.92975
fbgt_else.92974:
fbgt_cont.92975:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.92976
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.92977
fbgt_else.92976:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.92977:
	beqi	%v0, 0, bnei_else.92978
	j	bnei_cont.92979
bnei_else.92978:
	fneg	%f0, %f0
bnei_cont.92979:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.92871:
	j	bnei_cont.92869
bnei_else.92868:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.92980
	addi	%v1, %zero, 0
	j	fbgt_cont.92981
fbgt_else.92980:
	addi	%v1, %zero, 1
fbgt_cont.92981:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.92982
	addi	%a0, %zero, 0
	j	fbgt_cont.92983
fbgt_else.92982:
	addi	%a0, %zero, 1
fbgt_cont.92983:
	beqi	%v1, 0, bnei_else.92984
	beqi	%a0, 0, bnei_else.92986
	flw	%f0, 450(%zero)
	j	bnei_cont.92985
bnei_else.92986:
	flw	%f0, 44(%sp)
bnei_cont.92987:
	j	bnei_cont.92985
bnei_else.92984:
	beqi	%a0, 0, bnei_else.92988
	flw	%f0, 44(%sp)
	j	bnei_cont.92989
bnei_else.92988:
	flw	%f0, 450(%zero)
bnei_cont.92989:
bnei_cont.92985:
	fsw	%f0, 146(%zero)
bnei_cont.92869:
	lw	%v0, 0(%sp)
	lw	%v1, 55(%sp)
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	beqi	%v0, 0, bnei_else.92990
	j	bnei_cont.92847
bnei_else.92990:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 44(%sp)
	fblt	%f1, %f0, fbgt_else.92992
	addi	%v0, %zero, 0
	j	fbgt_cont.92993
fbgt_else.92992:
	addi	%v0, %zero, 1
fbgt_cont.92993:
	beqi	%v0, 0, bnei_else.92994
	j	bnei_cont.92995
bnei_else.92994:
	fmov	%f0, %f1
bnei_cont.92995:
	flw	%f1, 54(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 57(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.92991:
	j	bnei_cont.92847
bnei_else.92846:
bnei_cont.92847:
bnei_cont.92683:
	addi	%a1, %zero, 116
	lw	%v0, 41(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 15(%sp)
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	bnei_cont.92679
bnei_else.92678:
bnei_cont.92679:
	lw	%v0, 16(%sp)
	beqi	%v0, 2, bnei_else.92996
	lw	%v1, 181(%zero)
	lw	%a0, 15(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 65(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 66(%sp)
	addi	%sp, %sp, 67
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -67
	lw	%ra, 66(%sp)
	lw	%v0, 65(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 14(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.92998
	addi	%v1, %zero, 0
	j	fbgt_cont.92999
fbgt_else.92998:
	addi	%v1, %zero, 1
fbgt_cont.92999:
	beqi	%v1, 0, bnei_else.93000
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 66(%sp)
	sw	%v1, 67(%sp)
	fsw	%f1, 68(%sp)
	sw	%a0, 69(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 70(%sp)
	addi	%sp, %sp, 71
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -71
	lw	%ra, 70(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93002
	addi	%v0, %zero, 0
	j	fbgt_cont.93003
fbgt_else.93002:
	addi	%v0, %zero, 1
fbgt_cont.93003:
	beqi	%v0, 0, bnei_else.93004
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93006
	addi	%v0, %zero, 0
	j	bnei_cont.93005
fbgt_else.93006:
	addi	%v0, %zero, 1
fbgt_cont.93007:
	j	bnei_cont.93005
bnei_else.93004:
	addi	%v0, %zero, 0
bnei_cont.93005:
	beqi	%v0, 0, bnei_else.93008
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 69(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93010
	beqi	%a0, 2, bnei_else.93012
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93014
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93015
bnei_else.93014:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93015:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 68(%sp)
	fbne	%f1, %f4, fbeq_else.93016
	addi	%a0, %zero, 1
	j	fbeq_cont.93017
fbeq_else.93016:
	addi	%a0, %zero, 0
fbeq_cont.93017:
	beqi	%a0, 0, bnei_else.93018
	flw	%f1, 491(%zero)
	j	bnei_cont.93019
bnei_else.93018:
	beqi	%v1, 0, bnei_else.93020
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93021
bnei_else.93020:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93021:
bnei_cont.93019:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93011
bnei_else.93012:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93013:
	j	bnei_cont.93011
bnei_else.93010:
	lw	%a0, 136(%zero)
	flw	%f0, 68(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93022
	addi	%v1, %zero, 1
	j	fbeq_cont.93023
fbeq_else.93022:
	addi	%v1, %zero, 0
fbeq_cont.93023:
	beqi	%v1, 0, bnei_else.93024
	fmov	%f1, %f0
	j	bnei_cont.93025
bnei_else.93024:
	fblt	%f0, %f1, fbgt_else.93026
	addi	%v1, %zero, 0
	j	fbgt_cont.93027
fbgt_else.93026:
	addi	%v1, %zero, 1
fbgt_cont.93027:
	beqi	%v1, 0, bnei_else.93028
	flw	%f1, 491(%zero)
	j	bnei_cont.93029
bnei_else.93028:
	flw	%f1, 490(%zero)
bnei_cont.93029:
bnei_cont.93025:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93011:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 70(%sp)
	beqi	%v1, 1, bnei_else.93030
	beqi	%v1, 2, bnei_else.93032
	beqi	%v1, 3, bnei_else.93034
	beqi	%v1, 4, bnei_else.93036
	j	bnei_cont.93031
bnei_else.93036:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93038
	addi	%v1, %zero, 0
	j	fbgt_cont.93039
fbgt_else.93038:
	addi	%v1, %zero, 1
fbgt_cont.93039:
	beqi	%v1, 0, bnei_else.93040
	flw	%f0, 462(%zero)
	j	bnei_cont.93041
bnei_else.93040:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 68(%sp)
	fblt	%f0, %f1, fbgt_else.93042
	addi	%v1, %zero, 1
	j	fbgt_cont.93043
fbgt_else.93042:
	addi	%v1, %zero, 0
fbgt_cont.93043:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93044
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93046
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93047
fbgt_else.93046:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93047:
	beqi	%v1, 0, bnei_else.93048
	j	fbgt_cont.93045
bnei_else.93048:
	fneg	%f0, %f0
bnei_cont.93049:
	j	fbgt_cont.93045
fbgt_else.93044:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93045:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93041:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93050
	addi	%v1, %zero, 0
	j	fbgt_cont.93051
fbgt_else.93050:
	addi	%v1, %zero, 1
fbgt_cont.93051:
	beqi	%v1, 0, bnei_else.93052
	flw	%f1, 462(%zero)
	j	bnei_cont.93053
bnei_else.93052:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 68(%sp)
	fblt	%f1, %f2, fbgt_else.93054
	addi	%v1, %zero, 1
	j	fbgt_cont.93055
fbgt_else.93054:
	addi	%v1, %zero, 0
fbgt_cont.93055:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93056
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93058
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93059
fbgt_else.93058:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93059:
	beqi	%v1, 0, bnei_else.93060
	j	fbgt_cont.93057
bnei_else.93060:
	fneg	%f1, %f1
bnei_cont.93061:
	j	fbgt_cont.93057
fbgt_else.93056:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93057:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93053:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 68(%sp)
	fblt	%f0, %f1, fbgt_else.93062
	addi	%v1, %zero, 0
	j	fbgt_cont.93063
fbgt_else.93062:
	addi	%v1, %zero, 1
fbgt_cont.93063:
	beqi	%v1, 0, bnei_else.93064
	fmov	%f0, %f1
	j	bnei_cont.93065
bnei_else.93064:
bnei_cont.93065:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93037:
	j	bnei_cont.93031
bnei_else.93034:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 71(%sp)
	fsw	%f0, 72(%sp)
	fsw	%f2, 73(%sp)
	fblt	%f0, %f2, fbgt_else.93066
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93068
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93070
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93072
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93074
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93076
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.93067
fbgt_else.93076:
	fmov	%f0, %f3
fbgt_cont.93077:
	j	fbgt_cont.93067
fbgt_else.93074:
	fmov	%f0, %f3
fbgt_cont.93075:
	j	fbgt_cont.93067
fbgt_else.93072:
	fmov	%f0, %f3
fbgt_cont.93073:
	j	fbgt_cont.93067
fbgt_else.93070:
	fmov	%f0, %f3
fbgt_cont.93071:
	j	fbgt_cont.93067
fbgt_else.93068:
	fmov	%f0, %f3
fbgt_cont.93069:
	j	fbgt_cont.93067
fbgt_else.93066:
	fmov	%f0, %f2
fbgt_cont.93067:
	flw	%f1, 72(%sp)
	flw	%f2, 73(%sp)
	fblt	%f1, %f2, fbgt_else.93078
	fblt	%f1, %f0, fbgt_else.93080
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93082
	fblt	%f1, %f0, fbgt_else.93084
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.93079
fbgt_else.93084:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.93085:
	j	fbgt_cont.93079
fbgt_else.93082:
	fmov	%f0, %f1
fbgt_cont.93083:
	j	fbgt_cont.93079
fbgt_else.93080:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93086
	fblt	%f1, %f0, fbgt_else.93088
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.93087
fbgt_else.93088:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.93089:
	j	fbgt_cont.93087
fbgt_else.93086:
	fmov	%f0, %f1
fbgt_cont.93087:
fbgt_cont.93081:
	j	fbgt_cont.93079
fbgt_else.93078:
	fmov	%f0, %f1
fbgt_cont.93079:
	flw	%f1, 71(%sp)
	fblt	%f0, %f1, fbgt_else.93090
	addi	%v0, %zero, 0
	j	fbgt_cont.93091
fbgt_else.93090:
	addi	%v0, %zero, 1
fbgt_cont.93091:
	fblt	%f0, %f1, fbgt_else.93092
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93093
fbgt_else.93092:
fbgt_cont.93093:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93094
	beqi	%v0, 0, bnei_else.93096
	addi	%v0, %zero, 0
	j	fbgt_cont.93095
bnei_else.93096:
	addi	%v0, %zero, 1
bnei_cont.93097:
	j	fbgt_cont.93095
fbgt_else.93094:
fbgt_cont.93095:
	fblt	%f0, %f2, fbgt_else.93098
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93099
fbgt_else.93098:
fbgt_cont.93099:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93100
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93101
fbgt_else.93100:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93101:
	beqi	%v0, 0, bnei_else.93102
	j	bnei_cont.93103
bnei_else.93102:
	fneg	%f0, %f0
bnei_cont.93103:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93035:
	j	bnei_cont.93031
bnei_else.93032:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 68(%sp)
	fblt	%f0, %f2, fbgt_else.93104
	addi	%v1, %zero, 1
	j	fbgt_cont.93105
fbgt_else.93104:
	addi	%v1, %zero, 0
fbgt_cont.93105:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 74(%sp)
	fsw	%f1, 75(%sp)
	fsw	%f0, 76(%sp)
	fsw	%f3, 77(%sp)
	fblt	%f0, %f3, fbgt_else.93106
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93108
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93110
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93112
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93114
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93116
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.93107
fbgt_else.93116:
	fmov	%f0, %f4
fbgt_cont.93117:
	j	fbgt_cont.93107
fbgt_else.93114:
	fmov	%f0, %f4
fbgt_cont.93115:
	j	fbgt_cont.93107
fbgt_else.93112:
	fmov	%f0, %f4
fbgt_cont.93113:
	j	fbgt_cont.93107
fbgt_else.93110:
	fmov	%f0, %f4
fbgt_cont.93111:
	j	fbgt_cont.93107
fbgt_else.93108:
	fmov	%f0, %f4
fbgt_cont.93109:
	j	fbgt_cont.93107
fbgt_else.93106:
	fmov	%f0, %f3
fbgt_cont.93107:
	flw	%f1, 76(%sp)
	flw	%f2, 77(%sp)
	fblt	%f1, %f2, fbgt_else.93118
	fblt	%f1, %f0, fbgt_else.93120
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93122
	fblt	%f1, %f0, fbgt_else.93124
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.93119
fbgt_else.93124:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.93125:
	j	fbgt_cont.93119
fbgt_else.93122:
	fmov	%f0, %f1
fbgt_cont.93123:
	j	fbgt_cont.93119
fbgt_else.93120:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93126
	fblt	%f1, %f0, fbgt_else.93128
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.93127
fbgt_else.93128:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.93129:
	j	fbgt_cont.93127
fbgt_else.93126:
	fmov	%f0, %f1
fbgt_cont.93127:
fbgt_cont.93121:
	j	fbgt_cont.93119
fbgt_else.93118:
	fmov	%f0, %f1
fbgt_cont.93119:
	flw	%f1, 75(%sp)
	fblt	%f0, %f1, fbgt_else.93130
	lw	%v0, 74(%sp)
	beqi	%v0, 0, bnei_else.93132
	addi	%v0, %zero, 0
	j	fbgt_cont.93131
bnei_else.93132:
	addi	%v0, %zero, 1
bnei_cont.93133:
	j	fbgt_cont.93131
fbgt_else.93130:
	lw	%v0, 74(%sp)
fbgt_cont.93131:
	fblt	%f0, %f1, fbgt_else.93134
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93135
fbgt_else.93134:
fbgt_cont.93135:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93136
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93137
fbgt_else.93136:
fbgt_cont.93137:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93138
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93139
fbgt_else.93138:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93139:
	beqi	%v0, 0, bnei_else.93140
	j	bnei_cont.93141
bnei_else.93140:
	fneg	%f0, %f0
bnei_cont.93141:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93033:
	j	bnei_cont.93031
bnei_else.93030:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93142
	addi	%v1, %zero, 0
	j	fbgt_cont.93143
fbgt_else.93142:
	addi	%v1, %zero, 1
fbgt_cont.93143:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93144
	addi	%a0, %zero, 0
	j	fbgt_cont.93145
fbgt_else.93144:
	addi	%a0, %zero, 1
fbgt_cont.93145:
	beqi	%v1, 0, bnei_else.93146
	beqi	%a0, 0, bnei_else.93148
	flw	%f0, 450(%zero)
	j	bnei_cont.93147
bnei_else.93148:
	flw	%f0, 68(%sp)
bnei_cont.93149:
	j	bnei_cont.93147
bnei_else.93146:
	beqi	%a0, 0, bnei_else.93150
	flw	%f0, 68(%sp)
	j	bnei_cont.93151
bnei_else.93150:
	flw	%f0, 450(%zero)
bnei_cont.93151:
bnei_cont.93147:
	fsw	%f0, 146(%zero)
bnei_cont.93031:
	lw	%v0, 0(%sp)
	lw	%v1, 67(%sp)
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	beqi	%v0, 0, bnei_else.93152
	j	bnei_cont.93001
bnei_else.93152:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 68(%sp)
	fblt	%f1, %f0, fbgt_else.93154
	addi	%v0, %zero, 0
	j	fbgt_cont.93155
fbgt_else.93154:
	addi	%v0, %zero, 1
fbgt_cont.93155:
	beqi	%v0, 0, bnei_else.93156
	j	bnei_cont.93157
bnei_else.93156:
	fmov	%f0, %f1
bnei_cont.93157:
	flw	%f1, 66(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 70(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93153:
	j	bnei_cont.93001
bnei_else.93008:
bnei_cont.93009:
	j	bnei_cont.93001
bnei_else.93000:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 78(%sp)
	sw	%v1, 79(%sp)
	fsw	%f1, 68(%sp)
	sw	%a0, 80(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93158
	addi	%v0, %zero, 0
	j	fbgt_cont.93159
fbgt_else.93158:
	addi	%v0, %zero, 1
fbgt_cont.93159:
	beqi	%v0, 0, bnei_else.93160
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93162
	addi	%v0, %zero, 0
	j	bnei_cont.93161
fbgt_else.93162:
	addi	%v0, %zero, 1
fbgt_cont.93163:
	j	bnei_cont.93161
bnei_else.93160:
	addi	%v0, %zero, 0
bnei_cont.93161:
	beqi	%v0, 0, bnei_else.93164
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 80(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93166
	beqi	%a0, 2, bnei_else.93168
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93170
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93171
bnei_else.93170:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93171:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 68(%sp)
	fbne	%f1, %f4, fbeq_else.93172
	addi	%a0, %zero, 1
	j	fbeq_cont.93173
fbeq_else.93172:
	addi	%a0, %zero, 0
fbeq_cont.93173:
	beqi	%a0, 0, bnei_else.93174
	flw	%f1, 491(%zero)
	j	bnei_cont.93175
bnei_else.93174:
	beqi	%v1, 0, bnei_else.93176
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93177
bnei_else.93176:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93177:
bnei_cont.93175:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93167
bnei_else.93168:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93169:
	j	bnei_cont.93167
bnei_else.93166:
	lw	%a0, 136(%zero)
	flw	%f0, 68(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93178
	addi	%v1, %zero, 1
	j	fbeq_cont.93179
fbeq_else.93178:
	addi	%v1, %zero, 0
fbeq_cont.93179:
	beqi	%v1, 0, bnei_else.93180
	fmov	%f1, %f0
	j	bnei_cont.93181
bnei_else.93180:
	fblt	%f0, %f1, fbgt_else.93182
	addi	%v1, %zero, 0
	j	fbgt_cont.93183
fbgt_else.93182:
	addi	%v1, %zero, 1
fbgt_cont.93183:
	beqi	%v1, 0, bnei_else.93184
	flw	%f1, 491(%zero)
	j	bnei_cont.93185
bnei_else.93184:
	flw	%f1, 490(%zero)
bnei_cont.93185:
bnei_cont.93181:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93167:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 81(%sp)
	beqi	%v1, 1, bnei_else.93186
	beqi	%v1, 2, bnei_else.93188
	beqi	%v1, 3, bnei_else.93190
	beqi	%v1, 4, bnei_else.93192
	j	bnei_cont.93187
bnei_else.93192:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93194
	addi	%v1, %zero, 0
	j	fbgt_cont.93195
fbgt_else.93194:
	addi	%v1, %zero, 1
fbgt_cont.93195:
	beqi	%v1, 0, bnei_else.93196
	flw	%f0, 462(%zero)
	j	bnei_cont.93197
bnei_else.93196:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 68(%sp)
	fblt	%f0, %f1, fbgt_else.93198
	addi	%v1, %zero, 1
	j	fbgt_cont.93199
fbgt_else.93198:
	addi	%v1, %zero, 0
fbgt_cont.93199:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93200
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93202
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93203
fbgt_else.93202:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93203:
	beqi	%v1, 0, bnei_else.93204
	j	fbgt_cont.93201
bnei_else.93204:
	fneg	%f0, %f0
bnei_cont.93205:
	j	fbgt_cont.93201
fbgt_else.93200:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93201:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93197:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93206
	addi	%v1, %zero, 0
	j	fbgt_cont.93207
fbgt_else.93206:
	addi	%v1, %zero, 1
fbgt_cont.93207:
	beqi	%v1, 0, bnei_else.93208
	flw	%f1, 462(%zero)
	j	bnei_cont.93209
bnei_else.93208:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 68(%sp)
	fblt	%f1, %f2, fbgt_else.93210
	addi	%v1, %zero, 1
	j	fbgt_cont.93211
fbgt_else.93210:
	addi	%v1, %zero, 0
fbgt_cont.93211:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93212
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93214
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93215
fbgt_else.93214:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93215:
	beqi	%v1, 0, bnei_else.93216
	j	fbgt_cont.93213
bnei_else.93216:
	fneg	%f1, %f1
bnei_cont.93217:
	j	fbgt_cont.93213
fbgt_else.93212:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93213:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93209:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 68(%sp)
	fblt	%f0, %f1, fbgt_else.93218
	addi	%v1, %zero, 0
	j	fbgt_cont.93219
fbgt_else.93218:
	addi	%v1, %zero, 1
fbgt_cont.93219:
	beqi	%v1, 0, bnei_else.93220
	fmov	%f0, %f1
	j	bnei_cont.93221
bnei_else.93220:
bnei_cont.93221:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93193:
	j	bnei_cont.93187
bnei_else.93190:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 82(%sp)
	fsw	%f0, 83(%sp)
	fsw	%f2, 84(%sp)
	fblt	%f0, %f2, fbgt_else.93222
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93224
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93226
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93228
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93230
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93232
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 85(%sp)
	addi	%sp, %sp, 86
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -86
	lw	%ra, 85(%sp)
	j	fbgt_cont.93223
fbgt_else.93232:
	fmov	%f0, %f3
fbgt_cont.93233:
	j	fbgt_cont.93223
fbgt_else.93230:
	fmov	%f0, %f3
fbgt_cont.93231:
	j	fbgt_cont.93223
fbgt_else.93228:
	fmov	%f0, %f3
fbgt_cont.93229:
	j	fbgt_cont.93223
fbgt_else.93226:
	fmov	%f0, %f3
fbgt_cont.93227:
	j	fbgt_cont.93223
fbgt_else.93224:
	fmov	%f0, %f3
fbgt_cont.93225:
	j	fbgt_cont.93223
fbgt_else.93222:
	fmov	%f0, %f2
fbgt_cont.93223:
	flw	%f1, 83(%sp)
	flw	%f2, 84(%sp)
	fblt	%f1, %f2, fbgt_else.93234
	fblt	%f1, %f0, fbgt_else.93236
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93238
	fblt	%f1, %f0, fbgt_else.93240
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 85(%sp)
	addi	%sp, %sp, 86
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -86
	lw	%ra, 85(%sp)
	j	fbgt_cont.93235
fbgt_else.93240:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 85(%sp)
	addi	%sp, %sp, 86
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -86
	lw	%ra, 85(%sp)
fbgt_cont.93241:
	j	fbgt_cont.93235
fbgt_else.93238:
	fmov	%f0, %f1
fbgt_cont.93239:
	j	fbgt_cont.93235
fbgt_else.93236:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93242
	fblt	%f1, %f0, fbgt_else.93244
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 85(%sp)
	addi	%sp, %sp, 86
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -86
	lw	%ra, 85(%sp)
	j	fbgt_cont.93243
fbgt_else.93244:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 85(%sp)
	addi	%sp, %sp, 86
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -86
	lw	%ra, 85(%sp)
fbgt_cont.93245:
	j	fbgt_cont.93243
fbgt_else.93242:
	fmov	%f0, %f1
fbgt_cont.93243:
fbgt_cont.93237:
	j	fbgt_cont.93235
fbgt_else.93234:
	fmov	%f0, %f1
fbgt_cont.93235:
	flw	%f1, 82(%sp)
	fblt	%f0, %f1, fbgt_else.93246
	addi	%v0, %zero, 0
	j	fbgt_cont.93247
fbgt_else.93246:
	addi	%v0, %zero, 1
fbgt_cont.93247:
	fblt	%f0, %f1, fbgt_else.93248
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93249
fbgt_else.93248:
fbgt_cont.93249:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93250
	beqi	%v0, 0, bnei_else.93252
	addi	%v0, %zero, 0
	j	fbgt_cont.93251
bnei_else.93252:
	addi	%v0, %zero, 1
bnei_cont.93253:
	j	fbgt_cont.93251
fbgt_else.93250:
fbgt_cont.93251:
	fblt	%f0, %f2, fbgt_else.93254
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93255
fbgt_else.93254:
fbgt_cont.93255:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93256
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93257
fbgt_else.93256:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93257:
	beqi	%v0, 0, bnei_else.93258
	j	bnei_cont.93259
bnei_else.93258:
	fneg	%f0, %f0
bnei_cont.93259:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93191:
	j	bnei_cont.93187
bnei_else.93188:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 68(%sp)
	fblt	%f0, %f2, fbgt_else.93260
	addi	%v1, %zero, 1
	j	fbgt_cont.93261
fbgt_else.93260:
	addi	%v1, %zero, 0
fbgt_cont.93261:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 85(%sp)
	fsw	%f1, 86(%sp)
	fsw	%f0, 87(%sp)
	fsw	%f3, 88(%sp)
	fblt	%f0, %f3, fbgt_else.93262
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93264
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93266
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93268
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93270
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93272
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
	j	fbgt_cont.93263
fbgt_else.93272:
	fmov	%f0, %f4
fbgt_cont.93273:
	j	fbgt_cont.93263
fbgt_else.93270:
	fmov	%f0, %f4
fbgt_cont.93271:
	j	fbgt_cont.93263
fbgt_else.93268:
	fmov	%f0, %f4
fbgt_cont.93269:
	j	fbgt_cont.93263
fbgt_else.93266:
	fmov	%f0, %f4
fbgt_cont.93267:
	j	fbgt_cont.93263
fbgt_else.93264:
	fmov	%f0, %f4
fbgt_cont.93265:
	j	fbgt_cont.93263
fbgt_else.93262:
	fmov	%f0, %f3
fbgt_cont.93263:
	flw	%f1, 87(%sp)
	flw	%f2, 88(%sp)
	fblt	%f1, %f2, fbgt_else.93274
	fblt	%f1, %f0, fbgt_else.93276
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93278
	fblt	%f1, %f0, fbgt_else.93280
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
	j	fbgt_cont.93275
fbgt_else.93280:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
fbgt_cont.93281:
	j	fbgt_cont.93275
fbgt_else.93278:
	fmov	%f0, %f1
fbgt_cont.93279:
	j	fbgt_cont.93275
fbgt_else.93276:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93282
	fblt	%f1, %f0, fbgt_else.93284
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
	j	fbgt_cont.93283
fbgt_else.93284:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
fbgt_cont.93285:
	j	fbgt_cont.93283
fbgt_else.93282:
	fmov	%f0, %f1
fbgt_cont.93283:
fbgt_cont.93277:
	j	fbgt_cont.93275
fbgt_else.93274:
	fmov	%f0, %f1
fbgt_cont.93275:
	flw	%f1, 86(%sp)
	fblt	%f0, %f1, fbgt_else.93286
	lw	%v0, 85(%sp)
	beqi	%v0, 0, bnei_else.93288
	addi	%v0, %zero, 0
	j	fbgt_cont.93287
bnei_else.93288:
	addi	%v0, %zero, 1
bnei_cont.93289:
	j	fbgt_cont.93287
fbgt_else.93286:
	lw	%v0, 85(%sp)
fbgt_cont.93287:
	fblt	%f0, %f1, fbgt_else.93290
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93291
fbgt_else.93290:
fbgt_cont.93291:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93292
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93293
fbgt_else.93292:
fbgt_cont.93293:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93294
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93295
fbgt_else.93294:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93295:
	beqi	%v0, 0, bnei_else.93296
	j	bnei_cont.93297
bnei_else.93296:
	fneg	%f0, %f0
bnei_cont.93297:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93189:
	j	bnei_cont.93187
bnei_else.93186:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93298
	addi	%v1, %zero, 0
	j	fbgt_cont.93299
fbgt_else.93298:
	addi	%v1, %zero, 1
fbgt_cont.93299:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93300
	addi	%a0, %zero, 0
	j	fbgt_cont.93301
fbgt_else.93300:
	addi	%a0, %zero, 1
fbgt_cont.93301:
	beqi	%v1, 0, bnei_else.93302
	beqi	%a0, 0, bnei_else.93304
	flw	%f0, 450(%zero)
	j	bnei_cont.93303
bnei_else.93304:
	flw	%f0, 68(%sp)
bnei_cont.93305:
	j	bnei_cont.93303
bnei_else.93302:
	beqi	%a0, 0, bnei_else.93306
	flw	%f0, 68(%sp)
	j	bnei_cont.93307
bnei_else.93306:
	flw	%f0, 450(%zero)
bnei_cont.93307:
bnei_cont.93303:
	fsw	%f0, 146(%zero)
bnei_cont.93187:
	lw	%v0, 0(%sp)
	lw	%v1, 79(%sp)
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
	beqi	%v0, 0, bnei_else.93308
	j	bnei_cont.93165
bnei_else.93308:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 68(%sp)
	fblt	%f1, %f0, fbgt_else.93310
	addi	%v0, %zero, 0
	j	fbgt_cont.93311
fbgt_else.93310:
	addi	%v0, %zero, 1
fbgt_cont.93311:
	beqi	%v0, 0, bnei_else.93312
	j	bnei_cont.93313
bnei_else.93312:
	fmov	%f0, %f1
bnei_cont.93313:
	flw	%f1, 78(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 81(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93309:
	j	bnei_cont.93165
bnei_else.93164:
bnei_cont.93165:
bnei_cont.93001:
	addi	%a1, %zero, 116
	lw	%v0, 65(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 15(%sp)
	sw	%ra, 89(%sp)
	addi	%sp, %sp, 90
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -90
	lw	%ra, 89(%sp)
	j	bnei_cont.92997
bnei_else.92996:
bnei_cont.92997:
	lw	%v0, 16(%sp)
	beqi	%v0, 3, bnei_else.93314
	lw	%v1, 182(%zero)
	lw	%a0, 15(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 89(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	lw	%v0, 89(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 14(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.93316
	addi	%v1, %zero, 0
	j	fbgt_cont.93317
fbgt_else.93316:
	addi	%v1, %zero, 1
fbgt_cont.93317:
	beqi	%v1, 0, bnei_else.93318
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 90(%sp)
	sw	%v1, 91(%sp)
	fsw	%f1, 92(%sp)
	sw	%a0, 93(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 94(%sp)
	addi	%sp, %sp, 95
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -95
	lw	%ra, 94(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93320
	addi	%v0, %zero, 0
	j	fbgt_cont.93321
fbgt_else.93320:
	addi	%v0, %zero, 1
fbgt_cont.93321:
	beqi	%v0, 0, bnei_else.93322
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93324
	addi	%v0, %zero, 0
	j	bnei_cont.93323
fbgt_else.93324:
	addi	%v0, %zero, 1
fbgt_cont.93325:
	j	bnei_cont.93323
bnei_else.93322:
	addi	%v0, %zero, 0
bnei_cont.93323:
	beqi	%v0, 0, bnei_else.93326
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 93(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93328
	beqi	%a0, 2, bnei_else.93330
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93332
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93333
bnei_else.93332:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93333:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 92(%sp)
	fbne	%f1, %f4, fbeq_else.93334
	addi	%a0, %zero, 1
	j	fbeq_cont.93335
fbeq_else.93334:
	addi	%a0, %zero, 0
fbeq_cont.93335:
	beqi	%a0, 0, bnei_else.93336
	flw	%f1, 491(%zero)
	j	bnei_cont.93337
bnei_else.93336:
	beqi	%v1, 0, bnei_else.93338
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93339
bnei_else.93338:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93339:
bnei_cont.93337:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93329
bnei_else.93330:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93331:
	j	bnei_cont.93329
bnei_else.93328:
	lw	%a0, 136(%zero)
	flw	%f0, 92(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93340
	addi	%v1, %zero, 1
	j	fbeq_cont.93341
fbeq_else.93340:
	addi	%v1, %zero, 0
fbeq_cont.93341:
	beqi	%v1, 0, bnei_else.93342
	fmov	%f1, %f0
	j	bnei_cont.93343
bnei_else.93342:
	fblt	%f0, %f1, fbgt_else.93344
	addi	%v1, %zero, 0
	j	fbgt_cont.93345
fbgt_else.93344:
	addi	%v1, %zero, 1
fbgt_cont.93345:
	beqi	%v1, 0, bnei_else.93346
	flw	%f1, 491(%zero)
	j	bnei_cont.93347
bnei_else.93346:
	flw	%f1, 490(%zero)
bnei_cont.93347:
bnei_cont.93343:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93329:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 94(%sp)
	beqi	%v1, 1, bnei_else.93348
	beqi	%v1, 2, bnei_else.93350
	beqi	%v1, 3, bnei_else.93352
	beqi	%v1, 4, bnei_else.93354
	j	bnei_cont.93349
bnei_else.93354:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93356
	addi	%v1, %zero, 0
	j	fbgt_cont.93357
fbgt_else.93356:
	addi	%v1, %zero, 1
fbgt_cont.93357:
	beqi	%v1, 0, bnei_else.93358
	flw	%f0, 462(%zero)
	j	bnei_cont.93359
bnei_else.93358:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 92(%sp)
	fblt	%f0, %f1, fbgt_else.93360
	addi	%v1, %zero, 1
	j	fbgt_cont.93361
fbgt_else.93360:
	addi	%v1, %zero, 0
fbgt_cont.93361:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93362
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93364
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93365
fbgt_else.93364:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93365:
	beqi	%v1, 0, bnei_else.93366
	j	fbgt_cont.93363
bnei_else.93366:
	fneg	%f0, %f0
bnei_cont.93367:
	j	fbgt_cont.93363
fbgt_else.93362:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93363:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93359:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93368
	addi	%v1, %zero, 0
	j	fbgt_cont.93369
fbgt_else.93368:
	addi	%v1, %zero, 1
fbgt_cont.93369:
	beqi	%v1, 0, bnei_else.93370
	flw	%f1, 462(%zero)
	j	bnei_cont.93371
bnei_else.93370:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 92(%sp)
	fblt	%f1, %f2, fbgt_else.93372
	addi	%v1, %zero, 1
	j	fbgt_cont.93373
fbgt_else.93372:
	addi	%v1, %zero, 0
fbgt_cont.93373:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93374
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93376
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93377
fbgt_else.93376:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93377:
	beqi	%v1, 0, bnei_else.93378
	j	fbgt_cont.93375
bnei_else.93378:
	fneg	%f1, %f1
bnei_cont.93379:
	j	fbgt_cont.93375
fbgt_else.93374:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93375:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93371:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 92(%sp)
	fblt	%f0, %f1, fbgt_else.93380
	addi	%v1, %zero, 0
	j	fbgt_cont.93381
fbgt_else.93380:
	addi	%v1, %zero, 1
fbgt_cont.93381:
	beqi	%v1, 0, bnei_else.93382
	fmov	%f0, %f1
	j	bnei_cont.93383
bnei_else.93382:
bnei_cont.93383:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93355:
	j	bnei_cont.93349
bnei_else.93352:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 95(%sp)
	fsw	%f0, 96(%sp)
	fsw	%f2, 97(%sp)
	fblt	%f0, %f2, fbgt_else.93384
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93386
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93388
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93390
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93392
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93394
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	fbgt_cont.93385
fbgt_else.93394:
	fmov	%f0, %f3
fbgt_cont.93395:
	j	fbgt_cont.93385
fbgt_else.93392:
	fmov	%f0, %f3
fbgt_cont.93393:
	j	fbgt_cont.93385
fbgt_else.93390:
	fmov	%f0, %f3
fbgt_cont.93391:
	j	fbgt_cont.93385
fbgt_else.93388:
	fmov	%f0, %f3
fbgt_cont.93389:
	j	fbgt_cont.93385
fbgt_else.93386:
	fmov	%f0, %f3
fbgt_cont.93387:
	j	fbgt_cont.93385
fbgt_else.93384:
	fmov	%f0, %f2
fbgt_cont.93385:
	flw	%f1, 96(%sp)
	flw	%f2, 97(%sp)
	fblt	%f1, %f2, fbgt_else.93396
	fblt	%f1, %f0, fbgt_else.93398
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93400
	fblt	%f1, %f0, fbgt_else.93402
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	fbgt_cont.93397
fbgt_else.93402:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
fbgt_cont.93403:
	j	fbgt_cont.93397
fbgt_else.93400:
	fmov	%f0, %f1
fbgt_cont.93401:
	j	fbgt_cont.93397
fbgt_else.93398:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93404
	fblt	%f1, %f0, fbgt_else.93406
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	fbgt_cont.93405
fbgt_else.93406:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
fbgt_cont.93407:
	j	fbgt_cont.93405
fbgt_else.93404:
	fmov	%f0, %f1
fbgt_cont.93405:
fbgt_cont.93399:
	j	fbgt_cont.93397
fbgt_else.93396:
	fmov	%f0, %f1
fbgt_cont.93397:
	flw	%f1, 95(%sp)
	fblt	%f0, %f1, fbgt_else.93408
	addi	%v0, %zero, 0
	j	fbgt_cont.93409
fbgt_else.93408:
	addi	%v0, %zero, 1
fbgt_cont.93409:
	fblt	%f0, %f1, fbgt_else.93410
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93411
fbgt_else.93410:
fbgt_cont.93411:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93412
	beqi	%v0, 0, bnei_else.93414
	addi	%v0, %zero, 0
	j	fbgt_cont.93413
bnei_else.93414:
	addi	%v0, %zero, 1
bnei_cont.93415:
	j	fbgt_cont.93413
fbgt_else.93412:
fbgt_cont.93413:
	fblt	%f0, %f2, fbgt_else.93416
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93417
fbgt_else.93416:
fbgt_cont.93417:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93418
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93419
fbgt_else.93418:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93419:
	beqi	%v0, 0, bnei_else.93420
	j	bnei_cont.93421
bnei_else.93420:
	fneg	%f0, %f0
bnei_cont.93421:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93353:
	j	bnei_cont.93349
bnei_else.93350:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 92(%sp)
	fblt	%f0, %f2, fbgt_else.93422
	addi	%v1, %zero, 1
	j	fbgt_cont.93423
fbgt_else.93422:
	addi	%v1, %zero, 0
fbgt_cont.93423:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 98(%sp)
	fsw	%f1, 99(%sp)
	fsw	%f0, 100(%sp)
	fsw	%f3, 101(%sp)
	fblt	%f0, %f3, fbgt_else.93424
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93426
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93428
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93430
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93432
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93434
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	fbgt_cont.93425
fbgt_else.93434:
	fmov	%f0, %f4
fbgt_cont.93435:
	j	fbgt_cont.93425
fbgt_else.93432:
	fmov	%f0, %f4
fbgt_cont.93433:
	j	fbgt_cont.93425
fbgt_else.93430:
	fmov	%f0, %f4
fbgt_cont.93431:
	j	fbgt_cont.93425
fbgt_else.93428:
	fmov	%f0, %f4
fbgt_cont.93429:
	j	fbgt_cont.93425
fbgt_else.93426:
	fmov	%f0, %f4
fbgt_cont.93427:
	j	fbgt_cont.93425
fbgt_else.93424:
	fmov	%f0, %f3
fbgt_cont.93425:
	flw	%f1, 100(%sp)
	flw	%f2, 101(%sp)
	fblt	%f1, %f2, fbgt_else.93436
	fblt	%f1, %f0, fbgt_else.93438
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93440
	fblt	%f1, %f0, fbgt_else.93442
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	fbgt_cont.93437
fbgt_else.93442:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
fbgt_cont.93443:
	j	fbgt_cont.93437
fbgt_else.93440:
	fmov	%f0, %f1
fbgt_cont.93441:
	j	fbgt_cont.93437
fbgt_else.93438:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93444
	fblt	%f1, %f0, fbgt_else.93446
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	fbgt_cont.93445
fbgt_else.93446:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
fbgt_cont.93447:
	j	fbgt_cont.93445
fbgt_else.93444:
	fmov	%f0, %f1
fbgt_cont.93445:
fbgt_cont.93439:
	j	fbgt_cont.93437
fbgt_else.93436:
	fmov	%f0, %f1
fbgt_cont.93437:
	flw	%f1, 99(%sp)
	fblt	%f0, %f1, fbgt_else.93448
	lw	%v0, 98(%sp)
	beqi	%v0, 0, bnei_else.93450
	addi	%v0, %zero, 0
	j	fbgt_cont.93449
bnei_else.93450:
	addi	%v0, %zero, 1
bnei_cont.93451:
	j	fbgt_cont.93449
fbgt_else.93448:
	lw	%v0, 98(%sp)
fbgt_cont.93449:
	fblt	%f0, %f1, fbgt_else.93452
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93453
fbgt_else.93452:
fbgt_cont.93453:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93454
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93455
fbgt_else.93454:
fbgt_cont.93455:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93456
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93457
fbgt_else.93456:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93457:
	beqi	%v0, 0, bnei_else.93458
	j	bnei_cont.93459
bnei_else.93458:
	fneg	%f0, %f0
bnei_cont.93459:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93351:
	j	bnei_cont.93349
bnei_else.93348:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93460
	addi	%v1, %zero, 0
	j	fbgt_cont.93461
fbgt_else.93460:
	addi	%v1, %zero, 1
fbgt_cont.93461:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93462
	addi	%a0, %zero, 0
	j	fbgt_cont.93463
fbgt_else.93462:
	addi	%a0, %zero, 1
fbgt_cont.93463:
	beqi	%v1, 0, bnei_else.93464
	beqi	%a0, 0, bnei_else.93466
	flw	%f0, 450(%zero)
	j	bnei_cont.93465
bnei_else.93466:
	flw	%f0, 92(%sp)
bnei_cont.93467:
	j	bnei_cont.93465
bnei_else.93464:
	beqi	%a0, 0, bnei_else.93468
	flw	%f0, 92(%sp)
	j	bnei_cont.93469
bnei_else.93468:
	flw	%f0, 450(%zero)
bnei_cont.93469:
bnei_cont.93465:
	fsw	%f0, 146(%zero)
bnei_cont.93349:
	lw	%v0, 0(%sp)
	lw	%v1, 91(%sp)
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	beqi	%v0, 0, bnei_else.93470
	j	bnei_cont.93319
bnei_else.93470:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 92(%sp)
	fblt	%f1, %f0, fbgt_else.93472
	addi	%v0, %zero, 0
	j	fbgt_cont.93473
fbgt_else.93472:
	addi	%v0, %zero, 1
fbgt_cont.93473:
	beqi	%v0, 0, bnei_else.93474
	j	bnei_cont.93475
bnei_else.93474:
	fmov	%f0, %f1
bnei_cont.93475:
	flw	%f1, 90(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 94(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93471:
	j	bnei_cont.93319
bnei_else.93326:
bnei_cont.93327:
	j	bnei_cont.93319
bnei_else.93318:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 102(%sp)
	sw	%v1, 103(%sp)
	fsw	%f1, 92(%sp)
	sw	%a0, 104(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93476
	addi	%v0, %zero, 0
	j	fbgt_cont.93477
fbgt_else.93476:
	addi	%v0, %zero, 1
fbgt_cont.93477:
	beqi	%v0, 0, bnei_else.93478
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93480
	addi	%v0, %zero, 0
	j	bnei_cont.93479
fbgt_else.93480:
	addi	%v0, %zero, 1
fbgt_cont.93481:
	j	bnei_cont.93479
bnei_else.93478:
	addi	%v0, %zero, 0
bnei_cont.93479:
	beqi	%v0, 0, bnei_else.93482
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 104(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93484
	beqi	%a0, 2, bnei_else.93486
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93488
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93489
bnei_else.93488:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93489:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 92(%sp)
	fbne	%f1, %f4, fbeq_else.93490
	addi	%a0, %zero, 1
	j	fbeq_cont.93491
fbeq_else.93490:
	addi	%a0, %zero, 0
fbeq_cont.93491:
	beqi	%a0, 0, bnei_else.93492
	flw	%f1, 491(%zero)
	j	bnei_cont.93493
bnei_else.93492:
	beqi	%v1, 0, bnei_else.93494
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93495
bnei_else.93494:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93495:
bnei_cont.93493:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93485
bnei_else.93486:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93487:
	j	bnei_cont.93485
bnei_else.93484:
	lw	%a0, 136(%zero)
	flw	%f0, 92(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93496
	addi	%v1, %zero, 1
	j	fbeq_cont.93497
fbeq_else.93496:
	addi	%v1, %zero, 0
fbeq_cont.93497:
	beqi	%v1, 0, bnei_else.93498
	fmov	%f1, %f0
	j	bnei_cont.93499
bnei_else.93498:
	fblt	%f0, %f1, fbgt_else.93500
	addi	%v1, %zero, 0
	j	fbgt_cont.93501
fbgt_else.93500:
	addi	%v1, %zero, 1
fbgt_cont.93501:
	beqi	%v1, 0, bnei_else.93502
	flw	%f1, 491(%zero)
	j	bnei_cont.93503
bnei_else.93502:
	flw	%f1, 490(%zero)
bnei_cont.93503:
bnei_cont.93499:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93485:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 105(%sp)
	beqi	%v1, 1, bnei_else.93504
	beqi	%v1, 2, bnei_else.93506
	beqi	%v1, 3, bnei_else.93508
	beqi	%v1, 4, bnei_else.93510
	j	bnei_cont.93505
bnei_else.93510:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93512
	addi	%v1, %zero, 0
	j	fbgt_cont.93513
fbgt_else.93512:
	addi	%v1, %zero, 1
fbgt_cont.93513:
	beqi	%v1, 0, bnei_else.93514
	flw	%f0, 462(%zero)
	j	bnei_cont.93515
bnei_else.93514:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 92(%sp)
	fblt	%f0, %f1, fbgt_else.93516
	addi	%v1, %zero, 1
	j	fbgt_cont.93517
fbgt_else.93516:
	addi	%v1, %zero, 0
fbgt_cont.93517:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93518
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93520
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93521
fbgt_else.93520:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93521:
	beqi	%v1, 0, bnei_else.93522
	j	fbgt_cont.93519
bnei_else.93522:
	fneg	%f0, %f0
bnei_cont.93523:
	j	fbgt_cont.93519
fbgt_else.93518:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93519:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93515:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93524
	addi	%v1, %zero, 0
	j	fbgt_cont.93525
fbgt_else.93524:
	addi	%v1, %zero, 1
fbgt_cont.93525:
	beqi	%v1, 0, bnei_else.93526
	flw	%f1, 462(%zero)
	j	bnei_cont.93527
bnei_else.93526:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 92(%sp)
	fblt	%f1, %f2, fbgt_else.93528
	addi	%v1, %zero, 1
	j	fbgt_cont.93529
fbgt_else.93528:
	addi	%v1, %zero, 0
fbgt_cont.93529:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93530
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93532
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93533
fbgt_else.93532:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93533:
	beqi	%v1, 0, bnei_else.93534
	j	fbgt_cont.93531
bnei_else.93534:
	fneg	%f1, %f1
bnei_cont.93535:
	j	fbgt_cont.93531
fbgt_else.93530:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93531:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93527:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 92(%sp)
	fblt	%f0, %f1, fbgt_else.93536
	addi	%v1, %zero, 0
	j	fbgt_cont.93537
fbgt_else.93536:
	addi	%v1, %zero, 1
fbgt_cont.93537:
	beqi	%v1, 0, bnei_else.93538
	fmov	%f0, %f1
	j	bnei_cont.93539
bnei_else.93538:
bnei_cont.93539:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93511:
	j	bnei_cont.93505
bnei_else.93508:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 106(%sp)
	fsw	%f0, 107(%sp)
	fsw	%f2, 108(%sp)
	fblt	%f0, %f2, fbgt_else.93540
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93542
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93544
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93546
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93548
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93550
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	fbgt_cont.93541
fbgt_else.93550:
	fmov	%f0, %f3
fbgt_cont.93551:
	j	fbgt_cont.93541
fbgt_else.93548:
	fmov	%f0, %f3
fbgt_cont.93549:
	j	fbgt_cont.93541
fbgt_else.93546:
	fmov	%f0, %f3
fbgt_cont.93547:
	j	fbgt_cont.93541
fbgt_else.93544:
	fmov	%f0, %f3
fbgt_cont.93545:
	j	fbgt_cont.93541
fbgt_else.93542:
	fmov	%f0, %f3
fbgt_cont.93543:
	j	fbgt_cont.93541
fbgt_else.93540:
	fmov	%f0, %f2
fbgt_cont.93541:
	flw	%f1, 107(%sp)
	flw	%f2, 108(%sp)
	fblt	%f1, %f2, fbgt_else.93552
	fblt	%f1, %f0, fbgt_else.93554
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93556
	fblt	%f1, %f0, fbgt_else.93558
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	fbgt_cont.93553
fbgt_else.93558:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
fbgt_cont.93559:
	j	fbgt_cont.93553
fbgt_else.93556:
	fmov	%f0, %f1
fbgt_cont.93557:
	j	fbgt_cont.93553
fbgt_else.93554:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93560
	fblt	%f1, %f0, fbgt_else.93562
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	fbgt_cont.93561
fbgt_else.93562:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
fbgt_cont.93563:
	j	fbgt_cont.93561
fbgt_else.93560:
	fmov	%f0, %f1
fbgt_cont.93561:
fbgt_cont.93555:
	j	fbgt_cont.93553
fbgt_else.93552:
	fmov	%f0, %f1
fbgt_cont.93553:
	flw	%f1, 106(%sp)
	fblt	%f0, %f1, fbgt_else.93564
	addi	%v0, %zero, 0
	j	fbgt_cont.93565
fbgt_else.93564:
	addi	%v0, %zero, 1
fbgt_cont.93565:
	fblt	%f0, %f1, fbgt_else.93566
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93567
fbgt_else.93566:
fbgt_cont.93567:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93568
	beqi	%v0, 0, bnei_else.93570
	addi	%v0, %zero, 0
	j	fbgt_cont.93569
bnei_else.93570:
	addi	%v0, %zero, 1
bnei_cont.93571:
	j	fbgt_cont.93569
fbgt_else.93568:
fbgt_cont.93569:
	fblt	%f0, %f2, fbgt_else.93572
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93573
fbgt_else.93572:
fbgt_cont.93573:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93574
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93575
fbgt_else.93574:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93575:
	beqi	%v0, 0, bnei_else.93576
	j	bnei_cont.93577
bnei_else.93576:
	fneg	%f0, %f0
bnei_cont.93577:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93509:
	j	bnei_cont.93505
bnei_else.93506:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 92(%sp)
	fblt	%f0, %f2, fbgt_else.93578
	addi	%v1, %zero, 1
	j	fbgt_cont.93579
fbgt_else.93578:
	addi	%v1, %zero, 0
fbgt_cont.93579:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 109(%sp)
	fsw	%f1, 110(%sp)
	fsw	%f0, 111(%sp)
	fsw	%f3, 112(%sp)
	fblt	%f0, %f3, fbgt_else.93580
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93582
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93584
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93586
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93588
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93590
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	j	fbgt_cont.93581
fbgt_else.93590:
	fmov	%f0, %f4
fbgt_cont.93591:
	j	fbgt_cont.93581
fbgt_else.93588:
	fmov	%f0, %f4
fbgt_cont.93589:
	j	fbgt_cont.93581
fbgt_else.93586:
	fmov	%f0, %f4
fbgt_cont.93587:
	j	fbgt_cont.93581
fbgt_else.93584:
	fmov	%f0, %f4
fbgt_cont.93585:
	j	fbgt_cont.93581
fbgt_else.93582:
	fmov	%f0, %f4
fbgt_cont.93583:
	j	fbgt_cont.93581
fbgt_else.93580:
	fmov	%f0, %f3
fbgt_cont.93581:
	flw	%f1, 111(%sp)
	flw	%f2, 112(%sp)
	fblt	%f1, %f2, fbgt_else.93592
	fblt	%f1, %f0, fbgt_else.93594
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93596
	fblt	%f1, %f0, fbgt_else.93598
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	j	fbgt_cont.93593
fbgt_else.93598:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
fbgt_cont.93599:
	j	fbgt_cont.93593
fbgt_else.93596:
	fmov	%f0, %f1
fbgt_cont.93597:
	j	fbgt_cont.93593
fbgt_else.93594:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93600
	fblt	%f1, %f0, fbgt_else.93602
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	j	fbgt_cont.93601
fbgt_else.93602:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
fbgt_cont.93603:
	j	fbgt_cont.93601
fbgt_else.93600:
	fmov	%f0, %f1
fbgt_cont.93601:
fbgt_cont.93595:
	j	fbgt_cont.93593
fbgt_else.93592:
	fmov	%f0, %f1
fbgt_cont.93593:
	flw	%f1, 110(%sp)
	fblt	%f0, %f1, fbgt_else.93604
	lw	%v0, 109(%sp)
	beqi	%v0, 0, bnei_else.93606
	addi	%v0, %zero, 0
	j	fbgt_cont.93605
bnei_else.93606:
	addi	%v0, %zero, 1
bnei_cont.93607:
	j	fbgt_cont.93605
fbgt_else.93604:
	lw	%v0, 109(%sp)
fbgt_cont.93605:
	fblt	%f0, %f1, fbgt_else.93608
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93609
fbgt_else.93608:
fbgt_cont.93609:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93610
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93611
fbgt_else.93610:
fbgt_cont.93611:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93612
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93613
fbgt_else.93612:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93613:
	beqi	%v0, 0, bnei_else.93614
	j	bnei_cont.93615
bnei_else.93614:
	fneg	%f0, %f0
bnei_cont.93615:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93507:
	j	bnei_cont.93505
bnei_else.93504:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93616
	addi	%v1, %zero, 0
	j	fbgt_cont.93617
fbgt_else.93616:
	addi	%v1, %zero, 1
fbgt_cont.93617:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93618
	addi	%a0, %zero, 0
	j	fbgt_cont.93619
fbgt_else.93618:
	addi	%a0, %zero, 1
fbgt_cont.93619:
	beqi	%v1, 0, bnei_else.93620
	beqi	%a0, 0, bnei_else.93622
	flw	%f0, 450(%zero)
	j	bnei_cont.93621
bnei_else.93622:
	flw	%f0, 92(%sp)
bnei_cont.93623:
	j	bnei_cont.93621
bnei_else.93620:
	beqi	%a0, 0, bnei_else.93624
	flw	%f0, 92(%sp)
	j	bnei_cont.93625
bnei_else.93624:
	flw	%f0, 450(%zero)
bnei_cont.93625:
bnei_cont.93621:
	fsw	%f0, 146(%zero)
bnei_cont.93505:
	lw	%v0, 0(%sp)
	lw	%v1, 103(%sp)
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	beqi	%v0, 0, bnei_else.93626
	j	bnei_cont.93483
bnei_else.93626:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 92(%sp)
	fblt	%f1, %f0, fbgt_else.93628
	addi	%v0, %zero, 0
	j	fbgt_cont.93629
fbgt_else.93628:
	addi	%v0, %zero, 1
fbgt_cont.93629:
	beqi	%v0, 0, bnei_else.93630
	j	bnei_cont.93631
bnei_else.93630:
	fmov	%f0, %f1
bnei_cont.93631:
	flw	%f1, 102(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 105(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93627:
	j	bnei_cont.93483
bnei_else.93482:
bnei_cont.93483:
bnei_cont.93319:
	addi	%a1, %zero, 116
	lw	%v0, 89(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 15(%sp)
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	j	bnei_cont.93315
bnei_else.93314:
bnei_cont.93315:
	lw	%v0, 16(%sp)
	beqi	%v0, 4, bnei_else.93632
	lw	%v0, 183(%zero)
	lw	%v1, 15(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 113(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 114(%sp)
	addi	%sp, %sp, 115
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -115
	lw	%ra, 114(%sp)
	lw	%v0, 113(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 14(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.93634
	addi	%v1, %zero, 0
	j	fbgt_cont.93635
fbgt_else.93634:
	addi	%v1, %zero, 1
fbgt_cont.93635:
	beqi	%v1, 0, bnei_else.93636
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 114(%sp)
	sw	%v1, 115(%sp)
	fsw	%f1, 116(%sp)
	sw	%a0, 117(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 118(%sp)
	addi	%sp, %sp, 119
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -119
	lw	%ra, 118(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93638
	addi	%v0, %zero, 0
	j	fbgt_cont.93639
fbgt_else.93638:
	addi	%v0, %zero, 1
fbgt_cont.93639:
	beqi	%v0, 0, bnei_else.93640
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93642
	addi	%v0, %zero, 0
	j	bnei_cont.93641
fbgt_else.93642:
	addi	%v0, %zero, 1
fbgt_cont.93643:
	j	bnei_cont.93641
bnei_else.93640:
	addi	%v0, %zero, 0
bnei_cont.93641:
	beqi	%v0, 0, bnei_else.93644
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 117(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93646
	beqi	%a0, 2, bnei_else.93648
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93650
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93651
bnei_else.93650:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93651:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 116(%sp)
	fbne	%f1, %f4, fbeq_else.93652
	addi	%a0, %zero, 1
	j	fbeq_cont.93653
fbeq_else.93652:
	addi	%a0, %zero, 0
fbeq_cont.93653:
	beqi	%a0, 0, bnei_else.93654
	flw	%f1, 491(%zero)
	j	bnei_cont.93655
bnei_else.93654:
	beqi	%v1, 0, bnei_else.93656
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93657
bnei_else.93656:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93657:
bnei_cont.93655:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93647
bnei_else.93648:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93649:
	j	bnei_cont.93647
bnei_else.93646:
	lw	%a0, 136(%zero)
	flw	%f0, 116(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93658
	addi	%v1, %zero, 1
	j	fbeq_cont.93659
fbeq_else.93658:
	addi	%v1, %zero, 0
fbeq_cont.93659:
	beqi	%v1, 0, bnei_else.93660
	fmov	%f1, %f0
	j	bnei_cont.93661
bnei_else.93660:
	fblt	%f0, %f1, fbgt_else.93662
	addi	%v1, %zero, 0
	j	fbgt_cont.93663
fbgt_else.93662:
	addi	%v1, %zero, 1
fbgt_cont.93663:
	beqi	%v1, 0, bnei_else.93664
	flw	%f1, 491(%zero)
	j	bnei_cont.93665
bnei_else.93664:
	flw	%f1, 490(%zero)
bnei_cont.93665:
bnei_cont.93661:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93647:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 118(%sp)
	beqi	%v1, 1, bnei_else.93666
	beqi	%v1, 2, bnei_else.93668
	beqi	%v1, 3, bnei_else.93670
	beqi	%v1, 4, bnei_else.93672
	j	bnei_cont.93667
bnei_else.93672:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93674
	addi	%v1, %zero, 0
	j	fbgt_cont.93675
fbgt_else.93674:
	addi	%v1, %zero, 1
fbgt_cont.93675:
	beqi	%v1, 0, bnei_else.93676
	flw	%f0, 462(%zero)
	j	bnei_cont.93677
bnei_else.93676:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 116(%sp)
	fblt	%f0, %f1, fbgt_else.93678
	addi	%v1, %zero, 1
	j	fbgt_cont.93679
fbgt_else.93678:
	addi	%v1, %zero, 0
fbgt_cont.93679:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93680
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93682
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93683
fbgt_else.93682:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93683:
	beqi	%v1, 0, bnei_else.93684
	j	fbgt_cont.93681
bnei_else.93684:
	fneg	%f0, %f0
bnei_cont.93685:
	j	fbgt_cont.93681
fbgt_else.93680:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93681:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93677:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93686
	addi	%v1, %zero, 0
	j	fbgt_cont.93687
fbgt_else.93686:
	addi	%v1, %zero, 1
fbgt_cont.93687:
	beqi	%v1, 0, bnei_else.93688
	flw	%f1, 462(%zero)
	j	bnei_cont.93689
bnei_else.93688:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 116(%sp)
	fblt	%f1, %f2, fbgt_else.93690
	addi	%v1, %zero, 1
	j	fbgt_cont.93691
fbgt_else.93690:
	addi	%v1, %zero, 0
fbgt_cont.93691:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93692
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93694
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93695
fbgt_else.93694:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93695:
	beqi	%v1, 0, bnei_else.93696
	j	fbgt_cont.93693
bnei_else.93696:
	fneg	%f1, %f1
bnei_cont.93697:
	j	fbgt_cont.93693
fbgt_else.93692:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93693:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93689:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 116(%sp)
	fblt	%f0, %f1, fbgt_else.93698
	addi	%v1, %zero, 0
	j	fbgt_cont.93699
fbgt_else.93698:
	addi	%v1, %zero, 1
fbgt_cont.93699:
	beqi	%v1, 0, bnei_else.93700
	fmov	%f0, %f1
	j	bnei_cont.93701
bnei_else.93700:
bnei_cont.93701:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93673:
	j	bnei_cont.93667
bnei_else.93670:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 119(%sp)
	fsw	%f0, 120(%sp)
	fsw	%f2, 121(%sp)
	fblt	%f0, %f2, fbgt_else.93702
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93704
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93706
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93708
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93710
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93712
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 122(%sp)
	addi	%sp, %sp, 123
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -123
	lw	%ra, 122(%sp)
	j	fbgt_cont.93703
fbgt_else.93712:
	fmov	%f0, %f3
fbgt_cont.93713:
	j	fbgt_cont.93703
fbgt_else.93710:
	fmov	%f0, %f3
fbgt_cont.93711:
	j	fbgt_cont.93703
fbgt_else.93708:
	fmov	%f0, %f3
fbgt_cont.93709:
	j	fbgt_cont.93703
fbgt_else.93706:
	fmov	%f0, %f3
fbgt_cont.93707:
	j	fbgt_cont.93703
fbgt_else.93704:
	fmov	%f0, %f3
fbgt_cont.93705:
	j	fbgt_cont.93703
fbgt_else.93702:
	fmov	%f0, %f2
fbgt_cont.93703:
	flw	%f1, 120(%sp)
	flw	%f2, 121(%sp)
	fblt	%f1, %f2, fbgt_else.93714
	fblt	%f1, %f0, fbgt_else.93716
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93718
	fblt	%f1, %f0, fbgt_else.93720
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 122(%sp)
	addi	%sp, %sp, 123
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -123
	lw	%ra, 122(%sp)
	j	fbgt_cont.93715
fbgt_else.93720:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 122(%sp)
	addi	%sp, %sp, 123
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -123
	lw	%ra, 122(%sp)
fbgt_cont.93721:
	j	fbgt_cont.93715
fbgt_else.93718:
	fmov	%f0, %f1
fbgt_cont.93719:
	j	fbgt_cont.93715
fbgt_else.93716:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93722
	fblt	%f1, %f0, fbgt_else.93724
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 122(%sp)
	addi	%sp, %sp, 123
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -123
	lw	%ra, 122(%sp)
	j	fbgt_cont.93723
fbgt_else.93724:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 122(%sp)
	addi	%sp, %sp, 123
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -123
	lw	%ra, 122(%sp)
fbgt_cont.93725:
	j	fbgt_cont.93723
fbgt_else.93722:
	fmov	%f0, %f1
fbgt_cont.93723:
fbgt_cont.93717:
	j	fbgt_cont.93715
fbgt_else.93714:
	fmov	%f0, %f1
fbgt_cont.93715:
	flw	%f1, 119(%sp)
	fblt	%f0, %f1, fbgt_else.93726
	addi	%v0, %zero, 0
	j	fbgt_cont.93727
fbgt_else.93726:
	addi	%v0, %zero, 1
fbgt_cont.93727:
	fblt	%f0, %f1, fbgt_else.93728
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93729
fbgt_else.93728:
fbgt_cont.93729:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93730
	beqi	%v0, 0, bnei_else.93732
	addi	%v0, %zero, 0
	j	fbgt_cont.93731
bnei_else.93732:
	addi	%v0, %zero, 1
bnei_cont.93733:
	j	fbgt_cont.93731
fbgt_else.93730:
fbgt_cont.93731:
	fblt	%f0, %f2, fbgt_else.93734
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93735
fbgt_else.93734:
fbgt_cont.93735:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93736
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93737
fbgt_else.93736:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93737:
	beqi	%v0, 0, bnei_else.93738
	j	bnei_cont.93739
bnei_else.93738:
	fneg	%f0, %f0
bnei_cont.93739:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93671:
	j	bnei_cont.93667
bnei_else.93668:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 116(%sp)
	fblt	%f0, %f2, fbgt_else.93740
	addi	%v1, %zero, 1
	j	fbgt_cont.93741
fbgt_else.93740:
	addi	%v1, %zero, 0
fbgt_cont.93741:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 122(%sp)
	fsw	%f1, 123(%sp)
	fsw	%f0, 124(%sp)
	fsw	%f3, 125(%sp)
	fblt	%f0, %f3, fbgt_else.93742
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93744
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93746
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93748
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93750
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93752
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
	j	fbgt_cont.93743
fbgt_else.93752:
	fmov	%f0, %f4
fbgt_cont.93753:
	j	fbgt_cont.93743
fbgt_else.93750:
	fmov	%f0, %f4
fbgt_cont.93751:
	j	fbgt_cont.93743
fbgt_else.93748:
	fmov	%f0, %f4
fbgt_cont.93749:
	j	fbgt_cont.93743
fbgt_else.93746:
	fmov	%f0, %f4
fbgt_cont.93747:
	j	fbgt_cont.93743
fbgt_else.93744:
	fmov	%f0, %f4
fbgt_cont.93745:
	j	fbgt_cont.93743
fbgt_else.93742:
	fmov	%f0, %f3
fbgt_cont.93743:
	flw	%f1, 124(%sp)
	flw	%f2, 125(%sp)
	fblt	%f1, %f2, fbgt_else.93754
	fblt	%f1, %f0, fbgt_else.93756
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93758
	fblt	%f1, %f0, fbgt_else.93760
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
	j	fbgt_cont.93755
fbgt_else.93760:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
fbgt_cont.93761:
	j	fbgt_cont.93755
fbgt_else.93758:
	fmov	%f0, %f1
fbgt_cont.93759:
	j	fbgt_cont.93755
fbgt_else.93756:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93762
	fblt	%f1, %f0, fbgt_else.93764
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
	j	fbgt_cont.93763
fbgt_else.93764:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
fbgt_cont.93765:
	j	fbgt_cont.93763
fbgt_else.93762:
	fmov	%f0, %f1
fbgt_cont.93763:
fbgt_cont.93757:
	j	fbgt_cont.93755
fbgt_else.93754:
	fmov	%f0, %f1
fbgt_cont.93755:
	flw	%f1, 123(%sp)
	fblt	%f0, %f1, fbgt_else.93766
	lw	%v0, 122(%sp)
	beqi	%v0, 0, bnei_else.93768
	addi	%v0, %zero, 0
	j	fbgt_cont.93767
bnei_else.93768:
	addi	%v0, %zero, 1
bnei_cont.93769:
	j	fbgt_cont.93767
fbgt_else.93766:
	lw	%v0, 122(%sp)
fbgt_cont.93767:
	fblt	%f0, %f1, fbgt_else.93770
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93771
fbgt_else.93770:
fbgt_cont.93771:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93772
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93773
fbgt_else.93772:
fbgt_cont.93773:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93774
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93775
fbgt_else.93774:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93775:
	beqi	%v0, 0, bnei_else.93776
	j	bnei_cont.93777
bnei_else.93776:
	fneg	%f0, %f0
bnei_cont.93777:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93669:
	j	bnei_cont.93667
bnei_else.93666:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93778
	addi	%v1, %zero, 0
	j	fbgt_cont.93779
fbgt_else.93778:
	addi	%v1, %zero, 1
fbgt_cont.93779:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93780
	addi	%a0, %zero, 0
	j	fbgt_cont.93781
fbgt_else.93780:
	addi	%a0, %zero, 1
fbgt_cont.93781:
	beqi	%v1, 0, bnei_else.93782
	beqi	%a0, 0, bnei_else.93784
	flw	%f0, 450(%zero)
	j	bnei_cont.93783
bnei_else.93784:
	flw	%f0, 116(%sp)
bnei_cont.93785:
	j	bnei_cont.93783
bnei_else.93782:
	beqi	%a0, 0, bnei_else.93786
	flw	%f0, 116(%sp)
	j	bnei_cont.93787
bnei_else.93786:
	flw	%f0, 450(%zero)
bnei_cont.93787:
bnei_cont.93783:
	fsw	%f0, 146(%zero)
bnei_cont.93667:
	lw	%v0, 0(%sp)
	lw	%v1, 115(%sp)
	sw	%ra, 126(%sp)
	addi	%sp, %sp, 127
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -127
	lw	%ra, 126(%sp)
	beqi	%v0, 0, bnei_else.93788
	j	bnei_cont.93637
bnei_else.93788:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 116(%sp)
	fblt	%f1, %f0, fbgt_else.93790
	addi	%v0, %zero, 0
	j	fbgt_cont.93791
fbgt_else.93790:
	addi	%v0, %zero, 1
fbgt_cont.93791:
	beqi	%v0, 0, bnei_else.93792
	j	bnei_cont.93793
bnei_else.93792:
	fmov	%f0, %f1
bnei_cont.93793:
	flw	%f1, 114(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 118(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93789:
	j	bnei_cont.93637
bnei_else.93644:
bnei_cont.93645:
	j	bnei_cont.93637
bnei_else.93636:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 0(%sp)
	fsw	%f0, 126(%sp)
	sw	%v1, 127(%sp)
	fsw	%f1, 116(%sp)
	sw	%a0, 128(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 129(%sp)
	addi	%sp, %sp, 130
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -130
	lw	%ra, 129(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93794
	addi	%v0, %zero, 0
	j	fbgt_cont.93795
fbgt_else.93794:
	addi	%v0, %zero, 1
fbgt_cont.93795:
	beqi	%v0, 0, bnei_else.93796
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93798
	addi	%v0, %zero, 0
	j	bnei_cont.93797
fbgt_else.93798:
	addi	%v0, %zero, 1
fbgt_cont.93799:
	j	bnei_cont.93797
bnei_else.93796:
	addi	%v0, %zero, 0
bnei_cont.93797:
	beqi	%v0, 0, bnei_else.93800
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 128(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.93802
	beqi	%a0, 2, bnei_else.93804
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.93806
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.93807
bnei_else.93806:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.93807:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 116(%sp)
	fbne	%f1, %f4, fbeq_else.93808
	addi	%a0, %zero, 1
	j	fbeq_cont.93809
fbeq_else.93808:
	addi	%a0, %zero, 0
fbeq_cont.93809:
	beqi	%a0, 0, bnei_else.93810
	flw	%f1, 491(%zero)
	j	bnei_cont.93811
bnei_else.93810:
	beqi	%v1, 0, bnei_else.93812
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.93813
bnei_else.93812:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.93813:
bnei_cont.93811:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.93803
bnei_else.93804:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.93805:
	j	bnei_cont.93803
bnei_else.93802:
	lw	%a0, 136(%zero)
	flw	%f0, 116(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.93814
	addi	%v1, %zero, 1
	j	fbeq_cont.93815
fbeq_else.93814:
	addi	%v1, %zero, 0
fbeq_cont.93815:
	beqi	%v1, 0, bnei_else.93816
	fmov	%f1, %f0
	j	bnei_cont.93817
bnei_else.93816:
	fblt	%f0, %f1, fbgt_else.93818
	addi	%v1, %zero, 0
	j	fbgt_cont.93819
fbgt_else.93818:
	addi	%v1, %zero, 1
fbgt_cont.93819:
	beqi	%v1, 0, bnei_else.93820
	flw	%f1, 491(%zero)
	j	bnei_cont.93821
bnei_else.93820:
	flw	%f1, 490(%zero)
bnei_cont.93821:
bnei_cont.93817:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.93803:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 129(%sp)
	beqi	%v1, 1, bnei_else.93822
	beqi	%v1, 2, bnei_else.93824
	beqi	%v1, 3, bnei_else.93826
	beqi	%v1, 4, bnei_else.93828
	j	bnei_cont.93823
bnei_else.93828:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.93830
	addi	%v1, %zero, 0
	j	fbgt_cont.93831
fbgt_else.93830:
	addi	%v1, %zero, 1
fbgt_cont.93831:
	beqi	%v1, 0, bnei_else.93832
	flw	%f0, 462(%zero)
	j	bnei_cont.93833
bnei_else.93832:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 116(%sp)
	fblt	%f0, %f1, fbgt_else.93834
	addi	%v1, %zero, 1
	j	fbgt_cont.93835
fbgt_else.93834:
	addi	%v1, %zero, 0
fbgt_cont.93835:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.93836
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.93838
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.93839
fbgt_else.93838:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.93839:
	beqi	%v1, 0, bnei_else.93840
	j	fbgt_cont.93837
bnei_else.93840:
	fneg	%f0, %f0
bnei_cont.93841:
	j	fbgt_cont.93837
fbgt_else.93836:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.93837:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.93833:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.93842
	addi	%v1, %zero, 0
	j	fbgt_cont.93843
fbgt_else.93842:
	addi	%v1, %zero, 1
fbgt_cont.93843:
	beqi	%v1, 0, bnei_else.93844
	flw	%f1, 462(%zero)
	j	bnei_cont.93845
bnei_else.93844:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 116(%sp)
	fblt	%f1, %f2, fbgt_else.93846
	addi	%v1, %zero, 1
	j	fbgt_cont.93847
fbgt_else.93846:
	addi	%v1, %zero, 0
fbgt_cont.93847:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.93848
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.93850
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.93851
fbgt_else.93850:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.93851:
	beqi	%v1, 0, bnei_else.93852
	j	fbgt_cont.93849
bnei_else.93852:
	fneg	%f1, %f1
bnei_cont.93853:
	j	fbgt_cont.93849
fbgt_else.93848:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.93849:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.93845:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 116(%sp)
	fblt	%f0, %f1, fbgt_else.93854
	addi	%v1, %zero, 0
	j	fbgt_cont.93855
fbgt_else.93854:
	addi	%v1, %zero, 1
fbgt_cont.93855:
	beqi	%v1, 0, bnei_else.93856
	fmov	%f0, %f1
	j	bnei_cont.93857
bnei_else.93856:
bnei_cont.93857:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.93829:
	j	bnei_cont.93823
bnei_else.93826:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 130(%sp)
	fsw	%f0, 131(%sp)
	fsw	%f2, 132(%sp)
	fblt	%f0, %f2, fbgt_else.93858
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.93860
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.93862
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.93864
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.93866
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.93868
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 133(%sp)
	addi	%sp, %sp, 134
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -134
	lw	%ra, 133(%sp)
	j	fbgt_cont.93859
fbgt_else.93868:
	fmov	%f0, %f3
fbgt_cont.93869:
	j	fbgt_cont.93859
fbgt_else.93866:
	fmov	%f0, %f3
fbgt_cont.93867:
	j	fbgt_cont.93859
fbgt_else.93864:
	fmov	%f0, %f3
fbgt_cont.93865:
	j	fbgt_cont.93859
fbgt_else.93862:
	fmov	%f0, %f3
fbgt_cont.93863:
	j	fbgt_cont.93859
fbgt_else.93860:
	fmov	%f0, %f3
fbgt_cont.93861:
	j	fbgt_cont.93859
fbgt_else.93858:
	fmov	%f0, %f2
fbgt_cont.93859:
	flw	%f1, 131(%sp)
	flw	%f2, 132(%sp)
	fblt	%f1, %f2, fbgt_else.93870
	fblt	%f1, %f0, fbgt_else.93872
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93874
	fblt	%f1, %f0, fbgt_else.93876
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 133(%sp)
	addi	%sp, %sp, 134
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -134
	lw	%ra, 133(%sp)
	j	fbgt_cont.93871
fbgt_else.93876:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 133(%sp)
	addi	%sp, %sp, 134
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -134
	lw	%ra, 133(%sp)
fbgt_cont.93877:
	j	fbgt_cont.93871
fbgt_else.93874:
	fmov	%f0, %f1
fbgt_cont.93875:
	j	fbgt_cont.93871
fbgt_else.93872:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93878
	fblt	%f1, %f0, fbgt_else.93880
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 133(%sp)
	addi	%sp, %sp, 134
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -134
	lw	%ra, 133(%sp)
	j	fbgt_cont.93879
fbgt_else.93880:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 133(%sp)
	addi	%sp, %sp, 134
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -134
	lw	%ra, 133(%sp)
fbgt_cont.93881:
	j	fbgt_cont.93879
fbgt_else.93878:
	fmov	%f0, %f1
fbgt_cont.93879:
fbgt_cont.93873:
	j	fbgt_cont.93871
fbgt_else.93870:
	fmov	%f0, %f1
fbgt_cont.93871:
	flw	%f1, 130(%sp)
	fblt	%f0, %f1, fbgt_else.93882
	addi	%v0, %zero, 0
	j	fbgt_cont.93883
fbgt_else.93882:
	addi	%v0, %zero, 1
fbgt_cont.93883:
	fblt	%f0, %f1, fbgt_else.93884
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93885
fbgt_else.93884:
fbgt_cont.93885:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93886
	beqi	%v0, 0, bnei_else.93888
	addi	%v0, %zero, 0
	j	fbgt_cont.93887
bnei_else.93888:
	addi	%v0, %zero, 1
bnei_cont.93889:
	j	fbgt_cont.93887
fbgt_else.93886:
fbgt_cont.93887:
	fblt	%f0, %f2, fbgt_else.93890
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93891
fbgt_else.93890:
fbgt_cont.93891:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93892
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.93893
fbgt_else.93892:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.93893:
	beqi	%v0, 0, bnei_else.93894
	j	bnei_cont.93895
bnei_else.93894:
	fneg	%f0, %f0
bnei_cont.93895:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.93827:
	j	bnei_cont.93823
bnei_else.93824:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 116(%sp)
	fblt	%f0, %f2, fbgt_else.93896
	addi	%v1, %zero, 1
	j	fbgt_cont.93897
fbgt_else.93896:
	addi	%v1, %zero, 0
fbgt_cont.93897:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 133(%sp)
	fsw	%f1, 134(%sp)
	fsw	%f0, 135(%sp)
	fsw	%f3, 136(%sp)
	fblt	%f0, %f3, fbgt_else.93898
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.93900
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.93902
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.93904
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.93906
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.93908
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	j	fbgt_cont.93899
fbgt_else.93908:
	fmov	%f0, %f4
fbgt_cont.93909:
	j	fbgt_cont.93899
fbgt_else.93906:
	fmov	%f0, %f4
fbgt_cont.93907:
	j	fbgt_cont.93899
fbgt_else.93904:
	fmov	%f0, %f4
fbgt_cont.93905:
	j	fbgt_cont.93899
fbgt_else.93902:
	fmov	%f0, %f4
fbgt_cont.93903:
	j	fbgt_cont.93899
fbgt_else.93900:
	fmov	%f0, %f4
fbgt_cont.93901:
	j	fbgt_cont.93899
fbgt_else.93898:
	fmov	%f0, %f3
fbgt_cont.93899:
	flw	%f1, 135(%sp)
	flw	%f2, 136(%sp)
	fblt	%f1, %f2, fbgt_else.93910
	fblt	%f1, %f0, fbgt_else.93912
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93914
	fblt	%f1, %f0, fbgt_else.93916
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	j	fbgt_cont.93911
fbgt_else.93916:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
fbgt_cont.93917:
	j	fbgt_cont.93911
fbgt_else.93914:
	fmov	%f0, %f1
fbgt_cont.93915:
	j	fbgt_cont.93911
fbgt_else.93912:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.93918
	fblt	%f1, %f0, fbgt_else.93920
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	j	fbgt_cont.93919
fbgt_else.93920:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
fbgt_cont.93921:
	j	fbgt_cont.93919
fbgt_else.93918:
	fmov	%f0, %f1
fbgt_cont.93919:
fbgt_cont.93913:
	j	fbgt_cont.93911
fbgt_else.93910:
	fmov	%f0, %f1
fbgt_cont.93911:
	flw	%f1, 134(%sp)
	fblt	%f0, %f1, fbgt_else.93922
	lw	%v0, 133(%sp)
	beqi	%v0, 0, bnei_else.93924
	addi	%v0, %zero, 0
	j	fbgt_cont.93923
bnei_else.93924:
	addi	%v0, %zero, 1
bnei_cont.93925:
	j	fbgt_cont.93923
fbgt_else.93922:
	lw	%v0, 133(%sp)
fbgt_cont.93923:
	fblt	%f0, %f1, fbgt_else.93926
	fsub	%f0, %f0, %f1
	j	fbgt_cont.93927
fbgt_else.93926:
fbgt_cont.93927:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.93928
	fsub	%f0, %f1, %f0
	j	fbgt_cont.93929
fbgt_else.93928:
fbgt_cont.93929:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.93930
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.93931
fbgt_else.93930:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.93931:
	beqi	%v0, 0, bnei_else.93932
	j	bnei_cont.93933
bnei_else.93932:
	fneg	%f0, %f0
bnei_cont.93933:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.93825:
	j	bnei_cont.93823
bnei_else.93822:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.93934
	addi	%v1, %zero, 0
	j	fbgt_cont.93935
fbgt_else.93934:
	addi	%v1, %zero, 1
fbgt_cont.93935:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.93936
	addi	%a0, %zero, 0
	j	fbgt_cont.93937
fbgt_else.93936:
	addi	%a0, %zero, 1
fbgt_cont.93937:
	beqi	%v1, 0, bnei_else.93938
	beqi	%a0, 0, bnei_else.93940
	flw	%f0, 450(%zero)
	j	bnei_cont.93939
bnei_else.93940:
	flw	%f0, 116(%sp)
bnei_cont.93941:
	j	bnei_cont.93939
bnei_else.93938:
	beqi	%a0, 0, bnei_else.93942
	flw	%f0, 116(%sp)
	j	bnei_cont.93943
bnei_else.93942:
	flw	%f0, 450(%zero)
bnei_cont.93943:
bnei_cont.93939:
	fsw	%f0, 146(%zero)
bnei_cont.93823:
	lw	%v0, 0(%sp)
	lw	%v1, 127(%sp)
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	beqi	%v0, 0, bnei_else.93944
	j	bnei_cont.93801
bnei_else.93944:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 116(%sp)
	fblt	%f1, %f0, fbgt_else.93946
	addi	%v0, %zero, 0
	j	fbgt_cont.93947
fbgt_else.93946:
	addi	%v0, %zero, 1
fbgt_cont.93947:
	beqi	%v0, 0, bnei_else.93948
	j	bnei_cont.93949
bnei_else.93948:
	fmov	%f0, %f1
bnei_cont.93949:
	flw	%f1, 126(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 129(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.93945:
	j	bnei_cont.93801
bnei_else.93800:
bnei_cont.93801:
bnei_cont.93637:
	addi	%a1, %zero, 116
	lw	%v0, 113(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 15(%sp)
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	j	bnei_cont.93633
bnei_else.93632:
bnei_cont.93633:
	lw	%v0, 12(%sp)
	lw	%v1, 13(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.92359
bnei_else.92358:
bnei_cont.92359:
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	j	do_without_neighbors.3002
bgti_else.92357:
	jr	%ra
bgt_else.92356:
	jr	%ra
bgti_else.92343:
	jr	%ra
bgt_else.92342:
	jr	%ra
try_exploit_neighbors.3018:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.93954
	addi	%t1, %zero, 0
	lw	%t2, 2(%t0)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	blti	%t2, 0, bgti_else.93955
	lw	%t2, 2(%t0)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	add	%at, %a0, %v0
	lw	%t3, 0(%at)
	lw	%t4, 2(%t3)
	add	%at, %t4, %a3
	lw	%t4, 0(%at)
	bne	%t4, %t2, beq_else.93956
	add	%at, %a2, %v0
	lw	%t4, 0(%at)
	lw	%t4, 2(%t4)
	add	%at, %t4, %a3
	lw	%t4, 0(%at)
	bne	%t4, %t2, beq_else.93958
	addi	%t4, %v0, -1
	add	%at, %a1, %t4
	lw	%t4, 0(%at)
	lw	%t4, 2(%t4)
	add	%at, %t4, %a3
	lw	%t4, 0(%at)
	bne	%t4, %t2, beq_else.93960
	addi	%t4, %v0, 1
	add	%at, %a1, %t4
	lw	%t4, 0(%at)
	lw	%t4, 2(%t4)
	add	%at, %t4, %a3
	lw	%t4, 0(%at)
	bne	%t4, %t2, beq_else.93962
	addi	%t2, %zero, 1
	j	beq_cont.93957
beq_else.93962:
	addi	%t2, %zero, 0
beq_cont.93963:
	j	beq_cont.93957
beq_else.93960:
	addi	%t2, %zero, 0
beq_cont.93961:
	j	beq_cont.93957
beq_else.93958:
	addi	%t2, %zero, 0
beq_cont.93959:
	j	beq_cont.93957
beq_else.93956:
	addi	%t2, %zero, 0
beq_cont.93957:
	beqi	%t2, 0, bnei_else.93964
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.93965
	lw	%t1, 5(%t3)
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 5(%t2)
	lw	%t4, 5(%t0)
	addi	%t5, %v0, 1
	add	%at, %a1, %t5
	lw	%t5, 0(%at)
	lw	%t5, 5(%t5)
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 5(%t6)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 150(%zero)
	add	%at, %t2, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t4, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t5, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t6, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t1, 4(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.93966
bnei_else.93965:
bnei_cont.93966:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.93967
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.93968
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t2, 2(%t3)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.93969
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.93971
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.93973
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.93975
	addi	%t1, %zero, 1
	j	beq_cont.93970
beq_else.93975:
	addi	%t1, %zero, 0
beq_cont.93976:
	j	beq_cont.93970
beq_else.93973:
	addi	%t1, %zero, 0
beq_cont.93974:
	j	beq_cont.93970
beq_else.93971:
	addi	%t1, %zero, 0
beq_cont.93972:
	j	beq_cont.93970
beq_else.93969:
	addi	%t1, %zero, 0
beq_cont.93970:
	beqi	%t1, 0, bnei_else.93977
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.93978
	lw	%t1, 5(%t3)
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 5(%t2)
	lw	%t3, 5(%t0)
	addi	%t4, %v0, 1
	add	%at, %a1, %t4
	lw	%t4, 0(%at)
	lw	%t4, 5(%t4)
	add	%at, %a2, %v0
	lw	%t5, 0(%at)
	lw	%t5, 5(%t5)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 150(%zero)
	add	%at, %t2, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t3, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t4, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t5, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t0, 4(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t0)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t0)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t0)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.93979
bnei_else.93978:
bnei_cont.93979:
	addi	%a3, %a3, 1
	j	try_exploit_neighbors.3018
bnei_else.93977:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3002
bgti_else.93968:
	jr	%ra
bgt_else.93967:
	jr	%ra
bnei_else.93964:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.93982
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.93983
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 0(%sp)
	sw	%a3, 1(%sp)
	beqi	%v0, 0, bnei_else.93984
	lw	%v0, 5(%t0)
	lw	%v1, 7(%t0)
	lw	%a0, 1(%t0)
	lw	%a1, 4(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	flw	%f0, 0(%v0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 150(%zero)
	lw	%v0, 6(%t0)
	lw	%v0, 0(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	sw	%a1, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v0, 6(%sp)
	beqi	%v0, 0, bnei_else.93986
	lw	%a2, 179(%zero)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%t2, 0(%zero)
	addi	%t2, %t2, -1
	sw	%a2, 7(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 4(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.93988
	addi	%v1, %zero, 0
	j	fbgt_cont.93989
fbgt_else.93988:
	addi	%v1, %zero, 1
fbgt_cont.93989:
	beqi	%v1, 0, bnei_else.93990
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 8(%sp)
	sw	%v1, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%a0, 11(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.93992
	addi	%v0, %zero, 0
	j	fbgt_cont.93993
fbgt_else.93992:
	addi	%v0, %zero, 1
fbgt_cont.93993:
	beqi	%v0, 0, bnei_else.93994
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.93996
	addi	%v0, %zero, 0
	j	bnei_cont.93995
fbgt_else.93996:
	addi	%v0, %zero, 1
fbgt_cont.93997:
	j	bnei_cont.93995
bnei_else.93994:
	addi	%v0, %zero, 0
bnei_cont.93995:
	beqi	%v0, 0, bnei_else.93998
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94000
	beqi	%a0, 2, bnei_else.94002
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94004
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94005
bnei_else.94004:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94005:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 10(%sp)
	fbne	%f1, %f4, fbeq_else.94006
	addi	%a0, %zero, 1
	j	fbeq_cont.94007
fbeq_else.94006:
	addi	%a0, %zero, 0
fbeq_cont.94007:
	beqi	%a0, 0, bnei_else.94008
	flw	%f1, 491(%zero)
	j	bnei_cont.94009
bnei_else.94008:
	beqi	%v1, 0, bnei_else.94010
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94011
bnei_else.94010:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94011:
bnei_cont.94009:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94001
bnei_else.94002:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94003:
	j	bnei_cont.94001
bnei_else.94000:
	lw	%a0, 136(%zero)
	flw	%f0, 10(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94012
	addi	%v1, %zero, 1
	j	fbeq_cont.94013
fbeq_else.94012:
	addi	%v1, %zero, 0
fbeq_cont.94013:
	beqi	%v1, 0, bnei_else.94014
	fmov	%f1, %f0
	j	bnei_cont.94015
bnei_else.94014:
	fblt	%f0, %f1, fbgt_else.94016
	addi	%v1, %zero, 0
	j	fbgt_cont.94017
fbgt_else.94016:
	addi	%v1, %zero, 1
fbgt_cont.94017:
	beqi	%v1, 0, bnei_else.94018
	flw	%f1, 491(%zero)
	j	bnei_cont.94019
bnei_else.94018:
	flw	%f1, 490(%zero)
bnei_cont.94019:
bnei_cont.94015:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94001:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 12(%sp)
	beqi	%v1, 1, bnei_else.94020
	beqi	%v1, 2, bnei_else.94022
	beqi	%v1, 3, bnei_else.94024
	beqi	%v1, 4, bnei_else.94026
	j	bnei_cont.94021
bnei_else.94026:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94028
	addi	%v1, %zero, 0
	j	fbgt_cont.94029
fbgt_else.94028:
	addi	%v1, %zero, 1
fbgt_cont.94029:
	beqi	%v1, 0, bnei_else.94030
	flw	%f0, 462(%zero)
	j	bnei_cont.94031
bnei_else.94030:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 10(%sp)
	fblt	%f0, %f1, fbgt_else.94032
	addi	%v1, %zero, 1
	j	fbgt_cont.94033
fbgt_else.94032:
	addi	%v1, %zero, 0
fbgt_cont.94033:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94034
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94036
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94037
fbgt_else.94036:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94037:
	beqi	%v1, 0, bnei_else.94038
	j	fbgt_cont.94035
bnei_else.94038:
	fneg	%f0, %f0
bnei_cont.94039:
	j	fbgt_cont.94035
fbgt_else.94034:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94035:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94031:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94040
	addi	%v1, %zero, 0
	j	fbgt_cont.94041
fbgt_else.94040:
	addi	%v1, %zero, 1
fbgt_cont.94041:
	beqi	%v1, 0, bnei_else.94042
	flw	%f1, 462(%zero)
	j	bnei_cont.94043
bnei_else.94042:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 10(%sp)
	fblt	%f1, %f2, fbgt_else.94044
	addi	%v1, %zero, 1
	j	fbgt_cont.94045
fbgt_else.94044:
	addi	%v1, %zero, 0
fbgt_cont.94045:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94046
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94048
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94049
fbgt_else.94048:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94049:
	beqi	%v1, 0, bnei_else.94050
	j	fbgt_cont.94047
bnei_else.94050:
	fneg	%f1, %f1
bnei_cont.94051:
	j	fbgt_cont.94047
fbgt_else.94046:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94047:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94043:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 10(%sp)
	fblt	%f0, %f1, fbgt_else.94052
	addi	%v1, %zero, 0
	j	fbgt_cont.94053
fbgt_else.94052:
	addi	%v1, %zero, 1
fbgt_cont.94053:
	beqi	%v1, 0, bnei_else.94054
	fmov	%f0, %f1
	j	bnei_cont.94055
bnei_else.94054:
bnei_cont.94055:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94027:
	j	bnei_cont.94021
bnei_else.94024:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f2, 15(%sp)
	fblt	%f0, %f2, fbgt_else.94056
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94058
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94060
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94062
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94064
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94066
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.94057
fbgt_else.94066:
	fmov	%f0, %f3
fbgt_cont.94067:
	j	fbgt_cont.94057
fbgt_else.94064:
	fmov	%f0, %f3
fbgt_cont.94065:
	j	fbgt_cont.94057
fbgt_else.94062:
	fmov	%f0, %f3
fbgt_cont.94063:
	j	fbgt_cont.94057
fbgt_else.94060:
	fmov	%f0, %f3
fbgt_cont.94061:
	j	fbgt_cont.94057
fbgt_else.94058:
	fmov	%f0, %f3
fbgt_cont.94059:
	j	fbgt_cont.94057
fbgt_else.94056:
	fmov	%f0, %f2
fbgt_cont.94057:
	flw	%f1, 14(%sp)
	flw	%f2, 15(%sp)
	fblt	%f1, %f2, fbgt_else.94068
	fblt	%f1, %f0, fbgt_else.94070
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94072
	fblt	%f1, %f0, fbgt_else.94074
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.94069
fbgt_else.94074:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
fbgt_cont.94075:
	j	fbgt_cont.94069
fbgt_else.94072:
	fmov	%f0, %f1
fbgt_cont.94073:
	j	fbgt_cont.94069
fbgt_else.94070:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94076
	fblt	%f1, %f0, fbgt_else.94078
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.94077
fbgt_else.94078:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
fbgt_cont.94079:
	j	fbgt_cont.94077
fbgt_else.94076:
	fmov	%f0, %f1
fbgt_cont.94077:
fbgt_cont.94071:
	j	fbgt_cont.94069
fbgt_else.94068:
	fmov	%f0, %f1
fbgt_cont.94069:
	flw	%f1, 13(%sp)
	fblt	%f0, %f1, fbgt_else.94080
	addi	%v0, %zero, 0
	j	fbgt_cont.94081
fbgt_else.94080:
	addi	%v0, %zero, 1
fbgt_cont.94081:
	fblt	%f0, %f1, fbgt_else.94082
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94083
fbgt_else.94082:
fbgt_cont.94083:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94084
	beqi	%v0, 0, bnei_else.94086
	addi	%v0, %zero, 0
	j	fbgt_cont.94085
bnei_else.94086:
	addi	%v0, %zero, 1
bnei_cont.94087:
	j	fbgt_cont.94085
fbgt_else.94084:
fbgt_cont.94085:
	fblt	%f0, %f2, fbgt_else.94088
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94089
fbgt_else.94088:
fbgt_cont.94089:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94090
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94091
fbgt_else.94090:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94091:
	beqi	%v0, 0, bnei_else.94092
	j	bnei_cont.94093
bnei_else.94092:
	fneg	%f0, %f0
bnei_cont.94093:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94025:
	j	bnei_cont.94021
bnei_else.94022:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 10(%sp)
	fblt	%f0, %f2, fbgt_else.94094
	addi	%v1, %zero, 1
	j	fbgt_cont.94095
fbgt_else.94094:
	addi	%v1, %zero, 0
fbgt_cont.94095:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f3, 19(%sp)
	fblt	%f0, %f3, fbgt_else.94096
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94098
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94100
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94102
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94104
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94106
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.94097
fbgt_else.94106:
	fmov	%f0, %f4
fbgt_cont.94107:
	j	fbgt_cont.94097
fbgt_else.94104:
	fmov	%f0, %f4
fbgt_cont.94105:
	j	fbgt_cont.94097
fbgt_else.94102:
	fmov	%f0, %f4
fbgt_cont.94103:
	j	fbgt_cont.94097
fbgt_else.94100:
	fmov	%f0, %f4
fbgt_cont.94101:
	j	fbgt_cont.94097
fbgt_else.94098:
	fmov	%f0, %f4
fbgt_cont.94099:
	j	fbgt_cont.94097
fbgt_else.94096:
	fmov	%f0, %f3
fbgt_cont.94097:
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.94108
	fblt	%f1, %f0, fbgt_else.94110
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94112
	fblt	%f1, %f0, fbgt_else.94114
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.94109
fbgt_else.94114:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.94115:
	j	fbgt_cont.94109
fbgt_else.94112:
	fmov	%f0, %f1
fbgt_cont.94113:
	j	fbgt_cont.94109
fbgt_else.94110:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94116
	fblt	%f1, %f0, fbgt_else.94118
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.94117
fbgt_else.94118:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.94119:
	j	fbgt_cont.94117
fbgt_else.94116:
	fmov	%f0, %f1
fbgt_cont.94117:
fbgt_cont.94111:
	j	fbgt_cont.94109
fbgt_else.94108:
	fmov	%f0, %f1
fbgt_cont.94109:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.94120
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.94122
	addi	%v0, %zero, 0
	j	fbgt_cont.94121
bnei_else.94122:
	addi	%v0, %zero, 1
bnei_cont.94123:
	j	fbgt_cont.94121
fbgt_else.94120:
	lw	%v0, 16(%sp)
fbgt_cont.94121:
	fblt	%f0, %f1, fbgt_else.94124
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94125
fbgt_else.94124:
fbgt_cont.94125:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94126
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94127
fbgt_else.94126:
fbgt_cont.94127:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94128
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94129
fbgt_else.94128:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94129:
	beqi	%v0, 0, bnei_else.94130
	j	bnei_cont.94131
bnei_else.94130:
	fneg	%f0, %f0
bnei_cont.94131:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94023:
	j	bnei_cont.94021
bnei_else.94020:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94132
	addi	%v1, %zero, 0
	j	fbgt_cont.94133
fbgt_else.94132:
	addi	%v1, %zero, 1
fbgt_cont.94133:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94134
	addi	%a0, %zero, 0
	j	fbgt_cont.94135
fbgt_else.94134:
	addi	%a0, %zero, 1
fbgt_cont.94135:
	beqi	%v1, 0, bnei_else.94136
	beqi	%a0, 0, bnei_else.94138
	flw	%f0, 450(%zero)
	j	bnei_cont.94137
bnei_else.94138:
	flw	%f0, 10(%sp)
bnei_cont.94139:
	j	bnei_cont.94137
bnei_else.94136:
	beqi	%a0, 0, bnei_else.94140
	flw	%f0, 10(%sp)
	j	bnei_cont.94141
bnei_else.94140:
	flw	%f0, 450(%zero)
bnei_cont.94141:
bnei_cont.94137:
	fsw	%f0, 146(%zero)
bnei_cont.94021:
	lw	%v0, 3(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.94142
	j	bnei_cont.93991
bnei_else.94142:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 10(%sp)
	fblt	%f1, %f0, fbgt_else.94144
	addi	%v0, %zero, 0
	j	fbgt_cont.94145
fbgt_else.94144:
	addi	%v0, %zero, 1
fbgt_cont.94145:
	beqi	%v0, 0, bnei_else.94146
	j	bnei_cont.94147
bnei_else.94146:
	fmov	%f0, %f1
bnei_cont.94147:
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 12(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94143:
	j	bnei_cont.93991
bnei_else.93998:
bnei_cont.93999:
	j	bnei_cont.93991
bnei_else.93990:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 20(%sp)
	sw	%v1, 21(%sp)
	fsw	%f1, 10(%sp)
	sw	%a0, 22(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94148
	addi	%v0, %zero, 0
	j	fbgt_cont.94149
fbgt_else.94148:
	addi	%v0, %zero, 1
fbgt_cont.94149:
	beqi	%v0, 0, bnei_else.94150
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94152
	addi	%v0, %zero, 0
	j	bnei_cont.94151
fbgt_else.94152:
	addi	%v0, %zero, 1
fbgt_cont.94153:
	j	bnei_cont.94151
bnei_else.94150:
	addi	%v0, %zero, 0
bnei_cont.94151:
	beqi	%v0, 0, bnei_else.94154
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 22(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94156
	beqi	%a0, 2, bnei_else.94158
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94160
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94161
bnei_else.94160:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94161:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 10(%sp)
	fbne	%f1, %f4, fbeq_else.94162
	addi	%a0, %zero, 1
	j	fbeq_cont.94163
fbeq_else.94162:
	addi	%a0, %zero, 0
fbeq_cont.94163:
	beqi	%a0, 0, bnei_else.94164
	flw	%f1, 491(%zero)
	j	bnei_cont.94165
bnei_else.94164:
	beqi	%v1, 0, bnei_else.94166
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94167
bnei_else.94166:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94167:
bnei_cont.94165:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94157
bnei_else.94158:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94159:
	j	bnei_cont.94157
bnei_else.94156:
	lw	%a0, 136(%zero)
	flw	%f0, 10(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94168
	addi	%v1, %zero, 1
	j	fbeq_cont.94169
fbeq_else.94168:
	addi	%v1, %zero, 0
fbeq_cont.94169:
	beqi	%v1, 0, bnei_else.94170
	fmov	%f1, %f0
	j	bnei_cont.94171
bnei_else.94170:
	fblt	%f0, %f1, fbgt_else.94172
	addi	%v1, %zero, 0
	j	fbgt_cont.94173
fbgt_else.94172:
	addi	%v1, %zero, 1
fbgt_cont.94173:
	beqi	%v1, 0, bnei_else.94174
	flw	%f1, 491(%zero)
	j	bnei_cont.94175
bnei_else.94174:
	flw	%f1, 490(%zero)
bnei_cont.94175:
bnei_cont.94171:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94157:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 23(%sp)
	beqi	%v1, 1, bnei_else.94176
	beqi	%v1, 2, bnei_else.94178
	beqi	%v1, 3, bnei_else.94180
	beqi	%v1, 4, bnei_else.94182
	j	bnei_cont.94177
bnei_else.94182:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94184
	addi	%v1, %zero, 0
	j	fbgt_cont.94185
fbgt_else.94184:
	addi	%v1, %zero, 1
fbgt_cont.94185:
	beqi	%v1, 0, bnei_else.94186
	flw	%f0, 462(%zero)
	j	bnei_cont.94187
bnei_else.94186:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 10(%sp)
	fblt	%f0, %f1, fbgt_else.94188
	addi	%v1, %zero, 1
	j	fbgt_cont.94189
fbgt_else.94188:
	addi	%v1, %zero, 0
fbgt_cont.94189:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94190
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94192
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94193
fbgt_else.94192:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94193:
	beqi	%v1, 0, bnei_else.94194
	j	fbgt_cont.94191
bnei_else.94194:
	fneg	%f0, %f0
bnei_cont.94195:
	j	fbgt_cont.94191
fbgt_else.94190:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94191:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94187:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94196
	addi	%v1, %zero, 0
	j	fbgt_cont.94197
fbgt_else.94196:
	addi	%v1, %zero, 1
fbgt_cont.94197:
	beqi	%v1, 0, bnei_else.94198
	flw	%f1, 462(%zero)
	j	bnei_cont.94199
bnei_else.94198:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 10(%sp)
	fblt	%f1, %f2, fbgt_else.94200
	addi	%v1, %zero, 1
	j	fbgt_cont.94201
fbgt_else.94200:
	addi	%v1, %zero, 0
fbgt_cont.94201:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94202
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94204
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94205
fbgt_else.94204:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94205:
	beqi	%v1, 0, bnei_else.94206
	j	fbgt_cont.94203
bnei_else.94206:
	fneg	%f1, %f1
bnei_cont.94207:
	j	fbgt_cont.94203
fbgt_else.94202:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94203:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94199:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 10(%sp)
	fblt	%f0, %f1, fbgt_else.94208
	addi	%v1, %zero, 0
	j	fbgt_cont.94209
fbgt_else.94208:
	addi	%v1, %zero, 1
fbgt_cont.94209:
	beqi	%v1, 0, bnei_else.94210
	fmov	%f0, %f1
	j	bnei_cont.94211
bnei_else.94210:
bnei_cont.94211:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94183:
	j	bnei_cont.94177
bnei_else.94180:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 24(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f2, 26(%sp)
	fblt	%f0, %f2, fbgt_else.94212
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94214
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94216
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94218
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94220
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94222
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.94213
fbgt_else.94222:
	fmov	%f0, %f3
fbgt_cont.94223:
	j	fbgt_cont.94213
fbgt_else.94220:
	fmov	%f0, %f3
fbgt_cont.94221:
	j	fbgt_cont.94213
fbgt_else.94218:
	fmov	%f0, %f3
fbgt_cont.94219:
	j	fbgt_cont.94213
fbgt_else.94216:
	fmov	%f0, %f3
fbgt_cont.94217:
	j	fbgt_cont.94213
fbgt_else.94214:
	fmov	%f0, %f3
fbgt_cont.94215:
	j	fbgt_cont.94213
fbgt_else.94212:
	fmov	%f0, %f2
fbgt_cont.94213:
	flw	%f1, 25(%sp)
	flw	%f2, 26(%sp)
	fblt	%f1, %f2, fbgt_else.94224
	fblt	%f1, %f0, fbgt_else.94226
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94228
	fblt	%f1, %f0, fbgt_else.94230
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.94225
fbgt_else.94230:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.94231:
	j	fbgt_cont.94225
fbgt_else.94228:
	fmov	%f0, %f1
fbgt_cont.94229:
	j	fbgt_cont.94225
fbgt_else.94226:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94232
	fblt	%f1, %f0, fbgt_else.94234
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.94233
fbgt_else.94234:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.94235:
	j	fbgt_cont.94233
fbgt_else.94232:
	fmov	%f0, %f1
fbgt_cont.94233:
fbgt_cont.94227:
	j	fbgt_cont.94225
fbgt_else.94224:
	fmov	%f0, %f1
fbgt_cont.94225:
	flw	%f1, 24(%sp)
	fblt	%f0, %f1, fbgt_else.94236
	addi	%v0, %zero, 0
	j	fbgt_cont.94237
fbgt_else.94236:
	addi	%v0, %zero, 1
fbgt_cont.94237:
	fblt	%f0, %f1, fbgt_else.94238
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94239
fbgt_else.94238:
fbgt_cont.94239:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94240
	beqi	%v0, 0, bnei_else.94242
	addi	%v0, %zero, 0
	j	fbgt_cont.94241
bnei_else.94242:
	addi	%v0, %zero, 1
bnei_cont.94243:
	j	fbgt_cont.94241
fbgt_else.94240:
fbgt_cont.94241:
	fblt	%f0, %f2, fbgt_else.94244
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94245
fbgt_else.94244:
fbgt_cont.94245:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94246
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94247
fbgt_else.94246:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94247:
	beqi	%v0, 0, bnei_else.94248
	j	bnei_cont.94249
bnei_else.94248:
	fneg	%f0, %f0
bnei_cont.94249:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94181:
	j	bnei_cont.94177
bnei_else.94178:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 10(%sp)
	fblt	%f0, %f2, fbgt_else.94250
	addi	%v1, %zero, 1
	j	fbgt_cont.94251
fbgt_else.94250:
	addi	%v1, %zero, 0
fbgt_cont.94251:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 27(%sp)
	fsw	%f1, 28(%sp)
	fsw	%f0, 29(%sp)
	fsw	%f3, 30(%sp)
	fblt	%f0, %f3, fbgt_else.94252
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94254
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94256
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94258
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94260
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94262
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.94253
fbgt_else.94262:
	fmov	%f0, %f4
fbgt_cont.94263:
	j	fbgt_cont.94253
fbgt_else.94260:
	fmov	%f0, %f4
fbgt_cont.94261:
	j	fbgt_cont.94253
fbgt_else.94258:
	fmov	%f0, %f4
fbgt_cont.94259:
	j	fbgt_cont.94253
fbgt_else.94256:
	fmov	%f0, %f4
fbgt_cont.94257:
	j	fbgt_cont.94253
fbgt_else.94254:
	fmov	%f0, %f4
fbgt_cont.94255:
	j	fbgt_cont.94253
fbgt_else.94252:
	fmov	%f0, %f3
fbgt_cont.94253:
	flw	%f1, 29(%sp)
	flw	%f2, 30(%sp)
	fblt	%f1, %f2, fbgt_else.94264
	fblt	%f1, %f0, fbgt_else.94266
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94268
	fblt	%f1, %f0, fbgt_else.94270
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.94265
fbgt_else.94270:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.94271:
	j	fbgt_cont.94265
fbgt_else.94268:
	fmov	%f0, %f1
fbgt_cont.94269:
	j	fbgt_cont.94265
fbgt_else.94266:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94272
	fblt	%f1, %f0, fbgt_else.94274
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.94273
fbgt_else.94274:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.94275:
	j	fbgt_cont.94273
fbgt_else.94272:
	fmov	%f0, %f1
fbgt_cont.94273:
fbgt_cont.94267:
	j	fbgt_cont.94265
fbgt_else.94264:
	fmov	%f0, %f1
fbgt_cont.94265:
	flw	%f1, 28(%sp)
	fblt	%f0, %f1, fbgt_else.94276
	lw	%v0, 27(%sp)
	beqi	%v0, 0, bnei_else.94278
	addi	%v0, %zero, 0
	j	fbgt_cont.94277
bnei_else.94278:
	addi	%v0, %zero, 1
bnei_cont.94279:
	j	fbgt_cont.94277
fbgt_else.94276:
	lw	%v0, 27(%sp)
fbgt_cont.94277:
	fblt	%f0, %f1, fbgt_else.94280
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94281
fbgt_else.94280:
fbgt_cont.94281:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94282
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94283
fbgt_else.94282:
fbgt_cont.94283:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94284
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94285
fbgt_else.94284:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94285:
	beqi	%v0, 0, bnei_else.94286
	j	bnei_cont.94287
bnei_else.94286:
	fneg	%f0, %f0
bnei_cont.94287:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94179:
	j	bnei_cont.94177
bnei_else.94176:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94288
	addi	%v1, %zero, 0
	j	fbgt_cont.94289
fbgt_else.94288:
	addi	%v1, %zero, 1
fbgt_cont.94289:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94290
	addi	%a0, %zero, 0
	j	fbgt_cont.94291
fbgt_else.94290:
	addi	%a0, %zero, 1
fbgt_cont.94291:
	beqi	%v1, 0, bnei_else.94292
	beqi	%a0, 0, bnei_else.94294
	flw	%f0, 450(%zero)
	j	bnei_cont.94293
bnei_else.94294:
	flw	%f0, 10(%sp)
bnei_cont.94295:
	j	bnei_cont.94293
bnei_else.94292:
	beqi	%a0, 0, bnei_else.94296
	flw	%f0, 10(%sp)
	j	bnei_cont.94297
bnei_else.94296:
	flw	%f0, 450(%zero)
bnei_cont.94297:
bnei_cont.94293:
	fsw	%f0, 146(%zero)
bnei_cont.94177:
	lw	%v0, 3(%sp)
	lw	%v1, 21(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	beqi	%v0, 0, bnei_else.94298
	j	bnei_cont.94155
bnei_else.94298:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 10(%sp)
	fblt	%f1, %f0, fbgt_else.94300
	addi	%v0, %zero, 0
	j	fbgt_cont.94301
fbgt_else.94300:
	addi	%v0, %zero, 1
fbgt_cont.94301:
	beqi	%v0, 0, bnei_else.94302
	j	bnei_cont.94303
bnei_else.94302:
	fmov	%f0, %f1
bnei_cont.94303:
	flw	%f1, 20(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 23(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94299:
	j	bnei_cont.94155
bnei_else.94154:
bnei_cont.94155:
bnei_cont.93991:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bnei_cont.93987
bnei_else.93986:
bnei_cont.93987:
	lw	%v0, 6(%sp)
	beqi	%v0, 1, bnei_else.94304
	lw	%v1, 180(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 31(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 31(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 4(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.94306
	addi	%v1, %zero, 0
	j	fbgt_cont.94307
fbgt_else.94306:
	addi	%v1, %zero, 1
fbgt_cont.94307:
	beqi	%v1, 0, bnei_else.94308
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 32(%sp)
	sw	%v1, 33(%sp)
	fsw	%f1, 34(%sp)
	sw	%a0, 35(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94310
	addi	%v0, %zero, 0
	j	fbgt_cont.94311
fbgt_else.94310:
	addi	%v0, %zero, 1
fbgt_cont.94311:
	beqi	%v0, 0, bnei_else.94312
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94314
	addi	%v0, %zero, 0
	j	bnei_cont.94313
fbgt_else.94314:
	addi	%v0, %zero, 1
fbgt_cont.94315:
	j	bnei_cont.94313
bnei_else.94312:
	addi	%v0, %zero, 0
bnei_cont.94313:
	beqi	%v0, 0, bnei_else.94316
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 35(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94318
	beqi	%a0, 2, bnei_else.94320
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94322
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94323
bnei_else.94322:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94323:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 34(%sp)
	fbne	%f1, %f4, fbeq_else.94324
	addi	%a0, %zero, 1
	j	fbeq_cont.94325
fbeq_else.94324:
	addi	%a0, %zero, 0
fbeq_cont.94325:
	beqi	%a0, 0, bnei_else.94326
	flw	%f1, 491(%zero)
	j	bnei_cont.94327
bnei_else.94326:
	beqi	%v1, 0, bnei_else.94328
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94329
bnei_else.94328:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94329:
bnei_cont.94327:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94319
bnei_else.94320:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94321:
	j	bnei_cont.94319
bnei_else.94318:
	lw	%a0, 136(%zero)
	flw	%f0, 34(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94330
	addi	%v1, %zero, 1
	j	fbeq_cont.94331
fbeq_else.94330:
	addi	%v1, %zero, 0
fbeq_cont.94331:
	beqi	%v1, 0, bnei_else.94332
	fmov	%f1, %f0
	j	bnei_cont.94333
bnei_else.94332:
	fblt	%f0, %f1, fbgt_else.94334
	addi	%v1, %zero, 0
	j	fbgt_cont.94335
fbgt_else.94334:
	addi	%v1, %zero, 1
fbgt_cont.94335:
	beqi	%v1, 0, bnei_else.94336
	flw	%f1, 491(%zero)
	j	bnei_cont.94337
bnei_else.94336:
	flw	%f1, 490(%zero)
bnei_cont.94337:
bnei_cont.94333:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94319:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 36(%sp)
	beqi	%v1, 1, bnei_else.94338
	beqi	%v1, 2, bnei_else.94340
	beqi	%v1, 3, bnei_else.94342
	beqi	%v1, 4, bnei_else.94344
	j	bnei_cont.94339
bnei_else.94344:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94346
	addi	%v1, %zero, 0
	j	fbgt_cont.94347
fbgt_else.94346:
	addi	%v1, %zero, 1
fbgt_cont.94347:
	beqi	%v1, 0, bnei_else.94348
	flw	%f0, 462(%zero)
	j	bnei_cont.94349
bnei_else.94348:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 34(%sp)
	fblt	%f0, %f1, fbgt_else.94350
	addi	%v1, %zero, 1
	j	fbgt_cont.94351
fbgt_else.94350:
	addi	%v1, %zero, 0
fbgt_cont.94351:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94352
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94354
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94355
fbgt_else.94354:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94355:
	beqi	%v1, 0, bnei_else.94356
	j	fbgt_cont.94353
bnei_else.94356:
	fneg	%f0, %f0
bnei_cont.94357:
	j	fbgt_cont.94353
fbgt_else.94352:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94353:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94349:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94358
	addi	%v1, %zero, 0
	j	fbgt_cont.94359
fbgt_else.94358:
	addi	%v1, %zero, 1
fbgt_cont.94359:
	beqi	%v1, 0, bnei_else.94360
	flw	%f1, 462(%zero)
	j	bnei_cont.94361
bnei_else.94360:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 34(%sp)
	fblt	%f1, %f2, fbgt_else.94362
	addi	%v1, %zero, 1
	j	fbgt_cont.94363
fbgt_else.94362:
	addi	%v1, %zero, 0
fbgt_cont.94363:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94364
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94366
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94367
fbgt_else.94366:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94367:
	beqi	%v1, 0, bnei_else.94368
	j	fbgt_cont.94365
bnei_else.94368:
	fneg	%f1, %f1
bnei_cont.94369:
	j	fbgt_cont.94365
fbgt_else.94364:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94365:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94361:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 34(%sp)
	fblt	%f0, %f1, fbgt_else.94370
	addi	%v1, %zero, 0
	j	fbgt_cont.94371
fbgt_else.94370:
	addi	%v1, %zero, 1
fbgt_cont.94371:
	beqi	%v1, 0, bnei_else.94372
	fmov	%f0, %f1
	j	bnei_cont.94373
bnei_else.94372:
bnei_cont.94373:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94345:
	j	bnei_cont.94339
bnei_else.94342:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 37(%sp)
	fsw	%f0, 38(%sp)
	fsw	%f2, 39(%sp)
	fblt	%f0, %f2, fbgt_else.94374
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94376
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94378
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94380
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94382
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94384
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	fbgt_cont.94375
fbgt_else.94384:
	fmov	%f0, %f3
fbgt_cont.94385:
	j	fbgt_cont.94375
fbgt_else.94382:
	fmov	%f0, %f3
fbgt_cont.94383:
	j	fbgt_cont.94375
fbgt_else.94380:
	fmov	%f0, %f3
fbgt_cont.94381:
	j	fbgt_cont.94375
fbgt_else.94378:
	fmov	%f0, %f3
fbgt_cont.94379:
	j	fbgt_cont.94375
fbgt_else.94376:
	fmov	%f0, %f3
fbgt_cont.94377:
	j	fbgt_cont.94375
fbgt_else.94374:
	fmov	%f0, %f2
fbgt_cont.94375:
	flw	%f1, 38(%sp)
	flw	%f2, 39(%sp)
	fblt	%f1, %f2, fbgt_else.94386
	fblt	%f1, %f0, fbgt_else.94388
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94390
	fblt	%f1, %f0, fbgt_else.94392
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	fbgt_cont.94387
fbgt_else.94392:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
fbgt_cont.94393:
	j	fbgt_cont.94387
fbgt_else.94390:
	fmov	%f0, %f1
fbgt_cont.94391:
	j	fbgt_cont.94387
fbgt_else.94388:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94394
	fblt	%f1, %f0, fbgt_else.94396
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	fbgt_cont.94395
fbgt_else.94396:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
fbgt_cont.94397:
	j	fbgt_cont.94395
fbgt_else.94394:
	fmov	%f0, %f1
fbgt_cont.94395:
fbgt_cont.94389:
	j	fbgt_cont.94387
fbgt_else.94386:
	fmov	%f0, %f1
fbgt_cont.94387:
	flw	%f1, 37(%sp)
	fblt	%f0, %f1, fbgt_else.94398
	addi	%v0, %zero, 0
	j	fbgt_cont.94399
fbgt_else.94398:
	addi	%v0, %zero, 1
fbgt_cont.94399:
	fblt	%f0, %f1, fbgt_else.94400
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94401
fbgt_else.94400:
fbgt_cont.94401:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94402
	beqi	%v0, 0, bnei_else.94404
	addi	%v0, %zero, 0
	j	fbgt_cont.94403
bnei_else.94404:
	addi	%v0, %zero, 1
bnei_cont.94405:
	j	fbgt_cont.94403
fbgt_else.94402:
fbgt_cont.94403:
	fblt	%f0, %f2, fbgt_else.94406
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94407
fbgt_else.94406:
fbgt_cont.94407:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94408
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94409
fbgt_else.94408:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94409:
	beqi	%v0, 0, bnei_else.94410
	j	bnei_cont.94411
bnei_else.94410:
	fneg	%f0, %f0
bnei_cont.94411:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94343:
	j	bnei_cont.94339
bnei_else.94340:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 34(%sp)
	fblt	%f0, %f2, fbgt_else.94412
	addi	%v1, %zero, 1
	j	fbgt_cont.94413
fbgt_else.94412:
	addi	%v1, %zero, 0
fbgt_cont.94413:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 40(%sp)
	fsw	%f1, 41(%sp)
	fsw	%f0, 42(%sp)
	fsw	%f3, 43(%sp)
	fblt	%f0, %f3, fbgt_else.94414
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94416
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94418
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94420
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94422
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94424
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	fbgt_cont.94415
fbgt_else.94424:
	fmov	%f0, %f4
fbgt_cont.94425:
	j	fbgt_cont.94415
fbgt_else.94422:
	fmov	%f0, %f4
fbgt_cont.94423:
	j	fbgt_cont.94415
fbgt_else.94420:
	fmov	%f0, %f4
fbgt_cont.94421:
	j	fbgt_cont.94415
fbgt_else.94418:
	fmov	%f0, %f4
fbgt_cont.94419:
	j	fbgt_cont.94415
fbgt_else.94416:
	fmov	%f0, %f4
fbgt_cont.94417:
	j	fbgt_cont.94415
fbgt_else.94414:
	fmov	%f0, %f3
fbgt_cont.94415:
	flw	%f1, 42(%sp)
	flw	%f2, 43(%sp)
	fblt	%f1, %f2, fbgt_else.94426
	fblt	%f1, %f0, fbgt_else.94428
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94430
	fblt	%f1, %f0, fbgt_else.94432
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	fbgt_cont.94427
fbgt_else.94432:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
fbgt_cont.94433:
	j	fbgt_cont.94427
fbgt_else.94430:
	fmov	%f0, %f1
fbgt_cont.94431:
	j	fbgt_cont.94427
fbgt_else.94428:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94434
	fblt	%f1, %f0, fbgt_else.94436
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	fbgt_cont.94435
fbgt_else.94436:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
fbgt_cont.94437:
	j	fbgt_cont.94435
fbgt_else.94434:
	fmov	%f0, %f1
fbgt_cont.94435:
fbgt_cont.94429:
	j	fbgt_cont.94427
fbgt_else.94426:
	fmov	%f0, %f1
fbgt_cont.94427:
	flw	%f1, 41(%sp)
	fblt	%f0, %f1, fbgt_else.94438
	lw	%v0, 40(%sp)
	beqi	%v0, 0, bnei_else.94440
	addi	%v0, %zero, 0
	j	fbgt_cont.94439
bnei_else.94440:
	addi	%v0, %zero, 1
bnei_cont.94441:
	j	fbgt_cont.94439
fbgt_else.94438:
	lw	%v0, 40(%sp)
fbgt_cont.94439:
	fblt	%f0, %f1, fbgt_else.94442
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94443
fbgt_else.94442:
fbgt_cont.94443:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94444
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94445
fbgt_else.94444:
fbgt_cont.94445:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94446
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94447
fbgt_else.94446:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94447:
	beqi	%v0, 0, bnei_else.94448
	j	bnei_cont.94449
bnei_else.94448:
	fneg	%f0, %f0
bnei_cont.94449:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94341:
	j	bnei_cont.94339
bnei_else.94338:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94450
	addi	%v1, %zero, 0
	j	fbgt_cont.94451
fbgt_else.94450:
	addi	%v1, %zero, 1
fbgt_cont.94451:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94452
	addi	%a0, %zero, 0
	j	fbgt_cont.94453
fbgt_else.94452:
	addi	%a0, %zero, 1
fbgt_cont.94453:
	beqi	%v1, 0, bnei_else.94454
	beqi	%a0, 0, bnei_else.94456
	flw	%f0, 450(%zero)
	j	bnei_cont.94455
bnei_else.94456:
	flw	%f0, 34(%sp)
bnei_cont.94457:
	j	bnei_cont.94455
bnei_else.94454:
	beqi	%a0, 0, bnei_else.94458
	flw	%f0, 34(%sp)
	j	bnei_cont.94459
bnei_else.94458:
	flw	%f0, 450(%zero)
bnei_cont.94459:
bnei_cont.94455:
	fsw	%f0, 146(%zero)
bnei_cont.94339:
	lw	%v0, 3(%sp)
	lw	%v1, 33(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	beqi	%v0, 0, bnei_else.94460
	j	bnei_cont.94309
bnei_else.94460:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 34(%sp)
	fblt	%f1, %f0, fbgt_else.94462
	addi	%v0, %zero, 0
	j	fbgt_cont.94463
fbgt_else.94462:
	addi	%v0, %zero, 1
fbgt_cont.94463:
	beqi	%v0, 0, bnei_else.94464
	j	bnei_cont.94465
bnei_else.94464:
	fmov	%f0, %f1
bnei_cont.94465:
	flw	%f1, 32(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 36(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94461:
	j	bnei_cont.94309
bnei_else.94316:
bnei_cont.94317:
	j	bnei_cont.94309
bnei_else.94308:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 44(%sp)
	sw	%v1, 45(%sp)
	fsw	%f1, 34(%sp)
	sw	%a0, 46(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94466
	addi	%v0, %zero, 0
	j	fbgt_cont.94467
fbgt_else.94466:
	addi	%v0, %zero, 1
fbgt_cont.94467:
	beqi	%v0, 0, bnei_else.94468
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94470
	addi	%v0, %zero, 0
	j	bnei_cont.94469
fbgt_else.94470:
	addi	%v0, %zero, 1
fbgt_cont.94471:
	j	bnei_cont.94469
bnei_else.94468:
	addi	%v0, %zero, 0
bnei_cont.94469:
	beqi	%v0, 0, bnei_else.94472
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 46(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94474
	beqi	%a0, 2, bnei_else.94476
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94478
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94479
bnei_else.94478:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94479:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 34(%sp)
	fbne	%f1, %f4, fbeq_else.94480
	addi	%a0, %zero, 1
	j	fbeq_cont.94481
fbeq_else.94480:
	addi	%a0, %zero, 0
fbeq_cont.94481:
	beqi	%a0, 0, bnei_else.94482
	flw	%f1, 491(%zero)
	j	bnei_cont.94483
bnei_else.94482:
	beqi	%v1, 0, bnei_else.94484
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94485
bnei_else.94484:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94485:
bnei_cont.94483:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94475
bnei_else.94476:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94477:
	j	bnei_cont.94475
bnei_else.94474:
	lw	%a0, 136(%zero)
	flw	%f0, 34(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94486
	addi	%v1, %zero, 1
	j	fbeq_cont.94487
fbeq_else.94486:
	addi	%v1, %zero, 0
fbeq_cont.94487:
	beqi	%v1, 0, bnei_else.94488
	fmov	%f1, %f0
	j	bnei_cont.94489
bnei_else.94488:
	fblt	%f0, %f1, fbgt_else.94490
	addi	%v1, %zero, 0
	j	fbgt_cont.94491
fbgt_else.94490:
	addi	%v1, %zero, 1
fbgt_cont.94491:
	beqi	%v1, 0, bnei_else.94492
	flw	%f1, 491(%zero)
	j	bnei_cont.94493
bnei_else.94492:
	flw	%f1, 490(%zero)
bnei_cont.94493:
bnei_cont.94489:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94475:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 47(%sp)
	beqi	%v1, 1, bnei_else.94494
	beqi	%v1, 2, bnei_else.94496
	beqi	%v1, 3, bnei_else.94498
	beqi	%v1, 4, bnei_else.94500
	j	bnei_cont.94495
bnei_else.94500:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94502
	addi	%v1, %zero, 0
	j	fbgt_cont.94503
fbgt_else.94502:
	addi	%v1, %zero, 1
fbgt_cont.94503:
	beqi	%v1, 0, bnei_else.94504
	flw	%f0, 462(%zero)
	j	bnei_cont.94505
bnei_else.94504:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 34(%sp)
	fblt	%f0, %f1, fbgt_else.94506
	addi	%v1, %zero, 1
	j	fbgt_cont.94507
fbgt_else.94506:
	addi	%v1, %zero, 0
fbgt_cont.94507:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94508
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94510
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94511
fbgt_else.94510:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94511:
	beqi	%v1, 0, bnei_else.94512
	j	fbgt_cont.94509
bnei_else.94512:
	fneg	%f0, %f0
bnei_cont.94513:
	j	fbgt_cont.94509
fbgt_else.94508:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94509:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94505:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94514
	addi	%v1, %zero, 0
	j	fbgt_cont.94515
fbgt_else.94514:
	addi	%v1, %zero, 1
fbgt_cont.94515:
	beqi	%v1, 0, bnei_else.94516
	flw	%f1, 462(%zero)
	j	bnei_cont.94517
bnei_else.94516:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 34(%sp)
	fblt	%f1, %f2, fbgt_else.94518
	addi	%v1, %zero, 1
	j	fbgt_cont.94519
fbgt_else.94518:
	addi	%v1, %zero, 0
fbgt_cont.94519:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94520
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94522
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94523
fbgt_else.94522:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94523:
	beqi	%v1, 0, bnei_else.94524
	j	fbgt_cont.94521
bnei_else.94524:
	fneg	%f1, %f1
bnei_cont.94525:
	j	fbgt_cont.94521
fbgt_else.94520:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94521:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94517:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 34(%sp)
	fblt	%f0, %f1, fbgt_else.94526
	addi	%v1, %zero, 0
	j	fbgt_cont.94527
fbgt_else.94526:
	addi	%v1, %zero, 1
fbgt_cont.94527:
	beqi	%v1, 0, bnei_else.94528
	fmov	%f0, %f1
	j	bnei_cont.94529
bnei_else.94528:
bnei_cont.94529:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94501:
	j	bnei_cont.94495
bnei_else.94498:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 48(%sp)
	fsw	%f0, 49(%sp)
	fsw	%f2, 50(%sp)
	fblt	%f0, %f2, fbgt_else.94530
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94532
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94534
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94536
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94538
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94540
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	j	fbgt_cont.94531
fbgt_else.94540:
	fmov	%f0, %f3
fbgt_cont.94541:
	j	fbgt_cont.94531
fbgt_else.94538:
	fmov	%f0, %f3
fbgt_cont.94539:
	j	fbgt_cont.94531
fbgt_else.94536:
	fmov	%f0, %f3
fbgt_cont.94537:
	j	fbgt_cont.94531
fbgt_else.94534:
	fmov	%f0, %f3
fbgt_cont.94535:
	j	fbgt_cont.94531
fbgt_else.94532:
	fmov	%f0, %f3
fbgt_cont.94533:
	j	fbgt_cont.94531
fbgt_else.94530:
	fmov	%f0, %f2
fbgt_cont.94531:
	flw	%f1, 49(%sp)
	flw	%f2, 50(%sp)
	fblt	%f1, %f2, fbgt_else.94542
	fblt	%f1, %f0, fbgt_else.94544
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94546
	fblt	%f1, %f0, fbgt_else.94548
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	j	fbgt_cont.94543
fbgt_else.94548:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
fbgt_cont.94549:
	j	fbgt_cont.94543
fbgt_else.94546:
	fmov	%f0, %f1
fbgt_cont.94547:
	j	fbgt_cont.94543
fbgt_else.94544:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94550
	fblt	%f1, %f0, fbgt_else.94552
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	j	fbgt_cont.94551
fbgt_else.94552:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
fbgt_cont.94553:
	j	fbgt_cont.94551
fbgt_else.94550:
	fmov	%f0, %f1
fbgt_cont.94551:
fbgt_cont.94545:
	j	fbgt_cont.94543
fbgt_else.94542:
	fmov	%f0, %f1
fbgt_cont.94543:
	flw	%f1, 48(%sp)
	fblt	%f0, %f1, fbgt_else.94554
	addi	%v0, %zero, 0
	j	fbgt_cont.94555
fbgt_else.94554:
	addi	%v0, %zero, 1
fbgt_cont.94555:
	fblt	%f0, %f1, fbgt_else.94556
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94557
fbgt_else.94556:
fbgt_cont.94557:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94558
	beqi	%v0, 0, bnei_else.94560
	addi	%v0, %zero, 0
	j	fbgt_cont.94559
bnei_else.94560:
	addi	%v0, %zero, 1
bnei_cont.94561:
	j	fbgt_cont.94559
fbgt_else.94558:
fbgt_cont.94559:
	fblt	%f0, %f2, fbgt_else.94562
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94563
fbgt_else.94562:
fbgt_cont.94563:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94564
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94565
fbgt_else.94564:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94565:
	beqi	%v0, 0, bnei_else.94566
	j	bnei_cont.94567
bnei_else.94566:
	fneg	%f0, %f0
bnei_cont.94567:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94499:
	j	bnei_cont.94495
bnei_else.94496:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 34(%sp)
	fblt	%f0, %f2, fbgt_else.94568
	addi	%v1, %zero, 1
	j	fbgt_cont.94569
fbgt_else.94568:
	addi	%v1, %zero, 0
fbgt_cont.94569:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 51(%sp)
	fsw	%f1, 52(%sp)
	fsw	%f0, 53(%sp)
	fsw	%f3, 54(%sp)
	fblt	%f0, %f3, fbgt_else.94570
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94572
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94574
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94576
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94578
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94580
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	fbgt_cont.94571
fbgt_else.94580:
	fmov	%f0, %f4
fbgt_cont.94581:
	j	fbgt_cont.94571
fbgt_else.94578:
	fmov	%f0, %f4
fbgt_cont.94579:
	j	fbgt_cont.94571
fbgt_else.94576:
	fmov	%f0, %f4
fbgt_cont.94577:
	j	fbgt_cont.94571
fbgt_else.94574:
	fmov	%f0, %f4
fbgt_cont.94575:
	j	fbgt_cont.94571
fbgt_else.94572:
	fmov	%f0, %f4
fbgt_cont.94573:
	j	fbgt_cont.94571
fbgt_else.94570:
	fmov	%f0, %f3
fbgt_cont.94571:
	flw	%f1, 53(%sp)
	flw	%f2, 54(%sp)
	fblt	%f1, %f2, fbgt_else.94582
	fblt	%f1, %f0, fbgt_else.94584
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94586
	fblt	%f1, %f0, fbgt_else.94588
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	fbgt_cont.94583
fbgt_else.94588:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
fbgt_cont.94589:
	j	fbgt_cont.94583
fbgt_else.94586:
	fmov	%f0, %f1
fbgt_cont.94587:
	j	fbgt_cont.94583
fbgt_else.94584:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94590
	fblt	%f1, %f0, fbgt_else.94592
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	fbgt_cont.94591
fbgt_else.94592:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
fbgt_cont.94593:
	j	fbgt_cont.94591
fbgt_else.94590:
	fmov	%f0, %f1
fbgt_cont.94591:
fbgt_cont.94585:
	j	fbgt_cont.94583
fbgt_else.94582:
	fmov	%f0, %f1
fbgt_cont.94583:
	flw	%f1, 52(%sp)
	fblt	%f0, %f1, fbgt_else.94594
	lw	%v0, 51(%sp)
	beqi	%v0, 0, bnei_else.94596
	addi	%v0, %zero, 0
	j	fbgt_cont.94595
bnei_else.94596:
	addi	%v0, %zero, 1
bnei_cont.94597:
	j	fbgt_cont.94595
fbgt_else.94594:
	lw	%v0, 51(%sp)
fbgt_cont.94595:
	fblt	%f0, %f1, fbgt_else.94598
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94599
fbgt_else.94598:
fbgt_cont.94599:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94600
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94601
fbgt_else.94600:
fbgt_cont.94601:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94602
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94603
fbgt_else.94602:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94603:
	beqi	%v0, 0, bnei_else.94604
	j	bnei_cont.94605
bnei_else.94604:
	fneg	%f0, %f0
bnei_cont.94605:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94497:
	j	bnei_cont.94495
bnei_else.94494:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94606
	addi	%v1, %zero, 0
	j	fbgt_cont.94607
fbgt_else.94606:
	addi	%v1, %zero, 1
fbgt_cont.94607:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94608
	addi	%a0, %zero, 0
	j	fbgt_cont.94609
fbgt_else.94608:
	addi	%a0, %zero, 1
fbgt_cont.94609:
	beqi	%v1, 0, bnei_else.94610
	beqi	%a0, 0, bnei_else.94612
	flw	%f0, 450(%zero)
	j	bnei_cont.94611
bnei_else.94612:
	flw	%f0, 34(%sp)
bnei_cont.94613:
	j	bnei_cont.94611
bnei_else.94610:
	beqi	%a0, 0, bnei_else.94614
	flw	%f0, 34(%sp)
	j	bnei_cont.94615
bnei_else.94614:
	flw	%f0, 450(%zero)
bnei_cont.94615:
bnei_cont.94611:
	fsw	%f0, 146(%zero)
bnei_cont.94495:
	lw	%v0, 3(%sp)
	lw	%v1, 45(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	beqi	%v0, 0, bnei_else.94616
	j	bnei_cont.94473
bnei_else.94616:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 34(%sp)
	fblt	%f1, %f0, fbgt_else.94618
	addi	%v0, %zero, 0
	j	fbgt_cont.94619
fbgt_else.94618:
	addi	%v0, %zero, 1
fbgt_cont.94619:
	beqi	%v0, 0, bnei_else.94620
	j	bnei_cont.94621
bnei_else.94620:
	fmov	%f0, %f1
bnei_cont.94621:
	flw	%f1, 44(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 47(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94617:
	j	bnei_cont.94473
bnei_else.94472:
bnei_cont.94473:
bnei_cont.94309:
	addi	%a1, %zero, 116
	lw	%v0, 31(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	bnei_cont.94305
bnei_else.94304:
bnei_cont.94305:
	lw	%v0, 6(%sp)
	beqi	%v0, 2, bnei_else.94622
	lw	%v1, 181(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 55(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v0, 55(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 4(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.94624
	addi	%v1, %zero, 0
	j	fbgt_cont.94625
fbgt_else.94624:
	addi	%v1, %zero, 1
fbgt_cont.94625:
	beqi	%v1, 0, bnei_else.94626
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 56(%sp)
	sw	%v1, 57(%sp)
	fsw	%f1, 58(%sp)
	sw	%a0, 59(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 61
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -61
	lw	%ra, 60(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94628
	addi	%v0, %zero, 0
	j	fbgt_cont.94629
fbgt_else.94628:
	addi	%v0, %zero, 1
fbgt_cont.94629:
	beqi	%v0, 0, bnei_else.94630
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94632
	addi	%v0, %zero, 0
	j	bnei_cont.94631
fbgt_else.94632:
	addi	%v0, %zero, 1
fbgt_cont.94633:
	j	bnei_cont.94631
bnei_else.94630:
	addi	%v0, %zero, 0
bnei_cont.94631:
	beqi	%v0, 0, bnei_else.94634
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 59(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94636
	beqi	%a0, 2, bnei_else.94638
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94640
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94641
bnei_else.94640:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94641:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 58(%sp)
	fbne	%f1, %f4, fbeq_else.94642
	addi	%a0, %zero, 1
	j	fbeq_cont.94643
fbeq_else.94642:
	addi	%a0, %zero, 0
fbeq_cont.94643:
	beqi	%a0, 0, bnei_else.94644
	flw	%f1, 491(%zero)
	j	bnei_cont.94645
bnei_else.94644:
	beqi	%v1, 0, bnei_else.94646
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94647
bnei_else.94646:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94647:
bnei_cont.94645:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94637
bnei_else.94638:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94639:
	j	bnei_cont.94637
bnei_else.94636:
	lw	%a0, 136(%zero)
	flw	%f0, 58(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94648
	addi	%v1, %zero, 1
	j	fbeq_cont.94649
fbeq_else.94648:
	addi	%v1, %zero, 0
fbeq_cont.94649:
	beqi	%v1, 0, bnei_else.94650
	fmov	%f1, %f0
	j	bnei_cont.94651
bnei_else.94650:
	fblt	%f0, %f1, fbgt_else.94652
	addi	%v1, %zero, 0
	j	fbgt_cont.94653
fbgt_else.94652:
	addi	%v1, %zero, 1
fbgt_cont.94653:
	beqi	%v1, 0, bnei_else.94654
	flw	%f1, 491(%zero)
	j	bnei_cont.94655
bnei_else.94654:
	flw	%f1, 490(%zero)
bnei_cont.94655:
bnei_cont.94651:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94637:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 60(%sp)
	beqi	%v1, 1, bnei_else.94656
	beqi	%v1, 2, bnei_else.94658
	beqi	%v1, 3, bnei_else.94660
	beqi	%v1, 4, bnei_else.94662
	j	bnei_cont.94657
bnei_else.94662:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94664
	addi	%v1, %zero, 0
	j	fbgt_cont.94665
fbgt_else.94664:
	addi	%v1, %zero, 1
fbgt_cont.94665:
	beqi	%v1, 0, bnei_else.94666
	flw	%f0, 462(%zero)
	j	bnei_cont.94667
bnei_else.94666:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 58(%sp)
	fblt	%f0, %f1, fbgt_else.94668
	addi	%v1, %zero, 1
	j	fbgt_cont.94669
fbgt_else.94668:
	addi	%v1, %zero, 0
fbgt_cont.94669:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94670
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94672
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94673
fbgt_else.94672:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94673:
	beqi	%v1, 0, bnei_else.94674
	j	fbgt_cont.94671
bnei_else.94674:
	fneg	%f0, %f0
bnei_cont.94675:
	j	fbgt_cont.94671
fbgt_else.94670:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94671:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94667:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94676
	addi	%v1, %zero, 0
	j	fbgt_cont.94677
fbgt_else.94676:
	addi	%v1, %zero, 1
fbgt_cont.94677:
	beqi	%v1, 0, bnei_else.94678
	flw	%f1, 462(%zero)
	j	bnei_cont.94679
bnei_else.94678:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 58(%sp)
	fblt	%f1, %f2, fbgt_else.94680
	addi	%v1, %zero, 1
	j	fbgt_cont.94681
fbgt_else.94680:
	addi	%v1, %zero, 0
fbgt_cont.94681:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94682
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94684
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94685
fbgt_else.94684:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94685:
	beqi	%v1, 0, bnei_else.94686
	j	fbgt_cont.94683
bnei_else.94686:
	fneg	%f1, %f1
bnei_cont.94687:
	j	fbgt_cont.94683
fbgt_else.94682:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94683:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94679:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 58(%sp)
	fblt	%f0, %f1, fbgt_else.94688
	addi	%v1, %zero, 0
	j	fbgt_cont.94689
fbgt_else.94688:
	addi	%v1, %zero, 1
fbgt_cont.94689:
	beqi	%v1, 0, bnei_else.94690
	fmov	%f0, %f1
	j	bnei_cont.94691
bnei_else.94690:
bnei_cont.94691:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94663:
	j	bnei_cont.94657
bnei_else.94660:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 61(%sp)
	fsw	%f0, 62(%sp)
	fsw	%f2, 63(%sp)
	fblt	%f0, %f2, fbgt_else.94692
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94694
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94696
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94698
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94700
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94702
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	j	fbgt_cont.94693
fbgt_else.94702:
	fmov	%f0, %f3
fbgt_cont.94703:
	j	fbgt_cont.94693
fbgt_else.94700:
	fmov	%f0, %f3
fbgt_cont.94701:
	j	fbgt_cont.94693
fbgt_else.94698:
	fmov	%f0, %f3
fbgt_cont.94699:
	j	fbgt_cont.94693
fbgt_else.94696:
	fmov	%f0, %f3
fbgt_cont.94697:
	j	fbgt_cont.94693
fbgt_else.94694:
	fmov	%f0, %f3
fbgt_cont.94695:
	j	fbgt_cont.94693
fbgt_else.94692:
	fmov	%f0, %f2
fbgt_cont.94693:
	flw	%f1, 62(%sp)
	flw	%f2, 63(%sp)
	fblt	%f1, %f2, fbgt_else.94704
	fblt	%f1, %f0, fbgt_else.94706
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94708
	fblt	%f1, %f0, fbgt_else.94710
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	j	fbgt_cont.94705
fbgt_else.94710:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
fbgt_cont.94711:
	j	fbgt_cont.94705
fbgt_else.94708:
	fmov	%f0, %f1
fbgt_cont.94709:
	j	fbgt_cont.94705
fbgt_else.94706:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94712
	fblt	%f1, %f0, fbgt_else.94714
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	j	fbgt_cont.94713
fbgt_else.94714:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
fbgt_cont.94715:
	j	fbgt_cont.94713
fbgt_else.94712:
	fmov	%f0, %f1
fbgt_cont.94713:
fbgt_cont.94707:
	j	fbgt_cont.94705
fbgt_else.94704:
	fmov	%f0, %f1
fbgt_cont.94705:
	flw	%f1, 61(%sp)
	fblt	%f0, %f1, fbgt_else.94716
	addi	%v0, %zero, 0
	j	fbgt_cont.94717
fbgt_else.94716:
	addi	%v0, %zero, 1
fbgt_cont.94717:
	fblt	%f0, %f1, fbgt_else.94718
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94719
fbgt_else.94718:
fbgt_cont.94719:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94720
	beqi	%v0, 0, bnei_else.94722
	addi	%v0, %zero, 0
	j	fbgt_cont.94721
bnei_else.94722:
	addi	%v0, %zero, 1
bnei_cont.94723:
	j	fbgt_cont.94721
fbgt_else.94720:
fbgt_cont.94721:
	fblt	%f0, %f2, fbgt_else.94724
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94725
fbgt_else.94724:
fbgt_cont.94725:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94726
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94727
fbgt_else.94726:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94727:
	beqi	%v0, 0, bnei_else.94728
	j	bnei_cont.94729
bnei_else.94728:
	fneg	%f0, %f0
bnei_cont.94729:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94661:
	j	bnei_cont.94657
bnei_else.94658:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 58(%sp)
	fblt	%f0, %f2, fbgt_else.94730
	addi	%v1, %zero, 1
	j	fbgt_cont.94731
fbgt_else.94730:
	addi	%v1, %zero, 0
fbgt_cont.94731:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 64(%sp)
	fsw	%f1, 65(%sp)
	fsw	%f0, 66(%sp)
	fsw	%f3, 67(%sp)
	fblt	%f0, %f3, fbgt_else.94732
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94734
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94736
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94738
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94740
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94742
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.94733
fbgt_else.94742:
	fmov	%f0, %f4
fbgt_cont.94743:
	j	fbgt_cont.94733
fbgt_else.94740:
	fmov	%f0, %f4
fbgt_cont.94741:
	j	fbgt_cont.94733
fbgt_else.94738:
	fmov	%f0, %f4
fbgt_cont.94739:
	j	fbgt_cont.94733
fbgt_else.94736:
	fmov	%f0, %f4
fbgt_cont.94737:
	j	fbgt_cont.94733
fbgt_else.94734:
	fmov	%f0, %f4
fbgt_cont.94735:
	j	fbgt_cont.94733
fbgt_else.94732:
	fmov	%f0, %f3
fbgt_cont.94733:
	flw	%f1, 66(%sp)
	flw	%f2, 67(%sp)
	fblt	%f1, %f2, fbgt_else.94744
	fblt	%f1, %f0, fbgt_else.94746
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94748
	fblt	%f1, %f0, fbgt_else.94750
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.94745
fbgt_else.94750:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.94751:
	j	fbgt_cont.94745
fbgt_else.94748:
	fmov	%f0, %f1
fbgt_cont.94749:
	j	fbgt_cont.94745
fbgt_else.94746:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94752
	fblt	%f1, %f0, fbgt_else.94754
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.94753
fbgt_else.94754:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.94755:
	j	fbgt_cont.94753
fbgt_else.94752:
	fmov	%f0, %f1
fbgt_cont.94753:
fbgt_cont.94747:
	j	fbgt_cont.94745
fbgt_else.94744:
	fmov	%f0, %f1
fbgt_cont.94745:
	flw	%f1, 65(%sp)
	fblt	%f0, %f1, fbgt_else.94756
	lw	%v0, 64(%sp)
	beqi	%v0, 0, bnei_else.94758
	addi	%v0, %zero, 0
	j	fbgt_cont.94757
bnei_else.94758:
	addi	%v0, %zero, 1
bnei_cont.94759:
	j	fbgt_cont.94757
fbgt_else.94756:
	lw	%v0, 64(%sp)
fbgt_cont.94757:
	fblt	%f0, %f1, fbgt_else.94760
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94761
fbgt_else.94760:
fbgt_cont.94761:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94762
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94763
fbgt_else.94762:
fbgt_cont.94763:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94764
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94765
fbgt_else.94764:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94765:
	beqi	%v0, 0, bnei_else.94766
	j	bnei_cont.94767
bnei_else.94766:
	fneg	%f0, %f0
bnei_cont.94767:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94659:
	j	bnei_cont.94657
bnei_else.94656:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94768
	addi	%v1, %zero, 0
	j	fbgt_cont.94769
fbgt_else.94768:
	addi	%v1, %zero, 1
fbgt_cont.94769:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94770
	addi	%a0, %zero, 0
	j	fbgt_cont.94771
fbgt_else.94770:
	addi	%a0, %zero, 1
fbgt_cont.94771:
	beqi	%v1, 0, bnei_else.94772
	beqi	%a0, 0, bnei_else.94774
	flw	%f0, 450(%zero)
	j	bnei_cont.94773
bnei_else.94774:
	flw	%f0, 58(%sp)
bnei_cont.94775:
	j	bnei_cont.94773
bnei_else.94772:
	beqi	%a0, 0, bnei_else.94776
	flw	%f0, 58(%sp)
	j	bnei_cont.94777
bnei_else.94776:
	flw	%f0, 450(%zero)
bnei_cont.94777:
bnei_cont.94773:
	fsw	%f0, 146(%zero)
bnei_cont.94657:
	lw	%v0, 3(%sp)
	lw	%v1, 57(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	beqi	%v0, 0, bnei_else.94778
	j	bnei_cont.94627
bnei_else.94778:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 58(%sp)
	fblt	%f1, %f0, fbgt_else.94780
	addi	%v0, %zero, 0
	j	fbgt_cont.94781
fbgt_else.94780:
	addi	%v0, %zero, 1
fbgt_cont.94781:
	beqi	%v0, 0, bnei_else.94782
	j	bnei_cont.94783
bnei_else.94782:
	fmov	%f0, %f1
bnei_cont.94783:
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 60(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94779:
	j	bnei_cont.94627
bnei_else.94634:
bnei_cont.94635:
	j	bnei_cont.94627
bnei_else.94626:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 68(%sp)
	sw	%v1, 69(%sp)
	fsw	%f1, 58(%sp)
	sw	%a0, 70(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94784
	addi	%v0, %zero, 0
	j	fbgt_cont.94785
fbgt_else.94784:
	addi	%v0, %zero, 1
fbgt_cont.94785:
	beqi	%v0, 0, bnei_else.94786
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94788
	addi	%v0, %zero, 0
	j	bnei_cont.94787
fbgt_else.94788:
	addi	%v0, %zero, 1
fbgt_cont.94789:
	j	bnei_cont.94787
bnei_else.94786:
	addi	%v0, %zero, 0
bnei_cont.94787:
	beqi	%v0, 0, bnei_else.94790
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 70(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94792
	beqi	%a0, 2, bnei_else.94794
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94796
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94797
bnei_else.94796:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94797:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 58(%sp)
	fbne	%f1, %f4, fbeq_else.94798
	addi	%a0, %zero, 1
	j	fbeq_cont.94799
fbeq_else.94798:
	addi	%a0, %zero, 0
fbeq_cont.94799:
	beqi	%a0, 0, bnei_else.94800
	flw	%f1, 491(%zero)
	j	bnei_cont.94801
bnei_else.94800:
	beqi	%v1, 0, bnei_else.94802
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94803
bnei_else.94802:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94803:
bnei_cont.94801:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94793
bnei_else.94794:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94795:
	j	bnei_cont.94793
bnei_else.94792:
	lw	%a0, 136(%zero)
	flw	%f0, 58(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94804
	addi	%v1, %zero, 1
	j	fbeq_cont.94805
fbeq_else.94804:
	addi	%v1, %zero, 0
fbeq_cont.94805:
	beqi	%v1, 0, bnei_else.94806
	fmov	%f1, %f0
	j	bnei_cont.94807
bnei_else.94806:
	fblt	%f0, %f1, fbgt_else.94808
	addi	%v1, %zero, 0
	j	fbgt_cont.94809
fbgt_else.94808:
	addi	%v1, %zero, 1
fbgt_cont.94809:
	beqi	%v1, 0, bnei_else.94810
	flw	%f1, 491(%zero)
	j	bnei_cont.94811
bnei_else.94810:
	flw	%f1, 490(%zero)
bnei_cont.94811:
bnei_cont.94807:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94793:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 71(%sp)
	beqi	%v1, 1, bnei_else.94812
	beqi	%v1, 2, bnei_else.94814
	beqi	%v1, 3, bnei_else.94816
	beqi	%v1, 4, bnei_else.94818
	j	bnei_cont.94813
bnei_else.94818:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94820
	addi	%v1, %zero, 0
	j	fbgt_cont.94821
fbgt_else.94820:
	addi	%v1, %zero, 1
fbgt_cont.94821:
	beqi	%v1, 0, bnei_else.94822
	flw	%f0, 462(%zero)
	j	bnei_cont.94823
bnei_else.94822:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 58(%sp)
	fblt	%f0, %f1, fbgt_else.94824
	addi	%v1, %zero, 1
	j	fbgt_cont.94825
fbgt_else.94824:
	addi	%v1, %zero, 0
fbgt_cont.94825:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94826
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94828
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94829
fbgt_else.94828:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94829:
	beqi	%v1, 0, bnei_else.94830
	j	fbgt_cont.94827
bnei_else.94830:
	fneg	%f0, %f0
bnei_cont.94831:
	j	fbgt_cont.94827
fbgt_else.94826:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94827:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94823:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94832
	addi	%v1, %zero, 0
	j	fbgt_cont.94833
fbgt_else.94832:
	addi	%v1, %zero, 1
fbgt_cont.94833:
	beqi	%v1, 0, bnei_else.94834
	flw	%f1, 462(%zero)
	j	bnei_cont.94835
bnei_else.94834:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 58(%sp)
	fblt	%f1, %f2, fbgt_else.94836
	addi	%v1, %zero, 1
	j	fbgt_cont.94837
fbgt_else.94836:
	addi	%v1, %zero, 0
fbgt_cont.94837:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.94838
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.94840
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.94841
fbgt_else.94840:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.94841:
	beqi	%v1, 0, bnei_else.94842
	j	fbgt_cont.94839
bnei_else.94842:
	fneg	%f1, %f1
bnei_cont.94843:
	j	fbgt_cont.94839
fbgt_else.94838:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.94839:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94835:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 58(%sp)
	fblt	%f0, %f1, fbgt_else.94844
	addi	%v1, %zero, 0
	j	fbgt_cont.94845
fbgt_else.94844:
	addi	%v1, %zero, 1
fbgt_cont.94845:
	beqi	%v1, 0, bnei_else.94846
	fmov	%f0, %f1
	j	bnei_cont.94847
bnei_else.94846:
bnei_cont.94847:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94819:
	j	bnei_cont.94813
bnei_else.94816:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 72(%sp)
	fsw	%f0, 73(%sp)
	fsw	%f2, 74(%sp)
	fblt	%f0, %f2, fbgt_else.94848
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.94850
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.94852
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.94854
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.94856
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.94858
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 75(%sp)
	addi	%sp, %sp, 76
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -76
	lw	%ra, 75(%sp)
	j	fbgt_cont.94849
fbgt_else.94858:
	fmov	%f0, %f3
fbgt_cont.94859:
	j	fbgt_cont.94849
fbgt_else.94856:
	fmov	%f0, %f3
fbgt_cont.94857:
	j	fbgt_cont.94849
fbgt_else.94854:
	fmov	%f0, %f3
fbgt_cont.94855:
	j	fbgt_cont.94849
fbgt_else.94852:
	fmov	%f0, %f3
fbgt_cont.94853:
	j	fbgt_cont.94849
fbgt_else.94850:
	fmov	%f0, %f3
fbgt_cont.94851:
	j	fbgt_cont.94849
fbgt_else.94848:
	fmov	%f0, %f2
fbgt_cont.94849:
	flw	%f1, 73(%sp)
	flw	%f2, 74(%sp)
	fblt	%f1, %f2, fbgt_else.94860
	fblt	%f1, %f0, fbgt_else.94862
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94864
	fblt	%f1, %f0, fbgt_else.94866
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 75(%sp)
	addi	%sp, %sp, 76
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -76
	lw	%ra, 75(%sp)
	j	fbgt_cont.94861
fbgt_else.94866:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 75(%sp)
	addi	%sp, %sp, 76
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -76
	lw	%ra, 75(%sp)
fbgt_cont.94867:
	j	fbgt_cont.94861
fbgt_else.94864:
	fmov	%f0, %f1
fbgt_cont.94865:
	j	fbgt_cont.94861
fbgt_else.94862:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94868
	fblt	%f1, %f0, fbgt_else.94870
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 75(%sp)
	addi	%sp, %sp, 76
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -76
	lw	%ra, 75(%sp)
	j	fbgt_cont.94869
fbgt_else.94870:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 75(%sp)
	addi	%sp, %sp, 76
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -76
	lw	%ra, 75(%sp)
fbgt_cont.94871:
	j	fbgt_cont.94869
fbgt_else.94868:
	fmov	%f0, %f1
fbgt_cont.94869:
fbgt_cont.94863:
	j	fbgt_cont.94861
fbgt_else.94860:
	fmov	%f0, %f1
fbgt_cont.94861:
	flw	%f1, 72(%sp)
	fblt	%f0, %f1, fbgt_else.94872
	addi	%v0, %zero, 0
	j	fbgt_cont.94873
fbgt_else.94872:
	addi	%v0, %zero, 1
fbgt_cont.94873:
	fblt	%f0, %f1, fbgt_else.94874
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94875
fbgt_else.94874:
fbgt_cont.94875:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94876
	beqi	%v0, 0, bnei_else.94878
	addi	%v0, %zero, 0
	j	fbgt_cont.94877
bnei_else.94878:
	addi	%v0, %zero, 1
bnei_cont.94879:
	j	fbgt_cont.94877
fbgt_else.94876:
fbgt_cont.94877:
	fblt	%f0, %f2, fbgt_else.94880
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94881
fbgt_else.94880:
fbgt_cont.94881:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94882
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.94883
fbgt_else.94882:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.94883:
	beqi	%v0, 0, bnei_else.94884
	j	bnei_cont.94885
bnei_else.94884:
	fneg	%f0, %f0
bnei_cont.94885:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94817:
	j	bnei_cont.94813
bnei_else.94814:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 58(%sp)
	fblt	%f0, %f2, fbgt_else.94886
	addi	%v1, %zero, 1
	j	fbgt_cont.94887
fbgt_else.94886:
	addi	%v1, %zero, 0
fbgt_cont.94887:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 75(%sp)
	fsw	%f1, 76(%sp)
	fsw	%f0, 77(%sp)
	fsw	%f3, 78(%sp)
	fblt	%f0, %f3, fbgt_else.94888
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.94890
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.94892
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.94894
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.94896
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.94898
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	j	fbgt_cont.94889
fbgt_else.94898:
	fmov	%f0, %f4
fbgt_cont.94899:
	j	fbgt_cont.94889
fbgt_else.94896:
	fmov	%f0, %f4
fbgt_cont.94897:
	j	fbgt_cont.94889
fbgt_else.94894:
	fmov	%f0, %f4
fbgt_cont.94895:
	j	fbgt_cont.94889
fbgt_else.94892:
	fmov	%f0, %f4
fbgt_cont.94893:
	j	fbgt_cont.94889
fbgt_else.94890:
	fmov	%f0, %f4
fbgt_cont.94891:
	j	fbgt_cont.94889
fbgt_else.94888:
	fmov	%f0, %f3
fbgt_cont.94889:
	flw	%f1, 77(%sp)
	flw	%f2, 78(%sp)
	fblt	%f1, %f2, fbgt_else.94900
	fblt	%f1, %f0, fbgt_else.94902
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94904
	fblt	%f1, %f0, fbgt_else.94906
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	j	fbgt_cont.94901
fbgt_else.94906:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
fbgt_cont.94907:
	j	fbgt_cont.94901
fbgt_else.94904:
	fmov	%f0, %f1
fbgt_cont.94905:
	j	fbgt_cont.94901
fbgt_else.94902:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.94908
	fblt	%f1, %f0, fbgt_else.94910
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	j	fbgt_cont.94909
fbgt_else.94910:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
fbgt_cont.94911:
	j	fbgt_cont.94909
fbgt_else.94908:
	fmov	%f0, %f1
fbgt_cont.94909:
fbgt_cont.94903:
	j	fbgt_cont.94901
fbgt_else.94900:
	fmov	%f0, %f1
fbgt_cont.94901:
	flw	%f1, 76(%sp)
	fblt	%f0, %f1, fbgt_else.94912
	lw	%v0, 75(%sp)
	beqi	%v0, 0, bnei_else.94914
	addi	%v0, %zero, 0
	j	fbgt_cont.94913
bnei_else.94914:
	addi	%v0, %zero, 1
bnei_cont.94915:
	j	fbgt_cont.94913
fbgt_else.94912:
	lw	%v0, 75(%sp)
fbgt_cont.94913:
	fblt	%f0, %f1, fbgt_else.94916
	fsub	%f0, %f0, %f1
	j	fbgt_cont.94917
fbgt_else.94916:
fbgt_cont.94917:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.94918
	fsub	%f0, %f1, %f0
	j	fbgt_cont.94919
fbgt_else.94918:
fbgt_cont.94919:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.94920
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.94921
fbgt_else.94920:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.94921:
	beqi	%v0, 0, bnei_else.94922
	j	bnei_cont.94923
bnei_else.94922:
	fneg	%f0, %f0
bnei_cont.94923:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94815:
	j	bnei_cont.94813
bnei_else.94812:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.94924
	addi	%v1, %zero, 0
	j	fbgt_cont.94925
fbgt_else.94924:
	addi	%v1, %zero, 1
fbgt_cont.94925:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.94926
	addi	%a0, %zero, 0
	j	fbgt_cont.94927
fbgt_else.94926:
	addi	%a0, %zero, 1
fbgt_cont.94927:
	beqi	%v1, 0, bnei_else.94928
	beqi	%a0, 0, bnei_else.94930
	flw	%f0, 450(%zero)
	j	bnei_cont.94929
bnei_else.94930:
	flw	%f0, 58(%sp)
bnei_cont.94931:
	j	bnei_cont.94929
bnei_else.94928:
	beqi	%a0, 0, bnei_else.94932
	flw	%f0, 58(%sp)
	j	bnei_cont.94933
bnei_else.94932:
	flw	%f0, 450(%zero)
bnei_cont.94933:
bnei_cont.94929:
	fsw	%f0, 146(%zero)
bnei_cont.94813:
	lw	%v0, 3(%sp)
	lw	%v1, 69(%sp)
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	beqi	%v0, 0, bnei_else.94934
	j	bnei_cont.94791
bnei_else.94934:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 58(%sp)
	fblt	%f1, %f0, fbgt_else.94936
	addi	%v0, %zero, 0
	j	fbgt_cont.94937
fbgt_else.94936:
	addi	%v0, %zero, 1
fbgt_cont.94937:
	beqi	%v0, 0, bnei_else.94938
	j	bnei_cont.94939
bnei_else.94938:
	fmov	%f0, %f1
bnei_cont.94939:
	flw	%f1, 68(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 71(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.94935:
	j	bnei_cont.94791
bnei_else.94790:
bnei_cont.94791:
bnei_cont.94627:
	addi	%a1, %zero, 116
	lw	%v0, 55(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	j	bnei_cont.94623
bnei_else.94622:
bnei_cont.94623:
	lw	%v0, 6(%sp)
	beqi	%v0, 3, bnei_else.94940
	lw	%v1, 182(%zero)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 79(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 80(%sp)
	addi	%sp, %sp, 81
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -81
	lw	%ra, 80(%sp)
	lw	%v0, 79(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 4(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.94942
	addi	%v1, %zero, 0
	j	fbgt_cont.94943
fbgt_else.94942:
	addi	%v1, %zero, 1
fbgt_cont.94943:
	beqi	%v1, 0, bnei_else.94944
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 80(%sp)
	sw	%v1, 81(%sp)
	fsw	%f1, 82(%sp)
	sw	%a0, 83(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.94946
	addi	%v0, %zero, 0
	j	fbgt_cont.94947
fbgt_else.94946:
	addi	%v0, %zero, 1
fbgt_cont.94947:
	beqi	%v0, 0, bnei_else.94948
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.94950
	addi	%v0, %zero, 0
	j	bnei_cont.94949
fbgt_else.94950:
	addi	%v0, %zero, 1
fbgt_cont.94951:
	j	bnei_cont.94949
bnei_else.94948:
	addi	%v0, %zero, 0
bnei_cont.94949:
	beqi	%v0, 0, bnei_else.94952
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 83(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.94954
	beqi	%a0, 2, bnei_else.94956
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.94958
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.94959
bnei_else.94958:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.94959:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 82(%sp)
	fbne	%f1, %f4, fbeq_else.94960
	addi	%a0, %zero, 1
	j	fbeq_cont.94961
fbeq_else.94960:
	addi	%a0, %zero, 0
fbeq_cont.94961:
	beqi	%a0, 0, bnei_else.94962
	flw	%f1, 491(%zero)
	j	bnei_cont.94963
bnei_else.94962:
	beqi	%v1, 0, bnei_else.94964
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.94965
bnei_else.94964:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.94965:
bnei_cont.94963:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.94955
bnei_else.94956:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.94957:
	j	bnei_cont.94955
bnei_else.94954:
	lw	%a0, 136(%zero)
	flw	%f0, 82(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.94966
	addi	%v1, %zero, 1
	j	fbeq_cont.94967
fbeq_else.94966:
	addi	%v1, %zero, 0
fbeq_cont.94967:
	beqi	%v1, 0, bnei_else.94968
	fmov	%f1, %f0
	j	bnei_cont.94969
bnei_else.94968:
	fblt	%f0, %f1, fbgt_else.94970
	addi	%v1, %zero, 0
	j	fbgt_cont.94971
fbgt_else.94970:
	addi	%v1, %zero, 1
fbgt_cont.94971:
	beqi	%v1, 0, bnei_else.94972
	flw	%f1, 491(%zero)
	j	bnei_cont.94973
bnei_else.94972:
	flw	%f1, 490(%zero)
bnei_cont.94973:
bnei_cont.94969:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.94955:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 84(%sp)
	beqi	%v1, 1, bnei_else.94974
	beqi	%v1, 2, bnei_else.94976
	beqi	%v1, 3, bnei_else.94978
	beqi	%v1, 4, bnei_else.94980
	j	bnei_cont.94975
bnei_else.94980:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.94982
	addi	%v1, %zero, 0
	j	fbgt_cont.94983
fbgt_else.94982:
	addi	%v1, %zero, 1
fbgt_cont.94983:
	beqi	%v1, 0, bnei_else.94984
	flw	%f0, 462(%zero)
	j	bnei_cont.94985
bnei_else.94984:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 82(%sp)
	fblt	%f0, %f1, fbgt_else.94986
	addi	%v1, %zero, 1
	j	fbgt_cont.94987
fbgt_else.94986:
	addi	%v1, %zero, 0
fbgt_cont.94987:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.94988
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.94990
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.94991
fbgt_else.94990:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.94991:
	beqi	%v1, 0, bnei_else.94992
	j	fbgt_cont.94989
bnei_else.94992:
	fneg	%f0, %f0
bnei_cont.94993:
	j	fbgt_cont.94989
fbgt_else.94988:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.94989:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.94985:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.94994
	addi	%v1, %zero, 0
	j	fbgt_cont.94995
fbgt_else.94994:
	addi	%v1, %zero, 1
fbgt_cont.94995:
	beqi	%v1, 0, bnei_else.94996
	flw	%f1, 462(%zero)
	j	bnei_cont.94997
bnei_else.94996:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 82(%sp)
	fblt	%f1, %f2, fbgt_else.94998
	addi	%v1, %zero, 1
	j	fbgt_cont.94999
fbgt_else.94998:
	addi	%v1, %zero, 0
fbgt_cont.94999:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95000
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95002
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95003
fbgt_else.95002:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95003:
	beqi	%v1, 0, bnei_else.95004
	j	fbgt_cont.95001
bnei_else.95004:
	fneg	%f1, %f1
bnei_cont.95005:
	j	fbgt_cont.95001
fbgt_else.95000:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95001:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.94997:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 82(%sp)
	fblt	%f0, %f1, fbgt_else.95006
	addi	%v1, %zero, 0
	j	fbgt_cont.95007
fbgt_else.95006:
	addi	%v1, %zero, 1
fbgt_cont.95007:
	beqi	%v1, 0, bnei_else.95008
	fmov	%f0, %f1
	j	bnei_cont.95009
bnei_else.95008:
bnei_cont.95009:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.94981:
	j	bnei_cont.94975
bnei_else.94978:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 85(%sp)
	fsw	%f0, 86(%sp)
	fsw	%f2, 87(%sp)
	fblt	%f0, %f2, fbgt_else.95010
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95012
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95014
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95016
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95018
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95020
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
	j	fbgt_cont.95011
fbgt_else.95020:
	fmov	%f0, %f3
fbgt_cont.95021:
	j	fbgt_cont.95011
fbgt_else.95018:
	fmov	%f0, %f3
fbgt_cont.95019:
	j	fbgt_cont.95011
fbgt_else.95016:
	fmov	%f0, %f3
fbgt_cont.95017:
	j	fbgt_cont.95011
fbgt_else.95014:
	fmov	%f0, %f3
fbgt_cont.95015:
	j	fbgt_cont.95011
fbgt_else.95012:
	fmov	%f0, %f3
fbgt_cont.95013:
	j	fbgt_cont.95011
fbgt_else.95010:
	fmov	%f0, %f2
fbgt_cont.95011:
	flw	%f1, 86(%sp)
	flw	%f2, 87(%sp)
	fblt	%f1, %f2, fbgt_else.95022
	fblt	%f1, %f0, fbgt_else.95024
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95026
	fblt	%f1, %f0, fbgt_else.95028
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
	j	fbgt_cont.95023
fbgt_else.95028:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
fbgt_cont.95029:
	j	fbgt_cont.95023
fbgt_else.95026:
	fmov	%f0, %f1
fbgt_cont.95027:
	j	fbgt_cont.95023
fbgt_else.95024:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95030
	fblt	%f1, %f0, fbgt_else.95032
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
	j	fbgt_cont.95031
fbgt_else.95032:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
fbgt_cont.95033:
	j	fbgt_cont.95031
fbgt_else.95030:
	fmov	%f0, %f1
fbgt_cont.95031:
fbgt_cont.95025:
	j	fbgt_cont.95023
fbgt_else.95022:
	fmov	%f0, %f1
fbgt_cont.95023:
	flw	%f1, 85(%sp)
	fblt	%f0, %f1, fbgt_else.95034
	addi	%v0, %zero, 0
	j	fbgt_cont.95035
fbgt_else.95034:
	addi	%v0, %zero, 1
fbgt_cont.95035:
	fblt	%f0, %f1, fbgt_else.95036
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95037
fbgt_else.95036:
fbgt_cont.95037:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95038
	beqi	%v0, 0, bnei_else.95040
	addi	%v0, %zero, 0
	j	fbgt_cont.95039
bnei_else.95040:
	addi	%v0, %zero, 1
bnei_cont.95041:
	j	fbgt_cont.95039
fbgt_else.95038:
fbgt_cont.95039:
	fblt	%f0, %f2, fbgt_else.95042
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95043
fbgt_else.95042:
fbgt_cont.95043:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95044
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95045
fbgt_else.95044:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95045:
	beqi	%v0, 0, bnei_else.95046
	j	bnei_cont.95047
bnei_else.95046:
	fneg	%f0, %f0
bnei_cont.95047:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.94979:
	j	bnei_cont.94975
bnei_else.94976:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 82(%sp)
	fblt	%f0, %f2, fbgt_else.95048
	addi	%v1, %zero, 1
	j	fbgt_cont.95049
fbgt_else.95048:
	addi	%v1, %zero, 0
fbgt_cont.95049:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 88(%sp)
	fsw	%f1, 89(%sp)
	fsw	%f0, 90(%sp)
	fsw	%f3, 91(%sp)
	fblt	%f0, %f3, fbgt_else.95050
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95052
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95054
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95056
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95058
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95060
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.95051
fbgt_else.95060:
	fmov	%f0, %f4
fbgt_cont.95061:
	j	fbgt_cont.95051
fbgt_else.95058:
	fmov	%f0, %f4
fbgt_cont.95059:
	j	fbgt_cont.95051
fbgt_else.95056:
	fmov	%f0, %f4
fbgt_cont.95057:
	j	fbgt_cont.95051
fbgt_else.95054:
	fmov	%f0, %f4
fbgt_cont.95055:
	j	fbgt_cont.95051
fbgt_else.95052:
	fmov	%f0, %f4
fbgt_cont.95053:
	j	fbgt_cont.95051
fbgt_else.95050:
	fmov	%f0, %f3
fbgt_cont.95051:
	flw	%f1, 90(%sp)
	flw	%f2, 91(%sp)
	fblt	%f1, %f2, fbgt_else.95062
	fblt	%f1, %f0, fbgt_else.95064
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95066
	fblt	%f1, %f0, fbgt_else.95068
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.95063
fbgt_else.95068:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.95069:
	j	fbgt_cont.95063
fbgt_else.95066:
	fmov	%f0, %f1
fbgt_cont.95067:
	j	fbgt_cont.95063
fbgt_else.95064:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95070
	fblt	%f1, %f0, fbgt_else.95072
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.95071
fbgt_else.95072:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.95073:
	j	fbgt_cont.95071
fbgt_else.95070:
	fmov	%f0, %f1
fbgt_cont.95071:
fbgt_cont.95065:
	j	fbgt_cont.95063
fbgt_else.95062:
	fmov	%f0, %f1
fbgt_cont.95063:
	flw	%f1, 89(%sp)
	fblt	%f0, %f1, fbgt_else.95074
	lw	%v0, 88(%sp)
	beqi	%v0, 0, bnei_else.95076
	addi	%v0, %zero, 0
	j	fbgt_cont.95075
bnei_else.95076:
	addi	%v0, %zero, 1
bnei_cont.95077:
	j	fbgt_cont.95075
fbgt_else.95074:
	lw	%v0, 88(%sp)
fbgt_cont.95075:
	fblt	%f0, %f1, fbgt_else.95078
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95079
fbgt_else.95078:
fbgt_cont.95079:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95080
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95081
fbgt_else.95080:
fbgt_cont.95081:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95082
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95083
fbgt_else.95082:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95083:
	beqi	%v0, 0, bnei_else.95084
	j	bnei_cont.95085
bnei_else.95084:
	fneg	%f0, %f0
bnei_cont.95085:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.94977:
	j	bnei_cont.94975
bnei_else.94974:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95086
	addi	%v1, %zero, 0
	j	fbgt_cont.95087
fbgt_else.95086:
	addi	%v1, %zero, 1
fbgt_cont.95087:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95088
	addi	%a0, %zero, 0
	j	fbgt_cont.95089
fbgt_else.95088:
	addi	%a0, %zero, 1
fbgt_cont.95089:
	beqi	%v1, 0, bnei_else.95090
	beqi	%a0, 0, bnei_else.95092
	flw	%f0, 450(%zero)
	j	bnei_cont.95091
bnei_else.95092:
	flw	%f0, 82(%sp)
bnei_cont.95093:
	j	bnei_cont.95091
bnei_else.95090:
	beqi	%a0, 0, bnei_else.95094
	flw	%f0, 82(%sp)
	j	bnei_cont.95095
bnei_else.95094:
	flw	%f0, 450(%zero)
bnei_cont.95095:
bnei_cont.95091:
	fsw	%f0, 146(%zero)
bnei_cont.94975:
	lw	%v0, 3(%sp)
	lw	%v1, 81(%sp)
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	beqi	%v0, 0, bnei_else.95096
	j	bnei_cont.94945
bnei_else.95096:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 82(%sp)
	fblt	%f1, %f0, fbgt_else.95098
	addi	%v0, %zero, 0
	j	fbgt_cont.95099
fbgt_else.95098:
	addi	%v0, %zero, 1
fbgt_cont.95099:
	beqi	%v0, 0, bnei_else.95100
	j	bnei_cont.95101
bnei_else.95100:
	fmov	%f0, %f1
bnei_cont.95101:
	flw	%f1, 80(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 84(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95097:
	j	bnei_cont.94945
bnei_else.94952:
bnei_cont.94953:
	j	bnei_cont.94945
bnei_else.94944:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 92(%sp)
	sw	%v1, 93(%sp)
	fsw	%f1, 82(%sp)
	sw	%a0, 94(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95102
	addi	%v0, %zero, 0
	j	fbgt_cont.95103
fbgt_else.95102:
	addi	%v0, %zero, 1
fbgt_cont.95103:
	beqi	%v0, 0, bnei_else.95104
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95106
	addi	%v0, %zero, 0
	j	bnei_cont.95105
fbgt_else.95106:
	addi	%v0, %zero, 1
fbgt_cont.95107:
	j	bnei_cont.95105
bnei_else.95104:
	addi	%v0, %zero, 0
bnei_cont.95105:
	beqi	%v0, 0, bnei_else.95108
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 94(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95110
	beqi	%a0, 2, bnei_else.95112
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95114
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95115
bnei_else.95114:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95115:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 82(%sp)
	fbne	%f1, %f4, fbeq_else.95116
	addi	%a0, %zero, 1
	j	fbeq_cont.95117
fbeq_else.95116:
	addi	%a0, %zero, 0
fbeq_cont.95117:
	beqi	%a0, 0, bnei_else.95118
	flw	%f1, 491(%zero)
	j	bnei_cont.95119
bnei_else.95118:
	beqi	%v1, 0, bnei_else.95120
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95121
bnei_else.95120:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95121:
bnei_cont.95119:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95111
bnei_else.95112:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95113:
	j	bnei_cont.95111
bnei_else.95110:
	lw	%a0, 136(%zero)
	flw	%f0, 82(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95122
	addi	%v1, %zero, 1
	j	fbeq_cont.95123
fbeq_else.95122:
	addi	%v1, %zero, 0
fbeq_cont.95123:
	beqi	%v1, 0, bnei_else.95124
	fmov	%f1, %f0
	j	bnei_cont.95125
bnei_else.95124:
	fblt	%f0, %f1, fbgt_else.95126
	addi	%v1, %zero, 0
	j	fbgt_cont.95127
fbgt_else.95126:
	addi	%v1, %zero, 1
fbgt_cont.95127:
	beqi	%v1, 0, bnei_else.95128
	flw	%f1, 491(%zero)
	j	bnei_cont.95129
bnei_else.95128:
	flw	%f1, 490(%zero)
bnei_cont.95129:
bnei_cont.95125:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95111:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 95(%sp)
	beqi	%v1, 1, bnei_else.95130
	beqi	%v1, 2, bnei_else.95132
	beqi	%v1, 3, bnei_else.95134
	beqi	%v1, 4, bnei_else.95136
	j	bnei_cont.95131
bnei_else.95136:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.95138
	addi	%v1, %zero, 0
	j	fbgt_cont.95139
fbgt_else.95138:
	addi	%v1, %zero, 1
fbgt_cont.95139:
	beqi	%v1, 0, bnei_else.95140
	flw	%f0, 462(%zero)
	j	bnei_cont.95141
bnei_else.95140:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 82(%sp)
	fblt	%f0, %f1, fbgt_else.95142
	addi	%v1, %zero, 1
	j	fbgt_cont.95143
fbgt_else.95142:
	addi	%v1, %zero, 0
fbgt_cont.95143:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.95144
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.95146
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.95147
fbgt_else.95146:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.95147:
	beqi	%v1, 0, bnei_else.95148
	j	fbgt_cont.95145
bnei_else.95148:
	fneg	%f0, %f0
bnei_cont.95149:
	j	fbgt_cont.95145
fbgt_else.95144:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.95145:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.95141:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.95150
	addi	%v1, %zero, 0
	j	fbgt_cont.95151
fbgt_else.95150:
	addi	%v1, %zero, 1
fbgt_cont.95151:
	beqi	%v1, 0, bnei_else.95152
	flw	%f1, 462(%zero)
	j	bnei_cont.95153
bnei_else.95152:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 82(%sp)
	fblt	%f1, %f2, fbgt_else.95154
	addi	%v1, %zero, 1
	j	fbgt_cont.95155
fbgt_else.95154:
	addi	%v1, %zero, 0
fbgt_cont.95155:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95156
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95158
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95159
fbgt_else.95158:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95159:
	beqi	%v1, 0, bnei_else.95160
	j	fbgt_cont.95157
bnei_else.95160:
	fneg	%f1, %f1
bnei_cont.95161:
	j	fbgt_cont.95157
fbgt_else.95156:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95157:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.95153:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 82(%sp)
	fblt	%f0, %f1, fbgt_else.95162
	addi	%v1, %zero, 0
	j	fbgt_cont.95163
fbgt_else.95162:
	addi	%v1, %zero, 1
fbgt_cont.95163:
	beqi	%v1, 0, bnei_else.95164
	fmov	%f0, %f1
	j	bnei_cont.95165
bnei_else.95164:
bnei_cont.95165:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.95137:
	j	bnei_cont.95131
bnei_else.95134:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 96(%sp)
	fsw	%f0, 97(%sp)
	fsw	%f2, 98(%sp)
	fblt	%f0, %f2, fbgt_else.95166
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95168
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95170
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95172
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95174
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95176
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	fbgt_cont.95167
fbgt_else.95176:
	fmov	%f0, %f3
fbgt_cont.95177:
	j	fbgt_cont.95167
fbgt_else.95174:
	fmov	%f0, %f3
fbgt_cont.95175:
	j	fbgt_cont.95167
fbgt_else.95172:
	fmov	%f0, %f3
fbgt_cont.95173:
	j	fbgt_cont.95167
fbgt_else.95170:
	fmov	%f0, %f3
fbgt_cont.95171:
	j	fbgt_cont.95167
fbgt_else.95168:
	fmov	%f0, %f3
fbgt_cont.95169:
	j	fbgt_cont.95167
fbgt_else.95166:
	fmov	%f0, %f2
fbgt_cont.95167:
	flw	%f1, 97(%sp)
	flw	%f2, 98(%sp)
	fblt	%f1, %f2, fbgt_else.95178
	fblt	%f1, %f0, fbgt_else.95180
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95182
	fblt	%f1, %f0, fbgt_else.95184
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	fbgt_cont.95179
fbgt_else.95184:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
fbgt_cont.95185:
	j	fbgt_cont.95179
fbgt_else.95182:
	fmov	%f0, %f1
fbgt_cont.95183:
	j	fbgt_cont.95179
fbgt_else.95180:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95186
	fblt	%f1, %f0, fbgt_else.95188
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	fbgt_cont.95187
fbgt_else.95188:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
fbgt_cont.95189:
	j	fbgt_cont.95187
fbgt_else.95186:
	fmov	%f0, %f1
fbgt_cont.95187:
fbgt_cont.95181:
	j	fbgt_cont.95179
fbgt_else.95178:
	fmov	%f0, %f1
fbgt_cont.95179:
	flw	%f1, 96(%sp)
	fblt	%f0, %f1, fbgt_else.95190
	addi	%v0, %zero, 0
	j	fbgt_cont.95191
fbgt_else.95190:
	addi	%v0, %zero, 1
fbgt_cont.95191:
	fblt	%f0, %f1, fbgt_else.95192
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95193
fbgt_else.95192:
fbgt_cont.95193:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95194
	beqi	%v0, 0, bnei_else.95196
	addi	%v0, %zero, 0
	j	fbgt_cont.95195
bnei_else.95196:
	addi	%v0, %zero, 1
bnei_cont.95197:
	j	fbgt_cont.95195
fbgt_else.95194:
fbgt_cont.95195:
	fblt	%f0, %f2, fbgt_else.95198
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95199
fbgt_else.95198:
fbgt_cont.95199:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95200
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95201
fbgt_else.95200:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95201:
	beqi	%v0, 0, bnei_else.95202
	j	bnei_cont.95203
bnei_else.95202:
	fneg	%f0, %f0
bnei_cont.95203:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95135:
	j	bnei_cont.95131
bnei_else.95132:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 82(%sp)
	fblt	%f0, %f2, fbgt_else.95204
	addi	%v1, %zero, 1
	j	fbgt_cont.95205
fbgt_else.95204:
	addi	%v1, %zero, 0
fbgt_cont.95205:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 99(%sp)
	fsw	%f1, 100(%sp)
	fsw	%f0, 101(%sp)
	fsw	%f3, 102(%sp)
	fblt	%f0, %f3, fbgt_else.95206
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95208
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95210
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95212
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95214
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95216
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	j	fbgt_cont.95207
fbgt_else.95216:
	fmov	%f0, %f4
fbgt_cont.95217:
	j	fbgt_cont.95207
fbgt_else.95214:
	fmov	%f0, %f4
fbgt_cont.95215:
	j	fbgt_cont.95207
fbgt_else.95212:
	fmov	%f0, %f4
fbgt_cont.95213:
	j	fbgt_cont.95207
fbgt_else.95210:
	fmov	%f0, %f4
fbgt_cont.95211:
	j	fbgt_cont.95207
fbgt_else.95208:
	fmov	%f0, %f4
fbgt_cont.95209:
	j	fbgt_cont.95207
fbgt_else.95206:
	fmov	%f0, %f3
fbgt_cont.95207:
	flw	%f1, 101(%sp)
	flw	%f2, 102(%sp)
	fblt	%f1, %f2, fbgt_else.95218
	fblt	%f1, %f0, fbgt_else.95220
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95222
	fblt	%f1, %f0, fbgt_else.95224
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	j	fbgt_cont.95219
fbgt_else.95224:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
fbgt_cont.95225:
	j	fbgt_cont.95219
fbgt_else.95222:
	fmov	%f0, %f1
fbgt_cont.95223:
	j	fbgt_cont.95219
fbgt_else.95220:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95226
	fblt	%f1, %f0, fbgt_else.95228
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	j	fbgt_cont.95227
fbgt_else.95228:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
fbgt_cont.95229:
	j	fbgt_cont.95227
fbgt_else.95226:
	fmov	%f0, %f1
fbgt_cont.95227:
fbgt_cont.95221:
	j	fbgt_cont.95219
fbgt_else.95218:
	fmov	%f0, %f1
fbgt_cont.95219:
	flw	%f1, 100(%sp)
	fblt	%f0, %f1, fbgt_else.95230
	lw	%v0, 99(%sp)
	beqi	%v0, 0, bnei_else.95232
	addi	%v0, %zero, 0
	j	fbgt_cont.95231
bnei_else.95232:
	addi	%v0, %zero, 1
bnei_cont.95233:
	j	fbgt_cont.95231
fbgt_else.95230:
	lw	%v0, 99(%sp)
fbgt_cont.95231:
	fblt	%f0, %f1, fbgt_else.95234
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95235
fbgt_else.95234:
fbgt_cont.95235:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95236
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95237
fbgt_else.95236:
fbgt_cont.95237:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95238
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95239
fbgt_else.95238:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95239:
	beqi	%v0, 0, bnei_else.95240
	j	bnei_cont.95241
bnei_else.95240:
	fneg	%f0, %f0
bnei_cont.95241:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95133:
	j	bnei_cont.95131
bnei_else.95130:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95242
	addi	%v1, %zero, 0
	j	fbgt_cont.95243
fbgt_else.95242:
	addi	%v1, %zero, 1
fbgt_cont.95243:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95244
	addi	%a0, %zero, 0
	j	fbgt_cont.95245
fbgt_else.95244:
	addi	%a0, %zero, 1
fbgt_cont.95245:
	beqi	%v1, 0, bnei_else.95246
	beqi	%a0, 0, bnei_else.95248
	flw	%f0, 450(%zero)
	j	bnei_cont.95247
bnei_else.95248:
	flw	%f0, 82(%sp)
bnei_cont.95249:
	j	bnei_cont.95247
bnei_else.95246:
	beqi	%a0, 0, bnei_else.95250
	flw	%f0, 82(%sp)
	j	bnei_cont.95251
bnei_else.95250:
	flw	%f0, 450(%zero)
bnei_cont.95251:
bnei_cont.95247:
	fsw	%f0, 146(%zero)
bnei_cont.95131:
	lw	%v0, 3(%sp)
	lw	%v1, 93(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	beqi	%v0, 0, bnei_else.95252
	j	bnei_cont.95109
bnei_else.95252:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 82(%sp)
	fblt	%f1, %f0, fbgt_else.95254
	addi	%v0, %zero, 0
	j	fbgt_cont.95255
fbgt_else.95254:
	addi	%v0, %zero, 1
fbgt_cont.95255:
	beqi	%v0, 0, bnei_else.95256
	j	bnei_cont.95257
bnei_else.95256:
	fmov	%f0, %f1
bnei_cont.95257:
	flw	%f1, 92(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 95(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95253:
	j	bnei_cont.95109
bnei_else.95108:
bnei_cont.95109:
bnei_cont.94945:
	addi	%a1, %zero, 116
	lw	%v0, 79(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	j	bnei_cont.94941
bnei_else.94940:
bnei_cont.94941:
	lw	%v0, 6(%sp)
	beqi	%v0, 4, bnei_else.95258
	lw	%v0, 183(%zero)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 103(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 104(%sp)
	addi	%sp, %sp, 105
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -105
	lw	%ra, 104(%sp)
	lw	%v0, 103(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 4(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.95260
	addi	%v1, %zero, 0
	j	fbgt_cont.95261
fbgt_else.95260:
	addi	%v1, %zero, 1
fbgt_cont.95261:
	beqi	%v1, 0, bnei_else.95262
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 104(%sp)
	sw	%v1, 105(%sp)
	fsw	%f1, 106(%sp)
	sw	%a0, 107(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95264
	addi	%v0, %zero, 0
	j	fbgt_cont.95265
fbgt_else.95264:
	addi	%v0, %zero, 1
fbgt_cont.95265:
	beqi	%v0, 0, bnei_else.95266
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95268
	addi	%v0, %zero, 0
	j	bnei_cont.95267
fbgt_else.95268:
	addi	%v0, %zero, 1
fbgt_cont.95269:
	j	bnei_cont.95267
bnei_else.95266:
	addi	%v0, %zero, 0
bnei_cont.95267:
	beqi	%v0, 0, bnei_else.95270
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 107(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95272
	beqi	%a0, 2, bnei_else.95274
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95276
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95277
bnei_else.95276:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95277:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 106(%sp)
	fbne	%f1, %f4, fbeq_else.95278
	addi	%a0, %zero, 1
	j	fbeq_cont.95279
fbeq_else.95278:
	addi	%a0, %zero, 0
fbeq_cont.95279:
	beqi	%a0, 0, bnei_else.95280
	flw	%f1, 491(%zero)
	j	bnei_cont.95281
bnei_else.95280:
	beqi	%v1, 0, bnei_else.95282
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95283
bnei_else.95282:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95283:
bnei_cont.95281:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95273
bnei_else.95274:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95275:
	j	bnei_cont.95273
bnei_else.95272:
	lw	%a0, 136(%zero)
	flw	%f0, 106(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95284
	addi	%v1, %zero, 1
	j	fbeq_cont.95285
fbeq_else.95284:
	addi	%v1, %zero, 0
fbeq_cont.95285:
	beqi	%v1, 0, bnei_else.95286
	fmov	%f1, %f0
	j	bnei_cont.95287
bnei_else.95286:
	fblt	%f0, %f1, fbgt_else.95288
	addi	%v1, %zero, 0
	j	fbgt_cont.95289
fbgt_else.95288:
	addi	%v1, %zero, 1
fbgt_cont.95289:
	beqi	%v1, 0, bnei_else.95290
	flw	%f1, 491(%zero)
	j	bnei_cont.95291
bnei_else.95290:
	flw	%f1, 490(%zero)
bnei_cont.95291:
bnei_cont.95287:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95273:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 108(%sp)
	beqi	%v1, 1, bnei_else.95292
	beqi	%v1, 2, bnei_else.95294
	beqi	%v1, 3, bnei_else.95296
	beqi	%v1, 4, bnei_else.95298
	j	bnei_cont.95293
bnei_else.95298:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.95300
	addi	%v1, %zero, 0
	j	fbgt_cont.95301
fbgt_else.95300:
	addi	%v1, %zero, 1
fbgt_cont.95301:
	beqi	%v1, 0, bnei_else.95302
	flw	%f0, 462(%zero)
	j	bnei_cont.95303
bnei_else.95302:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 106(%sp)
	fblt	%f0, %f1, fbgt_else.95304
	addi	%v1, %zero, 1
	j	fbgt_cont.95305
fbgt_else.95304:
	addi	%v1, %zero, 0
fbgt_cont.95305:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.95306
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.95308
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.95309
fbgt_else.95308:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.95309:
	beqi	%v1, 0, bnei_else.95310
	j	fbgt_cont.95307
bnei_else.95310:
	fneg	%f0, %f0
bnei_cont.95311:
	j	fbgt_cont.95307
fbgt_else.95306:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.95307:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.95303:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.95312
	addi	%v1, %zero, 0
	j	fbgt_cont.95313
fbgt_else.95312:
	addi	%v1, %zero, 1
fbgt_cont.95313:
	beqi	%v1, 0, bnei_else.95314
	flw	%f1, 462(%zero)
	j	bnei_cont.95315
bnei_else.95314:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 106(%sp)
	fblt	%f1, %f2, fbgt_else.95316
	addi	%v1, %zero, 1
	j	fbgt_cont.95317
fbgt_else.95316:
	addi	%v1, %zero, 0
fbgt_cont.95317:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95318
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95320
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95321
fbgt_else.95320:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95321:
	beqi	%v1, 0, bnei_else.95322
	j	fbgt_cont.95319
bnei_else.95322:
	fneg	%f1, %f1
bnei_cont.95323:
	j	fbgt_cont.95319
fbgt_else.95318:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95319:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.95315:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 106(%sp)
	fblt	%f0, %f1, fbgt_else.95324
	addi	%v1, %zero, 0
	j	fbgt_cont.95325
fbgt_else.95324:
	addi	%v1, %zero, 1
fbgt_cont.95325:
	beqi	%v1, 0, bnei_else.95326
	fmov	%f0, %f1
	j	bnei_cont.95327
bnei_else.95326:
bnei_cont.95327:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.95299:
	j	bnei_cont.95293
bnei_else.95296:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 109(%sp)
	fsw	%f0, 110(%sp)
	fsw	%f2, 111(%sp)
	fblt	%f0, %f2, fbgt_else.95328
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95330
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95332
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95334
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95336
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95338
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	fbgt_cont.95329
fbgt_else.95338:
	fmov	%f0, %f3
fbgt_cont.95339:
	j	fbgt_cont.95329
fbgt_else.95336:
	fmov	%f0, %f3
fbgt_cont.95337:
	j	fbgt_cont.95329
fbgt_else.95334:
	fmov	%f0, %f3
fbgt_cont.95335:
	j	fbgt_cont.95329
fbgt_else.95332:
	fmov	%f0, %f3
fbgt_cont.95333:
	j	fbgt_cont.95329
fbgt_else.95330:
	fmov	%f0, %f3
fbgt_cont.95331:
	j	fbgt_cont.95329
fbgt_else.95328:
	fmov	%f0, %f2
fbgt_cont.95329:
	flw	%f1, 110(%sp)
	flw	%f2, 111(%sp)
	fblt	%f1, %f2, fbgt_else.95340
	fblt	%f1, %f0, fbgt_else.95342
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95344
	fblt	%f1, %f0, fbgt_else.95346
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	fbgt_cont.95341
fbgt_else.95346:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
fbgt_cont.95347:
	j	fbgt_cont.95341
fbgt_else.95344:
	fmov	%f0, %f1
fbgt_cont.95345:
	j	fbgt_cont.95341
fbgt_else.95342:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95348
	fblt	%f1, %f0, fbgt_else.95350
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	fbgt_cont.95349
fbgt_else.95350:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
fbgt_cont.95351:
	j	fbgt_cont.95349
fbgt_else.95348:
	fmov	%f0, %f1
fbgt_cont.95349:
fbgt_cont.95343:
	j	fbgt_cont.95341
fbgt_else.95340:
	fmov	%f0, %f1
fbgt_cont.95341:
	flw	%f1, 109(%sp)
	fblt	%f0, %f1, fbgt_else.95352
	addi	%v0, %zero, 0
	j	fbgt_cont.95353
fbgt_else.95352:
	addi	%v0, %zero, 1
fbgt_cont.95353:
	fblt	%f0, %f1, fbgt_else.95354
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95355
fbgt_else.95354:
fbgt_cont.95355:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95356
	beqi	%v0, 0, bnei_else.95358
	addi	%v0, %zero, 0
	j	fbgt_cont.95357
bnei_else.95358:
	addi	%v0, %zero, 1
bnei_cont.95359:
	j	fbgt_cont.95357
fbgt_else.95356:
fbgt_cont.95357:
	fblt	%f0, %f2, fbgt_else.95360
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95361
fbgt_else.95360:
fbgt_cont.95361:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95362
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95363
fbgt_else.95362:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95363:
	beqi	%v0, 0, bnei_else.95364
	j	bnei_cont.95365
bnei_else.95364:
	fneg	%f0, %f0
bnei_cont.95365:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95297:
	j	bnei_cont.95293
bnei_else.95294:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 106(%sp)
	fblt	%f0, %f2, fbgt_else.95366
	addi	%v1, %zero, 1
	j	fbgt_cont.95367
fbgt_else.95366:
	addi	%v1, %zero, 0
fbgt_cont.95367:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 112(%sp)
	fsw	%f1, 113(%sp)
	fsw	%f0, 114(%sp)
	fsw	%f3, 115(%sp)
	fblt	%f0, %f3, fbgt_else.95368
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95370
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95372
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95374
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95376
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95378
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	j	fbgt_cont.95369
fbgt_else.95378:
	fmov	%f0, %f4
fbgt_cont.95379:
	j	fbgt_cont.95369
fbgt_else.95376:
	fmov	%f0, %f4
fbgt_cont.95377:
	j	fbgt_cont.95369
fbgt_else.95374:
	fmov	%f0, %f4
fbgt_cont.95375:
	j	fbgt_cont.95369
fbgt_else.95372:
	fmov	%f0, %f4
fbgt_cont.95373:
	j	fbgt_cont.95369
fbgt_else.95370:
	fmov	%f0, %f4
fbgt_cont.95371:
	j	fbgt_cont.95369
fbgt_else.95368:
	fmov	%f0, %f3
fbgt_cont.95369:
	flw	%f1, 114(%sp)
	flw	%f2, 115(%sp)
	fblt	%f1, %f2, fbgt_else.95380
	fblt	%f1, %f0, fbgt_else.95382
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95384
	fblt	%f1, %f0, fbgt_else.95386
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	j	fbgt_cont.95381
fbgt_else.95386:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
fbgt_cont.95387:
	j	fbgt_cont.95381
fbgt_else.95384:
	fmov	%f0, %f1
fbgt_cont.95385:
	j	fbgt_cont.95381
fbgt_else.95382:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95388
	fblt	%f1, %f0, fbgt_else.95390
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	j	fbgt_cont.95389
fbgt_else.95390:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
fbgt_cont.95391:
	j	fbgt_cont.95389
fbgt_else.95388:
	fmov	%f0, %f1
fbgt_cont.95389:
fbgt_cont.95383:
	j	fbgt_cont.95381
fbgt_else.95380:
	fmov	%f0, %f1
fbgt_cont.95381:
	flw	%f1, 113(%sp)
	fblt	%f0, %f1, fbgt_else.95392
	lw	%v0, 112(%sp)
	beqi	%v0, 0, bnei_else.95394
	addi	%v0, %zero, 0
	j	fbgt_cont.95393
bnei_else.95394:
	addi	%v0, %zero, 1
bnei_cont.95395:
	j	fbgt_cont.95393
fbgt_else.95392:
	lw	%v0, 112(%sp)
fbgt_cont.95393:
	fblt	%f0, %f1, fbgt_else.95396
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95397
fbgt_else.95396:
fbgt_cont.95397:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95398
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95399
fbgt_else.95398:
fbgt_cont.95399:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95400
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95401
fbgt_else.95400:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95401:
	beqi	%v0, 0, bnei_else.95402
	j	bnei_cont.95403
bnei_else.95402:
	fneg	%f0, %f0
bnei_cont.95403:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95295:
	j	bnei_cont.95293
bnei_else.95292:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95404
	addi	%v1, %zero, 0
	j	fbgt_cont.95405
fbgt_else.95404:
	addi	%v1, %zero, 1
fbgt_cont.95405:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95406
	addi	%a0, %zero, 0
	j	fbgt_cont.95407
fbgt_else.95406:
	addi	%a0, %zero, 1
fbgt_cont.95407:
	beqi	%v1, 0, bnei_else.95408
	beqi	%a0, 0, bnei_else.95410
	flw	%f0, 450(%zero)
	j	bnei_cont.95409
bnei_else.95410:
	flw	%f0, 106(%sp)
bnei_cont.95411:
	j	bnei_cont.95409
bnei_else.95408:
	beqi	%a0, 0, bnei_else.95412
	flw	%f0, 106(%sp)
	j	bnei_cont.95413
bnei_else.95412:
	flw	%f0, 450(%zero)
bnei_cont.95413:
bnei_cont.95409:
	fsw	%f0, 146(%zero)
bnei_cont.95293:
	lw	%v0, 3(%sp)
	lw	%v1, 105(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	beqi	%v0, 0, bnei_else.95414
	j	bnei_cont.95263
bnei_else.95414:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 106(%sp)
	fblt	%f1, %f0, fbgt_else.95416
	addi	%v0, %zero, 0
	j	fbgt_cont.95417
fbgt_else.95416:
	addi	%v0, %zero, 1
fbgt_cont.95417:
	beqi	%v0, 0, bnei_else.95418
	j	bnei_cont.95419
bnei_else.95418:
	fmov	%f0, %f1
bnei_cont.95419:
	flw	%f1, 104(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 108(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95415:
	j	bnei_cont.95263
bnei_else.95270:
bnei_cont.95271:
	j	bnei_cont.95263
bnei_else.95262:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 3(%sp)
	fsw	%f0, 116(%sp)
	sw	%v1, 117(%sp)
	fsw	%f1, 106(%sp)
	sw	%a0, 118(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 119(%sp)
	addi	%sp, %sp, 120
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -120
	lw	%ra, 119(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95420
	addi	%v0, %zero, 0
	j	fbgt_cont.95421
fbgt_else.95420:
	addi	%v0, %zero, 1
fbgt_cont.95421:
	beqi	%v0, 0, bnei_else.95422
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95424
	addi	%v0, %zero, 0
	j	bnei_cont.95423
fbgt_else.95424:
	addi	%v0, %zero, 1
fbgt_cont.95425:
	j	bnei_cont.95423
bnei_else.95422:
	addi	%v0, %zero, 0
bnei_cont.95423:
	beqi	%v0, 0, bnei_else.95426
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 118(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95428
	beqi	%a0, 2, bnei_else.95430
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95432
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95433
bnei_else.95432:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95433:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 106(%sp)
	fbne	%f1, %f4, fbeq_else.95434
	addi	%a0, %zero, 1
	j	fbeq_cont.95435
fbeq_else.95434:
	addi	%a0, %zero, 0
fbeq_cont.95435:
	beqi	%a0, 0, bnei_else.95436
	flw	%f1, 491(%zero)
	j	bnei_cont.95437
bnei_else.95436:
	beqi	%v1, 0, bnei_else.95438
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95439
bnei_else.95438:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95439:
bnei_cont.95437:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95429
bnei_else.95430:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95431:
	j	bnei_cont.95429
bnei_else.95428:
	lw	%a0, 136(%zero)
	flw	%f0, 106(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95440
	addi	%v1, %zero, 1
	j	fbeq_cont.95441
fbeq_else.95440:
	addi	%v1, %zero, 0
fbeq_cont.95441:
	beqi	%v1, 0, bnei_else.95442
	fmov	%f1, %f0
	j	bnei_cont.95443
bnei_else.95442:
	fblt	%f0, %f1, fbgt_else.95444
	addi	%v1, %zero, 0
	j	fbgt_cont.95445
fbgt_else.95444:
	addi	%v1, %zero, 1
fbgt_cont.95445:
	beqi	%v1, 0, bnei_else.95446
	flw	%f1, 491(%zero)
	j	bnei_cont.95447
bnei_else.95446:
	flw	%f1, 490(%zero)
bnei_cont.95447:
bnei_cont.95443:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95429:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 119(%sp)
	beqi	%v1, 1, bnei_else.95448
	beqi	%v1, 2, bnei_else.95450
	beqi	%v1, 3, bnei_else.95452
	beqi	%v1, 4, bnei_else.95454
	j	bnei_cont.95449
bnei_else.95454:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.95456
	addi	%v1, %zero, 0
	j	fbgt_cont.95457
fbgt_else.95456:
	addi	%v1, %zero, 1
fbgt_cont.95457:
	beqi	%v1, 0, bnei_else.95458
	flw	%f0, 462(%zero)
	j	bnei_cont.95459
bnei_else.95458:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 106(%sp)
	fblt	%f0, %f1, fbgt_else.95460
	addi	%v1, %zero, 1
	j	fbgt_cont.95461
fbgt_else.95460:
	addi	%v1, %zero, 0
fbgt_cont.95461:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.95462
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.95464
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.95465
fbgt_else.95464:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.95465:
	beqi	%v1, 0, bnei_else.95466
	j	fbgt_cont.95463
bnei_else.95466:
	fneg	%f0, %f0
bnei_cont.95467:
	j	fbgt_cont.95463
fbgt_else.95462:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.95463:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.95459:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.95468
	addi	%v1, %zero, 0
	j	fbgt_cont.95469
fbgt_else.95468:
	addi	%v1, %zero, 1
fbgt_cont.95469:
	beqi	%v1, 0, bnei_else.95470
	flw	%f1, 462(%zero)
	j	bnei_cont.95471
bnei_else.95470:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 106(%sp)
	fblt	%f1, %f2, fbgt_else.95472
	addi	%v1, %zero, 1
	j	fbgt_cont.95473
fbgt_else.95472:
	addi	%v1, %zero, 0
fbgt_cont.95473:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95474
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95476
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95477
fbgt_else.95476:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95477:
	beqi	%v1, 0, bnei_else.95478
	j	fbgt_cont.95475
bnei_else.95478:
	fneg	%f1, %f1
bnei_cont.95479:
	j	fbgt_cont.95475
fbgt_else.95474:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95475:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.95471:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 106(%sp)
	fblt	%f0, %f1, fbgt_else.95480
	addi	%v1, %zero, 0
	j	fbgt_cont.95481
fbgt_else.95480:
	addi	%v1, %zero, 1
fbgt_cont.95481:
	beqi	%v1, 0, bnei_else.95482
	fmov	%f0, %f1
	j	bnei_cont.95483
bnei_else.95482:
bnei_cont.95483:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.95455:
	j	bnei_cont.95449
bnei_else.95452:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 120(%sp)
	fsw	%f0, 121(%sp)
	fsw	%f2, 122(%sp)
	fblt	%f0, %f2, fbgt_else.95484
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95486
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95488
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95490
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95492
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95494
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 123(%sp)
	addi	%sp, %sp, 124
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -124
	lw	%ra, 123(%sp)
	j	fbgt_cont.95485
fbgt_else.95494:
	fmov	%f0, %f3
fbgt_cont.95495:
	j	fbgt_cont.95485
fbgt_else.95492:
	fmov	%f0, %f3
fbgt_cont.95493:
	j	fbgt_cont.95485
fbgt_else.95490:
	fmov	%f0, %f3
fbgt_cont.95491:
	j	fbgt_cont.95485
fbgt_else.95488:
	fmov	%f0, %f3
fbgt_cont.95489:
	j	fbgt_cont.95485
fbgt_else.95486:
	fmov	%f0, %f3
fbgt_cont.95487:
	j	fbgt_cont.95485
fbgt_else.95484:
	fmov	%f0, %f2
fbgt_cont.95485:
	flw	%f1, 121(%sp)
	flw	%f2, 122(%sp)
	fblt	%f1, %f2, fbgt_else.95496
	fblt	%f1, %f0, fbgt_else.95498
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95500
	fblt	%f1, %f0, fbgt_else.95502
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 123(%sp)
	addi	%sp, %sp, 124
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -124
	lw	%ra, 123(%sp)
	j	fbgt_cont.95497
fbgt_else.95502:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 123(%sp)
	addi	%sp, %sp, 124
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -124
	lw	%ra, 123(%sp)
fbgt_cont.95503:
	j	fbgt_cont.95497
fbgt_else.95500:
	fmov	%f0, %f1
fbgt_cont.95501:
	j	fbgt_cont.95497
fbgt_else.95498:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95504
	fblt	%f1, %f0, fbgt_else.95506
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 123(%sp)
	addi	%sp, %sp, 124
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -124
	lw	%ra, 123(%sp)
	j	fbgt_cont.95505
fbgt_else.95506:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 123(%sp)
	addi	%sp, %sp, 124
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -124
	lw	%ra, 123(%sp)
fbgt_cont.95507:
	j	fbgt_cont.95505
fbgt_else.95504:
	fmov	%f0, %f1
fbgt_cont.95505:
fbgt_cont.95499:
	j	fbgt_cont.95497
fbgt_else.95496:
	fmov	%f0, %f1
fbgt_cont.95497:
	flw	%f1, 120(%sp)
	fblt	%f0, %f1, fbgt_else.95508
	addi	%v0, %zero, 0
	j	fbgt_cont.95509
fbgt_else.95508:
	addi	%v0, %zero, 1
fbgt_cont.95509:
	fblt	%f0, %f1, fbgt_else.95510
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95511
fbgt_else.95510:
fbgt_cont.95511:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95512
	beqi	%v0, 0, bnei_else.95514
	addi	%v0, %zero, 0
	j	fbgt_cont.95513
bnei_else.95514:
	addi	%v0, %zero, 1
bnei_cont.95515:
	j	fbgt_cont.95513
fbgt_else.95512:
fbgt_cont.95513:
	fblt	%f0, %f2, fbgt_else.95516
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95517
fbgt_else.95516:
fbgt_cont.95517:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95518
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95519
fbgt_else.95518:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95519:
	beqi	%v0, 0, bnei_else.95520
	j	bnei_cont.95521
bnei_else.95520:
	fneg	%f0, %f0
bnei_cont.95521:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95453:
	j	bnei_cont.95449
bnei_else.95450:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 106(%sp)
	fblt	%f0, %f2, fbgt_else.95522
	addi	%v1, %zero, 1
	j	fbgt_cont.95523
fbgt_else.95522:
	addi	%v1, %zero, 0
fbgt_cont.95523:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 123(%sp)
	fsw	%f1, 124(%sp)
	fsw	%f0, 125(%sp)
	fsw	%f3, 126(%sp)
	fblt	%f0, %f3, fbgt_else.95524
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95526
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95528
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95530
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95532
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95534
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	j	fbgt_cont.95525
fbgt_else.95534:
	fmov	%f0, %f4
fbgt_cont.95535:
	j	fbgt_cont.95525
fbgt_else.95532:
	fmov	%f0, %f4
fbgt_cont.95533:
	j	fbgt_cont.95525
fbgt_else.95530:
	fmov	%f0, %f4
fbgt_cont.95531:
	j	fbgt_cont.95525
fbgt_else.95528:
	fmov	%f0, %f4
fbgt_cont.95529:
	j	fbgt_cont.95525
fbgt_else.95526:
	fmov	%f0, %f4
fbgt_cont.95527:
	j	fbgt_cont.95525
fbgt_else.95524:
	fmov	%f0, %f3
fbgt_cont.95525:
	flw	%f1, 125(%sp)
	flw	%f2, 126(%sp)
	fblt	%f1, %f2, fbgt_else.95536
	fblt	%f1, %f0, fbgt_else.95538
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95540
	fblt	%f1, %f0, fbgt_else.95542
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	j	fbgt_cont.95537
fbgt_else.95542:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
fbgt_cont.95543:
	j	fbgt_cont.95537
fbgt_else.95540:
	fmov	%f0, %f1
fbgt_cont.95541:
	j	fbgt_cont.95537
fbgt_else.95538:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95544
	fblt	%f1, %f0, fbgt_else.95546
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	j	fbgt_cont.95545
fbgt_else.95546:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
fbgt_cont.95547:
	j	fbgt_cont.95545
fbgt_else.95544:
	fmov	%f0, %f1
fbgt_cont.95545:
fbgt_cont.95539:
	j	fbgt_cont.95537
fbgt_else.95536:
	fmov	%f0, %f1
fbgt_cont.95537:
	flw	%f1, 124(%sp)
	fblt	%f0, %f1, fbgt_else.95548
	lw	%v0, 123(%sp)
	beqi	%v0, 0, bnei_else.95550
	addi	%v0, %zero, 0
	j	fbgt_cont.95549
bnei_else.95550:
	addi	%v0, %zero, 1
bnei_cont.95551:
	j	fbgt_cont.95549
fbgt_else.95548:
	lw	%v0, 123(%sp)
fbgt_cont.95549:
	fblt	%f0, %f1, fbgt_else.95552
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95553
fbgt_else.95552:
fbgt_cont.95553:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95554
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95555
fbgt_else.95554:
fbgt_cont.95555:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95556
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95557
fbgt_else.95556:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95557:
	beqi	%v0, 0, bnei_else.95558
	j	bnei_cont.95559
bnei_else.95558:
	fneg	%f0, %f0
bnei_cont.95559:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95451:
	j	bnei_cont.95449
bnei_else.95448:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95560
	addi	%v1, %zero, 0
	j	fbgt_cont.95561
fbgt_else.95560:
	addi	%v1, %zero, 1
fbgt_cont.95561:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95562
	addi	%a0, %zero, 0
	j	fbgt_cont.95563
fbgt_else.95562:
	addi	%a0, %zero, 1
fbgt_cont.95563:
	beqi	%v1, 0, bnei_else.95564
	beqi	%a0, 0, bnei_else.95566
	flw	%f0, 450(%zero)
	j	bnei_cont.95565
bnei_else.95566:
	flw	%f0, 106(%sp)
bnei_cont.95567:
	j	bnei_cont.95565
bnei_else.95564:
	beqi	%a0, 0, bnei_else.95568
	flw	%f0, 106(%sp)
	j	bnei_cont.95569
bnei_else.95568:
	flw	%f0, 450(%zero)
bnei_cont.95569:
bnei_cont.95565:
	fsw	%f0, 146(%zero)
bnei_cont.95449:
	lw	%v0, 3(%sp)
	lw	%v1, 117(%sp)
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	beqi	%v0, 0, bnei_else.95570
	j	bnei_cont.95427
bnei_else.95570:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 106(%sp)
	fblt	%f1, %f0, fbgt_else.95572
	addi	%v0, %zero, 0
	j	fbgt_cont.95573
fbgt_else.95572:
	addi	%v0, %zero, 1
fbgt_cont.95573:
	beqi	%v0, 0, bnei_else.95574
	j	bnei_cont.95575
bnei_else.95574:
	fmov	%f0, %f1
bnei_cont.95575:
	flw	%f1, 116(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 119(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95571:
	j	bnei_cont.95427
bnei_else.95426:
bnei_cont.95427:
bnei_cont.95263:
	addi	%a1, %zero, 116
	lw	%v0, 103(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	j	bnei_cont.95259
bnei_else.95258:
bnei_cont.95259:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.93985
bnei_else.93984:
bnei_cont.93985:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.93983:
	jr	%ra
bgt_else.93982:
	jr	%ra
bgti_else.93955:
	jr	%ra
bgt_else.93954:
	jr	%ra
pretrace_diffuse_rays.3031:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.95580
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.95581
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.95582
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 493(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.95583
bnei_else.95582:
bnei_cont.95583:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.95584
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.95585
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.95586
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 493(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f1, 0(%a2)
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 6(%sp)
	fsw	%f0, 7(%sp)
	sw	%a1, 8(%sp)
	sw	%a0, 9(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 8(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 7(%sp)
	fblt	%f0, %f1, fbgt_else.95588
	addi	%a0, %zero, 0
	j	fbgt_cont.95589
fbgt_else.95588:
	addi	%a0, %zero, 1
fbgt_cont.95589:
	beqi	%a0, 0, bnei_else.95590
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.95591
bnei_else.95590:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.95591:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.95587
bnei_else.95586:
bnei_cont.95587:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3031
bgti_else.95585:
	jr	%ra
bgt_else.95584:
	jr	%ra
bgti_else.95581:
	jr	%ra
bgt_else.95580:
	jr	%ra
pretrace_pixels.3034:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.95596
	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	flw	%f4, 165(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	fsw	%f4, 174(%zero)
	addi	%a2, %zero, 1
	flw	%f4, 166(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fsw	%f4, 175(%zero)
	flw	%f4, 167(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	fsw	%f3, 176(%zero)
	flw	%f3, 174(%zero)
	fmul	%f4, %f3, %f3
	flw	%f5, 175(%zero)
	fmul	%f6, %f5, %f5
	fadd	%f4, %f4, %f6
	flw	%f6, 176(%zero)
	fmul	%f7, %f6, %f6
	fadd	%f4, %f4, %f7
	fsqrt	%f4, %f4
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.95597
	addi	%a3, %zero, 1
	j	fbeq_cont.95598
fbeq_else.95597:
	addi	%a3, %zero, 0
fbeq_cont.95598:
	beqi	%a3, 0, bnei_else.95599
	flw	%f4, 491(%zero)
	j	bnei_cont.95600
bnei_else.95599:
	flw	%f8, 491(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.95600:
	fmul	%f3, %f3, %f4
	fsw	%f3, 174(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 175(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 176(%zero)
	fsw	%f7, 151(%zero)
	fsw	%f7, 152(%zero)
	fsw	%f7, 153(%zero)
	flw	%f3, 75(%zero)
	fsw	%f3, 159(%zero)
	flw	%f3, 76(%zero)
	fsw	%f3, 160(%zero)
	flw	%f3, 77(%zero)
	fsw	%f3, 161(%zero)
	flw	%f3, 491(%zero)
	add	%at, %v0, %v1
	lw	%a3, 0(%at)
	addi	%t0, %zero, 174
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a2, 5(%sp)
	fsw	%f7, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%a3, 8(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f7
	fmov	%f0, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_ray.2971
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 7(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.95601
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.95603
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 6(%sp)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%v1, 179(%v1)
	lw	%a1, 0(%a1)
	lw	%a2, 0(%a2)
	flw	%f1, 0(%a2)
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%a2, 9(%sp)
	sw	%a1, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 10(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.95605
	addi	%a0, %zero, 0
	j	fbgt_cont.95606
fbgt_else.95605:
	addi	%a0, %zero, 1
fbgt_cont.95606:
	beqi	%a0, 0, bnei_else.95607
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.95608
bnei_else.95607:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.95608:
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.95604
bnei_else.95603:
bnei_cont.95604:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.95602
bgti_else.95601:
bgti_cont.95602:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.95609
	addi	%a0, %v0, -5
	j	bgti_cont.95610
bgti_else.95609:
	add	%a0, %zero, %v0
bgti_cont.95610:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.95596:
	jr	%ra
scan_pixel.3045:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.95612
	jr	%ra
bgt_else.95612:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t2, 0(%t1)
	flw	%f0, 0(%t2)
	fsw	%f0, 151(%zero)
	addi	%t3, %zero, 1
	flw	%f0, 1(%t2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 153(%zero)
	lw	%t2, 155(%zero)
	addi	%t4, %v1, 1
	blt	%t4, %t2, bgt_else.95614
	addi	%t5, %zero, 0
	j	bgt_cont.95615
bgt_else.95614:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.95616
	addi	%t5, %zero, 0
	j	bgt_cont.95617
bgt_else.95616:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.95618
	addi	%t5, %zero, 0
	j	bgt_cont.95619
bgt_else.95618:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.95620
	addi	%t5, %zero, 0
	j	bgt_cont.95621
bgt_else.95620:
	addi	%t5, %zero, 1
bgt_cont.95621:
bgt_cont.95619:
bgt_cont.95617:
bgt_cont.95615:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.95622
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.95624
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t7, 2(%t6)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.95626
	add	%at, %a2, %v0
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.95628
	addi	%t7, %v0, -1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.95630
	addi	%t7, %v0, 1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.95632
	addi	%t5, %zero, 1
	j	beq_cont.95627
beq_else.95632:
	addi	%t5, %zero, 0
beq_cont.95633:
	j	beq_cont.95627
beq_else.95630:
	addi	%t5, %zero, 0
beq_cont.95631:
	j	beq_cont.95627
beq_else.95628:
	addi	%t5, %zero, 0
beq_cont.95629:
	j	beq_cont.95627
beq_else.95626:
	addi	%t5, %zero, 0
beq_cont.95627:
	beqi	%t5, 0, bnei_else.95634
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	beqi	%t5, 0, bnei_else.95636
	lw	%t5, 5(%t6)
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 5(%t6)
	lw	%t7, 5(%t1)
	addi	%s0, %v0, 1
	add	%at, %a1, %s0
	lw	%s0, 0(%at)
	lw	%s0, 5(%s0)
	add	%at, %a2, %v0
	lw	%s1, 0(%at)
	lw	%s1, 5(%s1)
	lw	%t5, 0(%t5)
	flw	%f0, 0(%t5)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t5)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%t6)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%t7)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%s0)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%s1)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t1, 4(%t1)
	lw	%t1, 0(%t1)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.95637
bnei_else.95636:
bnei_cont.95637:
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.95623
bnei_else.95634:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.95635:
	j	bnei_cont.95623
bgti_else.95624:
bgti_cont.95625:
	j	bnei_cont.95623
bnei_else.95622:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.95638
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.95640
	lw	%t5, 5(%t1)
	lw	%t6, 7(%t1)
	lw	%t7, 1(%t1)
	lw	%s0, 4(%t1)
	lw	%t5, 0(%t5)
	flw	%f0, 0(%t5)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t5)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)
	fsw	%f0, 150(%zero)
	lw	%t5, 6(%t1)
	lw	%t5, 0(%t5)
	lw	%t6, 0(%t6)
	lw	%t7, 0(%t7)
	sw	%s0, 11(%sp)
	sw	%t6, 12(%sp)
	sw	%t7, 13(%sp)
	sw	%t5, 14(%sp)
	beqi	%t5, 0, bnei_else.95642
	lw	%s1, 179(%zero)
	flw	%f0, 0(%t7)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t7)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t7)
	fsw	%f0, 164(%zero)
	lw	%s2, 0(%zero)
	addi	%s2, %s2, -1
	sw	%s1, 15(%sp)
	addi	%v1, %s2, 0
	addi	%v0, %t7, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 12(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.95644
	addi	%v1, %zero, 0
	j	fbgt_cont.95645
fbgt_else.95644:
	addi	%v1, %zero, 1
fbgt_cont.95645:
	beqi	%v1, 0, bnei_else.95646
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 16(%sp)
	sw	%v1, 17(%sp)
	fsw	%f1, 18(%sp)
	sw	%a0, 19(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95648
	addi	%v0, %zero, 0
	j	fbgt_cont.95649
fbgt_else.95648:
	addi	%v0, %zero, 1
fbgt_cont.95649:
	beqi	%v0, 0, bnei_else.95650
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95652
	addi	%v0, %zero, 0
	j	bnei_cont.95651
fbgt_else.95652:
	addi	%v0, %zero, 1
fbgt_cont.95653:
	j	bnei_cont.95651
bnei_else.95650:
	addi	%v0, %zero, 0
bnei_cont.95651:
	beqi	%v0, 0, bnei_else.95654
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 19(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95656
	beqi	%a0, 2, bnei_else.95658
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95660
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95661
bnei_else.95660:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95661:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 18(%sp)
	fbne	%f1, %f4, fbeq_else.95662
	addi	%a0, %zero, 1
	j	fbeq_cont.95663
fbeq_else.95662:
	addi	%a0, %zero, 0
fbeq_cont.95663:
	beqi	%a0, 0, bnei_else.95664
	flw	%f1, 491(%zero)
	j	bnei_cont.95665
bnei_else.95664:
	beqi	%v1, 0, bnei_else.95666
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95667
bnei_else.95666:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95667:
bnei_cont.95665:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95657
bnei_else.95658:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95659:
	j	bnei_cont.95657
bnei_else.95656:
	lw	%a0, 136(%zero)
	flw	%f0, 18(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95668
	addi	%v1, %zero, 1
	j	fbeq_cont.95669
fbeq_else.95668:
	addi	%v1, %zero, 0
fbeq_cont.95669:
	beqi	%v1, 0, bnei_else.95670
	fmov	%f1, %f0
	j	bnei_cont.95671
bnei_else.95670:
	fblt	%f0, %f1, fbgt_else.95672
	addi	%v1, %zero, 0
	j	fbgt_cont.95673
fbgt_else.95672:
	addi	%v1, %zero, 1
fbgt_cont.95673:
	beqi	%v1, 0, bnei_else.95674
	flw	%f1, 491(%zero)
	j	bnei_cont.95675
bnei_else.95674:
	flw	%f1, 490(%zero)
bnei_cont.95675:
bnei_cont.95671:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95657:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 20(%sp)
	beqi	%v1, 1, bnei_else.95676
	beqi	%v1, 2, bnei_else.95678
	beqi	%v1, 3, bnei_else.95680
	beqi	%v1, 4, bnei_else.95682
	j	bnei_cont.95677
bnei_else.95682:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.95684
	addi	%v1, %zero, 0
	j	fbgt_cont.95685
fbgt_else.95684:
	addi	%v1, %zero, 1
fbgt_cont.95685:
	beqi	%v1, 0, bnei_else.95686
	flw	%f0, 462(%zero)
	j	bnei_cont.95687
bnei_else.95686:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 18(%sp)
	fblt	%f0, %f1, fbgt_else.95688
	addi	%v1, %zero, 1
	j	fbgt_cont.95689
fbgt_else.95688:
	addi	%v1, %zero, 0
fbgt_cont.95689:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.95690
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.95692
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.95693
fbgt_else.95692:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.95693:
	beqi	%v1, 0, bnei_else.95694
	j	fbgt_cont.95691
bnei_else.95694:
	fneg	%f0, %f0
bnei_cont.95695:
	j	fbgt_cont.95691
fbgt_else.95690:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.95691:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.95687:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.95696
	addi	%v1, %zero, 0
	j	fbgt_cont.95697
fbgt_else.95696:
	addi	%v1, %zero, 1
fbgt_cont.95697:
	beqi	%v1, 0, bnei_else.95698
	flw	%f1, 462(%zero)
	j	bnei_cont.95699
bnei_else.95698:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 18(%sp)
	fblt	%f1, %f2, fbgt_else.95700
	addi	%v1, %zero, 1
	j	fbgt_cont.95701
fbgt_else.95700:
	addi	%v1, %zero, 0
fbgt_cont.95701:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95702
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95704
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95705
fbgt_else.95704:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95705:
	beqi	%v1, 0, bnei_else.95706
	j	fbgt_cont.95703
bnei_else.95706:
	fneg	%f1, %f1
bnei_cont.95707:
	j	fbgt_cont.95703
fbgt_else.95702:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95703:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.95699:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 18(%sp)
	fblt	%f0, %f1, fbgt_else.95708
	addi	%v1, %zero, 0
	j	fbgt_cont.95709
fbgt_else.95708:
	addi	%v1, %zero, 1
fbgt_cont.95709:
	beqi	%v1, 0, bnei_else.95710
	fmov	%f0, %f1
	j	bnei_cont.95711
bnei_else.95710:
bnei_cont.95711:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.95683:
	j	bnei_cont.95677
bnei_else.95680:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 21(%sp)
	fsw	%f0, 22(%sp)
	fsw	%f2, 23(%sp)
	fblt	%f0, %f2, fbgt_else.95712
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95714
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95716
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95718
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95720
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95722
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.95713
fbgt_else.95722:
	fmov	%f0, %f3
fbgt_cont.95723:
	j	fbgt_cont.95713
fbgt_else.95720:
	fmov	%f0, %f3
fbgt_cont.95721:
	j	fbgt_cont.95713
fbgt_else.95718:
	fmov	%f0, %f3
fbgt_cont.95719:
	j	fbgt_cont.95713
fbgt_else.95716:
	fmov	%f0, %f3
fbgt_cont.95717:
	j	fbgt_cont.95713
fbgt_else.95714:
	fmov	%f0, %f3
fbgt_cont.95715:
	j	fbgt_cont.95713
fbgt_else.95712:
	fmov	%f0, %f2
fbgt_cont.95713:
	flw	%f1, 22(%sp)
	flw	%f2, 23(%sp)
	fblt	%f1, %f2, fbgt_else.95724
	fblt	%f1, %f0, fbgt_else.95726
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95728
	fblt	%f1, %f0, fbgt_else.95730
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.95725
fbgt_else.95730:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.95731:
	j	fbgt_cont.95725
fbgt_else.95728:
	fmov	%f0, %f1
fbgt_cont.95729:
	j	fbgt_cont.95725
fbgt_else.95726:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95732
	fblt	%f1, %f0, fbgt_else.95734
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.95733
fbgt_else.95734:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.95735:
	j	fbgt_cont.95733
fbgt_else.95732:
	fmov	%f0, %f1
fbgt_cont.95733:
fbgt_cont.95727:
	j	fbgt_cont.95725
fbgt_else.95724:
	fmov	%f0, %f1
fbgt_cont.95725:
	flw	%f1, 21(%sp)
	fblt	%f0, %f1, fbgt_else.95736
	addi	%v0, %zero, 0
	j	fbgt_cont.95737
fbgt_else.95736:
	addi	%v0, %zero, 1
fbgt_cont.95737:
	fblt	%f0, %f1, fbgt_else.95738
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95739
fbgt_else.95738:
fbgt_cont.95739:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95740
	beqi	%v0, 0, bnei_else.95742
	addi	%v0, %zero, 0
	j	fbgt_cont.95741
bnei_else.95742:
	addi	%v0, %zero, 1
bnei_cont.95743:
	j	fbgt_cont.95741
fbgt_else.95740:
fbgt_cont.95741:
	fblt	%f0, %f2, fbgt_else.95744
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95745
fbgt_else.95744:
fbgt_cont.95745:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95746
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95747
fbgt_else.95746:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95747:
	beqi	%v0, 0, bnei_else.95748
	j	bnei_cont.95749
bnei_else.95748:
	fneg	%f0, %f0
bnei_cont.95749:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95681:
	j	bnei_cont.95677
bnei_else.95678:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 18(%sp)
	fblt	%f0, %f2, fbgt_else.95750
	addi	%v1, %zero, 1
	j	fbgt_cont.95751
fbgt_else.95750:
	addi	%v1, %zero, 0
fbgt_cont.95751:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 24(%sp)
	fsw	%f1, 25(%sp)
	fsw	%f0, 26(%sp)
	fsw	%f3, 27(%sp)
	fblt	%f0, %f3, fbgt_else.95752
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95754
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95756
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95758
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95760
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95762
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.95753
fbgt_else.95762:
	fmov	%f0, %f4
fbgt_cont.95763:
	j	fbgt_cont.95753
fbgt_else.95760:
	fmov	%f0, %f4
fbgt_cont.95761:
	j	fbgt_cont.95753
fbgt_else.95758:
	fmov	%f0, %f4
fbgt_cont.95759:
	j	fbgt_cont.95753
fbgt_else.95756:
	fmov	%f0, %f4
fbgt_cont.95757:
	j	fbgt_cont.95753
fbgt_else.95754:
	fmov	%f0, %f4
fbgt_cont.95755:
	j	fbgt_cont.95753
fbgt_else.95752:
	fmov	%f0, %f3
fbgt_cont.95753:
	flw	%f1, 26(%sp)
	flw	%f2, 27(%sp)
	fblt	%f1, %f2, fbgt_else.95764
	fblt	%f1, %f0, fbgt_else.95766
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95768
	fblt	%f1, %f0, fbgt_else.95770
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.95765
fbgt_else.95770:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.95771:
	j	fbgt_cont.95765
fbgt_else.95768:
	fmov	%f0, %f1
fbgt_cont.95769:
	j	fbgt_cont.95765
fbgt_else.95766:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95772
	fblt	%f1, %f0, fbgt_else.95774
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.95773
fbgt_else.95774:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.95775:
	j	fbgt_cont.95773
fbgt_else.95772:
	fmov	%f0, %f1
fbgt_cont.95773:
fbgt_cont.95767:
	j	fbgt_cont.95765
fbgt_else.95764:
	fmov	%f0, %f1
fbgt_cont.95765:
	flw	%f1, 25(%sp)
	fblt	%f0, %f1, fbgt_else.95776
	lw	%v0, 24(%sp)
	beqi	%v0, 0, bnei_else.95778
	addi	%v0, %zero, 0
	j	fbgt_cont.95777
bnei_else.95778:
	addi	%v0, %zero, 1
bnei_cont.95779:
	j	fbgt_cont.95777
fbgt_else.95776:
	lw	%v0, 24(%sp)
fbgt_cont.95777:
	fblt	%f0, %f1, fbgt_else.95780
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95781
fbgt_else.95780:
fbgt_cont.95781:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95782
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95783
fbgt_else.95782:
fbgt_cont.95783:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95784
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95785
fbgt_else.95784:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95785:
	beqi	%v0, 0, bnei_else.95786
	j	bnei_cont.95787
bnei_else.95786:
	fneg	%f0, %f0
bnei_cont.95787:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95679:
	j	bnei_cont.95677
bnei_else.95676:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95788
	addi	%v1, %zero, 0
	j	fbgt_cont.95789
fbgt_else.95788:
	addi	%v1, %zero, 1
fbgt_cont.95789:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95790
	addi	%a0, %zero, 0
	j	fbgt_cont.95791
fbgt_else.95790:
	addi	%a0, %zero, 1
fbgt_cont.95791:
	beqi	%v1, 0, bnei_else.95792
	beqi	%a0, 0, bnei_else.95794
	flw	%f0, 450(%zero)
	j	bnei_cont.95793
bnei_else.95794:
	flw	%f0, 18(%sp)
bnei_cont.95795:
	j	bnei_cont.95793
bnei_else.95792:
	beqi	%a0, 0, bnei_else.95796
	flw	%f0, 18(%sp)
	j	bnei_cont.95797
bnei_else.95796:
	flw	%f0, 450(%zero)
bnei_cont.95797:
bnei_cont.95793:
	fsw	%f0, 146(%zero)
bnei_cont.95677:
	lw	%v0, 2(%sp)
	lw	%v1, 17(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	beqi	%v0, 0, bnei_else.95798
	j	bnei_cont.95647
bnei_else.95798:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 18(%sp)
	fblt	%f1, %f0, fbgt_else.95800
	addi	%v0, %zero, 0
	j	fbgt_cont.95801
fbgt_else.95800:
	addi	%v0, %zero, 1
fbgt_cont.95801:
	beqi	%v0, 0, bnei_else.95802
	j	bnei_cont.95803
bnei_else.95802:
	fmov	%f0, %f1
bnei_cont.95803:
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 20(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95799:
	j	bnei_cont.95647
bnei_else.95654:
bnei_cont.95655:
	j	bnei_cont.95647
bnei_else.95646:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 28(%sp)
	sw	%v1, 29(%sp)
	fsw	%f1, 18(%sp)
	sw	%a0, 30(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95804
	addi	%v0, %zero, 0
	j	fbgt_cont.95805
fbgt_else.95804:
	addi	%v0, %zero, 1
fbgt_cont.95805:
	beqi	%v0, 0, bnei_else.95806
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95808
	addi	%v0, %zero, 0
	j	bnei_cont.95807
fbgt_else.95808:
	addi	%v0, %zero, 1
fbgt_cont.95809:
	j	bnei_cont.95807
bnei_else.95806:
	addi	%v0, %zero, 0
bnei_cont.95807:
	beqi	%v0, 0, bnei_else.95810
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 30(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95812
	beqi	%a0, 2, bnei_else.95814
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95816
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95817
bnei_else.95816:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95817:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 18(%sp)
	fbne	%f1, %f4, fbeq_else.95818
	addi	%a0, %zero, 1
	j	fbeq_cont.95819
fbeq_else.95818:
	addi	%a0, %zero, 0
fbeq_cont.95819:
	beqi	%a0, 0, bnei_else.95820
	flw	%f1, 491(%zero)
	j	bnei_cont.95821
bnei_else.95820:
	beqi	%v1, 0, bnei_else.95822
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95823
bnei_else.95822:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95823:
bnei_cont.95821:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95813
bnei_else.95814:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95815:
	j	bnei_cont.95813
bnei_else.95812:
	lw	%a0, 136(%zero)
	flw	%f0, 18(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95824
	addi	%v1, %zero, 1
	j	fbeq_cont.95825
fbeq_else.95824:
	addi	%v1, %zero, 0
fbeq_cont.95825:
	beqi	%v1, 0, bnei_else.95826
	fmov	%f1, %f0
	j	bnei_cont.95827
bnei_else.95826:
	fblt	%f0, %f1, fbgt_else.95828
	addi	%v1, %zero, 0
	j	fbgt_cont.95829
fbgt_else.95828:
	addi	%v1, %zero, 1
fbgt_cont.95829:
	beqi	%v1, 0, bnei_else.95830
	flw	%f1, 491(%zero)
	j	bnei_cont.95831
bnei_else.95830:
	flw	%f1, 490(%zero)
bnei_cont.95831:
bnei_cont.95827:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95813:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 31(%sp)
	beqi	%v1, 1, bnei_else.95832
	beqi	%v1, 2, bnei_else.95834
	beqi	%v1, 3, bnei_else.95836
	beqi	%v1, 4, bnei_else.95838
	j	bnei_cont.95833
bnei_else.95838:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.95840
	addi	%v1, %zero, 0
	j	fbgt_cont.95841
fbgt_else.95840:
	addi	%v1, %zero, 1
fbgt_cont.95841:
	beqi	%v1, 0, bnei_else.95842
	flw	%f0, 462(%zero)
	j	bnei_cont.95843
bnei_else.95842:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 18(%sp)
	fblt	%f0, %f1, fbgt_else.95844
	addi	%v1, %zero, 1
	j	fbgt_cont.95845
fbgt_else.95844:
	addi	%v1, %zero, 0
fbgt_cont.95845:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.95846
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.95848
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.95849
fbgt_else.95848:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.95849:
	beqi	%v1, 0, bnei_else.95850
	j	fbgt_cont.95847
bnei_else.95850:
	fneg	%f0, %f0
bnei_cont.95851:
	j	fbgt_cont.95847
fbgt_else.95846:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.95847:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.95843:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.95852
	addi	%v1, %zero, 0
	j	fbgt_cont.95853
fbgt_else.95852:
	addi	%v1, %zero, 1
fbgt_cont.95853:
	beqi	%v1, 0, bnei_else.95854
	flw	%f1, 462(%zero)
	j	bnei_cont.95855
bnei_else.95854:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 18(%sp)
	fblt	%f1, %f2, fbgt_else.95856
	addi	%v1, %zero, 1
	j	fbgt_cont.95857
fbgt_else.95856:
	addi	%v1, %zero, 0
fbgt_cont.95857:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.95858
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.95860
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.95861
fbgt_else.95860:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.95861:
	beqi	%v1, 0, bnei_else.95862
	j	fbgt_cont.95859
bnei_else.95862:
	fneg	%f1, %f1
bnei_cont.95863:
	j	fbgt_cont.95859
fbgt_else.95858:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.95859:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.95855:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 18(%sp)
	fblt	%f0, %f1, fbgt_else.95864
	addi	%v1, %zero, 0
	j	fbgt_cont.95865
fbgt_else.95864:
	addi	%v1, %zero, 1
fbgt_cont.95865:
	beqi	%v1, 0, bnei_else.95866
	fmov	%f0, %f1
	j	bnei_cont.95867
bnei_else.95866:
bnei_cont.95867:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.95839:
	j	bnei_cont.95833
bnei_else.95836:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 32(%sp)
	fsw	%f0, 33(%sp)
	fsw	%f2, 34(%sp)
	fblt	%f0, %f2, fbgt_else.95868
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.95870
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.95872
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.95874
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.95876
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.95878
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	fbgt_cont.95869
fbgt_else.95878:
	fmov	%f0, %f3
fbgt_cont.95879:
	j	fbgt_cont.95869
fbgt_else.95876:
	fmov	%f0, %f3
fbgt_cont.95877:
	j	fbgt_cont.95869
fbgt_else.95874:
	fmov	%f0, %f3
fbgt_cont.95875:
	j	fbgt_cont.95869
fbgt_else.95872:
	fmov	%f0, %f3
fbgt_cont.95873:
	j	fbgt_cont.95869
fbgt_else.95870:
	fmov	%f0, %f3
fbgt_cont.95871:
	j	fbgt_cont.95869
fbgt_else.95868:
	fmov	%f0, %f2
fbgt_cont.95869:
	flw	%f1, 33(%sp)
	flw	%f2, 34(%sp)
	fblt	%f1, %f2, fbgt_else.95880
	fblt	%f1, %f0, fbgt_else.95882
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95884
	fblt	%f1, %f0, fbgt_else.95886
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	fbgt_cont.95881
fbgt_else.95886:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
fbgt_cont.95887:
	j	fbgt_cont.95881
fbgt_else.95884:
	fmov	%f0, %f1
fbgt_cont.95885:
	j	fbgt_cont.95881
fbgt_else.95882:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95888
	fblt	%f1, %f0, fbgt_else.95890
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	fbgt_cont.95889
fbgt_else.95890:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
fbgt_cont.95891:
	j	fbgt_cont.95889
fbgt_else.95888:
	fmov	%f0, %f1
fbgt_cont.95889:
fbgt_cont.95883:
	j	fbgt_cont.95881
fbgt_else.95880:
	fmov	%f0, %f1
fbgt_cont.95881:
	flw	%f1, 32(%sp)
	fblt	%f0, %f1, fbgt_else.95892
	addi	%v0, %zero, 0
	j	fbgt_cont.95893
fbgt_else.95892:
	addi	%v0, %zero, 1
fbgt_cont.95893:
	fblt	%f0, %f1, fbgt_else.95894
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95895
fbgt_else.95894:
fbgt_cont.95895:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95896
	beqi	%v0, 0, bnei_else.95898
	addi	%v0, %zero, 0
	j	fbgt_cont.95897
bnei_else.95898:
	addi	%v0, %zero, 1
bnei_cont.95899:
	j	fbgt_cont.95897
fbgt_else.95896:
fbgt_cont.95897:
	fblt	%f0, %f2, fbgt_else.95900
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95901
fbgt_else.95900:
fbgt_cont.95901:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95902
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.95903
fbgt_else.95902:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.95903:
	beqi	%v0, 0, bnei_else.95904
	j	bnei_cont.95905
bnei_else.95904:
	fneg	%f0, %f0
bnei_cont.95905:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95837:
	j	bnei_cont.95833
bnei_else.95834:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 18(%sp)
	fblt	%f0, %f2, fbgt_else.95906
	addi	%v1, %zero, 1
	j	fbgt_cont.95907
fbgt_else.95906:
	addi	%v1, %zero, 0
fbgt_cont.95907:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 35(%sp)
	fsw	%f1, 36(%sp)
	fsw	%f0, 37(%sp)
	fsw	%f3, 38(%sp)
	fblt	%f0, %f3, fbgt_else.95908
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.95910
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.95912
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.95914
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.95916
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.95918
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	fbgt_cont.95909
fbgt_else.95918:
	fmov	%f0, %f4
fbgt_cont.95919:
	j	fbgt_cont.95909
fbgt_else.95916:
	fmov	%f0, %f4
fbgt_cont.95917:
	j	fbgt_cont.95909
fbgt_else.95914:
	fmov	%f0, %f4
fbgt_cont.95915:
	j	fbgt_cont.95909
fbgt_else.95912:
	fmov	%f0, %f4
fbgt_cont.95913:
	j	fbgt_cont.95909
fbgt_else.95910:
	fmov	%f0, %f4
fbgt_cont.95911:
	j	fbgt_cont.95909
fbgt_else.95908:
	fmov	%f0, %f3
fbgt_cont.95909:
	flw	%f1, 37(%sp)
	flw	%f2, 38(%sp)
	fblt	%f1, %f2, fbgt_else.95920
	fblt	%f1, %f0, fbgt_else.95922
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95924
	fblt	%f1, %f0, fbgt_else.95926
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	fbgt_cont.95921
fbgt_else.95926:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
fbgt_cont.95927:
	j	fbgt_cont.95921
fbgt_else.95924:
	fmov	%f0, %f1
fbgt_cont.95925:
	j	fbgt_cont.95921
fbgt_else.95922:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.95928
	fblt	%f1, %f0, fbgt_else.95930
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	fbgt_cont.95929
fbgt_else.95930:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
fbgt_cont.95931:
	j	fbgt_cont.95929
fbgt_else.95928:
	fmov	%f0, %f1
fbgt_cont.95929:
fbgt_cont.95923:
	j	fbgt_cont.95921
fbgt_else.95920:
	fmov	%f0, %f1
fbgt_cont.95921:
	flw	%f1, 36(%sp)
	fblt	%f0, %f1, fbgt_else.95932
	lw	%v0, 35(%sp)
	beqi	%v0, 0, bnei_else.95934
	addi	%v0, %zero, 0
	j	fbgt_cont.95933
bnei_else.95934:
	addi	%v0, %zero, 1
bnei_cont.95935:
	j	fbgt_cont.95933
fbgt_else.95932:
	lw	%v0, 35(%sp)
fbgt_cont.95933:
	fblt	%f0, %f1, fbgt_else.95936
	fsub	%f0, %f0, %f1
	j	fbgt_cont.95937
fbgt_else.95936:
fbgt_cont.95937:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.95938
	fsub	%f0, %f1, %f0
	j	fbgt_cont.95939
fbgt_else.95938:
fbgt_cont.95939:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.95940
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.95941
fbgt_else.95940:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.95941:
	beqi	%v0, 0, bnei_else.95942
	j	bnei_cont.95943
bnei_else.95942:
	fneg	%f0, %f0
bnei_cont.95943:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95835:
	j	bnei_cont.95833
bnei_else.95832:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.95944
	addi	%v1, %zero, 0
	j	fbgt_cont.95945
fbgt_else.95944:
	addi	%v1, %zero, 1
fbgt_cont.95945:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.95946
	addi	%a0, %zero, 0
	j	fbgt_cont.95947
fbgt_else.95946:
	addi	%a0, %zero, 1
fbgt_cont.95947:
	beqi	%v1, 0, bnei_else.95948
	beqi	%a0, 0, bnei_else.95950
	flw	%f0, 450(%zero)
	j	bnei_cont.95949
bnei_else.95950:
	flw	%f0, 18(%sp)
bnei_cont.95951:
	j	bnei_cont.95949
bnei_else.95948:
	beqi	%a0, 0, bnei_else.95952
	flw	%f0, 18(%sp)
	j	bnei_cont.95953
bnei_else.95952:
	flw	%f0, 450(%zero)
bnei_cont.95953:
bnei_cont.95949:
	fsw	%f0, 146(%zero)
bnei_cont.95833:
	lw	%v0, 2(%sp)
	lw	%v1, 29(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	beqi	%v0, 0, bnei_else.95954
	j	bnei_cont.95811
bnei_else.95954:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 18(%sp)
	fblt	%f1, %f0, fbgt_else.95956
	addi	%v0, %zero, 0
	j	fbgt_cont.95957
fbgt_else.95956:
	addi	%v0, %zero, 1
fbgt_cont.95957:
	beqi	%v0, 0, bnei_else.95958
	j	bnei_cont.95959
bnei_else.95958:
	fmov	%f0, %f1
bnei_cont.95959:
	flw	%f1, 28(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 31(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.95955:
	j	bnei_cont.95811
bnei_else.95810:
bnei_cont.95811:
bnei_cont.95647:
	addi	%a1, %zero, 116
	lw	%v0, 15(%sp)
	lw	%v1, 12(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	bnei_cont.95643
bnei_else.95642:
bnei_cont.95643:
	lw	%v0, 14(%sp)
	beqi	%v0, 1, bnei_else.95960
	lw	%v1, 180(%zero)
	lw	%a0, 13(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 39(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v0, 39(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 12(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.95962
	addi	%v1, %zero, 0
	j	fbgt_cont.95963
fbgt_else.95962:
	addi	%v1, %zero, 1
fbgt_cont.95963:
	beqi	%v1, 0, bnei_else.95964
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 40(%sp)
	sw	%v1, 41(%sp)
	fsw	%f1, 42(%sp)
	sw	%a0, 43(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.95966
	addi	%v0, %zero, 0
	j	fbgt_cont.95967
fbgt_else.95966:
	addi	%v0, %zero, 1
fbgt_cont.95967:
	beqi	%v0, 0, bnei_else.95968
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.95970
	addi	%v0, %zero, 0
	j	bnei_cont.95969
fbgt_else.95970:
	addi	%v0, %zero, 1
fbgt_cont.95971:
	j	bnei_cont.95969
bnei_else.95968:
	addi	%v0, %zero, 0
bnei_cont.95969:
	beqi	%v0, 0, bnei_else.95972
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 43(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.95974
	beqi	%a0, 2, bnei_else.95976
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.95978
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.95979
bnei_else.95978:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.95979:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 42(%sp)
	fbne	%f1, %f4, fbeq_else.95980
	addi	%a0, %zero, 1
	j	fbeq_cont.95981
fbeq_else.95980:
	addi	%a0, %zero, 0
fbeq_cont.95981:
	beqi	%a0, 0, bnei_else.95982
	flw	%f1, 491(%zero)
	j	bnei_cont.95983
bnei_else.95982:
	beqi	%v1, 0, bnei_else.95984
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.95985
bnei_else.95984:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.95985:
bnei_cont.95983:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.95975
bnei_else.95976:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.95977:
	j	bnei_cont.95975
bnei_else.95974:
	lw	%a0, 136(%zero)
	flw	%f0, 42(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.95986
	addi	%v1, %zero, 1
	j	fbeq_cont.95987
fbeq_else.95986:
	addi	%v1, %zero, 0
fbeq_cont.95987:
	beqi	%v1, 0, bnei_else.95988
	fmov	%f1, %f0
	j	bnei_cont.95989
bnei_else.95988:
	fblt	%f0, %f1, fbgt_else.95990
	addi	%v1, %zero, 0
	j	fbgt_cont.95991
fbgt_else.95990:
	addi	%v1, %zero, 1
fbgt_cont.95991:
	beqi	%v1, 0, bnei_else.95992
	flw	%f1, 491(%zero)
	j	bnei_cont.95993
bnei_else.95992:
	flw	%f1, 490(%zero)
bnei_cont.95993:
bnei_cont.95989:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.95975:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 44(%sp)
	beqi	%v1, 1, bnei_else.95994
	beqi	%v1, 2, bnei_else.95996
	beqi	%v1, 3, bnei_else.95998
	beqi	%v1, 4, bnei_else.96000
	j	bnei_cont.95995
bnei_else.96000:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.96002
	addi	%v1, %zero, 0
	j	fbgt_cont.96003
fbgt_else.96002:
	addi	%v1, %zero, 1
fbgt_cont.96003:
	beqi	%v1, 0, bnei_else.96004
	flw	%f0, 462(%zero)
	j	bnei_cont.96005
bnei_else.96004:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.96006
	addi	%v1, %zero, 1
	j	fbgt_cont.96007
fbgt_else.96006:
	addi	%v1, %zero, 0
fbgt_cont.96007:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.96008
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.96010
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.96011
fbgt_else.96010:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.96011:
	beqi	%v1, 0, bnei_else.96012
	j	fbgt_cont.96009
bnei_else.96012:
	fneg	%f0, %f0
bnei_cont.96013:
	j	fbgt_cont.96009
fbgt_else.96008:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.96009:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.96005:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.96014
	addi	%v1, %zero, 0
	j	fbgt_cont.96015
fbgt_else.96014:
	addi	%v1, %zero, 1
fbgt_cont.96015:
	beqi	%v1, 0, bnei_else.96016
	flw	%f1, 462(%zero)
	j	bnei_cont.96017
bnei_else.96016:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 42(%sp)
	fblt	%f1, %f2, fbgt_else.96018
	addi	%v1, %zero, 1
	j	fbgt_cont.96019
fbgt_else.96018:
	addi	%v1, %zero, 0
fbgt_cont.96019:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.96020
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.96022
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.96023
fbgt_else.96022:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.96023:
	beqi	%v1, 0, bnei_else.96024
	j	fbgt_cont.96021
bnei_else.96024:
	fneg	%f1, %f1
bnei_cont.96025:
	j	fbgt_cont.96021
fbgt_else.96020:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.96021:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.96017:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.96026
	addi	%v1, %zero, 0
	j	fbgt_cont.96027
fbgt_else.96026:
	addi	%v1, %zero, 1
fbgt_cont.96027:
	beqi	%v1, 0, bnei_else.96028
	fmov	%f0, %f1
	j	bnei_cont.96029
bnei_else.96028:
bnei_cont.96029:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.96001:
	j	bnei_cont.95995
bnei_else.95998:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 45(%sp)
	fsw	%f0, 46(%sp)
	fsw	%f2, 47(%sp)
	fblt	%f0, %f2, fbgt_else.96030
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.96032
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.96034
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.96036
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.96038
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.96040
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	fbgt_cont.96031
fbgt_else.96040:
	fmov	%f0, %f3
fbgt_cont.96041:
	j	fbgt_cont.96031
fbgt_else.96038:
	fmov	%f0, %f3
fbgt_cont.96039:
	j	fbgt_cont.96031
fbgt_else.96036:
	fmov	%f0, %f3
fbgt_cont.96037:
	j	fbgt_cont.96031
fbgt_else.96034:
	fmov	%f0, %f3
fbgt_cont.96035:
	j	fbgt_cont.96031
fbgt_else.96032:
	fmov	%f0, %f3
fbgt_cont.96033:
	j	fbgt_cont.96031
fbgt_else.96030:
	fmov	%f0, %f2
fbgt_cont.96031:
	flw	%f1, 46(%sp)
	flw	%f2, 47(%sp)
	fblt	%f1, %f2, fbgt_else.96042
	fblt	%f1, %f0, fbgt_else.96044
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96046
	fblt	%f1, %f0, fbgt_else.96048
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	fbgt_cont.96043
fbgt_else.96048:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
fbgt_cont.96049:
	j	fbgt_cont.96043
fbgt_else.96046:
	fmov	%f0, %f1
fbgt_cont.96047:
	j	fbgt_cont.96043
fbgt_else.96044:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96050
	fblt	%f1, %f0, fbgt_else.96052
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	fbgt_cont.96051
fbgt_else.96052:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
fbgt_cont.96053:
	j	fbgt_cont.96051
fbgt_else.96050:
	fmov	%f0, %f1
fbgt_cont.96051:
fbgt_cont.96045:
	j	fbgt_cont.96043
fbgt_else.96042:
	fmov	%f0, %f1
fbgt_cont.96043:
	flw	%f1, 45(%sp)
	fblt	%f0, %f1, fbgt_else.96054
	addi	%v0, %zero, 0
	j	fbgt_cont.96055
fbgt_else.96054:
	addi	%v0, %zero, 1
fbgt_cont.96055:
	fblt	%f0, %f1, fbgt_else.96056
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96057
fbgt_else.96056:
fbgt_cont.96057:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96058
	beqi	%v0, 0, bnei_else.96060
	addi	%v0, %zero, 0
	j	fbgt_cont.96059
bnei_else.96060:
	addi	%v0, %zero, 1
bnei_cont.96061:
	j	fbgt_cont.96059
fbgt_else.96058:
fbgt_cont.96059:
	fblt	%f0, %f2, fbgt_else.96062
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96063
fbgt_else.96062:
fbgt_cont.96063:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96064
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.96065
fbgt_else.96064:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.96065:
	beqi	%v0, 0, bnei_else.96066
	j	bnei_cont.96067
bnei_else.96066:
	fneg	%f0, %f0
bnei_cont.96067:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.95999:
	j	bnei_cont.95995
bnei_else.95996:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 42(%sp)
	fblt	%f0, %f2, fbgt_else.96068
	addi	%v1, %zero, 1
	j	fbgt_cont.96069
fbgt_else.96068:
	addi	%v1, %zero, 0
fbgt_cont.96069:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 48(%sp)
	fsw	%f1, 49(%sp)
	fsw	%f0, 50(%sp)
	fsw	%f3, 51(%sp)
	fblt	%f0, %f3, fbgt_else.96070
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.96072
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.96074
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.96076
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.96078
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.96080
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	j	fbgt_cont.96071
fbgt_else.96080:
	fmov	%f0, %f4
fbgt_cont.96081:
	j	fbgt_cont.96071
fbgt_else.96078:
	fmov	%f0, %f4
fbgt_cont.96079:
	j	fbgt_cont.96071
fbgt_else.96076:
	fmov	%f0, %f4
fbgt_cont.96077:
	j	fbgt_cont.96071
fbgt_else.96074:
	fmov	%f0, %f4
fbgt_cont.96075:
	j	fbgt_cont.96071
fbgt_else.96072:
	fmov	%f0, %f4
fbgt_cont.96073:
	j	fbgt_cont.96071
fbgt_else.96070:
	fmov	%f0, %f3
fbgt_cont.96071:
	flw	%f1, 50(%sp)
	flw	%f2, 51(%sp)
	fblt	%f1, %f2, fbgt_else.96082
	fblt	%f1, %f0, fbgt_else.96084
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96086
	fblt	%f1, %f0, fbgt_else.96088
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	j	fbgt_cont.96083
fbgt_else.96088:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
fbgt_cont.96089:
	j	fbgt_cont.96083
fbgt_else.96086:
	fmov	%f0, %f1
fbgt_cont.96087:
	j	fbgt_cont.96083
fbgt_else.96084:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96090
	fblt	%f1, %f0, fbgt_else.96092
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	j	fbgt_cont.96091
fbgt_else.96092:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
fbgt_cont.96093:
	j	fbgt_cont.96091
fbgt_else.96090:
	fmov	%f0, %f1
fbgt_cont.96091:
fbgt_cont.96085:
	j	fbgt_cont.96083
fbgt_else.96082:
	fmov	%f0, %f1
fbgt_cont.96083:
	flw	%f1, 49(%sp)
	fblt	%f0, %f1, fbgt_else.96094
	lw	%v0, 48(%sp)
	beqi	%v0, 0, bnei_else.96096
	addi	%v0, %zero, 0
	j	fbgt_cont.96095
bnei_else.96096:
	addi	%v0, %zero, 1
bnei_cont.96097:
	j	fbgt_cont.96095
fbgt_else.96094:
	lw	%v0, 48(%sp)
fbgt_cont.96095:
	fblt	%f0, %f1, fbgt_else.96098
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96099
fbgt_else.96098:
fbgt_cont.96099:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96100
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96101
fbgt_else.96100:
fbgt_cont.96101:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96102
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.96103
fbgt_else.96102:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.96103:
	beqi	%v0, 0, bnei_else.96104
	j	bnei_cont.96105
bnei_else.96104:
	fneg	%f0, %f0
bnei_cont.96105:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.95997:
	j	bnei_cont.95995
bnei_else.95994:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.96106
	addi	%v1, %zero, 0
	j	fbgt_cont.96107
fbgt_else.96106:
	addi	%v1, %zero, 1
fbgt_cont.96107:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.96108
	addi	%a0, %zero, 0
	j	fbgt_cont.96109
fbgt_else.96108:
	addi	%a0, %zero, 1
fbgt_cont.96109:
	beqi	%v1, 0, bnei_else.96110
	beqi	%a0, 0, bnei_else.96112
	flw	%f0, 450(%zero)
	j	bnei_cont.96111
bnei_else.96112:
	flw	%f0, 42(%sp)
bnei_cont.96113:
	j	bnei_cont.96111
bnei_else.96110:
	beqi	%a0, 0, bnei_else.96114
	flw	%f0, 42(%sp)
	j	bnei_cont.96115
bnei_else.96114:
	flw	%f0, 450(%zero)
bnei_cont.96115:
bnei_cont.96111:
	fsw	%f0, 146(%zero)
bnei_cont.95995:
	lw	%v0, 2(%sp)
	lw	%v1, 41(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	beqi	%v0, 0, bnei_else.96116
	j	bnei_cont.95965
bnei_else.96116:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 42(%sp)
	fblt	%f1, %f0, fbgt_else.96118
	addi	%v0, %zero, 0
	j	fbgt_cont.96119
fbgt_else.96118:
	addi	%v0, %zero, 1
fbgt_cont.96119:
	beqi	%v0, 0, bnei_else.96120
	j	bnei_cont.96121
bnei_else.96120:
	fmov	%f0, %f1
bnei_cont.96121:
	flw	%f1, 40(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 44(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.96117:
	j	bnei_cont.95965
bnei_else.95972:
bnei_cont.95973:
	j	bnei_cont.95965
bnei_else.95964:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 52(%sp)
	sw	%v1, 53(%sp)
	fsw	%f1, 42(%sp)
	sw	%a0, 54(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.96122
	addi	%v0, %zero, 0
	j	fbgt_cont.96123
fbgt_else.96122:
	addi	%v0, %zero, 1
fbgt_cont.96123:
	beqi	%v0, 0, bnei_else.96124
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.96126
	addi	%v0, %zero, 0
	j	bnei_cont.96125
fbgt_else.96126:
	addi	%v0, %zero, 1
fbgt_cont.96127:
	j	bnei_cont.96125
bnei_else.96124:
	addi	%v0, %zero, 0
bnei_cont.96125:
	beqi	%v0, 0, bnei_else.96128
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 54(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.96130
	beqi	%a0, 2, bnei_else.96132
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.96134
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.96135
bnei_else.96134:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.96135:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 42(%sp)
	fbne	%f1, %f4, fbeq_else.96136
	addi	%a0, %zero, 1
	j	fbeq_cont.96137
fbeq_else.96136:
	addi	%a0, %zero, 0
fbeq_cont.96137:
	beqi	%a0, 0, bnei_else.96138
	flw	%f1, 491(%zero)
	j	bnei_cont.96139
bnei_else.96138:
	beqi	%v1, 0, bnei_else.96140
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.96141
bnei_else.96140:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.96141:
bnei_cont.96139:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.96131
bnei_else.96132:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.96133:
	j	bnei_cont.96131
bnei_else.96130:
	lw	%a0, 136(%zero)
	flw	%f0, 42(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.96142
	addi	%v1, %zero, 1
	j	fbeq_cont.96143
fbeq_else.96142:
	addi	%v1, %zero, 0
fbeq_cont.96143:
	beqi	%v1, 0, bnei_else.96144
	fmov	%f1, %f0
	j	bnei_cont.96145
bnei_else.96144:
	fblt	%f0, %f1, fbgt_else.96146
	addi	%v1, %zero, 0
	j	fbgt_cont.96147
fbgt_else.96146:
	addi	%v1, %zero, 1
fbgt_cont.96147:
	beqi	%v1, 0, bnei_else.96148
	flw	%f1, 491(%zero)
	j	bnei_cont.96149
bnei_else.96148:
	flw	%f1, 490(%zero)
bnei_cont.96149:
bnei_cont.96145:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.96131:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 55(%sp)
	beqi	%v1, 1, bnei_else.96150
	beqi	%v1, 2, bnei_else.96152
	beqi	%v1, 3, bnei_else.96154
	beqi	%v1, 4, bnei_else.96156
	j	bnei_cont.96151
bnei_else.96156:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.96158
	addi	%v1, %zero, 0
	j	fbgt_cont.96159
fbgt_else.96158:
	addi	%v1, %zero, 1
fbgt_cont.96159:
	beqi	%v1, 0, bnei_else.96160
	flw	%f0, 462(%zero)
	j	bnei_cont.96161
bnei_else.96160:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.96162
	addi	%v1, %zero, 1
	j	fbgt_cont.96163
fbgt_else.96162:
	addi	%v1, %zero, 0
fbgt_cont.96163:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.96164
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.96166
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.96167
fbgt_else.96166:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.96167:
	beqi	%v1, 0, bnei_else.96168
	j	fbgt_cont.96165
bnei_else.96168:
	fneg	%f0, %f0
bnei_cont.96169:
	j	fbgt_cont.96165
fbgt_else.96164:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.96165:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.96161:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.96170
	addi	%v1, %zero, 0
	j	fbgt_cont.96171
fbgt_else.96170:
	addi	%v1, %zero, 1
fbgt_cont.96171:
	beqi	%v1, 0, bnei_else.96172
	flw	%f1, 462(%zero)
	j	bnei_cont.96173
bnei_else.96172:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 42(%sp)
	fblt	%f1, %f2, fbgt_else.96174
	addi	%v1, %zero, 1
	j	fbgt_cont.96175
fbgt_else.96174:
	addi	%v1, %zero, 0
fbgt_cont.96175:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.96176
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.96178
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.96179
fbgt_else.96178:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.96179:
	beqi	%v1, 0, bnei_else.96180
	j	fbgt_cont.96177
bnei_else.96180:
	fneg	%f1, %f1
bnei_cont.96181:
	j	fbgt_cont.96177
fbgt_else.96176:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.96177:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.96173:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.96182
	addi	%v1, %zero, 0
	j	fbgt_cont.96183
fbgt_else.96182:
	addi	%v1, %zero, 1
fbgt_cont.96183:
	beqi	%v1, 0, bnei_else.96184
	fmov	%f0, %f1
	j	bnei_cont.96185
bnei_else.96184:
bnei_cont.96185:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.96157:
	j	bnei_cont.96151
bnei_else.96154:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 56(%sp)
	fsw	%f0, 57(%sp)
	fsw	%f2, 58(%sp)
	fblt	%f0, %f2, fbgt_else.96186
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.96188
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.96190
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.96192
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.96194
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.96196
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
	j	fbgt_cont.96187
fbgt_else.96196:
	fmov	%f0, %f3
fbgt_cont.96197:
	j	fbgt_cont.96187
fbgt_else.96194:
	fmov	%f0, %f3
fbgt_cont.96195:
	j	fbgt_cont.96187
fbgt_else.96192:
	fmov	%f0, %f3
fbgt_cont.96193:
	j	fbgt_cont.96187
fbgt_else.96190:
	fmov	%f0, %f3
fbgt_cont.96191:
	j	fbgt_cont.96187
fbgt_else.96188:
	fmov	%f0, %f3
fbgt_cont.96189:
	j	fbgt_cont.96187
fbgt_else.96186:
	fmov	%f0, %f2
fbgt_cont.96187:
	flw	%f1, 57(%sp)
	flw	%f2, 58(%sp)
	fblt	%f1, %f2, fbgt_else.96198
	fblt	%f1, %f0, fbgt_else.96200
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96202
	fblt	%f1, %f0, fbgt_else.96204
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
	j	fbgt_cont.96199
fbgt_else.96204:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
fbgt_cont.96205:
	j	fbgt_cont.96199
fbgt_else.96202:
	fmov	%f0, %f1
fbgt_cont.96203:
	j	fbgt_cont.96199
fbgt_else.96200:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96206
	fblt	%f1, %f0, fbgt_else.96208
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
	j	fbgt_cont.96207
fbgt_else.96208:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
fbgt_cont.96209:
	j	fbgt_cont.96207
fbgt_else.96206:
	fmov	%f0, %f1
fbgt_cont.96207:
fbgt_cont.96201:
	j	fbgt_cont.96199
fbgt_else.96198:
	fmov	%f0, %f1
fbgt_cont.96199:
	flw	%f1, 56(%sp)
	fblt	%f0, %f1, fbgt_else.96210
	addi	%v0, %zero, 0
	j	fbgt_cont.96211
fbgt_else.96210:
	addi	%v0, %zero, 1
fbgt_cont.96211:
	fblt	%f0, %f1, fbgt_else.96212
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96213
fbgt_else.96212:
fbgt_cont.96213:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96214
	beqi	%v0, 0, bnei_else.96216
	addi	%v0, %zero, 0
	j	fbgt_cont.96215
bnei_else.96216:
	addi	%v0, %zero, 1
bnei_cont.96217:
	j	fbgt_cont.96215
fbgt_else.96214:
fbgt_cont.96215:
	fblt	%f0, %f2, fbgt_else.96218
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96219
fbgt_else.96218:
fbgt_cont.96219:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96220
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.96221
fbgt_else.96220:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.96221:
	beqi	%v0, 0, bnei_else.96222
	j	bnei_cont.96223
bnei_else.96222:
	fneg	%f0, %f0
bnei_cont.96223:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.96155:
	j	bnei_cont.96151
bnei_else.96152:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 42(%sp)
	fblt	%f0, %f2, fbgt_else.96224
	addi	%v1, %zero, 1
	j	fbgt_cont.96225
fbgt_else.96224:
	addi	%v1, %zero, 0
fbgt_cont.96225:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 59(%sp)
	fsw	%f1, 60(%sp)
	fsw	%f0, 61(%sp)
	fsw	%f3, 62(%sp)
	fblt	%f0, %f3, fbgt_else.96226
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.96228
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.96230
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.96232
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.96234
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.96236
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	fbgt_cont.96227
fbgt_else.96236:
	fmov	%f0, %f4
fbgt_cont.96237:
	j	fbgt_cont.96227
fbgt_else.96234:
	fmov	%f0, %f4
fbgt_cont.96235:
	j	fbgt_cont.96227
fbgt_else.96232:
	fmov	%f0, %f4
fbgt_cont.96233:
	j	fbgt_cont.96227
fbgt_else.96230:
	fmov	%f0, %f4
fbgt_cont.96231:
	j	fbgt_cont.96227
fbgt_else.96228:
	fmov	%f0, %f4
fbgt_cont.96229:
	j	fbgt_cont.96227
fbgt_else.96226:
	fmov	%f0, %f3
fbgt_cont.96227:
	flw	%f1, 61(%sp)
	flw	%f2, 62(%sp)
	fblt	%f1, %f2, fbgt_else.96238
	fblt	%f1, %f0, fbgt_else.96240
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96242
	fblt	%f1, %f0, fbgt_else.96244
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	fbgt_cont.96239
fbgt_else.96244:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
fbgt_cont.96245:
	j	fbgt_cont.96239
fbgt_else.96242:
	fmov	%f0, %f1
fbgt_cont.96243:
	j	fbgt_cont.96239
fbgt_else.96240:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96246
	fblt	%f1, %f0, fbgt_else.96248
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	fbgt_cont.96247
fbgt_else.96248:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
fbgt_cont.96249:
	j	fbgt_cont.96247
fbgt_else.96246:
	fmov	%f0, %f1
fbgt_cont.96247:
fbgt_cont.96241:
	j	fbgt_cont.96239
fbgt_else.96238:
	fmov	%f0, %f1
fbgt_cont.96239:
	flw	%f1, 60(%sp)
	fblt	%f0, %f1, fbgt_else.96250
	lw	%v0, 59(%sp)
	beqi	%v0, 0, bnei_else.96252
	addi	%v0, %zero, 0
	j	fbgt_cont.96251
bnei_else.96252:
	addi	%v0, %zero, 1
bnei_cont.96253:
	j	fbgt_cont.96251
fbgt_else.96250:
	lw	%v0, 59(%sp)
fbgt_cont.96251:
	fblt	%f0, %f1, fbgt_else.96254
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96255
fbgt_else.96254:
fbgt_cont.96255:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96256
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96257
fbgt_else.96256:
fbgt_cont.96257:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96258
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.96259
fbgt_else.96258:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.96259:
	beqi	%v0, 0, bnei_else.96260
	j	bnei_cont.96261
bnei_else.96260:
	fneg	%f0, %f0
bnei_cont.96261:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.96153:
	j	bnei_cont.96151
bnei_else.96150:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.96262
	addi	%v1, %zero, 0
	j	fbgt_cont.96263
fbgt_else.96262:
	addi	%v1, %zero, 1
fbgt_cont.96263:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.96264
	addi	%a0, %zero, 0
	j	fbgt_cont.96265
fbgt_else.96264:
	addi	%a0, %zero, 1
fbgt_cont.96265:
	beqi	%v1, 0, bnei_else.96266
	beqi	%a0, 0, bnei_else.96268
	flw	%f0, 450(%zero)
	j	bnei_cont.96267
bnei_else.96268:
	flw	%f0, 42(%sp)
bnei_cont.96269:
	j	bnei_cont.96267
bnei_else.96266:
	beqi	%a0, 0, bnei_else.96270
	flw	%f0, 42(%sp)
	j	bnei_cont.96271
bnei_else.96270:
	flw	%f0, 450(%zero)
bnei_cont.96271:
bnei_cont.96267:
	fsw	%f0, 146(%zero)
bnei_cont.96151:
	lw	%v0, 2(%sp)
	lw	%v1, 53(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	beqi	%v0, 0, bnei_else.96272
	j	bnei_cont.96129
bnei_else.96272:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 42(%sp)
	fblt	%f1, %f0, fbgt_else.96274
	addi	%v0, %zero, 0
	j	fbgt_cont.96275
fbgt_else.96274:
	addi	%v0, %zero, 1
fbgt_cont.96275:
	beqi	%v0, 0, bnei_else.96276
	j	bnei_cont.96277
bnei_else.96276:
	fmov	%f0, %f1
bnei_cont.96277:
	flw	%f1, 52(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 55(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.96273:
	j	bnei_cont.96129
bnei_else.96128:
bnei_cont.96129:
bnei_cont.95965:
	addi	%a1, %zero, 116
	lw	%v0, 39(%sp)
	lw	%v1, 12(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	bnei_cont.95961
bnei_else.95960:
bnei_cont.95961:
	lw	%v0, 14(%sp)
	beqi	%v0, 2, bnei_else.96278
	lw	%v1, 181(%zero)
	lw	%a0, 13(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 63(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	lw	%v0, 63(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 12(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.96280
	addi	%v1, %zero, 0
	j	fbgt_cont.96281
fbgt_else.96280:
	addi	%v1, %zero, 1
fbgt_cont.96281:
	beqi	%v1, 0, bnei_else.96282
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 64(%sp)
	sw	%v1, 65(%sp)
	fsw	%f1, 66(%sp)
	sw	%a0, 67(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.96284
	addi	%v0, %zero, 0
	j	fbgt_cont.96285
fbgt_else.96284:
	addi	%v0, %zero, 1
fbgt_cont.96285:
	beqi	%v0, 0, bnei_else.96286
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.96288
	addi	%v0, %zero, 0
	j	bnei_cont.96287
fbgt_else.96288:
	addi	%v0, %zero, 1
fbgt_cont.96289:
	j	bnei_cont.96287
bnei_else.96286:
	addi	%v0, %zero, 0
bnei_cont.96287:
	beqi	%v0, 0, bnei_else.96290
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 67(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.96292
	beqi	%a0, 2, bnei_else.96294
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.96296
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.96297
bnei_else.96296:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.96297:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 66(%sp)
	fbne	%f1, %f4, fbeq_else.96298
	addi	%a0, %zero, 1
	j	fbeq_cont.96299
fbeq_else.96298:
	addi	%a0, %zero, 0
fbeq_cont.96299:
	beqi	%a0, 0, bnei_else.96300
	flw	%f1, 491(%zero)
	j	bnei_cont.96301
bnei_else.96300:
	beqi	%v1, 0, bnei_else.96302
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.96303
bnei_else.96302:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.96303:
bnei_cont.96301:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.96293
bnei_else.96294:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.96295:
	j	bnei_cont.96293
bnei_else.96292:
	lw	%a0, 136(%zero)
	flw	%f0, 66(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.96304
	addi	%v1, %zero, 1
	j	fbeq_cont.96305
fbeq_else.96304:
	addi	%v1, %zero, 0
fbeq_cont.96305:
	beqi	%v1, 0, bnei_else.96306
	fmov	%f1, %f0
	j	bnei_cont.96307
bnei_else.96306:
	fblt	%f0, %f1, fbgt_else.96308
	addi	%v1, %zero, 0
	j	fbgt_cont.96309
fbgt_else.96308:
	addi	%v1, %zero, 1
fbgt_cont.96309:
	beqi	%v1, 0, bnei_else.96310
	flw	%f1, 491(%zero)
	j	bnei_cont.96311
bnei_else.96310:
	flw	%f1, 490(%zero)
bnei_cont.96311:
bnei_cont.96307:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.96293:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 68(%sp)
	beqi	%v1, 1, bnei_else.96312
	beqi	%v1, 2, bnei_else.96314
	beqi	%v1, 3, bnei_else.96316
	beqi	%v1, 4, bnei_else.96318
	j	bnei_cont.96313
bnei_else.96318:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.96320
	addi	%v1, %zero, 0
	j	fbgt_cont.96321
fbgt_else.96320:
	addi	%v1, %zero, 1
fbgt_cont.96321:
	beqi	%v1, 0, bnei_else.96322
	flw	%f0, 462(%zero)
	j	bnei_cont.96323
bnei_else.96322:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 66(%sp)
	fblt	%f0, %f1, fbgt_else.96324
	addi	%v1, %zero, 1
	j	fbgt_cont.96325
fbgt_else.96324:
	addi	%v1, %zero, 0
fbgt_cont.96325:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.96326
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.96328
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.96329
fbgt_else.96328:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.96329:
	beqi	%v1, 0, bnei_else.96330
	j	fbgt_cont.96327
bnei_else.96330:
	fneg	%f0, %f0
bnei_cont.96331:
	j	fbgt_cont.96327
fbgt_else.96326:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.96327:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.96323:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.96332
	addi	%v1, %zero, 0
	j	fbgt_cont.96333
fbgt_else.96332:
	addi	%v1, %zero, 1
fbgt_cont.96333:
	beqi	%v1, 0, bnei_else.96334
	flw	%f1, 462(%zero)
	j	bnei_cont.96335
bnei_else.96334:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 66(%sp)
	fblt	%f1, %f2, fbgt_else.96336
	addi	%v1, %zero, 1
	j	fbgt_cont.96337
fbgt_else.96336:
	addi	%v1, %zero, 0
fbgt_cont.96337:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.96338
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.96340
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.96341
fbgt_else.96340:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.96341:
	beqi	%v1, 0, bnei_else.96342
	j	fbgt_cont.96339
bnei_else.96342:
	fneg	%f1, %f1
bnei_cont.96343:
	j	fbgt_cont.96339
fbgt_else.96338:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.96339:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.96335:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 66(%sp)
	fblt	%f0, %f1, fbgt_else.96344
	addi	%v1, %zero, 0
	j	fbgt_cont.96345
fbgt_else.96344:
	addi	%v1, %zero, 1
fbgt_cont.96345:
	beqi	%v1, 0, bnei_else.96346
	fmov	%f0, %f1
	j	bnei_cont.96347
bnei_else.96346:
bnei_cont.96347:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.96319:
	j	bnei_cont.96313
bnei_else.96316:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 69(%sp)
	fsw	%f0, 70(%sp)
	fsw	%f2, 71(%sp)
	fblt	%f0, %f2, fbgt_else.96348
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.96350
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.96352
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.96354
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.96356
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.96358
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	j	fbgt_cont.96349
fbgt_else.96358:
	fmov	%f0, %f3
fbgt_cont.96359:
	j	fbgt_cont.96349
fbgt_else.96356:
	fmov	%f0, %f3
fbgt_cont.96357:
	j	fbgt_cont.96349
fbgt_else.96354:
	fmov	%f0, %f3
fbgt_cont.96355:
	j	fbgt_cont.96349
fbgt_else.96352:
	fmov	%f0, %f3
fbgt_cont.96353:
	j	fbgt_cont.96349
fbgt_else.96350:
	fmov	%f0, %f3
fbgt_cont.96351:
	j	fbgt_cont.96349
fbgt_else.96348:
	fmov	%f0, %f2
fbgt_cont.96349:
	flw	%f1, 70(%sp)
	flw	%f2, 71(%sp)
	fblt	%f1, %f2, fbgt_else.96360
	fblt	%f1, %f0, fbgt_else.96362
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96364
	fblt	%f1, %f0, fbgt_else.96366
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	j	fbgt_cont.96361
fbgt_else.96366:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
fbgt_cont.96367:
	j	fbgt_cont.96361
fbgt_else.96364:
	fmov	%f0, %f1
fbgt_cont.96365:
	j	fbgt_cont.96361
fbgt_else.96362:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96368
	fblt	%f1, %f0, fbgt_else.96370
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	j	fbgt_cont.96369
fbgt_else.96370:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
fbgt_cont.96371:
	j	fbgt_cont.96369
fbgt_else.96368:
	fmov	%f0, %f1
fbgt_cont.96369:
fbgt_cont.96363:
	j	fbgt_cont.96361
fbgt_else.96360:
	fmov	%f0, %f1
fbgt_cont.96361:
	flw	%f1, 69(%sp)
	fblt	%f0, %f1, fbgt_else.96372
	addi	%v0, %zero, 0
	j	fbgt_cont.96373
fbgt_else.96372:
	addi	%v0, %zero, 1
fbgt_cont.96373:
	fblt	%f0, %f1, fbgt_else.96374
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96375
fbgt_else.96374:
fbgt_cont.96375:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96376
	beqi	%v0, 0, bnei_else.96378
	addi	%v0, %zero, 0
	j	fbgt_cont.96377
bnei_else.96378:
	addi	%v0, %zero, 1
bnei_cont.96379:
	j	fbgt_cont.96377
fbgt_else.96376:
fbgt_cont.96377:
	fblt	%f0, %f2, fbgt_else.96380
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96381
fbgt_else.96380:
fbgt_cont.96381:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96382
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.96383
fbgt_else.96382:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.96383:
	beqi	%v0, 0, bnei_else.96384
	j	bnei_cont.96385
bnei_else.96384:
	fneg	%f0, %f0
bnei_cont.96385:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.96317:
	j	bnei_cont.96313
bnei_else.96314:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 66(%sp)
	fblt	%f0, %f2, fbgt_else.96386
	addi	%v1, %zero, 1
	j	fbgt_cont.96387
fbgt_else.96386:
	addi	%v1, %zero, 0
fbgt_cont.96387:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 72(%sp)
	fsw	%f1, 73(%sp)
	fsw	%f0, 74(%sp)
	fsw	%f3, 75(%sp)
	fblt	%f0, %f3, fbgt_else.96388
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.96390
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.96392
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.96394
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.96396
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.96398
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
	j	fbgt_cont.96389
fbgt_else.96398:
	fmov	%f0, %f4
fbgt_cont.96399:
	j	fbgt_cont.96389
fbgt_else.96396:
	fmov	%f0, %f4
fbgt_cont.96397:
	j	fbgt_cont.96389
fbgt_else.96394:
	fmov	%f0, %f4
fbgt_cont.96395:
	j	fbgt_cont.96389
fbgt_else.96392:
	fmov	%f0, %f4
fbgt_cont.96393:
	j	fbgt_cont.96389
fbgt_else.96390:
	fmov	%f0, %f4
fbgt_cont.96391:
	j	fbgt_cont.96389
fbgt_else.96388:
	fmov	%f0, %f3
fbgt_cont.96389:
	flw	%f1, 74(%sp)
	flw	%f2, 75(%sp)
	fblt	%f1, %f2, fbgt_else.96400
	fblt	%f1, %f0, fbgt_else.96402
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96404
	fblt	%f1, %f0, fbgt_else.96406
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
	j	fbgt_cont.96401
fbgt_else.96406:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
fbgt_cont.96407:
	j	fbgt_cont.96401
fbgt_else.96404:
	fmov	%f0, %f1
fbgt_cont.96405:
	j	fbgt_cont.96401
fbgt_else.96402:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96408
	fblt	%f1, %f0, fbgt_else.96410
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
	j	fbgt_cont.96409
fbgt_else.96410:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
fbgt_cont.96411:
	j	fbgt_cont.96409
fbgt_else.96408:
	fmov	%f0, %f1
fbgt_cont.96409:
fbgt_cont.96403:
	j	fbgt_cont.96401
fbgt_else.96400:
	fmov	%f0, %f1
fbgt_cont.96401:
	flw	%f1, 73(%sp)
	fblt	%f0, %f1, fbgt_else.96412
	lw	%v0, 72(%sp)
	beqi	%v0, 0, bnei_else.96414
	addi	%v0, %zero, 0
	j	fbgt_cont.96413
bnei_else.96414:
	addi	%v0, %zero, 1
bnei_cont.96415:
	j	fbgt_cont.96413
fbgt_else.96412:
	lw	%v0, 72(%sp)
fbgt_cont.96413:
	fblt	%f0, %f1, fbgt_else.96416
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96417
fbgt_else.96416:
fbgt_cont.96417:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96418
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96419
fbgt_else.96418:
fbgt_cont.96419:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96420
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.96421
fbgt_else.96420:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.96421:
	beqi	%v0, 0, bnei_else.96422
	j	bnei_cont.96423
bnei_else.96422:
	fneg	%f0, %f0
bnei_cont.96423:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.96315:
	j	bnei_cont.96313
bnei_else.96312:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.96424
	addi	%v1, %zero, 0
	j	fbgt_cont.96425
fbgt_else.96424:
	addi	%v1, %zero, 1
fbgt_cont.96425:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.96426
	addi	%a0, %zero, 0
	j	fbgt_cont.96427
fbgt_else.96426:
	addi	%a0, %zero, 1
fbgt_cont.96427:
	beqi	%v1, 0, bnei_else.96428
	beqi	%a0, 0, bnei_else.96430
	flw	%f0, 450(%zero)
	j	bnei_cont.96429
bnei_else.96430:
	flw	%f0, 66(%sp)
bnei_cont.96431:
	j	bnei_cont.96429
bnei_else.96428:
	beqi	%a0, 0, bnei_else.96432
	flw	%f0, 66(%sp)
	j	bnei_cont.96433
bnei_else.96432:
	flw	%f0, 450(%zero)
bnei_cont.96433:
bnei_cont.96429:
	fsw	%f0, 146(%zero)
bnei_cont.96313:
	lw	%v0, 2(%sp)
	lw	%v1, 65(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 77
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -77
	lw	%ra, 76(%sp)
	beqi	%v0, 0, bnei_else.96434
	j	bnei_cont.96283
bnei_else.96434:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 66(%sp)
	fblt	%f1, %f0, fbgt_else.96436
	addi	%v0, %zero, 0
	j	fbgt_cont.96437
fbgt_else.96436:
	addi	%v0, %zero, 1
fbgt_cont.96437:
	beqi	%v0, 0, bnei_else.96438
	j	bnei_cont.96439
bnei_else.96438:
	fmov	%f0, %f1
bnei_cont.96439:
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 68(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.96435:
	j	bnei_cont.96283
bnei_else.96290:
bnei_cont.96291:
	j	bnei_cont.96283
bnei_else.96282:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 76(%sp)
	sw	%v1, 77(%sp)
	fsw	%f1, 66(%sp)
	sw	%a0, 78(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.96440
	addi	%v0, %zero, 0
	j	fbgt_cont.96441
fbgt_else.96440:
	addi	%v0, %zero, 1
fbgt_cont.96441:
	beqi	%v0, 0, bnei_else.96442
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.96444
	addi	%v0, %zero, 0
	j	bnei_cont.96443
fbgt_else.96444:
	addi	%v0, %zero, 1
fbgt_cont.96445:
	j	bnei_cont.96443
bnei_else.96442:
	addi	%v0, %zero, 0
bnei_cont.96443:
	beqi	%v0, 0, bnei_else.96446
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 78(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.96448
	beqi	%a0, 2, bnei_else.96450
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.96452
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.96453
bnei_else.96452:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.96453:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 66(%sp)
	fbne	%f1, %f4, fbeq_else.96454
	addi	%a0, %zero, 1
	j	fbeq_cont.96455
fbeq_else.96454:
	addi	%a0, %zero, 0
fbeq_cont.96455:
	beqi	%a0, 0, bnei_else.96456
	flw	%f1, 491(%zero)
	j	bnei_cont.96457
bnei_else.96456:
	beqi	%v1, 0, bnei_else.96458
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.96459
bnei_else.96458:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.96459:
bnei_cont.96457:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.96449
bnei_else.96450:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.96451:
	j	bnei_cont.96449
bnei_else.96448:
	lw	%a0, 136(%zero)
	flw	%f0, 66(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.96460
	addi	%v1, %zero, 1
	j	fbeq_cont.96461
fbeq_else.96460:
	addi	%v1, %zero, 0
fbeq_cont.96461:
	beqi	%v1, 0, bnei_else.96462
	fmov	%f1, %f0
	j	bnei_cont.96463
bnei_else.96462:
	fblt	%f0, %f1, fbgt_else.96464
	addi	%v1, %zero, 0
	j	fbgt_cont.96465
fbgt_else.96464:
	addi	%v1, %zero, 1
fbgt_cont.96465:
	beqi	%v1, 0, bnei_else.96466
	flw	%f1, 491(%zero)
	j	bnei_cont.96467
bnei_else.96466:
	flw	%f1, 490(%zero)
bnei_cont.96467:
bnei_cont.96463:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.96449:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 79(%sp)
	beqi	%v1, 1, bnei_else.96468
	beqi	%v1, 2, bnei_else.96470
	beqi	%v1, 3, bnei_else.96472
	beqi	%v1, 4, bnei_else.96474
	j	bnei_cont.96469
bnei_else.96474:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.96476
	addi	%v1, %zero, 0
	j	fbgt_cont.96477
fbgt_else.96476:
	addi	%v1, %zero, 1
fbgt_cont.96477:
	beqi	%v1, 0, bnei_else.96478
	flw	%f0, 462(%zero)
	j	bnei_cont.96479
bnei_else.96478:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 66(%sp)
	fblt	%f0, %f1, fbgt_else.96480
	addi	%v1, %zero, 1
	j	fbgt_cont.96481
fbgt_else.96480:
	addi	%v1, %zero, 0
fbgt_cont.96481:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.96482
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.96484
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.96485
fbgt_else.96484:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.96485:
	beqi	%v1, 0, bnei_else.96486
	j	fbgt_cont.96483
bnei_else.96486:
	fneg	%f0, %f0
bnei_cont.96487:
	j	fbgt_cont.96483
fbgt_else.96482:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.96483:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.96479:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.96488
	addi	%v1, %zero, 0
	j	fbgt_cont.96489
fbgt_else.96488:
	addi	%v1, %zero, 1
fbgt_cont.96489:
	beqi	%v1, 0, bnei_else.96490
	flw	%f1, 462(%zero)
	j	bnei_cont.96491
bnei_else.96490:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 66(%sp)
	fblt	%f1, %f2, fbgt_else.96492
	addi	%v1, %zero, 1
	j	fbgt_cont.96493
fbgt_else.96492:
	addi	%v1, %zero, 0
fbgt_cont.96493:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.96494
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.96496
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.96497
fbgt_else.96496:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.96497:
	beqi	%v1, 0, bnei_else.96498
	j	fbgt_cont.96495
bnei_else.96498:
	fneg	%f1, %f1
bnei_cont.96499:
	j	fbgt_cont.96495
fbgt_else.96494:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.96495:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.96491:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 66(%sp)
	fblt	%f0, %f1, fbgt_else.96500
	addi	%v1, %zero, 0
	j	fbgt_cont.96501
fbgt_else.96500:
	addi	%v1, %zero, 1
fbgt_cont.96501:
	beqi	%v1, 0, bnei_else.96502
	fmov	%f0, %f1
	j	bnei_cont.96503
bnei_else.96502:
bnei_cont.96503:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.96475:
	j	bnei_cont.96469
bnei_else.96472:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 80(%sp)
	fsw	%f0, 81(%sp)
	fsw	%f2, 82(%sp)
	fblt	%f0, %f2, fbgt_else.96504
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.96506
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.96508
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.96510
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.96512
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.96514
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 83(%sp)
	addi	%sp, %sp, 84
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -84
	lw	%ra, 83(%sp)
	j	fbgt_cont.96505
fbgt_else.96514:
	fmov	%f0, %f3
fbgt_cont.96515:
	j	fbgt_cont.96505
fbgt_else.96512:
	fmov	%f0, %f3
fbgt_cont.96513:
	j	fbgt_cont.96505
fbgt_else.96510:
	fmov	%f0, %f3
fbgt_cont.96511:
	j	fbgt_cont.96505
fbgt_else.96508:
	fmov	%f0, %f3
fbgt_cont.96509:
	j	fbgt_cont.96505
fbgt_else.96506:
	fmov	%f0, %f3
fbgt_cont.96507:
	j	fbgt_cont.96505
fbgt_else.96504:
	fmov	%f0, %f2
fbgt_cont.96505:
	flw	%f1, 81(%sp)
	flw	%f2, 82(%sp)
	fblt	%f1, %f2, fbgt_else.96516
	fblt	%f1, %f0, fbgt_else.96518
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96520
	fblt	%f1, %f0, fbgt_else.96522
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 83(%sp)
	addi	%sp, %sp, 84
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -84
	lw	%ra, 83(%sp)
	j	fbgt_cont.96517
fbgt_else.96522:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 83(%sp)
	addi	%sp, %sp, 84
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -84
	lw	%ra, 83(%sp)
fbgt_cont.96523:
	j	fbgt_cont.96517
fbgt_else.96520:
	fmov	%f0, %f1
fbgt_cont.96521:
	j	fbgt_cont.96517
fbgt_else.96518:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96524
	fblt	%f1, %f0, fbgt_else.96526
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 83(%sp)
	addi	%sp, %sp, 84
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -84
	lw	%ra, 83(%sp)
	j	fbgt_cont.96525
fbgt_else.96526:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 83(%sp)
	addi	%sp, %sp, 84
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -84
	lw	%ra, 83(%sp)
fbgt_cont.96527:
	j	fbgt_cont.96525
fbgt_else.96524:
	fmov	%f0, %f1
fbgt_cont.96525:
fbgt_cont.96519:
	j	fbgt_cont.96517
fbgt_else.96516:
	fmov	%f0, %f1
fbgt_cont.96517:
	flw	%f1, 80(%sp)
	fblt	%f0, %f1, fbgt_else.96528
	addi	%v0, %zero, 0
	j	fbgt_cont.96529
fbgt_else.96528:
	addi	%v0, %zero, 1
fbgt_cont.96529:
	fblt	%f0, %f1, fbgt_else.96530
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96531
fbgt_else.96530:
fbgt_cont.96531:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96532
	beqi	%v0, 0, bnei_else.96534
	addi	%v0, %zero, 0
	j	fbgt_cont.96533
bnei_else.96534:
	addi	%v0, %zero, 1
bnei_cont.96535:
	j	fbgt_cont.96533
fbgt_else.96532:
fbgt_cont.96533:
	fblt	%f0, %f2, fbgt_else.96536
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96537
fbgt_else.96536:
fbgt_cont.96537:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96538
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.96539
fbgt_else.96538:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.96539:
	beqi	%v0, 0, bnei_else.96540
	j	bnei_cont.96541
bnei_else.96540:
	fneg	%f0, %f0
bnei_cont.96541:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.96473:
	j	bnei_cont.96469
bnei_else.96470:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 66(%sp)
	fblt	%f0, %f2, fbgt_else.96542
	addi	%v1, %zero, 1
	j	fbgt_cont.96543
fbgt_else.96542:
	addi	%v1, %zero, 0
fbgt_cont.96543:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 83(%sp)
	fsw	%f1, 84(%sp)
	fsw	%f0, 85(%sp)
	fsw	%f3, 86(%sp)
	fblt	%f0, %f3, fbgt_else.96544
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.96546
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.96548
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.96550
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.96552
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.96554
	flw	%f4, 482(%zero)
	fmov	%f1, %f4
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	j	fbgt_cont.96545
fbgt_else.96554:
	fmov	%f0, %f4
fbgt_cont.96555:
	j	fbgt_cont.96545
fbgt_else.96552:
	fmov	%f0, %f4
fbgt_cont.96553:
	j	fbgt_cont.96545
fbgt_else.96550:
	fmov	%f0, %f4
fbgt_cont.96551:
	j	fbgt_cont.96545
fbgt_else.96548:
	fmov	%f0, %f4
fbgt_cont.96549:
	j	fbgt_cont.96545
fbgt_else.96546:
	fmov	%f0, %f4
fbgt_cont.96547:
	j	fbgt_cont.96545
fbgt_else.96544:
	fmov	%f0, %f3
fbgt_cont.96545:
	flw	%f1, 85(%sp)
	flw	%f2, 86(%sp)
	fblt	%f1, %f2, fbgt_else.96556
	fblt	%f1, %f0, fbgt_else.96558
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96560
	fblt	%f1, %f0, fbgt_else.96562
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	j	fbgt_cont.96557
fbgt_else.96562:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
fbgt_cont.96563:
	j	fbgt_cont.96557
fbgt_else.96560:
	fmov	%f0, %f1
fbgt_cont.96561:
	j	fbgt_cont.96557
fbgt_else.96558:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96564
	fblt	%f1, %f0, fbgt_else.96566
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	j	fbgt_cont.96565
fbgt_else.96566:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
fbgt_cont.96567:
	j	fbgt_cont.96565
fbgt_else.96564:
	fmov	%f0, %f1
fbgt_cont.96565:
fbgt_cont.96559:
	j	fbgt_cont.96557
fbgt_else.96556:
	fmov	%f0, %f1
fbgt_cont.96557:
	flw	%f1, 84(%sp)
	fblt	%f0, %f1, fbgt_else.96568
	lw	%v0, 83(%sp)
	beqi	%v0, 0, bnei_else.96570
	addi	%v0, %zero, 0
	j	fbgt_cont.96569
bnei_else.96570:
	addi	%v0, %zero, 1
bnei_cont.96571:
	j	fbgt_cont.96569
fbgt_else.96568:
	lw	%v0, 83(%sp)
fbgt_cont.96569:
	fblt	%f0, %f1, fbgt_else.96572
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96573
fbgt_else.96572:
fbgt_cont.96573:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96574
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96575
fbgt_else.96574:
fbgt_cont.96575:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96576
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.96577
fbgt_else.96576:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.96577:
	beqi	%v0, 0, bnei_else.96578
	j	bnei_cont.96579
bnei_else.96578:
	fneg	%f0, %f0
bnei_cont.96579:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.96471:
	j	bnei_cont.96469
bnei_else.96468:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.96580
	addi	%v1, %zero, 0
	j	fbgt_cont.96581
fbgt_else.96580:
	addi	%v1, %zero, 1
fbgt_cont.96581:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.96582
	addi	%a0, %zero, 0
	j	fbgt_cont.96583
fbgt_else.96582:
	addi	%a0, %zero, 1
fbgt_cont.96583:
	beqi	%v1, 0, bnei_else.96584
	beqi	%a0, 0, bnei_else.96586
	flw	%f0, 450(%zero)
	j	bnei_cont.96585
bnei_else.96586:
	flw	%f0, 66(%sp)
bnei_cont.96587:
	j	bnei_cont.96585
bnei_else.96584:
	beqi	%a0, 0, bnei_else.96588
	flw	%f0, 66(%sp)
	j	bnei_cont.96589
bnei_else.96588:
	flw	%f0, 450(%zero)
bnei_cont.96589:
bnei_cont.96585:
	fsw	%f0, 146(%zero)
bnei_cont.96469:
	lw	%v0, 2(%sp)
	lw	%v1, 77(%sp)
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	beqi	%v0, 0, bnei_else.96590
	j	bnei_cont.96447
bnei_else.96590:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 66(%sp)
	fblt	%f1, %f0, fbgt_else.96592
	addi	%v0, %zero, 0
	j	fbgt_cont.96593
fbgt_else.96592:
	addi	%v0, %zero, 1
fbgt_cont.96593:
	beqi	%v0, 0, bnei_else.96594
	j	bnei_cont.96595
bnei_else.96594:
	fmov	%f0, %f1
bnei_cont.96595:
	flw	%f1, 76(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 79(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.96591:
	j	bnei_cont.96447
bnei_else.96446:
bnei_cont.96447:
bnei_cont.96283:
	addi	%a1, %zero, 116
	lw	%v0, 63(%sp)
	lw	%v1, 12(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	j	bnei_cont.96279
bnei_else.96278:
bnei_cont.96279:
	lw	%v0, 14(%sp)
	beqi	%v0, 3, bnei_else.96596
	lw	%v1, 182(%zero)
	lw	%a0, 13(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 87(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 88(%sp)
	addi	%sp, %sp, 89
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -89
	lw	%ra, 88(%sp)
	lw	%v0, 87(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 12(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.96598
	addi	%v1, %zero, 0
	j	fbgt_cont.96599
fbgt_else.96598:
	addi	%v1, %zero, 1
fbgt_cont.96599:
	beqi	%v1, 0, bnei_else.96600
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 88(%sp)
	sw	%v1, 89(%sp)
	fsw	%f1, 90(%sp)
	sw	%a0, 91(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.96602
	addi	%v0, %zero, 0
	j	fbgt_cont.96603
fbgt_else.96602:
	addi	%v0, %zero, 1
fbgt_cont.96603:
	beqi	%v0, 0, bnei_else.96604
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.96606
	addi	%v0, %zero, 0
	j	bnei_cont.96605
fbgt_else.96606:
	addi	%v0, %zero, 1
fbgt_cont.96607:
	j	bnei_cont.96605
bnei_else.96604:
	addi	%v0, %zero, 0
bnei_cont.96605:
	beqi	%v0, 0, bnei_else.96608
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 91(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.96610
	beqi	%a0, 2, bnei_else.96612
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.96614
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.96615
bnei_else.96614:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.96615:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 90(%sp)
	fbne	%f1, %f4, fbeq_else.96616
	addi	%a0, %zero, 1
	j	fbeq_cont.96617
fbeq_else.96616:
	addi	%a0, %zero, 0
fbeq_cont.96617:
	beqi	%a0, 0, bnei_else.96618
	flw	%f1, 491(%zero)
	j	bnei_cont.96619
bnei_else.96618:
	beqi	%v1, 0, bnei_else.96620
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.96621
bnei_else.96620:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.96621:
bnei_cont.96619:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.96611
bnei_else.96612:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.96613:
	j	bnei_cont.96611
bnei_else.96610:
	lw	%a0, 136(%zero)
	flw	%f0, 90(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.96622
	addi	%v1, %zero, 1
	j	fbeq_cont.96623
fbeq_else.96622:
	addi	%v1, %zero, 0
fbeq_cont.96623:
	beqi	%v1, 0, bnei_else.96624
	fmov	%f1, %f0
	j	bnei_cont.96625
bnei_else.96624:
	fblt	%f0, %f1, fbgt_else.96626
	addi	%v1, %zero, 0
	j	fbgt_cont.96627
fbgt_else.96626:
	addi	%v1, %zero, 1
fbgt_cont.96627:
	beqi	%v1, 0, bnei_else.96628
	flw	%f1, 491(%zero)
	j	bnei_cont.96629
bnei_else.96628:
	flw	%f1, 490(%zero)
bnei_cont.96629:
bnei_cont.96625:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.96611:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 92(%sp)
	beqi	%v1, 1, bnei_else.96630
	beqi	%v1, 2, bnei_else.96632
	beqi	%v1, 3, bnei_else.96634
	beqi	%v1, 4, bnei_else.96636
	j	bnei_cont.96631
bnei_else.96636:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.96638
	addi	%v1, %zero, 0
	j	fbgt_cont.96639
fbgt_else.96638:
	addi	%v1, %zero, 1
fbgt_cont.96639:
	beqi	%v1, 0, bnei_else.96640
	flw	%f0, 462(%zero)
	j	bnei_cont.96641
bnei_else.96640:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 90(%sp)
	fblt	%f0, %f1, fbgt_else.96642
	addi	%v1, %zero, 1
	j	fbgt_cont.96643
fbgt_else.96642:
	addi	%v1, %zero, 0
fbgt_cont.96643:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.96644
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.96646
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.96647
fbgt_else.96646:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.96647:
	beqi	%v1, 0, bnei_else.96648
	j	fbgt_cont.96645
bnei_else.96648:
	fneg	%f0, %f0
bnei_cont.96649:
	j	fbgt_cont.96645
fbgt_else.96644:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.96645:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.96641:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.96650
	addi	%v1, %zero, 0
	j	fbgt_cont.96651
fbgt_else.96650:
	addi	%v1, %zero, 1
fbgt_cont.96651:
	beqi	%v1, 0, bnei_else.96652
	flw	%f1, 462(%zero)
	j	bnei_cont.96653
bnei_else.96652:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 90(%sp)
	fblt	%f1, %f2, fbgt_else.96654
	addi	%v1, %zero, 1
	j	fbgt_cont.96655
fbgt_else.96654:
	addi	%v1, %zero, 0
fbgt_cont.96655:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.96656
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.96658
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.96659
fbgt_else.96658:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.96659:
	beqi	%v1, 0, bnei_else.96660
	j	fbgt_cont.96657
bnei_else.96660:
	fneg	%f1, %f1
bnei_cont.96661:
	j	fbgt_cont.96657
fbgt_else.96656:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.96657:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.96653:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 90(%sp)
	fblt	%f0, %f1, fbgt_else.96662
	addi	%v1, %zero, 0
	j	fbgt_cont.96663
fbgt_else.96662:
	addi	%v1, %zero, 1
fbgt_cont.96663:
	beqi	%v1, 0, bnei_else.96664
	fmov	%f0, %f1
	j	bnei_cont.96665
bnei_else.96664:
bnei_cont.96665:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.96637:
	j	bnei_cont.96631
bnei_else.96634:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 93(%sp)
	fsw	%f0, 94(%sp)
	fsw	%f2, 95(%sp)
	fblt	%f0, %f2, fbgt_else.96666
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.96668
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.96670
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.96672
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.96674
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.96676
	flw	%f3, 482(%zero)
	fmov	%f1, %f3
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.96667
fbgt_else.96676:
	fmov	%f0, %f3
fbgt_cont.96677:
	j	fbgt_cont.96667
fbgt_else.96674:
	fmov	%f0, %f3
fbgt_cont.96675:
	j	fbgt_cont.96667
fbgt_else.96672:
	fmov	%f0, %f3
fbgt_cont.96673:
	j	fbgt_cont.96667
fbgt_else.96670:
	fmov	%f0, %f3
fbgt_cont.96671:
	j	fbgt_cont.96667
fbgt_else.96668:
	fmov	%f0, %f3
fbgt_cont.96669:
	j	fbgt_cont.96667
fbgt_else.96666:
	fmov	%f0, %f2
fbgt_cont.96667:
	flw	%f1, 94(%sp)
	flw	%f2, 95(%sp)
	fblt	%f1, %f2, fbgt_else.96678
	fblt	%f1, %f0, fbgt_else.96680
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96682
	fblt	%f1, %f0, fbgt_else.96684
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.96679
fbgt_else.96684:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.96685:
	j	fbgt_cont.96679
fbgt_else.96682:
	fmov	%f0, %f1
fbgt_cont.96683:
	j	fbgt_cont.96679
fbgt_else.96680:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.96686
	fblt	%f1, %f0, fbgt_else.96688
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.96687
fbgt_else.96688:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.96689:
	j	fbgt_cont.96687
fbgt_else.96686:
	fmov	%f0, %f1
fbgt_cont.96687:
fbgt_cont.96681:
	j	fbgt_cont.96679
fbgt_else.96678:
	fmov	%f0, %f1
fbgt_cont.96679:
	flw	%f1, 93(%sp)
	fblt	%f0, %f1, fbgt_else.96690
	addi	%v0, %zero, 0
	j	fbgt_cont.96691
fbgt_else.96690:
	addi	%v0, %zero, 1
fbgt_cont.96691:
	fblt	%f0, %f1, fbgt_else.96692
	fsub	%f0, %f0, %f1
	j	fbgt_cont.96693
fbgt_else.96692:
fbgt_cont.96693:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.96694
	beqi	%v0, 0, bnei_else.96696
	addi	%v0, %zero, 0
	j	fbgt_cont.96695
bnei_else.96696:
	addi	%v0, %zero, 1
bnei_cont.96697:
	j	fbgt_cont.96695
fbgt_else.96694:
fbgt_cont.96695:
	fblt	%f0, %f2, fbgt_else.96698
	fsub	%f0, %f1, %f0
	j	fbgt_cont.96699
fbgt_else.96698:
fbgt_cont.96699:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.96700
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.96701
fbgt_else.96700:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.96701:
	beqi	%v0, 0, bnei_else.96702
	j	bnei_cont.96703
bnei_else.96702:
	fneg	%f0, %f0
bnei_cont.96703:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	jr	%ra