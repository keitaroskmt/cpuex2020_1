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
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.265
	jr	%ra
bgt_else.265:
	addi	%t0, %v0, -1
	blt	%k1, %t0, bgt_else.266
	j	bgt_cont.267
bgt_else.266:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.268
	j	bgt_cont.269
bgt_else.268:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.270
	j	bgt_cont.271
bgt_else.270:
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
bgt_cont.271:
	blt	%at, %t2, bgt_else.272
	j	bgt_cont.273
bgt_else.272:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 6
	jal	fib.9
	addi	%sp, %sp, -6
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 6
	jal	fib.9
	addi	%sp, %sp, -6
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.273:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.274
	j	bgt_cont.275
bgt_else.274:
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
bgt_cont.275:
	blt	%at, %t1, bgt_else.276
	j	bgt_cont.277
bgt_else.276:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.277:
	add	%t1, %t2, %t1
bgt_cont.269:
	blt	%at, %t1, bgt_else.278
	j	bgt_cont.279
bgt_else.278:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.280
	j	bgt_cont.281
bgt_else.280:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.281:
	blt	%at, %t2, bgt_else.282
	j	bgt_cont.283
bgt_else.282:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.283:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.284
	j	bgt_cont.285
bgt_else.284:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.285:
	blt	%at, %t1, bgt_else.286
	j	bgt_cont.287
bgt_else.286:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 7
	jal	fib.9
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.287:
	add	%t1, %t2, %t1
bgt_cont.279:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.288
	j	bgt_cont.289
bgt_else.288:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.290
	j	bgt_cont.291
bgt_else.290:
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
bgt_cont.291:
	blt	%at, %t2, bgt_else.292
	j	bgt_cont.293
bgt_else.292:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 8
	jal	fib.9
	addi	%sp, %sp, -8
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 8
	jal	fib.9
	addi	%sp, %sp, -8
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.293:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.294
	j	bgt_cont.295
bgt_else.294:
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
bgt_cont.295:
	blt	%at, %t0, bgt_else.296
	j	bgt_cont.297
bgt_else.296:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.297:
	add	%t0, %t2, %t0
bgt_cont.289:
	blt	%at, %t0, bgt_else.298
	j	bgt_cont.299
bgt_else.298:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.300
	j	bgt_cont.301
bgt_else.300:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.301:
	blt	%at, %t2, bgt_else.302
	j	bgt_cont.303
bgt_else.302:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.303:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.304
	j	bgt_cont.305
bgt_else.304:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.305:
	blt	%at, %t0, bgt_else.306
	j	bgt_cont.307
bgt_else.306:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.307:
	add	%t0, %t2, %t0
bgt_cont.299:
	add	%t0, %t1, %t0
bgt_cont.267:
	blt	%at, %t0, bgt_else.308
	j	bgt_cont.309
bgt_else.308:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.310
	j	bgt_cont.311
bgt_else.310:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.312
	j	bgt_cont.313
bgt_else.312:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.313:
	blt	%at, %t2, bgt_else.314
	j	bgt_cont.315
bgt_else.314:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.315:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.316
	j	bgt_cont.317
bgt_else.316:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.317:
	blt	%at, %t1, bgt_else.318
	j	bgt_cont.319
bgt_else.318:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.319:
	add	%t1, %t2, %t1
bgt_cont.311:
	blt	%at, %t1, bgt_else.320
	j	bgt_cont.321
bgt_else.320:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.322
	j	bgt_cont.323
bgt_else.322:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.323:
	blt	%at, %t2, bgt_else.324
	j	bgt_cont.325
