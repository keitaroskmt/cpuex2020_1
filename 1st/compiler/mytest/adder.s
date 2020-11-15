.section	".rodata"
.align	8
# Initialize register
	lui	%sp, 0
	ori	%sp, %sp, 8192
	lui	%hp, 0
	ori	%hp, %hp, 16384
# Initialize float table
.section	".text"
	j	min_caml_start
adder.11:
	lw	%v1, 4(%k1)
	add	%v0, %v1, %v0
	jr	%ra
make_adder.5:
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a0, %zero, adder.11
	sw	%a0, 0(%v1)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %v1
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	make_adder.5
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%k1, %v0, 0
	addi	%v0, %zero, 7
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_int
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	ret
