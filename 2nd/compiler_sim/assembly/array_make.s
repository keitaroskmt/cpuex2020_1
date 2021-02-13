.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 3
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
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	bne	%v1, %zero, create_float_array_cont
	jr	%ra
create_float_array_cont:
	fsw	%f0, 0(%hp)
	addi	%v1, %v1, -1
	addi	%hp, %hp, 1
	j	create_float_array_loop
#  min_caml_create_extarray
min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
create_extarray_loop:
	bne	%a1, %zero, create_extarray_cont
	jr	%ra
create_extarray_cont:
	sw	%v1, 0(%a0)
	addi	%a1, %a1, -1
	addi	%a0, %a0, 1
	j	create_extarray_loop
#  min_caml_create_float_extarray
min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
create_float_extarray_loop:
	bne	%a0, %zero, create_float_extarray_cont
	jr	%ra
create_float_extarray_cont:
	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -1
	addi	%v1, %v1, 1
	j	create_float_extarray_loop
# ------------ body ---------------------------
inprod.13:
	sw	%ra, 0(%sp)
	blti	%a0, 0, bgti_else.62
	add	%at, %v0, %a0
	flw	%f1, 0(%at)
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	fmul	%f0, %f1, %f0
	fsw	%f0, 1(%sp)
	addi	%a0, %a0, -1
	addi	%sp, %sp, 2
	jal	inprod.13
	addi	%sp, %sp, -2
	lw	%ra, 0(%sp)
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bgti_else.62:
	flw	%f0, 2(%zero)
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%a0, %zero, 3
	flw	%f0, 1(%zero)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_float_array
	addi	%sp, %sp, 0
	addi	%a1, %v0, 0
	flw	%f0, 0(%zero)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_float_array
	addi	%sp, %sp, 0
	addi	%v1, %v0, 0
	addi	%a0, %zero, 2
	addi	%v0, %a1, 0
	addi	%sp, %sp, 0
	jal	inprod.13
	addi	%sp, %sp, 0
	ret
