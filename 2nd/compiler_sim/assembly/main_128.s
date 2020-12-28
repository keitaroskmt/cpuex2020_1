.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 498
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
kernel_atan.2612:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 497(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 496(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 495(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 494(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 493(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 492(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155.10100:
	fblt	%f0, %f1, fbgt_else.16390
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16391
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16392
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16393
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16394
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16395
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16396
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16397
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16398
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16399
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16400
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16401
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16402
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16403
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16404
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16405
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10100
fbgt_else.16405:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16404:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16403:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16402:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16401:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16400:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16399:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16398:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16397:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16396:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16395:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16394:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16393:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16392:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16391:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16390:
	fmov	%f0, %f1
	jr	%ra
g.6159.10104:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.16406
	fblt	%f0, %f1, fbgt_else.16407
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16408
	fblt	%f0, %f1, fbgt_else.16409
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16410
	fblt	%f0, %f1, fbgt_else.16411
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16412
	fblt	%f0, %f1, fbgt_else.16413
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16413:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16412:
	jr	%ra
fbgt_else.16411:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16414
	fblt	%f0, %f1, fbgt_else.16415
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16415:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16414:
	jr	%ra
fbgt_else.16410:
	jr	%ra
fbgt_else.16409:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16416
	fblt	%f0, %f1, fbgt_else.16417
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16418
	fblt	%f0, %f1, fbgt_else.16419
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16419:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16418:
	jr	%ra
fbgt_else.16417:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16420
	fblt	%f0, %f1, fbgt_else.16421
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16421:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16420:
	jr	%ra
fbgt_else.16416:
	jr	%ra
fbgt_else.16408:
	jr	%ra
fbgt_else.16407:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16422
	fblt	%f0, %f1, fbgt_else.16423
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16424
	fblt	%f0, %f1, fbgt_else.16425
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16426
	fblt	%f0, %f1, fbgt_else.16427
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16427:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16426:
	jr	%ra
fbgt_else.16425:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16428
	fblt	%f0, %f1, fbgt_else.16429
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16429:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16428:
	jr	%ra
fbgt_else.16424:
	jr	%ra
fbgt_else.16423:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16430
	fblt	%f0, %f1, fbgt_else.16431
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16432
	fblt	%f0, %f1, fbgt_else.16433
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16433:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16432:
	jr	%ra
fbgt_else.16431:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16434
	fblt	%f0, %f1, fbgt_else.16435
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16435:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16434:
	jr	%ra
fbgt_else.16430:
	jr	%ra
fbgt_else.16422:
	jr	%ra
fbgt_else.16406:
	jr	%ra
cos.2616:
	flw	%f1, 490(%zero)
	fabs	%f0, %f0
	flw	%f2, 489(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.16436
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.16438
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.16440
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.16442
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.16444
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.16446
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.16448
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.16450
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.16452
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.16454
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.16456
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.16458
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.16460
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.16462
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.16464
	flw	%f3, 474(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.6155.10100
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16465
fbgt_else.16464:
	fmov	%f0, %f3
fbgt_cont.16465:
	j	fbgt_cont.16463
fbgt_else.16462:
	fmov	%f0, %f3
fbgt_cont.16463:
	j	fbgt_cont.16461
fbgt_else.16460:
	fmov	%f0, %f3
fbgt_cont.16461:
	j	fbgt_cont.16459
fbgt_else.16458:
	fmov	%f0, %f3
fbgt_cont.16459:
	j	fbgt_cont.16457
fbgt_else.16456:
	fmov	%f0, %f3
fbgt_cont.16457:
	j	fbgt_cont.16455
fbgt_else.16454:
	fmov	%f0, %f3
fbgt_cont.16455:
	j	fbgt_cont.16453
fbgt_else.16452:
	fmov	%f0, %f3
fbgt_cont.16453:
	j	fbgt_cont.16451
fbgt_else.16450:
	fmov	%f0, %f3
fbgt_cont.16451:
	j	fbgt_cont.16449
fbgt_else.16448:
	fmov	%f0, %f3
fbgt_cont.16449:
	j	fbgt_cont.16447
fbgt_else.16446:
	fmov	%f0, %f3
fbgt_cont.16447:
	j	fbgt_cont.16445
fbgt_else.16444:
	fmov	%f0, %f3
fbgt_cont.16445:
	j	fbgt_cont.16443
fbgt_else.16442:
	fmov	%f0, %f3
fbgt_cont.16443:
	j	fbgt_cont.16441
fbgt_else.16440:
	fmov	%f0, %f3
fbgt_cont.16441:
	j	fbgt_cont.16439
fbgt_else.16438:
	fmov	%f0, %f3
fbgt_cont.16439:
	j	fbgt_cont.16437
fbgt_else.16436:
	fmov	%f0, %f2
fbgt_cont.16437:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10104
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.16466
	fblt	%f2, %f0, fbgt_else.16468
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16470
	fblt	%f2, %f0, fbgt_else.16472
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16474
	fblt	%f2, %f0, fbgt_else.16476
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16477
fbgt_else.16476:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16477:
	j	fbgt_cont.16475
fbgt_else.16474:
	fmov	%f0, %f2
fbgt_cont.16475:
	j	fbgt_cont.16473
fbgt_else.16472:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16478
	fblt	%f2, %f0, fbgt_else.16480
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16481
fbgt_else.16480:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16481:
	j	fbgt_cont.16479
fbgt_else.16478:
	fmov	%f0, %f2
fbgt_cont.16479:
fbgt_cont.16473:
	j	fbgt_cont.16471
fbgt_else.16470:
	fmov	%f0, %f2
fbgt_cont.16471:
	j	fbgt_cont.16469
fbgt_else.16468:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16482
	fblt	%f2, %f0, fbgt_else.16484
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16486
	fblt	%f2, %f0, fbgt_else.16488
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16489
fbgt_else.16488:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16489:
	j	fbgt_cont.16487
fbgt_else.16486:
	fmov	%f0, %f2
fbgt_cont.16487:
	j	fbgt_cont.16485
fbgt_else.16484:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16490
	fblt	%f2, %f0, fbgt_else.16492
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16493
fbgt_else.16492:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16493:
	j	fbgt_cont.16491
fbgt_else.16490:
	fmov	%f0, %f2
fbgt_cont.16491:
fbgt_cont.16485:
	j	fbgt_cont.16483
fbgt_else.16482:
	fmov	%f0, %f2
fbgt_cont.16483:
fbgt_cont.16469:
	j	fbgt_cont.16467
fbgt_else.16466:
	fmov	%f0, %f2
fbgt_cont.16467:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.16494
	addi	%v0, %zero, 0
	j	fbgt_cont.16495
fbgt_else.16494:
	addi	%v0, %zero, 1
fbgt_cont.16495:
	fblt	%f0, %f1, fbgt_else.16496
	fsub	%f0, %f0, %f1
	j	fbgt_cont.16497
fbgt_else.16496:
fbgt_cont.16497:
	flw	%f2, 473(%zero)
	fblt	%f0, %f2, fbgt_else.16498
	beqi	%v0, 0, bnei_else.16500
	addi	%v0, %zero, 0
	j	bnei_cont.16501
bnei_else.16500:
	addi	%v0, %zero, 1
bnei_cont.16501:
	j	fbgt_cont.16499
fbgt_else.16498:
fbgt_cont.16499:
	flw	%f2, 473(%zero)
	fblt	%f0, %f2, fbgt_else.16502
	fsub	%f0, %f1, %f0
	j	fbgt_cont.16503
fbgt_else.16502:
fbgt_cont.16503:
	flw	%f1, 472(%zero)
	fblt	%f1, %f0, fbgt_else.16504
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 468(%zero)
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 465(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.16505
fbgt_else.16504:
	flw	%f1, 473(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 470(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 469(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.16505:
	beqi	%v0, 0, bnei_else.16506
	jr	%ra
bnei_else.16506:
	fneg	%f0, %f0
	jr	%ra
f.6155.10057:
	fblt	%f0, %f1, fbgt_else.16507
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16508
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16509
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16510
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16511
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16512
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16513
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16514
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16515
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16516
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16517
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16518
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16519
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16520
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16521
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16522
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10057
fbgt_else.16522:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16521:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16520:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16519:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16518:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16517:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16516:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16515:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16514:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16513:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16512:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16511:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16510:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16509:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16508:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.16507:
	fmov	%f0, %f1
	jr	%ra
g.6159.10061:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.16523
	fblt	%f0, %f1, fbgt_else.16524
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16525
	fblt	%f0, %f1, fbgt_else.16526
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16527
	fblt	%f0, %f1, fbgt_else.16528
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16529
	fblt	%f0, %f1, fbgt_else.16530
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16530:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16529:
	jr	%ra
fbgt_else.16528:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16531
	fblt	%f0, %f1, fbgt_else.16532
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16532:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16531:
	jr	%ra
fbgt_else.16527:
	jr	%ra
fbgt_else.16526:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16533
	fblt	%f0, %f1, fbgt_else.16534
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16535
	fblt	%f0, %f1, fbgt_else.16536
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16536:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16535:
	jr	%ra
fbgt_else.16534:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16537
	fblt	%f0, %f1, fbgt_else.16538
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16538:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16537:
	jr	%ra
fbgt_else.16533:
	jr	%ra
fbgt_else.16525:
	jr	%ra
fbgt_else.16524:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16539
	fblt	%f0, %f1, fbgt_else.16540
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16541
	fblt	%f0, %f1, fbgt_else.16542
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16543
	fblt	%f0, %f1, fbgt_else.16544
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16544:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16543:
	jr	%ra
fbgt_else.16542:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16545
	fblt	%f0, %f1, fbgt_else.16546
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16546:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16545:
	jr	%ra
fbgt_else.16541:
	jr	%ra
fbgt_else.16540:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16547
	fblt	%f0, %f1, fbgt_else.16548
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16549
	fblt	%f0, %f1, fbgt_else.16550
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16550:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16549:
	jr	%ra
fbgt_else.16548:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16551
	fblt	%f0, %f1, fbgt_else.16552
	fsub	%f0, %f0, %f1
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16552:
	flw	%f2, 491(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16551:
	jr	%ra
fbgt_else.16547:
	jr	%ra
fbgt_else.16539:
	jr	%ra
fbgt_else.16523:
	jr	%ra
sin.2618:
	flw	%f1, 490(%zero)
	flw	%f2, 464(%zero)
	fblt	%f0, %f2, fbgt_else.16553
	addi	%v0, %zero, 1
	j	fbgt_cont.16554
fbgt_else.16553:
	addi	%v0, %zero, 0
fbgt_cont.16554:
	fabs	%f0, %f0
	flw	%f2, 489(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.16555
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.16557
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.16559
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.16561
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.16563
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.16565
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.16567
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.16569
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.16571
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.16573
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.16575
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.16577
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.16579
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.16581
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.16583
	flw	%f3, 474(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.6155.10057
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16584
fbgt_else.16583:
	fmov	%f0, %f3
fbgt_cont.16584:
	j	fbgt_cont.16582
fbgt_else.16581:
	fmov	%f0, %f3
fbgt_cont.16582:
	j	fbgt_cont.16580
fbgt_else.16579:
	fmov	%f0, %f3
fbgt_cont.16580:
	j	fbgt_cont.16578
fbgt_else.16577:
	fmov	%f0, %f3
fbgt_cont.16578:
	j	fbgt_cont.16576
fbgt_else.16575:
	fmov	%f0, %f3
fbgt_cont.16576:
	j	fbgt_cont.16574
fbgt_else.16573:
	fmov	%f0, %f3
fbgt_cont.16574:
	j	fbgt_cont.16572
fbgt_else.16571:
	fmov	%f0, %f3
fbgt_cont.16572:
	j	fbgt_cont.16570
fbgt_else.16569:
	fmov	%f0, %f3
fbgt_cont.16570:
	j	fbgt_cont.16568
fbgt_else.16567:
	fmov	%f0, %f3
fbgt_cont.16568:
	j	fbgt_cont.16566
fbgt_else.16565:
	fmov	%f0, %f3
fbgt_cont.16566:
	j	fbgt_cont.16564
fbgt_else.16563:
	fmov	%f0, %f3
fbgt_cont.16564:
	j	fbgt_cont.16562
fbgt_else.16561:
	fmov	%f0, %f3
fbgt_cont.16562:
	j	fbgt_cont.16560
fbgt_else.16559:
	fmov	%f0, %f3
fbgt_cont.16560:
	j	fbgt_cont.16558
fbgt_else.16557:
	fmov	%f0, %f3
fbgt_cont.16558:
	j	fbgt_cont.16556
fbgt_else.16555:
	fmov	%f0, %f2
fbgt_cont.16556:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10061
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.16585
	fblt	%f2, %f0, fbgt_else.16587
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16589
	fblt	%f2, %f0, fbgt_else.16591
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16593
	fblt	%f2, %f0, fbgt_else.16595
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16596
fbgt_else.16595:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16596:
	j	fbgt_cont.16594
fbgt_else.16593:
	fmov	%f0, %f2
fbgt_cont.16594:
	j	fbgt_cont.16592
fbgt_else.16591:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16597
	fblt	%f2, %f0, fbgt_else.16599
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16600
fbgt_else.16599:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16600:
	j	fbgt_cont.16598
fbgt_else.16597:
	fmov	%f0, %f2
fbgt_cont.16598:
fbgt_cont.16592:
	j	fbgt_cont.16590
fbgt_else.16589:
	fmov	%f0, %f2
fbgt_cont.16590:
	j	fbgt_cont.16588
fbgt_else.16587:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16601
	fblt	%f2, %f0, fbgt_else.16603
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16605
	fblt	%f2, %f0, fbgt_else.16607
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16608
fbgt_else.16607:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16608:
	j	fbgt_cont.16606
fbgt_else.16605:
	fmov	%f0, %f2
fbgt_cont.16606:
	j	fbgt_cont.16604
fbgt_else.16603:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16609
	fblt	%f2, %f0, fbgt_else.16611
	fsub	%f1, %f2, %f0
	flw	%f2, 491(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16612
fbgt_else.16611:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16612:
	j	fbgt_cont.16610
fbgt_else.16609:
	fmov	%f0, %f2
fbgt_cont.16610:
fbgt_cont.16604:
	j	fbgt_cont.16602
fbgt_else.16601:
	fmov	%f0, %f2
fbgt_cont.16602:
fbgt_cont.16588:
	j	fbgt_cont.16586
fbgt_else.16585:
	fmov	%f0, %f2
fbgt_cont.16586:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.16613
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.16615
	addi	%v0, %zero, 0
	j	bnei_cont.16616
bnei_else.16615:
	addi	%v0, %zero, 1
bnei_cont.16616:
	j	fbgt_cont.16614
fbgt_else.16613:
	lw	%v0, 0(%sp)
fbgt_cont.16614:
	fblt	%f0, %f1, fbgt_else.16617
	fsub	%f0, %f0, %f1
	j	fbgt_cont.16618
fbgt_else.16617:
fbgt_cont.16618:
	flw	%f2, 473(%zero)
	fblt	%f0, %f2, fbgt_else.16619
	fsub	%f0, %f1, %f0
	j	fbgt_cont.16620
fbgt_else.16619:
fbgt_cont.16620:
	flw	%f1, 472(%zero)
	fblt	%f1, %f0, fbgt_else.16621
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 470(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 469(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.16622
fbgt_else.16621:
	flw	%f1, 473(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 468(%zero)
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 465(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.16622:
	beqi	%v0, 0, bnei_else.16623
	jr	%ra
bnei_else.16623:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2622:
	blti	%v0, 10, bgti_else.16624
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16625
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16626
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16627
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16628
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16629
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16630
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.16631
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
bgti_else.16631:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16630:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16629:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16628:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16627:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16626:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16625:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.16624:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	blti	%v0, 10, bgti_else.16632
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16633
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16634
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16635
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16636
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16637
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16638
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.16639
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
bgti_else.16639:
	jr	%ra
bgti_else.16638:
	jr	%ra
bgti_else.16637:
	jr	%ra
bgti_else.16636:
	jr	%ra
bgti_else.16635:
	jr	%ra
bgti_else.16634:
	jr	%ra
bgti_else.16633:
	jr	%ra
bgti_else.16632:
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.16640
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.16642
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16644
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16646
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16648
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16650
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16652
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.16653
bgti_else.16652:
	addi	%v0, %zero, 6
bgti_cont.16653:
	j	bgti_cont.16651
bgti_else.16650:
	addi	%v0, %zero, 5
bgti_cont.16651:
	j	bgti_cont.16649
bgti_else.16648:
	addi	%v0, %zero, 4
bgti_cont.16649:
	j	bgti_cont.16647
bgti_else.16646:
	addi	%v0, %zero, 3
bgti_cont.16647:
	j	bgti_cont.16645
bgti_else.16644:
	addi	%v0, %zero, 2
bgti_cont.16645:
	j	bgti_cont.16643
bgti_else.16642:
	addi	%v0, %zero, 1
bgti_cont.16643:
	j	bgti_cont.16641
bgti_else.16640:
	addi	%v0, %zero, 0
bgti_cont.16641:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.16654
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16656
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16658
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16660
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16662
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16664
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16666
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.16667
bgti_else.16666:
	add	%v0, %zero, %v1
bgti_cont.16667:
	j	bgti_cont.16665
bgti_else.16664:
	add	%v0, %zero, %v1
bgti_cont.16665:
	j	bgti_cont.16663
bgti_else.16662:
	add	%v0, %zero, %v1
bgti_cont.16663:
	j	bgti_cont.16661
bgti_else.16660:
	add	%v0, %zero, %v1
bgti_cont.16661:
	j	bgti_cont.16659
bgti_else.16658:
	add	%v0, %zero, %v1
bgti_cont.16659:
	j	bgti_cont.16657
bgti_else.16656:
	add	%v0, %zero, %v1
bgti_cont.16657:
	j	bgti_cont.16655
bgti_else.16654:
	add	%v0, %zero, %v1
bgti_cont.16655:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.16668
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.16668:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.16669
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.16671
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16673
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16675
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16677
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16679
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16681
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.16682
bgti_else.16681:
	addi	%v0, %zero, 6
bgti_cont.16682:
	j	bgti_cont.16680
bgti_else.16679:
	addi	%v0, %zero, 5
bgti_cont.16680:
	j	bgti_cont.16678
bgti_else.16677:
	addi	%v0, %zero, 4
bgti_cont.16678:
	j	bgti_cont.16676
bgti_else.16675:
	addi	%v0, %zero, 3
bgti_cont.16676:
	j	bgti_cont.16674
bgti_else.16673:
	addi	%v0, %zero, 2
bgti_cont.16674:
	j	bgti_cont.16672
bgti_else.16671:
	addi	%v0, %zero, 1
bgti_cont.16672:
	j	bgti_cont.16670
bgti_else.16669:
	addi	%v0, %zero, 0
bgti_cont.16670:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.16683
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16685
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16687
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16689
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16691
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16693
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16695
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.16696
bgti_else.16695:
	add	%v0, %zero, %v1
bgti_cont.16696:
	j	bgti_cont.16694
bgti_else.16693:
	add	%v0, %zero, %v1
bgti_cont.16694:
	j	bgti_cont.16692
bgti_else.16691:
	add	%v0, %zero, %v1
bgti_cont.16692:
	j	bgti_cont.16690
bgti_else.16689:
	add	%v0, %zero, %v1
bgti_cont.16690:
	j	bgti_cont.16688
bgti_else.16687:
	add	%v0, %zero, %v1
bgti_cont.16688:
	j	bgti_cont.16686
bgti_else.16685:
	add	%v0, %zero, %v1
bgti_cont.16686:
	j	bgti_cont.16684
bgti_else.16683:
	add	%v0, %zero, %v1
bgti_cont.16684:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.16697
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.16697:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.16698
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16700
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16702
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16704
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16706
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16708
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16710
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.16711
bgti_else.16710:
	add	%v0, %zero, %v1
bgti_cont.16711:
	j	bgti_cont.16709
bgti_else.16708:
	add	%v0, %zero, %v1
bgti_cont.16709:
	j	bgti_cont.16707
bgti_else.16706:
	add	%v0, %zero, %v1
bgti_cont.16707:
	j	bgti_cont.16705
bgti_else.16704:
	add	%v0, %zero, %v1
bgti_cont.16705:
	j	bgti_cont.16703
bgti_else.16702:
	add	%v0, %zero, %v1
bgti_cont.16703:
	j	bgti_cont.16701
bgti_else.16700:
	add	%v0, %zero, %v1
bgti_cont.16701:
	j	bgti_cont.16699
bgti_else.16698:
	add	%v0, %zero, %v1
bgti_cont.16699:
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
vecunit_sgn.2655:
	flw	%f0, 0(%v0)
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%v0)
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16712
	addi	%a0, %zero, 1
	j	fbeq_cont.16713
fbeq_else.16712:
	addi	%a0, %zero, 0
fbeq_cont.16713:
	beqi	%a0, 0, bnei_else.16714
	flw	%f0, 468(%zero)
	j	bnei_cont.16715
bnei_else.16714:
	beqi	%v1, 0, bnei_else.16716
	flw	%f1, 463(%zero)
	fdiv	%f0, %f1, %f0
	j	bnei_cont.16717
bnei_else.16716:
	flw	%f1, 468(%zero)
	fdiv	%f0, %f1, %f0
bnei_cont.16717:
bnei_cont.16715:
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
vecaccumv.2679:
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
read_screen_settings.2756:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 2(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	cos.2616
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	sin.2618
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 461(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 171
	fsw	%f2, 0(%v0)
	flw	%f2, 460(%zero)
	flw	%f3, 2(%sp)
	fmul	%f2, %f3, %f2
	addi	%v0, %zero, 171
	fsw	%f2, 1(%v0)
	flw	%f2, 4(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 461(%zero)
	fmul	%f4, %f4, %f5
	addi	%v0, %zero, 171
	fsw	%f4, 2(%v0)
	addi	%v0, %zero, 165
	fsw	%f2, 0(%v0)
	flw	%f4, 464(%zero)
	addi	%v0, %zero, 165
	fsw	%f4, 1(%v0)
	fneg	%f4, %f0
	addi	%v0, %zero, 165
	fsw	%f4, 2(%v0)
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	addi	%v0, %zero, 168
	fsw	%f0, 0(%v0)
	fneg	%f0, %f1
	addi	%v0, %zero, 168
	fsw	%f0, 1(%v0)
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 168
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 1(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 2(%v0)
	jr	%ra
read_light.2758:
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
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2618
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 1(%v0)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_float
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2616
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 2(%v0)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 81
	fsw	%f0, 0(%v0)
	jr	%ra
rotate_quadratic_matrix.2760:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 3(%sp)
	fmov	%f0, %f1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2616
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2618
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
	fmul	%f12, %f3, %f3
	fmul	%f12, %f5, %f12
	fmul	%f13, %f9, %f9
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 0(%v0)
	fmul	%f12, %f6, %f6
	fmul	%f12, %f5, %f12
	fmul	%f13, %f10, %f10
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 1(%v0)
	fmul	%f12, %f8, %f8
	fmul	%f12, %f5, %f12
	fmul	%f13, %f0, %f0
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 2(%v0)
	flw	%f12, 491(%zero)
	fmul	%f13, %f5, %f6
	fmul	%f13, %f13, %f8
	fmul	%f14, %f7, %f10
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f11, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f12, %f12, %f13
	lw	%v0, 1(%sp)
	fsw	%f12, 0(%v0)
	flw	%f12, 491(%zero)
	fmul	%f13, %f5, %f3
	fmul	%f8, %f13, %f8
	fmul	%f13, %f7, %f9
	fmul	%f0, %f13, %f0
	fadd	%f0, %f8, %f0
	fmul	%f8, %f11, %f1
	fmul	%f2, %f8, %f2
	fadd	%f0, %f0, %f2
	fmul	%f0, %f12, %f0
	fsw	%f0, 1(%v0)
	flw	%f0, 491(%zero)
	fmul	%f2, %f5, %f3
	fmul	%f2, %f2, %f6
	fmul	%f3, %f7, %f9
	fmul	%f3, %f3, %f10
	fadd	%f2, %f2, %f3
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_nth_object.2763:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.16723
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
	flw	%f0, 464(%zero)
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
	flw	%f0, 464(%zero)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.16724
	addi	%v0, %zero, 0
	j	fbgt_cont.16725
fbgt_else.16724:
	addi	%v0, %zero, 1
fbgt_cont.16725:
	addi	%v1, %zero, 2
	flw	%f0, 464(%zero)
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
	flw	%f0, 464(%zero)
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
	flw	%f0, 464(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 4(%sp)
	beqi	%v1, 0, bnei_else.16726
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.16727
bnei_else.16726:
bnei_cont.16727:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.16728
	lw	%a0, 7(%sp)
	j	bnei_cont.16729
bnei_else.16728:
	addi	%a0, %zero, 1
bnei_cont.16729:
	addi	%a1, %zero, 4
	flw	%f0, 464(%zero)
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
	addi	%a3, %zero, 12
	lw	%t0, 0(%sp)
	add	%at, %a3, %t0
	sw	%v1, 0(%at)
	beqi	%a2, 3, bnei_else.16730
	beqi	%a2, 2, bnei_else.16732
	j	bnei_cont.16733
bnei_else.16732:
	lw	%v1, 7(%sp)
	beqi	%v1, 0, bnei_else.16734
	addi	%v1, %zero, 0
	j	bnei_cont.16735
bnei_else.16734:
	addi	%v1, %zero, 1
bnei_cont.16735:
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.16733:
	j	bnei_cont.16731
bnei_else.16730:
	flw	%f0, 0(%a0)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16736
	addi	%v1, %zero, 1
	j	fbeq_cont.16737
fbeq_else.16736:
	addi	%v1, %zero, 0
fbeq_cont.16737:
	beqi	%v1, 0, bnei_else.16738
	flw	%f0, 464(%zero)
	j	bnei_cont.16739
bnei_else.16738:
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16740
	addi	%v1, %zero, 1
	j	fbeq_cont.16741
fbeq_else.16740:
	addi	%v1, %zero, 0
fbeq_cont.16741:
	beqi	%v1, 0, bnei_else.16742
	flw	%f1, 464(%zero)
	j	bnei_cont.16743
bnei_else.16742:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.16744
	addi	%v1, %zero, 0
	j	fbgt_cont.16745
fbgt_else.16744:
	addi	%v1, %zero, 1
fbgt_cont.16745:
	beqi	%v1, 0, bnei_else.16746
	flw	%f1, 468(%zero)
	j	bnei_cont.16747
bnei_else.16746:
	flw	%f1, 463(%zero)
bnei_cont.16747:
bnei_cont.16743:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16739:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16748
	addi	%v1, %zero, 1
	j	fbeq_cont.16749
fbeq_else.16748:
	addi	%v1, %zero, 0
fbeq_cont.16749:
	beqi	%v1, 0, bnei_else.16750
	flw	%f0, 464(%zero)
	j	bnei_cont.16751
bnei_else.16750:
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16752
	addi	%v1, %zero, 1
	j	fbeq_cont.16753
fbeq_else.16752:
	addi	%v1, %zero, 0
fbeq_cont.16753:
	beqi	%v1, 0, bnei_else.16754
	flw	%f1, 464(%zero)
	j	bnei_cont.16755
bnei_else.16754:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.16756
	addi	%v1, %zero, 0
	j	fbgt_cont.16757
fbgt_else.16756:
	addi	%v1, %zero, 1
fbgt_cont.16757:
	beqi	%v1, 0, bnei_else.16758
	flw	%f1, 468(%zero)
	j	bnei_cont.16759
bnei_else.16758:
	flw	%f1, 463(%zero)
bnei_cont.16759:
bnei_cont.16755:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16751:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16760
	addi	%v1, %zero, 1
	j	fbeq_cont.16761
fbeq_else.16760:
	addi	%v1, %zero, 0
fbeq_cont.16761:
	beqi	%v1, 0, bnei_else.16762
	flw	%f0, 464(%zero)
	j	bnei_cont.16763
bnei_else.16762:
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16764
	addi	%v1, %zero, 1
	j	fbeq_cont.16765
fbeq_else.16764:
	addi	%v1, %zero, 0
fbeq_cont.16765:
	beqi	%v1, 0, bnei_else.16766
	flw	%f1, 464(%zero)
	j	bnei_cont.16767
bnei_else.16766:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.16768
	addi	%v1, %zero, 0
	j	fbgt_cont.16769
fbgt_else.16768:
	addi	%v1, %zero, 1
fbgt_cont.16769:
	beqi	%v1, 0, bnei_else.16770
	flw	%f1, 468(%zero)
	j	bnei_cont.16771
bnei_else.16770:
	flw	%f1, 463(%zero)
bnei_cont.16771:
bnei_cont.16767:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16763:
	fsw	%f0, 2(%a0)
bnei_cont.16731:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.16772
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.16773
bnei_else.16772:
bnei_cont.16773:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16723:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2765:
	blti	%v0, 60, bgti_else.16774
	jr	%ra
bgti_else.16774:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.16776
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16777
	jr	%ra
bgti_else.16777:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2763
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.16779
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16780
	jr	%ra
bgti_else.16780:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2763
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.16782
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16783
	jr	%ra
bgti_else.16783:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2763
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.16785
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
bnei_else.16785:
	addi	%v0, %zero, 0
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16782:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16779:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16776:
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.16790
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16791
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.16793
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, -1, bnei_else.16795
	lw	%v1, 6(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_net_item.2769
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16796
bnei_else.16795:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16796:
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16794
bnei_else.16793:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16794:
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16792
bnei_else.16791:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16792:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.16790:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
read_or_network.2771:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.16797
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, -1, bnei_else.16799
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16801
	addi	%v1, %zero, 3
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_net_item.2769
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.16802
bnei_else.16801:
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16802:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16800
bnei_else.16799:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16800:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.16798
bnei_else.16797:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
bnei_cont.16798:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.16803
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.16804
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, -1, bnei_else.16806
	addi	%v1, %zero, 2
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_net_item.2769
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16807
bnei_else.16806:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16807:
	lw	%v1, 6(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.16805
bnei_else.16804:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
bnei_cont.16805:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.16808
	lw	%v0, 5(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_or_network.2771
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16809
bnei_else.16808:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.16809:
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.16803:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2773:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.16810
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, -1, bnei_else.16812
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16814
	addi	%v1, %zero, 3
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_net_item.2769
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.16815
bnei_else.16814:
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16815:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16813
bnei_else.16812:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16813:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.16811
bnei_else.16810:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16811:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.16816
	addi	%v1, %zero, 83
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.16817
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.16819
	addi	%v1, %zero, 2
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_net_item.2769
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16820
bnei_else.16819:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.16820:
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.16818
bnei_else.16817:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.16818:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.16821
	addi	%v1, %zero, 83
	lw	%a0, 4(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
bnei_else.16821:
	jr	%ra
bnei_else.16816:
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.16824
	addi	%a3, %zero, 1
	j	fbeq_cont.16825
fbeq_else.16824:
	addi	%a3, %zero, 0
fbeq_cont.16825:
	beqi	%a3, 0, bnei_else.16826
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16826:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.16827
	addi	%t0, %zero, 0
	j	fbgt_cont.16828
fbgt_else.16827:
	addi	%t0, %zero, 1
fbgt_cont.16828:
	beqi	%v0, 0, bnei_else.16829
	beqi	%t0, 0, bnei_else.16831
	addi	%v0, %zero, 0
	j	bnei_cont.16832
bnei_else.16831:
	addi	%v0, %zero, 1
bnei_cont.16832:
	j	bnei_cont.16830
bnei_else.16829:
	add	%v0, %zero, %t0
bnei_cont.16830:
	add	%at, %a3, %a0
	flw	%f3, 0(%at)
	beqi	%v0, 0, bnei_else.16833
	j	bnei_cont.16834
bnei_else.16833:
	fneg	%f3, %f3
bnei_cont.16834:
	fsub	%f0, %f3, %f0
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1
	flw	%f3, 0(%at)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	fabs	%f1, %f1
	add	%at, %a3, %a1
	flw	%f3, 0(%at)
	fblt	%f1, %f3, fbgt_else.16835
	addi	%v0, %zero, 0
	j	fbgt_cont.16836
fbgt_else.16835:
	addi	%v0, %zero, 1
fbgt_cont.16836:
	beqi	%v0, 0, bnei_else.16837
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.16838
	addi	%v0, %zero, 0
	j	fbgt_cont.16839
fbgt_else.16838:
	addi	%v0, %zero, 1
fbgt_cont.16839:
	beqi	%v0, 0, bnei_else.16840
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16840:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16837:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2792:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	flw	%f5, 1(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	flw	%f5, 2(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 464(%zero)
	fblt	%f4, %f3, fbgt_else.16841
	addi	%v1, %zero, 0
	j	fbgt_cont.16842
fbgt_else.16841:
	addi	%v1, %zero, 1
fbgt_cont.16842:
	beqi	%v1, 0, bnei_else.16843
	flw	%f4, 0(%v0)
	fmul	%f0, %f4, %f0
	flw	%f4, 1(%v0)
	fmul	%f1, %f4, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16843:
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2798:
	fmul	%f3, %f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%v1, 4(%v0)
	flw	%f5, 1(%v1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.16844
	fmul	%f4, %f1, %f2
	lw	%v1, 9(%v0)
	flw	%f5, 0(%v1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lw	%v1, 9(%v0)
	flw	%f4, 1(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lw	%v0, 9(%v0)
	flw	%f1, 2(%v0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	jr	%ra
bnei_else.16844:
	fmov	%f0, %f3
	jr	%ra
bilinear.2803:
	fmul	%f6, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f7, 0(%v1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f5
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.16845
	fmul	%f7, %f2, %f4
	fmul	%f8, %f1, %f5
	fadd	%f7, %f7, %f8
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f7, %f7, %f8
	fmul	%f5, %f0, %f5
	fmul	%f2, %f2, %f3
	fadd	%f2, %f5, %f2
	lw	%v1, 9(%v0)
	flw	%f5, 1(%v1)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f7, %f2
	fmul	%f0, %f0, %f4
	fmul	%f1, %f1, %f3
	fadd	%f0, %f0, %f1
	lw	%v0, 9(%v0)
	flw	%f1, 2(%v0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	flw	%f1, 467(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	jr	%ra
bnei_else.16845:
	fmov	%f0, %f6
	jr	%ra
solver_second.2811:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	quadratic.2798
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16846
	addi	%v0, %zero, 1
	j	fbeq_cont.16847
fbeq_else.16846:
	addi	%v0, %zero, 0
fbeq_cont.16847:
	beqi	%v0, 0, bnei_else.16848
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16848:
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	flw	%f2, 1(%v0)
	flw	%f3, 2(%v0)
	flw	%f4, 2(%sp)
	flw	%f5, 1(%sp)
	flw	%f6, 0(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	fmov	%f3, %f4
	fmov	%f4, %f5
	fmov	%f5, %f6
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	bilinear.2803
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2798
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.16849
	j	bnei_cont.16850
bnei_else.16849:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16850:
	flw	%f1, 6(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 5(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 464(%zero)
	fblt	%f2, %f0, fbgt_else.16851
	addi	%v1, %zero, 0
	j	fbgt_cont.16852
fbgt_else.16851:
	addi	%v1, %zero, 1
fbgt_cont.16852:
	beqi	%v1, 0, bnei_else.16853
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16854
	j	bnei_cont.16855
bnei_else.16854:
	fneg	%f0, %f0
bnei_cont.16855:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16853:
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	flw	%f0, 0(%a0)
	lw	%a1, 5(%v0)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	lw	%a1, 5(%v0)
	flw	%f2, 1(%a1)
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%a0)
	lw	%a0, 5(%v0)
	flw	%f3, 2(%a0)
	fsub	%f2, %f2, %f3
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.16856
	beqi	%a0, 2, bnei_else.16857
	j	solver_second.2811
bnei_else.16857:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	flw	%f5, 1(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	flw	%f5, 2(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 464(%zero)
	fblt	%f4, %f3, fbgt_else.16858
	addi	%v1, %zero, 0
	j	fbgt_cont.16859
fbgt_else.16858:
	addi	%v1, %zero, 1
fbgt_cont.16859:
	beqi	%v1, 0, bnei_else.16860
	flw	%f4, 0(%v0)
	fmul	%f0, %f4, %f0
	flw	%f4, 1(%v0)
	fmul	%f1, %f4, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16860:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16856:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.16861
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16861:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.16862
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.16862:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.16863
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.16863:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect_fast.2821:
	flw	%f3, 0(%a0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 1(%a1)
	fblt	%f4, %f5, fbgt_else.16864
	addi	%a1, %zero, 0
	j	fbgt_cont.16865
fbgt_else.16864:
	addi	%a1, %zero, 1
fbgt_cont.16865:
	beqi	%a1, 0, bnei_else.16866
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fblt	%f4, %f5, fbgt_else.16868
	addi	%a1, %zero, 0
	j	fbgt_cont.16869
fbgt_else.16868:
	addi	%a1, %zero, 1
fbgt_cont.16869:
	beqi	%a1, 0, bnei_else.16870
	flw	%f4, 1(%a0)
	flw	%f5, 464(%zero)
	fbne	%f4, %f5, fbeq_else.16872
	addi	%a1, %zero, 1
	j	fbeq_cont.16873
fbeq_else.16872:
	addi	%a1, %zero, 0
fbeq_cont.16873:
	beqi	%a1, 0, bnei_else.16874
	addi	%a1, %zero, 0
	j	bnei_cont.16875
bnei_else.16874:
	addi	%a1, %zero, 1
bnei_cont.16875:
	j	bnei_cont.16871
bnei_else.16870:
	addi	%a1, %zero, 0
bnei_cont.16871:
	j	bnei_cont.16867
bnei_else.16866:
	addi	%a1, %zero, 0
bnei_cont.16867:
	beqi	%a1, 0, bnei_else.16876
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16876:
	flw	%f3, 2(%a0)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a0)
	fmul	%f3, %f3, %f4
	flw	%f4, 0(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 0(%a1)
	fblt	%f4, %f5, fbgt_else.16877
	addi	%a1, %zero, 0
	j	fbgt_cont.16878
fbgt_else.16877:
	addi	%a1, %zero, 1
fbgt_cont.16878:
	beqi	%a1, 0, bnei_else.16879
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fblt	%f4, %f5, fbgt_else.16881
	addi	%a1, %zero, 0
	j	fbgt_cont.16882
fbgt_else.16881:
	addi	%a1, %zero, 1
fbgt_cont.16882:
	beqi	%a1, 0, bnei_else.16883
	flw	%f4, 3(%a0)
	flw	%f5, 464(%zero)
	fbne	%f4, %f5, fbeq_else.16885
	addi	%a1, %zero, 1
	j	fbeq_cont.16886
fbeq_else.16885:
	addi	%a1, %zero, 0
fbeq_cont.16886:
	beqi	%a1, 0, bnei_else.16887
	addi	%a1, %zero, 0
	j	bnei_cont.16888
bnei_else.16887:
	addi	%a1, %zero, 1
bnei_cont.16888:
	j	bnei_cont.16884
bnei_else.16883:
	addi	%a1, %zero, 0
bnei_cont.16884:
	j	bnei_cont.16880
bnei_else.16879:
	addi	%a1, %zero, 0
bnei_cont.16880:
	beqi	%a1, 0, bnei_else.16889
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.16889:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	lw	%a1, 4(%v0)
	flw	%f3, 0(%a1)
	fblt	%f0, %f3, fbgt_else.16890
	addi	%a1, %zero, 0
	j	fbgt_cont.16891
fbgt_else.16890:
	addi	%a1, %zero, 1
fbgt_cont.16891:
	beqi	%a1, 0, bnei_else.16892
	flw	%f0, 1(%v1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.16894
	addi	%v0, %zero, 0
	j	fbgt_cont.16895
fbgt_else.16894:
	addi	%v0, %zero, 1
fbgt_cont.16895:
	beqi	%v0, 0, bnei_else.16896
	flw	%f0, 5(%a0)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16898
	addi	%v0, %zero, 1
	j	fbeq_cont.16899
fbeq_else.16898:
	addi	%v0, %zero, 0
fbeq_cont.16899:
	beqi	%v0, 0, bnei_else.16900
	addi	%v0, %zero, 0
	j	bnei_cont.16901
bnei_else.16900:
	addi	%v0, %zero, 1
bnei_cont.16901:
	j	bnei_cont.16897
bnei_else.16896:
	addi	%v0, %zero, 0
bnei_cont.16897:
	j	bnei_cont.16893
bnei_else.16892:
	addi	%v0, %zero, 0
bnei_cont.16893:
	beqi	%v0, 0, bnei_else.16902
	addi	%v0, %zero, 135
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.16902:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.16903
	addi	%a0, %zero, 1
	j	fbeq_cont.16904
fbeq_else.16903:
	addi	%a0, %zero, 0
fbeq_cont.16904:
	beqi	%a0, 0, bnei_else.16905
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16905:
	flw	%f4, 1(%v1)
	fmul	%f4, %f4, %f0
	flw	%f5, 2(%v1)
	fmul	%f5, %f5, %f1
	fadd	%f4, %f4, %f5
	flw	%f5, 3(%v1)
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	sw	%v1, 0(%sp)
	fsw	%f3, 1(%sp)
	fsw	%f4, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	quadratic.2798
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.16906
	j	bnei_cont.16907
bnei_else.16906:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16907:
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 1(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 464(%zero)
	fblt	%f2, %f0, fbgt_else.16908
	addi	%v1, %zero, 0
	j	fbgt_cont.16909
fbgt_else.16908:
	addi	%v1, %zero, 1
fbgt_cont.16909:
	beqi	%v1, 0, bnei_else.16910
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16911
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.16912
bnei_else.16911:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.16912:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16910:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.16913
	addi	%a1, %zero, 1
	j	fbeq_cont.16914
fbeq_else.16913:
	addi	%a1, %zero, 0
fbeq_cont.16914:
	beqi	%a1, 0, bnei_else.16915
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16915:
	flw	%f4, 1(%v1)
	fmul	%f0, %f4, %f0
	flw	%f4, 2(%v1)
	fmul	%f1, %f4, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a0)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	flw	%f2, 464(%zero)
	fblt	%f2, %f1, fbgt_else.16916
	addi	%a0, %zero, 0
	j	fbgt_cont.16917
fbgt_else.16916:
	addi	%a0, %zero, 1
fbgt_cont.16917:
	beqi	%a0, 0, bnei_else.16918
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16919
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.16920
bnei_else.16919:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.16920:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16918:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2858:
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	lw	%a1, 10(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	lw	%a2, 1(%v1)
	add	%at, %a2, %v0
	lw	%v0, 0(%at)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.16921
	beqi	%a2, 2, bnei_else.16922
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	j	solver_second_fast2.2851
bnei_else.16922:
	flw	%f0, 0(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.16923
	addi	%v1, %zero, 0
	j	fbgt_cont.16924
fbgt_else.16923:
	addi	%v1, %zero, 1
fbgt_cont.16924:
	beqi	%v1, 0, bnei_else.16925
	flw	%f0, 0(%v0)
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16925:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16921:
	lw	%v1, 0(%v1)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	j	solver_rect_fast.2821
setup_rect_table.2861:
	addi	%a0, %zero, 6
	flw	%f0, 464(%zero)
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
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16926
	addi	%a0, %zero, 1
	j	fbeq_cont.16927
fbeq_else.16926:
	addi	%a0, %zero, 0
fbeq_cont.16927:
	beqi	%a0, 0, bnei_else.16928
	flw	%f0, 464(%zero)
	fsw	%f0, 1(%v0)
	j	bnei_cont.16929
bnei_else.16928:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 0(%v1)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.16930
	addi	%a2, %zero, 0
	j	fbgt_cont.16931
fbgt_else.16930:
	addi	%a2, %zero, 1
fbgt_cont.16931:
	beqi	%a1, 0, bnei_else.16932
	beqi	%a2, 0, bnei_else.16934
	addi	%a1, %zero, 0
	j	bnei_cont.16935
bnei_else.16934:
	addi	%a1, %zero, 1
bnei_cont.16935:
	j	bnei_cont.16933
bnei_else.16932:
	add	%a1, %zero, %a2
bnei_cont.16933:
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	beqi	%a1, 0, bnei_else.16936
	j	bnei_cont.16937
bnei_else.16936:
	fneg	%f0, %f0
bnei_cont.16937:
	fsw	%f0, 0(%v0)
	flw	%f0, 468(%zero)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
bnei_cont.16929:
	flw	%f0, 1(%v1)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16938
	addi	%a0, %zero, 1
	j	fbeq_cont.16939
fbeq_else.16938:
	addi	%a0, %zero, 0
fbeq_cont.16939:
	beqi	%a0, 0, bnei_else.16940
	flw	%f0, 464(%zero)
	fsw	%f0, 3(%v0)
	j	bnei_cont.16941
bnei_else.16940:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 1(%v1)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.16942
	addi	%a2, %zero, 0
	j	fbgt_cont.16943
fbgt_else.16942:
	addi	%a2, %zero, 1
fbgt_cont.16943:
	beqi	%a1, 0, bnei_else.16944
	beqi	%a2, 0, bnei_else.16946
	addi	%a1, %zero, 0
	j	bnei_cont.16947
bnei_else.16946:
	addi	%a1, %zero, 1
bnei_cont.16947:
	j	bnei_cont.16945
bnei_else.16944:
	add	%a1, %zero, %a2
bnei_cont.16945:
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	beqi	%a1, 0, bnei_else.16948
	j	bnei_cont.16949
bnei_else.16948:
	fneg	%f0, %f0
bnei_cont.16949:
	fsw	%f0, 2(%v0)
	flw	%f0, 468(%zero)
	flw	%f1, 1(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
bnei_cont.16941:
	flw	%f0, 2(%v1)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16950
	addi	%a0, %zero, 1
	j	fbeq_cont.16951
fbeq_else.16950:
	addi	%a0, %zero, 0
fbeq_cont.16951:
	beqi	%a0, 0, bnei_else.16952
	flw	%f0, 464(%zero)
	fsw	%f0, 5(%v0)
	j	bnei_cont.16953
bnei_else.16952:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 2(%v1)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.16954
	addi	%a2, %zero, 0
	j	fbgt_cont.16955
fbgt_else.16954:
	addi	%a2, %zero, 1
fbgt_cont.16955:
	beqi	%a1, 0, bnei_else.16956
	beqi	%a2, 0, bnei_else.16958
	addi	%a1, %zero, 0
	j	bnei_cont.16959
bnei_else.16958:
	addi	%a1, %zero, 1
bnei_cont.16959:
	j	bnei_cont.16957
bnei_else.16956:
	add	%a1, %zero, %a2
bnei_cont.16957:
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	beqi	%a1, 0, bnei_else.16960
	j	bnei_cont.16961
bnei_else.16960:
	fneg	%f0, %f0
bnei_cont.16961:
	fsw	%f0, 4(%v0)
	flw	%f0, 468(%zero)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
bnei_cont.16953:
	jr	%ra
setup_surface_table.2864:
	addi	%a0, %zero, 4
	flw	%f0, 464(%zero)
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
	lw	%a1, 4(%a0)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	lw	%a1, 4(%a0)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.16962
	addi	%v1, %zero, 0
	j	fbgt_cont.16963
fbgt_else.16962:
	addi	%v1, %zero, 1
fbgt_cont.16963:
	beqi	%v1, 0, bnei_else.16964
	flw	%f1, 463(%zero)
	fdiv	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 0(%v1)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 1(%v1)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	lw	%v1, 4(%a0)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f1, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.16965
bnei_else.16964:
	flw	%f0, 464(%zero)
	fsw	%f0, 0(%v0)
bnei_cont.16965:
	jr	%ra
setup_second_table.2867:
	addi	%a0, %zero, 5
	flw	%f0, 464(%zero)
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
	jal	quadratic.2798
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	lw	%a0, 4(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	fneg	%f1, %f1
	flw	%f2, 1(%v0)
	lw	%a0, 4(%v1)
	flw	%f3, 1(%a0)
	fmul	%f2, %f2, %f3
	fneg	%f2, %f2
	flw	%f3, 2(%v0)
	lw	%a0, 4(%v1)
	flw	%f4, 2(%a0)
	fmul	%f3, %f3, %f4
	fneg	%f3, %f3
	lw	%a0, 2(%sp)
	fsw	%f0, 0(%a0)
	lw	%a1, 3(%v1)
	beqi	%a1, 0, bnei_else.16966
	flw	%f4, 2(%v0)
	lw	%a1, 9(%v1)
	flw	%f5, 1(%a1)
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%v0)
	lw	%a1, 9(%v1)
	flw	%f6, 2(%a1)
	fmul	%f5, %f5, %f6
	fadd	%f4, %f4, %f5
	flw	%f5, 467(%zero)
	fmul	%f4, %f4, %f5
	fsub	%f1, %f1, %f4
	fsw	%f1, 1(%a0)
	flw	%f1, 2(%v0)
	lw	%a1, 9(%v1)
	flw	%f4, 0(%a1)
	fmul	%f1, %f1, %f4
	flw	%f4, 0(%v0)
	lw	%a1, 9(%v1)
	flw	%f5, 2(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f1, %f1, %f4
	flw	%f4, 467(%zero)
	fmul	%f1, %f1, %f4
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%a0)
	flw	%f1, 1(%v0)
	lw	%a1, 9(%v1)
	flw	%f2, 0(%a1)
	fmul	%f1, %f1, %f2
	flw	%f2, 0(%v0)
	lw	%v0, 9(%v1)
	flw	%f4, 1(%v0)
	fmul	%f2, %f2, %f4
	fadd	%f1, %f1, %f2
	flw	%f2, 467(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f3, %f1
	fsw	%f1, 3(%a0)
	j	bnei_cont.16967
bnei_else.16966:
	fsw	%f1, 1(%a0)
	fsw	%f2, 2(%a0)
	fsw	%f3, 3(%a0)
bnei_cont.16967:
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.16968
	addi	%v0, %zero, 1
	j	fbeq_cont.16969
fbeq_else.16968:
	addi	%v0, %zero, 0
fbeq_cont.16969:
	beqi	%v0, 0, bnei_else.16970
	j	bnei_cont.16971
bnei_else.16970:
	flw	%f1, 468(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%a0)
bnei_cont.16971:
	add	%v0, %zero, %a0
	jr	%ra
iter_setup_dirvec_constants.2870:
	blti	%v1, 0, bgti_else.16972
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.16973
	beqi	%a3, 2, bnei_else.16975
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2867
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.16976
bnei_else.16975:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_surface_table.2864
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.16976:
	j	bnei_cont.16974
bnei_else.16973:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_rect_table.2861
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.16974:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.16977
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.16978
	beqi	%a3, 2, bnei_else.16980
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2867
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.16981
bnei_else.16980:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2864
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.16981:
	j	bnei_cont.16979
bnei_else.16978:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2861
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.16979:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.16977:
	jr	%ra
bgti_else.16972:
	jr	%ra
setup_startp_constants.2875:
	blti	%v1, 0, bgti_else.16984
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)
	flw	%f0, 0(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 1(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v0)
	lw	%a3, 5(%a0)
	flw	%f1, 2(%a3)
	fsub	%f0, %f0, %f1
	fsw	%f0, 2(%a1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a2, 2, bnei_else.16985
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.16987
	j	bgt_cont.16988
bgt_else.16987:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	quadratic.2798
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	beqi	%v0, 3, bnei_else.16989
	j	bnei_cont.16990
bnei_else.16989:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16990:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.16988:
	j	bnei_cont.16986
bnei_else.16985:
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	flw	%f3, 0(%a0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%a0)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 3(%a1)
bnei_cont.16986:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.16984:
	jr	%ra
is_rect_outside.2880:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.16992
	addi	%v1, %zero, 0
	j	fbgt_cont.16993
fbgt_else.16992:
	addi	%v1, %zero, 1
fbgt_cont.16993:
	beqi	%v1, 0, bnei_else.16994
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.16996
	addi	%v1, %zero, 0
	j	fbgt_cont.16997
fbgt_else.16996:
	addi	%v1, %zero, 1
fbgt_cont.16997:
	beqi	%v1, 0, bnei_else.16998
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.17000
	addi	%v1, %zero, 0
	j	fbgt_cont.17001
fbgt_else.17000:
	addi	%v1, %zero, 1
fbgt_cont.17001:
	j	bnei_cont.16999
bnei_else.16998:
	addi	%v1, %zero, 0
bnei_cont.16999:
	j	bnei_cont.16995
bnei_else.16994:
	addi	%v1, %zero, 0
bnei_cont.16995:
	beqi	%v1, 0, bnei_else.17002
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.17002:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17003
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17003:
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2895:
	lw	%v1, 5(%v0)
	flw	%f3, 0(%v1)
	fsub	%f0, %f0, %f3
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 1(%v0)
	beqi	%v1, 1, bnei_else.17004
	beqi	%v1, 2, bnei_else.17005
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.17006
	j	bnei_cont.17007
bnei_else.17006:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.17007:
	lw	%v0, 6(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17008
	addi	%v1, %zero, 0
	j	fbgt_cont.17009
fbgt_else.17008:
	addi	%v1, %zero, 1
fbgt_cont.17009:
	beqi	%v0, 0, bnei_else.17010
	beqi	%v1, 0, bnei_else.17012
	addi	%v0, %zero, 0
	j	bnei_cont.17013
bnei_else.17012:
	addi	%v0, %zero, 1
bnei_cont.17013:
	j	bnei_cont.17011
bnei_else.17010:
	add	%v0, %zero, %v1
bnei_cont.17011:
	beqi	%v0, 0, bnei_else.17014
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17014:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17005:
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%v1)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lw	%v0, 6(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17015
	addi	%v1, %zero, 0
	j	fbgt_cont.17016
fbgt_else.17015:
	addi	%v1, %zero, 1
fbgt_cont.17016:
	beqi	%v0, 0, bnei_else.17017
	beqi	%v1, 0, bnei_else.17019
	addi	%v0, %zero, 0
	j	bnei_cont.17020
bnei_else.17019:
	addi	%v0, %zero, 1
bnei_cont.17020:
	j	bnei_cont.17018
bnei_else.17017:
	add	%v0, %zero, %v1
bnei_cont.17018:
	beqi	%v0, 0, bnei_else.17021
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17021:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17004:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.17022
	addi	%v1, %zero, 0
	j	fbgt_cont.17023
fbgt_else.17022:
	addi	%v1, %zero, 1
fbgt_cont.17023:
	beqi	%v1, 0, bnei_else.17024
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.17026
	addi	%v1, %zero, 0
	j	fbgt_cont.17027
fbgt_else.17026:
	addi	%v1, %zero, 1
fbgt_cont.17027:
	beqi	%v1, 0, bnei_else.17028
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.17030
	addi	%v1, %zero, 0
	j	fbgt_cont.17031
fbgt_else.17030:
	addi	%v1, %zero, 1
fbgt_cont.17031:
	j	bnei_cont.17029
bnei_else.17028:
	addi	%v1, %zero, 0
bnei_cont.17029:
	j	bnei_cont.17025
bnei_else.17024:
	addi	%v1, %zero, 0
bnei_cont.17025:
	beqi	%v1, 0, bnei_else.17032
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.17032:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17033
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17033:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17034
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f0, %f3
	lw	%a1, 5(%a0)
	flw	%f4, 1(%a1)
	fsub	%f4, %f1, %f4
	lw	%a1, 5(%a0)
	flw	%f5, 2(%a1)
	fsub	%f5, %f2, %f5
	lw	%a1, 1(%a0)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	beqi	%a1, 1, bnei_else.17035
	beqi	%a1, 2, bnei_else.17037
	sw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2798
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.17039
	j	bnei_cont.17040
bnei_else.17039:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.17040:
	lw	%v0, 6(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17041
	addi	%v1, %zero, 0
	j	fbgt_cont.17042
fbgt_else.17041:
	addi	%v1, %zero, 1
fbgt_cont.17042:
	beqi	%v0, 0, bnei_else.17043
	beqi	%v1, 0, bnei_else.17045
	addi	%v0, %zero, 0
	j	bnei_cont.17046
bnei_else.17045:
	addi	%v0, %zero, 1
bnei_cont.17046:
	j	bnei_cont.17044
bnei_else.17043:
	add	%v0, %zero, %v1
bnei_cont.17044:
	beqi	%v0, 0, bnei_else.17047
	addi	%v0, %zero, 0
	j	bnei_cont.17048
bnei_else.17047:
	addi	%v0, %zero, 1
bnei_cont.17048:
	j	bnei_cont.17038
bnei_else.17037:
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 6(%a0)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.17049
	addi	%a1, %zero, 0
	j	fbgt_cont.17050
fbgt_else.17049:
	addi	%a1, %zero, 1
fbgt_cont.17050:
	beqi	%a0, 0, bnei_else.17051
	beqi	%a1, 0, bnei_else.17053
	addi	%a0, %zero, 0
	j	bnei_cont.17054
bnei_else.17053:
	addi	%a0, %zero, 1
bnei_cont.17054:
	j	bnei_cont.17052
bnei_else.17051:
	add	%a0, %zero, %a1
bnei_cont.17052:
	beqi	%a0, 0, bnei_else.17055
	addi	%v0, %zero, 0
	j	bnei_cont.17056
bnei_else.17055:
	addi	%v0, %zero, 1
bnei_cont.17056:
bnei_cont.17038:
	j	bnei_cont.17036
bnei_else.17035:
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	is_rect_outside.2880
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.17036:
	beqi	%v0, 0, bnei_else.17057
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17057:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17058
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	is_outside.2895
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.17059
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17059:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
bnei_else.17058:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17034:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17060
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 138
	flw	%f0, 0(%a2)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f0, %f0, %f1
	addi	%a2, %zero, 138
	flw	%f1, 1(%a2)
	lw	%a2, 5(%a1)
	flw	%f2, 1(%a2)
	fsub	%f1, %f1, %f2
	addi	%a2, %zero, 138
	flw	%f2, 2(%a2)
	lw	%a2, 5(%a1)
	flw	%f3, 2(%a2)
	fsub	%f2, %f2, %f3
	addi	%a2, %zero, 187
	add	%at, %a2, %a0
	lw	%a2, 0(%at)
	lw	%a3, 1(%a1)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	beqi	%a3, 1, bnei_else.17061
	beqi	%a3, 2, bnei_else.17063
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17064
bnei_else.17063:
	flw	%f3, 0(%a2)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.17065
	addi	%a1, %zero, 0
	j	fbgt_cont.17066
fbgt_else.17065:
	addi	%a1, %zero, 1
fbgt_cont.17066:
	beqi	%a1, 0, bnei_else.17067
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 135
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.17068
bnei_else.17067:
	addi	%v0, %zero, 0
bnei_cont.17068:
bnei_cont.17064:
	j	bnei_cont.17062
bnei_else.17061:
	addi	%a3, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17062:
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	beqi	%v0, 0, bnei_else.17069
	flw	%f1, 459(%zero)
	fblt	%f0, %f1, fbgt_else.17071
	addi	%v0, %zero, 0
	j	fbgt_cont.17072
fbgt_else.17071:
	addi	%v0, %zero, 1
fbgt_cont.17072:
	j	bnei_cont.17070
bnei_else.17069:
	addi	%v0, %zero, 0
bnei_cont.17070:
	beqi	%v0, 0, bnei_else.17073
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 138
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v0, %zero, 138
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 78
	flw	%f3, 2(%v0)
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 138
	flw	%f3, 2(%v0)
	fadd	%f0, %f0, %f3
	lw	%v1, 0(%sp)
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.17074
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	fsw	%f0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	is_outside.2895
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17076
	addi	%v0, %zero, 0
	j	bnei_cont.17077
bnei_else.17076:
	addi	%v0, %zero, 1
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 3(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	check_all_inside.2900
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.17077:
	j	bnei_cont.17075
bnei_else.17074:
	addi	%v0, %zero, 1
bnei_cont.17075:
	beqi	%v0, 0, bnei_else.17078
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17078:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.17073:
	addi	%v0, %zero, 12
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17079
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.17079:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17060:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17080
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.17081
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17081:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17082
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17083
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17083:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17084
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.17085
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17085:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17086
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.17087
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17087:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.17086:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17084:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17082:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17080:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17088
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a1, 99, bnei_else.17089
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 138
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 138
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 138
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	addi	%a3, %zero, 187
	add	%at, %a3, %a1
	lw	%a1, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17091
	beqi	%a3, 2, bnei_else.17093
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17094
bnei_else.17093:
	flw	%f3, 0(%a1)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.17095
	addi	%a2, %zero, 0
	j	fbgt_cont.17096
fbgt_else.17095:
	addi	%a2, %zero, 1
fbgt_cont.17096:
	beqi	%a2, 0, bnei_else.17097
	flw	%f3, 1(%a1)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a1)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 135
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.17098
bnei_else.17097:
	addi	%v0, %zero, 0
bnei_cont.17098:
bnei_cont.17094:
	j	bnei_cont.17092
bnei_else.17091:
	addi	%a3, %zero, 184
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17092:
	beqi	%v0, 0, bnei_else.17099
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.17101
	addi	%v0, %zero, 0
	j	fbgt_cont.17102
fbgt_else.17101:
	addi	%v0, %zero, 1
fbgt_cont.17102:
	beqi	%v0, 0, bnei_else.17103
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17105
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17107
	addi	%v0, %zero, 1
	j	bnei_cont.17108
bnei_else.17107:
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17109
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17111
	addi	%v0, %zero, 1
	j	bnei_cont.17112
bnei_else.17111:
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17113
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17115
	addi	%v0, %zero, 1
	j	bnei_cont.17116
bnei_else.17115:
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17116:
	j	bnei_cont.17114
bnei_else.17113:
	addi	%v0, %zero, 0
bnei_cont.17114:
bnei_cont.17112:
	j	bnei_cont.17110
bnei_else.17109:
	addi	%v0, %zero, 0
bnei_cont.17110:
bnei_cont.17108:
	j	bnei_cont.17106
bnei_else.17105:
	addi	%v0, %zero, 0
bnei_cont.17106:
	beqi	%v0, 0, bnei_else.17117
	addi	%v0, %zero, 1
	j	bnei_cont.17118
bnei_else.17117:
	addi	%v0, %zero, 0
bnei_cont.17118:
	j	bnei_cont.17104
bnei_else.17103:
	addi	%v0, %zero, 0
bnei_cont.17104:
	j	bnei_cont.17100
bnei_else.17099:
	addi	%v0, %zero, 0
bnei_cont.17100:
	j	bnei_cont.17090
bnei_else.17089:
	addi	%v0, %zero, 1
bnei_cont.17090:
	beqi	%v0, 0, bnei_else.17119
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17120
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17122
	addi	%v0, %zero, 1
	j	bnei_cont.17123
bnei_else.17122:
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17124
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17126
	addi	%v0, %zero, 1
	j	bnei_cont.17127
bnei_else.17126:
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17128
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17130
	addi	%v0, %zero, 1
	j	bnei_cont.17131
bnei_else.17130:
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17131:
	j	bnei_cont.17129
bnei_else.17128:
	addi	%v0, %zero, 0
bnei_cont.17129:
bnei_cont.17127:
	j	bnei_cont.17125
bnei_else.17124:
	addi	%v0, %zero, 0
bnei_cont.17125:
bnei_cont.17123:
	j	bnei_cont.17121
bnei_else.17120:
	addi	%v0, %zero, 0
bnei_cont.17121:
	beqi	%v0, 0, bnei_else.17132
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17132:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.17119:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.17088:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17133
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 159
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 159
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 159
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	lw	%a3, 1(%a2)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	beqi	%a3, 1, bnei_else.17134
	beqi	%a3, 2, bnei_else.17136
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second.2811
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17137
bnei_else.17136:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_surface.2792
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17137:
	j	bnei_cont.17135
bnei_else.17134:
	addi	%a3, %zero, 0
	addi	%t0, %zero, 1
	addi	%t1, %zero, 2
	fsw	%f0, 4(%sp)
	fsw	%f2, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%a2, 7(%sp)
	addi	%a1, %t0, 0
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a2, %t1, 0
	addi	%a0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17138
	addi	%v0, %zero, 1
	j	bnei_cont.17139
bnei_else.17138:
	addi	%a0, %zero, 1
	addi	%a1, %zero, 2
	addi	%a2, %zero, 0
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17140
	addi	%v0, %zero, 2
	j	bnei_cont.17141
bnei_else.17140:
	addi	%a0, %zero, 2
	addi	%a1, %zero, 0
	addi	%a2, %zero, 1
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17142
	addi	%v0, %zero, 3
	j	bnei_cont.17143
bnei_else.17142:
	addi	%v0, %zero, 0
bnei_cont.17143:
bnei_cont.17141:
bnei_cont.17139:
bnei_cont.17135:
	beqi	%v0, 0, bnei_else.17144
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17145
	addi	%v1, %zero, 0
	j	fbgt_cont.17146
fbgt_else.17145:
	addi	%v1, %zero, 1
fbgt_cont.17146:
	beqi	%v1, 0, bnei_else.17147
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.17149
	addi	%v1, %zero, 0
	j	fbgt_cont.17150
fbgt_else.17149:
	addi	%v1, %zero, 1
fbgt_cont.17150:
	beqi	%v1, 0, bnei_else.17151
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	flw	%f1, 0(%a0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 159
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%a0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 159
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%a0)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 159
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	lw	%v1, 1(%sp)
	lw	%a1, 0(%v1)
	sw	%v0, 8(%sp)
	fsw	%f3, 9(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f1, 11(%sp)
	fsw	%f0, 12(%sp)
	beqi	%a1, -1, bnei_else.17153
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	is_outside.2895
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.17155
	addi	%v0, %zero, 0
	j	bnei_cont.17156
bnei_else.17155:
	addi	%v0, %zero, 1
	flw	%f0, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f2, 9(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	check_all_inside.2900
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.17156:
	j	bnei_cont.17154
bnei_else.17153:
	addi	%v0, %zero, 1
bnei_cont.17154:
	beqi	%v0, 0, bnei_else.17157
	addi	%v0, %zero, 137
	flw	%f0, 12(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 10(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 9(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.17158
bnei_else.17157:
bnei_cont.17158:
	j	bnei_cont.17152
bnei_else.17151:
bnei_cont.17152:
	j	bnei_cont.17148
bnei_else.17147:
bnei_cont.17148:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.17144:
	addi	%v0, %zero, 12
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17159
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.17159:
	jr	%ra
bnei_else.17133:
	jr	%ra
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17162
	addi	%a2, %zero, 83
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17163
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2915
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17164
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2915
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17165
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2915
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2919
bnei_else.17165:
	jr	%ra
bnei_else.17164:
	jr	%ra
bnei_else.17163:
	jr	%ra
bnei_else.17162:
	jr	%ra
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.17170
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.17171
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	addi	%a3, %zero, 159
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 159
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 159
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	lw	%a3, 1(%a2)
	sw	%a1, 3(%sp)
	beqi	%a3, 1, bnei_else.17173
	beqi	%a3, 2, bnei_else.17175
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second.2811
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17176
bnei_else.17175:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_surface.2792
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17176:
	j	bnei_cont.17174
bnei_else.17173:
	addi	%a3, %zero, 0
	addi	%t0, %zero, 1
	addi	%t1, %zero, 2
	fsw	%f0, 4(%sp)
	fsw	%f2, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%a2, 7(%sp)
	addi	%a1, %t0, 0
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a2, %t1, 0
	addi	%a0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17177
	addi	%v0, %zero, 1
	j	bnei_cont.17178
bnei_else.17177:
	addi	%a0, %zero, 1
	addi	%a1, %zero, 2
	addi	%a2, %zero, 0
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17179
	addi	%v0, %zero, 2
	j	bnei_cont.17180
bnei_else.17179:
	addi	%a0, %zero, 2
	addi	%a1, %zero, 0
	addi	%a2, %zero, 1
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.17181
	addi	%v0, %zero, 3
	j	bnei_cont.17182
bnei_else.17181:
	addi	%v0, %zero, 0
bnei_cont.17182:
bnei_cont.17180:
bnei_cont.17178:
bnei_cont.17174:
	beqi	%v0, 0, bnei_else.17183
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17185
	addi	%v0, %zero, 0
	j	fbgt_cont.17186
fbgt_else.17185:
	addi	%v0, %zero, 1
fbgt_cont.17186:
	beqi	%v0, 0, bnei_else.17187
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17189
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17191
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17193
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 4
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17194
bnei_else.17193:
bnei_cont.17194:
	j	bnei_cont.17192
bnei_else.17191:
bnei_cont.17192:
	j	bnei_cont.17190
bnei_else.17189:
bnei_cont.17190:
	j	bnei_cont.17188
bnei_else.17187:
bnei_cont.17188:
	j	bnei_cont.17184
bnei_else.17183:
bnei_cont.17184:
	j	bnei_cont.17172
bnei_else.17171:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.17195
	addi	%a3, %zero, 83
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	sw	%a1, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17197
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17199
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 4
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17200
bnei_else.17199:
bnei_cont.17200:
	j	bnei_cont.17198
bnei_else.17197:
bnei_cont.17198:
	j	bnei_cont.17196
bnei_else.17195:
bnei_cont.17196:
bnei_cont.17172:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17201
	sw	%v0, 8(%sp)
	beqi	%a1, 99, bnei_else.17202
	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 9(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solver.2817
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.17204
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17206
	addi	%v0, %zero, 0
	j	fbgt_cont.17207
fbgt_else.17206:
	addi	%v0, %zero, 1
fbgt_cont.17207:
	beqi	%v0, 0, bnei_else.17208
	lw	%v0, 9(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17210
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2915
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17212
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2915
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 9(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17213
bnei_else.17212:
bnei_cont.17213:
	j	bnei_cont.17211
bnei_else.17210:
bnei_cont.17211:
	j	bnei_cont.17209
bnei_else.17208:
bnei_cont.17209:
	j	bnei_cont.17205
bnei_else.17204:
bnei_cont.17205:
	j	bnei_cont.17203
bnei_else.17202:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17214
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%sp)
	sw	%a0, 9(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2915
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17216
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2915
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 9(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17217
bnei_else.17216:
bnei_cont.17217:
	j	bnei_cont.17215
bnei_else.17214:
bnei_cont.17215:
bnei_cont.17203:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
bnei_else.17201:
	jr	%ra
bnei_else.17170:
	jr	%ra
solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.17220
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t1, 1(%a0)
	add	%at, %t1, %a2
	lw	%t1, 0(%at)
	lw	%t2, 1(%a3)
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a2, 4(%sp)
	beqi	%t2, 1, bnei_else.17221
	beqi	%t2, 2, bnei_else.17223
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17224
bnei_else.17223:
	flw	%f0, 0(%t1)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17225
	addi	%a3, %zero, 0
	j	fbgt_cont.17226
fbgt_else.17225:
	addi	%a3, %zero, 1
fbgt_cont.17226:
	beqi	%a3, 0, bnei_else.17227
	flw	%f0, 0(%t1)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 135
	fsw	%f0, 0(%a3)
	addi	%v0, %zero, 1
	j	bnei_cont.17228
bnei_else.17227:
	addi	%v0, %zero, 0
bnei_cont.17228:
bnei_cont.17224:
	j	bnei_cont.17222
bnei_else.17221:
	lw	%t0, 0(%a0)
	addi	%a0, %t1, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17222:
	beqi	%v0, 0, bnei_else.17229
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17230
	addi	%v1, %zero, 0
	j	fbgt_cont.17231
fbgt_else.17230:
	addi	%v1, %zero, 1
fbgt_cont.17231:
	beqi	%v1, 0, bnei_else.17232
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.17234
	addi	%v1, %zero, 0
	j	fbgt_cont.17235
fbgt_else.17234:
	addi	%v1, %zero, 1
fbgt_cont.17235:
	beqi	%v1, 0, bnei_else.17236
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	lw	%v1, 0(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 162
	flw	%f2, 0(%a0)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v1)
	fmul	%f2, %f2, %f0
	addi	%a0, %zero, 162
	flw	%f3, 1(%a0)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v1)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 162
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	lw	%v1, 2(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 5(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	beqi	%a0, -1, bnei_else.17238
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	is_outside.2895
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.17240
	addi	%v0, %zero, 0
	j	bnei_cont.17241
bnei_else.17240:
	addi	%v0, %zero, 1
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2900
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.17241:
	j	bnei_cont.17239
bnei_else.17238:
	addi	%v0, %zero, 1
bnei_cont.17239:
	beqi	%v0, 0, bnei_else.17242
	addi	%v0, %zero, 137
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 7(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 6(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.17243
bnei_else.17242:
bnei_cont.17243:
	j	bnei_cont.17237
bnei_else.17236:
bnei_cont.17237:
	j	bnei_cont.17233
bnei_else.17232:
bnei_cont.17233:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.17229:
	addi	%v0, %zero, 12
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17244
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.17244:
	jr	%ra
bnei_else.17220:
	jr	%ra
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17247
	addi	%a2, %zero, 83
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17248
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17249
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17250
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2933
bnei_else.17250:
	jr	%ra
bnei_else.17249:
	jr	%ra
bnei_else.17248:
	jr	%ra
bnei_else.17247:
	jr	%ra
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.17255
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.17256
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t1, 1(%a0)
	add	%at, %t1, %a2
	lw	%a2, 0(%at)
	lw	%t1, 1(%a3)
	sw	%a1, 3(%sp)
	beqi	%t1, 1, bnei_else.17258
	beqi	%t1, 2, bnei_else.17260
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17261
bnei_else.17260:
	flw	%f0, 0(%a2)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17262
	addi	%a3, %zero, 0
	j	fbgt_cont.17263
fbgt_else.17262:
	addi	%a3, %zero, 1
fbgt_cont.17263:
	beqi	%a3, 0, bnei_else.17264
	flw	%f0, 0(%a2)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 135
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.17265
bnei_else.17264:
	addi	%v0, %zero, 0
bnei_cont.17265:
bnei_cont.17261:
	j	bnei_cont.17259
bnei_else.17258:
	lw	%t0, 0(%a0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17259:
	beqi	%v0, 0, bnei_else.17266
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17268
	addi	%v0, %zero, 0
	j	fbgt_cont.17269
fbgt_else.17268:
	addi	%v0, %zero, 1
fbgt_cont.17269:
	beqi	%v0, 0, bnei_else.17270
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17272
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17274
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17276
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 4
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17277
bnei_else.17276:
bnei_cont.17277:
	j	bnei_cont.17275
bnei_else.17274:
bnei_cont.17275:
	j	bnei_cont.17273
bnei_else.17272:
bnei_cont.17273:
	j	bnei_cont.17271
bnei_else.17270:
bnei_cont.17271:
	j	bnei_cont.17267
bnei_else.17266:
bnei_cont.17267:
	j	bnei_cont.17257
bnei_else.17256:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.17278
	addi	%a3, %zero, 83
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	sw	%a1, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17280
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17282
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 4
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17283
bnei_else.17282:
bnei_cont.17283:
	j	bnei_cont.17281
bnei_else.17280:
bnei_cont.17281:
	j	bnei_cont.17279
bnei_else.17278:
bnei_cont.17279:
bnei_cont.17257:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17284
	sw	%v0, 4(%sp)
	beqi	%a1, 99, bnei_else.17285
	lw	%a2, 0(%sp)
	sw	%a0, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solver_fast2.2858
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17287
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17289
	addi	%v0, %zero, 0
	j	fbgt_cont.17290
fbgt_else.17289:
	addi	%v0, %zero, 1
fbgt_cont.17290:
	beqi	%v0, 0, bnei_else.17291
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17293
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17295
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 5(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17296
bnei_else.17295:
bnei_cont.17296:
	j	bnei_cont.17294
bnei_else.17293:
bnei_cont.17294:
	j	bnei_cont.17292
bnei_else.17291:
bnei_cont.17292:
	j	bnei_cont.17288
bnei_else.17287:
bnei_cont.17288:
	j	bnei_cont.17286
bnei_else.17285:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17297
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%sp)
	sw	%a0, 5(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17299
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 5(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17300
bnei_else.17299:
bnei_cont.17300:
	j	bnei_cont.17298
bnei_else.17297:
bnei_cont.17298:
bnei_cont.17286:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.17284:
	jr	%ra
bnei_else.17255:
	jr	%ra
judge_intersection_fast.2941:
	flw	%f0, 456(%zero)
	addi	%v1, %zero, 137
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 134
	lw	%v1, 0(%v1)
	lw	%a0, 0(%v1)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17303
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a1, 99, bnei_else.17305
	sw	%a0, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast2.2858
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17307
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17309
	addi	%v0, %zero, 0
	j	fbgt_cont.17310
fbgt_else.17309:
	addi	%v0, %zero, 1
fbgt_cont.17310:
	beqi	%v0, 0, bnei_else.17311
	lw	%v0, 2(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17313
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17315
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17316
bnei_else.17315:
bnei_cont.17316:
	j	bnei_cont.17314
bnei_else.17313:
bnei_cont.17314:
	j	bnei_cont.17312
bnei_else.17311:
bnei_cont.17312:
	j	bnei_cont.17308
bnei_else.17307:
bnei_cont.17308:
	j	bnei_cont.17306
bnei_else.17305:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17317
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 2(%sp)
	addi	%a0, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17319
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17320
bnei_else.17319:
bnei_cont.17320:
	j	bnei_cont.17318
bnei_else.17317:
bnei_cont.17318:
bnei_cont.17306:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17304
bnei_else.17303:
bnei_cont.17304:
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.17321
	addi	%v0, %zero, 0
	j	fbgt_cont.17322
fbgt_else.17321:
	addi	%v0, %zero, 1
fbgt_cont.17322:
	beqi	%v0, 0, bnei_else.17323
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.17324
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.17324:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17323:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2947:
	addi	%v1, %zero, 138
	flw	%f0, 0(%v1)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 138
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	addi	%v1, %zero, 138
	flw	%f2, 2(%v1)
	lw	%v1, 5(%v0)
	flw	%f3, 2(%v1)
	fsub	%f2, %f2, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 4(%v0)
	flw	%f4, 1(%v1)
	fmul	%f4, %f1, %f4
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	fmul	%f5, %f2, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.17325
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 467(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	addi	%v1, %zero, 142
	fsw	%f3, 0(%v1)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	flw	%f3, 467(%zero)
	fmul	%f2, %f2, %f3
	fadd	%f2, %f4, %f2
	addi	%v1, %zero, 142
	fsw	%f2, 1(%v1)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f5, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
	j	bnei_cont.17326
bnei_else.17325:
	addi	%v1, %zero, 142
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 142
	fsw	%f4, 1(%v1)
	addi	%v1, %zero, 142
	fsw	%f5, 2(%v1)
bnei_cont.17326:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 142
	j	vecunit_sgn.2655
get_nvector.2949:
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.17327
	beqi	%a0, 2, bnei_else.17328
	j	get_nvector_second.2947
bnei_else.17328:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 1(%v1)
	lw	%v0, 4(%v0)
	flw	%f0, 2(%v0)
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17327:
	addi	%v0, %zero, 136
	lw	%v0, 0(%v0)
	flw	%f0, 464(%zero)
	addi	%a0, %zero, 142
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 142
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 142
	fsw	%f0, 2(%a0)
	addi	%a0, %v0, -1
	addi	%v0, %v0, -1
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.17330
	addi	%v0, %zero, 1
	j	fbeq_cont.17331
fbeq_else.17330:
	addi	%v0, %zero, 0
fbeq_cont.17331:
	beqi	%v0, 0, bnei_else.17332
	flw	%f0, 464(%zero)
	j	bnei_cont.17333
bnei_else.17332:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17334
	addi	%v0, %zero, 0
	j	fbgt_cont.17335
fbgt_else.17334:
	addi	%v0, %zero, 1
fbgt_cont.17335:
	beqi	%v0, 0, bnei_else.17336
	flw	%f0, 468(%zero)
	j	bnei_cont.17337
bnei_else.17336:
	flw	%f0, 463(%zero)
bnei_cont.17337:
bnei_cont.17333:
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	add	%at, %v0, %a0
	fsw	%f0, 0(%at)
	jr	%ra
utexture.2952:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 0(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 1(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 2(%a1)
	beqi	%a0, 1, bnei_else.17339
	beqi	%a0, 2, bnei_else.17340
	beqi	%a0, 3, bnei_else.17341
	beqi	%a0, 4, bnei_else.17342
	jr	%ra
bnei_else.17342:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	lw	%a0, 4(%v0)
	flw	%f1, 0(%a0)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%a0, 5(%v0)
	flw	%f2, 2(%a0)
	fsub	%f1, %f1, %f2
	lw	%a0, 4(%v0)
	flw	%f2, 2(%a0)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 454(%zero)
	fblt	%f3, %f4, fbgt_else.17344
	addi	%a0, %zero, 0
	j	fbgt_cont.17345
fbgt_else.17344:
	addi	%a0, %zero, 1
fbgt_cont.17345:
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	beqi	%a0, 0, bnei_else.17346
	flw	%f0, 453(%zero)
	j	bnei_cont.17347
bnei_else.17346:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17348
	addi	%a0, %zero, 1
	j	fbgt_cont.17349
fbgt_else.17348:
	addi	%a0, %zero, 0
fbgt_cont.17349:
	fabs	%f1, %f0
	flw	%f3, 452(%zero)
	fblt	%f1, %f3, fbgt_else.17350
	flw	%f0, 451(%zero)
	sw	%a0, 3(%sp)
	fblt	%f1, %f0, fbgt_else.17352
	flw	%f0, 473(%zero)
	flw	%f3, 468(%zero)
	fdiv	%f1, %f3, %f1
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	kernel_atan.2612
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.17353
fbgt_else.17352:
	flw	%f0, 472(%zero)
	flw	%f3, 468(%zero)
	fsub	%f3, %f1, %f3
	flw	%f4, 468(%zero)
	fadd	%f1, %f1, %f4
	fdiv	%f1, %f3, %f1
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.17353:
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.17354
	j	bnei_cont.17355
bnei_else.17354:
	fneg	%f0, %f0
bnei_cont.17355:
	j	fbgt_cont.17351
fbgt_else.17350:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
fbgt_cont.17351:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.17347:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	flw	%f1, 1(%v0)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	lw	%v0, 4(%v0)
	flw	%f2, 1(%v0)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	flw	%f2, 0(%sp)
	fabs	%f3, %f2
	flw	%f4, 454(%zero)
	fblt	%f3, %f4, fbgt_else.17356
	addi	%v0, %zero, 0
	j	fbgt_cont.17357
fbgt_else.17356:
	addi	%v0, %zero, 1
fbgt_cont.17357:
	fsw	%f0, 6(%sp)
	beqi	%v0, 0, bnei_else.17358
	flw	%f0, 453(%zero)
	j	bnei_cont.17359
bnei_else.17358:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 464(%zero)
	fblt	%f1, %f2, fbgt_else.17360
	addi	%v0, %zero, 1
	j	fbgt_cont.17361
fbgt_else.17360:
	addi	%v0, %zero, 0
fbgt_cont.17361:
	fabs	%f2, %f1
	flw	%f3, 452(%zero)
	fblt	%f2, %f3, fbgt_else.17362
	flw	%f1, 451(%zero)
	sw	%v0, 7(%sp)
	fblt	%f2, %f1, fbgt_else.17364
	flw	%f1, 473(%zero)
	flw	%f3, 468(%zero)
	fdiv	%f2, %f3, %f2
	fsw	%f1, 8(%sp)
	fmov	%f0, %f2
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.17365
fbgt_else.17364:
	flw	%f1, 472(%zero)
	flw	%f3, 468(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 468(%zero)
	fadd	%f2, %f2, %f4
	fdiv	%f2, %f3, %f2
	fsw	%f1, 9(%sp)
	fmov	%f0, %f2
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.17365:
	lw	%v0, 7(%sp)
	beqi	%v0, 0, bnei_else.17366
	j	bnei_cont.17367
bnei_else.17366:
	fneg	%f0, %f0
bnei_cont.17367:
	j	fbgt_cont.17363
fbgt_else.17362:
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
fbgt_cont.17363:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.17359:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 448(%zero)
	flw	%f2, 467(%zero)
	flw	%f3, 6(%sp)
	fsub	%f2, %f2, %f3
	fmul	%f2, %f2, %f2
	fsub	%f1, %f1, %f2
	flw	%f2, 467(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17368
	addi	%v0, %zero, 0
	j	fbgt_cont.17369
fbgt_else.17368:
	addi	%v0, %zero, 1
fbgt_cont.17369:
	beqi	%v0, 0, bnei_else.17370
	flw	%f0, 464(%zero)
	j	bnei_cont.17371
bnei_else.17370:
bnei_cont.17371:
	flw	%f1, 447(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 446(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17341:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f2, 2(%v0)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 445(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	cos.2616
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f1, 1(%v0)
	flw	%f1, 468(%zero)
	fsub	%f0, %f1, %f0
	flw	%f1, 447(%zero)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17340:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2618
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f1, 0(%v0)
	flw	%f1, 447(%zero)
	flw	%f2, 468(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
bnei_else.17339:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 443(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 442(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fblt	%f0, %f1, fbgt_else.17375
	addi	%a0, %zero, 0
	j	fbgt_cont.17376
fbgt_else.17375:
	addi	%a0, %zero, 1
fbgt_cont.17376:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	flw	%f1, 443(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 442(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fblt	%f0, %f1, fbgt_else.17377
	addi	%v0, %zero, 0
	j	fbgt_cont.17378
fbgt_else.17377:
	addi	%v0, %zero, 1
fbgt_cont.17378:
	beqi	%a0, 0, bnei_else.17379
	beqi	%v0, 0, bnei_else.17381
	flw	%f0, 447(%zero)
	j	bnei_cont.17382
bnei_else.17381:
	flw	%f0, 464(%zero)
bnei_cont.17382:
	j	bnei_cont.17380
bnei_else.17379:
	beqi	%v0, 0, bnei_else.17383
	flw	%f0, 464(%zero)
	j	bnei_cont.17384
bnei_else.17383:
	flw	%f0, 447(%zero)
bnei_cont.17384:
bnei_cont.17380:
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
trace_reflections.2959:
	blti	%v0, 0, bgti_else.17386
	addi	%a0, %zero, 254
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	lw	%a1, 1(%a0)
	flw	%f2, 456(%zero)
	addi	%a2, %zero, 137
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 0
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a0, 5(%sp)
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.17387
	addi	%v0, %zero, 0
	j	fbgt_cont.17388
fbgt_else.17387:
	addi	%v0, %zero, 1
fbgt_cont.17388:
	beqi	%v0, 0, bnei_else.17389
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.17391
	addi	%v0, %zero, 0
	j	fbgt_cont.17392
fbgt_else.17391:
	addi	%v0, %zero, 1
fbgt_cont.17392:
	j	bnei_cont.17390
bnei_else.17389:
	addi	%v0, %zero, 0
bnei_cont.17390:
	beqi	%v0, 0, bnei_else.17393
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 5(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.17395
	addi	%v0, %zero, 0
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17397
	j	bnei_cont.17398
bnei_else.17397:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	addi	%a0, %zero, 142
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%a0, %zero, 142
	flw	%f1, 1(%a0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 142
	flw	%f1, 2(%a0)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lw	%v1, 5(%sp)
	flw	%f1, 2(%v1)
	flw	%f2, 3(%sp)
	fmul	%f3, %f1, %f2
	fmul	%f0, %f3, %f0
	lw	%v0, 0(%v0)
	lw	%v1, 2(%sp)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	flw	%f5, 1(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	flw	%f5, 2(%v0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f1, %f1, %f3
	flw	%f3, 464(%zero)
	fblt	%f3, %f0, fbgt_else.17399
	addi	%v0, %zero, 0
	j	fbgt_cont.17400
fbgt_else.17399:
	addi	%v0, %zero, 1
fbgt_cont.17400:
	beqi	%v0, 0, bnei_else.17401
	addi	%v0, %zero, 151
	flw	%f3, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f4, 0(%v0)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 151
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f4, 1(%v0)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 151
	fsw	%f3, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f4, 2(%v0)
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	j	bnei_cont.17402
bnei_else.17401:
bnei_cont.17402:
	flw	%f0, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17403
	addi	%v0, %zero, 0
	j	fbgt_cont.17404
fbgt_else.17403:
	addi	%v0, %zero, 1
fbgt_cont.17404:
	beqi	%v0, 0, bnei_else.17405
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f3, 0(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 1(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f3, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 2(%v0)
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	j	bnei_cont.17406
bnei_else.17405:
bnei_cont.17406:
bnei_cont.17398:
	j	beq_cont.17396
beq_else.17395:
beq_cont.17396:
	j	bnei_cont.17394
bnei_else.17393:
bnei_cont.17394:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
bgti_else.17386:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.17408
	lw	%a1, 2(%a0)
	flw	%f2, 456(%zero)
	addi	%a2, %zero, 137
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 0
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
	fsw	%f1, 0(%sp)
	sw	%a0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%a1, 5(%sp)
	addi	%a0, %v1, 0
	addi	%v0, %a2, 0
	addi	%v1, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.17409
	addi	%v0, %zero, 0
	j	fbgt_cont.17410
fbgt_else.17409:
	addi	%v0, %zero, 1
fbgt_cont.17410:
	beqi	%v0, 0, bnei_else.17411
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.17413
	addi	%v0, %zero, 0
	j	fbgt_cont.17414
fbgt_else.17413:
	addi	%v0, %zero, 1
fbgt_cont.17414:
	j	bnei_cont.17412
bnei_else.17411:
	addi	%v0, %zero, 0
bnei_cont.17412:
	beqi	%v0, 0, bnei_else.17415
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f0, 0(%a1)
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	lw	%a1, 1(%v1)
	sw	%a0, 6(%sp)
	fsw	%f0, 7(%sp)
	sw	%v0, 8(%sp)
	sw	%v1, 9(%sp)
	beqi	%a1, 1, bnei_else.17416
	beqi	%a1, 2, bnei_else.17418
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	get_nvector_second.2947
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17419
bnei_else.17418:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 142
	fsw	%f2, 0(%a1)
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 142
	fsw	%f2, 1(%a1)
	lw	%a1, 4(%v1)
	flw	%f2, 2(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 142
	fsw	%f2, 2(%a1)
bnei_cont.17419:
	j	bnei_cont.17417
bnei_else.17416:
	addi	%a1, %zero, 136
	lw	%a1, 0(%a1)
	flw	%f2, 464(%zero)
	addi	%a2, %zero, 142
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 142
	fsw	%f2, 1(%a2)
	addi	%a2, %zero, 142
	fsw	%f2, 2(%a2)
	addi	%a2, %a1, -1
	addi	%a1, %a1, -1
	lw	%a3, 3(%sp)
	add	%at, %a3, %a1
	flw	%f2, 0(%at)
	flw	%f3, 464(%zero)
	fbne	%f2, %f3, fbeq_else.17420
	addi	%a1, %zero, 1
	j	fbeq_cont.17421
fbeq_else.17420:
	addi	%a1, %zero, 0
fbeq_cont.17421:
	beqi	%a1, 0, bnei_else.17422
	flw	%f2, 464(%zero)
	j	bnei_cont.17423
bnei_else.17422:
	flw	%f3, 464(%zero)
	fblt	%f3, %f2, fbgt_else.17424
	addi	%a1, %zero, 0
	j	fbgt_cont.17425
fbgt_else.17424:
	addi	%a1, %zero, 1
fbgt_cont.17425:
	beqi	%a1, 0, bnei_else.17426
	flw	%f2, 468(%zero)
	j	bnei_cont.17427
bnei_else.17426:
	flw	%f2, 463(%zero)
bnei_cont.17427:
bnei_cont.17423:
	fneg	%f2, %f2
	addi	%a1, %zero, 142
	add	%at, %a1, %a2
	fsw	%f2, 0(%at)
bnei_cont.17417:
	addi	%v0, %zero, 138
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 138
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	utexture.2952
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 8(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 1(%sp)
	lw	%a1, 1(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 138
	flw	%f0, 0(%a2)
	fsw	%f0, 0(%a1)
	addi	%a2, %zero, 138
	flw	%f0, 1(%a2)
	fsw	%f0, 1(%a1)
	addi	%a2, %zero, 138
	flw	%f0, 2(%a2)
	fsw	%f0, 2(%a1)
	lw	%a1, 3(%v0)
	lw	%a2, 9(%sp)
	lw	%a3, 7(%a2)
	flw	%f0, 0(%a3)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.17428
	addi	%a3, %zero, 0
	j	fbgt_cont.17429
fbgt_else.17428:
	addi	%a3, %zero, 1
fbgt_cont.17429:
	beqi	%a3, 0, bnei_else.17430
	addi	%a3, %zero, 0
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.17431
bnei_else.17430:
	addi	%a3, %zero, 1
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a3, 0(%at)
	addi	%t0, %zero, 145
	flw	%f0, 0(%t0)
	fsw	%f0, 0(%a3)
	addi	%t0, %zero, 145
	flw	%f0, 1(%t0)
	fsw	%f0, 1(%a3)
	addi	%t0, %zero, 145
	flw	%f0, 2(%t0)
	fsw	%f0, 2(%a3)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f0, 441(%zero)
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 0(%a1)
	fmul	%f2, %f2, %f0
	fsw	%f2, 0(%a1)
	flw	%f2, 1(%a1)
	fmul	%f2, %f2, %f0
	fsw	%f2, 1(%a1)
	flw	%f2, 2(%a1)
	fmul	%f0, %f2, %f0
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%a3, %zero, 142
	flw	%f0, 0(%a3)
	fsw	%f0, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f0, 1(%a3)
	fsw	%f0, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f0, 2(%a3)
	fsw	%f0, 2(%a1)
bnei_cont.17431:
	flw	%f0, 440(%zero)
	lw	%a1, 3(%sp)
	flw	%f1, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f2, 0(%a3)
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 1(%a3)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	flw	%f2, 2(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 2(%a3)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f2, 0(%a3)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 0(%a1)
	flw	%f1, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f2, 1(%a3)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 1(%a1)
	flw	%f1, 2(%a1)
	addi	%a3, %zero, 142
	flw	%f2, 2(%a3)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%a1)
	lw	%a3, 7(%a2)
	flw	%f0, 1(%a3)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 134
	lw	%t0, 0(%t0)
	fsw	%f0, 10(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.17432
	j	bnei_cont.17433
bnei_else.17432:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	flw	%f2, 0(%v0)
	addi	%v1, %zero, 78
	flw	%f3, 0(%v1)
	fmul	%f2, %f2, %f3
	flw	%f3, 1(%v0)
	addi	%v1, %zero, 78
	flw	%f4, 1(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	addi	%v1, %zero, 78
	flw	%f4, 2(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	fneg	%f2, %f2
	flw	%f3, 464(%zero)
	fblt	%f3, %f0, fbgt_else.17434
	addi	%v1, %zero, 0
	j	fbgt_cont.17435
fbgt_else.17434:
	addi	%v1, %zero, 1
fbgt_cont.17435:
	beqi	%v1, 0, bnei_else.17436
	addi	%v1, %zero, 151
	flw	%f3, 0(%v1)
	addi	%v1, %zero, 145
	flw	%f4, 0(%v1)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 151
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	addi	%v1, %zero, 145
	flw	%f4, 1(%v1)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 151
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 2(%v1)
	addi	%v1, %zero, 145
	flw	%f4, 2(%v1)
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.17437
bnei_else.17436:
bnei_cont.17437:
	flw	%f0, 464(%zero)
	fblt	%f0, %f2, fbgt_else.17438
	addi	%v1, %zero, 0
	j	fbgt_cont.17439
fbgt_else.17438:
	addi	%v1, %zero, 1
fbgt_cont.17439:
	beqi	%v1, 0, bnei_else.17440
	fmul	%f0, %f2, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 10(%sp)
	fmul	%f0, %f0, %f2
	addi	%v1, %zero, 151
	flw	%f3, 0(%v1)
	fadd	%f3, %f3, %f0
	addi	%v1, %zero, 151
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	fadd	%f3, %f3, %f0
	addi	%v1, %zero, 151
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 2(%v1)
	fadd	%f0, %f3, %f0
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.17441
bnei_else.17440:
bnei_cont.17441:
bnei_cont.17433:
	addi	%v0, %zero, 138
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 162
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 162
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 162
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 434
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	flw	%f0, 7(%sp)
	flw	%f1, 10(%sp)
	lw	%v1, 3(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	trace_reflections.2959
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 439(%zero)
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.17442
	addi	%v0, %zero, 0
	j	fbgt_cont.17443
fbgt_else.17442:
	addi	%v0, %zero, 1
fbgt_cont.17443:
	beqi	%v0, 0, bnei_else.17444
	lw	%v0, 4(%sp)
	blti	%v0, 4, bgti_else.17445
	j	bgti_cont.17446
bgti_else.17445:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.17446:
	lw	%v1, 6(%sp)
	beqi	%v1, 2, bnei_else.17447
	jr	%ra
bnei_else.17447:
	flw	%f0, 468(%zero)
	lw	%v1, 9(%sp)
	lw	%v1, 7(%v1)
	flw	%f2, 0(%v1)
	fsub	%f0, %f0, %f2
	fmul	%f0, %f1, %f0
	addi	%v0, %v0, 1
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	flw	%f2, 0(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	j	trace_ray.2964
bnei_else.17444:
	jr	%ra
bnei_else.17415:
	addi	%v0, %zero, -1
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.17450
	lw	%v0, 3(%sp)
	flw	%f0, 0(%v0)
	addi	%v1, %zero, 78
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 78
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17451
	addi	%v0, %zero, 0
	j	fbgt_cont.17452
fbgt_else.17451:
	addi	%v0, %zero, 1
fbgt_cont.17452:
	beqi	%v0, 0, bnei_else.17453
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 81
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17453:
	jr	%ra
bnei_else.17450:
	jr	%ra
bgt_else.17408:
	jr	%ra
trace_diffuse_ray.2970:
	flw	%f1, 456(%zero)
	addi	%v1, %zero, 137
	fsw	%f1, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.17458
	addi	%v0, %zero, 0
	j	fbgt_cont.17459
fbgt_else.17458:
	addi	%v0, %zero, 1
fbgt_cont.17459:
	beqi	%v0, 0, bnei_else.17460
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.17462
	addi	%v0, %zero, 0
	j	fbgt_cont.17463
fbgt_else.17462:
	addi	%v0, %zero, 1
fbgt_cont.17463:
	j	bnei_cont.17461
bnei_else.17460:
	addi	%v0, %zero, 0
bnei_cont.17461:
	beqi	%v0, 0, bnei_else.17464
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 1(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 2(%sp)
	beqi	%a0, 1, bnei_else.17465
	beqi	%a0, 2, bnei_else.17467
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	get_nvector_second.2947
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17468
bnei_else.17467:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 1(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
bnei_cont.17468:
	j	bnei_cont.17466
bnei_else.17465:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 142
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, -1
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.17469
	addi	%v1, %zero, 1
	j	fbeq_cont.17470
fbeq_else.17469:
	addi	%v1, %zero, 0
fbeq_cont.17470:
	beqi	%v1, 0, bnei_else.17471
	flw	%f0, 464(%zero)
	j	bnei_cont.17472
bnei_else.17471:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17473
	addi	%v1, %zero, 0
	j	fbgt_cont.17474
fbgt_else.17473:
	addi	%v1, %zero, 1
fbgt_cont.17474:
	beqi	%v1, 0, bnei_else.17475
	flw	%f0, 468(%zero)
	j	bnei_cont.17476
bnei_else.17475:
	flw	%f0, 463(%zero)
bnei_cont.17476:
bnei_cont.17472:
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	add	%at, %v1, %a1
	fsw	%f0, 0(%at)
bnei_cont.17466:
	addi	%v1, %zero, 138
	lw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	utexture.2952
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 134
	lw	%v1, 0(%v1)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17477
	jr	%ra
bnei_else.17477:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17479
	addi	%v0, %zero, 0
	j	fbgt_cont.17480
fbgt_else.17479:
	addi	%v0, %zero, 1
fbgt_cont.17480:
	beqi	%v0, 0, bnei_else.17481
	j	bnei_cont.17482
bnei_else.17481:
	flw	%f0, 464(%zero)
bnei_cont.17482:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 148
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17464:
	jr	%ra
iter_trace_diffuse_rays.2973:
	blti	%a1, 0, bgti_else.17485
	add	%at, %v0, %a1
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	flw	%f0, 0(%a2)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a2)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a2)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17486
	addi	%a2, %zero, 0
	j	fbgt_cont.17487
fbgt_else.17486:
	addi	%a2, %zero, 1
fbgt_cont.17487:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	beqi	%a2, 0, bnei_else.17488
	addi	%a2, %a1, 1
	add	%at, %v0, %a2
	lw	%a2, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17490
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 5(%sp)
	lw	%v1, 0(%v1)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	get_nvector.2949
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 138
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	utexture.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 134
	lw	%v1, 0(%v1)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.17492
	j	bnei_cont.17493
bnei_else.17492:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17494
	addi	%v0, %zero, 0
	j	fbgt_cont.17495
fbgt_else.17494:
	addi	%v0, %zero, 1
fbgt_cont.17495:
	beqi	%v0, 0, bnei_else.17496
	j	bnei_cont.17497
bnei_else.17496:
	flw	%f0, 464(%zero)
bnei_cont.17497:
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 148
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.17493:
	j	bnei_cont.17491
bnei_else.17490:
bnei_cont.17491:
	j	bnei_cont.17489
bnei_else.17488:
	add	%at, %v0, %a1
	lw	%a2, 0(%at)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 7(%sp)
	sw	%a2, 8(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 0, bnei_else.17498
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 8(%sp)
	lw	%v1, 0(%v1)
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	get_nvector.2949
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 138
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	utexture.2952
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 134
	lw	%v1, 0(%v1)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.17500
	j	bnei_cont.17501
bnei_else.17500:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.17502
	addi	%v0, %zero, 0
	j	fbgt_cont.17503
fbgt_else.17502:
	addi	%v0, %zero, 1
fbgt_cont.17503:
	beqi	%v0, 0, bnei_else.17504
	j	bnei_cont.17505
bnei_else.17504:
	flw	%f0, 464(%zero)
bnei_cont.17505:
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 9(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 148
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.17501:
	j	bnei_cont.17499
bnei_else.17498:
bnei_cont.17499:
bnei_cont.17489:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.17506
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	flw	%f0, 0(%a0)
	lw	%a1, 1(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17507
	addi	%a0, %zero, 0
	j	fbgt_cont.17508
fbgt_else.17507:
	addi	%a0, %zero, 1
fbgt_cont.17508:
	sw	%v0, 10(%sp)
	beqi	%a0, 0, bnei_else.17509
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.17510
bnei_else.17509:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.17510:
	lw	%v0, 10(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.17506:
	jr	%ra
bgti_else.17485:
	jr	%ra
trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.17513
	addi	%a1, %zero, 179
	lw	%a1, 0(%a1)
	flw	%f0, 0(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 0(%a2)
	flw	%f0, 1(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 1(%a2)
	flw	%f0, 2(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 2(%a2)
	addi	%a2, %zero, 0
	lw	%a2, 0(%a2)
	addi	%a2, %a2, -1
	sw	%a1, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17514
bnei_else.17513:
bnei_cont.17514:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.17515
	addi	%v1, %zero, 179
	lw	%v1, 1(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 4(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17516
bnei_else.17515:
bnei_cont.17516:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.17517
	addi	%v1, %zero, 179
	lw	%v1, 2(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17518
bnei_else.17517:
bnei_cont.17518:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.17519
	addi	%v1, %zero, 179
	lw	%v1, 3(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17520
bnei_else.17519:
bnei_cont.17520:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.17521
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 2(%a0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	j	iter_trace_diffuse_rays.2973
bnei_else.17521:
	jr	%ra
calc_diffuse_using_1point.2986:
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 148
	fsw	%f0, 2(%a0)
	lw	%v0, 6(%v0)
	lw	%v0, 0(%v0)
	add	%at, %a1, %v1
	lw	%a0, 0(%at)
	add	%at, %a2, %v1
	lw	%a1, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a3, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.17523
	addi	%a2, %zero, 179
	lw	%a2, 0(%a2)
	flw	%f0, 0(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 2(%t0)
	addi	%t0, %zero, 0
	lw	%t0, 0(%t0)
	addi	%t0, %t0, -1
	sw	%a2, 5(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17525
	addi	%v1, %zero, 0
	j	fbgt_cont.17526
fbgt_else.17525:
	addi	%v1, %zero, 1
fbgt_cont.17526:
	beqi	%v1, 0, bnei_else.17527
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17528
bnei_else.17527:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.17528:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17524
bnei_else.17523:
bnei_cont.17524:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.17529
	addi	%v1, %zero, 179
	lw	%v1, 1(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17531
	addi	%v1, %zero, 0
	j	fbgt_cont.17532
fbgt_else.17531:
	addi	%v1, %zero, 1
fbgt_cont.17532:
	beqi	%v1, 0, bnei_else.17533
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17534
bnei_else.17533:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.17534:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17530
bnei_else.17529:
bnei_cont.17530:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.17535
	addi	%v1, %zero, 179
	lw	%v1, 2(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17537
	addi	%v1, %zero, 0
	j	fbgt_cont.17538
fbgt_else.17537:
	addi	%v1, %zero, 1
fbgt_cont.17538:
	beqi	%v1, 0, bnei_else.17539
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17540
bnei_else.17539:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.17540:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17536
bnei_else.17535:
bnei_cont.17536:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.17541
	addi	%v1, %zero, 179
	lw	%v1, 3(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 8(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17543
	addi	%v1, %zero, 0
	j	fbgt_cont.17544
fbgt_else.17543:
	addi	%v1, %zero, 1
fbgt_cont.17544:
	beqi	%v1, 0, bnei_else.17545
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17546
bnei_else.17545:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.17546:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17542
bnei_else.17541:
bnei_cont.17542:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.17547
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 2(%a0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17549
	addi	%v1, %zero, 0
	j	fbgt_cont.17550
fbgt_else.17549:
	addi	%v1, %zero, 1
fbgt_cont.17550:
	beqi	%v1, 0, bnei_else.17551
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17552
bnei_else.17551:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.17552:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17548
bnei_else.17547:
bnei_cont.17548:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	j	vecaccumv.2679
calc_diffuse_using_5points.2989:
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%v1, 5(%v1)
	addi	%a3, %v0, -1
	add	%at, %a0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 5(%a3)
	add	%at, %a0, %v0
	lw	%t0, 0(%at)
	lw	%t0, 5(%t0)
	addi	%t1, %v0, 1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 5(%t1)
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	lw	%a1, 5(%a1)
	add	%at, %v1, %a2
	lw	%v1, 0(%at)
	flw	%f0, 0(%v1)
	addi	%t2, %zero, 148
	fsw	%f0, 0(%t2)
	flw	%f0, 1(%v1)
	addi	%t2, %zero, 148
	fsw	%f0, 1(%t2)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a3, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 148
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %t0, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 148
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %t1, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 148
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 148
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 148
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a1, %a2
	lw	%v1, 0(%at)
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	lw	%v0, 4(%v0)
	add	%at, %v0, %a2
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	j	vecaccumv.2679
do_without_neighbors.2995:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17553
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17554
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.17555
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 148
	fsw	%f0, 2(%a0)
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	sw	%a3, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	addi	%a0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_ray_80percent.2982
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%a1, %zero, 151
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecaccumv.2679
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17556
bnei_else.17555:
bnei_cont.17556:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17557
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17558
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.17559
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17560
bnei_else.17559:
bnei_cont.17560:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.17558:
	jr	%ra
bgt_else.17557:
	jr	%ra
bgti_else.17554:
	jr	%ra
bgt_else.17553:
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.17565
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.17566
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17567
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17569
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17571
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17573
	addi	%t1, %zero, 1
	j	beq_cont.17574
beq_else.17573:
	addi	%t1, %zero, 0
beq_cont.17574:
	j	beq_cont.17572
beq_else.17571:
	addi	%t1, %zero, 0
beq_cont.17572:
	j	beq_cont.17570
beq_else.17569:
	addi	%t1, %zero, 0
beq_cont.17570:
	j	beq_cont.17568
beq_else.17567:
	addi	%t1, %zero, 0
beq_cont.17568:
	beqi	%t1, 0, bnei_else.17575
	lw	%t0, 3(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a3, 5(%sp)
	beqi	%t0, 0, bnei_else.17576
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17577
bnei_else.17576:
bnei_cont.17577:
	lw	%v0, 5(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17578
	lw	%a2, 2(%a1)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	blti	%a2, 0, bgti_else.17579
	add	%at, %a0, %v0
	lw	%a2, 0(%at)
	lw	%a2, 2(%a2)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	lw	%a3, 2(%sp)
	add	%at, %a3, %v0
	lw	%t0, 0(%at)
	lw	%t0, 2(%t0)
	add	%at, %t0, %v1
	lw	%t0, 0(%at)
	bne	%t0, %a2, beq_else.17580
	lw	%t0, 1(%sp)
	add	%at, %t0, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17582
	addi	%t1, %v0, -1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17584
	addi	%t1, %v0, 1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17586
	addi	%a2, %zero, 1
	j	beq_cont.17587
beq_else.17586:
	addi	%a2, %zero, 0
beq_cont.17587:
	j	beq_cont.17585
beq_else.17584:
	addi	%a2, %zero, 0
beq_cont.17585:
	j	beq_cont.17583
beq_else.17582:
	addi	%a2, %zero, 0
beq_cont.17583:
	j	beq_cont.17581
beq_else.17580:
	addi	%a2, %zero, 0
beq_cont.17581:
	beqi	%a2, 0, bnei_else.17588
	lw	%a1, 3(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	sw	%v1, 6(%sp)
	beqi	%a1, 0, bnei_else.17589
	lw	%a1, 1(%sp)
	addi	%a2, %v1, 0
	addi	%v1, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17590
bnei_else.17589:
bnei_cont.17590:
	lw	%v0, 6(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 1(%sp)
	j	try_exploit_neighbors.3011
bnei_else.17588:
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	j	do_without_neighbors.2995
bgti_else.17579:
	jr	%ra
bgt_else.17578:
	jr	%ra
bnei_else.17575:
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.17593
	lw	%v1, 2(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	blti	%v1, 0, bgti_else.17594
	lw	%v1, 3(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	sw	%v0, 7(%sp)
	sw	%a3, 5(%sp)
	beqi	%v1, 0, bnei_else.17595
	addi	%v1, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17596
bnei_else.17595:
bnei_cont.17596:
	lw	%v0, 5(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 7(%sp)
	j	do_without_neighbors.2995
bgti_else.17594:
	jr	%ra
bgt_else.17593:
	jr	%ra
bgti_else.17566:
	jr	%ra
bgt_else.17565:
	jr	%ra
write_rgb.3022:
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17601
	blti	%v0, 0, bgti_else.17603
	j	bgti_cont.17604
bgti_else.17603:
	addi	%v0, %zero, 0
bgti_cont.17604:
	j	bgt_cont.17602
bgt_else.17601:
	addi	%v0, %zero, 255
bgt_cont.17602:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17605
	blti	%v0, 0, bgti_else.17607
	j	bgti_cont.17608
bgti_else.17607:
	addi	%v0, %zero, 0
bgti_cont.17608:
	j	bgt_cont.17606
bgt_else.17605:
	addi	%v0, %zero, 255
bgt_cont.17606:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17609
	blti	%v0, 0, bgti_else.17611
	j	bgti_cont.17612
bgti_else.17611:
	addi	%v0, %zero, 0
bgti_cont.17612:
	j	bgt_cont.17610
bgt_else.17609:
	addi	%v0, %zero, 255
bgt_cont.17610:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17613
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17614
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.17615
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 179
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17616
bnei_else.17615:
bnei_cont.17616:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17617
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17618
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.17619
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 179
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 6(%sp)
	sw	%a1, 7(%sp)
	sw	%a0, 8(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17621
	addi	%v1, %zero, 0
	j	fbgt_cont.17622
fbgt_else.17621:
	addi	%v1, %zero, 1
fbgt_cont.17622:
	beqi	%v1, 0, bnei_else.17623
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17624
bnei_else.17623:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.17624:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17620
bnei_else.17619:
bnei_cont.17620:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3024
bgti_else.17618:
	jr	%ra
bgt_else.17617:
	jr	%ra
bgti_else.17614:
	jr	%ra
bgt_else.17613:
	jr	%ra
pretrace_pixels.3027:
	blti	%v1, 0, bgti_else.17629
	addi	%a1, %zero, 158
	flw	%f3, 0(%a1)
	addi	%a1, %zero, 156
	lw	%a1, 0(%a1)
	sub	%a1, %v1, %a1
	itof	%f4, %a1
	fmul	%f3, %f3, %f4
	addi	%a1, %zero, 165
	flw	%f4, 0(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a1, %zero, 174
	fsw	%f4, 0(%a1)
	addi	%a1, %zero, 165
	flw	%f4, 1(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a1, %zero, 174
	fsw	%f4, 1(%a1)
	addi	%a1, %zero, 165
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a1, %zero, 174
	fsw	%f3, 2(%a1)
	addi	%a1, %zero, 0
	addi	%a2, %zero, 174
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f0, 464(%zero)
	addi	%v0, %zero, 151
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 151
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	flw	%f0, 468(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	flw	%f1, 464(%zero)
	addi	%a2, %zero, 174
	addi	%a0, %a1, 0
	addi	%v1, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_ray.2964
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 151
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%a0)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a0, 6(%a0)
	lw	%a1, 3(%sp)
	sw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 2(%a0)
	lw	%a2, 0(%a2)
	blti	%a2, 0, bgti_else.17630
	lw	%a2, 3(%a0)
	lw	%a2, 0(%a2)
	sw	%a0, 6(%sp)
	beqi	%a2, 0, bnei_else.17632
	lw	%a2, 6(%a0)
	lw	%a2, 0(%a2)
	flw	%f0, 464(%zero)
	addi	%a3, %zero, 148
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 148
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 148
	fsw	%f0, 2(%a3)
	lw	%a3, 7(%a0)
	lw	%t0, 1(%a0)
	addi	%t1, %zero, 179
	add	%at, %t1, %a2
	lw	%a2, 0(%at)
	lw	%a3, 0(%a3)
	lw	%t0, 0(%t0)
	flw	%f0, 0(%t0)
	addi	%t1, %zero, 162
	fsw	%f0, 0(%t1)
	flw	%f0, 1(%t0)
	addi	%t1, %zero, 162
	fsw	%f0, 1(%t1)
	flw	%f0, 2(%t0)
	addi	%t1, %zero, 162
	fsw	%f0, 2(%t1)
	addi	%t1, %zero, 0
	lw	%t1, 0(%t1)
	addi	%t1, %t1, -1
	sw	%t0, 7(%sp)
	sw	%a3, 8(%sp)
	sw	%a2, 9(%sp)
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	lw	%a0, 8(%sp)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.17634
	addi	%v1, %zero, 0
	j	fbgt_cont.17635
fbgt_else.17634:
	addi	%v1, %zero, 1
fbgt_cont.17635:
	beqi	%v1, 0, bnei_else.17636
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17637
bnei_else.17636:
	lw	%v1, 118(%v0)
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.17637:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 7(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 148
	flw	%f0, 0(%a0)
	fsw	%f0, 0(%v1)
	addi	%a0, %zero, 148
	flw	%f0, 1(%a0)
	fsw	%f0, 1(%v1)
	addi	%a0, %zero, 148
	flw	%f0, 2(%a0)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17633
bnei_else.17632:
bnei_cont.17633:
	addi	%v1, %zero, 1
	lw	%v0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.17631
bgti_else.17630:
bgti_cont.17631:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.17638
	addi	%a0, %v0, -5
	j	bgti_cont.17639
bgti_else.17638:
	add	%a0, %zero, %v0
bgti_cont.17639:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 5(%sp)
	j	pretrace_pixels.3027
bgti_else.17629:
	jr	%ra
pretrace_line.3034:
	addi	%a1, %zero, 158
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 156
	lw	%a1, 1(%a1)
	sub	%v1, %v1, %a1
	itof	%f1, %v1
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 168
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 171
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	addi	%v1, %zero, 168
	flw	%f2, 1(%v1)
	fmul	%f2, %f0, %f2
	addi	%v1, %zero, 171
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	addi	%v1, %zero, 168
	flw	%f3, 2(%v1)
	fmul	%f0, %f0, %f3
	addi	%v1, %zero, 171
	flw	%f3, 2(%v1)
	fadd	%f0, %f0, %f3
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	j	pretrace_pixels.3027
scan_pixel.3038:
	addi	%a3, %zero, 154
	lw	%a3, 0(%a3)
	blt	%v0, %a3, bgt_else.17641
	jr	%ra
bgt_else.17641:
	add	%at, %a1, %v0
	lw	%a3, 0(%at)
	lw	%a3, 0(%a3)
	flw	%f0, 0(%a3)
	addi	%t0, %zero, 151
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a3)
	addi	%t0, %zero, 151
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a3)
	addi	%a3, %zero, 151
	fsw	%f0, 2(%a3)
	addi	%a3, %zero, 154
	lw	%a3, 1(%a3)
	addi	%t0, %v1, 1
	blt	%t0, %a3, bgt_else.17643
	addi	%a3, %zero, 0
	j	bgt_cont.17644
bgt_else.17643:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.17645
	addi	%a3, %zero, 0
	j	bgt_cont.17646
bgt_else.17645:
	addi	%a3, %zero, 154
	lw	%a3, 0(%a3)
	addi	%t0, %v0, 1
	blt	%t0, %a3, bgt_else.17647
	addi	%a3, %zero, 0
	j	bgt_cont.17648
bgt_else.17647:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17649
	addi	%a3, %zero, 0
	j	bgt_cont.17650
bgt_else.17649:
	addi	%a3, %zero, 1
bgt_cont.17650:
bgt_cont.17648:
bgt_cont.17646:
bgt_cont.17644:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	beqi	%a3, 0, bnei_else.17651
	addi	%a3, %zero, 0
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	lw	%t1, 2(%t0)
	lw	%t1, 0(%t1)
	blti	%t1, 0, bgti_else.17653
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	lw	%t1, 0(%t1)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17655
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17657
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17659
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17661
	addi	%t1, %zero, 1
	j	beq_cont.17662
beq_else.17661:
	addi	%t1, %zero, 0
beq_cont.17662:
	j	beq_cont.17660
beq_else.17659:
	addi	%t1, %zero, 0
beq_cont.17660:
	j	beq_cont.17658
beq_else.17657:
	addi	%t1, %zero, 0
beq_cont.17658:
	j	beq_cont.17656
beq_else.17655:
	addi	%t1, %zero, 0
beq_cont.17656:
	beqi	%t1, 0, bnei_else.17663
	lw	%t0, 3(%t0)
	lw	%t0, 0(%t0)
	beqi	%t0, 0, bnei_else.17665
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17666
bnei_else.17665:
bnei_cont.17666:
	addi	%a3, %zero, 1
	lw	%v0, 4(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17664
bnei_else.17663:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17664:
	j	bgti_cont.17654
bgti_else.17653:
bgti_cont.17654:
	j	bnei_cont.17652
bnei_else.17651:
	add	%at, %a1, %v0
	lw	%a3, 0(%at)
	addi	%t0, %zero, 0
	lw	%t1, 2(%a3)
	lw	%t1, 0(%t1)
	blti	%t1, 0, bgti_else.17667
	lw	%t1, 3(%a3)
	lw	%t1, 0(%t1)
	sw	%a3, 5(%sp)
	beqi	%t1, 0, bnei_else.17669
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17670
bnei_else.17669:
bnei_cont.17670:
	addi	%v1, %zero, 1
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.17668
bgti_else.17667:
bgti_cont.17668:
bnei_cont.17652:
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17671
	blti	%v0, 0, bgti_else.17673
	j	bgti_cont.17674
bgti_else.17673:
	addi	%v0, %zero, 0
bgti_cont.17674:
	j	bgt_cont.17672
bgt_else.17671:
	addi	%v0, %zero, 255
bgt_cont.17672:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int.2627
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17675
	blti	%v0, 0, bgti_else.17677
	j	bgti_cont.17678
bgti_else.17677:
	addi	%v0, %zero, 0
bgti_cont.17678:
	j	bgt_cont.17676
bgt_else.17675:
	addi	%v0, %zero, 255
bgt_cont.17676:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int.2627
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17679
	blti	%v0, 0, bgti_else.17681
	j	bgti_cont.17682
bgti_else.17681:
	addi	%v0, %zero, 0
bgti_cont.17682:
	j	bgt_cont.17680
bgt_else.17679:
	addi	%v0, %zero, 255
bgt_cont.17680:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int.2627
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	blt	%v0, %v1, bgt_else.17683
	jr	%ra
bgt_else.17683:
	lw	%a1, 3(%sp)
	add	%at, %a1, %v0
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	addi	%v1, %zero, 154
	lw	%v1, 1(%v1)
	lw	%a0, 2(%sp)
	addi	%a2, %a0, 1
	blt	%a2, %v1, bgt_else.17685
	addi	%v1, %zero, 0
	j	bgt_cont.17686
bgt_else.17685:
	addi	%at, %zero, 0
	blt	%at, %a0, bgt_else.17687
	addi	%v1, %zero, 0
	j	bgt_cont.17688
bgt_else.17687:
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%a2, %v0, 1
	blt	%a2, %v1, bgt_else.17689
	addi	%v1, %zero, 0
	j	bgt_cont.17690
bgt_else.17689:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17691
	addi	%v1, %zero, 0
	j	bgt_cont.17692
bgt_else.17691:
	addi	%v1, %zero, 1
bgt_cont.17692:
bgt_cont.17690:
bgt_cont.17688:
bgt_cont.17686:
	sw	%v0, 6(%sp)
	beqi	%v1, 0, bnei_else.17693
	addi	%a3, %zero, 0
	lw	%v1, 1(%sp)
	lw	%a2, 0(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17694
bnei_else.17693:
	add	%at, %a1, %v0
	lw	%v1, 0(%at)
	addi	%a2, %zero, 0
	addi	%v0, %v1, 0
	addi	%v1, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.17694:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	write_rgb.3022
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3038
scan_line.3044:
	addi	%a3, %zero, 154
	lw	%a3, 1(%a3)
	blt	%v0, %a3, bgt_else.17695
	jr	%ra
bgt_else.17695:
	addi	%a3, %zero, 154
	lw	%a3, 1(%a3)
	addi	%a3, %a3, -1
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	blt	%v0, %a3, bgt_else.17697
	j	bgt_cont.17698
bgt_else.17697:
	addi	%a3, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bgt_cont.17698:
	addi	%v0, %zero, 0
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.17699
	j	bgt_cont.17700
bgt_else.17699:
	lw	%a1, 4(%sp)
	lw	%v1, 0(%a1)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	addi	%v1, %zero, 154
	lw	%v1, 1(%v1)
	lw	%a0, 3(%sp)
	addi	%a2, %a0, 1
	blt	%a2, %v1, bgt_else.17701
	addi	%v1, %zero, 0
	j	bgt_cont.17702
bgt_else.17701:
	addi	%at, %zero, 0
	blt	%at, %a0, bgt_else.17703
	addi	%v1, %zero, 0
	j	bgt_cont.17704
bgt_else.17703:
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.17705
	addi	%v1, %zero, 0
	j	bgt_cont.17706
bgt_else.17705:
	addi	%v1, %zero, 0
bgt_cont.17706:
bgt_cont.17704:
bgt_cont.17702:
	beqi	%v1, 0, bnei_else.17707
	addi	%a3, %zero, 0
	lw	%v1, 2(%sp)
	lw	%a2, 1(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17708
bnei_else.17707:
	lw	%v0, 0(%a1)
	addi	%v1, %zero, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17708:
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	write_rgb.3022
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	scan_pixel.3038
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bgt_cont.17700:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.17709
	addi	%a0, %v0, -5
	j	bgti_cont.17710
bgti_else.17709:
	add	%a0, %zero, %v0
bgti_cont.17710:
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	blt	%v1, %v0, bgt_else.17711
	jr	%ra
bgt_else.17711:
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	blt	%v1, %v0, bgt_else.17713
	j	bgt_cont.17714
bgt_else.17713:
	addi	%v0, %v1, 1
	lw	%a1, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	pretrace_line.3034
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bgt_cont.17714:
	addi	%v0, %zero, 0
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 1(%sp)
	lw	%a2, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	scan_pixel.3038
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.17715
	addi	%a2, %v1, -5
	j	bgti_cont.17716
bgti_else.17715:
	add	%a2, %zero, %v1
bgti_cont.17716:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	j	scan_line.3044
create_float5x3array.3050:
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
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
	flw	%f0, 464(%zero)
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
	flw	%f0, 464(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 2(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3054:
	blti	%v1, 0, bgti_else.17717
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	create_float5x3array.3050
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_float5x3array.3050
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	create_float5x3array.3050
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.17718
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	create_float5x3array.3050
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	create_float5x3array.3050
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	create_float5x3array.3050
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	create_float5x3array.3050
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 16(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 15(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 14(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 11(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 10(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 9(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3054
bgti_else.17718:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.17717:
	jr	%ra
calc_dirvec.3064:
	blti	%v0, 5, bgti_else.17719
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 468(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
	flw	%f3, 468(%zero)
	fdiv	%f2, %f3, %f2
	addi	%v0, %zero, 179
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	add	%at, %v0, %a0
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fsw	%f0, 0(%v1)
	fsw	%f1, 1(%v1)
	fsw	%f2, 2(%v1)
	addi	%v1, %a0, 40
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f1
	fsw	%f0, 0(%v1)
	fsw	%f2, 1(%v1)
	fsw	%f3, 2(%v1)
	addi	%v1, %a0, 80
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f1
	fsw	%f2, 0(%v1)
	fsw	%f3, 1(%v1)
	fsw	%f4, 2(%v1)
	addi	%v1, %a0, 1
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f1
	fneg	%f5, %f2
	fsw	%f3, 0(%v1)
	fsw	%f4, 1(%v1)
	fsw	%f5, 2(%v1)
	addi	%v1, %a0, 41
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f2
	fsw	%f3, 0(%v1)
	fsw	%f4, 1(%v1)
	fsw	%f1, 2(%v1)
	addi	%v1, %a0, 81
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 0(%v0)
	fneg	%f2, %f2
	fsw	%f2, 0(%v0)
	fsw	%f0, 1(%v0)
	fsw	%f1, 2(%v0)
	jr	%ra
bgti_else.17719:
	fmul	%f0, %f1, %f1
	flw	%f1, 439(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 468(%zero)
	fdiv	%f1, %f1, %f0
	flw	%f4, 464(%zero)
	fblt	%f1, %f4, fbgt_else.17721
	addi	%a1, %zero, 1
	j	fbgt_cont.17722
fbgt_else.17721:
	addi	%a1, %zero, 0
fbgt_cont.17722:
	fabs	%f4, %f1
	flw	%f5, 452(%zero)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f2, 5(%sp)
	fblt	%f4, %f5, fbgt_else.17723
	flw	%f1, 451(%zero)
	sw	%a1, 6(%sp)
	fblt	%f4, %f1, fbgt_else.17725
	flw	%f1, 473(%zero)
	flw	%f5, 468(%zero)
	fdiv	%f4, %f5, %f4
	fsw	%f1, 7(%sp)
	fmov	%f0, %f4
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	kernel_atan.2612
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.17726
fbgt_else.17725:
	flw	%f1, 472(%zero)
	flw	%f5, 468(%zero)
	fsub	%f5, %f4, %f5
	flw	%f6, 468(%zero)
	fadd	%f4, %f4, %f6
	fdiv	%f4, %f5, %f4
	fsw	%f1, 8(%sp)
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.17726:
	lw	%v0, 6(%sp)
	beqi	%v0, 0, bnei_else.17727
	j	bnei_cont.17728
bnei_else.17727:
	fneg	%f0, %f0
bnei_cont.17728:
	j	fbgt_cont.17724
fbgt_else.17723:
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
fbgt_cont.17724:
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2618
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	cos.2616
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	fmul	%f1, %f0, %f0
	flw	%f2, 439(%zero)
	fadd	%f1, %f1, %f2
	fsqrt	%f1, %f1
	flw	%f2, 468(%zero)
	fdiv	%f2, %f2, %f1
	flw	%f3, 464(%zero)
	fblt	%f2, %f3, fbgt_else.17729
	addi	%v1, %zero, 1
	j	fbgt_cont.17730
fbgt_else.17729:
	addi	%v1, %zero, 0
fbgt_cont.17730:
	fabs	%f3, %f2
	flw	%f4, 452(%zero)
	fsw	%f0, 11(%sp)
	sw	%v0, 12(%sp)
	fsw	%f1, 13(%sp)
	fblt	%f3, %f4, fbgt_else.17731
	flw	%f2, 451(%zero)
	sw	%v1, 14(%sp)
	fblt	%f3, %f2, fbgt_else.17733
	flw	%f2, 473(%zero)
	flw	%f4, 468(%zero)
	fdiv	%f3, %f4, %f3
	fsw	%f2, 15(%sp)
	fmov	%f0, %f3
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	kernel_atan.2612
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.17734
fbgt_else.17733:
	flw	%f2, 472(%zero)
	flw	%f4, 468(%zero)
	fsub	%f4, %f3, %f4
	flw	%f5, 468(%zero)
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f4, %f3
	fsw	%f2, 16(%sp)
	fmov	%f0, %f3
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	kernel_atan.2612
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.17734:
	lw	%v0, 14(%sp)
	beqi	%v0, 0, bnei_else.17735
	j	bnei_cont.17736
bnei_else.17735:
	fneg	%f0, %f0
bnei_cont.17736:
	j	fbgt_cont.17732
fbgt_else.17731:
	fmov	%f0, %f2
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	kernel_atan.2612
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
fbgt_cont.17732:
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	sin.2618
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fsw	%f0, 18(%sp)
	fmov	%f0, %f1
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	cos.2616
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 13(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 11(%sp)
	flw	%f2, 5(%sp)
	flw	%f3, 2(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3064
calc_dirvecs.3072:
	blti	%v0, 0, bgti_else.17737
	itof	%f1, %v0
	flw	%f2, 496(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 436(%zero)
	fsub	%f2, %f1, %f2
	addi	%a1, %zero, 0
	flw	%f1, 464(%zero)
	flw	%f3, 464(%zero)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a1, 0
	fmov	%f29, %f3
	fmov	%f3, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3064
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	itof	%f0, %v0
	flw	%f1, 496(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 439(%zero)
	fadd	%f2, %f0, %f1
	addi	%v1, %zero, 0
	flw	%f0, 464(%zero)
	flw	%f1, 464(%zero)
	lw	%a0, 2(%sp)
	addi	%a1, %a0, 2
	flw	%f3, 0(%sp)
	lw	%a2, 1(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %v1, 0
	addi	%v1, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3064
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 1(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.17738
	addi	%v1, %v1, -5
	j	bgti_cont.17739
bgti_else.17738:
bgti_cont.17739:
	flw	%f0, 0(%sp)
	lw	%a0, 2(%sp)
	j	calc_dirvecs.3072
bgti_else.17737:
	jr	%ra
calc_dirvec_rows.3077:
	blti	%v0, 0, bgti_else.17741
	itof	%f0, %v0
	flw	%f1, 496(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 436(%zero)
	fsub	%f0, %f0, %f1
	addi	%a1, %zero, 4
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 1(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.17742
	addi	%v1, %v1, -5
	j	bgti_cont.17743
bgti_else.17742:
bgti_cont.17743:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.17744
	itof	%f0, %v0
	flw	%f1, 496(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 436(%zero)
	fsub	%f0, %f0, %f1
	addi	%a1, %zero, 4
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.17745
	addi	%v1, %v1, -5
	j	bgti_cont.17746
bgti_else.17745:
bgti_cont.17746:
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3077
bgti_else.17744:
	jr	%ra
bgti_else.17741:
	jr	%ra
create_dirvec_elements.3083:
	blti	%v1, 0, bgti_else.17749
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.17750
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.17751
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 5(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.17752
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	create_dirvec_elements.3083
bgti_else.17752:
	jr	%ra
bgti_else.17751:
	jr	%ra
bgti_else.17750:
	jr	%ra
bgti_else.17749:
	jr	%ra
create_dirvecs.3086:
	blti	%v0, 0, bgti_else.17757
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 179
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 3(%sp)
	sw	%v0, 118(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 3(%sp)
	sw	%v0, 117(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 3(%sp)
	sw	%v0, 116(%v1)
	addi	%v0, %zero, 115
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17758
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 7(%sp)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 9(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 8(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 7(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 179
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 11(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 10(%sp)
	sw	%v0, 118(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 10(%sp)
	sw	%v0, 117(%v1)
	addi	%v0, %zero, 116
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3086
bgti_else.17758:
	jr	%ra
bgti_else.17757:
	jr	%ra
init_dirvec_constants.3088:
	blti	%v1, 0, bgti_else.17761
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17762
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 2(%sp)
	blti	%a1, 0, bgti_else.17763
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 3(%sp)
	beqi	%t1, 1, bnei_else.17765
	beqi	%t1, 2, bnei_else.17767
	sw	%a1, 4(%sp)
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2867
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17768
bnei_else.17767:
	sw	%a1, 4(%sp)
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2864
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17768:
	j	bnei_cont.17766
bnei_else.17765:
	sw	%a1, 4(%sp)
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2861
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17766:
	addi	%v1, %v1, -1
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.17764
bgti_else.17763:
bgti_cont.17764:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17769
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17770
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.17771
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.17773
	beqi	%t1, 2, bnei_else.17775
	sw	%a1, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_second_table.2867
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17776
bnei_else.17775:
	sw	%a1, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_surface_table.2864
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17776:
	j	bnei_cont.17774
bnei_else.17773:
	sw	%a1, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_rect_table.2861
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17774:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.17772
bgti_else.17771:
bgti_cont.17772:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
bgti_else.17770:
	jr	%ra
bgti_else.17769:
	jr	%ra
bgti_else.17762:
	jr	%ra
bgti_else.17761:
	jr	%ra
init_vecset_constants.3091:
	blti	%v0, 0, bgti_else.17781
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	blti	%a1, 0, bgti_else.17782
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 2(%sp)
	beqi	%t1, 1, bnei_else.17784
	beqi	%t1, 2, bnei_else.17786
	sw	%a1, 3(%sp)
	sw	%a3, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2867
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17787
bnei_else.17786:
	sw	%a1, 3(%sp)
	sw	%a3, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2864
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17787:
	j	bnei_cont.17785
bnei_else.17784:
	sw	%a1, 3(%sp)
	sw	%a3, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2861
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17785:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.17783
bgti_else.17782:
bgti_cont.17783:
	lw	%v0, 1(%sp)
	lw	%v1, 118(%v0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 117(%v0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	blti	%a0, 0, bgti_else.17788
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 5(%sp)
	beqi	%t0, 1, bnei_else.17790
	beqi	%t0, 2, bnei_else.17792
	sw	%a0, 6(%sp)
	sw	%a2, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_second_table.2867
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17793
bnei_else.17792:
	sw	%a0, 6(%sp)
	sw	%a2, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_surface_table.2864
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17793:
	j	bnei_cont.17791
bnei_else.17790:
	sw	%a0, 6(%sp)
	sw	%a2, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_rect_table.2861
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17791:
	addi	%v1, %v1, -1
	lw	%v0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bgti_cont.17789
bgti_else.17788:
bgti_cont.17789:
	addi	%v1, %zero, 116
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17794
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 8(%sp)
	sw	%v1, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	blti	%a0, 0, bgti_else.17795
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 10(%sp)
	beqi	%t0, 1, bnei_else.17797
	beqi	%t0, 2, bnei_else.17799
	sw	%a0, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_second_table.2867
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 12(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17800
bnei_else.17799:
	sw	%a0, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_surface_table.2864
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 12(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17800:
	j	bnei_cont.17798
bnei_else.17797:
	sw	%a0, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_rect_table.2861
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 12(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17798:
	addi	%v1, %v1, -1
	lw	%v0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.17796
bgti_else.17795:
bgti_cont.17796:
	addi	%v1, %zero, 117
	lw	%v0, 9(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17801
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	blti	%a1, 0, bgti_else.17802
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 15(%sp)
	beqi	%t1, 1, bnei_else.17804
	beqi	%t1, 2, bnei_else.17806
	sw	%a1, 16(%sp)
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_second_table.2867
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17807
bnei_else.17806:
	sw	%a1, 16(%sp)
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_surface_table.2864
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17807:
	j	bnei_cont.17805
bnei_else.17804:
	sw	%a1, 16(%sp)
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_rect_table.2861
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17805:
	addi	%v1, %v1, -1
	lw	%v0, 15(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.17803
bgti_else.17802:
bgti_cont.17803:
	addi	%v1, %zero, 118
	lw	%v0, 14(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17808
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3091
bgti_else.17808:
	jr	%ra
bgti_else.17801:
	jr	%ra
bgti_else.17794:
	jr	%ra
bgti_else.17781:
	jr	%ra
setup_rect_reflection.3102:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 468(%zero)
	lw	%v1, 7(%v1)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 78
	flw	%f1, 0(%v1)
	fneg	%f1, %f1
	addi	%v1, %zero, 78
	flw	%f2, 1(%v1)
	fneg	%f2, %f2
	addi	%v1, %zero, 78
	flw	%f3, 2(%v1)
	fneg	%f3, %f3
	addi	%v1, %v0, 1
	addi	%a1, %zero, 78
	flw	%f4, 0(%a1)
	addi	%a1, %zero, 3
	flw	%f5, 464(%zero)
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f4, 7(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f5
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 8(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 7(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 6(%sp)
	fsw	%f0, 1(%a0)
	flw	%f1, 5(%sp)
	fsw	%f1, 2(%a0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 9(%sp)
	blti	%a1, 0, bgti_else.17813
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17815
	beqi	%a3, 2, bnei_else.17817
	sw	%a1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_second_table.2867
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17818
bnei_else.17817:
	sw	%a1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_surface_table.2864
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17818:
	j	bnei_cont.17816
bnei_else.17815:
	sw	%a1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_rect_table.2861
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17816:
	addi	%v1, %v1, -1
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.17814
bgti_else.17813:
bgti_cont.17814:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 2(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	lw	%v1, 1(%sp)
	addi	%a1, %v1, 2
	addi	%a2, %zero, 78
	flw	%f1, 1(%a2)
	addi	%a2, %zero, 3
	flw	%f2, 464(%zero)
	sw	%v0, 12(%sp)
	sw	%a1, 13(%sp)
	fsw	%f1, 14(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f2
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 15(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 0(%sp)
	fsw	%f0, 0(%a0)
	flw	%f1, 14(%sp)
	fsw	%f1, 1(%a0)
	flw	%f1, 5(%sp)
	fsw	%f1, 2(%a0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 16(%sp)
	blti	%a1, 0, bgti_else.17819
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17821
	beqi	%a3, 2, bnei_else.17823
	sw	%a1, 17(%sp)
	sw	%v0, 18(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	setup_second_table.2867
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	lw	%a0, 18(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17824
bnei_else.17823:
	sw	%a1, 17(%sp)
	sw	%v0, 18(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	setup_surface_table.2864
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	lw	%a0, 18(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17824:
	j	bnei_cont.17822
bnei_else.17821:
	sw	%a1, 17(%sp)
	sw	%v0, 18(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	setup_rect_table.2861
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	lw	%a0, 18(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17822:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.17820
bgti_else.17819:
bgti_cont.17820:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 1(%sp)
	addi	%a0, %a0, 3
	addi	%a1, %zero, 78
	flw	%f1, 2(%a1)
	addi	%a1, %zero, 3
	flw	%f2, 464(%zero)
	sw	%v1, 19(%sp)
	sw	%a0, 20(%sp)
	fsw	%f1, 21(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f2
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 22(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 0(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 6(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 21(%sp)
	fsw	%f0, 2(%a0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 23(%sp)
	blti	%a1, 0, bgti_else.17825
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17827
	beqi	%a3, 2, bnei_else.17829
	sw	%a1, 24(%sp)
	sw	%v0, 25(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	setup_second_table.2867
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 24(%sp)
	lw	%a0, 25(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17830
bnei_else.17829:
	sw	%a1, 24(%sp)
	sw	%v0, 25(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	setup_surface_table.2864
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 24(%sp)
	lw	%a0, 25(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17830:
	j	bnei_cont.17828
bnei_else.17827:
	sw	%a1, 24(%sp)
	sw	%v0, 25(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	setup_rect_table.2861
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 24(%sp)
	lw	%a0, 25(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17828:
	addi	%v1, %v1, -1
	lw	%v0, 23(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.17826
bgti_else.17825:
bgti_cont.17826:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 23(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 20(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 19(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 434
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3105:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 468(%zero)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	lw	%a1, 4(%v1)
	addi	%a2, %zero, 78
	flw	%f1, 0(%a2)
	flw	%f2, 0(%a1)
	fmul	%f1, %f1, %f2
	addi	%a2, %zero, 78
	flw	%f2, 1(%a2)
	flw	%f3, 1(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	addi	%a2, %zero, 78
	flw	%f2, 2(%a2)
	flw	%f3, 2(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	flw	%f2, 491(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f2, %f2, %f1
	addi	%a1, %zero, 78
	flw	%f3, 0(%a1)
	fsub	%f2, %f2, %f3
	flw	%f3, 491(%zero)
	lw	%a1, 4(%v1)
	flw	%f4, 1(%a1)
	fmul	%f3, %f3, %f4
	fmul	%f3, %f3, %f1
	addi	%a1, %zero, 78
	flw	%f4, 1(%a1)
	fsub	%f3, %f3, %f4
	flw	%f4, 491(%zero)
	lw	%v1, 4(%v1)
	flw	%f5, 2(%v1)
	fmul	%f4, %f4, %f5
	fmul	%f1, %f4, %f1
	addi	%v1, %zero, 78
	flw	%f4, 2(%v1)
	fsub	%f1, %f1, %f4
	addi	%v1, %zero, 3
	flw	%f4, 464(%zero)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f2, 5(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f4
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 6(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 5(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 4(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 3(%sp)
	fsw	%f0, 2(%a0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v1, 7(%sp)
	blti	%a1, 0, bgti_else.17832
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17834
	beqi	%a3, 2, bnei_else.17836
	sw	%a1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2867
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17837
bnei_else.17836:
	sw	%a1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2864
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17837:
	j	bnei_cont.17835
bnei_else.17834:
	sw	%a1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2861
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17835:
	addi	%v1, %v1, -1
	lw	%v0, 7(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.17833
bgti_else.17832:
bgti_cont.17833:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 7(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	addi	%v1, %zero, 434
	sw	%v0, 0(%v1)
	jr	%ra
rt.3110:
	addi	%a0, %zero, 154
	sw	%v0, 0(%a0)
	addi	%a0, %zero, 154
	sw	%v1, 1(%a0)
	srl	%a0, %v0, 1
	addi	%a1, %zero, 156
	sw	%a0, 0(%a1)
	srl	%v1, %v1, 1
	addi	%a0, %zero, 156
	sw	%v1, 1(%a0)
	flw	%f0, 435(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 158
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_float5x3array.3050
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
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	create_float5x3array.3050
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_float5x3array.3050
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	create_float5x3array.3050
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 1(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 0(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	init_line_elements.3054
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 8(%sp)
	sw	%v1, 9(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	create_float5x3array.3050
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	create_float5x3array.3050
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	create_float5x3array.3050
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	create_float5x3array.3050
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 16(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 15(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 14(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 11(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 10(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 9(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	init_line_elements.3054
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
	sw	%v0, 17(%sp)
	sw	%v1, 18(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	sw	%v0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	create_float5x3array.3050
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 21(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	sw	%v0, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	create_float5x3array.3050
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	sw	%v0, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	create_float5x3array.3050
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	sw	%v0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	create_float5x3array.3050
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 25(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 24(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 23(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 22(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 21(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 20(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 19(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 18(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v1, %zero, 154
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	init_line_elements.3054
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	sw	%v0, 26(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	read_screen_settings.2756
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	read_light.2758
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%v0, %zero, 0
	sw	%v0, 27(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_nth_object.2763
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	beqi	%v0, 0, bnei_else.17839
	addi	%v0, %zero, 1
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_object.2765
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bnei_cont.17840
bnei_else.17839:
	addi	%v0, %zero, 0
	lw	%v1, 27(%sp)
	sw	%v1, 0(%v0)
bnei_cont.17840:
	addi	%v0, %zero, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_and_network.2773
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_or_network.2771
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v1, %zero, 134
	sw	%v0, 0(%v1)
	addi	%v0, %zero, 80
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int.2627
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int.2627
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int.2627
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 4
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	create_dirvecs.3086
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	calc_dirvec_rows.3077
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	lw	%v1, 119(%v0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	sw	%v0, 28(%sp)
	blti	%a0, 0, bgti_else.17841
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 29(%sp)
	beqi	%t0, 1, bnei_else.17843
	beqi	%t0, 2, bnei_else.17845
	sw	%a0, 30(%sp)
	sw	%a2, 31(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_second_table.2867
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 30(%sp)
	lw	%a0, 31(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17846
bnei_else.17845:
	sw	%a0, 30(%sp)
	sw	%a2, 31(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_surface_table.2864
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 30(%sp)
	lw	%a0, 31(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17846:
	j	bnei_cont.17844
bnei_else.17843:
	sw	%a0, 30(%sp)
	sw	%a2, 31(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_rect_table.2861
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 30(%sp)
	lw	%a0, 31(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17844:
	addi	%v1, %v1, -1
	lw	%v0, 29(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.17842
bgti_else.17841:
bgti_cont.17842:
	addi	%v1, %zero, 118
	lw	%v0, 28(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v0, %zero, 179
	lw	%v0, 3(%v0)
	addi	%v1, %zero, 119
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v0, %zero, 2
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	init_vecset_constants.3091
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v0, %zero, 78
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 247
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17847
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.17849
	j	bnei_cont.17850
bnei_else.17849:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 468(%zero)
	fblt	%f0, %f1, fbgt_else.17851
	addi	%a0, %zero, 0
	j	fbgt_cont.17852
fbgt_else.17851:
	addi	%a0, %zero, 1
fbgt_cont.17852:
	beqi	%a0, 0, bnei_else.17853
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.17855
	beqi	%a0, 2, bnei_else.17857
	j	bnei_cont.17858
bnei_else.17857:
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_surface_reflection.3105
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
bnei_cont.17858:
	j	bnei_cont.17856
bnei_else.17855:
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	setup_rect_reflection.3102
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
bnei_cont.17856:
	j	bnei_cont.17854
bnei_else.17853:
bnei_cont.17854:
bnei_cont.17850:
	j	bgti_cont.17848
bgti_else.17847:
bgti_cont.17848:
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%v0, 17(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	pretrace_line.3034
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 2
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17859
	jr	%ra
bgt_else.17859:
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%v1, 32(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17861
	j	bgt_cont.17862
bgt_else.17861:
	addi	%v0, %zero, 1
	lw	%a1, 26(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	pretrace_line.3034
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bgt_cont.17862:
	addi	%v0, %zero, 0
	lw	%v1, 32(%sp)
	lw	%a0, 8(%sp)
	lw	%a1, 17(%sp)
	lw	%a2, 26(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	scan_pixel.3038
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v0, %zero, 1
	addi	%a2, %zero, 4
	lw	%v1, 17(%sp)
	lw	%a0, 26(%sp)
	lw	%a1, 8(%sp)
	j	scan_line.3044
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
	flw	%f0, 464(%zero)
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
	addi	%t1, %zero, 1
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
	addi	%a0, %zero, 12
	addi	%v0, %zero, 1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 72
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 75
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 78
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 447(%zero)
	addi	%v1, %zero, 81
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 50
	addi	%v1, %zero, 1
	addi	%a0, %zero, -1
	addi	%a1, %zero, 82
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 1
	addi	%a0, %zero, 83
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 133
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 135
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 136
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 456(%zero)
	addi	%v1, %zero, 137
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 138
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 141
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 142
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 145
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 148
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 151
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 154
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 156
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 158
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 159
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 162
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 165
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 168
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 174
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 177
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 177
	addi	%a1, %zero, 177
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 177
	sw	%v0, 1(%a0)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%a0)
	add	%v0, %zero, %a0
	addi	%a0, %zero, 179
	addi	%v0, %zero, 177
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 184
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 184
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 187
	addi	%a1, %zero, 184
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_extarray
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 247
	sw	%v0, 1(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v0, %zero, 0
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 249
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 249
	addi	%a1, %zero, 249
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 249
	sw	%v0, 1(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 0
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 251
	fsw	%f0, 2(%a1)
	sw	%v0, 1(%a1)
	sw	%a0, 0(%a1)
	add	%v0, %zero, %a1
	addi	%a0, %zero, 254
	addi	%v0, %zero, 251
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 434
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 128
	addi	%v1, %zero, 128
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	rt.3110
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%g0, %zero, 0
	ret
