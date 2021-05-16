.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 435
	lui	%k1, 0
	ori	%k1, %k1, 1
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	flw	%f30, 0(%hp)
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
	beqi	%a0, 0, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 1, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 2, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 3, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	addi	%a0, %a0, -4
	j	create_array_loop
create_array_exit:
	jr	%ra
#  min_caml_create_float_array
min_caml_create_float_array:
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	beqi	%v1, 0, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 1, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 2, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 3, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	addi	%v1, %v1, -4
	j	create_float_array_loop
create_float_array_exit:
	jr	%ra
#  min_caml_create_extarray
min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
create_extarray_loop:
	beqi	%a1, 0, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 1, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 2, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 3, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	addi	%a1, %a1, -4
	j	create_extarray_loop
create_extarray_exit:
	jr	%ra
#  min_caml_create_float_extarray
min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
create_float_extarray_loop:
	beqi	%a0, 0, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 1, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 2, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 3, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	addi	%a0, %a0, -4
	j	create_float_extarray_loop
create_float_extarray_exit:
	jr	%ra
# ------------ body ---------------------------
.global	min_caml_start
min_caml_start:
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %k1, 0
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	sw	%zero, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%zero, 4(%zero)
	sw	%zero, 3(%zero)
	sw	%zero, 2(%zero)
	sw	%zero, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %k1, 0
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%a3, %zero, 3
	addi	%v1, %zero, 72
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 75
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 78
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	flw	%f0, 433(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%k0, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %k0, 0
	jal	min_caml_create_extarray
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 135
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	flw	%f0, 432(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 138
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 142
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 145
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 148
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 151
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%k0, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 156
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 158
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 159
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 162
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 165
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 168
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 171
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 174
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%k0, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	sw	%v0, 178(%zero)
	sw	%k0, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray
	addi	%v1, %zero, 184
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 184
	addi	%v0, %a3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 247
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %v0, 0
	addi	%a0, %zero, 247
	addi	%v1, %zero, 247
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 247
	sw	%v0, 248(%zero)
	sw	%a2, 247(%zero)
	addi	%v0, %zero, 180
	fsw	%fzero, 251(%zero)
	sw	%a0, 250(%zero)
	sw	%zero, 249(%zero)
	addi	%a0, %zero, 252
	addi	%v1, %zero, 249
	jal	min_caml_create_extarray
	add	%g0, %zero, %zero
	ret
