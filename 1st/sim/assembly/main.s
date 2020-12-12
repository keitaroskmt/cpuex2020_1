.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 464
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
fless.2658:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8332
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8332:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2661:
	flw	%f1, 463(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8333
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8333:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2663:
	flw	%f1, 463(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8334
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8334:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2665:
	flw	%f1, 463(%zero)
	fbne	%f0, %f1, fbeq_else.8335
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.8335:
	addi	%v0, %zero, 0
	jr	%ra
xor.2667:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8336
	add	%v0, %zero, %v1
	jr	%ra
beq_else.8336:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8337
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8337:
	addi	%v0, %zero, 0
	jr	%ra
fhalf.2670:
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
fsqr.2672:
	fmul	%f0, %f0, %f0
	jr	%ra
int_of_float_sub1.2674:
	flw	%f1, 461(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8338
	flw	%f1, 461(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %v0, 1
	j	int_of_float_sub1.2674
beq_else.8338:
	jr	%ra
int_of_float_sub2.2677:
	flw	%f1, 461(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8339
	flw	%f1, 461(%zero)
	fsub	%f0, %f0, %f1
	j	int_of_float_sub2.2677
beq_else.8339:
	jr	%ra
int_of_float_sub3.2679:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8340
	add	%v0, %zero, %v1
	jr	%ra
beq_else.8340:
	addi	%v0, %v0, -1
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v1, %a0, %v1
	j	int_of_float_sub3.2679
int_of_float.2682:
	flw	%f1, 463(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8341
	addi	%v0, %zero, 1
	j	beq_cont.8342
beq_else.8341:
	addi	%v0, %zero, 0
beq_cont.8342:
	fabs	%f0, %f0
	flw	%f1, 461(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8343
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	int_of_float_sub2.2677
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 461(%zero)
	fadd	%f0, %f0, %f1
	ftoi	%v0, %f0
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	addi	%v1, %zero, 0
	flw	%f0, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	int_of_float_sub1.2674
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	int_of_float_sub3.2679
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	add	%v0, %v1, %v0
	j	beq_cont.8344
beq_else.8343:
	flw	%f1, 461(%zero)
	fadd	%f0, %f0, %f1
	ftoi	%v1, %f0
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v1, %a0
beq_cont.8344:
	lw	%v1, 0(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8345
	sub	%v0, %zero, %v0
	jr	%ra
beq_else.8345:
	jr	%ra
float_of_int_sub1.2684:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.8346
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.2684
beq_else.8346:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.2687:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.8347
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.2687
beq_else.8347:
	jr	%ra
float_of_int_sub3.2689:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8348
	jr	%ra
beq_else.8348:
	addi	%v0, %v0, -1
	flw	%f1, 461(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.2689
float_of_int.2692:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8349
	addi	%v1, %zero, 0
	j	beq_cont.8350
beq_else.8349:
	addi	%v1, %zero, 1
beq_cont.8350:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8351
	j	beq_cont.8352
beq_else.8351:
	sub	%v0, %zero, %v0
beq_cont.8352:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.8353
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int_sub2.2687
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	itof	%f0, %v0
	flw	%f1, 461(%zero)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 0
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub1.2684
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 463(%zero)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int_sub3.2689
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	j	beq_cont.8354
beq_else.8353:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	itof	%f0, %v0
	flw	%f1, 461(%zero)
	fsub	%f0, %f0, %f1
beq_cont.8354:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8355
	fneg	%f0, %f0
	jr	%ra
beq_else.8355:
	jr	%ra
floor.2694:
	flw	%f1, 463(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8356
	addi	%v0, %zero, 1
	j	beq_cont.8357
beq_else.8356:
	addi	%v0, %zero, 0
beq_cont.8357:
	fabs	%f1, %f0
	flw	%f2, 461(%zero)
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.8358
	fadd	%f0, %fzero, %f1
	j	beq_cont.8359
beq_else.8358:
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	int_of_float.2682
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_of_int.2692
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
beq_cont.8359:
	lw	%v0, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8360
	fneg	%f0, %f0
	j	beq_cont.8361
beq_else.8360:
beq_cont.8361:
	flw	%f1, 0(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8362
	jr	%ra
beq_else.8362:
	flw	%f1, 460(%zero)
	fsub	%f0, %f0, %f1
	jr	%ra
kernel_sin.2696:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 459(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 458(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 457(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.2698:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 460(%zero)
	flw	%f3, 462(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 456(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 455(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
kernel_atan.2700:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 454(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 453(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 452(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 451(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 450(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 449(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6243:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8363
	flw	%f2, 448(%zero)
	fmul	%f1, %f2, %f1
	j	f.6243
beq_else.8363:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6247:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8364
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8365
	fsub	%f0, %f0, %f1
	flw	%f2, 448(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.8365:
	flw	%f2, 448(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.8364:
	jr	%ra
reduction_2pi.2702:
	flw	%f1, 447(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.6243
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fadd	%f1, %f0, %fzero
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6247
	sw	%v0, 0(%k1)
	flw	%f0, 1(%sp)
	fsw	%f0, 1(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
cos.2704:
	flw	%f1, 446(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	reduction_2pi.2702
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8366
	addi	%v0, %zero, 0
	j	beq_cont.8367
beq_else.8366:
	addi	%v0, %zero, 1
beq_cont.8367:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8368
	fsub	%f0, %f0, %f1
	j	beq_cont.8369
beq_else.8368:
beq_cont.8369:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8370
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8372
	addi	%v0, %zero, 1
	j	beq_cont.8373
beq_else.8372:
	addi	%v0, %zero, 0
beq_cont.8373:
	j	beq_cont.8371
beq_else.8370:
beq_cont.8371:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8374
	fsub	%f0, %f1, %f0
	j	beq_cont.8375
beq_else.8374:
beq_cont.8375:
	flw	%f1, 444(%zero)
	sw	%v0, 1(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8376
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_cos.2698
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.8377
beq_else.8376:
	flw	%f1, 445(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_sin.2696
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
beq_cont.8377:
	lw	%v0, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8378
	fneg	%f0, %f0
	jr	%ra
beq_else.8378:
	jr	%ra
sin.2706:
	flw	%f1, 446(%zero)
	flw	%f2, 463(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8379
	addi	%v0, %zero, 1
	j	beq_cont.8380
beq_else.8379:
	addi	%v0, %zero, 0
beq_cont.8380:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi.2702
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8381
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8383
	addi	%v0, %zero, 1
	j	beq_cont.8384
beq_else.8383:
	addi	%v0, %zero, 0
beq_cont.8384:
	j	beq_cont.8382
beq_else.8381:
	lw	%v0, 0(%sp)
beq_cont.8382:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8385
	fsub	%f0, %f0, %f1
	j	beq_cont.8386
beq_else.8385:
beq_cont.8386:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8387
	fsub	%f0, %f1, %f0
	j	beq_cont.8388
beq_else.8387:
beq_cont.8388:
	flw	%f1, 444(%zero)
	sw	%v0, 2(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8389
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_sin.2696
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8390
beq_else.8389:
	flw	%f1, 445(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_cos.2698
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.8390:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8391
	fneg	%f0, %f0
	jr	%ra
beq_else.8391:
	jr	%ra
atan.2708:
	flw	%f1, 463(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8392
	addi	%v0, %zero, 1
	j	beq_cont.8393
beq_else.8392:
	addi	%v0, %zero, 0
beq_cont.8393:
	fabs	%f1, %f0
	flw	%f2, 443(%zero)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.8394
	flw	%f0, 442(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8395
	flw	%f0, 445(%zero)
	flw	%f2, 460(%zero)
	fdiv	%f1, %f2, %f1
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_atan.2700
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8396
beq_else.8395:
	flw	%f0, 444(%zero)
	flw	%f2, 460(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 460(%zero)
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f2, %f1
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_atan.2700
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
beq_cont.8396:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8397
	fneg	%f0, %f0
	jr	%ra
beq_else.8397:
	jr	%ra
beq_else.8394:
	j	kernel_atan.2700
print_int_sub1.2710:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.8398
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2710
beq_else.8398:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2713:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.8399
	addi	%v0, %v0, -10
	j	print_int_sub2.2713
beq_else.8399:
	jr	%ra
print_int.2715:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2710
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2713
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8400
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.8400:
	addi	%a0, %zero, 0
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2710
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2713
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8401
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.8401:
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2713
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
sgn.2717:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2665
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8402
	flw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2661
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8403
	flw	%f0, 441(%zero)
	jr	%ra
beq_else.8403:
	flw	%f0, 460(%zero)
	jr	%ra
beq_else.8402:
	flw	%f0, 463(%zero)
	jr	%ra
fneg_cond.2719:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8404
	fneg	%f0, %f0
	jr	%ra
beq_else.8404:
	jr	%ra
add_mod5.2722:
	add	%v0, %v0, %v1
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.8405
	addi	%v0, %v0, -5
	jr	%ra
beq_else.8405:
	jr	%ra
vecset.2725:
	fsw	%f0, 0(%v0)
	fsw	%f1, 1(%v0)
	fsw	%f2, 2(%v0)
	jr	%ra
vecfill.2730:
	fsw	%f0, 0(%v0)
	fsw	%f0, 1(%v0)
	fsw	%f0, 2(%v0)
	jr	%ra
vecbzero.2733:
	flw	%f0, 463(%zero)
	j	vecfill.2730
veccpy.2735:
	flw	%f0, 0(%v1)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v1)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v1)
	fsw	%f0, 2(%v0)
	jr	%ra
vecunit_sgn.2743:
	flw	%f0, 0(%v0)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fsqr.2672
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2672
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2672
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fiszero.2665
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8409
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8411
	flw	%f0, 460(%zero)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8412
beq_else.8411:
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f0, %f1
beq_cont.8412:
	j	beq_cont.8410
beq_else.8409:
	flw	%f0, 460(%zero)
beq_cont.8410:
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	flw	%f1, 1(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 1(%v0)
	flw	%f1, 2(%v0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
veciprod.2746:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	jr	%ra
veciprod2.2749:
	flw	%f3, 0(%v0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%v0)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	jr	%ra
vecaccum.2754:
	flw	%f1, 0(%v0)
	flw	%f2, 0(%v1)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 1(%v0)
	flw	%f1, 2(%v0)
	flw	%f2, 2(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecadd.2758:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
vecscale.2764:
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	flw	%f1, 1(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 1(%v0)
	flw	%f1, 2(%v0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecaccumv.2767:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
o_texturetype.2771:
	lw	%v0, 0(%v0)
	jr	%ra
o_form.2773:
	lw	%v0, 1(%v0)
	jr	%ra
o_reflectiontype.2775:
	lw	%v0, 2(%v0)
	jr	%ra
o_isinvert.2777:
	lw	%v0, 6(%v0)
	jr	%ra
o_isrot.2779:
	lw	%v0, 3(%v0)
	jr	%ra
o_param_a.2781:
	lw	%v0, 4(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_b.2783:
	lw	%v0, 4(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_c.2785:
	lw	%v0, 4(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_abc.2787:
	lw	%v0, 4(%v0)
	jr	%ra
o_param_x.2789:
	lw	%v0, 5(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_y.2791:
	lw	%v0, 5(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_z.2793:
	lw	%v0, 5(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_diffuse.2795:
	lw	%v0, 7(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_hilight.2797:
	lw	%v0, 7(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_color_red.2799:
	lw	%v0, 8(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_color_green.2801:
	lw	%v0, 8(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_color_blue.2803:
	lw	%v0, 8(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_r1.2805:
	lw	%v0, 9(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_r2.2807:
	lw	%v0, 9(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_r3.2809:
	lw	%v0, 9(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_ctbl.2811:
	lw	%v0, 10(%v0)
	jr	%ra
p_rgb.2813:
	lw	%v0, 0(%v0)
	jr	%ra
p_intersection_points.2815:
	lw	%v0, 1(%v0)
	jr	%ra
p_surface_ids.2817:
	lw	%v0, 2(%v0)
	jr	%ra
p_calc_diffuse.2819:
	lw	%v0, 3(%v0)
	jr	%ra
p_energy.2821:
	lw	%v0, 4(%v0)
	jr	%ra
p_received_ray_20percent.2823:
	lw	%v0, 5(%v0)
	jr	%ra
p_group_id.2825:
	lw	%v0, 6(%v0)
	lw	%v0, 0(%v0)
	jr	%ra
p_set_group_id.2827:
	lw	%v0, 6(%v0)
	sw	%v1, 0(%v0)
	jr	%ra
p_nvectors.2830:
	lw	%v0, 7(%v0)
	jr	%ra
d_vec.2832:
	lw	%v0, 0(%v0)
	jr	%ra
d_const.2834:
	lw	%v0, 1(%v0)
	jr	%ra
r_surface_id.2836:
	lw	%v0, 0(%v0)
	jr	%ra
r_dvec.2838:
	lw	%v0, 1(%v0)
	jr	%ra
r_bright.2840:
	flw	%f0, 2(%v0)
	jr	%ra
rad.2842:
	flw	%f1, 440(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2844:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 2(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.2842
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	cos.2704
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	sin.2706
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	rad.2842
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2704
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2706
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 439(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 160
	fsw	%f2, 0(%v0)
	flw	%f2, 438(%zero)
	flw	%f3, 2(%sp)
	fmul	%f2, %f3, %f2
	addi	%v0, %zero, 160
	fsw	%f2, 1(%v0)
	flw	%f2, 4(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 439(%zero)
	fmul	%f4, %f4, %f5
	addi	%v0, %zero, 160
	fsw	%f4, 2(%v0)
	addi	%v0, %zero, 154
	fsw	%f2, 0(%v0)
	flw	%f4, 463(%zero)
	addi	%v0, %zero, 154
	fsw	%f4, 1(%v0)
	fneg	%f4, %f0
	addi	%v0, %zero, 154
	fsw	%f4, 2(%v0)
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	addi	%v0, %zero, 157
	fsw	%f0, 0(%v0)
	fneg	%f0, %f1
	addi	%v0, %zero, 157
	fsw	%f0, 1(%v0)
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 157
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 1(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 2(%v0)
	jr	%ra
read_light.2846:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_int
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.2842
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2706
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 67
	fsw	%f0, 1(%v0)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_float
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	rad.2842
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2704
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2706
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 67
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2704
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 67
	fsw	%f0, 2(%v0)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 70
	fsw	%f0, 0(%v0)
	jr	%ra
rotate_quadratic_matrix.2848:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2704
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2706
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2704
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2706
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2704
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2706
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 4(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 5(%sp)
	flw	%f5, 3(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	flw	%f7, 2(%sp)
	fmul	%f8, %f7, %f0
	fsub	%f6, %f6, %f8
	fmul	%f8, %f7, %f4
	fmul	%f8, %f8, %f1
	fmul	%f9, %f5, %f0
	fadd	%f8, %f8, %f9
	fmul	%f9, %f2, %f0
	fmul	%f10, %f5, %f4
	fmul	%f10, %f10, %f0
	fmul	%f11, %f7, %f1
	fadd	%f10, %f10, %f11
	fmul	%f11, %f7, %f4
	fmul	%f0, %f11, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f7, %f2
	lw	%v0, 0(%sp)
	flw	%f5, 0(%v0)
	flw	%f7, 1(%v0)
	flw	%f11, 2(%v0)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f8, 10(%sp)
	fsw	%f4, 11(%sp)
	fsw	%f10, 12(%sp)
	fsw	%f6, 13(%sp)
	fsw	%f11, 14(%sp)
	fsw	%f1, 15(%sp)
	fsw	%f7, 16(%sp)
	fsw	%f9, 17(%sp)
	fsw	%f5, 18(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fsqr.2672
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 17(%sp)
	fsw	%f0, 19(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fsqr.2672
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 19(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 15(%sp)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2672
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 20(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 13(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2672
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 12(%sp)
	fsw	%f0, 21(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	fsqr.2672
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 21(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 11(%sp)
	fsw	%f0, 22(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2672
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 22(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 10(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2672
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 9(%sp)
	fsw	%f0, 23(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	fsqr.2672
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 23(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 8(%sp)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2672
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 24(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 448(%zero)
	flw	%f2, 13(%sp)
	flw	%f3, 18(%sp)
	fmul	%f4, %f3, %f2
	flw	%f5, 10(%sp)
	fmul	%f4, %f4, %f5
	flw	%f6, 12(%sp)
	flw	%f7, 16(%sp)
	fmul	%f8, %f7, %f6
	flw	%f9, 9(%sp)
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	flw	%f8, 11(%sp)
	fmul	%f10, %f1, %f8
	flw	%f11, 8(%sp)
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f0, %f0, %f4
	lw	%v0, 1(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 448(%zero)
	flw	%f4, 7(%sp)
	fmul	%f10, %f3, %f4
	fmul	%f5, %f10, %f5
	flw	%f10, 17(%sp)
	fmul	%f12, %f7, %f10
	fmul	%f9, %f12, %f9
	fadd	%f5, %f5, %f9
	flw	%f9, 15(%sp)
	fmul	%f12, %f1, %f9
	fmul	%f11, %f12, %f11
	fadd	%f5, %f5, %f11
	fmul	%f0, %f0, %f5
	fsw	%f0, 1(%v0)
	flw	%f0, 448(%zero)
	fmul	%f3, %f3, %f4
	fmul	%f2, %f3, %f2
	fmul	%f3, %f7, %f10
	fmul	%f3, %f3, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f9
	fmul	%f1, %f1, %f8
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_nth_object.2851:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8422
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8422:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 463(%zero)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 2(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fisneg.2663
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 2
	flw	%f0, 463(%zero)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8423
	j	beq_cont.8424
beq_else.8423:
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2842
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2842
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2842
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 2(%v0)
beq_cont.8424:
	lw	%v1, 2(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8425
	addi	%a0, %zero, 1
	j	beq_cont.8426
beq_else.8425:
	lw	%a0, 7(%sp)
beq_cont.8426:
	addi	%a1, %zero, 4
	flw	%f0, 463(%zero)
	sw	%a0, 11(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 10(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 9(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 8(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 11(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 6(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 5(%sp)
	sw	%a0, 4(%v1)
	lw	%a1, 4(%sp)
	sw	%a1, 3(%v1)
	lw	%a2, 3(%sp)
	sw	%a2, 2(%v1)
	lw	%a2, 2(%sp)
	sw	%a2, 1(%v1)
	lw	%a3, 1(%sp)
	sw	%a3, 0(%v1)
	addi	%a3, %zero, 1
	lw	%t0, 0(%sp)
	add	%at, %a3, %t0
	sw	%v1, 0(%at)
	addi	%at, %zero, 3
	bne	%a2, %at, beq_else.8427
	flw	%f0, 0(%a0)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fiszero.2665
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8429
	flw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	sgn.2717
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fsw	%f0, 13(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fsqr.2672
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8430
beq_else.8429:
	flw	%f0, 463(%zero)
beq_cont.8430:
	lw	%v0, 5(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fiszero.2665
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8431
	flw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	sgn.2717
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fsw	%f0, 15(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fsqr.2672
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8432
beq_else.8431:
	flw	%f0, 463(%zero)
beq_cont.8432:
	lw	%v0, 5(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fiszero.2665
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8433
	flw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	sgn.2717
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fsw	%f0, 17(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fsqr.2672
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8434
beq_else.8433:
	flw	%f0, 463(%zero)
beq_cont.8434:
	lw	%v0, 5(%sp)
	fsw	%f0, 2(%v0)
	j	beq_cont.8428
beq_else.8427:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.8435
	lw	%v1, 7(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8437
	addi	%v1, %zero, 1
	j	beq_cont.8438
beq_else.8437:
	addi	%v1, %zero, 0
beq_cont.8438:
	addi	%v0, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	vecunit_sgn.2743
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	beq_cont.8436
beq_else.8435:
beq_cont.8436:
beq_cont.8428:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8439
	j	beq_cont.8440
beq_else.8439:
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	rotate_quadratic_matrix.2848
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
beq_cont.8440:
	addi	%v0, %zero, 1
	jr	%ra
read_object.2853:
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.8441
	jr	%ra
beq_else.8441:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2851
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8443
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.8443:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	read_object.2853
read_all_object.2855:
	addi	%v0, %zero, 0
	j	read_object.2853
read_net_item.2857:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8445
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
beq_else.8445:
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_net_item.2857
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_or_network.2859:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2857
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8446
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
beq_else.8446:
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_or_network.2859
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_and_network.2861:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2857
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.8447
	jr	%ra
beq_else.8447:
	addi	%v1, %zero, 72
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2861
read_parameter.2863:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_screen_settings.2844
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_light.2846
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_all_object.2855
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_and_network.2861
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_or_network.2859
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 123
	sw	%v0, 0(%v1)
	jr	%ra
solver_rect_surface.2865:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	fsw	%f2, 0(%sp)
	sw	%a2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2665
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8450
	lw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2787
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2777
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %a0, %v1
	flw	%f0, 0(%at)
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fisneg.2663
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	xor.2667
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	flw	%f0, 0(%at)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fneg_cond.2719
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f0, %f1
	lw	%v0, 5(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	flw	%f1, 0(%at)
	fdiv	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	add	%at, %v1, %v0
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	flw	%f2, 2(%sp)
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	lw	%a0, 8(%sp)
	add	%at, %a0, %v0
	flw	%f2, 0(%at)
	fsw	%f0, 10(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2658
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8451
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8451:
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 0(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	flw	%f2, 0(%at)
	fadd	%f1, %f2, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2658
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8452
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8452:
	addi	%v0, %zero, 124
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8450:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2874:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 1
	addi	%a2, %zero, 2
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2865
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8453
	addi	%a0, %zero, 1
	addi	%a1, %zero, 2
	addi	%a2, %zero, 0
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2865
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8454
	addi	%a0, %zero, 2
	addi	%a1, %zero, 0
	addi	%a2, %zero, 1
	flw	%f0, 1(%sp)
	flw	%f1, 0(%sp)
	flw	%f2, 2(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2865
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8455
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8455:
	addi	%v0, %zero, 3
	jr	%ra
beq_else.8454:
	addi	%v0, %zero, 2
	jr	%ra
beq_else.8453:
	addi	%v0, %zero, 1
	jr	%ra
solver_surface.2880:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2787
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2746
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fispos.2661
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8456
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8456:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veciprod2.2749
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fneg	%f0, %f0
	flw	%f1, 5(%sp)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
quadratic.2886:
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2672
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2781
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fsqr.2672
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2783
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%sp)
	fsw	%f0, 7(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fsqr.2672
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2779
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8457
	flw	%f0, 9(%sp)
	jr	%ra
beq_else.8457:
	flw	%f0, 1(%sp)
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2805
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 0(%sp)
	flw	%f2, 1(%sp)
	fmul	%f2, %f2, %f1
	lw	%v0, 3(%sp)
	fsw	%f0, 11(%sp)
	fsw	%f2, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r2.2807
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 0(%sp)
	fmul	%f1, %f2, %f1
	lw	%v0, 3(%sp)
	fsw	%f0, 13(%sp)
	fsw	%f1, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_r3.2809
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 13(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bilinear.2891:
	fmul	%f6, %f0, %f3
	fsw	%f3, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f5, 2(%sp)
	fsw	%f2, 3(%sp)
	sw	%v0, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f1, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2781
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fmul	%f3, %f2, %f1
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2783
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)
	fmul	%f3, %f2, %f1
	lw	%v0, 4(%sp)
	fsw	%f0, 10(%sp)
	fsw	%f3, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2785
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_isrot.2779
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8458
	flw	%f0, 12(%sp)
	jr	%ra
beq_else.8458:
	flw	%f0, 5(%sp)
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 2(%sp)
	flw	%f4, 6(%sp)
	fmul	%f5, %f4, %f3
	fadd	%f2, %f2, %f5
	lw	%v0, 4(%sp)
	fsw	%f2, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2805
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	flw	%f3, 0(%sp)
	flw	%f4, 3(%sp)
	fmul	%f4, %f4, %f3
	fadd	%f1, %f1, %f4
	lw	%v0, 4(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f1, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_r2.2807
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	flw	%f2, 0(%sp)
	flw	%f3, 6(%sp)
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lw	%v0, 4(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	o_param_r3.2809
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fhalf.2670
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
solver_second.2899:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	fadd	%f2, %f5, %fzero
	fadd	%f1, %f4, %fzero
	fadd	%f0, %f3, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	quadratic.2886
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fiszero.2665
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8459
	lw	%v0, 4(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)
	flw	%f5, 0(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	bilinear.2891
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2886
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2773
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8460
	flw	%f0, 460(%zero)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8461
beq_else.8460:
	flw	%f0, 7(%sp)
beq_cont.8461:
	flw	%f1, 6(%sp)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2672
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 5(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2661
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8462
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8462:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2777
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8463
	flw	%f0, 10(%sp)
	fneg	%f0, %f0
	j	beq_cont.8464
beq_else.8463:
	flw	%f0, 10(%sp)
beq_cont.8464:
	flw	%f1, 6(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 5(%sp)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8459:
	addi	%v0, %zero, 0
	jr	%ra
solver.2905:
	addi	%a1, %zero, 1
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	flw	%f0, 0(%a0)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2789
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_y.2791
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2793
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_form.2773
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8465
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_rect.2874
beq_else.8465:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8466
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_surface.2880
beq_else.8466:
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_second.2899
solver_rect_fast.2909:
	flw	%f3, 0(%a0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fabs	%f4, %f4
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f3, 5(%sp)
	sw	%v1, 6(%sp)
	fsw	%f4, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2783
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fless.2658
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8467
	addi	%v0, %zero, 0
	j	beq_cont.8468
beq_else.8467:
	lw	%v0, 6(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 4(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 3(%sp)
	fsw	%f0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fless.2658
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8469
	addi	%v0, %zero, 0
	j	beq_cont.8470
beq_else.8469:
	lw	%v0, 2(%sp)
	flw	%f0, 1(%v0)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fiszero.2665
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8471
	addi	%v0, %zero, 1
	j	beq_cont.8472
beq_else.8471:
	addi	%v0, %zero, 0
beq_cont.8472:
beq_cont.8470:
beq_cont.8468:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8473
	lw	%v0, 2(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 1(%sp)
	fsub	%f0, %f0, %f1
	flw	%f2, 3(%v0)
	fmul	%f0, %f0, %f2
	lw	%v1, 6(%sp)
	flw	%f2, 0(%v1)
	fmul	%f2, %f0, %f2
	flw	%f3, 0(%sp)
	fadd	%f2, %f2, %f3
	fabs	%f2, %f2
	lw	%a0, 3(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f2, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_a.2781
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2658
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8474
	addi	%v0, %zero, 0
	j	beq_cont.8475
beq_else.8474:
	lw	%v0, 6(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 4(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 3(%sp)
	fsw	%f0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2785
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2658
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8476
	addi	%v0, %zero, 0
	j	beq_cont.8477
beq_else.8476:
	lw	%v0, 2(%sp)
	flw	%f0, 3(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fiszero.2665
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8478
	addi	%v0, %zero, 1
	j	beq_cont.8479
beq_else.8478:
	addi	%v0, %zero, 0
beq_cont.8479:
beq_cont.8477:
beq_cont.8475:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8480
	lw	%v0, 2(%sp)
	flw	%f0, 4(%v0)
	flw	%f1, 4(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 5(%v0)
	fmul	%f0, %f0, %f1
	lw	%v1, 6(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	flw	%f2, 0(%sp)
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	lw	%a0, 3(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 13(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_a.2781
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fless.2658
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8481
	addi	%v0, %zero, 0
	j	beq_cont.8482
beq_else.8481:
	lw	%v0, 6(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 1(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2783
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fless.2658
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8483
	addi	%v0, %zero, 0
	j	beq_cont.8484
beq_else.8483:
	lw	%v0, 2(%sp)
	flw	%f0, 5(%v0)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fiszero.2665
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8485
	addi	%v0, %zero, 1
	j	beq_cont.8486
beq_else.8485:
	addi	%v0, %zero, 0
beq_cont.8486:
beq_cont.8484:
beq_cont.8482:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8487
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8487:
	addi	%v0, %zero, 124
	flw	%f0, 12(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
beq_else.8480:
	addi	%v0, %zero, 124
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
beq_else.8473:
	addi	%v0, %zero, 124
	flw	%f0, 5(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
solver_surface_fast.2916:
	flw	%f3, 0(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2663
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8488
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8488:
	lw	%v0, 3(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 1(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	flw	%f2, 0(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
solver_second_fast.2922:
	flw	%f3, 0(%v1)
	fsw	%f3, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fiszero.2665
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8489
	lw	%v0, 5(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 2(%v0)
	flw	%f3, 3(%sp)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 3(%v0)
	flw	%f4, 2(%sp)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lw	%v1, 1(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2886
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2773
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8490
	flw	%f0, 460(%zero)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8491
beq_else.8490:
	flw	%f0, 7(%sp)
beq_cont.8491:
	flw	%f1, 6(%sp)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2672
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 0(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2661
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8492
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8492:
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2777
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8493
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.8494
beq_else.8493:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.8494:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8489:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2928:
	addi	%a1, %zero, 1
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	flw	%f0, 0(%a0)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f0, 4(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_x.2789
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 2(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_y.2791
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 2(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_z.2793
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	d_const.2834
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 2(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_form.2773
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8495
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	d_vec.2832
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%a0, 10(%sp)
	j	solver_rect_fast.2909
beq_else.8495:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8496
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_surface_fast.2916
beq_else.8496:
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_second_fast.2922
solver_surface_fast2.2932:
	flw	%f0, 0(%v1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fisneg.2663
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8497
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8497:
	lw	%v0, 1(%sp)
	flw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	flw	%f1, 3(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
solver_second_fast2.2939:
	flw	%f3, 0(%v1)
	sw	%v0, 0(%sp)
	fsw	%f3, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v1, 6(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2665
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8498
	lw	%v0, 6(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	flw	%f2, 3(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lw	%v1, 2(%sp)
	flw	%f1, 3(%v1)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2672
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2661
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8499
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8499:
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2777
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8500
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.8501
beq_else.8500:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.8501:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8498:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2946:
	addi	%a0, %zero, 1
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_param_ctbl.2811
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	d_const.2834
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2773
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8502
	lw	%v0, 2(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	d_vec.2832
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%a0, 7(%sp)
	j	solver_rect_fast.2909
beq_else.8502:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8503
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_surface_fast2.2932
beq_else.8503:
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_second_fast2.2939
setup_rect_table.2949:
	addi	%a0, %zero, 6
	flw	%f0, 463(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fiszero.2665
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8504
	lw	%v0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_isinvert.2777
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2663
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	xor.2667
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2781
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fneg_cond.2719
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 460(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	j	beq_cont.8505
beq_else.8504:
	flw	%f0, 463(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
beq_cont.8505:
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fiszero.2665
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8506
	lw	%v0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2663
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	xor.2667
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2783
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fneg_cond.2719
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 460(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 1(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
	j	beq_cont.8507
beq_else.8506:
	flw	%f0, 463(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8507:
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2665
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8508
	lw	%v0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_isinvert.2777
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fisneg.2663
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	xor.2667
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fneg_cond.2719
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 460(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
	j	beq_cont.8509
beq_else.8508:
	flw	%f0, 463(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%v0)
beq_cont.8509:
	jr	%ra
setup_surface_table.2952:
	addi	%a0, %zero, 4
	flw	%f0, 463(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 0(%sp)
	sw	%v0, 2(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2781
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2783
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2785
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fispos.2661
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8510
	flw	%f0, 463(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	j	beq_cont.8511
beq_else.8510:
	flw	%f0, 441(%zero)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_a.2781
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2783
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8511:
	jr	%ra
setup_second_table.2955:
	addi	%a0, %zero, 5
	flw	%f0, 463(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	lw	%a0, 0(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	quadratic.2886
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 3(%sp)
	fsw	%f1, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2781
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2783
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 3(%sp)
	fsw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2779
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8512
	lw	%v0, 2(%sp)
	flw	%f0, 5(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 7(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 9(%sp)
	fsw	%f0, 3(%v0)
	j	beq_cont.8513
beq_else.8512:
	lw	%v0, 1(%sp)
	flw	%f0, 2(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2807
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 11(%sp)
	fsw	%f1, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r3.2809
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2670
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 13(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2805
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f1, 15(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_r3.2809
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fhalf.2670
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 16(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	o_param_r1.2805
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 17(%sp)
	fsw	%f1, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	o_param_r2.2807
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 17(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fhalf.2670
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8513:
	flw	%f0, 3(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fiszero.2665
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8514
	flw	%f0, 460(%zero)
	flw	%f1, 3(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%v0)
	j	beq_cont.8515
beq_else.8514:
beq_cont.8515:
	lw	%v0, 2(%sp)
	jr	%ra
iter_setup_dirvec_constants.2958:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8516
	addi	%a0, %zero, 1
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	d_const.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2832
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_form.2773
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8517
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2949
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	beq_cont.8518
beq_else.8517:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8519
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	beq_cont.8520
beq_else.8519:
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2955
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
beq_cont.8520:
beq_cont.8518:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	j	iter_setup_dirvec_constants.2958
beq_else.8516:
	jr	%ra
setup_dirvec_constants.2961:
	addi	%v1, %zero, 0
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	j	iter_setup_dirvec_constants.2958
setup_startp_constants.2963:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8522
	addi	%a0, %zero, 1
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_param_ctbl.2811
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_form.2773
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_x.2789
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	lw	%a0, 2(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_y.2791
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	lw	%a0, 2(%sp)
	fsw	%f0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2793
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8523
	lw	%v1, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2787
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	veciprod2.2749
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 3(%v0)
	j	beq_cont.8524
beq_else.8523:
	addi	%at, %zero, 2
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8525
	j	beq_cont.8526
beq_else.8525:
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	quadratic.2886
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 4(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8527
	flw	%f1, 460(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.8528
beq_else.8527:
beq_cont.8528:
	lw	%v0, 3(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8526:
beq_cont.8524:
	lw	%v0, 0(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	setup_startp_constants.2963
beq_else.8522:
	jr	%ra
setup_startp.2966:
	addi	%v1, %zero, 151
	sw	%v0, 0(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	veccpy.2735
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2963
is_rect_outside.2968:
	fabs	%f0, %f0
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2781
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2658
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8530
	addi	%v0, %zero, 0
	j	beq_cont.8531
beq_else.8530:
	flw	%f0, 2(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_b.2783
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8532
	addi	%v0, %zero, 0
	j	beq_cont.8533
beq_else.8532:
	flw	%f0, 0(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2785
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2658
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.8533:
beq_cont.8531:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8534
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2777
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8535
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8535:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8534:
	lw	%v0, 1(%sp)
	j	o_isinvert.2777
is_plane_outside.2973:
	sw	%v0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2787
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	veciprod2.2749
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f0, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2663
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	xor.2667
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8536
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8536:
	addi	%v0, %zero, 0
	jr	%ra
is_second_outside.2978:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2886
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2773
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8537
	flw	%f0, 460(%zero)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8538
beq_else.8537:
	flw	%f0, 1(%sp)
beq_cont.8538:
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_isinvert.2777
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2663
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	xor.2667
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8539
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8539:
	addi	%v0, %zero, 0
	jr	%ra
is_outside.2983:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2789
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_y.2791
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2793
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 0(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_form.2773
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8540
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_rect_outside.2968
beq_else.8540:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8541
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_plane_outside.2973
beq_else.8541:
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_second_outside.2978
check_all_inside.2988:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.8542
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8542:
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	is_outside.2983
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8543
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2988
beq_else.8543:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_and_group.2994:
	lw	%a0, 1(%k1)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8544
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8544:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 127
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_fast.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	fsw	%f0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8545
	addi	%v0, %zero, 0
	j	beq_cont.8546
beq_else.8545:
	flw	%f1, 437(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
beq_cont.8546:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8547
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8548
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8548:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8547:
	flw	%f0, 436(%zero)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 127
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v0, %zero, 127
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 67
	flw	%f3, 2(%v0)
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 127
	flw	%f3, 2(%v0)
	fadd	%f0, %f0, %f3
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2988
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8549
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8549:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_group.2997:
	lw	%a0, 1(%k1)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8550
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8550:
	addi	%a2, %zero, 72
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	addi	%k1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8551
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8551:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_matrix.3000:
	lw	%a0, 2(%k1)
	lw	%a1, 1(%k1)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	lw	%a3, 0(%a2)
	addi	%at, %zero, -1
	bne	%a3, %at, beq_else.8552
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8552:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%k1, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%at, %zero, 99
	bne	%a3, %at, beq_else.8553
	addi	%v0, %zero, 1
	j	beq_cont.8554
beq_else.8553:
	addi	%t0, %zero, 127
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_fast.2928
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8555
	addi	%v0, %zero, 0
	j	beq_cont.8556
beq_else.8555:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	flw	%f1, 435(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8557
	addi	%v0, %zero, 0
	j	beq_cont.8558
beq_else.8557:
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8559
	addi	%v0, %zero, 0
	j	beq_cont.8560
beq_else.8559:
	addi	%v0, %zero, 1
beq_cont.8560:
beq_cont.8558:
beq_cont.8556:
beq_cont.8554:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8561
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8561:
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8562
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8562:
	addi	%v0, %zero, 1
	jr	%ra
solve_each_element.3003:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8563
	jr	%ra
beq_else.8563:
	addi	%a2, %zero, 148
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver.2905
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8565
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_isinvert.2777
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8566
	jr	%ra
beq_else.8566:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.3003
beq_else.8565:
	addi	%v1, %zero, 124
	flw	%f1, 0(%v1)
	flw	%f0, 463(%zero)
	sw	%v0, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2658
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8568
	j	beq_cont.8569
beq_else.8568:
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2658
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8570
	j	beq_cont.8571
beq_else.8570:
	flw	%f0, 436(%zero)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 148
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 148
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 0
	lw	%a0, 1(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2988
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8572
	j	beq_cont.8573
beq_else.8572:
	addi	%v0, %zero, 126
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2725
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 130
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
beq_cont.8573:
beq_cont.8571:
beq_cont.8569:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.3003
solve_one_or_network.3007:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8574
	jr	%ra
beq_else.8574:
	addi	%a2, %zero, 72
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element.3003
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.3007
trace_or_matrix.3011:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.8576
	jr	%ra
beq_else.8576:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.8578
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network.3007
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8579
beq_else.8578:
	addi	%a3, %zero, 148
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver.2905
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8580
	j	beq_cont.8581
beq_else.8580:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2658
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8582
	j	beq_cont.8583
beq_else.8582:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network.3007
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8583:
beq_cont.8581:
beq_cont.8579:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.3011
judge_intersection.3015:
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 123
	lw	%a0, 0(%a0)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.3011
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 435(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2658
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8584
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8584:
	flw	%f1, 433(%zero)
	flw	%f0, 0(%sp)
	j	fless.2658
solve_each_element_fast.3017:
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	d_vec.2832
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8585
	jr	%ra
beq_else.8585:
	lw	%a2, 0(%sp)
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_fast2.2946
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8587
	addi	%v0, %zero, 1
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8588
	jr	%ra
beq_else.8588:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.3017
beq_else.8587:
	addi	%v1, %zero, 124
	flw	%f1, 0(%v1)
	flw	%f0, 463(%zero)
	sw	%v0, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2658
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8590
	j	beq_cont.8591
beq_else.8590:
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2658
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8592
	j	beq_cont.8593
beq_else.8592:
	flw	%f0, 436(%zero)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 151
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v0, %zero, 151
	flw	%f4, 2(%v0)
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2988
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8594
	j	beq_cont.8595
beq_else.8594:
	addi	%v0, %zero, 126
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2725
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 130
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
beq_cont.8595:
beq_cont.8593:
beq_cont.8591:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.3017
solve_one_or_network_fast.3021:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8596
	jr	%ra
beq_else.8596:
	addi	%a2, %zero, 72
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.3017
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.3021
trace_or_matrix_fast.3025:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.8598
	jr	%ra
beq_else.8598:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.8600
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.3021
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8601
beq_else.8600:
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_fast2.2946
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8602
	j	beq_cont.8603
beq_else.8602:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2658
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8604
	j	beq_cont.8605
beq_else.8604:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.3021
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8605:
beq_cont.8603:
beq_cont.8601:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.3025
judge_intersection_fast.3029:
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 123
	lw	%a0, 0(%a0)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.3025
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 435(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2658
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8606
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8606:
	flw	%f1, 433(%zero)
	flw	%f0, 0(%sp)
	j	fless.2658
get_nvector_rect.3031:
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 131
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	vecbzero.2733
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	addi	%v0, %v0, -1
	lw	%a0, 0(%sp)
	add	%at, %a0, %v0
	flw	%f0, 0(%at)
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sgn.2717
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	fsw	%f0, 0(%at)
	jr	%ra
get_nvector_plane.3033:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_a.2781
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_b.2783
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 1(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_c.2785
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 2(%v0)
	jr	%ra
get_nvector_second.3035:
	addi	%v1, %zero, 127
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_param_x.2789
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 127
	flw	%f1, 1(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_y.2791
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 127
	flw	%f1, 2(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2793
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2781
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2783
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2785
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2779
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8609
	addi	%v0, %zero, 131
	flw	%f0, 7(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 131
	flw	%f0, 8(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 131
	flw	%f0, 9(%sp)
	fsw	%f0, 2(%v0)
	j	beq_cont.8610
beq_else.8609:
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r3.2809
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2807
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 10(%sp)
	fadd	%f0, %f2, %f0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fhalf.2670
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2809
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r1.2805
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fhalf.2670
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 1(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r2.2807
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r1.2805
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2670
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 2(%v0)
beq_cont.8610:
	lw	%v0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_isinvert.2777
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 131
	j	vecunit_sgn.2743
get_nvector.3037:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2773
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8611
	lw	%v0, 1(%sp)
	j	get_nvector_rect.3031
beq_else.8611:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8612
	lw	%v0, 0(%sp)
	j	get_nvector_plane.3033
beq_else.8612:
	lw	%v0, 0(%sp)
	j	get_nvector_second.3035
utexture.3040:
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_texturetype.2771
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_red.2799
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 134
	fsw	%f0, 0(%v0)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_green.2801
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_blue.2803
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	lw	%v0, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8613
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2789
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	floor.2694
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 422(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 425(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	flw	%f0, 2(%v1)
	lw	%v1, 1(%sp)
	sw	%v0, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_z.2793
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	fsw	%f0, 7(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	floor.2694
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 422(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 425(%zero)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fless.2658
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 5(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8614
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8616
	flw	%f0, 427(%zero)
	j	beq_cont.8617
beq_else.8616:
	flw	%f0, 463(%zero)
beq_cont.8617:
	j	beq_cont.8615
beq_else.8614:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8618
	flw	%f0, 463(%zero)
	j	beq_cont.8619
beq_else.8618:
	flw	%f0, 427(%zero)
beq_cont.8619:
beq_cont.8615:
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
beq_else.8613:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8621
	lw	%v0, 0(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 424(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	sin.2706
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fsqr.2672
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 427(%zero)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f1, 0(%v0)
	flw	%f1, 427(%zero)
	flw	%f2, 460(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
beq_else.8621:
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8623
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_x.2789
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_z.2793
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 9(%sp)
	fsw	%f0, 11(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fsqr.2672
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fsqr.2672
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	flw	%f1, 425(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	floor.2694
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 429(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	cos.2704
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fsqr.2672
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 427(%zero)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f1, 1(%v0)
	flw	%f1, 460(%zero)
	fsub	%f0, %f1, %f0
	flw	%f1, 427(%zero)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8623:
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.8625
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_x.2789
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_a.2781
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	o_param_z.2793
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	o_param_c.2785
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	fsw	%f0, 19(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fsqr.2672
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2672
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fsw	%f0, 21(%sp)
	fadd	%f1, %f3, %fzero
	fadd	%f0, %f2, %fzero
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	fless.2658
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8626
	flw	%f0, 16(%sp)
	flw	%f1, 19(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	atan.2708
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8627
beq_else.8626:
	flw	%f0, 431(%zero)
beq_cont.8627:
	fsw	%f0, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	floor.2694
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 22(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 1(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 23(%sp)
	fsw	%f1, 24(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	o_param_y.2791
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 24(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	o_param_b.2783
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 25(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 21(%sp)
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fsw	%f0, 26(%sp)
	fadd	%f1, %f3, %fzero
	fadd	%f0, %f2, %fzero
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	fless.2658
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8628
	flw	%f0, 21(%sp)
	flw	%f1, 26(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	atan.2708
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8629
beq_else.8628:
	flw	%f0, 431(%zero)
beq_cont.8629:
	fsw	%f0, 27(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	floor.2694
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f1, 27(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 428(%zero)
	flw	%f2, 462(%zero)
	flw	%f3, 23(%sp)
	fsub	%f2, %f2, %f3
	fsw	%f0, 28(%sp)
	fsw	%f1, 29(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	fsqr.2672
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f1, 29(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 462(%zero)
	flw	%f2, 28(%sp)
	fsub	%f1, %f1, %f2
	fsw	%f0, 30(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	fsqr.2672
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f1, 30(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 31(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	fisneg.2663
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8630
	flw	%f0, 31(%sp)
	j	beq_cont.8631
beq_else.8630:
	flw	%f0, 463(%zero)
beq_cont.8631:
	flw	%f1, 427(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 426(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8625:
	jr	%ra
add_light.3043:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2661
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8634
	j	beq_cont.8635
beq_else.8634:
	addi	%v1, %zero, 134
	addi	%v0, %zero, 140
	flw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2754
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.8635:
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2661
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8636
	jr	%ra
beq_else.8636:
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2672
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2672
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	jr	%ra
trace_reflections.3047:
	lw	%a0, 1(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8639
	addi	%a1, %zero, 234
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	sw	%k1, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%a1, 6(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	r_dvec.2838
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	judge_intersection_fast.3029
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8640
	j	beq_cont.8641
beq_else.8640:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	r_surface_id.2836
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	bne	%v1, %v0, beq_else.8642
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8644
	lw	%v0, 7(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 131
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veciprod.2746
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	r_bright.2840
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fmul	%f2, %f0, %f1
	flw	%f3, 9(%sp)
	fmul	%f2, %f2, %f3
	lw	%v0, 7(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	d_vec.2832
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	veciprod.2746
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 10(%sp)
	flw	%f2, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	add_light.3043
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	beq_cont.8645
beq_else.8644:
beq_cont.8645:
	j	beq_cont.8643
beq_else.8642:
beq_cont.8643:
beq_cont.8641:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 4(%sp)
	flw	%f1, 2(%sp)
	lw	%v1, 3(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8639:
	jr	%ra
trace_ray.3052:
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8647
	sw	%k1, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%a0, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_surface_ids.2817
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	judge_intersection.3015
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8648
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8649
	jr	%ra
beq_else.8649:
	addi	%v1, %zero, 67
	lw	%v0, 7(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veciprod.2746
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	fneg	%f0, %f0
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2661
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8651
	jr	%ra
beq_else.8651:
	flw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2672
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 70
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8648:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%v0, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_reflectiontype.2775
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_diffuse.2795
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector.3037
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %zero, 127
	addi	%v0, %zero, 148
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2735
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %zero, 127
	lw	%v0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	utexture.3040
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	p_intersection_points.2815
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 127
	addi	%v1, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2735
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	p_calc_diffuse.2819
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_diffuse.2795
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 462(%zero)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fless.2658
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8654
	addi	%v0, %zero, 1
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	p_energy.2821
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 134
	sw	%v0, 15(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	veccpy.2735
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 15(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 421(%zero)
	flw	%f1, 13(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecscale.2764
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	p_nvectors.2830
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 131
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	veccpy.2735
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	beq_cont.8655
beq_else.8654:
	addi	%v0, %zero, 0
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
beq_cont.8655:
	flw	%f0, 420(%zero)
	addi	%v1, %zero, 131
	lw	%v0, 7(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2746
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 131
	lw	%v0, 7(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	vecaccum.2754
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 11(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	o_hilight.2797
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 3(%sp)
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8656
	addi	%v1, %zero, 67
	addi	%v0, %zero, 131
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	veciprod.2746
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	fneg	%f0, %f0
	flw	%f1, 13(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 67
	lw	%v0, 7(%sp)
	fsw	%f0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	veciprod.2746
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	fneg	%f1, %f0
	flw	%f0, 18(%sp)
	flw	%f2, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	add_light.3043
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	beq_cont.8657
beq_else.8656:
beq_cont.8657:
	addi	%v0, %zero, 127
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	setup_startp.2966
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 414
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	flw	%f0, 13(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 7(%sp)
	lw	%k1, 2(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 419(%zero)
	flw	%f1, 5(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fless.2658
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8658
	jr	%ra
beq_else.8658:
	lw	%v0, 6(%sp)
	slti	%at, %v0, 4
	bne	%at, %zero, beq_else.8660
	j	beq_cont.8661
beq_else.8660:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 8(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
beq_cont.8661:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8662
	flw	%f0, 460(%zero)
	lw	%v1, 11(%sp)
	fsw	%f0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	o_diffuse.2795
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	flw	%f2, 1(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 7(%sp)
	lw	%a0, 4(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8662:
	jr	%ra
beq_else.8647:
	jr	%ra
trace_diffuse_ray.3058:
	lw	%v1, 1(%k1)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	judge_intersection_fast.3029
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8665
	jr	%ra
beq_else.8665:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2832
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	get_nvector.3037
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 127
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	utexture.3040
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8667
	addi	%v1, %zero, 67
	addi	%v0, %zero, 131
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	veciprod.2746
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	fneg	%f0, %f0
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fispos.2661
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8668
	flw	%f0, 463(%zero)
	j	beq_cont.8669
beq_else.8668:
	flw	%f0, 4(%sp)
beq_cont.8669:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_diffuse.2795
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 134
	addi	%v0, %zero, 137
	j	vecaccum.2754
beq_else.8667:
	jr	%ra
iter_trace_diffuse_rays.3061:
	lw	%a2, 1(%k1)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.8671
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	sw	%a0, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	d_vec.2832
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veciprod.2746
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fisneg.2663
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8672
	lw	%v0, 3(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	flw	%f0, 417(%zero)
	flw	%f1, 6(%sp)
	fdiv	%f0, %f1, %f0
	lw	%k1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	beq_cont.8673
beq_else.8672:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	flw	%f0, 418(%zero)
	flw	%f1, 6(%sp)
	fdiv	%f0, %f1, %f0
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.8673:
	lw	%v0, 3(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8671:
	jr	%ra
trace_diffuse_rays.3066:
	lw	%a1, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	setup_startp.2966
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
trace_diffuse_ray_80percent.3070:
	lw	%k1, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%k1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8675
	j	beq_cont.8676
beq_else.8675:
	addi	%a1, %zero, 166
	lw	%a1, 0(%a1)
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8676:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8677
	j	beq_cont.8678
beq_else.8677:
	addi	%v1, %zero, 166
	lw	%v1, 1(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8678:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8679
	j	beq_cont.8680
beq_else.8679:
	addi	%v1, %zero, 166
	lw	%v1, 2(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8680:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8681
	j	beq_cont.8682
beq_else.8681:
	addi	%v1, %zero, 166
	lw	%v1, 3(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8682:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.8683
	jr	%ra
beq_else.8683:
	addi	%v0, %zero, 166
	lw	%v0, 4(%v0)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 2(%sp)
	lw	%at, 0(%k1)
	jr	%at
calc_diffuse_using_1point.3074:
	lw	%a0, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_nvectors.2830
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_intersection_points.2815
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_energy.2821
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 137
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	veccpy.2735
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_group_id.2825
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	lw	%k1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
	j	vecaccumv.2767
calc_diffuse_using_5points.3077:
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, -1
	lw	%a1, 2(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	lw	%a1, 2(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 137
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veccpy.2735
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2758
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2758
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2758
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2758
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_energy.2821
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
	j	vecaccumv.2767
do_without_neighbors.3083:
	lw	%a0, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8685
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_surface_ids.2817
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8686
	lw	%v0, 2(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_calc_diffuse.2819
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8687
	j	beq_cont.8688
beq_else.8687:
	lw	%v0, 2(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8688:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 2(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8686:
	jr	%ra
beq_else.8685:
	jr	%ra
neighbors_exist.3086:
	addi	%a0, %zero, 143
	lw	%a0, 1(%a0)
	addi	%a1, %v1, 1
	slt	%at, %a1, %a0
	bne	%at, %zero, beq_else.8691
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8691:
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8692
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8692:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a0, %v0, 1
	slt	%at, %a0, %v1
	bne	%at, %zero, beq_else.8693
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8693:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8694
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8694:
	addi	%v0, %zero, 1
	jr	%ra
get_surface_id.3090:
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	p_surface_ids.2817
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	jr	%ra
neighbors_are_available.3093:
	add	%at, %a0, %v0
	lw	%a3, 0(%at)
	sw	%a0, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_surface_id.3090
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 2(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3090
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8695
	lw	%v0, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	lw	%a1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3090
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8696
	lw	%v0, 3(%sp)
	addi	%a0, %v0, -1
	lw	%a1, 0(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a2, 2(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3090
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8697
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3090
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8698
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8698:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8697:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8696:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8695:
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3099:
	lw	%t0, 1(%k1)
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	addi	%at, %zero, 4
	slt	%at, %at, %a3
	bne	%at, %zero, beq_else.8699
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%a3, 4(%sp)
	sw	%a2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	get_surface_id.3090
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8700
	lw	%v0, 8(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 6(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	neighbors_are_available.3093
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8701
	lw	%v0, 8(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8701:
	lw	%v0, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_calc_diffuse.2819
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%a2, 4(%sp)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8702
	j	beq_cont.8703
beq_else.8702:
	lw	%v0, 8(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 6(%sp)
	lw	%a1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_5points.3077
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.8703:
	lw	%v0, 4(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 8(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8700:
	jr	%ra
beq_else.8699:
	jr	%ra
write_ppm_header.3106:
	addi	%v0, %zero, 80
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2715
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2715
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2715
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
write_rgb_element.3108:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	int_of_float.2682
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%at, %zero, 255
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8706
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8708
	j	beq_cont.8709
beq_else.8708:
	addi	%v0, %zero, 0
beq_cont.8709:
	j	beq_cont.8707
beq_else.8706:
	addi	%v0, %zero, 255
beq_cont.8707:
	j	print_int.2715
write_rgb.3110:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3108
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 140
	flw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3108
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 140
	flw	%f0, 2(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3108
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3112:
	lw	%a0, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8710
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	get_surface_id.3090
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8711
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_calc_diffuse.2819
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8712
	j	beq_cont.8713
beq_else.8712:
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_group_id.2825
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 137
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	vecbzero.2733
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_nvectors.2830
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_intersection_points.2815
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 166
	lw	%a0, 4(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 5(%sp)
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	lw	%k1, 1(%sp)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2823
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 137
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veccpy.2735
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.8713:
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 3(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8711:
	jr	%ra
beq_else.8710:
	jr	%ra
pretrace_pixels.3115:
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8716
	addi	%a3, %zero, 147
	flw	%f3, 0(%a3)
	addi	%a3, %zero, 145
	lw	%a3, 0(%a3)
	sub	%a3, %v1, %a3
	sw	%k1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f1, 7(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f3, 9(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	float_of_int.2692
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 154
	flw	%f1, 0(%v0)
	fmul	%f1, %f0, %f1
	flw	%f2, 8(%sp)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 163
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 154
	flw	%f1, 1(%v0)
	fmul	%f1, %f0, %f1
	flw	%f3, 7(%sp)
	fadd	%f1, %f1, %f3
	addi	%v0, %zero, 163
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 154
	flw	%f1, 2(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 6(%sp)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 163
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 163
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecunit_sgn.2743
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 140
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecbzero.2733
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 64
	addi	%v0, %zero, 148
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	veccpy.2735
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 460(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	flw	%f1, 463(%zero)
	addi	%a2, %zero, 163
	lw	%k1, 3(%sp)
	addi	%a0, %a1, 0
	addi	%v1, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	p_rgb.2813
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 140
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	veccpy.2735
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	p_set_group_id.2827
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%k1, 1(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 1
	lw	%a0, 2(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	add_mod5.2722
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a0, %v0, 0
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8716:
	jr	%ra
pretrace_line.3122:
	lw	%a1, 1(%k1)
	addi	%a2, %zero, 147
	flw	%f0, 0(%a2)
	addi	%a2, %zero, 145
	lw	%a2, 1(%a2)
	sub	%v1, %v1, %a2
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_of_int.2692
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 157
	flw	%f1, 0(%v0)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 160
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 157
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 160
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 157
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	addi	%v0, %zero, 160
	flw	%f3, 2(%v0)
	fadd	%f0, %f0, %f3
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 2(%sp)
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	lw	%at, 0(%k1)
	jr	%at
scan_pixel.3126:
	lw	%a3, 2(%k1)
	lw	%t0, 1(%k1)
	addi	%t1, %zero, 143
	lw	%t1, 0(%t1)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8718
	jr	%ra
beq_else.8718:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a2, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_rgb.2813
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 140
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	veccpy.2735
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	neighbors_exist.3086
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8720
	lw	%v0, 7(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%k1, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.8721
beq_else.8720:
	addi	%a3, %zero, 0
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 2(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.8721:
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	write_rgb.3110
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
scan_line.3132:
	lw	%a3, 2(%k1)
	lw	%t0, 1(%k1)
	addi	%t1, %zero, 143
	lw	%t1, 1(%t1)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8722
	jr	%ra
beq_else.8722:
	addi	%t1, %zero, 143
	lw	%t1, 1(%t1)
	addi	%t1, %t1, -1
	sw	%k1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a3, 6(%sp)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8724
	j	beq_cont.8725
beq_else.8724:
	addi	%t1, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %t1, 0
	addi	%v0, %a1, 0
	addi	%k1, %t0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.8725:
	addi	%v0, %zero, 0
	lw	%v1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 2(%sp)
	lw	%k1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 2
	lw	%a0, 1(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	add_mod5.2722
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a2, %v0, 0
	lw	%v0, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
create_float5x3array.3138:
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 463(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 1(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 2(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_pixel.3140:
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_float5x3array.3138
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_float5x3array.3138
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	create_float5x3array.3138
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3138
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 1(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3142:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8726
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_pixel.3140
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3142
beq_else.8726:
	jr	%ra
create_pixelline.3145:
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_pixel.3140
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	j	init_line_elements.3142
tan.3147:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2706
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2704
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fdiv	%f0, %f1, %f0
	jr	%ra
adjust_position.3149:
	fmul	%f0, %f0, %f0
	flw	%f2, 419(%zero)
	fadd	%f0, %f0, %f2
	fsqrt	%f0, %f0
	flw	%f2, 460(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	atan.2708
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	tan.3147
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	jr	%ra
calc_dirvec.3152:
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.8727
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2672
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fsqr.2672
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 460(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 2(%sp)
	fdiv	%f1, %f1, %f0
	flw	%f2, 3(%sp)
	fdiv	%f2, %f2, %f0
	flw	%f3, 460(%zero)
	fdiv	%f0, %f3, %f0
	addi	%v0, %zero, 166
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 40
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 7(%sp)
	fneg	%f2, %f0
	flw	%f1, 8(%sp)
	flw	%f3, 6(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 80
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 7(%sp)
	fneg	%f3, %f2
	flw	%f4, 6(%sp)
	fadd	%f2, %f3, %fzero
	fadd	%f0, %f4, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 7(%sp)
	fneg	%f3, %f2
	flw	%f4, 6(%sp)
	fneg	%f5, %f4
	fadd	%f2, %f5, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 41
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 6(%sp)
	fneg	%f3, %f2
	flw	%f4, 7(%sp)
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 81
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2832
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 6(%sp)
	fneg	%f0, %f0
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	j	vecset.2725
beq_else.8727:
	fsw	%f2, 9(%sp)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 10(%sp)
	sw	%v0, 11(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	adjust_position.3149
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	flw	%f1, 10(%sp)
	fsw	%f0, 12(%sp)
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	adjust_position.3149
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 12(%sp)
	flw	%f2, 9(%sp)
	flw	%f3, 10(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3152
calc_dirvecs.3160:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8728
	sw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_of_int.2692
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 416(%zero)
	fsub	%f2, %f0, %f1
	addi	%v0, %zero, 0
	flw	%f0, 463(%zero)
	flw	%f1, 463(%zero)
	flw	%f3, 1(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3152
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_of_int.2692
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 419(%zero)
	fadd	%f2, %f0, %f1
	addi	%v0, %zero, 0
	flw	%f0, 463(%zero)
	flw	%f1, 463(%zero)
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 2
	flw	%f3, 1(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3152
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 1
	lw	%a0, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	add_mod5.2722
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 1(%sp)
	lw	%v0, 4(%sp)
	lw	%a0, 2(%sp)
	j	calc_dirvecs.3160
beq_else.8728:
	jr	%ra
calc_dirvec_rows.3165:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8730
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_of_int.2692
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 416(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 4
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	calc_dirvecs.3160
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 2
	lw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	add_mod5.2722
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 1(%sp)
	addi	%a0, %v0, 4
	lw	%v0, 3(%sp)
	j	calc_dirvec_rows.3165
beq_else.8730:
	jr	%ra
create_dirvec.3169:
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_dirvec_elements.3171:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8732
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3169
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	create_dirvec_elements.3171
beq_else.8732:
	jr	%ra
create_dirvecs.3174:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8734
	addi	%v1, %zero, 120
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3169
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 166
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 166
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 118
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec_elements.3171
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3174
beq_else.8734:
	jr	%ra
init_dirvec_constants.3176:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8736
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	setup_dirvec_constants.2961
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3176
beq_else.8736:
	jr	%ra
init_vecset_constants.3179:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8738
	addi	%v1, %zero, 166
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3176
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3179
beq_else.8738:
	jr	%ra
init_dirvecs.3181:
	addi	%v0, %zero, 4
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	create_dirvecs.3174
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	calc_dirvec_rows.3165
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 4
	j	init_vecset_constants.3179
add_reflection.3183:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_dirvec.3169
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	d_vec.2832
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	vecset.2725
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_dirvec_constants.2961
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 6(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 234
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	jr	%ra
setup_rect_reflection.3190:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 460(%zero)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_diffuse.2795
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fneg	%f1, %f1
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fneg	%f2, %f2
	addi	%v0, %zero, 67
	flw	%f3, 2(%v0)
	fneg	%f3, %f3
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%a0, %zero, 67
	flw	%f4, 0(%a0)
	lw	%a0, 0(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %a0, 0
	fadd	%f1, %f4, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3183
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 1(%sp)
	addi	%a1, %a0, 2
	addi	%a2, %zero, 67
	flw	%f2, 1(%a2)
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f3, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3183
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 1(%sp)
	addi	%a0, %a0, 3
	addi	%a1, %zero, 67
	flw	%f3, 2(%a1)
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3183
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3193:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 460(%zero)
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_diffuse.2795
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_abc.2787
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 67
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2746
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 448(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2781
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f2, 0(%v0)
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f2, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2783
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2785
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f1, 2(%v0)
	fsub	%f3, %f0, %f1
	flw	%f0, 4(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	add_reflection.3183
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
setup_reflections.3196:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8743
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_reflectiontype.2775
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8744
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_diffuse.2795
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 460(%zero)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fless.2658
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8745
	jr	%ra
beq_else.8745:
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2773
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8747
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_rect_reflection.3190
beq_else.8747:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8748
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_surface_reflection.3193
beq_else.8748:
	jr	%ra
beq_else.8744:
	jr	%ra
beq_else.8743:
	jr	%ra
rt.3198:
	lw	%a0, 3(%k1)
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	addi	%a3, %zero, 143
	sw	%v0, 0(%a3)
	addi	%a3, %zero, 143
	sw	%v1, 1(%a3)
	srl	%a3, %v0, 1
	addi	%t0, %zero, 145
	sw	%a3, 0(%t0)
	srl	%v1, %v1, 1
	addi	%a3, %zero, 145
	sw	%v1, 1(%a3)
	flw	%f0, 415(%zero)
	sw	%a0, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_of_int.2692
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fdiv	%f0, %f1, %f0
	addi	%v0, %zero, 147
	fsw	%f0, 0(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixelline.3145
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	create_pixelline.3145
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_pixelline.3145
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_parameter.2863
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	write_ppm_header.3106
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	init_dirvecs.3181
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	d_vec.2832
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 67
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	veccpy.2735
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_dirvec_constants.2961
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_reflections.3196
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%v0, 5(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	addi	%a2, %zero, 2
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	lw	%a1, 6(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 1
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 0
	addi	%a1, %zero, 0
	addi	%a2, %zero, 0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 0
	add	%t1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%t1)
	sw	%v0, 9(%t1)
	sw	%v0, 8(%t1)
	sw	%v0, 7(%t1)
	sw	%t0, 6(%t1)
	sw	%v0, 5(%t1)
	sw	%v0, 4(%t1)
	sw	%a3, 3(%t1)
	sw	%a2, 2(%t1)
	sw	%a1, 1(%t1)
	sw	%a0, 0(%t1)
	add	%v0, %zero, %t1
	addi	%a0, %zero, 1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 61
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 64
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 67
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 427(%zero)
	addi	%v1, %zero, 70
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 50
	addi	%v1, %zero, 1
	addi	%a0, %zero, -1
	addi	%a1, %zero, 71
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%a0, %zero, 72
	addi	%v1, %zero, 71
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 1
	addi	%a0, %zero, 72
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 122
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%a0, %zero, 123
	addi	%v1, %zero, 122
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 124
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 125
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 127
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 130
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 131
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 134
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 137
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 140
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 143
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 145
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 147
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 148
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 151
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 154
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 157
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 160
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 163
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 166
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 166
	addi	%a1, %zero, 166
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%a0)
	add	%v0, %zero, %a0
	addi	%a0, %zero, 166
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 5
	addi	%a0, %zero, 166
	addi	%v1, %zero, 166
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 463(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 174
	addi	%a1, %zero, 171
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_extarray
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 0
	flw	%f0, 463(%zero)
	addi	%a0, %zero, 234
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 234
	addi	%a1, %zero, 234
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 0
	flw	%f0, 463(%zero)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f0, 2(%a1)
	sw	%v0, 1(%a1)
	sw	%a0, 0(%a1)
	add	%v0, %zero, %a1
	addi	%a0, %zero, 234
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 414
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %zero, shadow_check_and_group.2994
	sw	%v1, 0(%v0)
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, shadow_check_one_or_group.2997
	sw	%a1, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a1, %zero, shadow_check_one_or_matrix.3000
	sw	%a1, 0(%v0)
	sw	%a0, 2(%v0)
	sw	%v1, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, trace_reflections.3047
	sw	%a1, 0(%a0)
	sw	%v0, 1(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a2, %zero, trace_ray.3052
	sw	%a2, 0(%a1)
	sw	%a0, 2(%a1)
	sw	%v0, 1(%a1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_ray.3058
	sw	%a2, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, iter_trace_diffuse_rays.3061
	sw	%a2, 0(%v0)
	sw	%a0, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_rays.3066
	sw	%a2, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_ray_80percent.3070
	sw	%a2, 0(%v0)
	sw	%a0, 1(%v0)
	add	%a2, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, calc_diffuse_using_1point.3074
	sw	%a3, 0(%a2)
	sw	%v0, 1(%a2)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, do_without_neighbors.3083
	sw	%a3, 0(%v0)
	sw	%a2, 1(%v0)
	add	%a2, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, try_exploit_neighbors.3099
	sw	%a3, 0(%a2)
	sw	%v0, 1(%a2)
	add	%a3, %zero, %hp
	addi	%hp, %hp, 2
	addi	%t0, %zero, pretrace_diffuse_rays.3112
	sw	%t0, 0(%a3)
	sw	%a0, 1(%a3)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%t0, %zero, pretrace_pixels.3115
	sw	%t0, 0(%a0)
	sw	%a1, 2(%a0)
	sw	%a3, 1(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, pretrace_line.3122
	sw	%a3, 0(%a1)
	sw	%a0, 1(%a1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a3, %zero, scan_pixel.3126
	sw	%a3, 0(%a0)
	sw	%a2, 2(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a2, %zero, scan_line.3132
	sw	%a2, 0(%v0)
	sw	%a0, 2(%v0)
	sw	%a1, 1(%v0)
	add	%k1, %zero, %hp
	addi	%hp, %hp, 4
	addi	%a0, %zero, rt.3198
	sw	%a0, 0(%k1)
	sw	%v0, 3(%k1)
	sw	%a1, 2(%k1)
	sw	%v1, 1(%k1)
	addi	%v0, %zero, 128
	addi	%v1, %zero, 128
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%g0, %zero, 0
	ret
