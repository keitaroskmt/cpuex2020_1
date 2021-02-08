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
kernel_atan.223:
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f1, 13(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fsub	%f16, %f0, %f1
	flw	%f1, 12(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 11(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 10(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 9(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 8(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fadd	%f0, %f16, %f0
	jr	%ra
atan.231:
	sw	%ra, 0(%sp)
	flw	%f1, 7(%zero)
	fblt	%f0, %f1, fbgt_else.567
	addi	%f0, %zero, 1
	j	fbgt_cont.568
fbgt_else.567:
fbgt_cont.568:
	fabs	%f16, %f0
	flw	%f1, 6(%zero)
	fblt	%f16, %f1, fbgt_else.569
	flw	%f0, 5(%zero)
	fblt	%f16, %f0, fbgt_else.570
	flw	%f0, 2(%zero)
	fsw	%f0, 1(%sp)
	flw	%f0, 3(%zero)
	fdiv	%f0, %f0, %f16
	addi	%sp, %sp, 2
	jal	kernel_atan.223
	addi	%sp, %sp, -2
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.571
fbgt_else.570:
	flw	%f0, 4(%zero)
	fsw	%f0, 2(%sp)
	flw	%f0, 3(%zero)
	fsub	%f1, %f16, %f0
	fadd	%f0, %f16, %f0
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 3
	jal	kernel_atan.223
	addi	%sp, %sp, -3
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.571:
	beqi	%f0, 0, bnei_else.572
	lw	%ra, 0(%sp)
	jr	%ra
bnei_else.572:
	lw	%ra, 0(%sp)
	fneg	%f0, %f0
	jr	%ra
fbgt_else.569:
	lw	%ra, 0(%sp)
	j	kernel_atan.223
rad.233:
	flw	%f1, 1(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	fsw	%f0, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.233
	addi	%sp, %sp, -1
	addi	%sp, %sp, 1
	jal	atan.231
	addi	%sp, %sp, -1
	fsw	%f0, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	rad.233
	addi	%sp, %sp, -2
	addi	%sp, %sp, 2
	jal	atan.231
	addi	%sp, %sp, -2
	fsw	%f0, 2(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 3
	jal	rad.233
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	atan.231
	addi	%sp, %sp, -3
	flw	%f16, 1(%sp)
	flw	%f1, 2(%sp)
	fadd	%f1, %f16, %f1
	fadd	%g0, %f1, %f0
	ret
