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
kernel_sin.219:
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
kernel_cos.221:
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
reduction_2pi_sub1.225:
	fblt	%f0, %f1, fbgt_else.488
	flw	%f2, 7(%zero)
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.225
fbgt_else.488:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.228:
	fblt	%f0, %f2, fbgt_else.489
	fblt	%f0, %f1, fbgt_else.490
	fsub	%f0, %f0, %f1
	flw	%f3, 7(%zero)
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.228
fbgt_else.490:
	flw	%f3, 7(%zero)
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.228
fbgt_else.489:
	jr	%ra
reduction_2pi.232:
	flw	%f1, 6(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi_sub1.225
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fmov	%f1, %f0
	flw	%f0, 1(%sp)
	flw	%f2, 0(%sp)
	j	reduction_2pi_sub2.228
sin.236:
	flw	%f1, 5(%zero)
	flw	%f2, 4(%zero)
	fblt	%f0, %f2, fbgt_else.491
	addi	%v0, %zero, 1
	j	fbgt_cont.492
fbgt_else.491:
	addi	%v0, %zero, 0
fbgt_cont.492:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi.232
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.493
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.495
	addi	%v0, %zero, 0
	j	bnei_cont.496
bnei_else.495:
	addi	%v0, %zero, 1
bnei_cont.496:
	j	fbgt_cont.494
fbgt_else.493:
	lw	%v0, 0(%sp)
fbgt_cont.494:
	fblt	%f0, %f1, fbgt_else.497
	fsub	%f0, %f0, %f1
	j	fbgt_cont.498
fbgt_else.497:
fbgt_cont.498:
	flw	%f2, 3(%zero)
	fblt	%f0, %f2, fbgt_else.499
	fsub	%f0, %f1, %f0
	j	fbgt_cont.500
fbgt_else.499:
fbgt_cont.500:
	flw	%f1, 2(%zero)
	sw	%v0, 2(%sp)
	fblt	%f1, %f0, fbgt_else.501
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_sin.219
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.502
fbgt_else.501:
	fsub	%f0, %f2, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_cos.221
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.502:
	lw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.503
	jr	%ra
bnei_else.503:
	fneg	%f0, %f0
	jr	%ra
rad.240:
	flw	%f1, 1(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.240
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.236
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	sin.236
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.236
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	fadd	%f1, %f2, %f1
	fadd	%g0, %f1, %f0
	ret
