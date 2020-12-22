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
inprod.32:
	blti	%a0, 0, bgti_else.130
	add	%at, %v0, %a0
	flw	%f0, 0(%at)
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fmul	%f0, %f0, %f1
	addi	%a0, %a0, -1
	fsw	%f0, 0(%sp)
	blti	%a0, 0, bgti_else.131
	add	%at, %v0, %a0
	flw	%f1, 0(%at)
	add	%at, %v1, %a0
	flw	%f2, 0(%at)
	fmul	%f1, %f1, %f2
	addi	%a0, %a0, -1
	fsw	%f1, 1(%sp)
	blti	%a0, 0, bgti_else.133
	add	%at, %v0, %a0
	flw	%f2, 0(%at)
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	fmul	%f2, %f2, %f3
	addi	%a0, %a0, -1
	fsw	%f2, 2(%sp)
	blti	%a0, 0, bgti_else.135
	add	%at, %v0, %a0
	flw	%f3, 0(%at)
	add	%at, %v1, %a0
	flw	%f4, 0(%at)
	fmul	%f3, %f3, %f4
	addi	%a0, %a0, -1
	fsw	%f3, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	inprod.32
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
	j	bgti_cont.136
bgti_else.135:
	flw	%f0, 3(%zero)
bgti_cont.136:
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	j	bgti_cont.134
bgti_else.133:
	flw	%f0, 3(%zero)
bgti_cont.134:
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	j	bgti_cont.132
bgti_else.131:
	flw	%f0, 3(%zero)
bgti_cont.132:
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bgti_else.130:
	flw	%f0, 3(%zero)
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	flw	%f0, 2(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f0, 1(%zero)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%zero)
	fsw	%f0, 1(%v0)
	flw	%f0, 1(%zero)
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 2(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 0(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 0(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 0(%zero)
	fsw	%f0, 2(%v1)
	lw	%v0, 0(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	flw	%f2, 0(%v0)
	flw	%f3, 0(%v1)
	fmul	%f2, %f2, %f3
	addi	%a0, %zero, -1
	fsw	%f0, 1(%sp)
	fsw	%f1, 2(%sp)
	fsw	%f2, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	inprod.32
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_float
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	ret
