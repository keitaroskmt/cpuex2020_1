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
float_fib.9:
	flw	%f1, 5(%zero)
	fblt	%f1, %f0, fbgt_else.355
	jr	%ra
fbgt_else.355:
	fsub	%f2, %f0, %f1
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fblt	%f1, %f2, fbgt_else.356
	fmov	%f0, %f2
	j	fbgt_cont.357
fbgt_else.356:
	fsub	%f3, %f2, %f1
	fsw	%f2, 2(%sp)
	fblt	%f1, %f3, fbgt_else.358
	fmov	%f0, %f3
	j	fbgt_cont.359
fbgt_else.358:
	fsub	%f4, %f3, %f1
	fsw	%f3, 3(%sp)
	fblt	%f1, %f4, fbgt_else.360
	fmov	%f0, %f4
	j	fbgt_cont.361
fbgt_else.360:
	fsub	%f5, %f4, %f1
	fsw	%f4, 4(%sp)
	fmov	%f0, %f5
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.9
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 4(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.361:
	flw	%f1, 4(%zero)
	flw	%f2, 3(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 6(%sp)
	fblt	%f3, %f2, fbgt_else.362
	fmov	%f0, %f2
	j	fbgt_cont.363
fbgt_else.362:
	fsub	%f4, %f2, %f3
	fsw	%f1, 7(%sp)
	fsw	%f2, 8(%sp)
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	float_fib.9
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 8(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	float_fib.9
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.363:
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.359:
	flw	%f1, 4(%zero)
	flw	%f2, 2(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 10(%sp)
	fblt	%f3, %f2, fbgt_else.364
	fmov	%f0, %f2
	j	fbgt_cont.365
fbgt_else.364:
	fsub	%f4, %f2, %f3
	fsw	%f1, 11(%sp)
	fsw	%f2, 12(%sp)
	fblt	%f3, %f4, fbgt_else.366
	fmov	%f0, %f4
	j	fbgt_cont.367
fbgt_else.366:
	fsub	%f5, %f4, %f3
	fsw	%f4, 13(%sp)
	fmov	%f0, %f5
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	float_fib.9
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 11(%sp)
	flw	%f2, 13(%sp)
	fsub	%f2, %f2, %f1
	fsw	%f0, 14(%sp)
	fmov	%f0, %f2
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	float_fib.9
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.367:
	flw	%f1, 11(%sp)
	flw	%f2, 12(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 15(%sp)
	fblt	%f3, %f2, fbgt_else.368
	fmov	%f0, %f2
	j	fbgt_cont.369
fbgt_else.368:
	fsub	%f4, %f2, %f3
	fsw	%f2, 16(%sp)
	fmov	%f0, %f4
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	float_fib.9
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 11(%sp)
	flw	%f2, 16(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 17(%sp)
	fmov	%f0, %f1
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	float_fib.9
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.369:
	flw	%f1, 15(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.365:
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.357:
	flw	%f1, 4(%zero)
	flw	%f2, 1(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 18(%sp)
	fblt	%f3, %f2, fbgt_else.370
	fmov	%f0, %f2
	j	fbgt_cont.371
fbgt_else.370:
	fsub	%f4, %f2, %f3
	fsw	%f1, 19(%sp)
	fsw	%f2, 20(%sp)
	fblt	%f3, %f4, fbgt_else.372
	fmov	%f0, %f4
	j	fbgt_cont.373
fbgt_else.372:
	fsub	%f5, %f4, %f3
	fsw	%f4, 21(%sp)
	fblt	%f3, %f5, fbgt_else.374
	fmov	%f0, %f5
	j	fbgt_cont.375
fbgt_else.374:
	fsub	%f6, %f5, %f3
	fsw	%f5, 22(%sp)
	fmov	%f0, %f6
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	float_fib.9
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 19(%sp)
	flw	%f2, 22(%sp)
	fsub	%f2, %f2, %f1
	fsw	%f0, 23(%sp)
	fmov	%f0, %f2
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	float_fib.9
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 23(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.375:
	flw	%f1, 19(%sp)
	flw	%f2, 21(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 24(%sp)
	fblt	%f3, %f2, fbgt_else.376
	fmov	%f0, %f2
	j	fbgt_cont.377
fbgt_else.376:
	fsub	%f4, %f2, %f3
	fsw	%f2, 25(%sp)
	fmov	%f0, %f4
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	float_fib.9
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 19(%sp)
	flw	%f2, 25(%sp)
	fsub	%f2, %f2, %f1
	fsw	%f0, 26(%sp)
	fmov	%f0, %f2
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	float_fib.9
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 26(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.377:
	flw	%f1, 24(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.373:
	flw	%f1, 19(%sp)
	flw	%f2, 20(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 27(%sp)
	fblt	%f3, %f2, fbgt_else.378
	fmov	%f0, %f2
	j	fbgt_cont.379
fbgt_else.378:
	fsub	%f4, %f2, %f3
	fsw	%f2, 28(%sp)
	fblt	%f3, %f4, fbgt_else.380
	fmov	%f0, %f4
	j	fbgt_cont.381
fbgt_else.380:
	fsub	%f5, %f4, %f3
	fsw	%f4, 29(%sp)
	fmov	%f0, %f5
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	float_fib.9
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f1, 19(%sp)
	flw	%f2, 29(%sp)
	fsub	%f2, %f2, %f1
	fsw	%f0, 30(%sp)
	fmov	%f0, %f2
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	float_fib.9
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f1, 30(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.381:
	flw	%f1, 19(%sp)
	flw	%f2, 28(%sp)
	fsub	%f2, %f2, %f1
	flw	%f3, 0(%sp)
	fsw	%f0, 31(%sp)
	fblt	%f3, %f2, fbgt_else.382
	fmov	%f0, %f2
	j	fbgt_cont.383
fbgt_else.382:
	fsub	%f3, %f2, %f3
	fsw	%f2, 32(%sp)
	fmov	%f0, %f3
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	float_fib.9
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	flw	%f1, 19(%sp)
	flw	%f2, 32(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 33(%sp)
	fmov	%f0, %f1
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	float_fib.9
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	flw	%f1, 33(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.383:
	flw	%f1, 31(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.379:
	flw	%f1, 27(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.371:
	flw	%f1, 18(%sp)
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
	fadd	%f1, %f1, %f0
	flw	%f2, 1(%zero)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_fib.9
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f1, %f1, %f0
	flw	%f2, 1(%sp)
	fadd	%f2, %f2, %f1
	flw	%f3, 0(%zero)
	fsw	%f2, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 3(%sp)
	fadd	%g0, %f1, %f0
	ret
