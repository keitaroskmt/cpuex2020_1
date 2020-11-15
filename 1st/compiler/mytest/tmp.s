.section	".rodata"
.align	8
# Initialize register
	lui	%sp, 0
	ori	%sp, %sp, 8192
	lui	%hp, 0
	ori	%hp, %hp, 16384
# Initialize float table
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 0
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
.section	".text"
f.8:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.21
	flw	%f0, 16384(%zero)
	addi	%v0, %v0, -1
	fsw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	f.8
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
beq_else.21:
	flw	%f0, 16388(%zero)
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 10
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	f.8
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
