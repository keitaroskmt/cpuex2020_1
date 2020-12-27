.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 6
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
float_fib.9:
	flw	%f1, 5(%zero)
	fblt	%f1, %f0, fbgt_else.232
	jr	%ra
fbgt_else.232:
	flw	%f1, 5(%zero)
	fsub	%f1, %f0, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 0(%sp)
	fblt	%f2, %f1, fbgt_else.233
	fmov	%f0, %f1
	j	fbgt_cont.234
fbgt_else.233:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 1(%sp)
	fblt	%f3, %f2, fbgt_else.235
	fmov	%f0, %f2
	j	fbgt_cont.236
fbgt_else.235:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 5(%zero)
	fsw	%f2, 2(%sp)
	fblt	%f4, %f3, fbgt_else.237
	fmov	%f0, %f3
	j	fbgt_cont.238
fbgt_else.237:
	flw	%f4, 5(%zero)
	fsub	%f4, %f3, %f4
	fsw	%f3, 3(%sp)
	fmov	%f0, %f4
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_fib.9
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 3(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.9
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.238:
	flw	%f1, 4(%zero)
	flw	%f2, 2(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 5(%sp)
	fblt	%f2, %f1, fbgt_else.239
	fmov	%f0, %f1
	j	fbgt_cont.240
fbgt_else.239:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 6(%sp)
	fmov	%f0, %f2
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.9
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 6(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 7(%sp)
	fmov	%f0, %f1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	float_fib.9
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.240:
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.236:
	flw	%f1, 4(%zero)
	flw	%f2, 1(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 8(%sp)
	fblt	%f2, %f1, fbgt_else.241
	fmov	%f0, %f1
	j	fbgt_cont.242
fbgt_else.241:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 9(%sp)
	fblt	%f3, %f2, fbgt_else.243
	fmov	%f0, %f2
	j	fbgt_cont.244
fbgt_else.243:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	fsw	%f2, 10(%sp)
	fmov	%f0, %f3
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	float_fib.9
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 10(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 11(%sp)
	fmov	%f0, %f1
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	float_fib.9
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.244:
	flw	%f1, 4(%zero)
	flw	%f2, 9(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 12(%sp)
	fblt	%f2, %f1, fbgt_else.245
	fmov	%f0, %f1
	j	fbgt_cont.246
fbgt_else.245:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 13(%sp)
	fmov	%f0, %f2
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	float_fib.9
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 13(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 14(%sp)
	fmov	%f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	float_fib.9
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.246:
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.242:
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.234:
	flw	%f1, 4(%zero)
	flw	%f2, 0(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 15(%sp)
	fblt	%f2, %f1, fbgt_else.247
	fmov	%f0, %f1
	j	fbgt_cont.248
fbgt_else.247:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 16(%sp)
	fblt	%f3, %f2, fbgt_else.249
	fmov	%f0, %f2
	j	fbgt_cont.250
fbgt_else.249:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 5(%zero)
	fsw	%f2, 17(%sp)
	fblt	%f4, %f3, fbgt_else.251
	fmov	%f0, %f3
	j	fbgt_cont.252
fbgt_else.251:
	flw	%f4, 5(%zero)
	fsub	%f4, %f3, %f4
	fsw	%f3, 18(%sp)
	fmov	%f0, %f4
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	float_fib.9
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 18(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 19(%sp)
	fmov	%f0, %f1
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	float_fib.9
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.252:
	flw	%f1, 4(%zero)
	flw	%f2, 17(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 20(%sp)
	fblt	%f2, %f1, fbgt_else.253
	fmov	%f0, %f1
	j	fbgt_cont.254
fbgt_else.253:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 21(%sp)
	fmov	%f0, %f2
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	float_fib.9
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 21(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 22(%sp)
	fmov	%f0, %f1
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	float_fib.9
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 22(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.254:
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.250:
	flw	%f1, 4(%zero)
	flw	%f2, 16(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 23(%sp)
	fblt	%f2, %f1, fbgt_else.255
	fmov	%f0, %f1
	j	fbgt_cont.256
fbgt_else.255:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 24(%sp)
	fblt	%f3, %f2, fbgt_else.257
	fmov	%f0, %f2
	j	fbgt_cont.258
fbgt_else.257:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	fsw	%f2, 25(%sp)
	fmov	%f0, %f3
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	float_fib.9
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 25(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 26(%sp)
	fmov	%f0, %f1
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	float_fib.9
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 26(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.258:
	flw	%f1, 4(%zero)
	flw	%f2, 24(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 27(%sp)
	fblt	%f2, %f1, fbgt_else.259
	fmov	%f0, %f1
	j	fbgt_cont.260
fbgt_else.259:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 28(%sp)
	fmov	%f0, %f2
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	float_fib.9
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 28(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 29(%sp)
	fmov	%f0, %f1
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	float_fib.9
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f1, 29(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.260:
	flw	%f1, 27(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.256:
	flw	%f1, 23(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.248:
	flw	%f1, 15(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 3(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	float_fib.9
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 2(%zero)
	fsw	%f0, 0(%sp)
	fmov	%f0, %f1
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	float_fib.9
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%zero)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_fib.9
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%zero)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_fib.9
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%zero)
	fsw	%f0, 3(%sp)
	fmov	%f0, %f1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_fib.9
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 1(%zero)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.9
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%zero)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 0(%zero)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.9
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 3(%sp)
	fadd	%g0, %f1, %f0
	ret
