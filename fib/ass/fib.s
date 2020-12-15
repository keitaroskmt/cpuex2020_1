.section	".rodata"
.align	8
.section	".text"
fib.10:
	addi	%at, %zero, 1
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.24
	jr	%ra
beq_else.24:
	addi	%v1, %v0, -1
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fib.10
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fib.10
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	add	%v0, %v1, %v0
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 30
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fib.10
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	#jal	min_caml_print_int
	nop
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
