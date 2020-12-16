.section	".rodata"
.align	8
	lui	%sp, 0
	ori	%sp, %sp, 16384
	lui	%hp, 0
	ori	%hp, %hp, 8192
	lui	%at, 16672
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16800
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16880
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 18804
	ori	%at, %at, 9216
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16256
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
.section	".text"
	j	min_caml_start
min_caml_print_char:
	out	%v0
	jr	%ra
min_caml_print_int:
	out	%v0
	srl	%v0, %v0, 8
	out	%v0
	srl	%v0, %v0, 8
	out	%v0
	srl	%v0, %v0, 8
	out	%v0
	jr	%ra
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
int_of_float_sub1.210:
	flw	%f1, 8216(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.507
	flw	%f1, 8216(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %v0, 1
	j	int_of_float_sub1.210
beq_else.507:
	jr	%ra
int_of_float_sub2.213:
	flw	%f1, 8216(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.508
	flw	%f1, 8216(%zero)
	fsub	%f0, %f0, %f1
	j	int_of_float_sub2.213
beq_else.508:
	jr	%ra
int_of_float_sub3.215:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.509
	add	%v0, %zero, %v1
	jr	%ra
beq_else.509:
	addi	%v0, %v0, -1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v1, %a0, %v1
	j	int_of_float_sub3.215
int_of_float.218:
	flw	%f1, 8212(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.510
	addi	%v0, %zero, 1
	j	beq_cont.511
beq_else.510:
	addi	%v0, %zero, 0
beq_cont.511:
	fabs	%f0, %f0
	flw	%f1, 8216(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.512
	fsw	%f0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	int_of_float_sub2.213
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8216(%zero)
	fadd	%f0, %f0, %f1
	ftoi	%v0, %f0
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	addi	%v1, %zero, 0
	flw	%f0, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	int_of_float_sub1.210
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	int_of_float_sub3.215
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 8(%sp)
	add	%v0, %v1, %v0
	j	beq_cont.513
beq_else.512:
	flw	%f1, 8216(%zero)
	fadd	%f0, %f0, %f1
	ftoi	%v1, %f0
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v1, %a0
beq_cont.513:
	lw	%v1, 0(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.514
	sub	%v0, %zero, %v0
	jr	%ra
beq_else.514:
	jr	%ra
tak.246:
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.515
	fadd	%f0, %fzero, %f2
	jr	%ra
beq_else.515:
	flw	%f3, 8208(%zero)
	fsub	%f3, %f0, %f3
	fsw	%f0, 0(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 8(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	tak.246
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8208(%zero)
	flw	%f2, 8(%sp)
	fsub	%f1, %f2, %f1
	flw	%f3, 4(%sp)
	flw	%f4, 0(%sp)
	fsw	%f0, 12(%sp)
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	tak.246
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 8208(%zero)
	flw	%f2, 4(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 0(%sp)
	flw	%f3, 8(%sp)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	tak.246
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	fadd	%f2, %f0, %fzero
	flw	%f0, 12(%sp)
	flw	%f1, 16(%sp)
	j	tak.246
.global	min_caml_start
min_caml_start:
	flw	%f0, 8204(%zero)
	flw	%f1, 8200(%zero)
	flw	%f2, 8196(%zero)
	flw	%f3, 8192(%zero)
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	tak.246
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	int_of_float.218
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_int
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
