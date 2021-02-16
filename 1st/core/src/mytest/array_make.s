.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 9
	ori	%sp, %sp, 10176
	lui	%hp, 0
	ori	%hp, %hp, 60000
# ------------ Initialize float table ---------
	lui	%at, 16529
	ori	%at, %at, 60293
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16285
	ori	%at, %at, 28836
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 0
	ori	%at, %at, 0
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
inprod.14:
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.39
	add	%at, %v0, %a0
	flw	%f0, 0(%at)
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fmul	%f0, %f0, %f1
	addi	%a0, %a0, -1
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	inprod.14
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
beq_else.39:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f0, 0(%at)# 0.000000
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	lui	%at, 0
	ori	%at, %at, 60001
	flw	%f0, 0(%at)# 1.230000
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 3
	lui	%at, 0
	ori	%at, %at, 60000
	flw	%f0, 0(%at)# 4.560000
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	addi	%a0, %zero, 2
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	inprod.14
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_float
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	ret
