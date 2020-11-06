.section	".rodata"
.align	8
	ori	%at, %zero, 16880
	addi	%at, %zero, 16
	sll	%at, %at, %at
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	ori	%at, %zero, 16384
	addi	%at, %zero, 16
	sll	%at, %at, %at
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	ori	%at, %zero, 16256
	addi	%at, %zero, 16
	sll	%at, %at, %at
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
# Initialize register
	ori	%sp, %zero, 0
	addi	%at, %zero, 16
	sll	%sp, %sp, %at
	ori	%sp, %sp, 8192
	ori	%hp, %zero, 0
	addi	%at, %zero, 16
	sll	%hp, %hp, %at
	ori	%hp, %hp, 16384
.section	".text"
float_fib.10:
	flw	%v0, 16392(%zero)
	flw	%v0, 0(%at) # 1.000000
	flw	%f1, 0(%v0)
	fslt	%30, %f1, %f0
	fbne	%30, %f31, fbeq_else.31
	jr	%ra
fbeq_else.31:
	flw	%v0, 16392(%zero)
	flw	%v0, 0(%at) # 1.000000
	flw	%f1, 0(%v0)
	fsub	%f1, %f0, %f1
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %f31
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.10
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%v0, 16388(%zero)
	flw	%v0, 0(%at) # 2.000000
	flw	%f1, 0(%v0)
	flw	%f2, 0(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %f31
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
	flw	%v0, 16384(%zero)
	flw	%v0, 0(%at) # 30.000000
	flw	%f0, 0(%v0)
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
