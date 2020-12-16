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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16391
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16392
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16393
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16394
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16395
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16396
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16397
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16398
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16399
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16400
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16401
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16402
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16403
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16404
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16405
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16406
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10100
beq_else.16406:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16405:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16404:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16403:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16402:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16401:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16400:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16399:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16398:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16397:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16396:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16395:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16394:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16393:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16392:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16391:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6159.10104:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16407
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16408
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16409
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16410
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16411
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16412
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16413
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16414
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16414:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16413:
	jr	%ra
beq_else.16412:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16415
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16416
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16416:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16415:
	jr	%ra
beq_else.16411:
	jr	%ra
beq_else.16410:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16417
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16418
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16419
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16420
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16420:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16419:
	jr	%ra
beq_else.16418:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16421
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16422
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16422:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16421:
	jr	%ra
beq_else.16417:
	jr	%ra
beq_else.16409:
	jr	%ra
beq_else.16408:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16423
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16424
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16425
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16426
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16427
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16428
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16428:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16427:
	jr	%ra
beq_else.16426:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16429
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16430
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16430:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16429:
	jr	%ra
beq_else.16425:
	jr	%ra
beq_else.16424:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16431
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16432
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16433
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16434
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16434:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16433:
	jr	%ra
beq_else.16432:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16435
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16436
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16436:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16435:
	jr	%ra
beq_else.16431:
	jr	%ra
beq_else.16423:
	jr	%ra
beq_else.16407:
	jr	%ra
