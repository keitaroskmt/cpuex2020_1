.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 0
	lui	%k1, 0
	ori	%k1, %k1, 1
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	flw	%f30, 0(%hp)
	lui	%at, 15395
	ori	%at, %at, 55050
	sw	%at, 0(%hp)
	flw	%f9, 0(%hp)
	lui	%at, 48716
	ori	%at, %at, 52429
	sw	%at, 0(%hp)
	flw	%f10, 0(%hp)
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
fib.9:
	sw	%v0, 0(%sp)
	sw	%t2, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blt	%k1, %v0, bgt_else.258
	jr	%ra
bgt_else.258:
	addi	%t0, %v0, -1
	blt	%k1, %t0, bgt_else.259
	j	bgt_cont.260
bgt_else.259:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.261
	j	bgt_cont.262
bgt_else.261:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.263
	j	bgt_cont.264
bgt_else.263:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 5
	jal	fib.9
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 6
	jal	fib.9
	addi	%sp, %sp, -6
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.264:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.265
	j	bgt_cont.266
bgt_else.265:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 6
	jal	fib.9
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.266:
	add	%t1, %t2, %t1
bgt_cont.262:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.267
	j	bgt_cont.268
bgt_else.267:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.269
	j	bgt_cont.270
bgt_else.269:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 8
	jal	fib.9
	addi	%sp, %sp, -8
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.270:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.271
	j	bgt_cont.272
bgt_else.271:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 8
	jal	fib.9
	addi	%sp, %sp, -8
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.272:
	add	%t0, %t2, %t0
bgt_cont.268:
	add	%t0, %t1, %t0
bgt_cont.260:
	sw	%t0, 9(%sp)
	lw	%a0, 0(%sp)
	addi	%t0, %a0, -2
	blt	%k1, %t0, bgt_else.273
	add	%a0, %zero, %t0
	j	bgt_cont.274
bgt_else.273:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.275
	j	bgt_cont.276
bgt_else.275:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.277
	j	bgt_cont.278
bgt_else.277:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 10
	jal	fib.9
	addi	%sp, %sp, -10
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 11
	jal	fib.9
	addi	%sp, %sp, -11
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.278:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.279
	j	bgt_cont.280
bgt_else.279:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 11
	jal	fib.9
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.280:
	add	%t1, %t2, %t1
bgt_cont.276:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.281
	j	bgt_cont.282
bgt_else.281:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.283
	j	bgt_cont.284
bgt_else.283:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 13
	jal	fib.9
	addi	%sp, %sp, -13
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.284:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.285
	j	bgt_cont.286
bgt_else.285:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 13
	jal	fib.9
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.286:
	add	%t0, %t2, %t0
bgt_cont.282:
	add	%a0, %t1, %t0
bgt_cont.274:
	lw	%t2, 1(%sp)
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%a1, 9(%sp)
	add	%v0, %a1, %a0
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 17
	jal	fib.9
	addi	%a2, %v0, 0
	addi	%v0, %zero, 16
	jal	fib.9
	addi	%a3, %v0, 0
	add	%k0, %a2, %a3
	addi	%v0, %zero, 15
	jal	fib.9
	addi	%a2, %v0, 0
	add	%fp, %a3, %a2
	add	%a3, %k0, %fp
	addi	%v0, %zero, 14
	jal	fib.9
	add	%a0, %a2, %v0
	add	%a0, %fp, %a0
	add	%g0, %a3, %a0
	ret
