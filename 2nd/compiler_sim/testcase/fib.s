.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 0
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
fib.9:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.179
	jr	%ra
bgt_else.179:
	addi	%v1, %v0, -1
	sw	%v0, 0(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.180
	add	%v0, %zero, %v1
	j	bgt_cont.181
bgt_else.180:
	addi	%a0, %v1, -1
	sw	%v1, 1(%sp)
	addi	%at, %zero, 1
	blt	%at, %a0, bgt_else.182
	add	%v0, %zero, %a0
	j	bgt_cont.183
bgt_else.182:
	addi	%a1, %a0, -1
	sw	%a0, 2(%sp)
	addi	%at, %zero, 1
	blt	%at, %a1, bgt_else.184
	add	%v0, %zero, %a1
	j	bgt_cont.185
bgt_else.184:
	addi	%a2, %a1, -1
	sw	%a1, 3(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fib.9
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fib.9
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	add	%v0, %v1, %v0
bgt_cont.185:
	lw	%v1, 2(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 5(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.186
	add	%v0, %zero, %v1
	j	bgt_cont.187
bgt_else.186:
	addi	%a0, %v1, -1
	sw	%v1, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fib.9
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	add	%v0, %v1, %v0
bgt_cont.187:
	lw	%v1, 5(%sp)
	add	%v0, %v1, %v0
bgt_cont.183:
	lw	%v1, 1(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 8(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.188
	add	%v0, %zero, %v1
	j	bgt_cont.189
bgt_else.188:
	addi	%a0, %v1, -1
	sw	%v1, 9(%sp)
	addi	%at, %zero, 1
	blt	%at, %a0, bgt_else.190
	add	%v0, %zero, %a0
	j	bgt_cont.191
bgt_else.190:
	addi	%a1, %a0, -1
	sw	%a0, 10(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fib.9
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	add	%v0, %v1, %v0
bgt_cont.191:
	lw	%v1, 9(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 12(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.192
	add	%v0, %zero, %v1
	j	bgt_cont.193
bgt_else.192:
	addi	%a0, %v1, -1
	sw	%v1, 13(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fib.9
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fib.9
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	add	%v0, %v1, %v0
bgt_cont.193:
	lw	%v1, 12(%sp)
	add	%v0, %v1, %v0
bgt_cont.189:
	lw	%v1, 8(%sp)
	add	%v0, %v1, %v0
bgt_cont.181:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 15(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.194
	add	%v0, %zero, %v1
	j	bgt_cont.195
bgt_else.194:
	addi	%a0, %v1, -1
	sw	%v1, 16(%sp)
	addi	%at, %zero, 1
	blt	%at, %a0, bgt_else.196
	add	%v0, %zero, %a0
	j	bgt_cont.197
bgt_else.196:
	addi	%a1, %a0, -1
	sw	%a0, 17(%sp)
	addi	%at, %zero, 1
	blt	%at, %a1, bgt_else.198
	add	%v0, %zero, %a1
	j	bgt_cont.199
bgt_else.198:
	addi	%a2, %a1, -1
	sw	%a1, 18(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fib.9
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fib.9
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v1, 19(%sp)
	add	%v0, %v1, %v0
bgt_cont.199:
	lw	%v1, 17(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 20(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.200
	add	%v0, %zero, %v1
	j	bgt_cont.201
bgt_else.200:
	addi	%a0, %v1, -1
	sw	%v1, 21(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	fib.9
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 22(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fib.9
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	add	%v0, %v1, %v0
bgt_cont.201:
	lw	%v1, 20(%sp)
	add	%v0, %v1, %v0
bgt_cont.197:
	lw	%v1, 16(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 23(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.202
	add	%v0, %zero, %v1
	j	bgt_cont.203
bgt_else.202:
	addi	%a0, %v1, -1
	sw	%v1, 24(%sp)
	addi	%at, %zero, 1
	blt	%at, %a0, bgt_else.204
	add	%v0, %zero, %a0
	j	bgt_cont.205
bgt_else.204:
	addi	%a1, %a0, -1
	sw	%a0, 25(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fib.9
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	fib.9
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	add	%v0, %v1, %v0
bgt_cont.205:
	lw	%v1, 24(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 27(%sp)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.206
	add	%v0, %zero, %v1
	j	bgt_cont.207
bgt_else.206:
	addi	%a0, %v1, -1
	sw	%v1, 28(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	fib.9
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	addi	%v1, %v1, -2
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	fib.9
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	add	%v0, %v1, %v0
bgt_cont.207:
	lw	%v1, 27(%sp)
	add	%v0, %v1, %v0
bgt_cont.203:
	lw	%v1, 23(%sp)
	add	%v0, %v1, %v0
bgt_cont.195:
	lw	%v1, 15(%sp)
	add	%v0, %v1, %v0
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 17
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	fib.9
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 16
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fib.9
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	add	%v1, %v1, %v0
	addi	%a0, %zero, 15
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fib.9
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	add	%v1, %v1, %v0
	lw	%a0, 1(%sp)
	add	%a0, %a0, %v1
	addi	%a1, %zero, 14
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	add	%v0, %v1, %v0
	lw	%v1, 4(%sp)
	add	%v0, %v1, %v0
	lw	%v1, 3(%sp)
	add	%g0, %v1, %v0
	ret
