.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 0
	ori	%sp, %sp, 16384
	lui	%hp, 0
	ori	%hp, %hp, 8192
# ------------ Initialize float table ---------
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16320
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17352
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16512
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 0
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 19200
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
# ------------ Text Section -------------------
.section	".text"
	j	min_caml_start
# ------------ libmincaml.S -------------------
# min_caml_print_char
min_caml_print_char:
	out	%v0
	jr	%ra
# min_caml_print_int
min_caml_print_int:
	out	%v0
	srl	%v0, %v0, 8
	out	%v0
	srl	%v0, %v0, 8
	out	%v0
	srl	%v0, %v0, 8
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
	addi	%hp, %hp, 4
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
	addi	%hp, %hp, 4
	j	create_float_array_loop
# ------------ body ---------------------------
float_of_int_sub1.236:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.560
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.236
beq_else.560:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.239:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.561
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.239
beq_else.561:
	jr	%ra
float_of_int_sub3.241:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.562
	jr	%ra
beq_else.562:
	addi	%v0, %v0, -1
	flw	%f1, 8212(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.241
float_of_int.244:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.563
	addi	%v1, %zero, 0
	j	beq_cont.564
beq_else.563:
	addi	%v1, %zero, 1
beq_cont.564:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.565
	j	beq_cont.566
beq_else.565:
	sub	%v0, %zero, %v0
beq_cont.566:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.567
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub2.239
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	itof	%f0, %v0
	flw	%f1, 8212(%zero)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 0
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub1.236
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f0, 8208(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub3.241
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	j	beq_cont.568
beq_else.567:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	itof	%f0, %v0
	flw	%f1, 8212(%zero)
	fsub	%f0, %f0, %f1
beq_cont.568:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.569
	fneg	%f0, %f0
	jr	%ra
beq_else.569:
	jr	%ra
dbl.262:
	fadd	%f0, %f0, %f0
	jr	%ra
iloop.278:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.570
	addi	%v0, %zero, 1
	j	min_caml_print_int
beq_else.570:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	fsw	%f4, 0(%sp)
	sw	%v0, 4(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f5, 12(%sp)
	fsw	%f1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	dbl.262
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f0, %f1
	flw	%f5, 12(%sp)
	fadd	%f1, %f0, %f5
	flw	%f0, 8(%sp)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	flw	%f6, 8204(%zero)
	fslt	%at, %f6, %f4
	bne	%at, %zero, beq_else.571
	lw	%v0, 4(%sp)
	addi	%v0, %v0, -1
	flw	%f4, 0(%sp)
	j	iloop.278
beq_else.571:
	addi	%v0, %zero, 0
	j	min_caml_print_int
xloop.268:
	slti	%at, %v0, 400
	bne	%at, %zero, beq_else.572
	jr	%ra
beq_else.572:
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int.244
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	dbl.262
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8200(%zero)
	fdiv	%f0, %f0, %f1
	flw	%f1, 8196(%zero)
	fsub	%f0, %f0, %f1
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int.244
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	dbl.262
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8200(%zero)
	fdiv	%f0, %f0, %f1
	flw	%f1, 8192(%zero)
	fsub	%f5, %f0, %f1
	addi	%v0, %zero, 1000
	flw	%f0, 8208(%zero)
	flw	%f1, 8208(%zero)
	flw	%f2, 8208(%zero)
	flw	%f3, 8208(%zero)
	flw	%f4, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	iloop.278
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	xloop.268
yloop.264:
	slti	%at, %v0, 400
	bne	%at, %zero, beq_else.574
	jr	%ra
beq_else.574:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	xloop.268
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	yloop.264
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	yloop.264
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
