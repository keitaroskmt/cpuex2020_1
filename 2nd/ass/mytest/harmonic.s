.section	".rodata"
.align	8
	lui	%sp, 0
	ori	%sp, %sp, 16384
	lui	%hp, 0
	ori	%hp, %hp, 8192
	lui	%at, 16384
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
int_of_float_sub1.206:
	flw	%f1, 8208(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.489
	flw	%f1, 8208(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %v0, 1
	j	int_of_float_sub1.206
beq_else.489:
	jr	%ra
int_of_float_sub2.209:
	flw	%f1, 8208(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.490
	flw	%f1, 8208(%zero)
	fsub	%f0, %f0, %f1
	j	int_of_float_sub2.209
beq_else.490:
	jr	%ra
int_of_float_sub3.211:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.491
	add	%v0, %zero, %v1
	jr	%ra
beq_else.491:
	addi	%v0, %v0, -1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v1, %a0, %v1
	j	int_of_float_sub3.211
int_of_float.214:
	flw	%f1, 8204(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.492
	addi	%v0, %zero, 1
	j	beq_cont.493
beq_else.492:
	addi	%v0, %zero, 0
beq_cont.493:
	fabs	%f0, %f0
	flw	%f1, 8208(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.494
	fsw	%f0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	int_of_float_sub2.209
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8208(%zero)
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
	jal	int_of_float_sub1.206
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	int_of_float_sub3.211
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 8(%sp)
	add	%v0, %v1, %v0
	j	beq_cont.495
beq_else.494:
	flw	%f1, 8208(%zero)
	fadd	%f0, %f0, %f1
	ftoi	%v1, %f0
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v1, %a0
beq_cont.495:
	lw	%v1, 0(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.496
	sub	%v0, %zero, %v0
	jr	%ra
beq_else.496:
	jr	%ra
f.242:
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.497
	addi	%v1, %v1, 1
	flw	%f2, 8200(%zero)
	fadd	%f2, %f0, %f2
	flw	%f3, 8200(%zero)
	fdiv	%f0, %f3, %f0
	fadd	%f1, %f1, %f0
	fadd	%f0, %f2, %fzero
	j	f.242
beq_else.497:
	fadd	%f0, %fzero, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 8196(%zero)
	lui	%at, 1525
	ori	%at, %at, 57600
	add	%v0, %zero, %at
	addi	%v1, %zero, 2
	flw	%f1, 8192(%zero)
	flw	%f2, 8200(%zero)
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	f.242
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	int_of_float.214
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
