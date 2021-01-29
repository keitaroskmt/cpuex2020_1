.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 14
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
kernel_sin.213:
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 13(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fsub	%f15, %f0, %f1
	flw	%f1, 12(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f16
	fadd	%f15, %f15, %f1
	flw	%f1, 11(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f15, %f0
	jr	%ra
kernel_cos.215:
	fmul	%f16, %f0, %f0
	fmul	%f15, %f16, %f16
	flw	%f1, 10(%zero)
	flw	%f0, 9(%zero)
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 8(%zero)
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 7(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fsub	%f0, %f1, %f0
	jr	%ra
f.295:
	fmov	%f15, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	fblt	%f15, %f0, fbgt_else.678
	flw	%f1, 6(%zero)
	flw	%f0, 0(%sp)
	fmul	%f1, %f1, %f0
	lw	%ra, 1(%sp)
	fmov	%f0, %f15
	j	f.295
fbgt_else.678:
	lw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	jr	%ra
g.299:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f1, 1(%k1)
	flw	%f0, 0(%sp)
	fblt	%f0, %f1, fbgt_else.679
	flw	%f15, 1(%sp)
	flw	%f0, 0(%sp)
	fblt	%f0, %f15, fbgt_else.680
	flw	%f0, 0(%sp)
	flw	%f15, 1(%sp)
	fsub	%f0, %f0, %f15
	flw	%f1, 6(%zero)
	flw	%f15, 1(%sp)
	fdiv	%f1, %f15, %f1
	lw	%ra, 2(%sp)
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.680:
	flw	%f0, 6(%zero)
	flw	%f15, 1(%sp)
	fdiv	%f1, %f15, %f0
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.679:
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	jr	%ra
reduction_2pi.219:
	fsw	%f0, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	add	%k1, %zero, %ra
	flw	%f13, 5(%zero)
	flw	%f0, 0(%sp)
	fmov	%f1, %f13
	addi	%sp, %sp, 3
	jal	f.295
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, g.299
	sw	%a1, 0(%a0)
	fsw	%f13, 1(%a0)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	add	%ra, %zero, %k1
	flw	%f0, 0(%sp)
	addi	%k1, %a0, 0
	lw	%at, 0(%k1)
	jr	%at
cos.221:
	fmov	%f10, %f0
	fmov	%f11, %f0
	fmov	%f12, %f0
	fmov	%f13, %f0
	fmov	%f14, %f0
	fmov	%f5, %f0
	fmov	%f6, %f0
	fmov	%f7, %f0
	fmov	%f8, %f0
	fmov	%f9, %f0
	fsw	%f4, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f4, 4(%zero)
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.219
	addi	%sp, %sp, -3
	fblt	%f0, %f4, fbgt_else.681
	addi	%a2, %zero, 0
	j	fbgt_cont.682
fbgt_else.681:
	addi	%a2, %zero, 1
fbgt_cont.682:
	fblt	%f0, %f4, fbgt_else.683
	fsub	%f0, %f0, %f4
	j	fbgt_cont.684
fbgt_else.683:
fbgt_cont.684:
	flw	%f15, 3(%zero)
	fblt	%f0, %f15, fbgt_else.685
	beqi	%a2, 0, bnei_else.687
	addi	%a2, %zero, 0
	j	bnei_cont.688
bnei_else.687:
	addi	%a2, %zero, 1
bnei_cont.688:
	j	fbgt_cont.686
fbgt_else.685:
fbgt_cont.686:
	fblt	%f0, %f15, fbgt_else.689
	fsub	%f0, %f4, %f0
	j	fbgt_cont.690
fbgt_else.689:
fbgt_cont.690:
	flw	%f1, 2(%zero)
	fblt	%f1, %f0, fbgt_else.691
	addi	%sp, %sp, 3
	jal	kernel_cos.215
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	j	fbgt_cont.692
fbgt_else.691:
	fsub	%f0, %f15, %f0
	addi	%sp, %sp, 3
	jal	kernel_sin.213
	addi	%sp, %sp, -3
	fmov	%f1, %f0
fbgt_cont.692:
	beqi	%a2, 0, bnei_else.693
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f5
	fmov	%f0, %f6
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f4, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fmov	%f0, %f1
	jr	%ra
bnei_else.693:
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f5
	fmov	%f0, %f6
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f4, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f1
	jr	%ra
rad.227:
	flw	%f1, 1(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	addi	%sp, %sp, 0
	jal	rad.227
	addi	%sp, %sp, 0
	addi	%sp, %sp, 0
	jal	cos.221
	addi	%sp, %sp, 0
	fmov	%g0, %f0
	ret
