.section	".rodata"
.align	8
# Initialize register
	lui	%sp, 0
	ori	%sp, %sp, 8192
	lui	%hp, 0
	ori	%hp, %hp, 16384
# Initialize float table
	lui	%at, 16672
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
.section	".text"
	j	min_caml_start
float_fib.10:
	flw	%f1, 16392(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.27
	jr	%ra
beq_else.27:
	flw	%f1, 16392(%zero)
	fsub	%f1, %f0, %f1
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.10
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 16388(%zero)
	flw	%f2, 0(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_fib.10
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 16384(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.10
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
