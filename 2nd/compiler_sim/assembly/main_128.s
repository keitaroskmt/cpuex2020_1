.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 478
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
	flw	%f4, 477(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 476(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 475(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 474(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155.10100:
	fblt	%f0, %f1, fbgt_else.16391
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16392
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16393
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16394
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16395
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16396
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16397
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16398
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16399
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16400
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16401
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16402
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16403
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16404
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16405
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16406
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10100
fbgt_else.16406:
	fmov	%f0, %f1
	jr	%ra
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
g.6159.10104:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.16407
	fblt	%f0, %f1, fbgt_else.16408
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16409
	fblt	%f0, %f1, fbgt_else.16410
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16411
	fblt	%f0, %f1, fbgt_else.16412
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16413
	fblt	%f0, %f1, fbgt_else.16414
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16414:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16413:
	jr	%ra
fbgt_else.16412:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16415
	fblt	%f0, %f1, fbgt_else.16416
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16416:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16415:
	jr	%ra
fbgt_else.16411:
	jr	%ra
fbgt_else.16410:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16417
	fblt	%f0, %f1, fbgt_else.16418
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16419
	fblt	%f0, %f1, fbgt_else.16420
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16420:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16419:
	jr	%ra
fbgt_else.16418:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16421
	fblt	%f0, %f1, fbgt_else.16422
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16422:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16421:
	jr	%ra
fbgt_else.16417:
	jr	%ra
fbgt_else.16409:
	jr	%ra
fbgt_else.16408:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16423
	fblt	%f0, %f1, fbgt_else.16424
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16425
	fblt	%f0, %f1, fbgt_else.16426
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16427
	fblt	%f0, %f1, fbgt_else.16428
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16428:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16427:
	jr	%ra
fbgt_else.16426:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16429
	fblt	%f0, %f1, fbgt_else.16430
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16430:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16429:
	jr	%ra
fbgt_else.16425:
	jr	%ra
fbgt_else.16424:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16431
	fblt	%f0, %f1, fbgt_else.16432
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16433
	fblt	%f0, %f1, fbgt_else.16434
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16434:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16433:
	jr	%ra
fbgt_else.16432:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16435
	fblt	%f0, %f1, fbgt_else.16436
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16436:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16435:
	jr	%ra
fbgt_else.16431:
	jr	%ra
fbgt_else.16423:
	jr	%ra
fbgt_else.16407:
	jr	%ra
cos.2616:
	flw	%f1, 470(%zero)
	fabs	%f0, %f0
	flw	%f2, 469(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.16437
	flw	%f3, 468(%zero)
	fblt	%f0, %f3, fbgt_else.16439
	flw	%f3, 467(%zero)
	fblt	%f0, %f3, fbgt_else.16441
	flw	%f3, 466(%zero)
	fblt	%f0, %f3, fbgt_else.16443
	flw	%f3, 465(%zero)
	fblt	%f0, %f3, fbgt_else.16445
	flw	%f3, 464(%zero)
	fblt	%f0, %f3, fbgt_else.16447
	flw	%f3, 463(%zero)
	fblt	%f0, %f3, fbgt_else.16449
	flw	%f3, 462(%zero)
	fblt	%f0, %f3, fbgt_else.16451
	flw	%f3, 461(%zero)
	fblt	%f0, %f3, fbgt_else.16453
	flw	%f3, 460(%zero)
	fblt	%f0, %f3, fbgt_else.16455
	flw	%f3, 459(%zero)
	fblt	%f0, %f3, fbgt_else.16457
	flw	%f3, 458(%zero)
	fblt	%f0, %f3, fbgt_else.16459
	flw	%f3, 457(%zero)
	fblt	%f0, %f3, fbgt_else.16461
	flw	%f3, 456(%zero)
	fblt	%f0, %f3, fbgt_else.16463
	flw	%f3, 455(%zero)
	fblt	%f0, %f3, fbgt_else.16465
	flw	%f3, 454(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.6155.10100
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.16466
fbgt_else.16465:
	fmov	%f0, %f3
fbgt_cont.16466:
	j	fbgt_cont.16464
fbgt_else.16463:
	fmov	%f0, %f3
fbgt_cont.16464:
	j	fbgt_cont.16462
fbgt_else.16461:
	fmov	%f0, %f3
fbgt_cont.16462:
	j	fbgt_cont.16460
fbgt_else.16459:
	fmov	%f0, %f3
fbgt_cont.16460:
	j	fbgt_cont.16458
fbgt_else.16457:
	fmov	%f0, %f3
fbgt_cont.16458:
	j	fbgt_cont.16456
fbgt_else.16455:
	fmov	%f0, %f3
fbgt_cont.16456:
	j	fbgt_cont.16454
fbgt_else.16453:
	fmov	%f0, %f3
fbgt_cont.16454:
	j	fbgt_cont.16452
fbgt_else.16451:
	fmov	%f0, %f3
fbgt_cont.16452:
	j	fbgt_cont.16450
fbgt_else.16449:
	fmov	%f0, %f3
fbgt_cont.16450:
	j	fbgt_cont.16448
fbgt_else.16447:
	fmov	%f0, %f3
fbgt_cont.16448:
	j	fbgt_cont.16446
fbgt_else.16445:
	fmov	%f0, %f3
fbgt_cont.16446:
	j	fbgt_cont.16444
fbgt_else.16443:
	fmov	%f0, %f3
fbgt_cont.16444:
	j	fbgt_cont.16442
fbgt_else.16441:
	fmov	%f0, %f3
fbgt_cont.16442:
	j	fbgt_cont.16440
fbgt_else.16439:
	fmov	%f0, %f3
fbgt_cont.16440:
	j	fbgt_cont.16438
fbgt_else.16437:
	fmov	%f0, %f2
fbgt_cont.16438:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10104
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.16467
	fblt	%f2, %f0, fbgt_else.16469
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16471
	fblt	%f2, %f0, fbgt_else.16473
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16475
	fblt	%f2, %f0, fbgt_else.16477
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16478
fbgt_else.16477:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16478:
	j	fbgt_cont.16476
fbgt_else.16475:
	fmov	%f0, %f2
fbgt_cont.16476:
	j	fbgt_cont.16474
fbgt_else.16473:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16479
	fblt	%f2, %f0, fbgt_else.16481
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16482
fbgt_else.16481:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16482:
	j	fbgt_cont.16480
fbgt_else.16479:
	fmov	%f0, %f2
fbgt_cont.16480:
fbgt_cont.16474:
	j	fbgt_cont.16472
fbgt_else.16471:
	fmov	%f0, %f2
fbgt_cont.16472:
	j	fbgt_cont.16470
fbgt_else.16469:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16483
	fblt	%f2, %f0, fbgt_else.16485
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16487
	fblt	%f2, %f0, fbgt_else.16489
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16490
fbgt_else.16489:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16490:
	j	fbgt_cont.16488
fbgt_else.16487:
	fmov	%f0, %f2
fbgt_cont.16488:
	j	fbgt_cont.16486
fbgt_else.16485:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16491
	fblt	%f2, %f0, fbgt_else.16493
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16494
fbgt_else.16493:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.16494:
	j	fbgt_cont.16492
fbgt_else.16491:
	fmov	%f0, %f2
fbgt_cont.16492:
fbgt_cont.16486:
	j	fbgt_cont.16484
fbgt_else.16483:
	fmov	%f0, %f2
fbgt_cont.16484:
fbgt_cont.16470:
	j	fbgt_cont.16468
fbgt_else.16467:
	fmov	%f0, %f2
fbgt_cont.16468:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.16495
	addi	%v0, %zero, 0
	j	fbgt_cont.16496
fbgt_else.16495:
	addi	%v0, %zero, 1
fbgt_cont.16496:
	fblt	%f0, %f1, fbgt_else.16497
	fsub	%f0, %f0, %f1
	j	fbgt_cont.16498
fbgt_else.16497:
fbgt_cont.16498:
	flw	%f2, 453(%zero)
	fblt	%f0, %f2, fbgt_else.16499
	beqi	%v0, 0, bnei_else.16501
	addi	%v0, %zero, 0
	j	bnei_cont.16502
bnei_else.16501:
	addi	%v0, %zero, 1
bnei_cont.16502:
	j	fbgt_cont.16500
fbgt_else.16499:
fbgt_cont.16500:
	flw	%f2, 453(%zero)
	fblt	%f0, %f2, fbgt_else.16503
	fsub	%f0, %f1, %f0
	j	fbgt_cont.16504
fbgt_else.16503:
fbgt_cont.16504:
	flw	%f1, 452(%zero)
	fblt	%f1, %f0, fbgt_else.16505
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 448(%zero)
	flw	%f3, 447(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 446(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 445(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.16506
fbgt_else.16505:
	flw	%f1, 453(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 451(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 450(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 449(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.16506:
	beqi	%v0, 0, bnei_else.16507
	jr	%ra
bnei_else.16507:
	fneg	%f0, %f0
	jr	%ra
f.6155.10057:
	fblt	%f0, %f1, fbgt_else.16508
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16509
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16510
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16511
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16512
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16513
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16514
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16515
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16516
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16517
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16518
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16519
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16520
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16521
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16522
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.16523
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10057
fbgt_else.16523:
	fmov	%f0, %f1
	jr	%ra
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
g.6159.10061:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.16524
	fblt	%f0, %f1, fbgt_else.16525
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16526
	fblt	%f0, %f1, fbgt_else.16527
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16528
	fblt	%f0, %f1, fbgt_else.16529
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16530
	fblt	%f0, %f1, fbgt_else.16531
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16531:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16530:
	jr	%ra
fbgt_else.16529:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16532
	fblt	%f0, %f1, fbgt_else.16533
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16533:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16532:
	jr	%ra
fbgt_else.16528:
	jr	%ra
fbgt_else.16527:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16534
	fblt	%f0, %f1, fbgt_else.16535
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16536
	fblt	%f0, %f1, fbgt_else.16537
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16537:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16536:
	jr	%ra
fbgt_else.16535:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16538
	fblt	%f0, %f1, fbgt_else.16539
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16539:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16538:
	jr	%ra
fbgt_else.16534:
	jr	%ra
fbgt_else.16526:
	jr	%ra
fbgt_else.16525:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16540
	fblt	%f0, %f1, fbgt_else.16541
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16542
	fblt	%f0, %f1, fbgt_else.16543
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16544
	fblt	%f0, %f1, fbgt_else.16545
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16545:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16544:
	jr	%ra
fbgt_else.16543:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16546
	fblt	%f0, %f1, fbgt_else.16547
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16547:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16546:
	jr	%ra
fbgt_else.16542:
	jr	%ra
fbgt_else.16541:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16548
	fblt	%f0, %f1, fbgt_else.16549
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16550
	fblt	%f0, %f1, fbgt_else.16551
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16551:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16550:
	jr	%ra
fbgt_else.16549:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.16552
	fblt	%f0, %f1, fbgt_else.16553
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16553:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.16552:
	jr	%ra
fbgt_else.16548:
	jr	%ra
fbgt_else.16540:
	jr	%ra
fbgt_else.16524:
	jr	%ra
sin.2618:
	flw	%f1, 470(%zero)
	flw	%f2, 444(%zero)
	fblt	%f0, %f2, fbgt_else.16554
	addi	%v0, %zero, 1
	j	fbgt_cont.16555
fbgt_else.16554:
	addi	%v0, %zero, 0
fbgt_cont.16555:
	fabs	%f0, %f0
	flw	%f2, 469(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.16556
	flw	%f3, 468(%zero)
	fblt	%f0, %f3, fbgt_else.16558
	flw	%f3, 467(%zero)
	fblt	%f0, %f3, fbgt_else.16560
	flw	%f3, 466(%zero)
	fblt	%f0, %f3, fbgt_else.16562
	flw	%f3, 465(%zero)
	fblt	%f0, %f3, fbgt_else.16564
	flw	%f3, 464(%zero)
	fblt	%f0, %f3, fbgt_else.16566
	flw	%f3, 463(%zero)
	fblt	%f0, %f3, fbgt_else.16568
	flw	%f3, 462(%zero)
	fblt	%f0, %f3, fbgt_else.16570
	flw	%f3, 461(%zero)
	fblt	%f0, %f3, fbgt_else.16572
	flw	%f3, 460(%zero)
	fblt	%f0, %f3, fbgt_else.16574
	flw	%f3, 459(%zero)
	fblt	%f0, %f3, fbgt_else.16576
	flw	%f3, 458(%zero)
	fblt	%f0, %f3, fbgt_else.16578
	flw	%f3, 457(%zero)
	fblt	%f0, %f3, fbgt_else.16580
	flw	%f3, 456(%zero)
	fblt	%f0, %f3, fbgt_else.16582
	flw	%f3, 455(%zero)
	fblt	%f0, %f3, fbgt_else.16584
	flw	%f3, 454(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.6155.10057
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.16585
fbgt_else.16584:
	fmov	%f0, %f3
fbgt_cont.16585:
	j	fbgt_cont.16583
fbgt_else.16582:
	fmov	%f0, %f3
fbgt_cont.16583:
	j	fbgt_cont.16581
fbgt_else.16580:
	fmov	%f0, %f3
fbgt_cont.16581:
	j	fbgt_cont.16579
fbgt_else.16578:
	fmov	%f0, %f3
fbgt_cont.16579:
	j	fbgt_cont.16577
fbgt_else.16576:
	fmov	%f0, %f3
fbgt_cont.16577:
	j	fbgt_cont.16575
fbgt_else.16574:
	fmov	%f0, %f3
fbgt_cont.16575:
	j	fbgt_cont.16573
fbgt_else.16572:
	fmov	%f0, %f3
fbgt_cont.16573:
	j	fbgt_cont.16571
fbgt_else.16570:
	fmov	%f0, %f3
fbgt_cont.16571:
	j	fbgt_cont.16569
fbgt_else.16568:
	fmov	%f0, %f3
fbgt_cont.16569:
	j	fbgt_cont.16567
fbgt_else.16566:
	fmov	%f0, %f3
fbgt_cont.16567:
	j	fbgt_cont.16565
fbgt_else.16564:
	fmov	%f0, %f3
fbgt_cont.16565:
	j	fbgt_cont.16563
fbgt_else.16562:
	fmov	%f0, %f3
fbgt_cont.16563:
	j	fbgt_cont.16561
fbgt_else.16560:
	fmov	%f0, %f3
fbgt_cont.16561:
	j	fbgt_cont.16559
fbgt_else.16558:
	fmov	%f0, %f3
fbgt_cont.16559:
	j	fbgt_cont.16557
fbgt_else.16556:
	fmov	%f0, %f2
fbgt_cont.16557:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10061
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.16586
	fblt	%f2, %f0, fbgt_else.16588
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16590
	fblt	%f2, %f0, fbgt_else.16592
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16594
	fblt	%f2, %f0, fbgt_else.16596
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16597
fbgt_else.16596:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16597:
	j	fbgt_cont.16595
fbgt_else.16594:
	fmov	%f0, %f2
fbgt_cont.16595:
	j	fbgt_cont.16593
fbgt_else.16592:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16598
	fblt	%f2, %f0, fbgt_else.16600
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16601
fbgt_else.16600:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16601:
	j	fbgt_cont.16599
fbgt_else.16598:
	fmov	%f0, %f2
fbgt_cont.16599:
fbgt_cont.16593:
	j	fbgt_cont.16591
fbgt_else.16590:
	fmov	%f0, %f2
fbgt_cont.16591:
	j	fbgt_cont.16589
fbgt_else.16588:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16602
	fblt	%f2, %f0, fbgt_else.16604
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16606
	fblt	%f2, %f0, fbgt_else.16608
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16609
fbgt_else.16608:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16609:
	j	fbgt_cont.16607
fbgt_else.16606:
	fmov	%f0, %f2
fbgt_cont.16607:
	j	fbgt_cont.16605
fbgt_else.16604:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.16610
	fblt	%f2, %f0, fbgt_else.16612
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
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
	j	fbgt_cont.16613
fbgt_else.16612:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.16613:
	j	fbgt_cont.16611
fbgt_else.16610:
	fmov	%f0, %f2
fbgt_cont.16611:
fbgt_cont.16605:
	j	fbgt_cont.16603
fbgt_else.16602:
	fmov	%f0, %f2
fbgt_cont.16603:
fbgt_cont.16589:
	j	fbgt_cont.16587
fbgt_else.16586:
	fmov	%f0, %f2
fbgt_cont.16587:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.16614
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.16616
	addi	%v0, %zero, 0
	j	bnei_cont.16617
bnei_else.16616:
	addi	%v0, %zero, 1
bnei_cont.16617:
	j	fbgt_cont.16615
fbgt_else.16614:
	lw	%v0, 0(%sp)
fbgt_cont.16615:
	fblt	%f0, %f1, fbgt_else.16618
	fsub	%f0, %f0, %f1
	j	fbgt_cont.16619
fbgt_else.16618:
fbgt_cont.16619:
	flw	%f2, 453(%zero)
	fblt	%f0, %f2, fbgt_else.16620
	fsub	%f0, %f1, %f0
	j	fbgt_cont.16621
fbgt_else.16620:
fbgt_cont.16621:
	flw	%f1, 452(%zero)
	fblt	%f1, %f0, fbgt_else.16622
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 451(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 450(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 449(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.16623
fbgt_else.16622:
	flw	%f1, 453(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 448(%zero)
	flw	%f3, 447(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 446(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 445(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.16623:
	beqi	%v0, 0, bnei_else.16624
	jr	%ra
bnei_else.16624:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2622:
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
	blti	%v0, 10, bgti_else.16632
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
bgti_else.16632:
	add	%v0, %zero, %v1
	jr	%ra
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
print_int_sub2.2625:
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
	blti	%v0, 10, bgti_else.16640
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
bgti_else.16640:
	jr	%ra
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
print_int.2627:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.16641
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.16643
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16645
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16647
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16649
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16651
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16653
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.16654
bgti_else.16653:
	addi	%v0, %zero, 6
bgti_cont.16654:
	j	bgti_cont.16652
bgti_else.16651:
	addi	%v0, %zero, 5
bgti_cont.16652:
	j	bgti_cont.16650
bgti_else.16649:
	addi	%v0, %zero, 4
bgti_cont.16650:
	j	bgti_cont.16648
bgti_else.16647:
	addi	%v0, %zero, 3
bgti_cont.16648:
	j	bgti_cont.16646
bgti_else.16645:
	addi	%v0, %zero, 2
bgti_cont.16646:
	j	bgti_cont.16644
bgti_else.16643:
	addi	%v0, %zero, 1
bgti_cont.16644:
	j	bgti_cont.16642
bgti_else.16641:
	addi	%v0, %zero, 0
bgti_cont.16642:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.16655
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16657
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16659
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16661
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16663
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16665
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16667
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.16668
bgti_else.16667:
	add	%v0, %zero, %v1
bgti_cont.16668:
	j	bgti_cont.16666
bgti_else.16665:
	add	%v0, %zero, %v1
bgti_cont.16666:
	j	bgti_cont.16664
bgti_else.16663:
	add	%v0, %zero, %v1
bgti_cont.16664:
	j	bgti_cont.16662
bgti_else.16661:
	add	%v0, %zero, %v1
bgti_cont.16662:
	j	bgti_cont.16660
bgti_else.16659:
	add	%v0, %zero, %v1
bgti_cont.16660:
	j	bgti_cont.16658
bgti_else.16657:
	add	%v0, %zero, %v1
bgti_cont.16658:
	j	bgti_cont.16656
bgti_else.16655:
	add	%v0, %zero, %v1
bgti_cont.16656:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.16669
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.16669:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.16670
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.16672
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16674
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16676
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16678
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16680
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.16682
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.16683
bgti_else.16682:
	addi	%v0, %zero, 6
bgti_cont.16683:
	j	bgti_cont.16681
bgti_else.16680:
	addi	%v0, %zero, 5
bgti_cont.16681:
	j	bgti_cont.16679
bgti_else.16678:
	addi	%v0, %zero, 4
bgti_cont.16679:
	j	bgti_cont.16677
bgti_else.16676:
	addi	%v0, %zero, 3
bgti_cont.16677:
	j	bgti_cont.16675
bgti_else.16674:
	addi	%v0, %zero, 2
bgti_cont.16675:
	j	bgti_cont.16673
bgti_else.16672:
	addi	%v0, %zero, 1
bgti_cont.16673:
	j	bgti_cont.16671
bgti_else.16670:
	addi	%v0, %zero, 0
bgti_cont.16671:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.16684
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16686
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16688
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16690
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16692
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16694
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16696
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.16697
bgti_else.16696:
	add	%v0, %zero, %v1
bgti_cont.16697:
	j	bgti_cont.16695
bgti_else.16694:
	add	%v0, %zero, %v1
bgti_cont.16695:
	j	bgti_cont.16693
bgti_else.16692:
	add	%v0, %zero, %v1
bgti_cont.16693:
	j	bgti_cont.16691
bgti_else.16690:
	add	%v0, %zero, %v1
bgti_cont.16691:
	j	bgti_cont.16689
bgti_else.16688:
	add	%v0, %zero, %v1
bgti_cont.16689:
	j	bgti_cont.16687
bgti_else.16686:
	add	%v0, %zero, %v1
bgti_cont.16687:
	j	bgti_cont.16685
bgti_else.16684:
	add	%v0, %zero, %v1
bgti_cont.16685:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.16698
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.16698:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.16699
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16701
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16703
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16705
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16707
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16709
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.16711
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.16712
bgti_else.16711:
	add	%v0, %zero, %v1
bgti_cont.16712:
	j	bgti_cont.16710
bgti_else.16709:
	add	%v0, %zero, %v1
bgti_cont.16710:
	j	bgti_cont.16708
bgti_else.16707:
	add	%v0, %zero, %v1
bgti_cont.16708:
	j	bgti_cont.16706
bgti_else.16705:
	add	%v0, %zero, %v1
bgti_cont.16706:
	j	bgti_cont.16704
bgti_else.16703:
	add	%v0, %zero, %v1
bgti_cont.16704:
	j	bgti_cont.16702
bgti_else.16701:
	add	%v0, %zero, %v1
bgti_cont.16702:
	j	bgti_cont.16700
bgti_else.16699:
	add	%v0, %zero, %v1
bgti_cont.16700:
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
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16713
	addi	%a0, %zero, 1
	j	fbeq_cont.16714
fbeq_else.16713:
	addi	%a0, %zero, 0
fbeq_cont.16714:
	beqi	%a0, 0, bnei_else.16715
	flw	%f0, 448(%zero)
	j	bnei_cont.16716
bnei_else.16715:
	beqi	%v1, 0, bnei_else.16717
	flw	%f1, 443(%zero)
	fdiv	%f0, %f1, %f0
	j	bnei_cont.16718
bnei_else.16717:
	flw	%f1, 448(%zero)
	fdiv	%f0, %f1, %f0
bnei_cont.16718:
bnei_cont.16716:
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
	flw	%f1, 442(%zero)
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
	flw	%f1, 442(%zero)
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
	flw	%f3, 441(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 160
	fsw	%f2, 0(%v0)
	flw	%f2, 440(%zero)
	flw	%f3, 2(%sp)
	fmul	%f2, %f3, %f2
	addi	%v0, %zero, 160
	fsw	%f2, 1(%v0)
	flw	%f2, 4(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 441(%zero)
	fmul	%f4, %f4, %f5
	addi	%v0, %zero, 160
	fsw	%f4, 2(%v0)
	addi	%v0, %zero, 154
	fsw	%f2, 0(%v0)
	flw	%f4, 444(%zero)
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
	flw	%f1, 442(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2618
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
	flw	%f1, 442(%zero)
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
	addi	%v0, %zero, 67
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2616
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
	flw	%f12, 471(%zero)
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
	flw	%f12, 471(%zero)
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
	flw	%f0, 471(%zero)
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
	beqi	%v0, -1, bnei_else.16724
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.16725
	addi	%v0, %zero, 0
	j	fbgt_cont.16726
fbgt_else.16725:
	addi	%v0, %zero, 1
fbgt_cont.16726:
	addi	%v1, %zero, 2
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 4(%sp)
	beqi	%v1, 0, bnei_else.16727
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 442(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 442(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 442(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 10(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.16728
bnei_else.16727:
bnei_cont.16728:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.16729
	lw	%a0, 7(%sp)
	j	bnei_cont.16730
bnei_else.16729:
	addi	%a0, %zero, 1
bnei_cont.16730:
	addi	%a1, %zero, 4
	flw	%f0, 444(%zero)
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
	beqi	%a2, 3, bnei_else.16731
	beqi	%a2, 2, bnei_else.16733
	j	bnei_cont.16734
bnei_else.16733:
	lw	%v1, 7(%sp)
	beqi	%v1, 0, bnei_else.16735
	addi	%v1, %zero, 0
	j	bnei_cont.16736
bnei_else.16735:
	addi	%v1, %zero, 1
bnei_cont.16736:
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.16734:
	j	bnei_cont.16732
bnei_else.16731:
	flw	%f0, 0(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16737
	addi	%v1, %zero, 1
	j	fbeq_cont.16738
fbeq_else.16737:
	addi	%v1, %zero, 0
fbeq_cont.16738:
	beqi	%v1, 0, bnei_else.16739
	flw	%f0, 444(%zero)
	j	bnei_cont.16740
bnei_else.16739:
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16741
	addi	%v1, %zero, 1
	j	fbeq_cont.16742
fbeq_else.16741:
	addi	%v1, %zero, 0
fbeq_cont.16742:
	beqi	%v1, 0, bnei_else.16743
	flw	%f1, 444(%zero)
	j	bnei_cont.16744
bnei_else.16743:
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.16745
	addi	%v1, %zero, 0
	j	fbgt_cont.16746
fbgt_else.16745:
	addi	%v1, %zero, 1
fbgt_cont.16746:
	beqi	%v1, 0, bnei_else.16747
	flw	%f1, 448(%zero)
	j	bnei_cont.16748
bnei_else.16747:
	flw	%f1, 443(%zero)
bnei_cont.16748:
bnei_cont.16744:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16740:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16749
	addi	%v1, %zero, 1
	j	fbeq_cont.16750
fbeq_else.16749:
	addi	%v1, %zero, 0
fbeq_cont.16750:
	beqi	%v1, 0, bnei_else.16751
	flw	%f0, 444(%zero)
	j	bnei_cont.16752
bnei_else.16751:
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16753
	addi	%v1, %zero, 1
	j	fbeq_cont.16754
fbeq_else.16753:
	addi	%v1, %zero, 0
fbeq_cont.16754:
	beqi	%v1, 0, bnei_else.16755
	flw	%f1, 444(%zero)
	j	bnei_cont.16756
bnei_else.16755:
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.16757
	addi	%v1, %zero, 0
	j	fbgt_cont.16758
fbgt_else.16757:
	addi	%v1, %zero, 1
fbgt_cont.16758:
	beqi	%v1, 0, bnei_else.16759
	flw	%f1, 448(%zero)
	j	bnei_cont.16760
bnei_else.16759:
	flw	%f1, 443(%zero)
bnei_cont.16760:
bnei_cont.16756:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16752:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16761
	addi	%v1, %zero, 1
	j	fbeq_cont.16762
fbeq_else.16761:
	addi	%v1, %zero, 0
fbeq_cont.16762:
	beqi	%v1, 0, bnei_else.16763
	flw	%f0, 444(%zero)
	j	bnei_cont.16764
bnei_else.16763:
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16765
	addi	%v1, %zero, 1
	j	fbeq_cont.16766
fbeq_else.16765:
	addi	%v1, %zero, 0
fbeq_cont.16766:
	beqi	%v1, 0, bnei_else.16767
	flw	%f1, 444(%zero)
	j	bnei_cont.16768
bnei_else.16767:
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.16769
	addi	%v1, %zero, 0
	j	fbgt_cont.16770
fbgt_else.16769:
	addi	%v1, %zero, 1
fbgt_cont.16770:
	beqi	%v1, 0, bnei_else.16771
	flw	%f1, 448(%zero)
	j	bnei_cont.16772
bnei_else.16771:
	flw	%f1, 443(%zero)
bnei_cont.16772:
bnei_cont.16768:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.16764:
	fsw	%f0, 2(%a0)
bnei_cont.16732:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.16773
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.16774
bnei_else.16773:
bnei_cont.16774:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16724:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2765:
	blti	%v0, 60, bgti_else.16775
	jr	%ra
bgti_else.16775:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.16777
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16778
	jr	%ra
bgti_else.16778:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2763
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.16780
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16781
	jr	%ra
bgti_else.16781:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2763
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.16783
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.16784
	jr	%ra
bgti_else.16784:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2763
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.16786
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
bnei_else.16786:
	addi	%v0, %zero, 0
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16783:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16780:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.16777:
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
	beqi	%v0, -1, bnei_else.16791
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16792
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.16794
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, -1, bnei_else.16796
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
	j	bnei_cont.16797
bnei_else.16796:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16797:
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16795
bnei_else.16794:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16795:
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.16793
bnei_else.16792:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16793:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.16791:
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
	beqi	%v0, -1, bnei_else.16798
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, -1, bnei_else.16800
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16802
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
	j	bnei_cont.16803
bnei_else.16802:
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16803:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16801
bnei_else.16800:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16801:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.16799
bnei_else.16798:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
bnei_cont.16799:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.16804
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.16805
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, -1, bnei_else.16807
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
	j	bnei_cont.16808
bnei_else.16807:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.16808:
	lw	%v1, 6(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.16806
bnei_else.16805:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
bnei_cont.16806:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.16809
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
	j	bnei_cont.16810
bnei_else.16809:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.16810:
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.16804:
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
	beqi	%v0, -1, bnei_else.16811
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, -1, bnei_else.16813
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.16815
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
	j	bnei_cont.16816
bnei_else.16815:
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16816:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.16814
bnei_else.16813:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16814:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.16812
bnei_else.16811:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.16812:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.16817
	addi	%v1, %zero, 72
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
	beqi	%v0, -1, bnei_else.16818
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.16820
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
	j	bnei_cont.16821
bnei_else.16820:
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.16821:
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.16819
bnei_else.16818:
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.16819:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.16822
	addi	%v1, %zero, 72
	lw	%a0, 4(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
bnei_else.16822:
	jr	%ra
bnei_else.16817:
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 444(%zero)
	fbne	%f3, %f4, fbeq_else.16825
	addi	%a3, %zero, 1
	j	fbeq_cont.16826
fbeq_else.16825:
	addi	%a3, %zero, 0
fbeq_cont.16826:
	beqi	%a3, 0, bnei_else.16827
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16827:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 444(%zero)
	fblt	%f3, %f4, fbgt_else.16828
	addi	%t0, %zero, 0
	j	fbgt_cont.16829
fbgt_else.16828:
	addi	%t0, %zero, 1
fbgt_cont.16829:
	beqi	%v0, 0, bnei_else.16830
	beqi	%t0, 0, bnei_else.16832
	addi	%v0, %zero, 0
	j	bnei_cont.16833
bnei_else.16832:
	addi	%v0, %zero, 1
bnei_cont.16833:
	j	bnei_cont.16831
bnei_else.16830:
	add	%v0, %zero, %t0
bnei_cont.16831:
	add	%at, %a3, %a0
	flw	%f3, 0(%at)
	beqi	%v0, 0, bnei_else.16834
	j	bnei_cont.16835
bnei_else.16834:
	fneg	%f3, %f3
bnei_cont.16835:
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
	fblt	%f1, %f3, fbgt_else.16836
	addi	%v0, %zero, 0
	j	fbgt_cont.16837
fbgt_else.16836:
	addi	%v0, %zero, 1
fbgt_cont.16837:
	beqi	%v0, 0, bnei_else.16838
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.16839
	addi	%v0, %zero, 0
	j	fbgt_cont.16840
fbgt_else.16839:
	addi	%v0, %zero, 1
fbgt_cont.16840:
	beqi	%v0, 0, bnei_else.16841
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16841:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16838:
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
	flw	%f4, 444(%zero)
	fblt	%f4, %f3, fbgt_else.16842
	addi	%v1, %zero, 0
	j	fbgt_cont.16843
fbgt_else.16842:
	addi	%v1, %zero, 1
fbgt_cont.16843:
	beqi	%v1, 0, bnei_else.16844
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
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16844:
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
	beqi	%v1, 0, bnei_else.16845
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
bnei_else.16845:
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
	beqi	%v1, 0, bnei_else.16846
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
	flw	%f1, 447(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	jr	%ra
bnei_else.16846:
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
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16847
	addi	%v0, %zero, 1
	j	fbeq_cont.16848
fbeq_else.16847:
	addi	%v0, %zero, 0
fbeq_cont.16848:
	beqi	%v0, 0, bnei_else.16849
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16849:
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
	beqi	%v1, 3, bnei_else.16850
	j	bnei_cont.16851
bnei_else.16850:
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16851:
	flw	%f1, 6(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 5(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 444(%zero)
	fblt	%f2, %f0, fbgt_else.16852
	addi	%v1, %zero, 0
	j	fbgt_cont.16853
fbgt_else.16852:
	addi	%v1, %zero, 1
fbgt_cont.16853:
	beqi	%v1, 0, bnei_else.16854
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16855
	j	bnei_cont.16856
bnei_else.16855:
	fneg	%f0, %f0
bnei_cont.16856:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16854:
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
	addi	%a1, %zero, 1
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
	beqi	%a0, 1, bnei_else.16857
	beqi	%a0, 2, bnei_else.16858
	j	solver_second.2811
bnei_else.16858:
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
	flw	%f4, 444(%zero)
	fblt	%f4, %f3, fbgt_else.16859
	addi	%v1, %zero, 0
	j	fbgt_cont.16860
fbgt_else.16859:
	addi	%v1, %zero, 1
fbgt_cont.16860:
	beqi	%v1, 0, bnei_else.16861
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
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16861:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16857:
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
	beqi	%v0, 0, bnei_else.16862
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16862:
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
	beqi	%v0, 0, bnei_else.16863
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.16863:
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
	beqi	%v0, 0, bnei_else.16864
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.16864:
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
	fblt	%f4, %f5, fbgt_else.16865
	addi	%a1, %zero, 0
	j	fbgt_cont.16866
fbgt_else.16865:
	addi	%a1, %zero, 1
fbgt_cont.16866:
	beqi	%a1, 0, bnei_else.16867
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fblt	%f4, %f5, fbgt_else.16869
	addi	%a1, %zero, 0
	j	fbgt_cont.16870
fbgt_else.16869:
	addi	%a1, %zero, 1
fbgt_cont.16870:
	beqi	%a1, 0, bnei_else.16871
	flw	%f4, 1(%a0)
	flw	%f5, 444(%zero)
	fbne	%f4, %f5, fbeq_else.16873
	addi	%a1, %zero, 1
	j	fbeq_cont.16874
fbeq_else.16873:
	addi	%a1, %zero, 0
fbeq_cont.16874:
	beqi	%a1, 0, bnei_else.16875
	addi	%a1, %zero, 0
	j	bnei_cont.16876
bnei_else.16875:
	addi	%a1, %zero, 1
bnei_cont.16876:
	j	bnei_cont.16872
bnei_else.16871:
	addi	%a1, %zero, 0
bnei_cont.16872:
	j	bnei_cont.16868
bnei_else.16867:
	addi	%a1, %zero, 0
bnei_cont.16868:
	beqi	%a1, 0, bnei_else.16877
	addi	%v0, %zero, 124
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16877:
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
	fblt	%f4, %f5, fbgt_else.16878
	addi	%a1, %zero, 0
	j	fbgt_cont.16879
fbgt_else.16878:
	addi	%a1, %zero, 1
fbgt_cont.16879:
	beqi	%a1, 0, bnei_else.16880
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fblt	%f4, %f5, fbgt_else.16882
	addi	%a1, %zero, 0
	j	fbgt_cont.16883
fbgt_else.16882:
	addi	%a1, %zero, 1
fbgt_cont.16883:
	beqi	%a1, 0, bnei_else.16884
	flw	%f4, 3(%a0)
	flw	%f5, 444(%zero)
	fbne	%f4, %f5, fbeq_else.16886
	addi	%a1, %zero, 1
	j	fbeq_cont.16887
fbeq_else.16886:
	addi	%a1, %zero, 0
fbeq_cont.16887:
	beqi	%a1, 0, bnei_else.16888
	addi	%a1, %zero, 0
	j	bnei_cont.16889
bnei_else.16888:
	addi	%a1, %zero, 1
bnei_cont.16889:
	j	bnei_cont.16885
bnei_else.16884:
	addi	%a1, %zero, 0
bnei_cont.16885:
	j	bnei_cont.16881
bnei_else.16880:
	addi	%a1, %zero, 0
bnei_cont.16881:
	beqi	%a1, 0, bnei_else.16890
	addi	%v0, %zero, 124
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.16890:
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
	fblt	%f0, %f3, fbgt_else.16891
	addi	%a1, %zero, 0
	j	fbgt_cont.16892
fbgt_else.16891:
	addi	%a1, %zero, 1
fbgt_cont.16892:
	beqi	%a1, 0, bnei_else.16893
	flw	%f0, 1(%v1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.16895
	addi	%v0, %zero, 0
	j	fbgt_cont.16896
fbgt_else.16895:
	addi	%v0, %zero, 1
fbgt_cont.16896:
	beqi	%v0, 0, bnei_else.16897
	flw	%f0, 5(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16899
	addi	%v0, %zero, 1
	j	fbeq_cont.16900
fbeq_else.16899:
	addi	%v0, %zero, 0
fbeq_cont.16900:
	beqi	%v0, 0, bnei_else.16901
	addi	%v0, %zero, 0
	j	bnei_cont.16902
bnei_else.16901:
	addi	%v0, %zero, 1
bnei_cont.16902:
	j	bnei_cont.16898
bnei_else.16897:
	addi	%v0, %zero, 0
bnei_cont.16898:
	j	bnei_cont.16894
bnei_else.16893:
	addi	%v0, %zero, 0
bnei_cont.16894:
	beqi	%v0, 0, bnei_else.16903
	addi	%v0, %zero, 124
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.16903:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	flw	%f4, 444(%zero)
	fbne	%f3, %f4, fbeq_else.16904
	addi	%a0, %zero, 1
	j	fbeq_cont.16905
fbeq_else.16904:
	addi	%a0, %zero, 0
fbeq_cont.16905:
	beqi	%a0, 0, bnei_else.16906
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16906:
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
	beqi	%v1, 3, bnei_else.16907
	j	bnei_cont.16908
bnei_else.16907:
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16908:
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 1(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 444(%zero)
	fblt	%f2, %f0, fbgt_else.16909
	addi	%v1, %zero, 0
	j	fbgt_cont.16910
fbgt_else.16909:
	addi	%v1, %zero, 1
fbgt_cont.16910:
	beqi	%v1, 0, bnei_else.16911
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16912
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	bnei_cont.16913
bnei_else.16912:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
bnei_cont.16913:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16911:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	flw	%f4, 444(%zero)
	fbne	%f3, %f4, fbeq_else.16914
	addi	%a1, %zero, 1
	j	fbeq_cont.16915
fbeq_else.16914:
	addi	%a1, %zero, 0
fbeq_cont.16915:
	beqi	%a1, 0, bnei_else.16916
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16916:
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
	flw	%f2, 444(%zero)
	fblt	%f2, %f1, fbgt_else.16917
	addi	%a0, %zero, 0
	j	fbgt_cont.16918
fbgt_else.16917:
	addi	%a0, %zero, 1
fbgt_cont.16918:
	beqi	%a0, 0, bnei_else.16919
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.16920
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	bnei_cont.16921
bnei_else.16920:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
bnei_cont.16921:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16919:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2858:
	addi	%a0, %zero, 1
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
	beqi	%a2, 1, bnei_else.16922
	beqi	%a2, 2, bnei_else.16923
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	j	solver_second_fast2.2851
bnei_else.16923:
	flw	%f0, 0(%v0)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.16924
	addi	%v1, %zero, 0
	j	fbgt_cont.16925
fbgt_else.16924:
	addi	%v1, %zero, 1
fbgt_cont.16925:
	beqi	%v1, 0, bnei_else.16926
	flw	%f0, 0(%v0)
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.16926:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.16922:
	lw	%v1, 0(%v1)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	j	solver_rect_fast.2821
setup_rect_table.2861:
	addi	%a0, %zero, 6
	flw	%f0, 444(%zero)
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
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16927
	addi	%a0, %zero, 1
	j	fbeq_cont.16928
fbeq_else.16927:
	addi	%a0, %zero, 0
fbeq_cont.16928:
	beqi	%a0, 0, bnei_else.16929
	flw	%f0, 444(%zero)
	fsw	%f0, 1(%v0)
	j	bnei_cont.16930
bnei_else.16929:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.16931
	addi	%a2, %zero, 0
	j	fbgt_cont.16932
fbgt_else.16931:
	addi	%a2, %zero, 1
fbgt_cont.16932:
	beqi	%a1, 0, bnei_else.16933
	beqi	%a2, 0, bnei_else.16935
	addi	%a1, %zero, 0
	j	bnei_cont.16936
bnei_else.16935:
	addi	%a1, %zero, 1
bnei_cont.16936:
	j	bnei_cont.16934
bnei_else.16933:
	add	%a1, %zero, %a2
bnei_cont.16934:
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	beqi	%a1, 0, bnei_else.16937
	j	bnei_cont.16938
bnei_else.16937:
	fneg	%f0, %f0
bnei_cont.16938:
	fsw	%f0, 0(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
bnei_cont.16930:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16939
	addi	%a0, %zero, 1
	j	fbeq_cont.16940
fbeq_else.16939:
	addi	%a0, %zero, 0
fbeq_cont.16940:
	beqi	%a0, 0, bnei_else.16941
	flw	%f0, 444(%zero)
	fsw	%f0, 3(%v0)
	j	bnei_cont.16942
bnei_else.16941:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.16943
	addi	%a2, %zero, 0
	j	fbgt_cont.16944
fbgt_else.16943:
	addi	%a2, %zero, 1
fbgt_cont.16944:
	beqi	%a1, 0, bnei_else.16945
	beqi	%a2, 0, bnei_else.16947
	addi	%a1, %zero, 0
	j	bnei_cont.16948
bnei_else.16947:
	addi	%a1, %zero, 1
bnei_cont.16948:
	j	bnei_cont.16946
bnei_else.16945:
	add	%a1, %zero, %a2
bnei_cont.16946:
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	beqi	%a1, 0, bnei_else.16949
	j	bnei_cont.16950
bnei_else.16949:
	fneg	%f0, %f0
bnei_cont.16950:
	fsw	%f0, 2(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 1(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
bnei_cont.16942:
	flw	%f0, 2(%v1)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16951
	addi	%a0, %zero, 1
	j	fbeq_cont.16952
fbeq_else.16951:
	addi	%a0, %zero, 0
fbeq_cont.16952:
	beqi	%a0, 0, bnei_else.16953
	flw	%f0, 444(%zero)
	fsw	%f0, 5(%v0)
	j	bnei_cont.16954
bnei_else.16953:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 2(%v1)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.16955
	addi	%a2, %zero, 0
	j	fbgt_cont.16956
fbgt_else.16955:
	addi	%a2, %zero, 1
fbgt_cont.16956:
	beqi	%a1, 0, bnei_else.16957
	beqi	%a2, 0, bnei_else.16959
	addi	%a1, %zero, 0
	j	bnei_cont.16960
bnei_else.16959:
	addi	%a1, %zero, 1
bnei_cont.16960:
	j	bnei_cont.16958
bnei_else.16957:
	add	%a1, %zero, %a2
bnei_cont.16958:
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	beqi	%a1, 0, bnei_else.16961
	j	bnei_cont.16962
bnei_else.16961:
	fneg	%f0, %f0
bnei_cont.16962:
	fsw	%f0, 4(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
bnei_cont.16954:
	jr	%ra
setup_surface_table.2864:
	addi	%a0, %zero, 4
	flw	%f0, 444(%zero)
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
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.16963
	addi	%v1, %zero, 0
	j	fbgt_cont.16964
fbgt_else.16963:
	addi	%v1, %zero, 1
fbgt_cont.16964:
	beqi	%v1, 0, bnei_else.16965
	flw	%f1, 443(%zero)
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
	j	bnei_cont.16966
bnei_else.16965:
	flw	%f0, 444(%zero)
	fsw	%f0, 0(%v0)
bnei_cont.16966:
	jr	%ra
setup_second_table.2867:
	addi	%a0, %zero, 5
	flw	%f0, 444(%zero)
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
	beqi	%a1, 0, bnei_else.16967
	flw	%f4, 2(%v0)
	lw	%a1, 9(%v1)
	flw	%f5, 1(%a1)
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%v0)
	lw	%a1, 9(%v1)
	flw	%f6, 2(%a1)
	fmul	%f5, %f5, %f6
	fadd	%f4, %f4, %f5
	flw	%f5, 447(%zero)
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
	flw	%f4, 447(%zero)
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
	flw	%f2, 447(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f3, %f1
	fsw	%f1, 3(%a0)
	j	bnei_cont.16968
bnei_else.16967:
	fsw	%f1, 1(%a0)
	fsw	%f2, 2(%a0)
	fsw	%f3, 3(%a0)
bnei_cont.16968:
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16969
	addi	%v0, %zero, 1
	j	fbeq_cont.16970
fbeq_else.16969:
	addi	%v0, %zero, 0
fbeq_cont.16970:
	beqi	%v0, 0, bnei_else.16971
	j	bnei_cont.16972
bnei_else.16971:
	flw	%f1, 448(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%a0)
bnei_cont.16972:
	add	%v0, %zero, %a0
	jr	%ra
iter_setup_dirvec_constants.2870:
	blti	%v1, 0, bgti_else.16973
	addi	%a0, %zero, 1
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.16974
	beqi	%a3, 2, bnei_else.16976
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
	j	bnei_cont.16977
bnei_else.16976:
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
bnei_cont.16977:
	j	bnei_cont.16975
bnei_else.16974:
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
bnei_cont.16975:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.16978
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.16979
	beqi	%a3, 2, bnei_else.16981
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
	j	bnei_cont.16982
bnei_else.16981:
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
bnei_cont.16982:
	j	bnei_cont.16980
bnei_else.16979:
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
bnei_cont.16980:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.16978:
	jr	%ra
bgti_else.16973:
	jr	%ra
setup_startp_constants.2875:
	blti	%v1, 0, bgti_else.16985
	addi	%a0, %zero, 1
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
	beqi	%a2, 2, bnei_else.16986
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.16988
	j	bgt_cont.16989
bgt_else.16988:
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
	beqi	%v0, 3, bnei_else.16990
	j	bnei_cont.16991
bnei_else.16990:
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.16991:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.16989:
	j	bnei_cont.16987
bnei_else.16986:
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
bnei_cont.16987:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.16985:
	jr	%ra
is_rect_outside.2880:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.16993
	addi	%v1, %zero, 0
	j	fbgt_cont.16994
fbgt_else.16993:
	addi	%v1, %zero, 1
fbgt_cont.16994:
	beqi	%v1, 0, bnei_else.16995
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.16997
	addi	%v1, %zero, 0
	j	fbgt_cont.16998
fbgt_else.16997:
	addi	%v1, %zero, 1
fbgt_cont.16998:
	beqi	%v1, 0, bnei_else.16999
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.17001
	addi	%v1, %zero, 0
	j	fbgt_cont.17002
fbgt_else.17001:
	addi	%v1, %zero, 1
fbgt_cont.17002:
	j	bnei_cont.17000
bnei_else.16999:
	addi	%v1, %zero, 0
bnei_cont.17000:
	j	bnei_cont.16996
bnei_else.16995:
	addi	%v1, %zero, 0
bnei_cont.16996:
	beqi	%v1, 0, bnei_else.17003
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.17003:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17004
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17004:
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
	beqi	%v1, 1, bnei_else.17005
	beqi	%v1, 2, bnei_else.17006
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.17007
	j	bnei_cont.17008
bnei_else.17007:
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.17008:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17009
	addi	%v1, %zero, 0
	j	fbgt_cont.17010
fbgt_else.17009:
	addi	%v1, %zero, 1
fbgt_cont.17010:
	beqi	%v0, 0, bnei_else.17011
	beqi	%v1, 0, bnei_else.17013
	addi	%v0, %zero, 0
	j	bnei_cont.17014
bnei_else.17013:
	addi	%v0, %zero, 1
bnei_cont.17014:
	j	bnei_cont.17012
bnei_else.17011:
	add	%v0, %zero, %v1
bnei_cont.17012:
	beqi	%v0, 0, bnei_else.17015
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17015:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17006:
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17016
	addi	%v1, %zero, 0
	j	fbgt_cont.17017
fbgt_else.17016:
	addi	%v1, %zero, 1
fbgt_cont.17017:
	beqi	%v0, 0, bnei_else.17018
	beqi	%v1, 0, bnei_else.17020
	addi	%v0, %zero, 0
	j	bnei_cont.17021
bnei_else.17020:
	addi	%v0, %zero, 1
bnei_cont.17021:
	j	bnei_cont.17019
bnei_else.17018:
	add	%v0, %zero, %v1
bnei_cont.17019:
	beqi	%v0, 0, bnei_else.17022
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17022:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17005:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.17023
	addi	%v1, %zero, 0
	j	fbgt_cont.17024
fbgt_else.17023:
	addi	%v1, %zero, 1
fbgt_cont.17024:
	beqi	%v1, 0, bnei_else.17025
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.17027
	addi	%v1, %zero, 0
	j	fbgt_cont.17028
fbgt_else.17027:
	addi	%v1, %zero, 1
fbgt_cont.17028:
	beqi	%v1, 0, bnei_else.17029
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.17031
	addi	%v1, %zero, 0
	j	fbgt_cont.17032
fbgt_else.17031:
	addi	%v1, %zero, 1
fbgt_cont.17032:
	j	bnei_cont.17030
bnei_else.17029:
	addi	%v1, %zero, 0
bnei_cont.17030:
	j	bnei_cont.17026
bnei_else.17025:
	addi	%v1, %zero, 0
bnei_cont.17026:
	beqi	%v1, 0, bnei_else.17033
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.17033:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17034
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17034:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17035
	addi	%a1, %zero, 1
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
	beqi	%a1, 1, bnei_else.17036
	beqi	%a1, 2, bnei_else.17038
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
	beqi	%v1, 3, bnei_else.17040
	j	bnei_cont.17041
bnei_else.17040:
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.17041:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17042
	addi	%v1, %zero, 0
	j	fbgt_cont.17043
fbgt_else.17042:
	addi	%v1, %zero, 1
fbgt_cont.17043:
	beqi	%v0, 0, bnei_else.17044
	beqi	%v1, 0, bnei_else.17046
	addi	%v0, %zero, 0
	j	bnei_cont.17047
bnei_else.17046:
	addi	%v0, %zero, 1
bnei_cont.17047:
	j	bnei_cont.17045
bnei_else.17044:
	add	%v0, %zero, %v1
bnei_cont.17045:
	beqi	%v0, 0, bnei_else.17048
	addi	%v0, %zero, 0
	j	bnei_cont.17049
bnei_else.17048:
	addi	%v0, %zero, 1
bnei_cont.17049:
	j	bnei_cont.17039
bnei_else.17038:
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
	flw	%f4, 444(%zero)
	fblt	%f3, %f4, fbgt_else.17050
	addi	%a1, %zero, 0
	j	fbgt_cont.17051
fbgt_else.17050:
	addi	%a1, %zero, 1
fbgt_cont.17051:
	beqi	%a0, 0, bnei_else.17052
	beqi	%a1, 0, bnei_else.17054
	addi	%a0, %zero, 0
	j	bnei_cont.17055
bnei_else.17054:
	addi	%a0, %zero, 1
bnei_cont.17055:
	j	bnei_cont.17053
bnei_else.17052:
	add	%a0, %zero, %a1
bnei_cont.17053:
	beqi	%a0, 0, bnei_else.17056
	addi	%v0, %zero, 0
	j	bnei_cont.17057
bnei_else.17056:
	addi	%v0, %zero, 1
bnei_cont.17057:
bnei_cont.17039:
	j	bnei_cont.17037
bnei_else.17036:
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	is_rect_outside.2880
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.17037:
	beqi	%v0, 0, bnei_else.17058
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17058:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17059
	addi	%a1, %zero, 1
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
	beqi	%v0, 0, bnei_else.17060
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17060:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
bnei_else.17059:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17035:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17061
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 127
	flw	%f0, 0(%a2)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f0, %f0, %f1
	addi	%a2, %zero, 127
	flw	%f1, 1(%a2)
	lw	%a2, 5(%a1)
	flw	%f2, 1(%a2)
	fsub	%f1, %f1, %f2
	addi	%a2, %zero, 127
	flw	%f2, 2(%a2)
	lw	%a2, 5(%a1)
	flw	%f3, 2(%a2)
	fsub	%f2, %f2, %f3
	addi	%a2, %zero, 174
	add	%at, %a2, %a0
	lw	%a2, 0(%at)
	lw	%a3, 1(%a1)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	beqi	%a3, 1, bnei_else.17062
	beqi	%a3, 2, bnei_else.17064
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17065
bnei_else.17064:
	flw	%f3, 0(%a2)
	flw	%f4, 444(%zero)
	fblt	%f3, %f4, fbgt_else.17066
	addi	%a1, %zero, 0
	j	fbgt_cont.17067
fbgt_else.17066:
	addi	%a1, %zero, 1
fbgt_cont.17067:
	beqi	%a1, 0, bnei_else.17068
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 124
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.17069
bnei_else.17068:
	addi	%v0, %zero, 0
bnei_cont.17069:
bnei_cont.17065:
	j	bnei_cont.17063
bnei_else.17062:
	addi	%a3, %zero, 171
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17063:
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	beqi	%v0, 0, bnei_else.17070
	flw	%f1, 439(%zero)
	fblt	%f0, %f1, fbgt_else.17072
	addi	%v0, %zero, 0
	j	fbgt_cont.17073
fbgt_else.17072:
	addi	%v0, %zero, 1
fbgt_cont.17073:
	j	bnei_cont.17071
bnei_else.17070:
	addi	%v0, %zero, 0
bnei_cont.17071:
	beqi	%v0, 0, bnei_else.17074
	flw	%f1, 438(%zero)
	fadd	%f0, %f0, %f1
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
	lw	%v1, 0(%sp)
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.17075
	addi	%a0, %zero, 1
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
	beqi	%v0, 0, bnei_else.17077
	addi	%v0, %zero, 0
	j	bnei_cont.17078
bnei_else.17077:
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
bnei_cont.17078:
	j	bnei_cont.17076
bnei_else.17075:
	addi	%v0, %zero, 1
bnei_cont.17076:
	beqi	%v0, 0, bnei_else.17079
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17079:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.17074:
	addi	%v0, %zero, 1
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17080
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.17080:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17061:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17081
	addi	%a1, %zero, 72
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
	beqi	%v0, 0, bnei_else.17082
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17082:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17083
	addi	%a1, %zero, 72
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
	beqi	%v0, 0, bnei_else.17084
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17084:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17085
	addi	%a1, %zero, 72
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
	beqi	%v0, 0, bnei_else.17086
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17086:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17087
	addi	%a1, %zero, 72
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
	beqi	%v0, 0, bnei_else.17088
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17088:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.17087:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17085:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17083:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.17081:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17089
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a1, 99, bnei_else.17090
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 127
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 127
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 127
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	addi	%a3, %zero, 174
	add	%at, %a3, %a1
	lw	%a1, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17092
	beqi	%a3, 2, bnei_else.17094
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17095
bnei_else.17094:
	flw	%f3, 0(%a1)
	flw	%f4, 444(%zero)
	fblt	%f3, %f4, fbgt_else.17096
	addi	%a2, %zero, 0
	j	fbgt_cont.17097
fbgt_else.17096:
	addi	%a2, %zero, 1
fbgt_cont.17097:
	beqi	%a2, 0, bnei_else.17098
	flw	%f3, 1(%a1)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a1)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 124
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.17099
bnei_else.17098:
	addi	%v0, %zero, 0
bnei_cont.17099:
bnei_cont.17095:
	j	bnei_cont.17093
bnei_else.17092:
	addi	%a3, %zero, 171
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17093:
	beqi	%v0, 0, bnei_else.17100
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fblt	%f0, %f1, fbgt_else.17102
	addi	%v0, %zero, 0
	j	fbgt_cont.17103
fbgt_else.17102:
	addi	%v0, %zero, 1
fbgt_cont.17103:
	beqi	%v0, 0, bnei_else.17104
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17106
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17108
	addi	%v0, %zero, 1
	j	bnei_cont.17109
bnei_else.17108:
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17110
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17112
	addi	%v0, %zero, 1
	j	bnei_cont.17113
bnei_else.17112:
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17114
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17116
	addi	%v0, %zero, 1
	j	bnei_cont.17117
bnei_else.17116:
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17117:
	j	bnei_cont.17115
bnei_else.17114:
	addi	%v0, %zero, 0
bnei_cont.17115:
bnei_cont.17113:
	j	bnei_cont.17111
bnei_else.17110:
	addi	%v0, %zero, 0
bnei_cont.17111:
bnei_cont.17109:
	j	bnei_cont.17107
bnei_else.17106:
	addi	%v0, %zero, 0
bnei_cont.17107:
	beqi	%v0, 0, bnei_else.17118
	addi	%v0, %zero, 1
	j	bnei_cont.17119
bnei_else.17118:
	addi	%v0, %zero, 0
bnei_cont.17119:
	j	bnei_cont.17105
bnei_else.17104:
	addi	%v0, %zero, 0
bnei_cont.17105:
	j	bnei_cont.17101
bnei_else.17100:
	addi	%v0, %zero, 0
bnei_cont.17101:
	j	bnei_cont.17091
bnei_else.17090:
	addi	%v0, %zero, 1
bnei_cont.17091:
	beqi	%v0, 0, bnei_else.17120
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17121
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17123
	addi	%v0, %zero, 1
	j	bnei_cont.17124
bnei_else.17123:
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.17125
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17127
	addi	%v0, %zero, 1
	j	bnei_cont.17128
bnei_else.17127:
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.17129
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17131
	addi	%v0, %zero, 1
	j	bnei_cont.17132
bnei_else.17131:
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
bnei_cont.17132:
	j	bnei_cont.17130
bnei_else.17129:
	addi	%v0, %zero, 0
bnei_cont.17130:
bnei_cont.17128:
	j	bnei_cont.17126
bnei_else.17125:
	addi	%v0, %zero, 0
bnei_cont.17126:
bnei_cont.17124:
	j	bnei_cont.17122
bnei_else.17121:
	addi	%v0, %zero, 0
bnei_cont.17122:
	beqi	%v0, 0, bnei_else.17133
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17133:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.17120:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.17089:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17134
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 148
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 148
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 148
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	lw	%a3, 1(%a2)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	beqi	%a3, 1, bnei_else.17135
	beqi	%a3, 2, bnei_else.17137
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second.2811
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17138
bnei_else.17137:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_surface.2792
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17138:
	j	bnei_cont.17136
bnei_else.17135:
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
	beqi	%v0, 0, bnei_else.17139
	addi	%v0, %zero, 1
	j	bnei_cont.17140
bnei_else.17139:
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
	beqi	%v0, 0, bnei_else.17141
	addi	%v0, %zero, 2
	j	bnei_cont.17142
bnei_else.17141:
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
	beqi	%v0, 0, bnei_else.17143
	addi	%v0, %zero, 3
	j	bnei_cont.17144
bnei_else.17143:
	addi	%v0, %zero, 0
bnei_cont.17144:
bnei_cont.17142:
bnei_cont.17140:
bnei_cont.17136:
	beqi	%v0, 0, bnei_else.17145
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17146
	addi	%v1, %zero, 0
	j	fbgt_cont.17147
fbgt_else.17146:
	addi	%v1, %zero, 1
fbgt_cont.17147:
	beqi	%v1, 0, bnei_else.17148
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.17150
	addi	%v1, %zero, 0
	j	fbgt_cont.17151
fbgt_else.17150:
	addi	%v1, %zero, 1
fbgt_cont.17151:
	beqi	%v1, 0, bnei_else.17152
	flw	%f1, 438(%zero)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	flw	%f1, 0(%a0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%a0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 148
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%a0)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 148
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	lw	%v1, 1(%sp)
	lw	%a1, 0(%v1)
	sw	%v0, 8(%sp)
	fsw	%f3, 9(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f1, 11(%sp)
	fsw	%f0, 12(%sp)
	beqi	%a1, -1, bnei_else.17154
	addi	%a2, %zero, 1
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
	beqi	%v0, 0, bnei_else.17156
	addi	%v0, %zero, 0
	j	bnei_cont.17157
bnei_else.17156:
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
bnei_cont.17157:
	j	bnei_cont.17155
bnei_else.17154:
	addi	%v0, %zero, 1
bnei_cont.17155:
	beqi	%v0, 0, bnei_else.17158
	addi	%v0, %zero, 126
	flw	%f0, 12(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 10(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 9(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 130
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.17159
bnei_else.17158:
bnei_cont.17159:
	j	bnei_cont.17153
bnei_else.17152:
bnei_cont.17153:
	j	bnei_cont.17149
bnei_else.17148:
bnei_cont.17149:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.17145:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17160
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.17160:
	jr	%ra
bnei_else.17134:
	jr	%ra
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17163
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17164
	addi	%a1, %zero, 72
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
	beqi	%a0, -1, bnei_else.17165
	addi	%a1, %zero, 72
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
	beqi	%a0, -1, bnei_else.17166
	addi	%a1, %zero, 72
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
bnei_else.17166:
	jr	%ra
bnei_else.17165:
	jr	%ra
bnei_else.17164:
	jr	%ra
bnei_else.17163:
	jr	%ra
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.17171
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.17172
	addi	%a3, %zero, 1
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	addi	%a3, %zero, 148
	flw	%f0, 0(%a3)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 148
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a2)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 148
	flw	%f2, 2(%a3)
	lw	%a3, 5(%a2)
	flw	%f3, 2(%a3)
	fsub	%f2, %f2, %f3
	lw	%a3, 1(%a2)
	sw	%a1, 3(%sp)
	beqi	%a3, 1, bnei_else.17174
	beqi	%a3, 2, bnei_else.17176
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second.2811
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17177
bnei_else.17176:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_surface.2792
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17177:
	j	bnei_cont.17175
bnei_else.17174:
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
	beqi	%v0, 0, bnei_else.17178
	addi	%v0, %zero, 1
	j	bnei_cont.17179
bnei_else.17178:
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
	beqi	%v0, 0, bnei_else.17180
	addi	%v0, %zero, 2
	j	bnei_cont.17181
bnei_else.17180:
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
	beqi	%v0, 0, bnei_else.17182
	addi	%v0, %zero, 3
	j	bnei_cont.17183
bnei_else.17182:
	addi	%v0, %zero, 0
bnei_cont.17183:
bnei_cont.17181:
bnei_cont.17179:
bnei_cont.17175:
	beqi	%v0, 0, bnei_else.17184
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17186
	addi	%v0, %zero, 0
	j	fbgt_cont.17187
fbgt_else.17186:
	addi	%v0, %zero, 1
fbgt_cont.17187:
	beqi	%v0, 0, bnei_else.17188
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17190
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17192
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17194
	addi	%a0, %zero, 72
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
	j	bnei_cont.17195
bnei_else.17194:
bnei_cont.17195:
	j	bnei_cont.17193
bnei_else.17192:
bnei_cont.17193:
	j	bnei_cont.17191
bnei_else.17190:
bnei_cont.17191:
	j	bnei_cont.17189
bnei_else.17188:
bnei_cont.17189:
	j	bnei_cont.17185
bnei_else.17184:
bnei_cont.17185:
	j	bnei_cont.17173
bnei_else.17172:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.17196
	addi	%a3, %zero, 72
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
	beqi	%v1, -1, bnei_else.17198
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17200
	addi	%a0, %zero, 72
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
	j	bnei_cont.17201
bnei_else.17200:
bnei_cont.17201:
	j	bnei_cont.17199
bnei_else.17198:
bnei_cont.17199:
	j	bnei_cont.17197
bnei_else.17196:
bnei_cont.17197:
bnei_cont.17173:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17202
	sw	%v0, 8(%sp)
	beqi	%a1, 99, bnei_else.17203
	addi	%a2, %zero, 148
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
	beqi	%v0, 0, bnei_else.17205
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17207
	addi	%v0, %zero, 0
	j	fbgt_cont.17208
fbgt_else.17207:
	addi	%v0, %zero, 1
fbgt_cont.17208:
	beqi	%v0, 0, bnei_else.17209
	lw	%v0, 9(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17211
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17213
	addi	%a0, %zero, 72
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
	j	bnei_cont.17214
bnei_else.17213:
bnei_cont.17214:
	j	bnei_cont.17212
bnei_else.17211:
bnei_cont.17212:
	j	bnei_cont.17210
bnei_else.17209:
bnei_cont.17210:
	j	bnei_cont.17206
bnei_else.17205:
bnei_cont.17206:
	j	bnei_cont.17204
bnei_else.17203:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17215
	addi	%a2, %zero, 72
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
	beqi	%v1, -1, bnei_else.17217
	addi	%a0, %zero, 72
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
	j	bnei_cont.17218
bnei_else.17217:
bnei_cont.17218:
	j	bnei_cont.17216
bnei_else.17215:
bnei_cont.17216:
bnei_cont.17204:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
bnei_else.17202:
	jr	%ra
bnei_else.17171:
	jr	%ra
solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.17221
	addi	%a3, %zero, 1
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
	beqi	%t2, 1, bnei_else.17222
	beqi	%t2, 2, bnei_else.17224
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17225
bnei_else.17224:
	flw	%f0, 0(%t1)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17226
	addi	%a3, %zero, 0
	j	fbgt_cont.17227
fbgt_else.17226:
	addi	%a3, %zero, 1
fbgt_cont.17227:
	beqi	%a3, 0, bnei_else.17228
	flw	%f0, 0(%t1)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 124
	fsw	%f0, 0(%a3)
	addi	%v0, %zero, 1
	j	bnei_cont.17229
bnei_else.17228:
	addi	%v0, %zero, 0
bnei_cont.17229:
bnei_cont.17225:
	j	bnei_cont.17223
bnei_else.17222:
	lw	%t0, 0(%a0)
	addi	%a0, %t1, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17223:
	beqi	%v0, 0, bnei_else.17230
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17231
	addi	%v1, %zero, 0
	j	fbgt_cont.17232
fbgt_else.17231:
	addi	%v1, %zero, 1
fbgt_cont.17232:
	beqi	%v1, 0, bnei_else.17233
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.17235
	addi	%v1, %zero, 0
	j	fbgt_cont.17236
fbgt_else.17235:
	addi	%v1, %zero, 1
fbgt_cont.17236:
	beqi	%v1, 0, bnei_else.17237
	flw	%f1, 438(%zero)
	fadd	%f0, %f0, %f1
	lw	%v1, 0(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 151
	flw	%f2, 0(%a0)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v1)
	fmul	%f2, %f2, %f0
	addi	%a0, %zero, 151
	flw	%f3, 1(%a0)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v1)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 151
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	lw	%v1, 2(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 5(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	beqi	%a0, -1, bnei_else.17239
	addi	%a1, %zero, 1
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
	beqi	%v0, 0, bnei_else.17241
	addi	%v0, %zero, 0
	j	bnei_cont.17242
bnei_else.17241:
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
bnei_cont.17242:
	j	bnei_cont.17240
bnei_else.17239:
	addi	%v0, %zero, 1
bnei_cont.17240:
	beqi	%v0, 0, bnei_else.17243
	addi	%v0, %zero, 126
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 7(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 6(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 130
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.17244
bnei_else.17243:
bnei_cont.17244:
	j	bnei_cont.17238
bnei_else.17237:
bnei_cont.17238:
	j	bnei_cont.17234
bnei_else.17233:
bnei_cont.17234:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.17230:
	addi	%v0, %zero, 1
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.17245
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.17245:
	jr	%ra
bnei_else.17221:
	jr	%ra
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.17248
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.17249
	addi	%a1, %zero, 72
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
	beqi	%a0, -1, bnei_else.17250
	addi	%a1, %zero, 72
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
	beqi	%a0, -1, bnei_else.17251
	addi	%a1, %zero, 72
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
bnei_else.17251:
	jr	%ra
bnei_else.17250:
	jr	%ra
bnei_else.17249:
	jr	%ra
bnei_else.17248:
	jr	%ra
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.17256
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.17257
	addi	%a3, %zero, 1
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
	beqi	%t1, 1, bnei_else.17259
	beqi	%t1, 2, bnei_else.17261
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17262
bnei_else.17261:
	flw	%f0, 0(%a2)
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17263
	addi	%a3, %zero, 0
	j	fbgt_cont.17264
fbgt_else.17263:
	addi	%a3, %zero, 1
fbgt_cont.17264:
	beqi	%a3, 0, bnei_else.17265
	flw	%f0, 0(%a2)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 124
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.17266
bnei_else.17265:
	addi	%v0, %zero, 0
bnei_cont.17266:
bnei_cont.17262:
	j	bnei_cont.17260
bnei_else.17259:
	lw	%t0, 0(%a0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.17260:
	beqi	%v0, 0, bnei_else.17267
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17269
	addi	%v0, %zero, 0
	j	fbgt_cont.17270
fbgt_else.17269:
	addi	%v0, %zero, 1
fbgt_cont.17270:
	beqi	%v0, 0, bnei_else.17271
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17273
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17275
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17277
	addi	%a0, %zero, 72
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
	j	bnei_cont.17278
bnei_else.17277:
bnei_cont.17278:
	j	bnei_cont.17276
bnei_else.17275:
bnei_cont.17276:
	j	bnei_cont.17274
bnei_else.17273:
bnei_cont.17274:
	j	bnei_cont.17272
bnei_else.17271:
bnei_cont.17272:
	j	bnei_cont.17268
bnei_else.17267:
bnei_cont.17268:
	j	bnei_cont.17258
bnei_else.17257:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.17279
	addi	%a3, %zero, 72
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
	beqi	%v1, -1, bnei_else.17281
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17283
	addi	%a0, %zero, 72
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
	j	bnei_cont.17284
bnei_else.17283:
bnei_cont.17284:
	j	bnei_cont.17282
bnei_else.17281:
bnei_cont.17282:
	j	bnei_cont.17280
bnei_else.17279:
bnei_cont.17280:
bnei_cont.17258:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17285
	sw	%v0, 4(%sp)
	beqi	%a1, 99, bnei_else.17286
	lw	%a2, 0(%sp)
	sw	%a0, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solver_fast2.2858
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17288
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17290
	addi	%v0, %zero, 0
	j	fbgt_cont.17291
fbgt_else.17290:
	addi	%v0, %zero, 1
fbgt_cont.17291:
	beqi	%v0, 0, bnei_else.17292
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17294
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17296
	addi	%a0, %zero, 72
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
	j	bnei_cont.17297
bnei_else.17296:
bnei_cont.17297:
	j	bnei_cont.17295
bnei_else.17294:
bnei_cont.17295:
	j	bnei_cont.17293
bnei_else.17292:
bnei_cont.17293:
	j	bnei_cont.17289
bnei_else.17288:
bnei_cont.17289:
	j	bnei_cont.17287
bnei_else.17286:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17298
	addi	%a2, %zero, 72
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
	beqi	%v1, -1, bnei_else.17300
	addi	%a0, %zero, 72
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
	j	bnei_cont.17301
bnei_else.17300:
bnei_cont.17301:
	j	bnei_cont.17299
bnei_else.17298:
bnei_cont.17299:
bnei_cont.17287:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.17285:
	jr	%ra
bnei_else.17256:
	jr	%ra
judge_intersection_fast.2941:
	flw	%f0, 436(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%a0, 0(%v1)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.17304
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a1, 99, bnei_else.17306
	sw	%a0, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast2.2858
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17308
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.17310
	addi	%v0, %zero, 0
	j	fbgt_cont.17311
fbgt_else.17310:
	addi	%v0, %zero, 1
fbgt_cont.17311:
	beqi	%v0, 0, bnei_else.17312
	lw	%v0, 2(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.17314
	addi	%a0, %zero, 72
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
	beqi	%v1, -1, bnei_else.17316
	addi	%a0, %zero, 72
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
	j	bnei_cont.17317
bnei_else.17316:
bnei_cont.17317:
	j	bnei_cont.17315
bnei_else.17314:
bnei_cont.17315:
	j	bnei_cont.17313
bnei_else.17312:
bnei_cont.17313:
	j	bnei_cont.17309
bnei_else.17308:
bnei_cont.17309:
	j	bnei_cont.17307
bnei_else.17306:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.17318
	addi	%a2, %zero, 72
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
	beqi	%v1, -1, bnei_else.17320
	addi	%a0, %zero, 72
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
	j	bnei_cont.17321
bnei_else.17320:
bnei_cont.17321:
	j	bnei_cont.17319
bnei_else.17318:
bnei_cont.17319:
bnei_cont.17307:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17305
bnei_else.17304:
bnei_cont.17305:
	addi	%v0, %zero, 126
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fblt	%f1, %f0, fbgt_else.17322
	addi	%v0, %zero, 0
	j	fbgt_cont.17323
fbgt_else.17322:
	addi	%v0, %zero, 1
fbgt_cont.17323:
	beqi	%v0, 0, bnei_else.17324
	flw	%f1, 435(%zero)
	fblt	%f0, %f1, fbgt_else.17325
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.17325:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.17324:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2947:
	addi	%v1, %zero, 127
	flw	%f0, 0(%v1)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 127
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	addi	%v1, %zero, 127
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
	beqi	%v1, 0, bnei_else.17326
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 447(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	addi	%v1, %zero, 131
	fsw	%f3, 0(%v1)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	flw	%f3, 447(%zero)
	fmul	%f2, %f2, %f3
	fadd	%f2, %f4, %f2
	addi	%v1, %zero, 131
	fsw	%f2, 1(%v1)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 447(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f5, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 2(%v1)
	j	bnei_cont.17327
bnei_else.17326:
	addi	%v1, %zero, 131
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 131
	fsw	%f4, 1(%v1)
	addi	%v1, %zero, 131
	fsw	%f5, 2(%v1)
bnei_cont.17327:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 131
	j	vecunit_sgn.2655
get_nvector.2949:
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.17328
	beqi	%a0, 2, bnei_else.17329
	j	get_nvector_second.2947
bnei_else.17329:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 1(%v1)
	lw	%v0, 4(%v0)
	flw	%f0, 2(%v0)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17328:
	addi	%v0, %zero, 125
	lw	%v0, 0(%v0)
	flw	%f0, 444(%zero)
	addi	%a0, %zero, 131
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 131
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 131
	fsw	%f0, 2(%a0)
	addi	%a0, %v0, -1
	addi	%v0, %v0, -1
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.17331
	addi	%v0, %zero, 1
	j	fbeq_cont.17332
fbeq_else.17331:
	addi	%v0, %zero, 0
fbeq_cont.17332:
	beqi	%v0, 0, bnei_else.17333
	flw	%f0, 444(%zero)
	j	bnei_cont.17334
bnei_else.17333:
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17335
	addi	%v0, %zero, 0
	j	fbgt_cont.17336
fbgt_else.17335:
	addi	%v0, %zero, 1
fbgt_cont.17336:
	beqi	%v0, 0, bnei_else.17337
	flw	%f0, 448(%zero)
	j	bnei_cont.17338
bnei_else.17337:
	flw	%f0, 443(%zero)
bnei_cont.17338:
bnei_cont.17334:
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	add	%at, %v0, %a0
	fsw	%f0, 0(%at)
	jr	%ra
utexture.2952:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 134
	fsw	%f0, 0(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	addi	%a1, %zero, 134
	fsw	%f0, 1(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	addi	%a1, %zero, 134
	fsw	%f0, 2(%a1)
	beqi	%a0, 1, bnei_else.17340
	beqi	%a0, 2, bnei_else.17341
	beqi	%a0, 3, bnei_else.17342
	beqi	%a0, 4, bnei_else.17343
	jr	%ra
bnei_else.17343:
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
	flw	%f4, 434(%zero)
	fblt	%f3, %f4, fbgt_else.17345
	addi	%a0, %zero, 0
	j	fbgt_cont.17346
fbgt_else.17345:
	addi	%a0, %zero, 1
fbgt_cont.17346:
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	beqi	%a0, 0, bnei_else.17347
	flw	%f0, 433(%zero)
	j	bnei_cont.17348
bnei_else.17347:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17349
	addi	%a0, %zero, 1
	j	fbgt_cont.17350
fbgt_else.17349:
	addi	%a0, %zero, 0
fbgt_cont.17350:
	fabs	%f1, %f0
	flw	%f3, 432(%zero)
	fblt	%f1, %f3, fbgt_else.17351
	flw	%f0, 431(%zero)
	sw	%a0, 3(%sp)
	fblt	%f1, %f0, fbgt_else.17353
	flw	%f0, 453(%zero)
	flw	%f3, 448(%zero)
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
	j	fbgt_cont.17354
fbgt_else.17353:
	flw	%f0, 452(%zero)
	flw	%f3, 448(%zero)
	fsub	%f3, %f1, %f3
	flw	%f4, 448(%zero)
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
fbgt_cont.17354:
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.17355
	j	bnei_cont.17356
bnei_else.17355:
	fneg	%f0, %f0
bnei_cont.17356:
	j	fbgt_cont.17352
fbgt_else.17351:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
fbgt_cont.17352:
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.17348:
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
	flw	%f4, 434(%zero)
	fblt	%f3, %f4, fbgt_else.17357
	addi	%v0, %zero, 0
	j	fbgt_cont.17358
fbgt_else.17357:
	addi	%v0, %zero, 1
fbgt_cont.17358:
	fsw	%f0, 6(%sp)
	beqi	%v0, 0, bnei_else.17359
	flw	%f0, 433(%zero)
	j	bnei_cont.17360
bnei_else.17359:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 444(%zero)
	fblt	%f1, %f2, fbgt_else.17361
	addi	%v0, %zero, 1
	j	fbgt_cont.17362
fbgt_else.17361:
	addi	%v0, %zero, 0
fbgt_cont.17362:
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fblt	%f2, %f3, fbgt_else.17363
	flw	%f1, 431(%zero)
	sw	%v0, 7(%sp)
	fblt	%f2, %f1, fbgt_else.17365
	flw	%f1, 453(%zero)
	flw	%f3, 448(%zero)
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
	j	fbgt_cont.17366
fbgt_else.17365:
	flw	%f1, 452(%zero)
	flw	%f3, 448(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 448(%zero)
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
fbgt_cont.17366:
	lw	%v0, 7(%sp)
	beqi	%v0, 0, bnei_else.17367
	j	bnei_cont.17368
bnei_else.17367:
	fneg	%f0, %f0
bnei_cont.17368:
	j	fbgt_cont.17364
fbgt_else.17363:
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
fbgt_cont.17364:
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.17360:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 428(%zero)
	flw	%f2, 447(%zero)
	flw	%f3, 6(%sp)
	fsub	%f2, %f2, %f3
	fmul	%f2, %f2, %f2
	fsub	%f1, %f1, %f2
	flw	%f2, 447(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17369
	addi	%v0, %zero, 0
	j	fbgt_cont.17370
fbgt_else.17369:
	addi	%v0, %zero, 1
fbgt_cont.17370:
	beqi	%v0, 0, bnei_else.17371
	flw	%f0, 444(%zero)
	j	bnei_cont.17372
bnei_else.17371:
bnei_cont.17372:
	flw	%f1, 427(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 426(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17342:
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
	flw	%f1, 425(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	cos.2616
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 427(%zero)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f1, 1(%v0)
	flw	%f1, 448(%zero)
	fsub	%f0, %f1, %f0
	flw	%f1, 427(%zero)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17341:
	flw	%f0, 1(%v1)
	flw	%f1, 424(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2618
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 427(%zero)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f1, 0(%v0)
	flw	%f1, 427(%zero)
	flw	%f2, 448(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
bnei_else.17340:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 422(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 425(%zero)
	fblt	%f0, %f1, fbgt_else.17376
	addi	%a0, %zero, 0
	j	fbgt_cont.17377
fbgt_else.17376:
	addi	%a0, %zero, 1
fbgt_cont.17377:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 422(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 425(%zero)
	fblt	%f0, %f1, fbgt_else.17378
	addi	%v0, %zero, 0
	j	fbgt_cont.17379
fbgt_else.17378:
	addi	%v0, %zero, 1
fbgt_cont.17379:
	beqi	%a0, 0, bnei_else.17380
	beqi	%v0, 0, bnei_else.17382
	flw	%f0, 427(%zero)
	j	bnei_cont.17383
bnei_else.17382:
	flw	%f0, 444(%zero)
bnei_cont.17383:
	j	bnei_cont.17381
bnei_else.17380:
	beqi	%v0, 0, bnei_else.17384
	flw	%f0, 444(%zero)
	j	bnei_cont.17385
bnei_else.17384:
	flw	%f0, 427(%zero)
bnei_cont.17385:
bnei_cont.17381:
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
trace_reflections.2959:
	blti	%v0, 0, bgti_else.17387
	addi	%a0, %zero, 234
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	lw	%a1, 1(%a0)
	flw	%f2, 436(%zero)
	addi	%a2, %zero, 126
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 0
	addi	%a3, %zero, 123
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
	addi	%v0, %zero, 126
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fblt	%f1, %f0, fbgt_else.17388
	addi	%v0, %zero, 0
	j	fbgt_cont.17389
fbgt_else.17388:
	addi	%v0, %zero, 1
fbgt_cont.17389:
	beqi	%v0, 0, bnei_else.17390
	flw	%f1, 435(%zero)
	fblt	%f0, %f1, fbgt_else.17392
	addi	%v0, %zero, 0
	j	fbgt_cont.17393
fbgt_else.17392:
	addi	%v0, %zero, 1
fbgt_cont.17393:
	j	bnei_cont.17391
bnei_else.17390:
	addi	%v0, %zero, 0
bnei_cont.17391:
	beqi	%v0, 0, bnei_else.17394
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 5(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.17396
	addi	%v0, %zero, 0
	addi	%a0, %zero, 123
	lw	%a0, 0(%a0)
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17398
	j	bnei_cont.17399
bnei_else.17398:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	addi	%a0, %zero, 131
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%a0, %zero, 131
	flw	%f1, 1(%a0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 131
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
	flw	%f3, 444(%zero)
	fblt	%f3, %f0, fbgt_else.17400
	addi	%v0, %zero, 0
	j	fbgt_cont.17401
fbgt_else.17400:
	addi	%v0, %zero, 1
fbgt_cont.17401:
	beqi	%v0, 0, bnei_else.17402
	addi	%v0, %zero, 140
	flw	%f3, 0(%v0)
	addi	%v0, %zero, 134
	flw	%f4, 0(%v0)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 140
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f3, 1(%v0)
	addi	%v0, %zero, 134
	flw	%f4, 1(%v0)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 140
	fsw	%f3, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f3, 2(%v0)
	addi	%v0, %zero, 134
	flw	%f4, 2(%v0)
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	j	bnei_cont.17403
bnei_else.17402:
bnei_cont.17403:
	flw	%f0, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17404
	addi	%v0, %zero, 0
	j	fbgt_cont.17405
fbgt_else.17404:
	addi	%v0, %zero, 1
fbgt_cont.17405:
	beqi	%v0, 0, bnei_else.17406
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140
	flw	%f3, 0(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 140
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f3, 1(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 140
	fsw	%f3, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f3, 2(%v0)
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	j	bnei_cont.17407
bnei_else.17406:
bnei_cont.17407:
bnei_cont.17399:
	j	beq_cont.17397
beq_else.17396:
beq_cont.17397:
	j	bnei_cont.17395
bnei_else.17394:
bnei_cont.17395:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
bgti_else.17387:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.17409
	lw	%a1, 2(%a0)
	flw	%f2, 436(%zero)
	addi	%a2, %zero, 126
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 0
	addi	%a3, %zero, 123
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
	addi	%v0, %zero, 126
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fblt	%f1, %f0, fbgt_else.17410
	addi	%v0, %zero, 0
	j	fbgt_cont.17411
fbgt_else.17410:
	addi	%v0, %zero, 1
fbgt_cont.17411:
	beqi	%v0, 0, bnei_else.17412
	flw	%f1, 435(%zero)
	fblt	%f0, %f1, fbgt_else.17414
	addi	%v0, %zero, 0
	j	fbgt_cont.17415
fbgt_else.17414:
	addi	%v0, %zero, 1
fbgt_cont.17415:
	j	bnei_cont.17413
bnei_else.17412:
	addi	%v0, %zero, 0
bnei_cont.17413:
	beqi	%v0, 0, bnei_else.17416
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
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
	beqi	%a1, 1, bnei_else.17417
	beqi	%a1, 2, bnei_else.17419
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	get_nvector_second.2947
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17420
bnei_else.17419:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 131
	fsw	%f2, 0(%a1)
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 131
	fsw	%f2, 1(%a1)
	lw	%a1, 4(%v1)
	flw	%f2, 2(%a1)
	fneg	%f2, %f2
	addi	%a1, %zero, 131
	fsw	%f2, 2(%a1)
bnei_cont.17420:
	j	bnei_cont.17418
bnei_else.17417:
	addi	%a1, %zero, 125
	lw	%a1, 0(%a1)
	flw	%f2, 444(%zero)
	addi	%a2, %zero, 131
	fsw	%f2, 0(%a2)
	addi	%a2, %zero, 131
	fsw	%f2, 1(%a2)
	addi	%a2, %zero, 131
	fsw	%f2, 2(%a2)
	addi	%a2, %a1, -1
	addi	%a1, %a1, -1
	lw	%a3, 3(%sp)
	add	%at, %a3, %a1
	flw	%f2, 0(%at)
	flw	%f3, 444(%zero)
	fbne	%f2, %f3, fbeq_else.17421
	addi	%a1, %zero, 1
	j	fbeq_cont.17422
fbeq_else.17421:
	addi	%a1, %zero, 0
fbeq_cont.17422:
	beqi	%a1, 0, bnei_else.17423
	flw	%f2, 444(%zero)
	j	bnei_cont.17424
bnei_else.17423:
	flw	%f3, 444(%zero)
	fblt	%f3, %f2, fbgt_else.17425
	addi	%a1, %zero, 0
	j	fbgt_cont.17426
fbgt_else.17425:
	addi	%a1, %zero, 1
fbgt_cont.17426:
	beqi	%a1, 0, bnei_else.17427
	flw	%f2, 448(%zero)
	j	bnei_cont.17428
bnei_else.17427:
	flw	%f2, 443(%zero)
bnei_cont.17428:
bnei_cont.17424:
	fneg	%f2, %f2
	addi	%a1, %zero, 131
	add	%at, %a1, %a2
	fsw	%f2, 0(%at)
bnei_cont.17418:
	addi	%v0, %zero, 127
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 127
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	utexture.2952
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 8(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
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
	addi	%a2, %zero, 127
	flw	%f0, 0(%a2)
	fsw	%f0, 0(%a1)
	addi	%a2, %zero, 127
	flw	%f0, 1(%a2)
	fsw	%f0, 1(%a1)
	addi	%a2, %zero, 127
	flw	%f0, 2(%a2)
	fsw	%f0, 2(%a1)
	lw	%a1, 3(%v0)
	lw	%a2, 9(%sp)
	lw	%a3, 7(%a2)
	flw	%f0, 0(%a3)
	flw	%f1, 447(%zero)
	fblt	%f0, %f1, fbgt_else.17429
	addi	%a3, %zero, 0
	j	fbgt_cont.17430
fbgt_else.17429:
	addi	%a3, %zero, 1
fbgt_cont.17430:
	beqi	%a3, 0, bnei_else.17431
	addi	%a3, %zero, 0
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.17432
bnei_else.17431:
	addi	%a3, %zero, 1
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a3, 0(%at)
	addi	%t0, %zero, 134
	flw	%f0, 0(%t0)
	fsw	%f0, 0(%a3)
	addi	%t0, %zero, 134
	flw	%f0, 1(%t0)
	fsw	%f0, 1(%a3)
	addi	%t0, %zero, 134
	flw	%f0, 2(%t0)
	fsw	%f0, 2(%a3)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f0, 421(%zero)
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
	addi	%a3, %zero, 131
	flw	%f0, 0(%a3)
	fsw	%f0, 0(%a1)
	addi	%a3, %zero, 131
	flw	%f0, 1(%a3)
	fsw	%f0, 1(%a1)
	addi	%a3, %zero, 131
	flw	%f0, 2(%a3)
	fsw	%f0, 2(%a1)
bnei_cont.17432:
	flw	%f0, 420(%zero)
	lw	%a1, 3(%sp)
	flw	%f1, 0(%a1)
	addi	%a3, %zero, 131
	flw	%f2, 0(%a3)
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%a1)
	addi	%a3, %zero, 131
	flw	%f3, 1(%a3)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	flw	%f2, 2(%a1)
	addi	%a3, %zero, 131
	flw	%f3, 2(%a3)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%a1)
	addi	%a3, %zero, 131
	flw	%f2, 0(%a3)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 0(%a1)
	flw	%f1, 1(%a1)
	addi	%a3, %zero, 131
	flw	%f2, 1(%a3)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 1(%a1)
	flw	%f1, 2(%a1)
	addi	%a3, %zero, 131
	flw	%f2, 2(%a3)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%a1)
	lw	%a3, 7(%a2)
	flw	%f0, 1(%a3)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 123
	lw	%t0, 0(%t0)
	fsw	%f0, 10(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.17433
	j	bnei_cont.17434
bnei_else.17433:
	addi	%v0, %zero, 131
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	flw	%f2, 0(%v0)
	addi	%v1, %zero, 67
	flw	%f3, 0(%v1)
	fmul	%f2, %f2, %f3
	flw	%f3, 1(%v0)
	addi	%v1, %zero, 67
	flw	%f4, 1(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	addi	%v1, %zero, 67
	flw	%f4, 2(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	fneg	%f2, %f2
	flw	%f3, 444(%zero)
	fblt	%f3, %f0, fbgt_else.17435
	addi	%v1, %zero, 0
	j	fbgt_cont.17436
fbgt_else.17435:
	addi	%v1, %zero, 1
fbgt_cont.17436:
	beqi	%v1, 0, bnei_else.17437
	addi	%v1, %zero, 140
	flw	%f3, 0(%v1)
	addi	%v1, %zero, 134
	flw	%f4, 0(%v1)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 140
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 140
	flw	%f3, 1(%v1)
	addi	%v1, %zero, 134
	flw	%f4, 1(%v1)
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 140
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 140
	flw	%f3, 2(%v1)
	addi	%v1, %zero, 134
	flw	%f4, 2(%v1)
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	addi	%v1, %zero, 140
	fsw	%f0, 2(%v1)
	j	bnei_cont.17438
bnei_else.17437:
bnei_cont.17438:
	flw	%f0, 444(%zero)
	fblt	%f0, %f2, fbgt_else.17439
	addi	%v1, %zero, 0
	j	fbgt_cont.17440
fbgt_else.17439:
	addi	%v1, %zero, 1
fbgt_cont.17440:
	beqi	%v1, 0, bnei_else.17441
	fmul	%f0, %f2, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 10(%sp)
	fmul	%f0, %f0, %f2
	addi	%v1, %zero, 140
	flw	%f3, 0(%v1)
	fadd	%f3, %f3, %f0
	addi	%v1, %zero, 140
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 140
	flw	%f3, 1(%v1)
	fadd	%f3, %f3, %f0
	addi	%v1, %zero, 140
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 140
	flw	%f3, 2(%v1)
	fadd	%f0, %f3, %f0
	addi	%v1, %zero, 140
	fsw	%f0, 2(%v1)
	j	bnei_cont.17442
bnei_else.17441:
bnei_cont.17442:
bnei_cont.17434:
	addi	%v0, %zero, 127
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 151
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 151
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 127
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 414
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
	flw	%f0, 419(%zero)
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.17443
	addi	%v0, %zero, 0
	j	fbgt_cont.17444
fbgt_else.17443:
	addi	%v0, %zero, 1
fbgt_cont.17444:
	beqi	%v0, 0, bnei_else.17445
	lw	%v0, 4(%sp)
	blti	%v0, 4, bgti_else.17446
	j	bgti_cont.17447
bgti_else.17446:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.17447:
	lw	%v1, 6(%sp)
	beqi	%v1, 2, bnei_else.17448
	jr	%ra
bnei_else.17448:
	flw	%f0, 448(%zero)
	lw	%v1, 9(%sp)
	lw	%v1, 7(%v1)
	flw	%f2, 0(%v1)
	fsub	%f0, %f0, %f2
	fmul	%f0, %f1, %f0
	addi	%v0, %v0, 1
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	flw	%f2, 0(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	j	trace_ray.2964
bnei_else.17445:
	jr	%ra
bnei_else.17416:
	addi	%v0, %zero, -1
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.17451
	lw	%v0, 3(%sp)
	flw	%f0, 0(%v0)
	addi	%v1, %zero, 67
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 67
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17452
	addi	%v0, %zero, 0
	j	fbgt_cont.17453
fbgt_else.17452:
	addi	%v0, %zero, 1
fbgt_cont.17453:
	beqi	%v0, 0, bnei_else.17454
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
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
bnei_else.17454:
	jr	%ra
bnei_else.17451:
	jr	%ra
bgt_else.17409:
	jr	%ra
trace_diffuse_ray.2970:
	flw	%f1, 436(%zero)
	addi	%v1, %zero, 126
	fsw	%f1, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 123
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
	addi	%v0, %zero, 126
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fblt	%f1, %f0, fbgt_else.17459
	addi	%v0, %zero, 0
	j	fbgt_cont.17460
fbgt_else.17459:
	addi	%v0, %zero, 1
fbgt_cont.17460:
	beqi	%v0, 0, bnei_else.17461
	flw	%f1, 435(%zero)
	fblt	%f0, %f1, fbgt_else.17463
	addi	%v0, %zero, 0
	j	fbgt_cont.17464
fbgt_else.17463:
	addi	%v0, %zero, 1
fbgt_cont.17464:
	j	bnei_cont.17462
bnei_else.17461:
	addi	%v0, %zero, 0
bnei_cont.17462:
	beqi	%v0, 0, bnei_else.17465
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 1(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 2(%sp)
	beqi	%a0, 1, bnei_else.17466
	beqi	%a0, 2, bnei_else.17468
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	get_nvector_second.2947
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17469
bnei_else.17468:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 1(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	fsw	%f0, 2(%v1)
bnei_cont.17469:
	j	bnei_cont.17467
bnei_else.17466:
	addi	%a0, %zero, 125
	lw	%a0, 0(%a0)
	flw	%f0, 444(%zero)
	addi	%a1, %zero, 131
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 131
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 131
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, -1
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.17470
	addi	%v1, %zero, 1
	j	fbeq_cont.17471
fbeq_else.17470:
	addi	%v1, %zero, 0
fbeq_cont.17471:
	beqi	%v1, 0, bnei_else.17472
	flw	%f0, 444(%zero)
	j	bnei_cont.17473
bnei_else.17472:
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17474
	addi	%v1, %zero, 0
	j	fbgt_cont.17475
fbgt_else.17474:
	addi	%v1, %zero, 1
fbgt_cont.17475:
	beqi	%v1, 0, bnei_else.17476
	flw	%f0, 448(%zero)
	j	bnei_cont.17477
bnei_else.17476:
	flw	%f0, 443(%zero)
bnei_cont.17477:
bnei_cont.17473:
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	add	%at, %v1, %a1
	fsw	%f0, 0(%at)
bnei_cont.17467:
	addi	%v1, %zero, 127
	lw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	utexture.2952
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.17478
	jr	%ra
bnei_else.17478:
	addi	%v0, %zero, 131
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17480
	addi	%v0, %zero, 0
	j	fbgt_cont.17481
fbgt_else.17480:
	addi	%v0, %zero, 1
fbgt_cont.17481:
	beqi	%v0, 0, bnei_else.17482
	j	bnei_cont.17483
bnei_else.17482:
	flw	%f0, 444(%zero)
bnei_cont.17483:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 137
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.17465:
	jr	%ra
iter_trace_diffuse_rays.2973:
	blti	%a1, 0, bgti_else.17486
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17487
	addi	%a2, %zero, 0
	j	fbgt_cont.17488
fbgt_else.17487:
	addi	%a2, %zero, 1
fbgt_cont.17488:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	beqi	%a2, 0, bnei_else.17489
	addi	%a2, %a1, 1
	add	%at, %v0, %a2
	lw	%a2, 0(%at)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.17491
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
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
	addi	%v1, %zero, 127
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	utexture.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.17493
	j	bnei_cont.17494
bnei_else.17493:
	addi	%v0, %zero, 131
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17495
	addi	%v0, %zero, 0
	j	fbgt_cont.17496
fbgt_else.17495:
	addi	%v0, %zero, 1
fbgt_cont.17496:
	beqi	%v0, 0, bnei_else.17497
	j	bnei_cont.17498
bnei_else.17497:
	flw	%f0, 444(%zero)
bnei_cont.17498:
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 137
	fsw	%f0, 2(%v0)
bnei_cont.17494:
	j	bnei_cont.17492
bnei_else.17491:
bnei_cont.17492:
	j	bnei_cont.17490
bnei_else.17489:
	add	%at, %v0, %a1
	lw	%a2, 0(%at)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 7(%sp)
	sw	%a2, 8(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 0, bnei_else.17499
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
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
	addi	%v1, %zero, 127
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	utexture.2952
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.17501
	j	bnei_cont.17502
bnei_else.17501:
	addi	%v0, %zero, 131
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 131
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 67
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 444(%zero)
	fblt	%f1, %f0, fbgt_else.17503
	addi	%v0, %zero, 0
	j	fbgt_cont.17504
fbgt_else.17503:
	addi	%v0, %zero, 1
fbgt_cont.17504:
	beqi	%v0, 0, bnei_else.17505
	j	bnei_cont.17506
bnei_else.17505:
	flw	%f0, 444(%zero)
bnei_cont.17506:
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 9(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 137
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 134
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 137
	fsw	%f0, 2(%v0)
bnei_cont.17502:
	j	bnei_cont.17500
bnei_else.17499:
bnei_cont.17500:
bnei_cont.17490:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.17507
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17508
	addi	%a0, %zero, 0
	j	fbgt_cont.17509
fbgt_else.17508:
	addi	%a0, %zero, 1
fbgt_cont.17509:
	sw	%v0, 10(%sp)
	beqi	%a0, 0, bnei_else.17510
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.17511
bnei_else.17510:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.17511:
	lw	%v0, 10(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.17507:
	jr	%ra
bgti_else.17486:
	jr	%ra
trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.17514
	addi	%a1, %zero, 166
	lw	%a1, 0(%a1)
	flw	%f0, 0(%a0)
	addi	%a2, %zero, 151
	fsw	%f0, 0(%a2)
	flw	%f0, 1(%a0)
	addi	%a2, %zero, 151
	fsw	%f0, 1(%a2)
	flw	%f0, 2(%a0)
	addi	%a2, %zero, 151
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
	j	bnei_cont.17515
bnei_else.17514:
bnei_cont.17515:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.17516
	addi	%v1, %zero, 166
	lw	%v1, 1(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	j	bnei_cont.17517
bnei_else.17516:
bnei_cont.17517:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.17518
	addi	%v1, %zero, 166
	lw	%v1, 2(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	j	bnei_cont.17519
bnei_else.17518:
bnei_cont.17519:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.17520
	addi	%v1, %zero, 166
	lw	%v1, 3(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	j	bnei_cont.17521
bnei_else.17520:
bnei_cont.17521:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.17522
	addi	%v0, %zero, 166
	lw	%v0, 4(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 151
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
bnei_else.17522:
	jr	%ra
calc_diffuse_using_1point.2986:
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 137
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 137
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 137
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
	beqi	%v0, 0, bnei_else.17524
	addi	%a2, %zero, 166
	lw	%a2, 0(%a2)
	flw	%f0, 0(%a1)
	addi	%t0, %zero, 151
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a1)
	addi	%t0, %zero, 151
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a1)
	addi	%t0, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17526
	addi	%v1, %zero, 0
	j	fbgt_cont.17527
fbgt_else.17526:
	addi	%v1, %zero, 1
fbgt_cont.17527:
	beqi	%v1, 0, bnei_else.17528
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17529
bnei_else.17528:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.17529:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17525
bnei_else.17524:
bnei_cont.17525:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.17530
	addi	%v1, %zero, 166
	lw	%v1, 1(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17532
	addi	%v1, %zero, 0
	j	fbgt_cont.17533
fbgt_else.17532:
	addi	%v1, %zero, 1
fbgt_cont.17533:
	beqi	%v1, 0, bnei_else.17534
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17535
bnei_else.17534:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.17535:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17531
bnei_else.17530:
bnei_cont.17531:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.17536
	addi	%v1, %zero, 166
	lw	%v1, 2(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17538
	addi	%v1, %zero, 0
	j	fbgt_cont.17539
fbgt_else.17538:
	addi	%v1, %zero, 1
fbgt_cont.17539:
	beqi	%v1, 0, bnei_else.17540
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17541
bnei_else.17540:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.17541:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17537
bnei_else.17536:
bnei_cont.17537:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.17542
	addi	%v1, %zero, 166
	lw	%v1, 3(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 151
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17544
	addi	%v1, %zero, 0
	j	fbgt_cont.17545
fbgt_else.17544:
	addi	%v1, %zero, 1
fbgt_cont.17545:
	beqi	%v1, 0, bnei_else.17546
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17547
bnei_else.17546:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.17547:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17543
bnei_else.17542:
bnei_cont.17543:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.17548
	addi	%v0, %zero, 166
	lw	%v0, 4(%v0)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17550
	addi	%v1, %zero, 0
	j	fbgt_cont.17551
fbgt_else.17550:
	addi	%v1, %zero, 1
fbgt_cont.17551:
	beqi	%v1, 0, bnei_else.17552
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17553
bnei_else.17552:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.17553:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17549
bnei_else.17548:
bnei_cont.17549:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
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
	addi	%t2, %zero, 137
	fsw	%f0, 0(%t2)
	flw	%f0, 1(%v1)
	addi	%t2, %zero, 137
	fsw	%f0, 1(%t2)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 137
	fsw	%f0, 2(%v1)
	add	%at, %a3, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 137
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 137
	fsw	%f0, 2(%v1)
	add	%at, %t0, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 137
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 137
	fsw	%f0, 2(%v1)
	add	%at, %t1, %a2
	lw	%v1, 0(%at)
	addi	%a3, %zero, 137
	flw	%f0, 0(%a3)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 1(%a3)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 137
	flw	%f0, 2(%a3)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 137
	fsw	%f0, 2(%v1)
	add	%at, %a1, %a2
	lw	%v1, 0(%at)
	addi	%a1, %zero, 137
	flw	%f0, 0(%a1)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 137
	flw	%f0, 1(%a1)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 137
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 137
	flw	%f0, 2(%a1)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 137
	fsw	%f0, 2(%v1)
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	lw	%v0, 4(%v0)
	add	%at, %v0, %a2
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
	j	vecaccumv.2679
do_without_neighbors.2995:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17554
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17555
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.17556
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 137
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 137
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 137
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
	addi	%a0, %zero, 137
	addi	%a1, %zero, 140
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecaccumv.2679
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.17557
bnei_else.17556:
bnei_cont.17557:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17558
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17559
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.17560
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.17561
bnei_else.17560:
bnei_cont.17561:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.17559:
	jr	%ra
bgt_else.17558:
	jr	%ra
bgti_else.17555:
	jr	%ra
bgt_else.17554:
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.17566
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.17567
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
	bne	%t2, %t1, beq_else.17568
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17570
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17572
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.17574
	addi	%t1, %zero, 1
	j	beq_cont.17575
beq_else.17574:
	addi	%t1, %zero, 0
beq_cont.17575:
	j	beq_cont.17573
beq_else.17572:
	addi	%t1, %zero, 0
beq_cont.17573:
	j	beq_cont.17571
beq_else.17570:
	addi	%t1, %zero, 0
beq_cont.17571:
	j	beq_cont.17569
beq_else.17568:
	addi	%t1, %zero, 0
beq_cont.17569:
	beqi	%t1, 0, bnei_else.17576
	lw	%t0, 3(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a3, 5(%sp)
	beqi	%t0, 0, bnei_else.17577
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17578
bnei_else.17577:
bnei_cont.17578:
	lw	%v0, 5(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17579
	lw	%a2, 2(%a1)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	blti	%a2, 0, bgti_else.17580
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
	bne	%t0, %a2, beq_else.17581
	lw	%t0, 1(%sp)
	add	%at, %t0, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17583
	addi	%t1, %v0, -1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17585
	addi	%t1, %v0, 1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17587
	addi	%a2, %zero, 1
	j	beq_cont.17588
beq_else.17587:
	addi	%a2, %zero, 0
beq_cont.17588:
	j	beq_cont.17586
beq_else.17585:
	addi	%a2, %zero, 0
beq_cont.17586:
	j	beq_cont.17584
beq_else.17583:
	addi	%a2, %zero, 0
beq_cont.17584:
	j	beq_cont.17582
beq_else.17581:
	addi	%a2, %zero, 0
beq_cont.17582:
	beqi	%a2, 0, bnei_else.17589
	lw	%a1, 3(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	sw	%v1, 6(%sp)
	beqi	%a1, 0, bnei_else.17590
	lw	%a1, 1(%sp)
	addi	%a2, %v1, 0
	addi	%v1, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.17591
bnei_else.17590:
bnei_cont.17591:
	lw	%v0, 6(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 1(%sp)
	j	try_exploit_neighbors.3011
bnei_else.17589:
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	j	do_without_neighbors.2995
bgti_else.17580:
	jr	%ra
bgt_else.17579:
	jr	%ra
bnei_else.17576:
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.17594
	lw	%v1, 2(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	blti	%v1, 0, bgti_else.17595
	lw	%v1, 3(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	sw	%v0, 7(%sp)
	sw	%a3, 5(%sp)
	beqi	%v1, 0, bnei_else.17596
	addi	%v1, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.17597
bnei_else.17596:
bnei_cont.17597:
	lw	%v0, 5(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 7(%sp)
	j	do_without_neighbors.2995
bgti_else.17595:
	jr	%ra
bgt_else.17594:
	jr	%ra
bgti_else.17567:
	jr	%ra
bgt_else.17566:
	jr	%ra
write_rgb.3022:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17602
	blti	%v0, 0, bgti_else.17604
	j	bgti_cont.17605
bgti_else.17604:
	addi	%v0, %zero, 0
bgti_cont.17605:
	j	bgt_cont.17603
bgt_else.17602:
	addi	%v0, %zero, 255
bgt_cont.17603:
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
	addi	%v0, %zero, 140
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17606
	blti	%v0, 0, bgti_else.17608
	j	bgti_cont.17609
bgti_else.17608:
	addi	%v0, %zero, 0
bgti_cont.17609:
	j	bgt_cont.17607
bgt_else.17606:
	addi	%v0, %zero, 255
bgt_cont.17607:
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
	addi	%v0, %zero, 140
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17610
	blti	%v0, 0, bgti_else.17612
	j	bgti_cont.17613
bgti_else.17612:
	addi	%v0, %zero, 0
bgti_cont.17613:
	j	bgt_cont.17611
bgt_else.17610:
	addi	%v0, %zero, 255
bgt_cont.17611:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17614
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17615
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.17616
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 444(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 137
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 137
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 166
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a3, %zero, 151
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
	addi	%a1, %zero, 137
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 137
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 137
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17617
bnei_else.17616:
bnei_cont.17617:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.17618
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.17619
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.17620
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 444(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 137
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 137
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 166
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a3, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17622
	addi	%v1, %zero, 0
	j	fbgt_cont.17623
fbgt_else.17622:
	addi	%v1, %zero, 1
fbgt_cont.17623:
	beqi	%v1, 0, bnei_else.17624
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.17625
bnei_else.17624:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.17625:
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
	addi	%a1, %zero, 137
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 137
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 137
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17621
bnei_else.17620:
bnei_cont.17621:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3024
bgti_else.17619:
	jr	%ra
bgt_else.17618:
	jr	%ra
bgti_else.17615:
	jr	%ra
bgt_else.17614:
	jr	%ra
pretrace_pixels.3027:
	blti	%v1, 0, bgti_else.17630
	addi	%a1, %zero, 147
	flw	%f3, 0(%a1)
	addi	%a1, %zero, 145
	lw	%a1, 0(%a1)
	sub	%a1, %v1, %a1
	itof	%f4, %a1
	fmul	%f3, %f3, %f4
	addi	%a1, %zero, 154
	flw	%f4, 0(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a1, %zero, 163
	fsw	%f4, 0(%a1)
	addi	%a1, %zero, 154
	flw	%f4, 1(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a1, %zero, 163
	fsw	%f4, 1(%a1)
	addi	%a1, %zero, 154
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a1, %zero, 163
	fsw	%f3, 2(%a1)
	addi	%a1, %zero, 0
	addi	%a2, %zero, 163
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
	flw	%f0, 444(%zero)
	addi	%v0, %zero, 140
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 140
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 64
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 64
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 64
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	flw	%f0, 448(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	flw	%f1, 444(%zero)
	addi	%a2, %zero, 163
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
	addi	%a1, %zero, 140
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%a0)
	addi	%a1, %zero, 140
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%a0)
	addi	%a1, %zero, 140
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
	blti	%a2, 0, bgti_else.17631
	lw	%a2, 3(%a0)
	lw	%a2, 0(%a2)
	sw	%a0, 6(%sp)
	beqi	%a2, 0, bnei_else.17633
	lw	%a2, 6(%a0)
	lw	%a2, 0(%a2)
	flw	%f0, 444(%zero)
	addi	%a3, %zero, 137
	fsw	%f0, 0(%a3)
	addi	%a3, %zero, 137
	fsw	%f0, 1(%a3)
	addi	%a3, %zero, 137
	fsw	%f0, 2(%a3)
	lw	%a3, 7(%a0)
	lw	%t0, 1(%a0)
	addi	%t1, %zero, 166
	add	%at, %t1, %a2
	lw	%a2, 0(%at)
	lw	%a3, 0(%a3)
	lw	%t0, 0(%t0)
	flw	%f0, 0(%t0)
	addi	%t1, %zero, 151
	fsw	%f0, 0(%t1)
	flw	%f0, 1(%t0)
	addi	%t1, %zero, 151
	fsw	%f0, 1(%t1)
	flw	%f0, 2(%t0)
	addi	%t1, %zero, 151
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
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.17635
	addi	%v1, %zero, 0
	j	fbgt_cont.17636
fbgt_else.17635:
	addi	%v1, %zero, 1
fbgt_cont.17636:
	beqi	%v1, 0, bnei_else.17637
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.17638
bnei_else.17637:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.17638:
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
	addi	%a0, %zero, 137
	flw	%f0, 0(%a0)
	fsw	%f0, 0(%v1)
	addi	%a0, %zero, 137
	flw	%f0, 1(%a0)
	fsw	%f0, 1(%v1)
	addi	%a0, %zero, 137
	flw	%f0, 2(%a0)
	fsw	%f0, 2(%v1)
	j	bnei_cont.17634
bnei_else.17633:
bnei_cont.17634:
	addi	%v1, %zero, 1
	lw	%v0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.17632
bgti_else.17631:
bgti_cont.17632:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.17639
	addi	%a0, %v0, -5
	j	bgti_cont.17640
bgti_else.17639:
	add	%a0, %zero, %v0
bgti_cont.17640:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 5(%sp)
	j	pretrace_pixels.3027
bgti_else.17630:
	jr	%ra
pretrace_line.3034:
	addi	%a1, %zero, 147
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 145
	lw	%a1, 1(%a1)
	sub	%v1, %v1, %a1
	itof	%f1, %v1
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 157
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 160
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	addi	%v1, %zero, 157
	flw	%f2, 1(%v1)
	fmul	%f2, %f0, %f2
	addi	%v1, %zero, 160
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	addi	%v1, %zero, 157
	flw	%f3, 2(%v1)
	fmul	%f0, %f0, %f3
	addi	%v1, %zero, 160
	flw	%f3, 2(%v1)
	fadd	%f0, %f0, %f3
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	j	pretrace_pixels.3027
scan_pixel.3038:
	addi	%a3, %zero, 143
	lw	%a3, 0(%a3)
	blt	%v0, %a3, bgt_else.17642
	jr	%ra
bgt_else.17642:
	add	%at, %a1, %v0
	lw	%a3, 0(%at)
	lw	%a3, 0(%a3)
	flw	%f0, 0(%a3)
	addi	%t0, %zero, 140
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a3)
	addi	%t0, %zero, 140
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a3)
	addi	%a3, %zero, 140
	fsw	%f0, 2(%a3)
	addi	%a3, %zero, 143
	lw	%a3, 1(%a3)
	addi	%t0, %v1, 1
	blt	%t0, %a3, bgt_else.17644
	addi	%a3, %zero, 0
	j	bgt_cont.17645
bgt_else.17644:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.17646
	addi	%a3, %zero, 0
	j	bgt_cont.17647
bgt_else.17646:
	addi	%a3, %zero, 143
	lw	%a3, 0(%a3)
	addi	%t0, %v0, 1
	blt	%t0, %a3, bgt_else.17648
	addi	%a3, %zero, 0
	j	bgt_cont.17649
bgt_else.17648:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17650
	addi	%a3, %zero, 0
	j	bgt_cont.17651
bgt_else.17650:
	addi	%a3, %zero, 1
bgt_cont.17651:
bgt_cont.17649:
bgt_cont.17647:
bgt_cont.17645:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	beqi	%a3, 0, bnei_else.17652
	addi	%a3, %zero, 0
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	lw	%t1, 2(%t0)
	lw	%t1, 0(%t1)
	blti	%t1, 0, bgti_else.17654
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	lw	%t1, 0(%t1)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17656
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17658
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17660
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17662
	addi	%t1, %zero, 1
	j	beq_cont.17663
beq_else.17662:
	addi	%t1, %zero, 0
beq_cont.17663:
	j	beq_cont.17661
beq_else.17660:
	addi	%t1, %zero, 0
beq_cont.17661:
	j	beq_cont.17659
beq_else.17658:
	addi	%t1, %zero, 0
beq_cont.17659:
	j	beq_cont.17657
beq_else.17656:
	addi	%t1, %zero, 0
beq_cont.17657:
	beqi	%t1, 0, bnei_else.17664
	lw	%t0, 3(%t0)
	lw	%t0, 0(%t0)
	beqi	%t0, 0, bnei_else.17666
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.17667
bnei_else.17666:
bnei_cont.17667:
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
	j	bnei_cont.17665
bnei_else.17664:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17665:
	j	bgti_cont.17655
bgti_else.17654:
bgti_cont.17655:
	j	bnei_cont.17653
bnei_else.17652:
	add	%at, %a1, %v0
	lw	%a3, 0(%at)
	addi	%t0, %zero, 0
	lw	%t1, 2(%a3)
	lw	%t1, 0(%t1)
	blti	%t1, 0, bgti_else.17668
	lw	%t1, 3(%a3)
	lw	%t1, 0(%t1)
	sw	%a3, 5(%sp)
	beqi	%t1, 0, bnei_else.17670
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.17671
bnei_else.17670:
bnei_cont.17671:
	addi	%v1, %zero, 1
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.17669
bgti_else.17668:
bgti_cont.17669:
bnei_cont.17653:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17672
	blti	%v0, 0, bgti_else.17674
	j	bgti_cont.17675
bgti_else.17674:
	addi	%v0, %zero, 0
bgti_cont.17675:
	j	bgt_cont.17673
bgt_else.17672:
	addi	%v0, %zero, 255
bgt_cont.17673:
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
	addi	%v0, %zero, 140
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17676
	blti	%v0, 0, bgti_else.17678
	j	bgti_cont.17679
bgti_else.17678:
	addi	%v0, %zero, 0
bgti_cont.17679:
	j	bgt_cont.17677
bgt_else.17676:
	addi	%v0, %zero, 255
bgt_cont.17677:
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
	addi	%v0, %zero, 140
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.17680
	blti	%v0, 0, bgti_else.17682
	j	bgti_cont.17683
bgti_else.17682:
	addi	%v0, %zero, 0
bgti_cont.17683:
	j	bgt_cont.17681
bgt_else.17680:
	addi	%v0, %zero, 255
bgt_cont.17681:
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
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	blt	%v0, %v1, bgt_else.17684
	jr	%ra
bgt_else.17684:
	lw	%a1, 3(%sp)
	add	%at, %a1, %v0
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 140
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 140
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 140
	fsw	%f0, 2(%v1)
	addi	%v1, %zero, 143
	lw	%v1, 1(%v1)
	lw	%a0, 2(%sp)
	addi	%a2, %a0, 1
	blt	%a2, %v1, bgt_else.17686
	addi	%v1, %zero, 0
	j	bgt_cont.17687
bgt_else.17686:
	addi	%at, %zero, 0
	blt	%at, %a0, bgt_else.17688
	addi	%v1, %zero, 0
	j	bgt_cont.17689
bgt_else.17688:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a2, %v0, 1
	blt	%a2, %v1, bgt_else.17690
	addi	%v1, %zero, 0
	j	bgt_cont.17691
bgt_else.17690:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17692
	addi	%v1, %zero, 0
	j	bgt_cont.17693
bgt_else.17692:
	addi	%v1, %zero, 1
bgt_cont.17693:
bgt_cont.17691:
bgt_cont.17689:
bgt_cont.17687:
	sw	%v0, 6(%sp)
	beqi	%v1, 0, bnei_else.17694
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
	j	bnei_cont.17695
bnei_else.17694:
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
bnei_cont.17695:
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
	addi	%a3, %zero, 143
	lw	%a3, 1(%a3)
	blt	%v0, %a3, bgt_else.17696
	jr	%ra
bgt_else.17696:
	addi	%a3, %zero, 143
	lw	%a3, 1(%a3)
	addi	%a3, %a3, -1
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	blt	%v0, %a3, bgt_else.17698
	j	bgt_cont.17699
bgt_else.17698:
	addi	%a3, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bgt_cont.17699:
	addi	%v0, %zero, 0
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.17700
	j	bgt_cont.17701
bgt_else.17700:
	lw	%a1, 4(%sp)
	lw	%v1, 0(%a1)
	lw	%v1, 0(%v1)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 140
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 140
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 140
	fsw	%f0, 2(%v1)
	addi	%v1, %zero, 143
	lw	%v1, 1(%v1)
	lw	%a0, 3(%sp)
	addi	%a2, %a0, 1
	blt	%a2, %v1, bgt_else.17702
	addi	%v1, %zero, 0
	j	bgt_cont.17703
bgt_else.17702:
	addi	%at, %zero, 0
	blt	%at, %a0, bgt_else.17704
	addi	%v1, %zero, 0
	j	bgt_cont.17705
bgt_else.17704:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%at, %zero, 1
	blt	%at, %v1, bgt_else.17706
	addi	%v1, %zero, 0
	j	bgt_cont.17707
bgt_else.17706:
	addi	%v1, %zero, 0
bgt_cont.17707:
bgt_cont.17705:
bgt_cont.17703:
	beqi	%v1, 0, bnei_else.17708
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
	j	bnei_cont.17709
bnei_else.17708:
	lw	%v0, 0(%a1)
	addi	%v1, %zero, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.17709:
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
bgt_cont.17701:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.17710
	addi	%a0, %v0, -5
	j	bgti_cont.17711
bgti_else.17710:
	add	%a0, %zero, %v0
bgti_cont.17711:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	blt	%v1, %v0, bgt_else.17712
	jr	%ra
bgt_else.17712:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	blt	%v1, %v0, bgt_else.17714
	j	bgt_cont.17715
bgt_else.17714:
	addi	%v0, %v1, 1
	lw	%a1, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	pretrace_line.3034
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bgt_cont.17715:
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
	blti	%v1, 5, bgti_else.17716
	addi	%a2, %v1, -5
	j	bgti_cont.17717
bgti_else.17716:
	add	%a2, %zero, %v1
bgti_cont.17717:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	j	scan_line.3044
create_float5x3array.3050:
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 2(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	blti	%v1, 0, bgti_else.17718
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
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
	blti	%v0, 0, bgti_else.17719
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
bgti_else.17719:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.17718:
	jr	%ra
calc_dirvec.3064:
	blti	%v0, 5, bgti_else.17720
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 448(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
	flw	%f3, 448(%zero)
	fdiv	%f2, %f3, %f2
	addi	%v0, %zero, 166
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
bgti_else.17720:
	fmul	%f0, %f1, %f1
	flw	%f1, 419(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f1, %f1, %f0
	flw	%f4, 444(%zero)
	fblt	%f1, %f4, fbgt_else.17722
	addi	%a1, %zero, 1
	j	fbgt_cont.17723
fbgt_else.17722:
	addi	%a1, %zero, 0
fbgt_cont.17723:
	fabs	%f4, %f1
	flw	%f5, 432(%zero)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f2, 5(%sp)
	fblt	%f4, %f5, fbgt_else.17724
	flw	%f1, 431(%zero)
	sw	%a1, 6(%sp)
	fblt	%f4, %f1, fbgt_else.17726
	flw	%f1, 453(%zero)
	flw	%f5, 448(%zero)
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
	j	fbgt_cont.17727
fbgt_else.17726:
	flw	%f1, 452(%zero)
	flw	%f5, 448(%zero)
	fsub	%f5, %f4, %f5
	flw	%f6, 448(%zero)
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
fbgt_cont.17727:
	lw	%v0, 6(%sp)
	beqi	%v0, 0, bnei_else.17728
	j	bnei_cont.17729
bnei_else.17728:
	fneg	%f0, %f0
bnei_cont.17729:
	j	fbgt_cont.17725
fbgt_else.17724:
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
fbgt_cont.17725:
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
	flw	%f2, 419(%zero)
	fadd	%f1, %f1, %f2
	fsqrt	%f1, %f1
	flw	%f2, 448(%zero)
	fdiv	%f2, %f2, %f1
	flw	%f3, 444(%zero)
	fblt	%f2, %f3, fbgt_else.17730
	addi	%v1, %zero, 1
	j	fbgt_cont.17731
fbgt_else.17730:
	addi	%v1, %zero, 0
fbgt_cont.17731:
	fabs	%f3, %f2
	flw	%f4, 432(%zero)
	fsw	%f0, 11(%sp)
	sw	%v0, 12(%sp)
	fsw	%f1, 13(%sp)
	fblt	%f3, %f4, fbgt_else.17732
	flw	%f2, 431(%zero)
	sw	%v1, 14(%sp)
	fblt	%f3, %f2, fbgt_else.17734
	flw	%f2, 453(%zero)
	flw	%f4, 448(%zero)
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
	j	fbgt_cont.17735
fbgt_else.17734:
	flw	%f2, 452(%zero)
	flw	%f4, 448(%zero)
	fsub	%f4, %f3, %f4
	flw	%f5, 448(%zero)
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
fbgt_cont.17735:
	lw	%v0, 14(%sp)
	beqi	%v0, 0, bnei_else.17736
	j	bnei_cont.17737
bnei_else.17736:
	fneg	%f0, %f0
bnei_cont.17737:
	j	fbgt_cont.17733
fbgt_else.17732:
	fmov	%f0, %f2
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	kernel_atan.2612
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
fbgt_cont.17733:
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
	blti	%v0, 0, bgti_else.17738
	itof	%f1, %v0
	flw	%f2, 476(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 416(%zero)
	fsub	%f2, %f1, %f2
	addi	%a1, %zero, 0
	flw	%f1, 444(%zero)
	flw	%f3, 444(%zero)
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
	flw	%f1, 476(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 419(%zero)
	fadd	%f2, %f0, %f1
	addi	%v1, %zero, 0
	flw	%f0, 444(%zero)
	flw	%f1, 444(%zero)
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
	blti	%v1, 5, bgti_else.17739
	addi	%v1, %v1, -5
	j	bgti_cont.17740
bgti_else.17739:
bgti_cont.17740:
	flw	%f0, 0(%sp)
	lw	%a0, 2(%sp)
	j	calc_dirvecs.3072
bgti_else.17738:
	jr	%ra
calc_dirvec_rows.3077:
	blti	%v0, 0, bgti_else.17742
	itof	%f0, %v0
	flw	%f1, 476(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 416(%zero)
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
	blti	%v1, 5, bgti_else.17743
	addi	%v1, %v1, -5
	j	bgti_cont.17744
bgti_else.17743:
bgti_cont.17744:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.17745
	itof	%f0, %v0
	flw	%f1, 476(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 416(%zero)
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
	blti	%v1, 5, bgti_else.17746
	addi	%v1, %v1, -5
	j	bgti_cont.17747
bgti_else.17746:
bgti_cont.17747:
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3077
bgti_else.17745:
	jr	%ra
bgti_else.17742:
	jr	%ra
create_dirvec_elements.3083:
	blti	%v1, 0, bgti_else.17750
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
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
	blti	%v0, 0, bgti_else.17751
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
	blti	%v0, 0, bgti_else.17752
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
	blti	%v0, 0, bgti_else.17753
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
bgti_else.17753:
	jr	%ra
bgti_else.17752:
	jr	%ra
bgti_else.17751:
	jr	%ra
bgti_else.17750:
	jr	%ra
create_dirvecs.3086:
	blti	%v0, 0, bgti_else.17758
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
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
	addi	%v1, %zero, 166
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 166
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	blti	%v0, 0, bgti_else.17759
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
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
	addi	%v1, %zero, 166
	lw	%a0, 7(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 166
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
bgti_else.17759:
	jr	%ra
bgti_else.17758:
	jr	%ra
init_dirvec_constants.3088:
	blti	%v1, 0, bgti_else.17762
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
	blti	%v0, 0, bgti_else.17763
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 2(%sp)
	blti	%a1, 0, bgti_else.17764
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 3(%sp)
	beqi	%t1, 1, bnei_else.17766
	beqi	%t1, 2, bnei_else.17768
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
	j	bnei_cont.17769
bnei_else.17768:
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
bnei_cont.17769:
	j	bnei_cont.17767
bnei_else.17766:
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
bnei_cont.17767:
	addi	%v1, %v1, -1
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.17765
bgti_else.17764:
bgti_cont.17765:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17770
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
	blti	%v0, 0, bgti_else.17771
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.17772
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.17774
	beqi	%t1, 2, bnei_else.17776
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
	j	bnei_cont.17777
bnei_else.17776:
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
bnei_cont.17777:
	j	bnei_cont.17775
bnei_else.17774:
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
bnei_cont.17775:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.17773
bgti_else.17772:
bgti_cont.17773:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
bgti_else.17771:
	jr	%ra
bgti_else.17770:
	jr	%ra
bgti_else.17763:
	jr	%ra
bgti_else.17762:
	jr	%ra
init_vecset_constants.3091:
	blti	%v0, 0, bgti_else.17782
	addi	%v1, %zero, 166
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	blti	%a1, 0, bgti_else.17783
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 2(%sp)
	beqi	%t1, 1, bnei_else.17785
	beqi	%t1, 2, bnei_else.17787
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
	j	bnei_cont.17788
bnei_else.17787:
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
bnei_cont.17788:
	j	bnei_cont.17786
bnei_else.17785:
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
bnei_cont.17786:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.17784
bgti_else.17783:
bgti_cont.17784:
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
	blti	%a0, 0, bgti_else.17789
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 5(%sp)
	beqi	%t0, 1, bnei_else.17791
	beqi	%t0, 2, bnei_else.17793
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
	j	bnei_cont.17794
bnei_else.17793:
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
bnei_cont.17794:
	j	bnei_cont.17792
bnei_else.17791:
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
bnei_cont.17792:
	addi	%v1, %v1, -1
	lw	%v0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bgti_cont.17790
bgti_else.17789:
bgti_cont.17790:
	addi	%v1, %zero, 116
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17795
	addi	%v1, %zero, 166
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
	blti	%a0, 0, bgti_else.17796
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 10(%sp)
	beqi	%t0, 1, bnei_else.17798
	beqi	%t0, 2, bnei_else.17800
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
	j	bnei_cont.17801
bnei_else.17800:
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
bnei_cont.17801:
	j	bnei_cont.17799
bnei_else.17798:
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
bnei_cont.17799:
	addi	%v1, %v1, -1
	lw	%v0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.17797
bgti_else.17796:
bgti_cont.17797:
	addi	%v1, %zero, 117
	lw	%v0, 9(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17802
	addi	%v1, %zero, 166
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	blti	%a1, 0, bgti_else.17803
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 15(%sp)
	beqi	%t1, 1, bnei_else.17805
	beqi	%t1, 2, bnei_else.17807
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
	j	bnei_cont.17808
bnei_else.17807:
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
bnei_cont.17808:
	j	bnei_cont.17806
bnei_else.17805:
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
bnei_cont.17806:
	addi	%v1, %v1, -1
	lw	%v0, 15(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.17804
bgti_else.17803:
bgti_cont.17804:
	addi	%v1, %zero, 118
	lw	%v0, 14(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17809
	addi	%v1, %zero, 166
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
bgti_else.17809:
	jr	%ra
bgti_else.17802:
	jr	%ra
bgti_else.17795:
	jr	%ra
bgti_else.17782:
	jr	%ra
setup_rect_reflection.3102:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 448(%zero)
	lw	%v1, 7(%v1)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 67
	flw	%f1, 0(%v1)
	fneg	%f1, %f1
	addi	%v1, %zero, 67
	flw	%f2, 1(%v1)
	fneg	%f2, %f2
	addi	%v1, %zero, 67
	flw	%f3, 2(%v1)
	fneg	%f3, %f3
	addi	%v1, %v0, 1
	addi	%a1, %zero, 67
	flw	%f4, 0(%a1)
	addi	%a1, %zero, 3
	flw	%f5, 444(%zero)
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
	blti	%a1, 0, bgti_else.17814
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17816
	beqi	%a3, 2, bnei_else.17818
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
	j	bnei_cont.17819
bnei_else.17818:
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
bnei_cont.17819:
	j	bnei_cont.17817
bnei_else.17816:
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
bnei_cont.17817:
	addi	%v1, %v1, -1
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.17815
bgti_else.17814:
bgti_cont.17815:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 234
	lw	%a0, 2(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	lw	%v1, 1(%sp)
	addi	%a1, %v1, 2
	addi	%a2, %zero, 67
	flw	%f1, 1(%a2)
	addi	%a2, %zero, 3
	flw	%f2, 444(%zero)
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
	blti	%a1, 0, bgti_else.17820
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17822
	beqi	%a3, 2, bnei_else.17824
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
	j	bnei_cont.17825
bnei_else.17824:
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
bnei_cont.17825:
	j	bnei_cont.17823
bnei_else.17822:
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
bnei_cont.17823:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.17821
bgti_else.17820:
bgti_cont.17821:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 234
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 1(%sp)
	addi	%a0, %a0, 3
	addi	%a1, %zero, 67
	flw	%f1, 2(%a1)
	addi	%a1, %zero, 3
	flw	%f2, 444(%zero)
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
	blti	%a1, 0, bgti_else.17826
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17828
	beqi	%a3, 2, bnei_else.17830
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
	j	bnei_cont.17831
bnei_else.17830:
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
bnei_cont.17831:
	j	bnei_cont.17829
bnei_else.17828:
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
bnei_cont.17829:
	addi	%v1, %v1, -1
	lw	%v0, 23(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.17827
bgti_else.17826:
bgti_cont.17827:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 4(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 23(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 20(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 234
	lw	%a0, 19(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3105:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 448(%zero)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	lw	%a1, 4(%v1)
	addi	%a2, %zero, 67
	flw	%f1, 0(%a2)
	flw	%f2, 0(%a1)
	fmul	%f1, %f1, %f2
	addi	%a2, %zero, 67
	flw	%f2, 1(%a2)
	flw	%f3, 1(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	addi	%a2, %zero, 67
	flw	%f2, 2(%a2)
	flw	%f3, 2(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	flw	%f2, 471(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f2, %f2, %f1
	addi	%a1, %zero, 67
	flw	%f3, 0(%a1)
	fsub	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	lw	%a1, 4(%v1)
	flw	%f4, 1(%a1)
	fmul	%f3, %f3, %f4
	fmul	%f3, %f3, %f1
	addi	%a1, %zero, 67
	flw	%f4, 1(%a1)
	fsub	%f3, %f3, %f4
	flw	%f4, 471(%zero)
	lw	%v1, 4(%v1)
	flw	%f5, 2(%v1)
	fmul	%f4, %f4, %f5
	fmul	%f1, %f4, %f1
	addi	%v1, %zero, 67
	flw	%f4, 2(%v1)
	fsub	%f1, %f1, %f4
	addi	%v1, %zero, 3
	flw	%f4, 444(%zero)
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
	blti	%a1, 0, bgti_else.17833
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.17835
	beqi	%a3, 2, bnei_else.17837
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
	j	bnei_cont.17838
bnei_else.17837:
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
bnei_cont.17838:
	j	bnei_cont.17836
bnei_else.17835:
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
bnei_cont.17836:
	addi	%v1, %v1, -1
	lw	%v0, 7(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.17834
bgti_else.17833:
bgti_cont.17834:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 7(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 234
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
rt.3110:
	lw	%a0, 1(%k1)
	addi	%a1, %zero, 143
	sw	%v0, 0(%a1)
	addi	%a1, %zero, 143
	sw	%v1, 1(%a1)
	srl	%a1, %v0, 1
	addi	%a2, %zero, 145
	sw	%a1, 0(%a2)
	srl	%v1, %v1, 1
	addi	%a1, %zero, 145
	sw	%v1, 1(%a1)
	flw	%f0, 415(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 147
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 444(%zero)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
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
	lw	%v0, 1(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	init_line_elements.3054
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
	sw	%v0, 9(%sp)
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	create_float5x3array.3050
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
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	create_float5x3array.3050
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_float5x3array.3050
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	sw	%v0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	create_float5x3array.3050
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 17(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 16(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 15(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 14(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 11(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 10(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_line_elements.3054
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	flw	%f0, 444(%zero)
	sw	%v0, 18(%sp)
	sw	%v1, 19(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	sw	%v0, 20(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	create_float5x3array.3050
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
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 22(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	sw	%v0, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	create_float5x3array.3050
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	sw	%v0, 24(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	create_float5x3array.3050
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	sw	%v0, 26(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	create_float5x3array.3050
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 26(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 25(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 24(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 23(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 22(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 21(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 20(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 19(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	init_line_elements.3054
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	sw	%v0, 27(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_screen_settings.2756
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	read_light.2758
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v0, %zero, 0
	sw	%v0, 28(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	read_nth_object.2763
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	beqi	%v0, 0, bnei_else.17840
	addi	%v0, %zero, 1
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	read_object.2765
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bnei_cont.17841
bnei_else.17840:
	addi	%v0, %zero, 0
	lw	%v1, 28(%sp)
	sw	%v1, 0(%v0)
bnei_cont.17841:
	addi	%v0, %zero, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	read_and_network.2773
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	read_or_network.2771
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v1, %zero, 123
	sw	%v0, 0(%v1)
	addi	%v0, %zero, 80
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2627
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2627
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2627
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 4
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	create_dirvecs.3086
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	calc_dirvec_rows.3077
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v0, %zero, 166
	lw	%v0, 4(%v0)
	lw	%v1, 119(%v0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%a0, %a0, -1
	sw	%v0, 29(%sp)
	blti	%a0, 0, bgti_else.17842
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 30(%sp)
	beqi	%t0, 1, bnei_else.17844
	beqi	%t0, 2, bnei_else.17846
	sw	%a0, 31(%sp)
	sw	%a2, 32(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_second_table.2867
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.17847
bnei_else.17846:
	sw	%a0, 31(%sp)
	sw	%a2, 32(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_surface_table.2864
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17847:
	j	bnei_cont.17845
bnei_else.17844:
	sw	%a0, 31(%sp)
	sw	%a2, 32(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_rect_table.2861
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.17845:
	addi	%v1, %v1, -1
	lw	%v0, 30(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bgti_cont.17843
bgti_else.17842:
bgti_cont.17843:
	addi	%v1, %zero, 118
	lw	%v0, 29(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v0, %zero, 166
	lw	%v0, 3(%v0)
	addi	%v1, %zero, 119
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v0, %zero, 2
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	init_vecset_constants.3091
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v0, %zero, 67
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 171
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 67
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 171
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 67
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 171
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.17848
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.17850
	j	bnei_cont.17851
bnei_else.17850:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 448(%zero)
	fblt	%f0, %f1, fbgt_else.17852
	addi	%a0, %zero, 0
	j	fbgt_cont.17853
fbgt_else.17852:
	addi	%a0, %zero, 1
fbgt_cont.17853:
	beqi	%a0, 0, bnei_else.17854
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.17856
	beqi	%a0, 2, bnei_else.17858
	j	bnei_cont.17859
bnei_else.17858:
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_surface_reflection.3105
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.17859:
	j	bnei_cont.17857
bnei_else.17856:
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_rect_reflection.3102
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.17857:
	j	bnei_cont.17855
bnei_else.17854:
bnei_cont.17855:
bnei_cont.17851:
	j	bgti_cont.17849
bgti_else.17848:
bgti_cont.17849:
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%v0, 18(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	pretrace_line.3034
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 2
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17860
	jr	%ra
bgt_else.17860:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%v1, 33(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.17862
	j	bgt_cont.17863
bgt_else.17862:
	addi	%v0, %zero, 1
	lw	%a1, 27(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	pretrace_line.3034
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
bgt_cont.17863:
	addi	%v0, %zero, 0
	lw	%v1, 33(%sp)
	lw	%a0, 9(%sp)
	lw	%a1, 18(%sp)
	lw	%a2, 27(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	scan_pixel.3038
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	addi	%v0, %zero, 1
	addi	%a2, %zero, 4
	lw	%v1, 18(%sp)
	lw	%a0, 27(%sp)
	lw	%a1, 9(%sp)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 61
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 64
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 436(%zero)
	addi	%v1, %zero, 126
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 131
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 134
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 137
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 147
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 148
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 151
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 154
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 157
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 160
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 163
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	flw	%f0, 444(%zero)
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
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, rt.3110
	sw	%v0, 0(%k1)
	lw	%v0, 4(%sp)
	sw	%v0, 1(%k1)
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
