.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 0
	ori	%sp, %sp, 16384
	lui	%hp, 0
	ori	%hp, %hp, 8192
# ------------ Initialize float table ---------
	lui	%at, 15502
	ori	%at, %at, 64053
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16201
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16329
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 0
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16457
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16585
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15027
	ori	%at, %at, 33030
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15658
	ori	%at, %at, 42889
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16128
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 14669
	ori	%at, %at, 25782
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15368
	ori	%at, %at, 34406
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15914
	ori	%at, %at, 43692
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
kernel_sin.214:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 8244(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 8240(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 8236(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.216:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 8232(%zero)
	flw	%f3, 8228(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 8224(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 8220(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
f.297:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.474
	flw	%f2, 8216(%zero)
	fmul	%f1, %f2, %f1
	j	f.297
beq_else.474:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.301:
	flw	%f2, 4(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.475
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.476
	fsub	%f0, %f0, %f1
	flw	%f2, 8216(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.476:
	flw	%f2, 8216(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.475:
	jr	%ra
reduction_2pi.220:
	flw	%f1, 8212(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	f.297
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fadd	%f1, %f0, %fzero
	add	%k1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%v0, %zero, g.301
	sw	%v0, 0(%k1)
	flw	%f0, 4(%sp)
	fsw	%f0, 4(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
sin.224:
	flw	%f1, 8208(%zero)
	flw	%f2, 8204(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.477
	addi	%v0, %zero, 1
	j	beq_cont.478
beq_else.477:
	addi	%v0, %zero, 0
beq_cont.478:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi.220
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.479
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.481
	addi	%v0, %zero, 1
	j	beq_cont.482
beq_else.481:
	addi	%v0, %zero, 0
beq_cont.482:
	j	beq_cont.480
beq_else.479:
	lw	%v0, 0(%sp)
beq_cont.480:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.483
	fsub	%f0, %f0, %f1
	j	beq_cont.484
beq_else.483:
beq_cont.484:
	flw	%f2, 8200(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.485
	fsub	%f0, %f1, %f0
	j	beq_cont.486
beq_else.485:
beq_cont.486:
	flw	%f1, 8196(%zero)
	sw	%v0, 8(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.487
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_sin.214
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	j	beq_cont.488
beq_else.487:
	flw	%f1, 8200(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_cos.216
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
beq_cont.488:
	lw	%v0, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.489
	fneg	%f0, %f0
	jr	%ra
beq_else.489:
	jr	%ra
rad.228:
	flw	%f1, 8192(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	rad.228
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	sin.224
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
