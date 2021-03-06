.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 9
	ori	%sp, %sp, 10176
	lui	%hp, 0
	ori	%hp, %hp, 60000
# ------------ Initialize float table ---------
	lui	%at, 15502
	ori	%at, %at, 64053
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16201
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16329
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16457
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16585
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 15027
	ori	%at, %at, 33030
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 15658
	ori	%at, %at, 42889
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16128
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 14669
	ori	%at, %at, 25782
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 15368
	ori	%at, %at, 34406
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 15914
	ori	%at, %at, 43692
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
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
# ------------ body ---------------------------
kernel_sin.214:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	lui	%at, 0
	ori	%at, %at, 60012
	flw	%f3, 0(%at)# 0.166667
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	lui	%at, 0
	ori	%at, %at, 60011
	flw	%f4, 0(%at)# 0.008333
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	lui	%at, 0
	ori	%at, %at, 60010
	flw	%f4, 0(%at)# 0.000196
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.216:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	lui	%at, 0
	ori	%at, %at, 60009
	flw	%f2, 0(%at)# 1.000000
	lui	%at, 0
	ori	%at, %at, 60008
	flw	%f3, 0(%at)# 0.500000
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	lui	%at, 0
	ori	%at, %at, 60007
	flw	%f3, 0(%at)# 0.041664
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	lui	%at, 0
	ori	%at, %at, 60006
	flw	%f3, 0(%at)# 0.001370
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
f.297:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.472
	lui	%at, 0
	ori	%at, %at, 60005
	flw	%f2, 0(%at)# 2.000000
	fmul	%f1, %f2, %f1
	j	f.297
beq_else.472:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.301:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.473
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.474
	fsub	%f0, %f0, %f1
	lui	%at, 0
	ori	%at, %at, 60005
	flw	%f2, 0(%at)# 2.000000
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.474:
	lui	%at, 0
	ori	%at, %at, 60005
	flw	%f2, 0(%at)# 2.000000
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.473:
	jr	%ra
reduction_2pi.220:
	lui	%at, 0
	ori	%at, %at, 60004
	flw	%f1, 0(%at)# 6.283185
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.297
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fadd	%f1, %f0, %fzero
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
	lui	%at, 0
	ori	%at, %at, 60003
	flw	%f1, 0(%at)# 3.141593
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	reduction_2pi.220
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.475
	addi	%v0, %zero, 0
	j	beq_cont.476
beq_else.475:
	addi	%v0, %zero, 1
beq_cont.476:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.477
	fsub	%f0, %f0, %f1
	j	beq_cont.478
beq_else.477:
beq_cont.478:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f2, 0(%at)# 1.570796
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.479
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.481
	addi	%v0, %zero, 1
	j	beq_cont.482
beq_else.481:
	addi	%v0, %zero, 0
beq_cont.482:
	j	beq_cont.480
beq_else.479:
beq_cont.480:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f2, 0(%at)# 1.570796
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.483
	fsub	%f0, %f1, %f0
	j	beq_cont.484
beq_else.483:
beq_cont.484:
	lui	%at, 0
	ori	%at, %at, 60001
	flw	%f1, 0(%at)# 0.785398
	sw	%v0, 1(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.485
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_cos.216
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.486
beq_else.485:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f1, 0(%at)# 1.570796
	fsub	%f0, %f1, %f0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_sin.214
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
beq_cont.486:
	lw	%v0, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.487
	fneg	%f0, %f0
	jr	%ra
beq_else.487:
	jr	%ra
rad.228:
	lui	%at, 0
	ori	%at, %at, 60000
	flw	%f1, 0(%at)# 0.017453
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
