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
	fsw	%f0, 0(%sp)
	fsw	%f11, 1(%sp)
	fsw	%f10, 2(%sp)
	fsw	%f8, 3(%sp)
	fsw	%f7, 4(%sp)
	fmov	%f1, %f6
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	flw	%f6, 5(%zero)
	fblt	%f6, %f0, fbgt_else.289
	fmov	%f6, %f1
	jr	%ra
fbgt_else.289:
	fsub	%f10, %f0, %f6
	fblt	%f6, %f10, fbgt_else.290
	j	fbgt_cont.291
fbgt_else.290:
	fsub	%f11, %f10, %f6
	fblt	%f6, %f11, fbgt_else.292
	j	fbgt_cont.293
fbgt_else.292:
	fsub	%f7, %f11, %f6
	fblt	%f6, %f7, fbgt_else.294
	j	fbgt_cont.295
fbgt_else.294:
	fsub	%f0, %f7, %f6
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	fmov	%f8, %f0
	flw	%f0, 4(%zero)
	fsub	%f0, %f7, %f0
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	fadd	%f7, %f8, %f0
fbgt_cont.295:
	flw	%f8, 4(%zero)
	fsub	%f11, %f11, %f8
	fblt	%f6, %f11, fbgt_else.296
	j	fbgt_cont.297
fbgt_else.296:
	fsub	%f0, %f11, %f6
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	fsw	%f0, 7(%sp)
	fsub	%f0, %f11, %f8
	addi	%sp, %sp, 8
	jal	float_fib.9
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fadd	%f11, %f1, %f0
fbgt_cont.297:
	fadd	%f11, %f7, %f11
fbgt_cont.293:
	flw	%f7, 4(%zero)
	fsub	%f10, %f10, %f7
	fblt	%f6, %f10, fbgt_else.298
	j	fbgt_cont.299
fbgt_else.298:
	fsub	%f8, %f10, %f6
	fblt	%f6, %f8, fbgt_else.300
	j	fbgt_cont.301
fbgt_else.300:
	fsub	%f0, %f8, %f6
	addi	%sp, %sp, 8
	jal	float_fib.9
	addi	%sp, %sp, -8
	fsw	%f0, 8(%sp)
	fsub	%f0, %f8, %f7
	addi	%sp, %sp, 9
	jal	float_fib.9
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fadd	%f8, %f1, %f0
fbgt_cont.301:
	fsub	%f10, %f10, %f7
	fblt	%f6, %f10, fbgt_else.302
	j	fbgt_cont.303
fbgt_else.302:
	fsub	%f0, %f10, %f6
	addi	%sp, %sp, 9
	jal	float_fib.9
	addi	%sp, %sp, -9
	fsw	%f0, 9(%sp)
	fsub	%f0, %f10, %f7
	addi	%sp, %sp, 10
	jal	float_fib.9
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fadd	%f10, %f1, %f0
fbgt_cont.303:
	fadd	%f10, %f8, %f10
fbgt_cont.299:
	fadd	%f10, %f11, %f10
fbgt_cont.291:
	fsw	%f10, 10(%sp)
	flw	%f7, 4(%zero)
	flw	%f0, 0(%sp)
	fsub	%f10, %f0, %f7
	fblt	%f6, %f10, fbgt_else.304
	fmov	%f0, %f10
	j	fbgt_cont.305
fbgt_else.304:
	fsub	%f11, %f10, %f6
	fblt	%f6, %f11, fbgt_else.306
	j	fbgt_cont.307
fbgt_else.306:
	fsub	%f8, %f11, %f6
	fblt	%f6, %f8, fbgt_else.308
	j	fbgt_cont.309
fbgt_else.308:
	fsub	%f0, %f8, %f6
	addi	%sp, %sp, 11
	jal	float_fib.9
	addi	%sp, %sp, -11
	fsw	%f0, 11(%sp)
	fsub	%f0, %f8, %f7
	addi	%sp, %sp, 12
	jal	float_fib.9
	addi	%sp, %sp, -12
	flw	%f1, 11(%sp)
	fadd	%f8, %f1, %f0
fbgt_cont.309:
	fsub	%f11, %f11, %f7
	fblt	%f6, %f11, fbgt_else.310
	j	fbgt_cont.311
fbgt_else.310:
	fsub	%f0, %f11, %f6
	addi	%sp, %sp, 12
	jal	float_fib.9
	addi	%sp, %sp, -12
	fsw	%f0, 12(%sp)
	fsub	%f0, %f11, %f7
	addi	%sp, %sp, 13
	jal	float_fib.9
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fadd	%f11, %f1, %f0
fbgt_cont.311:
	fadd	%f11, %f8, %f11
fbgt_cont.307:
	fsub	%f10, %f10, %f7
	fblt	%f6, %f10, fbgt_else.312
	j	fbgt_cont.313
fbgt_else.312:
	fsub	%f8, %f10, %f6
	fblt	%f6, %f8, fbgt_else.314
	j	fbgt_cont.315
fbgt_else.314:
	fsub	%f0, %f8, %f6
	addi	%sp, %sp, 13
	jal	float_fib.9
	addi	%sp, %sp, -13
	fsw	%f0, 13(%sp)
	fsub	%f0, %f8, %f7
	addi	%sp, %sp, 14
	jal	float_fib.9
	addi	%sp, %sp, -14
	flw	%f1, 13(%sp)
	fadd	%f8, %f1, %f0
fbgt_cont.315:
	fsub	%f10, %f10, %f7
	fblt	%f6, %f10, fbgt_else.316
	j	fbgt_cont.317
fbgt_else.316:
	fsub	%f0, %f10, %f6
	addi	%sp, %sp, 14
	jal	float_fib.9
	addi	%sp, %sp, -14
	fmov	%f6, %f0
	fsub	%f0, %f10, %f7
	addi	%sp, %sp, 14
	jal	float_fib.9
	addi	%sp, %sp, -14
	fadd	%f10, %f6, %f0
fbgt_cont.317:
	fadd	%f10, %f8, %f10
fbgt_cont.313:
	fadd	%f0, %f11, %f10
fbgt_cont.305:
	flw	%f11, 1(%sp)
	flw	%f10, 2(%sp)
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 3(%zero)
	jal	float_fib.9
	fsw	%f0, 0(%sp)
	flw	%f0, 2(%zero)
	fsw	%f0, 1(%sp)
	addi	%sp, %sp, 2
	jal	float_fib.9
	addi	%sp, %sp, -2
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 3
	jal	float_fib.9
	addi	%sp, %sp, -3
	fsw	%f0, 3(%sp)
	flw	%f0, 1(%zero)
	fsw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_fib.9
	addi	%sp, %sp, -5
	flw	%f1, 3(%sp)
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 5(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.9
	addi	%sp, %sp, -6
	fsw	%f0, 6(%sp)
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 7
	jal	float_fib.9
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.9
	addi	%sp, %sp, -8
	fsw	%f0, 8(%sp)
	flw	%f0, 0(%zero)
	addi	%sp, %sp, 9
	jal	float_fib.9
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fadd	%f1, %f1, %f0
	flw	%f0, 7(%sp)
	fadd	%f1, %f0, %f1
	flw	%f0, 5(%sp)
	fadd	%g0, %f0, %f1
	ret
