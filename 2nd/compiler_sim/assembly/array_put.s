.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 4
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
inprod.31:
	sw	%ra, 0(%sp)
	blti	%a0, 0, bgti_else.99
	add	%at, %v0, %a0
	flw	%f1, 0(%at)
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	fmul	%f0, %f1, %f0
	fsw	%f0, 1(%sp)
	addi	%a0, %a0, -1
	addi	%sp, %sp, 2
	jal	inprod.31
	addi	%sp, %sp, -2
	lw	%ra, 0(%sp)
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bgti_else.99:
	flw	%f0, 3(%zero)
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	sw	%v0, 0(%sp)
	flw	%f0, 2(%zero)
	fsw	%f0, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%sp)
	flw	%f0, 1(%zero)
	fsw	%f0, 0(%v0)
	fsw	%f0, 1(%v0)
	addi	%a0, %zero, 2
	sw	%a0, 3(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	flw	%f0, 0(%zero)
	fsw	%f0, 0(%v1)
	fsw	%f0, 1(%v1)
	fsw	%f0, 2(%v1)
	lw	%a0, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 4
	jal	inprod.31
	addi	%sp, %sp, -4
	ret
