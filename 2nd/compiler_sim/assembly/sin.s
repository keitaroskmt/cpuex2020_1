.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 15
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
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 14(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 13(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 12(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.215:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 11(%zero)
	flw	%f3, 10(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 9(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 8(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
f.295:
	fblt	%f0, %f1, fbgt_else.473
	flw	%f2, 7(%zero)
	fmul	%f1, %f2, %f1
	j	f.295
fbgt_else.473:
	fmov	%f0, %f1
	jr	%ra
g.299:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.474
	fblt	%f0, %f1, fbgt_else.475
	fsub	%f0, %f0, %f1
	flw	%f2, 7(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.475:
	flw	%f2, 7(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.474:
	jr	%ra
reduction_2pi.219:
	flw	%f1, 6(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.295
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fmov	%f1, %f0
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.299
	sw	%v0, 0(%k1)
	flw	%f0, 1(%sp)
	fsw	%f0, 1(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
sin.223:
	flw	%f1, 5(%zero)
	flw	%f2, 4(%zero)
	fblt	%f0, %f2, fbgt_else.476
	addi	%v0, %zero, 1
	j	fbgt_cont.477
fbgt_else.476:
	addi	%v0, %zero, 0
fbgt_cont.477:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi.219
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.478
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.480
	addi	%v0, %zero, 0
	j	bnei_cont.481
bnei_else.480:
	addi	%v0, %zero, 1
bnei_cont.481:
	j	fbgt_cont.479
fbgt_else.478:
	lw	%v0, 0(%sp)
fbgt_cont.479:
	fblt	%f0, %f1, fbgt_else.482
	fsub	%f0, %f0, %f1
	j	fbgt_cont.483
fbgt_else.482:
fbgt_cont.483:
	flw	%f2, 3(%zero)
	fblt	%f0, %f2, fbgt_else.484
	fsub	%f0, %f1, %f0
	j	fbgt_cont.485
fbgt_else.484:
fbgt_cont.485:
	flw	%f1, 2(%zero)
	sw	%v0, 2(%sp)
	fblt	%f1, %f0, fbgt_else.486
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_sin.213
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.487
fbgt_else.486:
	fsub	%f0, %f2, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_cos.215
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.487:
	lw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.488
	jr	%ra
bnei_else.488:
	fneg	%f0, %f0
	jr	%ra
rad.227:
	flw	%f1, 1(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.227
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	sin.223
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fmov	%g0, %f0
	ret
