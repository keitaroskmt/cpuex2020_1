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
.section	".text"
	j	min_caml_start
sin.3:
	fadd	%f0, %f0, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 16384(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	sin.3
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