cos.2616:
	flw	%f1, 470(%zero)
	fabs	%f0, %f0
	flw	%f2, 469(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16437
	flw	%f3, 468(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16439
	flw	%f3, 467(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16441
	flw	%f3, 466(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16443
	flw	%f3, 465(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16445
	flw	%f3, 464(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16447
	flw	%f3, 463(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16449
	flw	%f3, 462(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16451
	flw	%f3, 461(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16453
	flw	%f3, 460(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16455
	flw	%f3, 459(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16457
	flw	%f3, 458(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16459
	flw	%f3, 457(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16461
	flw	%f3, 456(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16463
	flw	%f3, 455(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16465
	flw	%f3, 454(%zero)
	fadd	%f1, %f3, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.6155.10100
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16466
beq_else.16465:
	fadd	%f0, %fzero, %f3
beq_cont.16466:
	j	beq_cont.16464
beq_else.16463:
	fadd	%f0, %fzero, %f3
beq_cont.16464:
	j	beq_cont.16462
beq_else.16461:
	fadd	%f0, %fzero, %f3
beq_cont.16462:
	j	beq_cont.16460
beq_else.16459:
	fadd	%f0, %fzero, %f3
beq_cont.16460:
	j	beq_cont.16458
beq_else.16457:
	fadd	%f0, %fzero, %f3
beq_cont.16458:
	j	beq_cont.16456
beq_else.16455:
	fadd	%f0, %fzero, %f3
beq_cont.16456:
	j	beq_cont.16454
beq_else.16453:
	fadd	%f0, %fzero, %f3
beq_cont.16454:
	j	beq_cont.16452
beq_else.16451:
	fadd	%f0, %fzero, %f3
beq_cont.16452:
	j	beq_cont.16450
beq_else.16449:
	fadd	%f0, %fzero, %f3
beq_cont.16450:
	j	beq_cont.16448
beq_else.16447:
	fadd	%f0, %fzero, %f3
beq_cont.16448:
	j	beq_cont.16446
beq_else.16445:
	fadd	%f0, %fzero, %f3
beq_cont.16446:
	j	beq_cont.16444
beq_else.16443:
	fadd	%f0, %fzero, %f3
beq_cont.16444:
	j	beq_cont.16442
beq_else.16441:
	fadd	%f0, %fzero, %f3
beq_cont.16442:
	j	beq_cont.16440
beq_else.16439:
	fadd	%f0, %fzero, %f3
beq_cont.16440:
	j	beq_cont.16438
beq_else.16437:
	fadd	%f0, %fzero, %f2
beq_cont.16438:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10104
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16467
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16469
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16471
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16473
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16475
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16477
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16478
beq_else.16477:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.16478:
	j	beq_cont.16476
beq_else.16475:
	fadd	%f0, %fzero, %f2
beq_cont.16476:
	j	beq_cont.16474
beq_else.16473:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16479
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16481
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16482
beq_else.16481:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.16482:
	j	beq_cont.16480
beq_else.16479:
	fadd	%f0, %fzero, %f2
beq_cont.16480:
beq_cont.16474:
	j	beq_cont.16472
beq_else.16471:
	fadd	%f0, %fzero, %f2
beq_cont.16472:
	j	beq_cont.16470
beq_else.16469:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16483
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16485
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16487
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16489
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16490
beq_else.16489:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.16490:
	j	beq_cont.16488
beq_else.16487:
	fadd	%f0, %fzero, %f2
beq_cont.16488:
	j	beq_cont.16486
beq_else.16485:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16491
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16493
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16494
beq_else.16493:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.16494:
	j	beq_cont.16492
beq_else.16491:
	fadd	%f0, %fzero, %f2
beq_cont.16492:
beq_cont.16486:
	j	beq_cont.16484
beq_else.16483:
	fadd	%f0, %fzero, %f2
beq_cont.16484:
beq_cont.16470:
	j	beq_cont.16468
beq_else.16467:
	fadd	%f0, %fzero, %f2
beq_cont.16468:
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16495
	addi	%v0, %zero, 0
	j	beq_cont.16496
beq_else.16495:
	addi	%v0, %zero, 1
beq_cont.16496:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16497
	fsub	%f0, %f0, %f1
	j	beq_cont.16498
beq_else.16497:
beq_cont.16498:
	flw	%f2, 453(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16499
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16501
	addi	%v0, %zero, 1
	j	beq_cont.16502
beq_else.16501:
	addi	%v0, %zero, 0
beq_cont.16502:
	j	beq_cont.16500
beq_else.16499:
beq_cont.16500:
	flw	%f2, 453(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16503
	fsub	%f0, %f1, %f0
	j	beq_cont.16504
beq_else.16503:
beq_cont.16504:
	flw	%f1, 452(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16505
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
	j	beq_cont.16506
beq_else.16505:
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
beq_cont.16506:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16507
	fneg	%f0, %f0
	jr	%ra
beq_else.16507:
	jr	%ra
f.6155.10057:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16508
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16509
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16510
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16511
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16512
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16513
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16514
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16515
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16516
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16517
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16518
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16519
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16520
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16521
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16522
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16523
	flw	%f2, 471(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155.10057
beq_else.16523:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16522:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16521:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16520:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16519:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16518:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16517:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16516:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16515:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16514:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16513:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16512:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16511:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16510:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16509:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.16508:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6159.10061:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16524
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16525
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16526
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16527
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16528
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16529
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16530
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16531
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16531:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16530:
	jr	%ra
beq_else.16529:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16532
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16533
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16533:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16532:
	jr	%ra
beq_else.16528:
	jr	%ra
beq_else.16527:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16534
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16535
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16536
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16537
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16537:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16536:
	jr	%ra
beq_else.16535:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16538
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16539
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16539:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16538:
	jr	%ra
beq_else.16534:
	jr	%ra
beq_else.16526:
	jr	%ra
beq_else.16525:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16540
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16541
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16542
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16543
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16544
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16545
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16545:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16544:
	jr	%ra
beq_else.16543:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16546
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16547
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16547:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16546:
	jr	%ra
beq_else.16542:
	jr	%ra
beq_else.16541:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16548
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16549
	fsub	%f0, %f0, %f1
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16550
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16551
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16551:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16550:
	jr	%ra
beq_else.16549:
	flw	%f3, 471(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16552
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16553
	fsub	%f0, %f0, %f1
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16553:
	flw	%f2, 471(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.16552:
	jr	%ra
beq_else.16548:
	jr	%ra
beq_else.16540:
	jr	%ra
beq_else.16524:
	jr	%ra
sin.2618:
	flw	%f1, 470(%zero)
	flw	%f2, 444(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16554
	addi	%v0, %zero, 1
	j	beq_cont.16555
beq_else.16554:
	addi	%v0, %zero, 0
beq_cont.16555:
	fabs	%f0, %f0
	flw	%f2, 469(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16556
	flw	%f3, 468(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16558
	flw	%f3, 467(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16560
	flw	%f3, 466(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16562
	flw	%f3, 465(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16564
	flw	%f3, 464(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16566
	flw	%f3, 463(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16568
	flw	%f3, 462(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16570
	flw	%f3, 461(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16572
	flw	%f3, 460(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16574
	flw	%f3, 459(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16576
	flw	%f3, 458(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16578
	flw	%f3, 457(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16580
	flw	%f3, 456(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16582
	flw	%f3, 455(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16584
	flw	%f3, 454(%zero)
	fadd	%f1, %f3, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.6155.10057
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16585
beq_else.16584:
	fadd	%f0, %fzero, %f3
beq_cont.16585:
	j	beq_cont.16583
beq_else.16582:
	fadd	%f0, %fzero, %f3
beq_cont.16583:
	j	beq_cont.16581
beq_else.16580:
	fadd	%f0, %fzero, %f3
beq_cont.16581:
	j	beq_cont.16579
beq_else.16578:
	fadd	%f0, %fzero, %f3
beq_cont.16579:
	j	beq_cont.16577
beq_else.16576:
	fadd	%f0, %fzero, %f3
beq_cont.16577:
	j	beq_cont.16575
beq_else.16574:
	fadd	%f0, %fzero, %f3
beq_cont.16575:
	j	beq_cont.16573
beq_else.16572:
	fadd	%f0, %fzero, %f3
beq_cont.16573:
	j	beq_cont.16571
beq_else.16570:
	fadd	%f0, %fzero, %f3
beq_cont.16571:
	j	beq_cont.16569
beq_else.16568:
	fadd	%f0, %fzero, %f3
beq_cont.16569:
	j	beq_cont.16567
beq_else.16566:
	fadd	%f0, %fzero, %f3
beq_cont.16567:
	j	beq_cont.16565
beq_else.16564:
	fadd	%f0, %fzero, %f3
beq_cont.16565:
	j	beq_cont.16563
beq_else.16562:
	fadd	%f0, %fzero, %f3
beq_cont.16563:
	j	beq_cont.16561
beq_else.16560:
	fadd	%f0, %fzero, %f3
beq_cont.16561:
	j	beq_cont.16559
beq_else.16558:
	fadd	%f0, %fzero, %f3
beq_cont.16559:
	j	beq_cont.16557
beq_else.16556:
	fadd	%f0, %fzero, %f2
beq_cont.16557:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10061
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16586
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16588
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16590
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16592
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16594
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16596
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16597
beq_else.16596:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.16597:
	j	beq_cont.16595
beq_else.16594:
	fadd	%f0, %fzero, %f2
beq_cont.16595:
	j	beq_cont.16593
beq_else.16592:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16598
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16600
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16601
beq_else.16600:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.16601:
	j	beq_cont.16599
beq_else.16598:
	fadd	%f0, %fzero, %f2
beq_cont.16599:
beq_cont.16593:
	j	beq_cont.16591
beq_else.16590:
	fadd	%f0, %fzero, %f2
beq_cont.16591:
	j	beq_cont.16589
beq_else.16588:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16602
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16604
	fsub	%f2, %f2, %f0
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16606
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16608
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16609
beq_else.16608:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.16609:
	j	beq_cont.16607
beq_else.16606:
	fadd	%f0, %fzero, %f2
beq_cont.16607:
	j	beq_cont.16605
beq_else.16604:
	flw	%f3, 471(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16610
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16612
	fsub	%f1, %f2, %f0
	flw	%f2, 471(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16613
beq_else.16612:
	flw	%f1, 471(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.16613:
	j	beq_cont.16611
beq_else.16610:
	fadd	%f0, %fzero, %f2
beq_cont.16611:
beq_cont.16605:
	j	beq_cont.16603
beq_else.16602:
	fadd	%f0, %fzero, %f2
beq_cont.16603:
beq_cont.16589:
	j	beq_cont.16587
beq_else.16586:
	fadd	%f0, %fzero, %f2
beq_cont.16587:
	flw	%f1, 1(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16614
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16616
	addi	%v0, %zero, 1
	j	beq_cont.16617
beq_else.16616:
	addi	%v0, %zero, 0
beq_cont.16617:
	j	beq_cont.16615
beq_else.16614:
	lw	%v0, 0(%sp)
beq_cont.16615:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16618
	fsub	%f0, %f0, %f1
	j	beq_cont.16619
beq_else.16618:
beq_cont.16619:
	flw	%f2, 453(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.16620
	fsub	%f0, %f1, %f0
	j	beq_cont.16621
beq_else.16620:
beq_cont.16621:
	flw	%f1, 452(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16622
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
	j	beq_cont.16623
beq_else.16622:
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
beq_cont.16623:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16624
	fneg	%f0, %f0
	jr	%ra
beq_else.16624:
	jr	%ra
print_int_sub1.2622:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16625
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16626
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16627
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16628
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16629
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16630
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16631
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16632
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
beq_else.16632:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16631:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16630:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16629:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16628:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16627:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16626:
	add	%v0, %zero, %v1
	jr	%ra
beq_else.16625:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16633
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16634
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16635
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16636
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16637
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16638
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16639
	addi	%v0, %v0, -10
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16640
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
beq_else.16640:
	jr	%ra
beq_else.16639:
	jr	%ra
beq_else.16638:
	jr	%ra
beq_else.16637:
	jr	%ra
beq_else.16636:
	jr	%ra
beq_else.16635:
	jr	%ra
beq_else.16634:
	jr	%ra
beq_else.16633:
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.16641
	addi	%v1, %v0, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16643
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16645
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16647
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16649
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16651
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16653
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	beq_cont.16654
beq_else.16653:
	addi	%v0, %zero, 6
beq_cont.16654:
	j	beq_cont.16652
beq_else.16651:
	addi	%v0, %zero, 5
beq_cont.16652:
	j	beq_cont.16650
beq_else.16649:
	addi	%v0, %zero, 4
beq_cont.16650:
	j	beq_cont.16648
beq_else.16647:
	addi	%v0, %zero, 3
beq_cont.16648:
	j	beq_cont.16646
beq_else.16645:
	addi	%v0, %zero, 2
beq_cont.16646:
	j	beq_cont.16644
beq_else.16643:
	addi	%v0, %zero, 1
beq_cont.16644:
	j	beq_cont.16642
beq_else.16641:
	addi	%v0, %zero, 0
beq_cont.16642:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16655
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16657
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16659
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16661
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16663
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16665
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16667
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.16668
beq_else.16667:
	add	%v0, %zero, %v1
beq_cont.16668:
	j	beq_cont.16666
beq_else.16665:
	add	%v0, %zero, %v1
beq_cont.16666:
	j	beq_cont.16664
beq_else.16663:
	add	%v0, %zero, %v1
beq_cont.16664:
	j	beq_cont.16662
beq_else.16661:
	add	%v0, %zero, %v1
beq_cont.16662:
	j	beq_cont.16660
beq_else.16659:
	add	%v0, %zero, %v1
beq_cont.16660:
	j	beq_cont.16658
beq_else.16657:
	add	%v0, %zero, %v1
beq_cont.16658:
	j	beq_cont.16656
beq_else.16655:
	add	%v0, %zero, %v1
beq_cont.16656:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.16669
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.16669:
	sw	%v0, 2(%sp)
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16670
	addi	%a0, %v1, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16672
	addi	%a0, %a0, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16674
	addi	%a0, %a0, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16676
	addi	%a0, %a0, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16678
	addi	%a0, %a0, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16680
	addi	%a0, %a0, -10
	slti	%at, %a0, 10
	bne	%at, %zero, beq_else.16682
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16683
beq_else.16682:
	addi	%v0, %zero, 6
beq_cont.16683:
	j	beq_cont.16681
beq_else.16680:
	addi	%v0, %zero, 5
beq_cont.16681:
	j	beq_cont.16679
beq_else.16678:
	addi	%v0, %zero, 4
beq_cont.16679:
	j	beq_cont.16677
beq_else.16676:
	addi	%v0, %zero, 3
beq_cont.16677:
	j	beq_cont.16675
beq_else.16674:
	addi	%v0, %zero, 2
beq_cont.16675:
	j	beq_cont.16673
beq_else.16672:
	addi	%v0, %zero, 1
beq_cont.16673:
	j	beq_cont.16671
beq_else.16670:
	addi	%v0, %zero, 0
beq_cont.16671:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16684
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16686
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16688
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16690
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16692
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16694
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16696
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.16697
beq_else.16696:
	add	%v0, %zero, %v1
beq_cont.16697:
	j	beq_cont.16695
beq_else.16694:
	add	%v0, %zero, %v1
beq_cont.16695:
	j	beq_cont.16693
beq_else.16692:
	add	%v0, %zero, %v1
beq_cont.16693:
	j	beq_cont.16691
beq_else.16690:
	add	%v0, %zero, %v1
beq_cont.16691:
	j	beq_cont.16689
beq_else.16688:
	add	%v0, %zero, %v1
beq_cont.16689:
	j	beq_cont.16687
beq_else.16686:
	add	%v0, %zero, %v1
beq_cont.16687:
	j	beq_cont.16685
beq_else.16684:
	add	%v0, %zero, %v1
beq_cont.16685:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.16698
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.16698:
	sw	%v0, 4(%sp)
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16699
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16701
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16703
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16705
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16707
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16709
	addi	%v1, %v1, -10
	slti	%at, %v1, 10
	bne	%at, %zero, beq_else.16711
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.16712
beq_else.16711:
	add	%v0, %zero, %v1
beq_cont.16712:
	j	beq_cont.16710
beq_else.16709:
	add	%v0, %zero, %v1
beq_cont.16710:
	j	beq_cont.16708
beq_else.16707:
	add	%v0, %zero, %v1
beq_cont.16708:
	j	beq_cont.16706
beq_else.16705:
	add	%v0, %zero, %v1
beq_cont.16706:
	j	beq_cont.16704
beq_else.16703:
	add	%v0, %zero, %v1
beq_cont.16704:
	j	beq_cont.16702
beq_else.16701:
	add	%v0, %zero, %v1
beq_cont.16702:
	j	beq_cont.16700
beq_else.16699:
	add	%v0, %zero, %v1
beq_cont.16700:
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
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16715
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16717
	flw	%f1, 448(%zero)
	fdiv	%f0, %f1, %f0
	j	beq_cont.16718
beq_else.16717:
	flw	%f1, 443(%zero)
	fdiv	%f0, %f1, %f0
beq_cont.16718:
	j	beq_cont.16716
beq_else.16715:
	flw	%f0, 448(%zero)
beq_cont.16716:
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
	fadd	%f0, %f1, %fzero
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
	fadd	%f0, %f1, %fzero
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
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
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
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2616
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16724
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16724:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16725
	addi	%v0, %zero, 0
	j	beq_cont.16726
beq_else.16725:
	addi	%v0, %zero, 1
beq_cont.16726:
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
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16727
	j	beq_cont.16728
beq_else.16727:
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
beq_cont.16728:
	lw	%v1, 2(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.16729
	addi	%a0, %zero, 1
	j	beq_cont.16730
beq_else.16729:
	lw	%a0, 7(%sp)
beq_cont.16730:
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
	addi	%at, %zero, 3
	bne	%a2, %at, beq_else.16731
	flw	%f0, 0(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16733
	addi	%v1, %zero, 1
	j	fbeq_cont.16734
fbeq_else.16733:
	addi	%v1, %zero, 0
fbeq_cont.16734:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16735
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16737
	addi	%v1, %zero, 1
	j	fbeq_cont.16738
fbeq_else.16737:
	addi	%v1, %zero, 0
fbeq_cont.16738:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16739
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16741
	addi	%v1, %zero, 0
	j	beq_cont.16742
beq_else.16741:
	addi	%v1, %zero, 1
beq_cont.16742:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16743
	flw	%f1, 443(%zero)
	j	beq_cont.16744
beq_else.16743:
	flw	%f1, 448(%zero)
beq_cont.16744:
	j	beq_cont.16740
beq_else.16739:
	flw	%f1, 444(%zero)
beq_cont.16740:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	j	beq_cont.16736
beq_else.16735:
	flw	%f0, 444(%zero)
beq_cont.16736:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16745
	addi	%v1, %zero, 1
	j	fbeq_cont.16746
fbeq_else.16745:
	addi	%v1, %zero, 0
fbeq_cont.16746:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16747
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16749
	addi	%v1, %zero, 1
	j	fbeq_cont.16750
fbeq_else.16749:
	addi	%v1, %zero, 0
fbeq_cont.16750:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16751
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16753
	addi	%v1, %zero, 0
	j	beq_cont.16754
beq_else.16753:
	addi	%v1, %zero, 1
beq_cont.16754:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16755
	flw	%f1, 443(%zero)
	j	beq_cont.16756
beq_else.16755:
	flw	%f1, 448(%zero)
beq_cont.16756:
	j	beq_cont.16752
beq_else.16751:
	flw	%f1, 444(%zero)
beq_cont.16752:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	j	beq_cont.16748
beq_else.16747:
	flw	%f0, 444(%zero)
beq_cont.16748:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16757
	addi	%v1, %zero, 1
	j	fbeq_cont.16758
fbeq_else.16757:
	addi	%v1, %zero, 0
fbeq_cont.16758:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16759
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16761
	addi	%v1, %zero, 1
	j	fbeq_cont.16762
fbeq_else.16761:
	addi	%v1, %zero, 0
fbeq_cont.16762:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16763
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16765
	addi	%v1, %zero, 0
	j	beq_cont.16766
beq_else.16765:
	addi	%v1, %zero, 1
beq_cont.16766:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16767
	flw	%f1, 443(%zero)
	j	beq_cont.16768
beq_else.16767:
	flw	%f1, 448(%zero)
beq_cont.16768:
	j	beq_cont.16764
beq_else.16763:
	flw	%f1, 444(%zero)
beq_cont.16764:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	j	beq_cont.16760
beq_else.16759:
	flw	%f0, 444(%zero)
beq_cont.16760:
	fsw	%f0, 2(%a0)
	j	beq_cont.16732
beq_else.16731:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.16769
	lw	%v1, 7(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16771
	addi	%v1, %zero, 1
	j	beq_cont.16772
beq_else.16771:
	addi	%v1, %zero, 0
beq_cont.16772:
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	beq_cont.16770
beq_else.16769:
beq_cont.16770:
beq_cont.16732:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16773
	j	beq_cont.16774
beq_else.16773:
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
beq_cont.16774:
	addi	%v0, %zero, 1
	jr	%ra
read_object.2765:
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.16775
	jr	%ra
beq_else.16775:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16777
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.16777:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.16779
	jr	%ra
beq_else.16779:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2763
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16781
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.16781:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.16783
	jr	%ra
beq_else.16783:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2763
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16785
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.16785:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.16787
	jr	%ra
beq_else.16787:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2763
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16789
	addi	%v0, %zero, 0
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.16789:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16791
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
beq_else.16791:
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16792
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16793
beq_else.16792:
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16794
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.16795
beq_else.16794:
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16796
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	beq_cont.16797
beq_else.16796:
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
beq_cont.16797:
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
beq_cont.16795:
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
beq_cont.16793:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_or_network.2771:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16798
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	j	beq_cont.16799
beq_else.16798:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16800
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.16801
beq_else.16800:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16802
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16803
beq_else.16802:
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
beq_cont.16803:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
beq_cont.16801:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
beq_cont.16799:
	lw	%v0, 0(%v1)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16804
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
beq_else.16804:
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16805
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	j	beq_cont.16806
beq_else.16805:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16807
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	beq_cont.16808
beq_else.16807:
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
beq_cont.16808:
	lw	%v1, 6(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
beq_cont.16806:
	lw	%v0, 0(%v1)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16809
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.16810
beq_else.16809:
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
beq_cont.16810:
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_and_network.2773:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16811
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	beq_cont.16812
beq_else.16811:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16813
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.16814
beq_else.16813:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16815
	addi	%v0, %zero, 3
	addi	%v1, %zero, -1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.16816
beq_else.16815:
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
beq_cont.16816:
	lw	%v1, 2(%sp)
	sw	%v1, 1(%v0)
beq_cont.16814:
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
beq_cont.16812:
	lw	%v1, 0(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.16817
	jr	%ra
beq_else.16817:
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16819
	addi	%v0, %zero, 1
	addi	%v1, %zero, -1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.16820
beq_else.16819:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.16821
	addi	%v0, %zero, 2
	addi	%v1, %zero, -1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	beq_cont.16822
beq_else.16821:
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
beq_cont.16822:
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
beq_cont.16820:
	lw	%v1, 0(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.16823
	jr	%ra
beq_else.16823:
	addi	%v1, %zero, 72
	lw	%a0, 4(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
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
	addi	%at, %zero, 0
	bne	%a3, %at, beq_else.16827
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 444(%zero)
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.16828
	addi	%t0, %zero, 0
	j	beq_cont.16829
beq_else.16828:
	addi	%t0, %zero, 1
beq_cont.16829:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16830
	add	%v0, %zero, %t0
	j	beq_cont.16831
beq_else.16830:
	addi	%at, %zero, 0
	bne	%t0, %at, beq_else.16832
	addi	%v0, %zero, 1
	j	beq_cont.16833
beq_else.16832:
	addi	%v0, %zero, 0
beq_cont.16833:
beq_cont.16831:
	add	%at, %a3, %a0
	flw	%f3, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16834
	fneg	%f3, %f3
	j	beq_cont.16835
beq_else.16834:
beq_cont.16835:
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
	fslt	%at, %f1, %f3
	bne	%at, %zero, beq_else.16836
	addi	%v0, %zero, 0
	j	beq_cont.16837
beq_else.16836:
	addi	%v0, %zero, 1
beq_cont.16837:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16838
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16838:
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.16839
	addi	%v0, %zero, 0
	j	beq_cont.16840
beq_else.16839:
	addi	%v0, %zero, 1
beq_cont.16840:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16841
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16841:
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16827:
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
	fslt	%at, %f4, %f3
	bne	%at, %zero, beq_else.16842
	addi	%v1, %zero, 0
	j	beq_cont.16843
beq_else.16842:
	addi	%v1, %zero, 1
beq_cont.16843:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16844
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16844:
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
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16845
	fadd	%f0, %fzero, %f3
	jr	%ra
beq_else.16845:
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
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16846
	fadd	%f0, %fzero, %f6
	jr	%ra
beq_else.16846:
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
solver_second.2811:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16849
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	flw	%f2, 1(%v0)
	flw	%f3, 2(%v0)
	flw	%f4, 2(%sp)
	flw	%f5, 1(%sp)
	flw	%f6, 0(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	fadd	%f3, %f4, %fzero
	fadd	%f4, %f5, %fzero
	fadd	%f5, %f6, %fzero
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
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2798
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, 3
	bne	%v1, %at, beq_else.16850
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.16851
beq_else.16850:
beq_cont.16851:
	flw	%f1, 6(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 5(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 444(%zero)
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16852
	addi	%v1, %zero, 0
	j	beq_cont.16853
beq_else.16852:
	addi	%v1, %zero, 1
beq_cont.16853:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16854
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16854:
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16855
	fneg	%f0, %f0
	j	beq_cont.16856
beq_else.16855:
beq_cont.16856:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16849:
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
	addi	%at, %zero, 1
	bne	%a0, %at, beq_else.16857
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16858
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16859
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16860
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16860:
	addi	%v0, %zero, 3
	jr	%ra
beq_else.16859:
	addi	%v0, %zero, 2
	jr	%ra
beq_else.16858:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16857:
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.16861
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
	fslt	%at, %f4, %f3
	bne	%at, %zero, beq_else.16862
	addi	%v1, %zero, 0
	j	beq_cont.16863
beq_else.16862:
	addi	%v1, %zero, 1
beq_cont.16863:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16864
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16864:
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
beq_else.16861:
	j	solver_second.2811
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
	fslt	%at, %f4, %f5
	bne	%at, %zero, beq_else.16865
	addi	%a1, %zero, 0
	j	beq_cont.16866
beq_else.16865:
	addi	%a1, %zero, 1
beq_cont.16866:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16867
	addi	%a1, %zero, 0
	j	beq_cont.16868
beq_else.16867:
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fslt	%at, %f4, %f5
	bne	%at, %zero, beq_else.16869
	addi	%a1, %zero, 0
	j	beq_cont.16870
beq_else.16869:
	addi	%a1, %zero, 1
beq_cont.16870:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16871
	addi	%a1, %zero, 0
	j	beq_cont.16872
beq_else.16871:
	flw	%f4, 1(%a0)
	flw	%f5, 444(%zero)
	fbne	%f4, %f5, fbeq_else.16873
	addi	%a1, %zero, 1
	j	fbeq_cont.16874
fbeq_else.16873:
	addi	%a1, %zero, 0
fbeq_cont.16874:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16875
	addi	%a1, %zero, 1
	j	beq_cont.16876
beq_else.16875:
	addi	%a1, %zero, 0
beq_cont.16876:
beq_cont.16872:
beq_cont.16868:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16877
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
	fslt	%at, %f4, %f5
	bne	%at, %zero, beq_else.16878
	addi	%a1, %zero, 0
	j	beq_cont.16879
beq_else.16878:
	addi	%a1, %zero, 1
beq_cont.16879:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16880
	addi	%a1, %zero, 0
	j	beq_cont.16881
beq_else.16880:
	flw	%f4, 2(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	fabs	%f4, %f4
	lw	%a1, 4(%v0)
	flw	%f5, 2(%a1)
	fslt	%at, %f4, %f5
	bne	%at, %zero, beq_else.16882
	addi	%a1, %zero, 0
	j	beq_cont.16883
beq_else.16882:
	addi	%a1, %zero, 1
beq_cont.16883:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16884
	addi	%a1, %zero, 0
	j	beq_cont.16885
beq_else.16884:
	flw	%f4, 3(%a0)
	flw	%f5, 444(%zero)
	fbne	%f4, %f5, fbeq_else.16886
	addi	%a1, %zero, 1
	j	fbeq_cont.16887
fbeq_else.16886:
	addi	%a1, %zero, 0
fbeq_cont.16887:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16888
	addi	%a1, %zero, 1
	j	beq_cont.16889
beq_else.16888:
	addi	%a1, %zero, 0
beq_cont.16889:
beq_cont.16885:
beq_cont.16881:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16890
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
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16891
	addi	%a1, %zero, 0
	j	beq_cont.16892
beq_else.16891:
	addi	%a1, %zero, 1
beq_cont.16892:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16893
	addi	%v0, %zero, 0
	j	beq_cont.16894
beq_else.16893:
	flw	%f0, 1(%v1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16895
	addi	%v0, %zero, 0
	j	beq_cont.16896
beq_else.16895:
	addi	%v0, %zero, 1
beq_cont.16896:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16897
	addi	%v0, %zero, 0
	j	beq_cont.16898
beq_else.16897:
	flw	%f0, 5(%a0)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16899
	addi	%v0, %zero, 1
	j	fbeq_cont.16900
fbeq_else.16899:
	addi	%v0, %zero, 0
fbeq_cont.16900:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16901
	addi	%v0, %zero, 1
	j	beq_cont.16902
beq_else.16901:
	addi	%v0, %zero, 0
beq_cont.16902:
beq_cont.16898:
beq_cont.16894:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16903
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16903:
	addi	%v0, %zero, 124
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
beq_else.16890:
	addi	%v0, %zero, 124
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
beq_else.16877:
	addi	%v0, %zero, 124
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 1
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
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16906
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
	addi	%at, %zero, 3
	bne	%v1, %at, beq_else.16907
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.16908
beq_else.16907:
beq_cont.16908:
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 1(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 444(%zero)
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.16909
	addi	%v1, %zero, 0
	j	beq_cont.16910
beq_else.16909:
	addi	%v1, %zero, 1
beq_cont.16910:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16911
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16911:
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16912
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.16913
beq_else.16912:
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.16913:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16906:
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
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16916
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
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.16917
	addi	%a0, %zero, 0
	j	beq_cont.16918
beq_else.16917:
	addi	%a0, %zero, 1
beq_cont.16918:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16919
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16919:
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16920
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.16921
beq_else.16920:
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.16921:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16916:
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
	addi	%at, %zero, 1
	bne	%a2, %at, beq_else.16922
	lw	%v1, 0(%v1)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	j	solver_rect_fast.2821
beq_else.16922:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.16923
	flw	%f0, 0(%v0)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16924
	addi	%v1, %zero, 0
	j	beq_cont.16925
beq_else.16924:
	addi	%v1, %zero, 1
beq_cont.16925:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16926
	addi	%v0, %zero, 0
	jr	%ra
beq_else.16926:
	flw	%f0, 0(%v0)
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.16923:
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	j	solver_second_fast2.2851
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
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16929
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16931
	addi	%a2, %zero, 0
	j	beq_cont.16932
beq_else.16931:
	addi	%a2, %zero, 1
beq_cont.16932:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16933
	add	%a1, %zero, %a2
	j	beq_cont.16934
beq_else.16933:
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.16935
	addi	%a1, %zero, 1
	j	beq_cont.16936
beq_else.16935:
	addi	%a1, %zero, 0
beq_cont.16936:
beq_cont.16934:
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16937
	fneg	%f0, %f0
	j	beq_cont.16938
beq_else.16937:
beq_cont.16938:
	fsw	%f0, 0(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	j	beq_cont.16930
beq_else.16929:
	flw	%f0, 444(%zero)
	fsw	%f0, 1(%v0)
beq_cont.16930:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16939
	addi	%a0, %zero, 1
	j	fbeq_cont.16940
fbeq_else.16939:
	addi	%a0, %zero, 0
fbeq_cont.16940:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16941
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16943
	addi	%a2, %zero, 0
	j	beq_cont.16944
beq_else.16943:
	addi	%a2, %zero, 1
beq_cont.16944:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16945
	add	%a1, %zero, %a2
	j	beq_cont.16946
beq_else.16945:
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.16947
	addi	%a1, %zero, 1
	j	beq_cont.16948
beq_else.16947:
	addi	%a1, %zero, 0
beq_cont.16948:
beq_cont.16946:
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16949
	fneg	%f0, %f0
	j	beq_cont.16950
beq_else.16949:
beq_cont.16950:
	fsw	%f0, 2(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 1(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
	j	beq_cont.16942
beq_else.16941:
	flw	%f0, 444(%zero)
	fsw	%f0, 3(%v0)
beq_cont.16942:
	flw	%f0, 2(%v1)
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16951
	addi	%a0, %zero, 1
	j	fbeq_cont.16952
fbeq_else.16951:
	addi	%a0, %zero, 0
fbeq_cont.16952:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.16953
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	flw	%f0, 2(%v1)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16955
	addi	%a2, %zero, 0
	j	beq_cont.16956
beq_else.16955:
	addi	%a2, %zero, 1
beq_cont.16956:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16957
	add	%a1, %zero, %a2
	j	beq_cont.16958
beq_else.16957:
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.16959
	addi	%a1, %zero, 1
	j	beq_cont.16960
beq_else.16959:
	addi	%a1, %zero, 0
beq_cont.16960:
beq_cont.16958:
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16961
	fneg	%f0, %f0
	j	beq_cont.16962
beq_else.16961:
beq_cont.16962:
	fsw	%f0, 4(%v0)
	flw	%f0, 448(%zero)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
	j	beq_cont.16954
beq_else.16953:
	flw	%f0, 444(%zero)
	fsw	%f0, 5(%v0)
beq_cont.16954:
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.16963
	addi	%v1, %zero, 0
	j	beq_cont.16964
beq_else.16963:
	addi	%v1, %zero, 1
beq_cont.16964:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16965
	flw	%f0, 444(%zero)
	fsw	%f0, 0(%v0)
	j	beq_cont.16966
beq_else.16965:
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
beq_cont.16966:
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
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.16967
	fsw	%f1, 1(%a0)
	fsw	%f2, 2(%a0)
	fsw	%f3, 3(%a0)
	j	beq_cont.16968
beq_else.16967:
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
beq_cont.16968:
	flw	%f1, 444(%zero)
	fbne	%f0, %f1, fbeq_else.16969
	addi	%v0, %zero, 1
	j	fbeq_cont.16970
fbeq_else.16969:
	addi	%v0, %zero, 0
fbeq_cont.16970:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.16971
	flw	%f1, 448(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%a0)
	j	beq_cont.16972
beq_else.16971:
beq_cont.16972:
	add	%v0, %zero, %a0
	jr	%ra
iter_setup_dirvec_constants.2870:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.16973
	addi	%a0, %zero, 1
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.16974
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
	j	beq_cont.16975
beq_else.16974:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.16976
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
	j	beq_cont.16977
beq_else.16976:
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
beq_cont.16977:
beq_cont.16975:
	addi	%v0, %v1, -1
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.16978
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.16979
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
	j	beq_cont.16980
beq_else.16979:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.16981
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
	j	beq_cont.16982
beq_else.16981:
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
beq_cont.16982:
beq_cont.16980:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
beq_else.16978:
	jr	%ra
beq_else.16973:
	jr	%ra
setup_startp_constants.2875:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.16985
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
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.16986
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
	j	beq_cont.16987
beq_else.16986:
	addi	%at, %zero, 2
	slt	%at, %at, %a2
	bne	%at, %zero, beq_else.16988
	j	beq_cont.16989
beq_else.16988:
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
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.16990
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.16991
beq_else.16990:
beq_cont.16991:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.16989:
beq_cont.16987:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
beq_else.16985:
	jr	%ra
is_rect_outside.2880:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.16993
	addi	%v1, %zero, 0
	j	beq_cont.16994
beq_else.16993:
	addi	%v1, %zero, 1
beq_cont.16994:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16995
	addi	%v1, %zero, 0
	j	beq_cont.16996
beq_else.16995:
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.16997
	addi	%v1, %zero, 0
	j	beq_cont.16998
beq_else.16997:
	addi	%v1, %zero, 1
beq_cont.16998:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.16999
	addi	%v1, %zero, 0
	j	beq_cont.17000
beq_else.16999:
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17001
	addi	%v1, %zero, 0
	j	beq_cont.17002
beq_else.17001:
	addi	%v1, %zero, 1
beq_cont.17002:
beq_cont.17000:
beq_cont.16996:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17003
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17004
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17004:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17003:
	lw	%v0, 6(%v0)
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
	addi	%at, %zero, 1
	bne	%v1, %at, beq_else.17005
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.17006
	addi	%v1, %zero, 0
	j	beq_cont.17007
beq_else.17006:
	addi	%v1, %zero, 1
beq_cont.17007:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17008
	addi	%v1, %zero, 0
	j	beq_cont.17009
beq_else.17008:
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17010
	addi	%v1, %zero, 0
	j	beq_cont.17011
beq_else.17010:
	addi	%v1, %zero, 1
beq_cont.17011:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17012
	addi	%v1, %zero, 0
	j	beq_cont.17013
beq_else.17012:
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17014
	addi	%v1, %zero, 0
	j	beq_cont.17015
beq_else.17014:
	addi	%v1, %zero, 1
beq_cont.17015:
beq_cont.17013:
beq_cont.17009:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17016
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17017
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17017:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17016:
	lw	%v0, 6(%v0)
	jr	%ra
beq_else.17005:
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.17018
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17019
	addi	%v1, %zero, 0
	j	beq_cont.17020
beq_else.17019:
	addi	%v1, %zero, 1
beq_cont.17020:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17021
	add	%v0, %zero, %v1
	j	beq_cont.17022
beq_else.17021:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17023
	addi	%v0, %zero, 1
	j	beq_cont.17024
beq_else.17023:
	addi	%v0, %zero, 0
beq_cont.17024:
beq_cont.17022:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17025
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17025:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17018:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, 3
	bne	%v1, %at, beq_else.17026
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.17027
beq_else.17026:
beq_cont.17027:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17028
	addi	%v1, %zero, 0
	j	beq_cont.17029
beq_else.17028:
	addi	%v1, %zero, 1
beq_cont.17029:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17030
	add	%v0, %zero, %v1
	j	beq_cont.17031
beq_else.17030:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17032
	addi	%v0, %zero, 1
	j	beq_cont.17033
beq_else.17032:
	addi	%v0, %zero, 0
beq_cont.17033:
beq_cont.17031:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17034
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17034:
	addi	%v0, %zero, 0
	jr	%ra
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17035
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17035:
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
	addi	%at, %zero, 1
	bne	%a1, %at, beq_else.17036
	addi	%v0, %a0, 0
	fadd	%f2, %f5, %fzero
	fadd	%f1, %f4, %fzero
	fadd	%f0, %f3, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	is_rect_outside.2880
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.17037
beq_else.17036:
	addi	%at, %zero, 2
	bne	%a1, %at, beq_else.17038
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
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17040
	addi	%a1, %zero, 0
	j	beq_cont.17041
beq_else.17040:
	addi	%a1, %zero, 1
beq_cont.17041:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17042
	add	%a0, %zero, %a1
	j	beq_cont.17043
beq_else.17042:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.17044
	addi	%a0, %zero, 1
	j	beq_cont.17045
beq_else.17044:
	addi	%a0, %zero, 0
beq_cont.17045:
beq_cont.17043:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17046
	addi	%v0, %zero, 1
	j	beq_cont.17047
beq_else.17046:
	addi	%v0, %zero, 0
beq_cont.17047:
	j	beq_cont.17039
beq_else.17038:
	sw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	fadd	%f2, %f5, %fzero
	fadd	%f1, %f4, %fzero
	fadd	%f0, %f3, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2798
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, 3
	bne	%v1, %at, beq_else.17048
	flw	%f1, 448(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.17049
beq_else.17048:
beq_cont.17049:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17050
	addi	%v1, %zero, 0
	j	beq_cont.17051
beq_else.17050:
	addi	%v1, %zero, 1
beq_cont.17051:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17052
	add	%v0, %zero, %v1
	j	beq_cont.17053
beq_else.17052:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17054
	addi	%v0, %zero, 1
	j	beq_cont.17055
beq_else.17054:
	addi	%v0, %zero, 0
beq_cont.17055:
beq_cont.17053:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17056
	addi	%v0, %zero, 1
	j	beq_cont.17057
beq_else.17056:
	addi	%v0, %zero, 0
beq_cont.17057:
beq_cont.17039:
beq_cont.17037:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17058
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17059
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17059:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17060
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
beq_else.17060:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17058:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17061
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17061:
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
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17062
	addi	%a3, %zero, 171
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.17063
beq_else.17062:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17064
	flw	%f3, 0(%a2)
	flw	%f4, 444(%zero)
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17066
	addi	%a1, %zero, 0
	j	beq_cont.17067
beq_else.17066:
	addi	%a1, %zero, 1
beq_cont.17067:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.17068
	addi	%v0, %zero, 0
	j	beq_cont.17069
beq_else.17068:
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
beq_cont.17069:
	j	beq_cont.17065
beq_else.17064:
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.17065:
beq_cont.17063:
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17070
	addi	%v0, %zero, 0
	j	beq_cont.17071
beq_else.17070:
	flw	%f1, 439(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17072
	addi	%v0, %zero, 0
	j	beq_cont.17073
beq_else.17072:
	addi	%v0, %zero, 1
beq_cont.17073:
beq_cont.17071:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17074
	addi	%v0, %zero, 1
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17075
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17075:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
beq_else.17074:
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.17076
	addi	%v0, %zero, 1
	j	beq_cont.17077
beq_else.17076:
	addi	%a0, %zero, 1
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	fsw	%f0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	is_outside.2895
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17078
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
	j	beq_cont.17079
beq_else.17078:
	addi	%v0, %zero, 0
beq_cont.17079:
beq_cont.17077:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17080
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
beq_else.17080:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17081
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17081:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17082
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17083
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17083:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17084
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17085
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17085:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17086
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17087
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17087:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17088
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_one_or_group.2909
beq_else.17088:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17086:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17084:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.17082:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17089
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17089:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a1, %at, beq_else.17090
	addi	%v0, %zero, 1
	j	beq_cont.17091
beq_else.17090:
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
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17092
	addi	%a3, %zero, 171
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.17093
beq_else.17092:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17094
	flw	%f3, 0(%a1)
	flw	%f4, 444(%zero)
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17096
	addi	%a2, %zero, 0
	j	beq_cont.17097
beq_else.17096:
	addi	%a2, %zero, 1
beq_cont.17097:
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.17098
	addi	%v0, %zero, 0
	j	beq_cont.17099
beq_else.17098:
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
beq_cont.17099:
	j	beq_cont.17095
beq_else.17094:
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_second_fast.2834
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.17095:
beq_cont.17093:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17100
	addi	%v0, %zero, 0
	j	beq_cont.17101
beq_else.17100:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17102
	addi	%v0, %zero, 0
	j	beq_cont.17103
beq_else.17102:
	addi	%v0, %zero, 1
beq_cont.17103:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17104
	addi	%v0, %zero, 0
	j	beq_cont.17105
beq_else.17104:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17106
	addi	%v0, %zero, 0
	j	beq_cont.17107
beq_else.17106:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17108
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17110
	addi	%v0, %zero, 0
	j	beq_cont.17111
beq_else.17110:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17112
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17114
	addi	%v0, %zero, 0
	j	beq_cont.17115
beq_else.17114:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17116
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.17117
beq_else.17116:
	addi	%v0, %zero, 1
beq_cont.17117:
beq_cont.17115:
	j	beq_cont.17113
beq_else.17112:
	addi	%v0, %zero, 1
beq_cont.17113:
beq_cont.17111:
	j	beq_cont.17109
beq_else.17108:
	addi	%v0, %zero, 1
beq_cont.17109:
beq_cont.17107:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17118
	addi	%v0, %zero, 0
	j	beq_cont.17119
beq_else.17118:
	addi	%v0, %zero, 1
beq_cont.17119:
beq_cont.17105:
beq_cont.17101:
beq_cont.17091:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17120
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
beq_else.17120:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17121
	addi	%v0, %zero, 0
	j	beq_cont.17122
beq_else.17121:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17123
	lw	%v0, 0(%sp)
	lw	%v1, 2(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17125
	addi	%v0, %zero, 0
	j	beq_cont.17126
beq_else.17125:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17127
	lw	%v0, 0(%sp)
	lw	%v1, 3(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17129
	addi	%v0, %zero, 0
	j	beq_cont.17130
beq_else.17129:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17131
	addi	%v0, %zero, 4
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.17132
beq_else.17131:
	addi	%v0, %zero, 1
beq_cont.17132:
beq_cont.17130:
	j	beq_cont.17128
beq_else.17127:
	addi	%v0, %zero, 1
beq_cont.17128:
beq_cont.17126:
	j	beq_cont.17124
beq_else.17123:
	addi	%v0, %zero, 1
beq_cont.17124:
beq_cont.17122:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17133
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
beq_else.17133:
	addi	%v0, %zero, 1
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17134
	jr	%ra
beq_else.17134:
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
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17136
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17138
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17140
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17142
	addi	%v0, %zero, 0
	j	beq_cont.17143
beq_else.17142:
	addi	%v0, %zero, 3
beq_cont.17143:
	j	beq_cont.17141
beq_else.17140:
	addi	%v0, %zero, 2
beq_cont.17141:
	j	beq_cont.17139
beq_else.17138:
	addi	%v0, %zero, 1
beq_cont.17139:
	j	beq_cont.17137
beq_else.17136:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17144
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_surface.2792
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.17145
beq_else.17144:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_second.2811
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.17145:
beq_cont.17137:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17146
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17147
	jr	%ra
beq_else.17147:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
beq_else.17146:
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17149
	addi	%v1, %zero, 0
	j	beq_cont.17150
beq_else.17149:
	addi	%v1, %zero, 1
beq_cont.17150:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17151
	j	beq_cont.17152
beq_else.17151:
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17153
	addi	%v1, %zero, 0
	j	beq_cont.17154
beq_else.17153:
	addi	%v1, %zero, 1
beq_cont.17154:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17155
	j	beq_cont.17156
beq_else.17155:
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
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17157
	addi	%v0, %zero, 1
	j	beq_cont.17158
beq_else.17157:
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%v0, %a1, 0
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	is_outside.2895
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17159
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
	j	beq_cont.17160
beq_else.17159:
	addi	%v0, %zero, 0
beq_cont.17160:
beq_cont.17158:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17161
	j	beq_cont.17162
beq_else.17161:
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
beq_cont.17162:
beq_cont.17156:
beq_cont.17152:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17163
	jr	%ra
beq_else.17163:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17165
	jr	%ra
beq_else.17165:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17167
	jr	%ra
beq_else.17167:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17169
	jr	%ra
beq_else.17169:
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
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.17171
	jr	%ra
beq_else.17171:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.17173
	lw	%a2, 1(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.17175
	j	beq_cont.17176
beq_else.17175:
	addi	%a3, %zero, 72
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	sw	%a1, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2915
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17177
	j	beq_cont.17178
beq_else.17177:
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2915
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17179
	j	beq_cont.17180
beq_else.17179:
	addi	%a0, %zero, 72
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 0
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2915
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 4
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.17180:
beq_cont.17178:
beq_cont.17176:
	j	beq_cont.17174
beq_else.17173:
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
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17181
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17183
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17185
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17187
	addi	%v0, %zero, 0
	j	beq_cont.17188
beq_else.17187:
	addi	%v0, %zero, 3
beq_cont.17188:
	j	beq_cont.17186
beq_else.17185:
	addi	%v0, %zero, 2
beq_cont.17186:
	j	beq_cont.17184
beq_else.17183:
	addi	%v0, %zero, 1
beq_cont.17184:
	j	beq_cont.17182
beq_else.17181:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17189
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_surface.2792
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.17190
beq_else.17189:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_second.2811
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.17190:
beq_cont.17182:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17191
	j	beq_cont.17192
beq_else.17191:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17193
	addi	%v0, %zero, 0
	j	beq_cont.17194
beq_else.17193:
	addi	%v0, %zero, 1
beq_cont.17194:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17195
	j	beq_cont.17196
beq_else.17195:
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17197
	j	beq_cont.17198
beq_else.17197:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17199
	j	beq_cont.17200
beq_else.17199:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17201
	j	beq_cont.17202
beq_else.17201:
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
beq_cont.17202:
beq_cont.17200:
beq_cont.17198:
beq_cont.17196:
beq_cont.17192:
beq_cont.17174:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17203
	jr	%ra
beq_else.17203:
	sw	%v0, 8(%sp)
	addi	%at, %zero, 99
	bne	%a1, %at, beq_else.17205
	lw	%a1, 1(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17207
	j	beq_cont.17208
beq_else.17207:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17209
	j	beq_cont.17210
beq_else.17209:
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
beq_cont.17210:
beq_cont.17208:
	j	beq_cont.17206
beq_else.17205:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17211
	j	beq_cont.17212
beq_else.17211:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17213
	addi	%v0, %zero, 0
	j	beq_cont.17214
beq_else.17213:
	addi	%v0, %zero, 1
beq_cont.17214:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17215
	j	beq_cont.17216
beq_else.17215:
	lw	%v0, 9(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17217
	j	beq_cont.17218
beq_else.17217:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17219
	j	beq_cont.17220
beq_else.17219:
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
beq_cont.17220:
beq_cont.17218:
beq_cont.17216:
beq_cont.17212:
beq_cont.17206:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.17221
	jr	%ra
beq_else.17221:
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
	addi	%at, %zero, 1
	bne	%t2, %at, beq_else.17223
	lw	%t0, 0(%a0)
	addi	%a0, %t1, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.17224
beq_else.17223:
	addi	%at, %zero, 2
	bne	%t2, %at, beq_else.17225
	flw	%f0, 0(%t1)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17227
	addi	%a3, %zero, 0
	j	beq_cont.17228
beq_else.17227:
	addi	%a3, %zero, 1
beq_cont.17228:
	addi	%at, %zero, 0
	bne	%a3, %at, beq_else.17229
	addi	%v0, %zero, 0
	j	beq_cont.17230
beq_else.17229:
	flw	%f0, 0(%t1)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 124
	fsw	%f0, 0(%a3)
	addi	%v0, %zero, 1
beq_cont.17230:
	j	beq_cont.17226
beq_else.17225:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
beq_cont.17226:
beq_cont.17224:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17231
	addi	%v0, %zero, 1
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 6(%v0)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17232
	jr	%ra
beq_else.17232:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
beq_else.17231:
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17234
	addi	%v1, %zero, 0
	j	beq_cont.17235
beq_else.17234:
	addi	%v1, %zero, 1
beq_cont.17235:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17236
	j	beq_cont.17237
beq_else.17236:
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17238
	addi	%v1, %zero, 0
	j	beq_cont.17239
beq_else.17238:
	addi	%v1, %zero, 1
beq_cont.17239:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17240
	j	beq_cont.17241
beq_else.17240:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17242
	addi	%v0, %zero, 1
	j	beq_cont.17243
beq_else.17242:
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	is_outside.2895
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17244
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
	j	beq_cont.17245
beq_else.17244:
	addi	%v0, %zero, 0
beq_cont.17245:
beq_cont.17243:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17246
	j	beq_cont.17247
beq_else.17246:
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
beq_cont.17247:
beq_cont.17241:
beq_cont.17237:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	solve_each_element_fast.2929
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17248
	jr	%ra
beq_else.17248:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17250
	jr	%ra
beq_else.17250:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17252
	jr	%ra
beq_else.17252:
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
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.17254
	jr	%ra
beq_else.17254:
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
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.17256
	jr	%ra
beq_else.17256:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.17258
	lw	%a2, 1(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.17260
	j	beq_cont.17261
beq_else.17260:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17262
	j	beq_cont.17263
beq_else.17262:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17264
	j	beq_cont.17265
beq_else.17264:
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
beq_cont.17265:
beq_cont.17263:
beq_cont.17261:
	j	beq_cont.17259
beq_else.17258:
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
	addi	%at, %zero, 1
	bne	%t1, %at, beq_else.17266
	lw	%t0, 0(%a0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.17267
beq_else.17266:
	addi	%at, %zero, 2
	bne	%t1, %at, beq_else.17268
	flw	%f0, 0(%a2)
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17270
	addi	%a3, %zero, 0
	j	beq_cont.17271
beq_else.17270:
	addi	%a3, %zero, 1
beq_cont.17271:
	addi	%at, %zero, 0
	bne	%a3, %at, beq_else.17272
	addi	%v0, %zero, 0
	j	beq_cont.17273
beq_else.17272:
	flw	%f0, 0(%a2)
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 124
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
beq_cont.17273:
	j	beq_cont.17269
beq_else.17268:
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.17269:
beq_cont.17267:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17274
	j	beq_cont.17275
beq_else.17274:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17276
	addi	%v0, %zero, 0
	j	beq_cont.17277
beq_else.17276:
	addi	%v0, %zero, 1
beq_cont.17277:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17278
	j	beq_cont.17279
beq_else.17278:
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17280
	j	beq_cont.17281
beq_else.17280:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17282
	j	beq_cont.17283
beq_else.17282:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17284
	j	beq_cont.17285
beq_else.17284:
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
beq_cont.17285:
beq_cont.17283:
beq_cont.17281:
beq_cont.17279:
beq_cont.17275:
beq_cont.17259:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17286
	jr	%ra
beq_else.17286:
	sw	%v0, 4(%sp)
	addi	%at, %zero, 99
	bne	%a1, %at, beq_else.17288
	lw	%a1, 1(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17290
	j	beq_cont.17291
beq_else.17290:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17292
	j	beq_cont.17293
beq_else.17292:
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
beq_cont.17293:
beq_cont.17291:
	j	beq_cont.17289
beq_else.17288:
	lw	%a2, 0(%sp)
	sw	%a0, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solver_fast2.2858
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17294
	j	beq_cont.17295
beq_else.17294:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17296
	addi	%v0, %zero, 0
	j	beq_cont.17297
beq_else.17296:
	addi	%v0, %zero, 1
beq_cont.17297:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17298
	j	beq_cont.17299
beq_else.17298:
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17300
	j	beq_cont.17301
beq_else.17300:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17302
	j	beq_cont.17303
beq_else.17302:
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
beq_cont.17303:
beq_cont.17301:
beq_cont.17299:
beq_cont.17295:
beq_cont.17289:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
judge_intersection_fast.2941:
	flw	%f0, 436(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%a0, 0(%v1)
	lw	%a1, 0(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17304
	j	beq_cont.17305
beq_else.17304:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%at, %zero, 99
	bne	%a1, %at, beq_else.17306
	lw	%a1, 1(%a0)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.17308
	j	beq_cont.17309
beq_else.17308:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17310
	j	beq_cont.17311
beq_else.17310:
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
beq_cont.17311:
beq_cont.17309:
	j	beq_cont.17307
beq_else.17306:
	sw	%a0, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast2.2858
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17312
	j	beq_cont.17313
beq_else.17312:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17314
	addi	%v0, %zero, 0
	j	beq_cont.17315
beq_else.17314:
	addi	%v0, %zero, 1
beq_cont.17315:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17316
	j	beq_cont.17317
beq_else.17316:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17318
	j	beq_cont.17319
beq_else.17318:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.17320
	j	beq_cont.17321
beq_else.17320:
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
beq_cont.17321:
beq_cont.17319:
beq_cont.17317:
beq_cont.17313:
beq_cont.17307:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.17305:
	addi	%v0, %zero, 126
	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17322
	addi	%v0, %zero, 0
	j	beq_cont.17323
beq_else.17322:
	addi	%v0, %zero, 1
beq_cont.17323:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17324
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17324:
	flw	%f1, 435(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17325
	addi	%v0, %zero, 0
	jr	%ra
beq_else.17325:
	addi	%v0, %zero, 1
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
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17326
	addi	%v1, %zero, 131
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 131
	fsw	%f4, 1(%v1)
	addi	%v1, %zero, 131
	fsw	%f5, 2(%v1)
	j	beq_cont.17327
beq_else.17326:
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
beq_cont.17327:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 131
	j	vecunit_sgn.2655
get_nvector.2949:
	lw	%a0, 1(%v0)
	addi	%at, %zero, 1
	bne	%a0, %at, beq_else.17328
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
	fbne	%f0, %f1, fbeq_else.17329
	addi	%v0, %zero, 1
	j	fbeq_cont.17330
fbeq_else.17329:
	addi	%v0, %zero, 0
fbeq_cont.17330:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17331
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17333
	addi	%v0, %zero, 0
	j	beq_cont.17334
beq_else.17333:
	addi	%v0, %zero, 1
beq_cont.17334:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17335
	flw	%f0, 443(%zero)
	j	beq_cont.17336
beq_else.17335:
	flw	%f0, 448(%zero)
beq_cont.17336:
	j	beq_cont.17332
beq_else.17331:
	flw	%f0, 444(%zero)
beq_cont.17332:
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	add	%at, %v0, %a0
	fsw	%f0, 0(%at)
	jr	%ra
beq_else.17328:
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.17338
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
beq_else.17338:
	j	get_nvector_second.2947
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
	addi	%at, %zero, 1
	bne	%a0, %at, beq_else.17340
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17341
	addi	%a0, %zero, 0
	j	beq_cont.17342
beq_else.17341:
	addi	%a0, %zero, 1
beq_cont.17342:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17343
	addi	%v0, %zero, 0
	j	beq_cont.17344
beq_else.17343:
	addi	%v0, %zero, 1
beq_cont.17344:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17345
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17347
	flw	%f0, 427(%zero)
	j	beq_cont.17348
beq_else.17347:
	flw	%f0, 444(%zero)
beq_cont.17348:
	j	beq_cont.17346
beq_else.17345:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17349
	flw	%f0, 444(%zero)
	j	beq_cont.17350
beq_else.17349:
	flw	%f0, 427(%zero)
beq_cont.17350:
beq_cont.17346:
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
beq_else.17340:
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.17352
	flw	%f0, 1(%v1)
	flw	%f1, 424(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	sin.2618
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
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
beq_else.17352:
	addi	%at, %zero, 3
	bne	%a0, %at, beq_else.17354
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
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	cos.2616
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
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
beq_else.17354:
	addi	%at, %zero, 4
	bne	%a0, %at, beq_else.17356
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
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17357
	addi	%a0, %zero, 0
	j	beq_cont.17358
beq_else.17357:
	addi	%a0, %zero, 1
beq_cont.17358:
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17359
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17361
	addi	%a0, %zero, 1
	j	beq_cont.17362
beq_else.17361:
	addi	%a0, %zero, 0
beq_cont.17362:
	fabs	%f1, %f0
	flw	%f3, 432(%zero)
	fslt	%at, %f1, %f3
	bne	%at, %zero, beq_else.17363
	flw	%f0, 431(%zero)
	sw	%a0, 3(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17365
	flw	%f0, 453(%zero)
	flw	%f3, 448(%zero)
	fdiv	%f1, %f3, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	kernel_atan.2612
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.17366
beq_else.17365:
	flw	%f0, 452(%zero)
	flw	%f3, 448(%zero)
	fsub	%f3, %f1, %f3
	flw	%f4, 448(%zero)
	fadd	%f1, %f1, %f4
	fdiv	%f1, %f3, %f1
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
beq_cont.17366:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17367
	fneg	%f0, %f0
	j	beq_cont.17368
beq_else.17367:
beq_cont.17368:
	j	beq_cont.17364
beq_else.17363:
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17364:
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.17360
beq_else.17359:
	flw	%f0, 433(%zero)
beq_cont.17360:
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
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17369
	addi	%v0, %zero, 0
	j	beq_cont.17370
beq_else.17369:
	addi	%v0, %zero, 1
beq_cont.17370:
	fsw	%f0, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17371
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 444(%zero)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.17373
	addi	%v0, %zero, 1
	j	beq_cont.17374
beq_else.17373:
	addi	%v0, %zero, 0
beq_cont.17374:
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fslt	%at, %f2, %f3
	bne	%at, %zero, beq_else.17375
	flw	%f1, 431(%zero)
	sw	%v0, 7(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.17377
	flw	%f1, 453(%zero)
	flw	%f3, 448(%zero)
	fdiv	%f2, %f3, %f2
	fsw	%f1, 8(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.17378
beq_else.17377:
	flw	%f1, 452(%zero)
	flw	%f3, 448(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 448(%zero)
	fadd	%f2, %f2, %f4
	fdiv	%f2, %f3, %f2
	fsw	%f1, 9(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
beq_cont.17378:
	lw	%v0, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17379
	fneg	%f0, %f0
	j	beq_cont.17380
beq_else.17379:
beq_cont.17380:
	j	beq_cont.17376
beq_else.17375:
	fadd	%f0, %f1, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
beq_cont.17376:
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.17372
beq_else.17371:
	flw	%f0, 433(%zero)
beq_cont.17372:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17381
	addi	%v0, %zero, 0
	j	beq_cont.17382
beq_else.17381:
	addi	%v0, %zero, 1
beq_cont.17382:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17383
	j	beq_cont.17384
beq_else.17383:
	flw	%f0, 444(%zero)
beq_cont.17384:
	flw	%f1, 427(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 426(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.17356:
	jr	%ra
trace_reflections.2959:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17387
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17388
	addi	%v0, %zero, 0
	j	beq_cont.17389
beq_else.17388:
	addi	%v0, %zero, 1
beq_cont.17389:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17390
	addi	%v0, %zero, 0
	j	beq_cont.17391
beq_else.17390:
	flw	%f1, 435(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17392
	addi	%v0, %zero, 0
	j	beq_cont.17393
beq_else.17392:
	addi	%v0, %zero, 1
beq_cont.17393:
beq_cont.17391:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17394
	j	beq_cont.17395
beq_else.17394:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17398
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
	fslt	%at, %f3, %f0
	bne	%at, %zero, beq_else.17400
	addi	%v0, %zero, 0
	j	beq_cont.17401
beq_else.17400:
	addi	%v0, %zero, 1
beq_cont.17401:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17402
	j	beq_cont.17403
beq_else.17402:
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
beq_cont.17403:
	flw	%f0, 444(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17404
	addi	%v0, %zero, 0
	j	beq_cont.17405
beq_else.17404:
	addi	%v0, %zero, 1
beq_cont.17405:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17406
	j	beq_cont.17407
beq_else.17406:
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
beq_cont.17407:
	j	beq_cont.17399
beq_else.17398:
beq_cont.17399:
	j	beq_cont.17397
beq_else.17396:
beq_cont.17397:
beq_cont.17395:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
beq_else.17387:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17409
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17410
	addi	%v0, %zero, 0
	j	beq_cont.17411
beq_else.17410:
	addi	%v0, %zero, 1
beq_cont.17411:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17412
	addi	%v0, %zero, 0
	j	beq_cont.17413
beq_else.17412:
	flw	%f1, 435(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17414
	addi	%v0, %zero, 0
	j	beq_cont.17415
beq_else.17414:
	addi	%v0, %zero, 1
beq_cont.17415:
beq_cont.17413:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17416
	addi	%v0, %zero, -1
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17417
	jr	%ra
beq_else.17417:
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17419
	addi	%v0, %zero, 0
	j	beq_cont.17420
beq_else.17419:
	addi	%v0, %zero, 1
beq_cont.17420:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17421
	jr	%ra
beq_else.17421:
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
beq_else.17416:
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
	addi	%at, %zero, 1
	bne	%a1, %at, beq_else.17424
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
	fbne	%f2, %f3, fbeq_else.17426
	addi	%a1, %zero, 1
	j	fbeq_cont.17427
fbeq_else.17426:
	addi	%a1, %zero, 0
fbeq_cont.17427:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.17428
	flw	%f3, 444(%zero)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.17430
	addi	%a1, %zero, 0
	j	beq_cont.17431
beq_else.17430:
	addi	%a1, %zero, 1
beq_cont.17431:
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.17432
	flw	%f2, 443(%zero)
	j	beq_cont.17433
beq_else.17432:
	flw	%f2, 448(%zero)
beq_cont.17433:
	j	beq_cont.17429
beq_else.17428:
	flw	%f2, 444(%zero)
beq_cont.17429:
	fneg	%f2, %f2
	addi	%a1, %zero, 131
	add	%at, %a1, %a2
	fsw	%f2, 0(%at)
	j	beq_cont.17425
beq_else.17424:
	addi	%at, %zero, 2
	bne	%a1, %at, beq_else.17434
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
	j	beq_cont.17435
beq_else.17434:
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	get_nvector_second.2947
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
beq_cont.17435:
beq_cont.17425:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17436
	addi	%a3, %zero, 0
	j	beq_cont.17437
beq_else.17436:
	addi	%a3, %zero, 1
beq_cont.17437:
	addi	%at, %zero, 0
	bne	%a3, %at, beq_else.17438
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
	j	beq_cont.17439
beq_else.17438:
	addi	%a3, %zero, 0
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
beq_cont.17439:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17440
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
	fslt	%at, %f3, %f0
	bne	%at, %zero, beq_else.17442
	addi	%v1, %zero, 0
	j	beq_cont.17443
beq_else.17442:
	addi	%v1, %zero, 1
beq_cont.17443:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17444
	j	beq_cont.17445
beq_else.17444:
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
beq_cont.17445:
	flw	%f0, 444(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.17446
	addi	%v1, %zero, 0
	j	beq_cont.17447
beq_else.17446:
	addi	%v1, %zero, 1
beq_cont.17447:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17448
	j	beq_cont.17449
beq_else.17448:
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
beq_cont.17449:
	j	beq_cont.17441
beq_else.17440:
beq_cont.17441:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17450
	addi	%v0, %zero, 0
	j	beq_cont.17451
beq_else.17450:
	addi	%v0, %zero, 1
beq_cont.17451:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17452
	jr	%ra
beq_else.17452:
	lw	%v0, 4(%sp)
	slti	%at, %v0, 4
	bne	%at, %zero, beq_else.17454
	j	beq_cont.17455
beq_else.17454:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
beq_cont.17455:
	lw	%v1, 6(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.17456
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
beq_else.17456:
	jr	%ra
beq_else.17409:
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17459
	addi	%v0, %zero, 0
	j	beq_cont.17460
beq_else.17459:
	addi	%v0, %zero, 1
beq_cont.17460:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17461
	addi	%v0, %zero, 0
	j	beq_cont.17462
beq_else.17461:
	flw	%f1, 435(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17463
	addi	%v0, %zero, 0
	j	beq_cont.17464
beq_else.17463:
	addi	%v0, %zero, 1
beq_cont.17464:
beq_cont.17462:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17465
	jr	%ra
beq_else.17465:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 1(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 1
	bne	%a0, %at, beq_else.17467
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
	fbne	%f0, %f1, fbeq_else.17469
	addi	%v1, %zero, 1
	j	fbeq_cont.17470
fbeq_else.17469:
	addi	%v1, %zero, 0
fbeq_cont.17470:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17471
	flw	%f1, 444(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17473
	addi	%v1, %zero, 0
	j	beq_cont.17474
beq_else.17473:
	addi	%v1, %zero, 1
beq_cont.17474:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17475
	flw	%f0, 443(%zero)
	j	beq_cont.17476
beq_else.17475:
	flw	%f0, 448(%zero)
beq_cont.17476:
	j	beq_cont.17472
beq_else.17471:
	flw	%f0, 444(%zero)
beq_cont.17472:
	fneg	%f0, %f0
	addi	%v1, %zero, 131
	add	%at, %v1, %a1
	fsw	%f0, 0(%at)
	j	beq_cont.17468
beq_else.17467:
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.17477
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
	j	beq_cont.17478
beq_else.17477:
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	get_nvector_second.2947
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.17478:
beq_cont.17468:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17479
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17480
	addi	%v0, %zero, 0
	j	beq_cont.17481
beq_else.17480:
	addi	%v0, %zero, 1
beq_cont.17481:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17482
	flw	%f0, 444(%zero)
	j	beq_cont.17483
beq_else.17482:
beq_cont.17483:
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
beq_else.17479:
	jr	%ra
iter_trace_diffuse_rays.2973:
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17486
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17487
	addi	%a2, %zero, 0
	j	beq_cont.17488
beq_else.17487:
	addi	%a2, %zero, 1
beq_cont.17488:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.17489
	add	%at, %v0, %a1
	lw	%a2, 0(%at)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17491
	j	beq_cont.17492
beq_else.17491:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17493
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17495
	addi	%v0, %zero, 0
	j	beq_cont.17496
beq_else.17495:
	addi	%v0, %zero, 1
beq_cont.17496:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17497
	flw	%f0, 444(%zero)
	j	beq_cont.17498
beq_else.17497:
beq_cont.17498:
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
	j	beq_cont.17494
beq_else.17493:
beq_cont.17494:
beq_cont.17492:
	j	beq_cont.17490
beq_else.17489:
	addi	%a2, %a1, 1
	add	%at, %v0, %a2
	lw	%a2, 0(%at)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 7(%sp)
	sw	%a2, 8(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17499
	j	beq_cont.17500
beq_else.17499:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17501
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
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.17503
	addi	%v0, %zero, 0
	j	beq_cont.17504
beq_else.17503:
	addi	%v0, %zero, 1
beq_cont.17504:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17505
	flw	%f0, 444(%zero)
	j	beq_cont.17506
beq_else.17505:
beq_cont.17506:
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
	j	beq_cont.17502
beq_else.17501:
beq_cont.17502:
beq_cont.17500:
beq_cont.17490:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -2
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17507
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17508
	addi	%a0, %zero, 0
	j	beq_cont.17509
beq_else.17508:
	addi	%a0, %zero, 1
beq_cont.17509:
	sw	%v0, 10(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17510
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
	j	beq_cont.17511
beq_else.17510:
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
beq_cont.17511:
	lw	%v0, 10(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
beq_else.17507:
	jr	%ra
beq_else.17486:
	jr	%ra
trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17514
	j	beq_cont.17515
beq_else.17514:
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
beq_cont.17515:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.17516
	j	beq_cont.17517
beq_else.17516:
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
beq_cont.17517:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.17518
	j	beq_cont.17519
beq_else.17518:
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
beq_cont.17519:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.17520
	j	beq_cont.17521
beq_else.17520:
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
beq_cont.17521:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.17522
	jr	%ra
beq_else.17522:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17524
	j	beq_cont.17525
beq_else.17524:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17526
	addi	%v1, %zero, 0
	j	beq_cont.17527
beq_else.17526:
	addi	%v1, %zero, 1
beq_cont.17527:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17528
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	beq_cont.17529
beq_else.17528:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17529:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17525:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.17530
	j	beq_cont.17531
beq_else.17530:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17532
	addi	%v1, %zero, 0
	j	beq_cont.17533
beq_else.17532:
	addi	%v1, %zero, 1
beq_cont.17533:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17534
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	beq_cont.17535
beq_else.17534:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.17535:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.17531:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.17536
	j	beq_cont.17537
beq_else.17536:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17538
	addi	%v1, %zero, 0
	j	beq_cont.17539
beq_else.17538:
	addi	%v1, %zero, 1
beq_cont.17539:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17540
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.17541
beq_else.17540:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.17541:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.17537:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.17542
	j	beq_cont.17543
beq_else.17542:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17544
	addi	%v1, %zero, 0
	j	beq_cont.17545
beq_else.17544:
	addi	%v1, %zero, 1
beq_cont.17545:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17546
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	beq_cont.17547
beq_else.17546:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.17547:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.17543:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.17548
	j	beq_cont.17549
beq_else.17548:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17550
	addi	%v1, %zero, 0
	j	beq_cont.17551
beq_else.17550:
	addi	%v1, %zero, 1
beq_cont.17551:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17552
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	beq_cont.17553
beq_else.17552:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
beq_cont.17553:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
beq_cont.17549:
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
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17554
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17555
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17556
	j	beq_cont.17557
beq_else.17556:
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
beq_cont.17557:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17558
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17559
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17560
	j	beq_cont.17561
beq_else.17560:
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.17561:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
beq_else.17559:
	jr	%ra
beq_else.17558:
	jr	%ra
beq_else.17555:
	jr	%ra
beq_else.17554:
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	slt	%at, %at, %a3
	bne	%at, %zero, beq_else.17566
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	slti	%at, %t1, 0
	bne	%at, %zero, beq_else.17567
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
	addi	%at, %zero, 0
	bne	%t1, %at, beq_else.17576
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	addi	%at, %zero, 4
	slt	%at, %at, %a3
	bne	%at, %zero, beq_else.17577
	lw	%v1, 2(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.17578
	lw	%v1, 3(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	sw	%v0, 0(%sp)
	sw	%a3, 1(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17579
	j	beq_cont.17580
beq_else.17579:
	addi	%v1, %a3, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
beq_cont.17580:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
beq_else.17578:
	jr	%ra
beq_else.17577:
	jr	%ra
beq_else.17576:
	lw	%t0, 3(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	sw	%v1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%a3, 1(%sp)
	addi	%at, %zero, 0
	bne	%t0, %at, beq_else.17583
	j	beq_cont.17584
beq_else.17583:
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.17584:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %a0, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17585
	lw	%a2, 2(%a1)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	slti	%at, %a2, 0
	bne	%at, %zero, beq_else.17586
	add	%at, %a0, %v0
	lw	%a2, 0(%at)
	lw	%a2, 2(%a2)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	lw	%a3, 4(%sp)
	add	%at, %a3, %v0
	lw	%t0, 0(%at)
	lw	%t0, 2(%t0)
	add	%at, %t0, %v1
	lw	%t0, 0(%at)
	bne	%t0, %a2, beq_else.17587
	lw	%t0, 3(%sp)
	add	%at, %t0, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17589
	addi	%t1, %v0, -1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17591
	addi	%t1, %v0, 1
	add	%at, %a0, %t1
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	add	%at, %t1, %v1
	lw	%t1, 0(%at)
	bne	%t1, %a2, beq_else.17593
	addi	%a2, %zero, 1
	j	beq_cont.17594
beq_else.17593:
	addi	%a2, %zero, 0
beq_cont.17594:
	j	beq_cont.17592
beq_else.17591:
	addi	%a2, %zero, 0
beq_cont.17592:
	j	beq_cont.17590
beq_else.17589:
	addi	%a2, %zero, 0
beq_cont.17590:
	j	beq_cont.17588
beq_else.17587:
	addi	%a2, %zero, 0
beq_cont.17588:
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.17595
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	j	do_without_neighbors.2995
beq_else.17595:
	lw	%a1, 3(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	sw	%v1, 7(%sp)
	addi	%at, %zero, 0
	bne	%a1, %at, beq_else.17596
	j	beq_cont.17597
beq_else.17596:
	lw	%a1, 3(%sp)
	addi	%a2, %v1, 0
	addi	%v1, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.17597:
	lw	%v0, 7(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 3(%sp)
	j	try_exploit_neighbors.3011
beq_else.17586:
	jr	%ra
beq_else.17585:
	jr	%ra
beq_else.17567:
	jr	%ra
beq_else.17566:
	jr	%ra
write_rgb.3022:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17602
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17604
	j	beq_cont.17605
beq_else.17604:
	addi	%v0, %zero, 0
beq_cont.17605:
	j	beq_cont.17603
beq_else.17602:
	addi	%v0, %zero, 255
beq_cont.17603:
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
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17606
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17608
	j	beq_cont.17609
beq_else.17608:
	addi	%v0, %zero, 0
beq_cont.17609:
	j	beq_cont.17607
beq_else.17606:
	addi	%v0, %zero, 255
beq_cont.17607:
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
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17610
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17612
	j	beq_cont.17613
beq_else.17612:
	addi	%v0, %zero, 0
beq_cont.17613:
	j	beq_cont.17611
beq_else.17610:
	addi	%v0, %zero, 255
beq_cont.17611:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17614
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17615
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17616
	j	beq_cont.17617
beq_else.17616:
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
beq_cont.17617:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17618
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17619
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17620
	j	beq_cont.17621
beq_else.17620:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17622
	addi	%v1, %zero, 0
	j	beq_cont.17623
beq_else.17622:
	addi	%v1, %zero, 1
beq_cont.17623:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17624
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	beq_cont.17625
beq_else.17624:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.17625:
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
beq_cont.17621:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3024
beq_else.17619:
	jr	%ra
beq_else.17618:
	jr	%ra
beq_else.17615:
	jr	%ra
beq_else.17614:
	jr	%ra
pretrace_pixels.3027:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.17630
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
	slti	%at, %a2, 0
	bne	%at, %zero, beq_else.17631
	lw	%a2, 3(%a0)
	lw	%a2, 0(%a2)
	sw	%a0, 6(%sp)
	addi	%at, %zero, 0
	bne	%a2, %at, beq_else.17633
	j	beq_cont.17634
beq_else.17633:
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17635
	addi	%v1, %zero, 0
	j	beq_cont.17636
beq_else.17635:
	addi	%v1, %zero, 1
beq_cont.17636:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17637
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	beq_cont.17638
beq_else.17637:
	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
beq_cont.17638:
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
beq_cont.17634:
	addi	%v1, %zero, 1
	lw	%v0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	beq_cont.17632
beq_else.17631:
beq_cont.17632:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.17639
	addi	%a0, %v0, -5
	j	beq_cont.17640
beq_else.17639:
	add	%a0, %zero, %v0
beq_cont.17640:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 5(%sp)
	j	pretrace_pixels.3027
beq_else.17630:
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
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	j	pretrace_pixels.3027
scan_pixel.3038:
	addi	%a3, %zero, 143
	lw	%a3, 0(%a3)
	slt	%at, %v0, %a3
	bne	%at, %zero, beq_else.17642
	jr	%ra
beq_else.17642:
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
	slt	%at, %t0, %a3
	bne	%at, %zero, beq_else.17644
	addi	%a3, %zero, 0
	j	beq_cont.17645
beq_else.17644:
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17646
	addi	%a3, %zero, 0
	j	beq_cont.17647
beq_else.17646:
	addi	%a3, %zero, 143
	lw	%a3, 0(%a3)
	addi	%t0, %v0, 1
	slt	%at, %t0, %a3
	bne	%at, %zero, beq_else.17648
	addi	%a3, %zero, 0
	j	beq_cont.17649
beq_else.17648:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17650
	addi	%a3, %zero, 0
	j	beq_cont.17651
beq_else.17650:
	addi	%a3, %zero, 1
beq_cont.17651:
beq_cont.17649:
beq_cont.17647:
beq_cont.17645:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%a3, %at, beq_else.17652
	add	%at, %a1, %v0
	lw	%a3, 0(%at)
	addi	%t0, %zero, 0
	lw	%t1, 2(%a3)
	lw	%t1, 0(%t1)
	slti	%at, %t1, 0
	bne	%at, %zero, beq_else.17654
	lw	%t1, 3(%a3)
	lw	%t1, 0(%t1)
	sw	%a3, 5(%sp)
	addi	%at, %zero, 0
	bne	%t1, %at, beq_else.17656
	j	beq_cont.17657
beq_else.17656:
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17657:
	addi	%v1, %zero, 1
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	beq_cont.17655
beq_else.17654:
beq_cont.17655:
	j	beq_cont.17653
beq_else.17652:
	addi	%a3, %zero, 0
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	lw	%t1, 2(%t0)
	lw	%t1, 0(%t1)
	slti	%at, %t1, 0
	bne	%at, %zero, beq_else.17658
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t1, 2(%t1)
	lw	%t1, 0(%t1)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17660
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17662
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17664
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	lw	%t2, 0(%t2)
	bne	%t2, %t1, beq_else.17666
	addi	%t1, %zero, 1
	j	beq_cont.17667
beq_else.17666:
	addi	%t1, %zero, 0
beq_cont.17667:
	j	beq_cont.17665
beq_else.17664:
	addi	%t1, %zero, 0
beq_cont.17665:
	j	beq_cont.17663
beq_else.17662:
	addi	%t1, %zero, 0
beq_cont.17663:
	j	beq_cont.17661
beq_else.17660:
	addi	%t1, %zero, 0
beq_cont.17661:
	addi	%at, %zero, 0
	bne	%t1, %at, beq_else.17668
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	beq_cont.17669
beq_else.17668:
	lw	%t0, 3(%t0)
	lw	%t0, 0(%t0)
	addi	%at, %zero, 0
	bne	%t0, %at, beq_else.17670
	j	beq_cont.17671
beq_else.17670:
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17671:
	addi	%a3, %zero, 1
	lw	%v0, 4(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.17669:
	j	beq_cont.17659
beq_else.17658:
beq_cont.17659:
beq_cont.17653:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17672
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17674
	j	beq_cont.17675
beq_else.17674:
	addi	%v0, %zero, 0
beq_cont.17675:
	j	beq_cont.17673
beq_else.17672:
	addi	%v0, %zero, 255
beq_cont.17673:
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
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17676
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17678
	j	beq_cont.17679
beq_else.17678:
	addi	%v0, %zero, 0
beq_cont.17679:
	j	beq_cont.17677
beq_else.17676:
	addi	%v0, %zero, 255
beq_cont.17677:
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
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17680
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17682
	j	beq_cont.17683
beq_else.17682:
	addi	%v0, %zero, 0
beq_cont.17683:
	j	beq_cont.17681
beq_else.17680:
	addi	%v0, %zero, 255
beq_cont.17681:
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
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.17684
	jr	%ra
beq_else.17684:
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
	slt	%at, %a2, %v1
	bne	%at, %zero, beq_else.17686
	addi	%v1, %zero, 0
	j	beq_cont.17687
beq_else.17686:
	addi	%at, %zero, 0
	slt	%at, %at, %a0
	bne	%at, %zero, beq_else.17688
	addi	%v1, %zero, 0
	j	beq_cont.17689
beq_else.17688:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a2, %v0, 1
	slt	%at, %a2, %v1
	bne	%at, %zero, beq_else.17690
	addi	%v1, %zero, 0
	j	beq_cont.17691
beq_else.17690:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17692
	addi	%v1, %zero, 0
	j	beq_cont.17693
beq_else.17692:
	addi	%v1, %zero, 1
beq_cont.17693:
beq_cont.17691:
beq_cont.17689:
beq_cont.17687:
	sw	%v0, 6(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17694
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
	j	beq_cont.17695
beq_else.17694:
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
beq_cont.17695:
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
	slt	%at, %v0, %a3
	bne	%at, %zero, beq_else.17696
	jr	%ra
beq_else.17696:
	addi	%a3, %zero, 143
	lw	%a3, 1(%a3)
	addi	%a3, %a3, -1
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a0, 4(%sp)
	slt	%at, %v0, %a3
	bne	%at, %zero, beq_else.17698
	j	beq_cont.17699
beq_else.17698:
	addi	%a3, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
beq_cont.17699:
	addi	%v0, %zero, 0
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17700
	j	beq_cont.17701
beq_else.17700:
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
	slt	%at, %a2, %v1
	bne	%at, %zero, beq_else.17702
	addi	%v1, %zero, 0
	j	beq_cont.17703
beq_else.17702:
	addi	%at, %zero, 0
	slt	%at, %at, %a0
	bne	%at, %zero, beq_else.17704
	addi	%v1, %zero, 0
	j	beq_cont.17705
beq_else.17704:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%at, %zero, 1
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.17706
	addi	%v1, %zero, 0
	j	beq_cont.17707
beq_else.17706:
	addi	%v1, %zero, 0
beq_cont.17707:
beq_cont.17705:
beq_cont.17703:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.17708
	lw	%v0, 0(%a1)
	addi	%v1, %zero, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.17709
beq_else.17708:
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
beq_cont.17709:
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
beq_cont.17701:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 2
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.17710
	addi	%a0, %v0, -5
	j	beq_cont.17711
beq_else.17710:
	add	%a0, %zero, %v0
beq_cont.17711:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	slt	%at, %v1, %v0
	bne	%at, %zero, beq_else.17712
	jr	%ra
beq_else.17712:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	slt	%at, %v1, %v0
	bne	%at, %zero, beq_else.17714
	j	beq_cont.17715
beq_else.17714:
	addi	%v0, %v1, 1
	lw	%a1, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	pretrace_line.3034
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.17715:
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
	slti	%at, %v1, 5
	bne	%at, %zero, beq_else.17716
	addi	%a2, %v1, -5
	j	beq_cont.17717
beq_else.17716:
	add	%a2, %zero, %v1
beq_cont.17717:
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
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.17718
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17719
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
beq_else.17719:
	add	%v0, %zero, %a0
	jr	%ra
beq_else.17718:
	jr	%ra
calc_dirvec.3064:
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.17720
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
beq_else.17720:
	fmul	%f0, %f1, %f1
	flw	%f1, 419(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f1, %f1, %f0
	flw	%f4, 444(%zero)
	fslt	%at, %f1, %f4
	bne	%at, %zero, beq_else.17722
	addi	%a1, %zero, 1
	j	beq_cont.17723
beq_else.17722:
	addi	%a1, %zero, 0
beq_cont.17723:
	fabs	%f4, %f1
	flw	%f5, 432(%zero)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f2, 5(%sp)
	fslt	%at, %f4, %f5
	bne	%at, %zero, beq_else.17724
	flw	%f1, 431(%zero)
	sw	%a1, 6(%sp)
	fslt	%at, %f4, %f1
	bne	%at, %zero, beq_else.17726
	flw	%f1, 453(%zero)
	flw	%f5, 448(%zero)
	fdiv	%f4, %f5, %f4
	fsw	%f1, 7(%sp)
	fadd	%f0, %f4, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	kernel_atan.2612
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.17727
beq_else.17726:
	flw	%f1, 452(%zero)
	flw	%f5, 448(%zero)
	fsub	%f5, %f4, %f5
	flw	%f6, 448(%zero)
	fadd	%f4, %f4, %f6
	fdiv	%f4, %f5, %f4
	fsw	%f1, 8(%sp)
	fadd	%f0, %f4, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
beq_cont.17727:
	lw	%v0, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17728
	fneg	%f0, %f0
	j	beq_cont.17729
beq_else.17728:
beq_cont.17729:
	j	beq_cont.17725
beq_else.17724:
	fadd	%f0, %f1, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	kernel_atan.2612
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.17725:
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
	fadd	%f0, %f1, %fzero
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
	fslt	%at, %f2, %f3
	bne	%at, %zero, beq_else.17730
	addi	%v1, %zero, 1
	j	beq_cont.17731
beq_else.17730:
	addi	%v1, %zero, 0
beq_cont.17731:
	fabs	%f3, %f2
	flw	%f4, 432(%zero)
	fsw	%f0, 11(%sp)
	sw	%v0, 12(%sp)
	fsw	%f1, 13(%sp)
	fslt	%at, %f3, %f4
	bne	%at, %zero, beq_else.17732
	flw	%f2, 431(%zero)
	sw	%v1, 14(%sp)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.17734
	flw	%f2, 453(%zero)
	flw	%f4, 448(%zero)
	fdiv	%f3, %f4, %f3
	fsw	%f2, 15(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	kernel_atan.2612
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.17735
beq_else.17734:
	flw	%f2, 452(%zero)
	flw	%f4, 448(%zero)
	fsub	%f4, %f3, %f4
	flw	%f5, 448(%zero)
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f4, %f3
	fsw	%f2, 16(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	kernel_atan.2612
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fadd	%f0, %f1, %f0
beq_cont.17735:
	lw	%v0, 14(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17736
	fneg	%f0, %f0
	j	beq_cont.17737
beq_else.17736:
beq_cont.17737:
	j	beq_cont.17733
beq_else.17732:
	fadd	%f0, %f2, %fzero
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	kernel_atan.2612
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
beq_cont.17733:
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
	fadd	%f0, %f1, %fzero
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17738
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
	fadd	%f29, %f3, %fzero
	fadd	%f3, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
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
	slti	%at, %v1, 5
	bne	%at, %zero, beq_else.17739
	addi	%v1, %v1, -5
	j	beq_cont.17740
beq_else.17739:
beq_cont.17740:
	flw	%f0, 0(%sp)
	lw	%a0, 2(%sp)
	j	calc_dirvecs.3072
beq_else.17738:
	jr	%ra
calc_dirvec_rows.3077:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17742
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
	slti	%at, %v1, 5
	bne	%at, %zero, beq_else.17743
	addi	%v1, %v1, -5
	j	beq_cont.17744
beq_else.17743:
beq_cont.17744:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 4
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17745
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
	slti	%at, %v1, 5
	bne	%at, %zero, beq_else.17746
	addi	%v1, %v1, -5
	j	beq_cont.17747
beq_else.17746:
beq_cont.17747:
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3077
beq_else.17745:
	jr	%ra
beq_else.17742:
	jr	%ra
create_dirvec_elements.3083:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.17750
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17751
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17752
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17753
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
beq_else.17753:
	jr	%ra
beq_else.17752:
	jr	%ra
beq_else.17751:
	jr	%ra
beq_else.17750:
	jr	%ra
create_dirvecs.3086:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17758
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17759
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
beq_else.17759:
	jr	%ra
beq_else.17758:
	jr	%ra
init_dirvec_constants.3088:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.17762
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17763
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 2(%sp)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17764
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 3(%sp)
	addi	%at, %zero, 1
	bne	%t1, %at, beq_else.17766
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
	j	beq_cont.17767
beq_else.17766:
	addi	%at, %zero, 2
	bne	%t1, %at, beq_else.17768
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
	j	beq_cont.17769
beq_else.17768:
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
beq_cont.17769:
beq_cont.17767:
	addi	%v1, %v1, -1
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	beq_cont.17765
beq_else.17764:
beq_cont.17765:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17770
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17771
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 7(%sp)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17772
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	addi	%at, %zero, 1
	bne	%t1, %at, beq_else.17774
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
	j	beq_cont.17775
beq_else.17774:
	addi	%at, %zero, 2
	bne	%t1, %at, beq_else.17776
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
	j	beq_cont.17777
beq_else.17776:
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
beq_cont.17777:
beq_cont.17775:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	beq_cont.17773
beq_else.17772:
beq_cont.17773:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
beq_else.17771:
	jr	%ra
beq_else.17770:
	jr	%ra
beq_else.17763:
	jr	%ra
beq_else.17762:
	jr	%ra
init_vecset_constants.3091:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17782
	addi	%v1, %zero, 166
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17783
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 2(%sp)
	addi	%at, %zero, 1
	bne	%t1, %at, beq_else.17785
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
	j	beq_cont.17786
beq_else.17785:
	addi	%at, %zero, 2
	bne	%t1, %at, beq_else.17787
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
	j	beq_cont.17788
beq_else.17787:
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
beq_cont.17788:
beq_cont.17786:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	beq_cont.17784
beq_else.17783:
beq_cont.17784:
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
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17789
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 5(%sp)
	addi	%at, %zero, 1
	bne	%t0, %at, beq_else.17791
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
	j	beq_cont.17792
beq_else.17791:
	addi	%at, %zero, 2
	bne	%t0, %at, beq_else.17793
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
	j	beq_cont.17794
beq_else.17793:
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
beq_cont.17794:
beq_cont.17792:
	addi	%v1, %v1, -1
	lw	%v0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.17790
beq_else.17789:
beq_cont.17790:
	addi	%v1, %zero, 116
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17795
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
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17796
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 10(%sp)
	addi	%at, %zero, 1
	bne	%t0, %at, beq_else.17798
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
	j	beq_cont.17799
beq_else.17798:
	addi	%at, %zero, 2
	bne	%t0, %at, beq_else.17800
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
	j	beq_cont.17801
beq_else.17800:
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
beq_cont.17801:
beq_cont.17799:
	addi	%v1, %v1, -1
	lw	%v0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	beq_cont.17797
beq_else.17796:
beq_cont.17797:
	addi	%v1, %zero, 117
	lw	%v0, 9(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -1
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17802
	addi	%v1, %zero, 166
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17803
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 15(%sp)
	addi	%at, %zero, 1
	bne	%t1, %at, beq_else.17805
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
	j	beq_cont.17806
beq_else.17805:
	addi	%at, %zero, 2
	bne	%t1, %at, beq_else.17807
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
	j	beq_cont.17808
beq_else.17807:
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
beq_cont.17808:
beq_cont.17806:
	addi	%v1, %v1, -1
	lw	%v0, 15(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	beq_cont.17804
beq_else.17803:
beq_cont.17804:
	addi	%v1, %zero, 118
	lw	%v0, 14(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17809
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
beq_else.17809:
	jr	%ra
beq_else.17802:
	jr	%ra
beq_else.17795:
	jr	%ra
beq_else.17782:
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
	fadd	%f0, %f5, %fzero
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
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17814
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17816
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
	j	beq_cont.17817
beq_else.17816:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17818
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
	j	beq_cont.17819
beq_else.17818:
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
beq_cont.17819:
beq_cont.17817:
	addi	%v1, %v1, -1
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	beq_cont.17815
beq_else.17814:
beq_cont.17815:
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
	fadd	%f0, %f2, %fzero
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
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17820
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17822
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
	j	beq_cont.17823
beq_else.17822:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17824
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
	j	beq_cont.17825
beq_else.17824:
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
beq_cont.17825:
beq_cont.17823:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	beq_cont.17821
beq_else.17820:
beq_cont.17821:
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
	fadd	%f0, %f2, %fzero
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
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17826
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17828
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
	j	beq_cont.17829
beq_else.17828:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17830
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
	j	beq_cont.17831
beq_else.17830:
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
beq_cont.17831:
beq_cont.17829:
	addi	%v1, %v1, -1
	lw	%v0, 23(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	beq_cont.17827
beq_else.17826:
beq_cont.17827:
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
	fadd	%f0, %f4, %fzero
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
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.17833
	addi	%a2, %zero, 1
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	addi	%at, %zero, 1
	bne	%a3, %at, beq_else.17835
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
	j	beq_cont.17836
beq_else.17835:
	addi	%at, %zero, 2
	bne	%a3, %at, beq_else.17837
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
	j	beq_cont.17838
beq_else.17837:
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
beq_cont.17838:
beq_cont.17836:
	addi	%v1, %v1, -1
	lw	%v0, 7(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	beq_cont.17834
beq_else.17833:
beq_cont.17834:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.17840
	addi	%v0, %zero, 0
	lw	%v1, 28(%sp)
	sw	%v1, 0(%v0)
	j	beq_cont.17841
beq_else.17840:
	addi	%v0, %zero, 1
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	read_object.2765
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
beq_cont.17841:
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
	slti	%at, %a0, 0
	bne	%at, %zero, beq_else.17842
	addi	%a1, %zero, 1
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 30(%sp)
	addi	%at, %zero, 1
	bne	%t0, %at, beq_else.17844
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
	j	beq_cont.17845
beq_else.17844:
	addi	%at, %zero, 2
	bne	%t0, %at, beq_else.17846
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
	j	beq_cont.17847
beq_else.17846:
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
beq_cont.17847:
beq_cont.17845:
	addi	%v1, %v1, -1
	lw	%v0, 30(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	beq_cont.17843
beq_else.17842:
beq_cont.17843:
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
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.17848
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.17850
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 448(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.17852
	addi	%a0, %zero, 0
	j	beq_cont.17853
beq_else.17852:
	addi	%a0, %zero, 1
beq_cont.17853:
	addi	%at, %zero, 0
	bne	%a0, %at, beq_else.17854
	j	beq_cont.17855
beq_else.17854:
	lw	%a0, 1(%v1)
	addi	%at, %zero, 1
	bne	%a0, %at, beq_else.17856
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_rect_reflection.3102
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	beq_cont.17857
beq_else.17856:
	addi	%at, %zero, 2
	bne	%a0, %at, beq_else.17858
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	setup_surface_reflection.3105
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	beq_cont.17859
beq_else.17858:
beq_cont.17859:
beq_cont.17857:
beq_cont.17855:
	j	beq_cont.17851
beq_else.17850:
beq_cont.17851:
	j	beq_cont.17849
beq_else.17848:
beq_cont.17849:
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
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17860
	jr	%ra
beq_else.17860:
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	addi	%v0, %v0, -1
	sw	%v1, 33(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.17862
	j	beq_cont.17863
beq_else.17862:
	addi	%v0, %zero, 1
	lw	%a1, 27(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	pretrace_line.3034
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
beq_cont.17863:
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
