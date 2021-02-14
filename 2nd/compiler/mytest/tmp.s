.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 435
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
rt.114:
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%a3, %zero, 1
	addi	%a2, %zero, 0
	addi	%a0, %zero, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	flw	%f1, 434(%zero)
	addi	%v1, %zero, 1
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%k0, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	sw	%a2, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a2, 4(%zero)
	sw	%a2, 3(%zero)
	sw	%a2, 2(%zero)
	sw	%a2, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	addi	%v0, %k0, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%s0, %zero, 3
	addi	%v1, %zero, 72
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 75
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 78
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	flw	%f0, 433(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%s1, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %s1, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 135
	addi	%v0, %a3, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 136
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	flw	%f0, 432(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 138
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 141
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 142
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 145
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 148
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 151
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%s1, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 156
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 158
	addi	%v0, %a3, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 159
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 162
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 165
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 168
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 171
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 174
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%a3, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	sw	%v0, 178(%zero)
	sw	%a3, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 184
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %k0, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v1, %zero, 247
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	addi	%sp, %sp, 0
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, 0
	addi	%a3, %v0, 0
	addi	%a0, %zero, 247
	addi	%v1, %zero, 247
	addi	%v0, %a2, 0
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%a0, %zero, 247
	sw	%v0, 248(%zero)
	sw	%a3, 247(%zero)
	addi	%v0, %zero, 180
	fsw	%f1, 251(%zero)
	sw	%a0, 250(%zero)
	sw	%a2, 249(%zero)
	addi	%a0, %zero, 252
	addi	%v1, %zero, 249
	addi	%sp, %sp, 0
	jal	min_caml_create_extarray
	addi	%sp, %sp, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 0
	jal	rt.114
	addi	%sp, %sp, 0
	ret
