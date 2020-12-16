.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 13
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
	jr	%ra
# min_caml_read_float
min_caml_read_float:
	fmov	%f0, %fzero
	fin	%f0
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
kernel_sin.214:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 12(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 11(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 10(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.216:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 9(%zero)
	flw	%f3, 8(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 7(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 6(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
f.297:
	fblt	%f0, %f1, fbgt_else.472
	flw	%f2, 5(%zero)
	fmul	%f1, %f2, %f1
	j	f.297
fbgt_else.472:
	fmov	%f0, %f1
	jr	%ra
g.301:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.473
	fblt	%f0, %f1, fbgt_else.474
	fsub	%f0, %f0, %f1
	flw	%f2, 5(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.474:
	flw	%f2, 5(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.473:
	jr	%ra
reduction_2pi.220:
	flw	%f1, 4(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.297
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fmov	%f1, %f0
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.301
	sw	%v0, 0(%k1)
	flw	%f0, 1(%sp)
	fsw	%f0, 1(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
cos.222:
	flw	%f1, 3(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	reduction_2pi.220
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.475
	addi	%v0, %zero, 0
	j	fbgt_cont.476
fbgt_else.475:
	addi	%v0, %zero, 1
fbgt_cont.476:
	fblt	%f0, %f1, fbgt_else.477
	fsub	%f0, %f0, %f1
	j	fbgt_cont.478
fbgt_else.477:
fbgt_cont.478:
	flw	%f2, 2(%zero)
	fblt	%f0, %f2, fbgt_else.479
	beqi	%v0, 0, bnei_else.481
	addi	%v0, %zero, 0
	j	bnei_cont.482
bnei_else.481:
	addi	%v0, %zero, 1
bnei_cont.482:
	j	fbgt_cont.480
fbgt_else.479:
fbgt_cont.480:
	flw	%f2, 2(%zero)
	fblt	%f0, %f2, fbgt_else.483
	fsub	%f0, %f1, %f0
	j	fbgt_cont.484
fbgt_else.483:
fbgt_cont.484:
	flw	%f1, 1(%zero)
	sw	%v0, 1(%sp)
	fblt	%f1, %f0, fbgt_else.485
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_cos.216
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	fbgt_cont.486
fbgt_else.485:
	flw	%f1, 2(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_sin.214
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
fbgt_cont.486:
	lw	%v0, 1(%sp)
	beqi	%v0, 0, bnei_else.487
	jr	%ra
bnei_else.487:
	fneg	%f0, %f0
	jr	%ra
rad.228:
	flw	%f1, 0(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.228
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	cos.222
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
