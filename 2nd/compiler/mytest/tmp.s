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
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	flw	%f0, 434(%zero)
	fsw	%f0, 2(%sp)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 60
	sw	%v0, 3(%sp)
	addi	%a1, %zero, 1
	sw	%a0, 10(%a1)
	sw	%a0, 9(%a1)
	sw	%a0, 8(%a1)
	sw	%a0, 7(%a1)
	lw	%a2, 1(%sp)
	sw	%a2, 6(%a1)
	sw	%a0, 5(%a1)
	sw	%a0, 4(%a1)
	sw	%a2, 3(%a1)
	sw	%a2, 2(%a1)
	sw	%a2, 1(%a1)
	sw	%a2, 0(%a1)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	addi	%v0, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%v1, %zero, 75
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%v1, %zero, 78
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	flw	%f0, 433(%zero)
	addi	%v1, %zero, 81
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%a0, %zero, 50
	sw	%a0, 5(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 83
	lw	%at, 0(%a0)
	addi	%a0, %zero, 133
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 135
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 136
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	flw	%f0, 432(%zero)
	addi	%v1, %zero, 137
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 138
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 141
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 142
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 145
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 148
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 151
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v0, %zero, 2
	sw	%v0, 6(%sp)
	addi	%a0, %zero, 154
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %zero, 156
	lw	%v1, 1(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 158
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 159
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 162
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 165
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 168
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 171
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 174
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 177
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%a0, %zero, 177
	sw	%v0, 1(%a0)
	lw	%a1, 7(%sp)
	sw	%a1, 0(%a0)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%v1, %zero, 247
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	sw	%v0, 8(%sp)
	addi	%a0, %zero, 247
	addi	%v1, %zero, 247
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	addi	%a0, %zero, 247
	sw	%v0, 1(%a0)
	lw	%a1, 8(%sp)
	sw	%a1, 0(%a0)
	addi	%v0, %zero, 180
	addi	%a1, %zero, 249
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%a1)
	sw	%a0, 1(%a1)
	lw	%a0, 1(%sp)
	sw	%a0, 0(%a1)
	addi	%a0, %zero, 252
	addi	%v1, %zero, 249
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	ret
