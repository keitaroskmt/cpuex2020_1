.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 6
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
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.561
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.236
beq_else.561:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.239:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.562
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.239
beq_else.562:
	jr	%ra
float_of_int_sub3.241:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.563
	jr	%ra
beq_else.563:
	addi	%v0, %v0, -1
	flw	%f1, 5(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.241
float_of_int.244:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.564
	addi	%v1, %zero, 0
	j	beq_cont.565
beq_else.564:
	addi	%v1, %zero, 1
beq_cont.565:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.566
	j	beq_cont.567
beq_else.566:
	sub	%v0, %zero, %v0
beq_cont.567:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.568
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int_sub2.239
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_itof
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 5(%zero)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 0
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub1.236
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 4(%zero)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub3.241
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	j	beq_cont.569
beq_else.568:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_itof
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 5(%zero)
	fsub	%f0, %f0, %f1
beq_cont.569:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.570
	fneg	%f0, %f0
	jr	%ra
beq_else.570:
	jr	%ra
dbl.262:
	fadd	%f0, %f0, %f0
	jr	%ra
iloop.278:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.571
	addi	%v0, %zero, 1
	j	min_caml_print_int
beq_else.571:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	fsw	%f4, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f5, 3(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	dbl.262
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f5, 3(%sp)
	fadd	%f1, %f0, %f5
	flw	%f0, 2(%sp)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	flw	%f6, 3(%zero)
	fslt	%at, %f6, %f4
	bne	%at, %zero, beq_else.572
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	flw	%f4, 0(%sp)
	j	iloop.278
beq_else.572:
	addi	%v0, %zero, 0
	j	min_caml_print_int
xloop.268:
	slti	%at, %v0, 400
	bne	%at, %zero, beq_else.573
	jr	%ra
beq_else.573:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int.244
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	dbl.262
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
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
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	dbl.262
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%zero)
	fdiv	%f0, %f0, %f1
	flw	%f1, 0(%zero)
	fsub	%f5, %f0, %f1
	addi	%v0, %zero, 1000
	flw	%f0, 4(%zero)
	flw	%f1, 4(%zero)
	flw	%f2, 4(%zero)
	flw	%f3, 4(%zero)
	flw	%f4, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	iloop.278
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	xloop.268
yloop.264:
	slti	%at, %v0, 400
	bne	%at, %zero, beq_else.575
	jr	%ra
beq_else.575:
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