bgt_else.324:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 5(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 5(%sp)
	add	%t2, %a0, %v0
bgt_cont.325:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.326
	j	bgt_cont.327
bgt_else.326:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.327:
	blt	%at, %t1, bgt_else.328
	j	bgt_cont.329
bgt_else.328:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 6(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 6(%sp)
	add	%t1, %a0, %v0
bgt_cont.329:
	add	%t1, %t2, %t1
bgt_cont.321:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.330
	j	bgt_cont.331
bgt_else.330:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.332
	j	bgt_cont.333
bgt_else.332:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.333:
	blt	%at, %t2, bgt_else.334
	j	bgt_cont.335
bgt_else.334:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.335:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.336
	j	bgt_cont.337
bgt_else.336:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.337:
	blt	%at, %t0, bgt_else.338
	j	bgt_cont.339
bgt_else.338:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.339:
	add	%t0, %t2, %t0
bgt_cont.331:
	blt	%at, %t0, bgt_else.340
	j	bgt_cont.341
bgt_else.340:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.342
	j	bgt_cont.343
bgt_else.342:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.343:
	blt	%at, %t2, bgt_else.344
	j	bgt_cont.345
bgt_else.344:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 7(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 7(%sp)
	add	%t2, %a0, %v0
bgt_cont.345:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.346
	j	bgt_cont.347
bgt_else.346:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.347:
	blt	%at, %t0, bgt_else.348
	j	bgt_cont.349
bgt_else.348:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	sw	%v0, 8(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 9
	jal	fib.9
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	add	%t0, %a0, %v0
bgt_cont.349:
	add	%t0, %t2, %t0
bgt_cont.341:
	add	%t0, %t1, %t0
bgt_cont.309:
	sw	%t0, 9(%sp)
	lw	%a0, 0(%sp)
	addi	%t0, %a0, -2
	blt	%k1, %t0, bgt_else.350
	add	%a0, %zero, %t0
	j	bgt_cont.351
bgt_else.350:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.352
	j	bgt_cont.353
bgt_else.352:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.354
	j	bgt_cont.355
bgt_else.354:
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
bgt_cont.355:
	blt	%at, %t2, bgt_else.356
	j	bgt_cont.357
bgt_else.356:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 11
	jal	fib.9
	addi	%sp, %sp, -11
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 11
	jal	fib.9
	addi	%sp, %sp, -11
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.357:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.358
	j	bgt_cont.359
bgt_else.358:
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
bgt_cont.359:
	blt	%at, %t1, bgt_else.360
	j	bgt_cont.361
bgt_else.360:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.361:
	add	%t1, %t2, %t1
bgt_cont.353:
	blt	%at, %t1, bgt_else.362
	j	bgt_cont.363
bgt_else.362:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.364
	j	bgt_cont.365
bgt_else.364:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.365:
	blt	%at, %t2, bgt_else.366
	j	bgt_cont.367
bgt_else.366:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.367:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.368
	j	bgt_cont.369
bgt_else.368:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.369:
	blt	%at, %t1, bgt_else.370
	j	bgt_cont.371
bgt_else.370:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 12
	jal	fib.9
	addi	%sp, %sp, -12
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.371:
	add	%t1, %t2, %t1
bgt_cont.363:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.372
	j	bgt_cont.373
bgt_else.372:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.374
	j	bgt_cont.375
bgt_else.374:
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
bgt_cont.375:
	blt	%at, %t2, bgt_else.376
	j	bgt_cont.377
bgt_else.376:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 13
	jal	fib.9
	addi	%sp, %sp, -13
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 13
	jal	fib.9
	addi	%sp, %sp, -13
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.377:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.378
	j	bgt_cont.379
bgt_else.378:
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
bgt_cont.379:
	blt	%at, %t0, bgt_else.380
	j	bgt_cont.381
bgt_else.380:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.381:
	add	%t0, %t2, %t0
bgt_cont.373:
	blt	%at, %t0, bgt_else.382
	j	bgt_cont.383
bgt_else.382:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.384
	j	bgt_cont.385
bgt_else.384:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.385:
	blt	%at, %t2, bgt_else.386
	j	bgt_cont.387
bgt_else.386:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.387:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.388
	j	bgt_cont.389
bgt_else.388:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.389:
	blt	%at, %t0, bgt_else.390
	j	bgt_cont.391
bgt_else.390:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.391:
	add	%t0, %t2, %t0
bgt_cont.383:
	add	%a0, %t1, %t0
bgt_cont.351:
	blt	%at, %t0, bgt_else.392
	add	%a0, %zero, %t0
	j	bgt_cont.393
bgt_else.392:
	addi	%t1, %t0, -1
	blt	%k1, %t1, bgt_else.394
	j	bgt_cont.395
bgt_else.394:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.396
	j	bgt_cont.397
bgt_else.396:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.397:
	blt	%at, %t2, bgt_else.398
	j	bgt_cont.399
bgt_else.398:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.399:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.400
	j	bgt_cont.401
bgt_else.400:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.401:
	blt	%at, %t1, bgt_else.402
	j	bgt_cont.403
bgt_else.402:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.403:
	add	%t1, %t2, %t1
bgt_cont.395:
	blt	%at, %t1, bgt_else.404
	j	bgt_cont.405
bgt_else.404:
	addi	%t2, %t1, -1
	blt	%k1, %t2, bgt_else.406
	j	bgt_cont.407
bgt_else.406:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.407:
	blt	%at, %t2, bgt_else.408
	j	bgt_cont.409
bgt_else.408:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 10(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 10(%sp)
	add	%t2, %a0, %v0
bgt_cont.409:
	addi	%t1, %t1, -2
	blt	%k1, %t1, bgt_else.410
	j	bgt_cont.411
bgt_else.410:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.411:
	blt	%at, %t1, bgt_else.412
	j	bgt_cont.413
bgt_else.412:
	addi	%v0, %t1, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 11(%sp)
	addi	%v0, %t1, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 11(%sp)
	add	%t1, %a0, %v0
bgt_cont.413:
	add	%t1, %t2, %t1
bgt_cont.405:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.414
	j	bgt_cont.415
bgt_else.414:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.416
	j	bgt_cont.417
bgt_else.416:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.417:
	blt	%at, %t2, bgt_else.418
	j	bgt_cont.419
bgt_else.418:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.419:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.420
	j	bgt_cont.421
bgt_else.420:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.421:
	blt	%at, %t0, bgt_else.422
	j	bgt_cont.423
bgt_else.422:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.423:
	add	%t0, %t2, %t0
bgt_cont.415:
	blt	%at, %t0, bgt_else.424
	j	bgt_cont.425
bgt_else.424:
	addi	%t2, %t0, -1
	blt	%k1, %t2, bgt_else.426
	j	bgt_cont.427
bgt_else.426:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.427:
	blt	%at, %t2, bgt_else.428
	j	bgt_cont.429
bgt_else.428:
	addi	%v0, %t2, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 12(%sp)
	addi	%v0, %t2, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 12(%sp)
	add	%t2, %a0, %v0
bgt_cont.429:
	addi	%t0, %t0, -2
	blt	%k1, %t0, bgt_else.430
	j	bgt_cont.431
bgt_else.430:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.431:
	blt	%at, %t0, bgt_else.432
	j	bgt_cont.433
bgt_else.432:
	addi	%v0, %t0, -1
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	sw	%v0, 13(%sp)
	addi	%v0, %t0, -2
	addi	%sp, %sp, 14
	jal	fib.9
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	add	%t0, %a0, %v0
bgt_cont.433:
	add	%t0, %t2, %t0
bgt_cont.425:
	add	%a0, %t1, %t0
bgt_cont.393:
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
	add	%s0, %a2, %a3
	addi	%v0, %zero, 15
	jal	fib.9
	addi	%a2, %v0, 0
	add	%k0, %a3, %a2
	add	%a3, %s0, %k0
	addi	%v0, %zero, 14
	jal	fib.9
	add	%a0, %a2, %v0
	add	%a0, %k0, %a0
	add	%g0, %a3, %a0
	ret
