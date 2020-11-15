.section	".rodata"
.align	8
# Initialize register
	lui	%sp, 0
	ori	%sp, %sp, 8192
	lui	%hp, 0
	ori	%hp, %hp, 16384
# Initialize float table
	lui	%at, 16529
	ori	%at, %at, 60293
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16285
	ori	%at, %at, 28836
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
.section	".text"
inprod.32:
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.84
	sll	%a1, %a0, 2
	add	%at, %v0, %a1
	flw	%f0, 0(%at)
	sll	%a1, %a0, 2
	add	%at, %v1, %a1
	flw	%f1, 0(%at)
	fmul	%f0, %f0, %f1
	addi	%a0, %a0, -1
	fsw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	inprod.32
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
beq_else.84:
	flw	%v0, 16396(%zero)
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	flw	%f0, 16392(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f0, 16388(%zero)
	fsw	%f0, 0(%v0)
	flw	%f0, 16388(%zero)
	fsw	%f0, 4(%v0)
	flw	%f0, 16388(%zero)
	fsw	%f0, 8(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 16392(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 16384(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 16384(%zero)
	fsw	%f0, 4(%v1)
	flw	%f0, 16384(%zero)
	fsw	%f0, 8(%v1)
	addi	%a0, %zero, 2
	lw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	inprod.32
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
