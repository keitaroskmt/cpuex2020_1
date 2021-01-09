.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 483
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
kernel_atan.2607:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 482(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 481(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 480(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 479(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 478(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 477(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
cos.2611:
	flw	%f1, 476(%zero)
	fabs	%f0, %f0
	flw	%f2, 475(%zero)
	fdiv	%f3, %f0, %f2
	floor	%f3, %f3
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fblt	%f0, %f1, fbgt_else.18472
	addi	%v0, %zero, 0
	j	fbgt_cont.18473
fbgt_else.18472:
	addi	%v0, %zero, 1
fbgt_cont.18473:
	fblt	%f0, %f1, fbgt_else.18474
	fsub	%f0, %f0, %f1
	j	fbgt_cont.18475
fbgt_else.18474:
fbgt_cont.18475:
	flw	%f2, 474(%zero)
	fblt	%f0, %f2, fbgt_else.18476
	beqi	%v0, 0, bnei_else.18478
	addi	%v0, %zero, 0
	j	bnei_cont.18479
bnei_else.18478:
	addi	%v0, %zero, 1
bnei_cont.18479:
	j	fbgt_cont.18477
fbgt_else.18476:
fbgt_cont.18477:
	fblt	%f0, %f2, fbgt_else.18480
	fsub	%f0, %f1, %f0
	j	fbgt_cont.18481
fbgt_else.18480:
fbgt_cont.18481:
	flw	%f1, 473(%zero)
	fblt	%f1, %f0, fbgt_else.18482
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 469(%zero)
	flw	%f3, 468(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.18483
fbgt_else.18482:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 471(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 470(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.18483:
	beqi	%v0, 0, bnei_else.18484
	jr	%ra
bnei_else.18484:
	fneg	%f0, %f0
	jr	%ra
sin.2613:
	flw	%f1, 476(%zero)
	flw	%f2, 465(%zero)
	fblt	%f0, %f2, fbgt_else.18485
	addi	%v0, %zero, 1
	j	fbgt_cont.18486
fbgt_else.18485:
	addi	%v0, %zero, 0
fbgt_cont.18486:
	fabs	%f0, %f0
	flw	%f2, 475(%zero)
	fdiv	%f3, %f0, %f2
	floor	%f3, %f3
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fblt	%f0, %f1, fbgt_else.18487
	beqi	%v0, 0, bnei_else.18489
	addi	%v0, %zero, 0
	j	bnei_cont.18490
bnei_else.18489:
	addi	%v0, %zero, 1
bnei_cont.18490:
	j	fbgt_cont.18488
fbgt_else.18487:
fbgt_cont.18488:
	fblt	%f0, %f1, fbgt_else.18491
	fsub	%f0, %f0, %f1
	j	fbgt_cont.18492
fbgt_else.18491:
fbgt_cont.18492:
	flw	%f2, 474(%zero)
	fblt	%f0, %f2, fbgt_else.18493
	fsub	%f0, %f1, %f0
	j	fbgt_cont.18494
fbgt_else.18493:
fbgt_cont.18494:
	flw	%f1, 473(%zero)
	fblt	%f1, %f0, fbgt_else.18495
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 471(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 470(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.18496
fbgt_else.18495:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 469(%zero)
	flw	%f3, 468(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.18496:
	beqi	%v0, 0, bnei_else.18497
	jr	%ra
bnei_else.18497:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2617:
	blti	%v0, 10, bgti_else.18498
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18499
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18500
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18501
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18502
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18503
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18504
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18505
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2617
bgti_else.18505:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18504:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18503:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18502:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18501:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18500:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18499:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18498:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2620:
	blti	%v0, 10, bgti_else.18506
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18507
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18508
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18509
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18510
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18511
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18512
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18513
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18514
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18515
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18516
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18517
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18518
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18519
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18520
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18521
	addi	%v0, %v0, -10
	j	print_int_sub2.2620
bgti_else.18521:
	jr	%ra
bgti_else.18520:
	jr	%ra
bgti_else.18519:
	jr	%ra
bgti_else.18518:
	jr	%ra
bgti_else.18517:
	jr	%ra
bgti_else.18516:
	jr	%ra
bgti_else.18515:
	jr	%ra
bgti_else.18514:
	jr	%ra
bgti_else.18513:
	jr	%ra
bgti_else.18512:
	jr	%ra
bgti_else.18511:
	jr	%ra
bgti_else.18510:
	jr	%ra
bgti_else.18509:
	jr	%ra
bgti_else.18508:
	jr	%ra
bgti_else.18507:
	jr	%ra
bgti_else.18506:
	jr	%ra
print_int.2622:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.18522
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.18524
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18526
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18528
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18530
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18532
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18534
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2617
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.18535
bgti_else.18534:
	addi	%v0, %zero, 6
bgti_cont.18535:
	j	bgti_cont.18533
bgti_else.18532:
	addi	%v0, %zero, 5
bgti_cont.18533:
	j	bgti_cont.18531
bgti_else.18530:
	addi	%v0, %zero, 4
bgti_cont.18531:
	j	bgti_cont.18529
bgti_else.18528:
	addi	%v0, %zero, 3
bgti_cont.18529:
	j	bgti_cont.18527
bgti_else.18526:
	addi	%v0, %zero, 2
bgti_cont.18527:
	j	bgti_cont.18525
bgti_else.18524:
	addi	%v0, %zero, 1
bgti_cont.18525:
	j	bgti_cont.18523
bgti_else.18522:
	addi	%v0, %zero, 0
bgti_cont.18523:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.18536
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18538
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18540
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18542
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18544
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18546
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18548
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18550
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18552
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18554
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18556
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18558
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18560
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18562
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18564
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2620
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.18565
bgti_else.18564:
	add	%v0, %zero, %v1
bgti_cont.18565:
	j	bgti_cont.18563
bgti_else.18562:
	add	%v0, %zero, %v1
bgti_cont.18563:
	j	bgti_cont.18561
bgti_else.18560:
	add	%v0, %zero, %v1
bgti_cont.18561:
	j	bgti_cont.18559
bgti_else.18558:
	add	%v0, %zero, %v1
bgti_cont.18559:
	j	bgti_cont.18557
bgti_else.18556:
	add	%v0, %zero, %v1
bgti_cont.18557:
	j	bgti_cont.18555
bgti_else.18554:
	add	%v0, %zero, %v1
bgti_cont.18555:
	j	bgti_cont.18553
bgti_else.18552:
	add	%v0, %zero, %v1
bgti_cont.18553:
	j	bgti_cont.18551
bgti_else.18550:
	add	%v0, %zero, %v1
bgti_cont.18551:
	j	bgti_cont.18549
bgti_else.18548:
	add	%v0, %zero, %v1
bgti_cont.18549:
	j	bgti_cont.18547
bgti_else.18546:
	add	%v0, %zero, %v1
bgti_cont.18547:
	j	bgti_cont.18545
bgti_else.18544:
	add	%v0, %zero, %v1
bgti_cont.18545:
	j	bgti_cont.18543
bgti_else.18542:
	add	%v0, %zero, %v1
bgti_cont.18543:
	j	bgti_cont.18541
bgti_else.18540:
	add	%v0, %zero, %v1
bgti_cont.18541:
	j	bgti_cont.18539
bgti_else.18538:
	add	%v0, %zero, %v1
bgti_cont.18539:
	j	bgti_cont.18537
bgti_else.18536:
	add	%v0, %zero, %v1
bgti_cont.18537:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.18566
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.18566:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.18567
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.18569
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18571
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18573
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18575
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18577
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18579
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.18580
bgti_else.18579:
	addi	%v0, %zero, 6
bgti_cont.18580:
	j	bgti_cont.18578
bgti_else.18577:
	addi	%v0, %zero, 5
bgti_cont.18578:
	j	bgti_cont.18576
bgti_else.18575:
	addi	%v0, %zero, 4
bgti_cont.18576:
	j	bgti_cont.18574
bgti_else.18573:
	addi	%v0, %zero, 3
bgti_cont.18574:
	j	bgti_cont.18572
bgti_else.18571:
	addi	%v0, %zero, 2
bgti_cont.18572:
	j	bgti_cont.18570
bgti_else.18569:
	addi	%v0, %zero, 1
bgti_cont.18570:
	j	bgti_cont.18568
bgti_else.18567:
	addi	%v0, %zero, 0
bgti_cont.18568:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.18581
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18583
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18585
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18587
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18589
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18591
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18593
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18595
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18597
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18599
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18601
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18603
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18605
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18607
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18609
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2620
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.18610
bgti_else.18609:
	add	%v0, %zero, %v1
bgti_cont.18610:
	j	bgti_cont.18608
bgti_else.18607:
	add	%v0, %zero, %v1
bgti_cont.18608:
	j	bgti_cont.18606
bgti_else.18605:
	add	%v0, %zero, %v1
bgti_cont.18606:
	j	bgti_cont.18604
bgti_else.18603:
	add	%v0, %zero, %v1
bgti_cont.18604:
	j	bgti_cont.18602
bgti_else.18601:
	add	%v0, %zero, %v1
bgti_cont.18602:
	j	bgti_cont.18600
bgti_else.18599:
	add	%v0, %zero, %v1
bgti_cont.18600:
	j	bgti_cont.18598
bgti_else.18597:
	add	%v0, %zero, %v1
bgti_cont.18598:
	j	bgti_cont.18596
bgti_else.18595:
	add	%v0, %zero, %v1
bgti_cont.18596:
	j	bgti_cont.18594
bgti_else.18593:
	add	%v0, %zero, %v1
bgti_cont.18594:
	j	bgti_cont.18592
bgti_else.18591:
	add	%v0, %zero, %v1
bgti_cont.18592:
	j	bgti_cont.18590
bgti_else.18589:
	add	%v0, %zero, %v1
bgti_cont.18590:
	j	bgti_cont.18588
bgti_else.18587:
	add	%v0, %zero, %v1
bgti_cont.18588:
	j	bgti_cont.18586
bgti_else.18585:
	add	%v0, %zero, %v1
bgti_cont.18586:
	j	bgti_cont.18584
bgti_else.18583:
	add	%v0, %zero, %v1
bgti_cont.18584:
	j	bgti_cont.18582
bgti_else.18581:
	add	%v0, %zero, %v1
bgti_cont.18582:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.18611
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.18611:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.18612
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18614
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18616
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18618
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18620
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18622
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18624
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18626
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18628
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18630
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18632
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18634
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18636
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18638
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18640
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2620
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.18641
bgti_else.18640:
	add	%v0, %zero, %v1
bgti_cont.18641:
	j	bgti_cont.18639
bgti_else.18638:
	add	%v0, %zero, %v1
bgti_cont.18639:
	j	bgti_cont.18637
bgti_else.18636:
	add	%v0, %zero, %v1
bgti_cont.18637:
	j	bgti_cont.18635
bgti_else.18634:
	add	%v0, %zero, %v1
bgti_cont.18635:
	j	bgti_cont.18633
bgti_else.18632:
	add	%v0, %zero, %v1
bgti_cont.18633:
	j	bgti_cont.18631
bgti_else.18630:
	add	%v0, %zero, %v1
bgti_cont.18631:
	j	bgti_cont.18629
bgti_else.18628:
	add	%v0, %zero, %v1
bgti_cont.18629:
	j	bgti_cont.18627
bgti_else.18626:
	add	%v0, %zero, %v1
bgti_cont.18627:
	j	bgti_cont.18625
bgti_else.18624:
	add	%v0, %zero, %v1
bgti_cont.18625:
	j	bgti_cont.18623
bgti_else.18622:
	add	%v0, %zero, %v1
bgti_cont.18623:
	j	bgti_cont.18621
bgti_else.18620:
	add	%v0, %zero, %v1
bgti_cont.18621:
	j	bgti_cont.18619
bgti_else.18618:
	add	%v0, %zero, %v1
bgti_cont.18619:
	j	bgti_cont.18617
bgti_else.18616:
	add	%v0, %zero, %v1
bgti_cont.18617:
	j	bgti_cont.18615
bgti_else.18614:
	add	%v0, %zero, %v1
bgti_cont.18615:
	j	bgti_cont.18613
bgti_else.18612:
	add	%v0, %zero, %v1
bgti_cont.18613:
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
vecunit_sgn.2650:
	flw	%f0, 0(%v0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%v0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%v0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 465(%zero)
	fbne	%f1, %f4, fbeq_else.18642
	addi	%a0, %zero, 1
	j	fbeq_cont.18643
fbeq_else.18642:
	addi	%a0, %zero, 0
fbeq_cont.18643:
	beqi	%a0, 0, bnei_else.18644
	flw	%f1, 469(%zero)
	j	bnei_cont.18645
bnei_else.18644:
	beqi	%v1, 0, bnei_else.18646
	flw	%f4, 464(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.18647
bnei_else.18646:
	flw	%f4, 469(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.18647:
bnei_cont.18645:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_screen_settings.2751:
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
	flw	%f1, 463(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2611
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2613
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	cos.2611
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	sin.2613
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 462(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 171
	fsw	%f2, 0(%v0)
	flw	%f2, 461(%zero)
	flw	%f4, 3(%sp)
	fmul	%f2, %f4, %f2
	addi	%v0, %zero, 171
	fsw	%f2, 1(%v0)
	flw	%f2, 5(%sp)
	fmul	%f5, %f1, %f2
	fmul	%f3, %f5, %f3
	addi	%v0, %zero, 171
	fsw	%f3, 2(%v0)
	addi	%v0, %zero, 165
	fsw	%f2, 0(%v0)
	flw	%f3, 465(%zero)
	addi	%v0, %zero, 165
	fsw	%f3, 1(%v0)
	fneg	%f3, %f0
	addi	%v0, %zero, 165
	fsw	%f3, 2(%v0)
	fneg	%f3, %f4
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 168
	fsw	%f0, 0(%v0)
	fneg	%f0, %f1
	addi	%v0, %zero, 168
	fsw	%f0, 1(%v0)
	fneg	%f0, %f4
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
rotate_quadratic_matrix.2755:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2611
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	fmov	%f0, %f1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	sin.2613
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2611
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2613
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	cos.2611
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2613
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 6(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 7(%sp)
	flw	%f5, 4(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 3(%sp)
	fmul	%f9, %f8, %f0
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4
	fmul	%f10, %f9, %f1
	fmul	%f11, %f5, %f0
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0
	fmul	%f6, %f6, %f0
	fmul	%f12, %f8, %f1
	fadd	%f6, %f6, %f12
	fmul	%f0, %f9, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	lw	%v0, 0(%sp)
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)
	flw	%f9, 2(%v0)
	fmul	%f12, %f3, %f3
	fmul	%f12, %f5, %f12
	fmul	%f13, %f11, %f11
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f12, %f5, %f12
	fmul	%f13, %f6, %f6
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f12, %f5, %f12
	fmul	%f13, %f0, %f0
	fmul	%f13, %f8, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f9, %f13
	fadd	%f12, %f12, %f13
	fsw	%f12, 2(%v0)
	flw	%f12, 460(%zero)
	fmul	%f13, %f5, %f7
	fmul	%f13, %f13, %f10
	fmul	%f14, %f8, %f6
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f13, %f12, %f13
	lw	%v0, 1(%sp)
	fsw	%f13, 0(%v0)
	fmul	%f3, %f5, %f3
	fmul	%f5, %f3, %f10
	fmul	%f8, %f8, %f11
	fmul	%f0, %f8, %f0
	fadd	%f0, %f5, %f0
	fmul	%f1, %f9, %f1
	fmul	%f2, %f1, %f2
	fadd	%f0, %f0, %f2
	fmul	%f0, %f12, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7
	fmul	%f2, %f8, %f6
	fadd	%f0, %f0, %f2
	fmul	%f1, %f1, %f4
	fadd	%f0, %f0, %f1
	fmul	%f0, %f12, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
read_nth_object.2758:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.18651
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
	flw	%f0, 465(%zero)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_float
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_float
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 2
	sw	%v1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
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
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_float
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 5(%sp)
	fblt	%f0, %f1, fbgt_else.18652
	addi	%v0, %zero, 0
	j	fbgt_cont.18653
fbgt_else.18652:
	addi	%v0, %zero, 1
fbgt_cont.18653:
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)
	lw	%v1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 4(%sp)
	beqi	%v1, 0, bnei_else.18654
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 463(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 0(%v0)
	fsw	%f1, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.18655
bnei_else.18654:
bnei_cont.18655:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.18656
	lw	%a0, 10(%sp)
	j	bnei_cont.18657
bnei_else.18656:
	addi	%a0, %zero, 1
bnei_cont.18657:
	addi	%a1, %zero, 4
	flw	%f0, 5(%sp)
	sw	%a0, 15(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_float_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 12(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 11(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 15(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 9(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 7(%sp)
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
	beqi	%a2, 3, bnei_else.18658
	beqi	%a2, 2, bnei_else.18660
	j	bnei_cont.18661
bnei_else.18660:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.18662
	addi	%v1, %zero, 0
	j	bnei_cont.18663
bnei_else.18662:
	addi	%v1, %zero, 1
bnei_cont.18663:
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecunit_sgn.2650
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.18661:
	j	bnei_cont.18659
bnei_else.18658:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.18664
	addi	%v1, %zero, 1
	j	fbeq_cont.18665
fbeq_else.18664:
	addi	%v1, %zero, 0
fbeq_cont.18665:
	beqi	%v1, 0, bnei_else.18666
	fmov	%f0, %f1
	j	bnei_cont.18667
bnei_else.18666:
	fbne	%f0, %f1, fbeq_else.18668
	addi	%v1, %zero, 1
	j	fbeq_cont.18669
fbeq_else.18668:
	addi	%v1, %zero, 0
fbeq_cont.18669:
	beqi	%v1, 0, bnei_else.18670
	fmov	%f2, %f1
	j	bnei_cont.18671
bnei_else.18670:
	fblt	%f1, %f0, fbgt_else.18672
	addi	%v1, %zero, 0
	j	fbgt_cont.18673
fbgt_else.18672:
	addi	%v1, %zero, 1
fbgt_cont.18673:
	beqi	%v1, 0, bnei_else.18674
	flw	%f2, 469(%zero)
	j	bnei_cont.18675
bnei_else.18674:
	flw	%f2, 464(%zero)
bnei_cont.18675:
bnei_cont.18671:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.18667:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.18676
	addi	%v1, %zero, 1
	j	fbeq_cont.18677
fbeq_else.18676:
	addi	%v1, %zero, 0
fbeq_cont.18677:
	beqi	%v1, 0, bnei_else.18678
	fmov	%f0, %f1
	j	bnei_cont.18679
bnei_else.18678:
	fbne	%f0, %f1, fbeq_else.18680
	addi	%v1, %zero, 1
	j	fbeq_cont.18681
fbeq_else.18680:
	addi	%v1, %zero, 0
fbeq_cont.18681:
	beqi	%v1, 0, bnei_else.18682
	fmov	%f2, %f1
	j	bnei_cont.18683
bnei_else.18682:
	fblt	%f1, %f0, fbgt_else.18684
	addi	%v1, %zero, 0
	j	fbgt_cont.18685
fbgt_else.18684:
	addi	%v1, %zero, 1
fbgt_cont.18685:
	beqi	%v1, 0, bnei_else.18686
	flw	%f2, 469(%zero)
	j	bnei_cont.18687
bnei_else.18686:
	flw	%f2, 464(%zero)
bnei_cont.18687:
bnei_cont.18683:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.18679:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.18688
	addi	%v1, %zero, 1
	j	fbeq_cont.18689
fbeq_else.18688:
	addi	%v1, %zero, 0
fbeq_cont.18689:
	beqi	%v1, 0, bnei_else.18690
	fmov	%f0, %f1
	j	bnei_cont.18691
bnei_else.18690:
	fbne	%f0, %f1, fbeq_else.18692
	addi	%v1, %zero, 1
	j	fbeq_cont.18693
fbeq_else.18692:
	addi	%v1, %zero, 0
fbeq_cont.18693:
	beqi	%v1, 0, bnei_else.18694
	j	bnei_cont.18695
bnei_else.18694:
	fblt	%f1, %f0, fbgt_else.18696
	addi	%v1, %zero, 0
	j	fbgt_cont.18697
fbgt_else.18696:
	addi	%v1, %zero, 1
fbgt_cont.18697:
	beqi	%v1, 0, bnei_else.18698
	flw	%f1, 469(%zero)
	j	bnei_cont.18699
bnei_else.18698:
	flw	%f1, 464(%zero)
bnei_cont.18699:
bnei_cont.18695:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.18691:
	fsw	%f0, 2(%a0)
bnei_cont.18659:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.18700
	lw	%v0, 7(%sp)
	lw	%v1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2755
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.18701
bnei_else.18700:
bnei_cont.18701:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18651:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2760:
	blti	%v0, 60, bgti_else.18702
	jr	%ra
bgti_else.18702:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2758
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.18704
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18705
	jr	%ra
bgti_else.18705:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2758
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.18707
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18708
	jr	%ra
bgti_else.18708:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2758
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.18710
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18711
	jr	%ra
bgti_else.18711:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2758
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.18713
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18714
	jr	%ra
bgti_else.18714:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2758
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.18716
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18717
	jr	%ra
bgti_else.18717:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2758
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.18719
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18720
	jr	%ra
bgti_else.18720:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2758
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.18722
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.18723
	jr	%ra
bgti_else.18723:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2758
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.18725
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2760
bnei_else.18725:
	addi	%v0, %zero, 0
	lw	%v1, 7(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18722:
	addi	%v0, %zero, 0
	lw	%v1, 6(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18719:
	addi	%v0, %zero, 0
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18716:
	addi	%v0, %zero, 0
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18713:
	addi	%v0, %zero, 0
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18710:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18707:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.18704:
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
read_net_item.2764:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.18734
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.18735
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.18737
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.18739
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2764
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.18740
bnei_else.18739:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.18740:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.18738
bnei_else.18737:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.18738:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.18736
bnei_else.18735:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.18736:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.18734:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2766:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.18741
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.18743
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.18745
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2764
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.18746
bnei_else.18745:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.18746:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.18744
bnei_else.18743:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.18744:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.18742
bnei_else.18741:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.18742:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.18747
	addi	%v0, %zero, 1
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%v1, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.18748
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.18750
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2764
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.18751
bnei_else.18750:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.18751:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.18749
bnei_else.18748:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.18749:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.18752
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2766
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.18753
bnei_else.18752:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.18753:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.18747:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2768:
	addi	%v1, %zero, 0
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 2(%sp)
	beqi	%v0, -1, bnei_else.18754
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.18756
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.18758
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2764
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.18759
bnei_else.18758:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.18759:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.18757
bnei_else.18756:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.18757:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.18755
bnei_else.18754:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.18755:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.18760
	addi	%v1, %zero, 83
	lw	%a0, 1(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 1
	addi	%v1, %a0, 1
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.18761
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.18763
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2764
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.18764
bnei_else.18763:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.18764:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.18762
bnei_else.18761:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.18762:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.18765
	addi	%v1, %zero, 83
	lw	%a0, 6(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.18766
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2764
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.18767
bnei_else.18766:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.18767:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.18768
	addi	%v1, %zero, 83
	lw	%a0, 10(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	lw	%v1, 0(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	read_net_item.2764
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.18769
	addi	%v1, %zero, 83
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2768
bnei_else.18769:
	jr	%ra
bnei_else.18768:
	jr	%ra
bnei_else.18765:
	jr	%ra
bnei_else.18760:
	jr	%ra
solver_rect_surface.2772:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 465(%zero)
	fbne	%f3, %f4, fbeq_else.18774
	addi	%a3, %zero, 1
	j	fbeq_cont.18775
fbeq_else.18774:
	addi	%a3, %zero, 0
fbeq_cont.18775:
	beqi	%a3, 0, bnei_else.18776
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18776:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f3, %f4, fbgt_else.18777
	addi	%t0, %zero, 0
	j	fbgt_cont.18778
fbgt_else.18777:
	addi	%t0, %zero, 1
fbgt_cont.18778:
	beqi	%v0, 0, bnei_else.18779
	beqi	%t0, 0, bnei_else.18781
	addi	%v0, %zero, 0
	j	bnei_cont.18782
bnei_else.18781:
	addi	%v0, %zero, 1
bnei_cont.18782:
	j	bnei_cont.18780
bnei_else.18779:
	add	%v0, %zero, %t0
bnei_cont.18780:
	add	%at, %a3, %a0
	flw	%f4, 0(%at)
	beqi	%v0, 0, bnei_else.18783
	j	bnei_cont.18784
bnei_else.18783:
	fneg	%f4, %f4
bnei_cont.18784:
	fsub	%f0, %f4, %f0
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1
	flw	%f3, 0(%at)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	fabs	%f1, %f1
	add	%at, %a3, %a1
	flw	%f3, 0(%at)
	fblt	%f1, %f3, fbgt_else.18785
	addi	%v0, %zero, 0
	j	fbgt_cont.18786
fbgt_else.18785:
	addi	%v0, %zero, 1
fbgt_cont.18786:
	beqi	%v0, 0, bnei_else.18787
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.18788
	addi	%v0, %zero, 0
	j	fbgt_cont.18789
fbgt_else.18788:
	addi	%v0, %zero, 1
fbgt_cont.18789:
	beqi	%v0, 0, bnei_else.18790
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18790:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18787:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2787:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%v1)
	flw	%f6, 1(%v0)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%v1)
	flw	%f7, 2(%v0)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 465(%zero)
	fblt	%f5, %f3, fbgt_else.18791
	addi	%v0, %zero, 0
	j	fbgt_cont.18792
fbgt_else.18791:
	addi	%v0, %zero, 1
fbgt_cont.18792:
	beqi	%v0, 0, bnei_else.18793
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18793:
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2793:
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
	beqi	%v1, 0, bnei_else.18794
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
bnei_else.18794:
	fmov	%f0, %f3
	jr	%ra
bilinear.2798:
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
	beqi	%v1, 0, bnei_else.18795
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
	flw	%f1, 468(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	jr	%ra
bnei_else.18795:
	fmov	%f0, %f6
	jr	%ra
solver_second.2806:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f5, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	sw	%v0, 6(%sp)
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2793
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 465(%zero)
	fbne	%f0, %f1, fbeq_else.18796
	addi	%v0, %zero, 1
	j	fbeq_cont.18797
fbeq_else.18796:
	addi	%v0, %zero, 0
fbeq_cont.18797:
	beqi	%v0, 0, bnei_else.18798
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18798:
	flw	%f2, 5(%sp)
	flw	%f3, 4(%sp)
	flw	%f4, 3(%sp)
	flw	%f5, 2(%sp)
	flw	%f6, 1(%sp)
	flw	%f7, 0(%sp)
	lw	%v0, 6(%sp)
	fsw	%f1, 7(%sp)
	fsw	%f0, 8(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f3, %f5
	fmov	%f2, %f4
	fmov	%f5, %f7
	fmov	%f4, %f6
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	bilinear.2798
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	quadratic.2793
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.18799
	j	bnei_cont.18800
bnei_else.18799:
	flw	%f1, 469(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.18800:
	flw	%f1, 9(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 8(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 7(%sp)
	fblt	%f2, %f0, fbgt_else.18801
	addi	%v1, %zero, 0
	j	fbgt_cont.18802
fbgt_else.18801:
	addi	%v1, %zero, 1
fbgt_cont.18802:
	beqi	%v1, 0, bnei_else.18803
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.18804
	j	bnei_cont.18805
bnei_else.18804:
	fneg	%f0, %f0
bnei_cont.18805:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18803:
	addi	%v0, %zero, 0
	jr	%ra
solver.2812:
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	addi	%a1, %zero, 0
	flw	%f0, 0(%a0)
	lw	%a2, 5(%v0)
	flw	%f1, 0(%a2)
	fsub	%f0, %f0, %f1
	addi	%a2, %zero, 1
	flw	%f1, 1(%a0)
	lw	%a3, 5(%v0)
	flw	%f2, 1(%a3)
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 2
	flw	%f2, 2(%a0)
	lw	%a0, 5(%v0)
	flw	%f3, 2(%a0)
	fsub	%f2, %f2, %f3
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.18806
	beqi	%a0, 2, bnei_else.18807
	j	solver_second.2806
bnei_else.18807:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	flw	%f4, 0(%v0)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%v1)
	flw	%f6, 1(%v0)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%v1)
	flw	%f7, 2(%v0)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 465(%zero)
	fblt	%f5, %f3, fbgt_else.18808
	addi	%v0, %zero, 0
	j	fbgt_cont.18809
fbgt_else.18808:
	addi	%v0, %zero, 1
fbgt_cont.18809:
	beqi	%v0, 0, bnei_else.18810
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18810:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18806:
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a3, 4(%sp)
	sw	%a2, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.18811
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18811:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.18812
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.18812:
	flw	%f0, 1(%sp)
	flw	%f1, 0(%sp)
	flw	%f2, 2(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.18813
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.18813:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect_fast.2816:
	flw	%f3, 0(%a0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a0)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%v1)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 1(%a1)
	fblt	%f6, %f7, fbgt_else.18814
	addi	%a1, %zero, 0
	j	fbgt_cont.18815
fbgt_else.18814:
	addi	%a1, %zero, 1
fbgt_cont.18815:
	beqi	%a1, 0, bnei_else.18816
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.18818
	addi	%a1, %zero, 0
	j	fbgt_cont.18819
fbgt_else.18818:
	addi	%a1, %zero, 1
fbgt_cont.18819:
	beqi	%a1, 0, bnei_else.18820
	flw	%f6, 465(%zero)
	fbne	%f4, %f6, fbeq_else.18822
	addi	%a1, %zero, 1
	j	fbeq_cont.18823
fbeq_else.18822:
	addi	%a1, %zero, 0
fbeq_cont.18823:
	beqi	%a1, 0, bnei_else.18824
	addi	%a1, %zero, 0
	j	bnei_cont.18825
bnei_else.18824:
	addi	%a1, %zero, 1
bnei_cont.18825:
	j	bnei_cont.18821
bnei_else.18820:
	addi	%a1, %zero, 0
bnei_cont.18821:
	j	bnei_cont.18817
bnei_else.18816:
	addi	%a1, %zero, 0
bnei_cont.18817:
	beqi	%a1, 0, bnei_else.18826
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18826:
	flw	%f3, 2(%a0)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a0)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%v1)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%a1, 4(%v0)
	flw	%f8, 0(%a1)
	fblt	%f7, %f8, fbgt_else.18827
	addi	%a1, %zero, 0
	j	fbgt_cont.18828
fbgt_else.18827:
	addi	%a1, %zero, 1
fbgt_cont.18828:
	beqi	%a1, 0, bnei_else.18829
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.18831
	addi	%v1, %zero, 0
	j	fbgt_cont.18832
fbgt_else.18831:
	addi	%v1, %zero, 1
fbgt_cont.18832:
	beqi	%v1, 0, bnei_else.18833
	flw	%f7, 465(%zero)
	fbne	%f4, %f7, fbeq_else.18835
	addi	%v1, %zero, 1
	j	fbeq_cont.18836
fbeq_else.18835:
	addi	%v1, %zero, 0
fbeq_cont.18836:
	beqi	%v1, 0, bnei_else.18837
	addi	%v1, %zero, 0
	j	bnei_cont.18838
bnei_else.18837:
	addi	%v1, %zero, 1
bnei_cont.18838:
	j	bnei_cont.18834
bnei_else.18833:
	addi	%v1, %zero, 0
bnei_cont.18834:
	j	bnei_cont.18830
bnei_else.18829:
	addi	%v1, %zero, 0
bnei_cont.18830:
	beqi	%v1, 0, bnei_else.18839
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.18839:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.18840
	addi	%v1, %zero, 0
	j	fbgt_cont.18841
fbgt_else.18840:
	addi	%v1, %zero, 1
fbgt_cont.18841:
	beqi	%v1, 0, bnei_else.18842
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.18844
	addi	%v0, %zero, 0
	j	fbgt_cont.18845
fbgt_else.18844:
	addi	%v0, %zero, 1
fbgt_cont.18845:
	beqi	%v0, 0, bnei_else.18846
	flw	%f0, 465(%zero)
	fbne	%f3, %f0, fbeq_else.18848
	addi	%v0, %zero, 1
	j	fbeq_cont.18849
fbeq_else.18848:
	addi	%v0, %zero, 0
fbeq_cont.18849:
	beqi	%v0, 0, bnei_else.18850
	addi	%v0, %zero, 0
	j	bnei_cont.18851
bnei_else.18850:
	addi	%v0, %zero, 1
bnei_cont.18851:
	j	bnei_cont.18847
bnei_else.18846:
	addi	%v0, %zero, 0
bnei_cont.18847:
	j	bnei_cont.18843
bnei_else.18842:
	addi	%v0, %zero, 0
bnei_cont.18843:
	beqi	%v0, 0, bnei_else.18852
	addi	%v0, %zero, 135
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.18852:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2829:
	flw	%f3, 0(%v1)
	flw	%f4, 465(%zero)
	fbne	%f3, %f4, fbeq_else.18853
	addi	%a0, %zero, 1
	j	fbeq_cont.18854
fbeq_else.18853:
	addi	%a0, %zero, 0
fbeq_cont.18854:
	beqi	%a0, 0, bnei_else.18855
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18855:
	flw	%f5, 1(%v1)
	fmul	%f5, %f5, %f0
	flw	%f6, 2(%v1)
	fmul	%f6, %f6, %f1
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%v1)
	fmul	%f6, %f6, %f2
	fadd	%f5, %f5, %f6
	sw	%v1, 0(%sp)
	fsw	%f4, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f5, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	quadratic.2793
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.18856
	j	bnei_cont.18857
bnei_else.18856:
	flw	%f1, 469(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.18857:
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 2(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 1(%sp)
	fblt	%f2, %f0, fbgt_else.18858
	addi	%v1, %zero, 0
	j	fbgt_cont.18859
fbgt_else.18858:
	addi	%v1, %zero, 1
fbgt_cont.18859:
	beqi	%v1, 0, bnei_else.18860
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.18861
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.18862
bnei_else.18861:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.18862:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18860:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2846:
	flw	%f3, 0(%v1)
	flw	%f4, 465(%zero)
	fbne	%f3, %f4, fbeq_else.18863
	addi	%a1, %zero, 1
	j	fbeq_cont.18864
fbeq_else.18863:
	addi	%a1, %zero, 0
fbeq_cont.18864:
	beqi	%a1, 0, bnei_else.18865
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18865:
	flw	%f5, 1(%v1)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%v1)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a0)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.18866
	addi	%a0, %zero, 0
	j	fbgt_cont.18867
fbgt_else.18866:
	addi	%a0, %zero, 1
fbgt_cont.18867:
	beqi	%a0, 0, bnei_else.18868
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.18869
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.18870
bnei_else.18869:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.18870:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18868:
	addi	%v0, %zero, 0
	jr	%ra
setup_rect_table.2856:
	addi	%a0, %zero, 6
	flw	%f0, 465(%zero)
	sw	%v1, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%sp)
	fbne	%f0, %f1, fbeq_else.18871
	addi	%a0, %zero, 1
	j	fbeq_cont.18872
fbeq_else.18871:
	addi	%a0, %zero, 0
fbeq_cont.18872:
	beqi	%a0, 0, bnei_else.18873
	fsw	%f1, 1(%v0)
	j	bnei_cont.18874
bnei_else.18873:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.18875
	addi	%a2, %zero, 0
	j	fbgt_cont.18876
fbgt_else.18875:
	addi	%a2, %zero, 1
fbgt_cont.18876:
	beqi	%a1, 0, bnei_else.18877
	beqi	%a2, 0, bnei_else.18879
	addi	%a1, %zero, 0
	j	bnei_cont.18880
bnei_else.18879:
	addi	%a1, %zero, 1
bnei_cont.18880:
	j	bnei_cont.18878
bnei_else.18877:
	add	%a1, %zero, %a2
bnei_cont.18878:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.18881
	j	bnei_cont.18882
bnei_else.18881:
	fneg	%f2, %f2
bnei_cont.18882:
	fsw	%f2, 0(%v0)
	flw	%f2, 469(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.18874:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.18883
	addi	%a0, %zero, 1
	j	fbeq_cont.18884
fbeq_else.18883:
	addi	%a0, %zero, 0
fbeq_cont.18884:
	beqi	%a0, 0, bnei_else.18885
	fsw	%f1, 3(%v0)
	j	bnei_cont.18886
bnei_else.18885:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.18887
	addi	%a2, %zero, 0
	j	fbgt_cont.18888
fbgt_else.18887:
	addi	%a2, %zero, 1
fbgt_cont.18888:
	beqi	%a1, 0, bnei_else.18889
	beqi	%a2, 0, bnei_else.18891
	addi	%a1, %zero, 0
	j	bnei_cont.18892
bnei_else.18891:
	addi	%a1, %zero, 1
bnei_cont.18892:
	j	bnei_cont.18890
bnei_else.18889:
	add	%a1, %zero, %a2
bnei_cont.18890:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.18893
	j	bnei_cont.18894
bnei_else.18893:
	fneg	%f2, %f2
bnei_cont.18894:
	fsw	%f2, 2(%v0)
	flw	%f2, 469(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.18886:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.18895
	addi	%v1, %zero, 1
	j	fbeq_cont.18896
fbeq_else.18895:
	addi	%v1, %zero, 0
fbeq_cont.18896:
	beqi	%v1, 0, bnei_else.18897
	fsw	%f1, 5(%v0)
	j	bnei_cont.18898
bnei_else.18897:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.18899
	addi	%a1, %zero, 0
	j	fbgt_cont.18900
fbgt_else.18899:
	addi	%a1, %zero, 1
fbgt_cont.18900:
	beqi	%a0, 0, bnei_else.18901
	beqi	%a1, 0, bnei_else.18903
	addi	%a0, %zero, 0
	j	bnei_cont.18904
bnei_else.18903:
	addi	%a0, %zero, 1
bnei_cont.18904:
	j	bnei_cont.18902
bnei_else.18901:
	add	%a0, %zero, %a1
bnei_cont.18902:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.18905
	j	bnei_cont.18906
bnei_else.18905:
	fneg	%f1, %f1
bnei_cont.18906:
	fsw	%f1, 4(%v0)
	flw	%f1, 469(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.18898:
	jr	%ra
setup_surface_table.2859:
	addi	%a0, %zero, 4
	flw	%f0, 465(%zero)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 1(%sp)
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
	flw	%f1, 0(%sp)
	fblt	%f1, %f0, fbgt_else.18907
	addi	%v1, %zero, 0
	j	fbgt_cont.18908
fbgt_else.18907:
	addi	%v1, %zero, 1
fbgt_cont.18908:
	beqi	%v1, 0, bnei_else.18909
	flw	%f1, 464(%zero)
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
	j	bnei_cont.18910
bnei_else.18909:
	fsw	%f1, 0(%v0)
bnei_cont.18910:
	jr	%ra
setup_second_table.2862:
	addi	%a0, %zero, 5
	flw	%f0, 465(%zero)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2793
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	flw	%f2, 6(%sp)
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	flw	%f4, 5(%sp)
	fmul	%f3, %f4, %f3
	fneg	%f3, %f3
	lw	%v1, 4(%v0)
	flw	%f5, 2(%v1)
	flw	%f6, 4(%sp)
	fmul	%f5, %f6, %f5
	fneg	%f5, %f5
	lw	%v1, 3(%sp)
	fsw	%f0, 0(%v1)
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.18911
	lw	%a0, 9(%v0)
	flw	%f7, 1(%a0)
	fmul	%f7, %f6, %f7
	lw	%a0, 9(%v0)
	flw	%f8, 2(%a0)
	fmul	%f8, %f4, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 468(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f1, %f1, %f7
	fsw	%f1, 1(%v1)
	lw	%a0, 9(%v0)
	flw	%f1, 0(%a0)
	fmul	%f1, %f6, %f1
	lw	%a0, 9(%v0)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fadd	%f1, %f1, %f6
	fmul	%f1, %f1, %f8
	fsub	%f1, %f3, %f1
	fsw	%f1, 2(%v1)
	lw	%a0, 9(%v0)
	flw	%f1, 0(%a0)
	fmul	%f1, %f4, %f1
	lw	%v0, 9(%v0)
	flw	%f3, 1(%v0)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	fmul	%f1, %f1, %f8
	fsub	%f1, %f5, %f1
	fsw	%f1, 3(%v1)
	j	bnei_cont.18912
bnei_else.18911:
	fsw	%f1, 1(%v1)
	fsw	%f3, 2(%v1)
	fsw	%f5, 3(%v1)
bnei_cont.18912:
	flw	%f1, 0(%sp)
	fbne	%f0, %f1, fbeq_else.18913
	addi	%v0, %zero, 1
	j	fbeq_cont.18914
fbeq_else.18913:
	addi	%v0, %zero, 0
fbeq_cont.18914:
	beqi	%v0, 0, bnei_else.18915
	j	bnei_cont.18916
bnei_else.18915:
	flw	%f1, 469(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v1)
bnei_cont.18916:
	add	%v0, %zero, %v1
	jr	%ra
iter_setup_dirvec_constants.2865:
	blti	%v1, 0, bgti_else.18917
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.18918
	beqi	%a3, 2, bnei_else.18920
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2862
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.18921
bnei_else.18920:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_surface_table.2859
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.18921:
	j	bnei_cont.18919
bnei_else.18918:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_rect_table.2856
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.18919:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.18922
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.18923
	beqi	%a3, 2, bnei_else.18925
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2862
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.18926
bnei_else.18925:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2859
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.18926:
	j	bnei_cont.18924
bnei_else.18923:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2856
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.18924:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2865
bgti_else.18922:
	jr	%ra
bgti_else.18917:
	jr	%ra
setup_startp_constants.2870:
	blti	%v1, 0, bgti_else.18929
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
	beqi	%a2, 2, bnei_else.18930
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.18932
	j	bgt_cont.18933
bgt_else.18932:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	quadratic.2793
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	beqi	%v0, 3, bnei_else.18934
	j	bnei_cont.18935
bnei_else.18934:
	flw	%f1, 469(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.18935:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.18933:
	j	bnei_cont.18931
bnei_else.18930:
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
bnei_cont.18931:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2870
bgti_else.18929:
	jr	%ra
is_outside.2890:
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
	beqi	%v1, 1, bnei_else.18937
	beqi	%v1, 2, bnei_else.18938
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2793
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.18939
	j	bnei_cont.18940
bnei_else.18939:
	flw	%f1, 469(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.18940:
	lw	%v0, 6(%v0)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.18941
	addi	%v1, %zero, 0
	j	fbgt_cont.18942
fbgt_else.18941:
	addi	%v1, %zero, 1
fbgt_cont.18942:
	beqi	%v0, 0, bnei_else.18943
	beqi	%v1, 0, bnei_else.18945
	addi	%v0, %zero, 0
	j	bnei_cont.18946
bnei_else.18945:
	addi	%v0, %zero, 1
bnei_cont.18946:
	j	bnei_cont.18944
bnei_else.18943:
	add	%v0, %zero, %v1
bnei_cont.18944:
	beqi	%v0, 0, bnei_else.18947
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18947:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18938:
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.18948
	addi	%v1, %zero, 0
	j	fbgt_cont.18949
fbgt_else.18948:
	addi	%v1, %zero, 1
fbgt_cont.18949:
	beqi	%v0, 0, bnei_else.18950
	beqi	%v1, 0, bnei_else.18952
	addi	%v0, %zero, 0
	j	bnei_cont.18953
bnei_else.18952:
	addi	%v0, %zero, 1
bnei_cont.18953:
	j	bnei_cont.18951
bnei_else.18950:
	add	%v0, %zero, %v1
bnei_cont.18951:
	beqi	%v0, 0, bnei_else.18954
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18954:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18937:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.18955
	addi	%v1, %zero, 0
	j	fbgt_cont.18956
fbgt_else.18955:
	addi	%v1, %zero, 1
fbgt_cont.18956:
	beqi	%v1, 0, bnei_else.18957
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.18959
	addi	%v1, %zero, 0
	j	fbgt_cont.18960
fbgt_else.18959:
	addi	%v1, %zero, 1
fbgt_cont.18960:
	beqi	%v1, 0, bnei_else.18961
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.18963
	addi	%v1, %zero, 0
	j	fbgt_cont.18964
fbgt_else.18963:
	addi	%v1, %zero, 1
fbgt_cont.18964:
	j	bnei_cont.18962
bnei_else.18961:
	addi	%v1, %zero, 0
bnei_cont.18962:
	j	bnei_cont.18958
bnei_else.18957:
	addi	%v1, %zero, 0
bnei_cont.18958:
	beqi	%v1, 0, bnei_else.18965
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.18965:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.18966
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.18966:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2895:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.18967
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
	beqi	%a1, 1, bnei_else.18968
	beqi	%a1, 2, bnei_else.18970
	sw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2793
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.18972
	j	bnei_cont.18973
bnei_else.18972:
	flw	%f1, 469(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.18973:
	lw	%v0, 6(%v0)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.18974
	addi	%v1, %zero, 0
	j	fbgt_cont.18975
fbgt_else.18974:
	addi	%v1, %zero, 1
fbgt_cont.18975:
	beqi	%v0, 0, bnei_else.18976
	beqi	%v1, 0, bnei_else.18978
	addi	%v0, %zero, 0
	j	bnei_cont.18979
bnei_else.18978:
	addi	%v0, %zero, 1
bnei_cont.18979:
	j	bnei_cont.18977
bnei_else.18976:
	add	%v0, %zero, %v1
bnei_cont.18977:
	beqi	%v0, 0, bnei_else.18980
	addi	%v0, %zero, 0
	j	bnei_cont.18981
bnei_else.18980:
	addi	%v0, %zero, 1
bnei_cont.18981:
	j	bnei_cont.18971
bnei_else.18970:
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
	flw	%f4, 465(%zero)
	fblt	%f3, %f4, fbgt_else.18982
	addi	%a1, %zero, 0
	j	fbgt_cont.18983
fbgt_else.18982:
	addi	%a1, %zero, 1
fbgt_cont.18983:
	beqi	%a0, 0, bnei_else.18984
	beqi	%a1, 0, bnei_else.18986
	addi	%a0, %zero, 0
	j	bnei_cont.18987
bnei_else.18986:
	addi	%a0, %zero, 1
bnei_cont.18987:
	j	bnei_cont.18985
bnei_else.18984:
	add	%a0, %zero, %a1
bnei_cont.18985:
	beqi	%a0, 0, bnei_else.18988
	addi	%v0, %zero, 0
	j	bnei_cont.18989
bnei_else.18988:
	addi	%v0, %zero, 1
bnei_cont.18989:
bnei_cont.18971:
	j	bnei_cont.18969
bnei_else.18968:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.18990
	addi	%a1, %zero, 0
	j	fbgt_cont.18991
fbgt_else.18990:
	addi	%a1, %zero, 1
fbgt_cont.18991:
	beqi	%a1, 0, bnei_else.18992
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.18994
	addi	%a1, %zero, 0
	j	fbgt_cont.18995
fbgt_else.18994:
	addi	%a1, %zero, 1
fbgt_cont.18995:
	beqi	%a1, 0, bnei_else.18996
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.18998
	addi	%a1, %zero, 0
	j	fbgt_cont.18999
fbgt_else.18998:
	addi	%a1, %zero, 1
fbgt_cont.18999:
	j	bnei_cont.18997
bnei_else.18996:
	addi	%a1, %zero, 0
bnei_cont.18997:
	j	bnei_cont.18993
bnei_else.18992:
	addi	%a1, %zero, 0
bnei_cont.18993:
	beqi	%a1, 0, bnei_else.19000
	lw	%a0, 6(%a0)
	add	%v0, %zero, %a0
	j	bnei_cont.19001
bnei_else.19000:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.19002
	addi	%v0, %zero, 0
	j	bnei_cont.19003
bnei_else.19002:
	addi	%v0, %zero, 1
bnei_cont.19003:
bnei_cont.19001:
bnei_cont.18969:
	beqi	%v0, 0, bnei_else.19004
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19004:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19005
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
	jal	is_outside.2890
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19006
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19006:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2895
bnei_else.19005:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.18967:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2901:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19007
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 138
	flw	%f0, 0(%a2)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f1, %f0, %f1
	addi	%a2, %zero, 1
	addi	%a3, %zero, 138
	flw	%f2, 1(%a3)
	lw	%a3, 5(%a1)
	flw	%f3, 1(%a3)
	fsub	%f3, %f2, %f3
	addi	%a3, %zero, 138
	flw	%f4, 2(%a3)
	lw	%a3, 5(%a1)
	flw	%f5, 2(%a3)
	fsub	%f5, %f4, %f5
	addi	%a3, %zero, 187
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a3, 1(%a1)
	sw	%a2, 0(%sp)
	fsw	%f4, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a1, 6(%sp)
	beqi	%a3, 1, bnei_else.19008
	beqi	%a3, 2, bnei_else.19010
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast.2829
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19011
bnei_else.19010:
	flw	%f6, 0(%a0)
	flw	%f7, 465(%zero)
	fblt	%f6, %f7, fbgt_else.19012
	addi	%a3, %zero, 0
	j	fbgt_cont.19013
fbgt_else.19012:
	addi	%a3, %zero, 1
fbgt_cont.19013:
	beqi	%a3, 0, bnei_else.19014
	flw	%f6, 1(%a0)
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)
	fmul	%f3, %f6, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)
	fmul	%f3, %f3, %f5
	fadd	%f1, %f1, %f3
	addi	%a0, %zero, 135
	fsw	%f1, 0(%a0)
	addi	%v0, %zero, 1
	j	bnei_cont.19015
bnei_else.19014:
	addi	%v0, %zero, 0
bnei_cont.19015:
bnei_cont.19011:
	j	bnei_cont.19009
bnei_else.19008:
	addi	%a3, %zero, 184
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19009:
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	beqi	%v0, 0, bnei_else.19016
	flw	%f1, 459(%zero)
	fblt	%f0, %f1, fbgt_else.19018
	addi	%v0, %zero, 0
	j	fbgt_cont.19019
fbgt_else.19018:
	addi	%v0, %zero, 1
fbgt_cont.19019:
	j	bnei_cont.19017
bnei_else.19016:
	addi	%v0, %zero, 0
bnei_cont.19017:
	beqi	%v0, 0, bnei_else.19020
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	flw	%f2, 3(%sp)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	flw	%f3, 2(%sp)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 78
	flw	%f3, 2(%v0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%sp)
	fadd	%f0, %f0, %f3
	lw	%v1, 4(%sp)
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19021
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	fsw	%f0, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f1, 9(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	is_outside.2890
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.19023
	addi	%v0, %zero, 0
	j	bnei_cont.19024
bnei_else.19023:
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2895
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19024:
	j	bnei_cont.19022
bnei_else.19021:
	addi	%v0, %zero, 1
bnei_cont.19022:
	beqi	%v0, 0, bnei_else.19025
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19025:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2901
bnei_else.19020:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19026
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2901
bnei_else.19026:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19007:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2904:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19027
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19028
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19028:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19029
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19030
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19030:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19031
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19032
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19032:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19033
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19034
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19034:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2904
bnei_else.19033:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19031:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19029:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19027:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.19035
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.19036
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	addi	%t0, %zero, 138
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	addi	%t0, %zero, 138
	flw	%f1, 1(%t0)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	addi	%t0, %zero, 138
	flw	%f2, 2(%t0)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	addi	%t0, %zero, 187
	add	%at, %t0, %a2
	lw	%a2, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.19038
	beqi	%t0, 2, bnei_else.19040
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2829
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19041
bnei_else.19040:
	flw	%f3, 0(%a2)
	flw	%f4, 465(%zero)
	fblt	%f3, %f4, fbgt_else.19042
	addi	%a3, %zero, 0
	j	fbgt_cont.19043
fbgt_else.19042:
	addi	%a3, %zero, 1
fbgt_cont.19043:
	beqi	%a3, 0, bnei_else.19044
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a2, %zero, 135
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.19045
bnei_else.19044:
	addi	%v0, %zero, 0
bnei_cont.19045:
bnei_cont.19041:
	j	bnei_cont.19039
bnei_else.19038:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19039:
	beqi	%v0, 0, bnei_else.19046
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.19048
	addi	%v0, %zero, 0
	j	fbgt_cont.19049
fbgt_else.19048:
	addi	%v0, %zero, 1
fbgt_cont.19049:
	beqi	%v0, 0, bnei_else.19050
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19052
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19054
	addi	%v0, %zero, 1
	j	bnei_cont.19055
bnei_else.19054:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19056
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19058
	addi	%v0, %zero, 1
	j	bnei_cont.19059
bnei_else.19058:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19060
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19062
	addi	%v0, %zero, 1
	j	bnei_cont.19063
bnei_else.19062:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2904
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19063:
	j	bnei_cont.19061
bnei_else.19060:
	addi	%v0, %zero, 0
bnei_cont.19061:
bnei_cont.19059:
	j	bnei_cont.19057
bnei_else.19056:
	addi	%v0, %zero, 0
bnei_cont.19057:
bnei_cont.19055:
	j	bnei_cont.19053
bnei_else.19052:
	addi	%v0, %zero, 0
bnei_cont.19053:
	beqi	%v0, 0, bnei_else.19064
	addi	%v0, %zero, 1
	j	bnei_cont.19065
bnei_else.19064:
	addi	%v0, %zero, 0
bnei_cont.19065:
	j	bnei_cont.19051
bnei_else.19050:
	addi	%v0, %zero, 0
bnei_cont.19051:
	j	bnei_cont.19047
bnei_else.19046:
	addi	%v0, %zero, 0
bnei_cont.19047:
	j	bnei_cont.19037
bnei_else.19036:
	addi	%v0, %zero, 1
bnei_cont.19037:
	beqi	%v0, 0, bnei_else.19066
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19067
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19069
	addi	%v0, %zero, 1
	j	bnei_cont.19070
bnei_else.19069:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19071
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19073
	addi	%v0, %zero, 1
	j	bnei_cont.19074
bnei_else.19073:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19075
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2901
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19077
	addi	%v0, %zero, 1
	j	bnei_cont.19078
bnei_else.19077:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2904
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19078:
	j	bnei_cont.19076
bnei_else.19075:
	addi	%v0, %zero, 0
bnei_cont.19076:
bnei_cont.19074:
	j	bnei_cont.19072
bnei_else.19071:
	addi	%v0, %zero, 0
bnei_cont.19072:
bnei_cont.19070:
	j	bnei_cont.19068
bnei_else.19067:
	addi	%v0, %zero, 0
bnei_cont.19068:
	beqi	%v0, 0, bnei_else.19079
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19079:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2907
bnei_else.19066:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2907
bnei_else.19035:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2910:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19080
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	addi	%t0, %zero, 159
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a2)
	flw	%f1, 0(%t0)
	fsub	%f1, %f0, %f1
	addi	%t0, %zero, 1
	addi	%t1, %zero, 159
	flw	%f2, 1(%t1)
	lw	%t1, 5(%a2)
	flw	%f3, 1(%t1)
	fsub	%f3, %f2, %f3
	addi	%t1, %zero, 2
	addi	%t2, %zero, 159
	flw	%f4, 2(%t2)
	lw	%t2, 5(%a2)
	flw	%f5, 2(%t2)
	fsub	%f5, %f4, %f5
	lw	%t2, 1(%a2)
	sw	%a1, 0(%sp)
	sw	%t0, 1(%sp)
	fsw	%f4, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a2, 8(%sp)
	beqi	%t2, 1, bnei_else.19081
	beqi	%t2, 2, bnei_else.19083
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_second.2806
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19084
bnei_else.19083:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_surface.2787
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19084:
	j	bnei_cont.19082
bnei_else.19081:
	fsw	%f1, 9(%sp)
	fsw	%f5, 10(%sp)
	fsw	%f3, 11(%sp)
	sw	%a3, 12(%sp)
	sw	%t1, 13(%sp)
	addi	%a1, %t0, 0
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a2, %t1, 0
	addi	%a0, %a3, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19085
	addi	%v0, %zero, 1
	j	bnei_cont.19086
bnei_else.19085:
	flw	%f0, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 13(%sp)
	lw	%a2, 12(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19087
	addi	%v0, %zero, 2
	j	bnei_cont.19088
bnei_else.19087:
	flw	%f0, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 11(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	lw	%a2, 1(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19089
	addi	%v0, %zero, 3
	j	bnei_cont.19090
bnei_else.19089:
	addi	%v0, %zero, 0
bnei_cont.19090:
bnei_cont.19088:
bnei_cont.19086:
bnei_cont.19082:
	beqi	%v0, 0, bnei_else.19091
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.19092
	addi	%v1, %zero, 0
	j	fbgt_cont.19093
fbgt_else.19092:
	addi	%v1, %zero, 1
fbgt_cont.19093:
	beqi	%v1, 0, bnei_else.19094
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.19096
	addi	%v1, %zero, 0
	j	fbgt_cont.19097
fbgt_else.19096:
	addi	%v1, %zero, 1
fbgt_cont.19097:
	beqi	%v1, 0, bnei_else.19098
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	lw	%a0, 5(%sp)
	flw	%f1, 0(%a0)
	fmul	%f1, %f1, %f0
	flw	%f2, 4(%sp)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%a0)
	fmul	%f2, %f2, %f0
	flw	%f3, 3(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%a0)
	fmul	%f3, %f3, %f0
	flw	%f4, 2(%sp)
	fadd	%f3, %f3, %f4
	lw	%v1, 6(%sp)
	lw	%a1, 0(%v1)
	sw	%v0, 14(%sp)
	fsw	%f3, 15(%sp)
	fsw	%f2, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f0, 18(%sp)
	beqi	%a1, -1, bnei_else.19100
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	is_outside.2890
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_else.19102
	addi	%v0, %zero, 0
	j	bnei_cont.19103
bnei_else.19102:
	flw	%f0, 17(%sp)
	flw	%f1, 16(%sp)
	flw	%f2, 15(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	check_all_inside.2895
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
bnei_cont.19103:
	j	bnei_cont.19101
bnei_else.19100:
	addi	%v0, %zero, 1
bnei_cont.19101:
	beqi	%v0, 0, bnei_else.19104
	addi	%v0, %zero, 137
	flw	%f0, 18(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 17(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 16(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 15(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 14(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19105
bnei_else.19104:
bnei_cont.19105:
	j	bnei_cont.19099
bnei_else.19098:
bnei_cont.19099:
	j	bnei_cont.19095
bnei_else.19094:
bnei_cont.19095:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2910
bnei_else.19091:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19106
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2910
bnei_else.19106:
	jr	%ra
bnei_else.19080:
	jr	%ra
solve_one_or_network.2914:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19109
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2910
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19110
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2910
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19111
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2910
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19112
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2910
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19113
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2910
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19114
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element.2910
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19115
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2910
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19116
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2914
bnei_else.19116:
	jr	%ra
bnei_else.19115:
	jr	%ra
bnei_else.19114:
	jr	%ra
bnei_else.19113:
	jr	%ra
bnei_else.19112:
	jr	%ra
bnei_else.19111:
	jr	%ra
bnei_else.19110:
	jr	%ra
bnei_else.19109:
	jr	%ra
trace_or_matrix.2918:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19125
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19126
	addi	%t0, %zero, 12
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	addi	%t0, %zero, 159
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	addi	%t0, %zero, 1
	addi	%t1, %zero, 159
	flw	%f1, 1(%t1)
	lw	%t1, 5(%a3)
	flw	%f2, 1(%t1)
	fsub	%f1, %f1, %f2
	addi	%t1, %zero, 2
	addi	%t2, %zero, 159
	flw	%f2, 2(%t2)
	lw	%t2, 5(%a3)
	flw	%f3, 2(%t2)
	fsub	%f2, %f2, %f3
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.19128
	beqi	%t2, 2, bnei_else.19130
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2806
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19131
bnei_else.19130:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_surface.2787
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19131:
	j	bnei_cont.19129
bnei_else.19128:
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%a1, %t0, 0
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	addi	%a0, %a2, 0
	addi	%a2, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19132
	addi	%v0, %zero, 1
	j	bnei_cont.19133
bnei_else.19132:
	flw	%f0, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 5(%sp)
	lw	%v0, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	lw	%a1, 8(%sp)
	lw	%a2, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19134
	addi	%v0, %zero, 2
	j	bnei_cont.19135
bnei_else.19134:
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 7(%sp)
	lw	%v0, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 8(%sp)
	lw	%a1, 1(%sp)
	lw	%a2, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solver_rect_surface.2772
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19136
	addi	%v0, %zero, 3
	j	bnei_cont.19137
bnei_else.19136:
	addi	%v0, %zero, 0
bnei_cont.19137:
bnei_cont.19135:
bnei_cont.19133:
bnei_cont.19129:
	beqi	%v0, 0, bnei_else.19138
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19140
	addi	%v0, %zero, 0
	j	fbgt_cont.19141
fbgt_else.19140:
	addi	%v0, %zero, 1
fbgt_cont.19141:
	beqi	%v0, 0, bnei_else.19142
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19144
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19146
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19148
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19150
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19152
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19154
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19156
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2914
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19157
bnei_else.19156:
bnei_cont.19157:
	j	bnei_cont.19155
bnei_else.19154:
bnei_cont.19155:
	j	bnei_cont.19153
bnei_else.19152:
bnei_cont.19153:
	j	bnei_cont.19151
bnei_else.19150:
bnei_cont.19151:
	j	bnei_cont.19149
bnei_else.19148:
bnei_cont.19149:
	j	bnei_cont.19147
bnei_else.19146:
bnei_cont.19147:
	j	bnei_cont.19145
bnei_else.19144:
bnei_cont.19145:
	j	bnei_cont.19143
bnei_else.19142:
bnei_cont.19143:
	j	bnei_cont.19139
bnei_else.19138:
bnei_cont.19139:
	j	bnei_cont.19127
bnei_else.19126:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19158
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19160
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19162
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19164
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19166
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19168
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19170
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2910
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2914
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19171
bnei_else.19170:
bnei_cont.19171:
	j	bnei_cont.19169
bnei_else.19168:
bnei_cont.19169:
	j	bnei_cont.19167
bnei_else.19166:
bnei_cont.19167:
	j	bnei_cont.19165
bnei_else.19164:
bnei_cont.19165:
	j	bnei_cont.19163
bnei_else.19162:
bnei_cont.19163:
	j	bnei_cont.19161
bnei_else.19160:
bnei_cont.19161:
	j	bnei_cont.19159
bnei_else.19158:
bnei_cont.19159:
bnei_cont.19127:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19172
	sw	%v0, 11(%sp)
	beqi	%a1, 99, bnei_else.19173
	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 12(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solver.2812
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.19175
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19177
	addi	%v0, %zero, 0
	j	fbgt_cont.19178
fbgt_else.19177:
	addi	%v0, %zero, 1
fbgt_cont.19178:
	beqi	%v0, 0, bnei_else.19179
	lw	%v0, 12(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19181
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19183
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19185
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19187
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19189
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19191
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2914
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19192
bnei_else.19191:
bnei_cont.19192:
	j	bnei_cont.19190
bnei_else.19189:
bnei_cont.19190:
	j	bnei_cont.19188
bnei_else.19187:
bnei_cont.19188:
	j	bnei_cont.19186
bnei_else.19185:
bnei_cont.19186:
	j	bnei_cont.19184
bnei_else.19183:
bnei_cont.19184:
	j	bnei_cont.19182
bnei_else.19181:
bnei_cont.19182:
	j	bnei_cont.19180
bnei_else.19179:
bnei_cont.19180:
	j	bnei_cont.19176
bnei_else.19175:
bnei_cont.19176:
	j	bnei_cont.19174
bnei_else.19173:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19193
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 12(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19195
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19197
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19199
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19201
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19203
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2910
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2914
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19204
bnei_else.19203:
bnei_cont.19204:
	j	bnei_cont.19202
bnei_else.19201:
bnei_cont.19202:
	j	bnei_cont.19200
bnei_else.19199:
bnei_cont.19200:
	j	bnei_cont.19198
bnei_else.19197:
bnei_cont.19198:
	j	bnei_cont.19196
bnei_else.19195:
bnei_cont.19196:
	j	bnei_cont.19194
bnei_else.19193:
bnei_cont.19194:
bnei_cont.19174:
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2918
bnei_else.19172:
	jr	%ra
bnei_else.19125:
	jr	%ra
solve_each_element_fast.2924:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.19207
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	addi	%t1, %zero, 1
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a2
	lw	%t2, 0(%at)
	lw	%t3, 1(%a3)
	sw	%a2, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a3, 6(%sp)
	beqi	%t3, 1, bnei_else.19208
	beqi	%t3, 2, bnei_else.19210
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2846
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19211
bnei_else.19210:
	flw	%f0, 0(%t2)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19212
	addi	%t2, %zero, 0
	j	fbgt_cont.19213
fbgt_else.19212:
	addi	%t2, %zero, 1
fbgt_cont.19213:
	beqi	%t2, 0, bnei_else.19214
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%t0, %zero, 135
	fsw	%f0, 0(%t0)
	addi	%v0, %zero, 1
	j	bnei_cont.19215
bnei_else.19214:
	addi	%v0, %zero, 0
bnei_cont.19215:
bnei_cont.19211:
	j	bnei_cont.19209
bnei_else.19208:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19209:
	beqi	%v0, 0, bnei_else.19216
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.19217
	addi	%v1, %zero, 0
	j	fbgt_cont.19218
fbgt_else.19217:
	addi	%v1, %zero, 1
fbgt_cont.19218:
	beqi	%v1, 0, bnei_else.19219
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.19221
	addi	%v1, %zero, 0
	j	fbgt_cont.19222
fbgt_else.19221:
	addi	%v1, %zero, 1
fbgt_cont.19222:
	beqi	%v1, 0, bnei_else.19223
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	lw	%v1, 2(%sp)
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
	lw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	fsw	%f1, 10(%sp)
	fsw	%f0, 11(%sp)
	beqi	%a0, -1, bnei_else.19225
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	is_outside.2890
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.19227
	addi	%v0, %zero, 0
	j	bnei_cont.19228
bnei_else.19227:
	flw	%f0, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	check_all_inside.2895
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19228:
	j	bnei_cont.19226
bnei_else.19225:
	addi	%v0, %zero, 1
bnei_cont.19226:
	beqi	%v0, 0, bnei_else.19229
	addi	%v0, %zero, 137
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 7(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19230
bnei_else.19229:
bnei_cont.19230:
	j	bnei_cont.19224
bnei_else.19223:
bnei_cont.19224:
	j	bnei_cont.19220
bnei_else.19219:
bnei_cont.19220:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2924
bnei_else.19216:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19231
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2924
bnei_else.19231:
	jr	%ra
bnei_else.19207:
	jr	%ra
solve_one_or_network_fast.2928:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19234
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19235
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19236
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19237
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19238
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19239
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19240
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19241
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2928
bnei_else.19241:
	jr	%ra
bnei_else.19240:
	jr	%ra
bnei_else.19239:
	jr	%ra
bnei_else.19238:
	jr	%ra
bnei_else.19237:
	jr	%ra
bnei_else.19236:
	jr	%ra
bnei_else.19235:
	jr	%ra
bnei_else.19234:
	jr	%ra
trace_or_matrix_fast.2932:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19250
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19251
	addi	%t0, %zero, 12
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.19253
	beqi	%t2, 2, bnei_else.19255
	addi	%a0, %t1, 0
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2846
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19256
bnei_else.19255:
	flw	%f0, 0(%a3)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19257
	addi	%a3, %zero, 0
	j	fbgt_cont.19258
fbgt_else.19257:
	addi	%a3, %zero, 1
fbgt_cont.19258:
	beqi	%a3, 0, bnei_else.19259
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 135
	fsw	%f0, 0(%a3)
	addi	%v0, %zero, 1
	j	bnei_cont.19260
bnei_else.19259:
	addi	%v0, %zero, 0
bnei_cont.19260:
bnei_cont.19256:
	j	bnei_cont.19254
bnei_else.19253:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19254:
	beqi	%v0, 0, bnei_else.19261
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19263
	addi	%v0, %zero, 0
	j	fbgt_cont.19264
fbgt_else.19263:
	addi	%v0, %zero, 1
fbgt_cont.19264:
	beqi	%v0, 0, bnei_else.19265
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19267
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19269
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19271
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19273
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19275
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19277
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19279
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19280
bnei_else.19279:
bnei_cont.19280:
	j	bnei_cont.19278
bnei_else.19277:
bnei_cont.19278:
	j	bnei_cont.19276
bnei_else.19275:
bnei_cont.19276:
	j	bnei_cont.19274
bnei_else.19273:
bnei_cont.19274:
	j	bnei_cont.19272
bnei_else.19271:
bnei_cont.19272:
	j	bnei_cont.19270
bnei_else.19269:
bnei_cont.19270:
	j	bnei_cont.19268
bnei_else.19267:
bnei_cont.19268:
	j	bnei_cont.19266
bnei_else.19265:
bnei_cont.19266:
	j	bnei_cont.19262
bnei_else.19261:
bnei_cont.19262:
	j	bnei_cont.19252
bnei_else.19251:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19281
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19283
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19285
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19287
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19289
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19291
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19293
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19294
bnei_else.19293:
bnei_cont.19294:
	j	bnei_cont.19292
bnei_else.19291:
bnei_cont.19292:
	j	bnei_cont.19290
bnei_else.19289:
bnei_cont.19290:
	j	bnei_cont.19288
bnei_else.19287:
bnei_cont.19288:
	j	bnei_cont.19286
bnei_else.19285:
bnei_cont.19286:
	j	bnei_cont.19284
bnei_else.19283:
bnei_cont.19284:
	j	bnei_cont.19282
bnei_else.19281:
bnei_cont.19282:
bnei_cont.19252:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19295
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.19296
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 10(%a2)
	flw	%f0, 0(%a3)
	flw	%f1, 1(%a3)
	flw	%f2, 2(%a3)
	lw	%t0, 0(%sp)
	lw	%t1, 1(%t0)
	add	%at, %t1, %a1
	lw	%a1, 0(%at)
	lw	%t1, 1(%a2)
	sw	%a0, 6(%sp)
	beqi	%t1, 1, bnei_else.19298
	beqi	%t1, 2, bnei_else.19300
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2846
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19301
bnei_else.19300:
	flw	%f0, 0(%a1)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19302
	addi	%a1, %zero, 0
	j	fbgt_cont.19303
fbgt_else.19302:
	addi	%a1, %zero, 1
fbgt_cont.19303:
	beqi	%a1, 0, bnei_else.19304
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	addi	%a1, %zero, 135
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.19305
bnei_else.19304:
	addi	%v0, %zero, 0
bnei_cont.19305:
bnei_cont.19301:
	j	bnei_cont.19299
bnei_else.19298:
	lw	%a3, 0(%t0)
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19299:
	beqi	%v0, 0, bnei_else.19306
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19308
	addi	%v0, %zero, 0
	j	fbgt_cont.19309
fbgt_else.19308:
	addi	%v0, %zero, 1
fbgt_cont.19309:
	beqi	%v0, 0, bnei_else.19310
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19312
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19314
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19316
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19318
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19320
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19322
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19323
bnei_else.19322:
bnei_cont.19323:
	j	bnei_cont.19321
bnei_else.19320:
bnei_cont.19321:
	j	bnei_cont.19319
bnei_else.19318:
bnei_cont.19319:
	j	bnei_cont.19317
bnei_else.19316:
bnei_cont.19317:
	j	bnei_cont.19315
bnei_else.19314:
bnei_cont.19315:
	j	bnei_cont.19313
bnei_else.19312:
bnei_cont.19313:
	j	bnei_cont.19311
bnei_else.19310:
bnei_cont.19311:
	j	bnei_cont.19307
bnei_else.19306:
bnei_cont.19307:
	j	bnei_cont.19297
bnei_else.19296:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19324
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19326
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19328
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19330
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19332
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19334
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19335
bnei_else.19334:
bnei_cont.19335:
	j	bnei_cont.19333
bnei_else.19332:
bnei_cont.19333:
	j	bnei_cont.19331
bnei_else.19330:
bnei_cont.19331:
	j	bnei_cont.19329
bnei_else.19328:
bnei_cont.19329:
	j	bnei_cont.19327
bnei_else.19326:
bnei_cont.19327:
	j	bnei_cont.19325
bnei_else.19324:
bnei_cont.19325:
bnei_cont.19297:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2932
bnei_else.19295:
	jr	%ra
bnei_else.19250:
	jr	%ra
judge_intersection_fast.2936:
	addi	%v1, %zero, 0
	flw	%f0, 456(%zero)
	addi	%a0, %zero, 137
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
	lw	%a1, 0(%a0)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.19338
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	beqi	%a2, 99, bnei_else.19340
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t1, 1(%v0)
	add	%at, %t1, %a2
	lw	%a2, 0(%at)
	lw	%t1, 1(%a3)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	beqi	%t1, 1, bnei_else.19342
	beqi	%t1, 2, bnei_else.19344
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2846
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19345
bnei_else.19344:
	flw	%f0, 0(%a2)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19346
	addi	%a2, %zero, 0
	j	fbgt_cont.19347
fbgt_else.19346:
	addi	%a2, %zero, 1
fbgt_cont.19347:
	beqi	%a2, 0, bnei_else.19348
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 135
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.19349
bnei_else.19348:
	addi	%v0, %zero, 0
bnei_cont.19349:
bnei_cont.19345:
	j	bnei_cont.19343
bnei_else.19342:
	lw	%t0, 0(%v0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2816
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19343:
	beqi	%v0, 0, bnei_else.19350
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19352
	addi	%v0, %zero, 0
	j	fbgt_cont.19353
fbgt_else.19352:
	addi	%v0, %zero, 1
fbgt_cont.19353:
	beqi	%v0, 0, bnei_else.19354
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19356
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19358
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19360
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19362
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19364
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19366
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19367
bnei_else.19366:
bnei_cont.19367:
	j	bnei_cont.19365
bnei_else.19364:
bnei_cont.19365:
	j	bnei_cont.19363
bnei_else.19362:
bnei_cont.19363:
	j	bnei_cont.19361
bnei_else.19360:
bnei_cont.19361:
	j	bnei_cont.19359
bnei_else.19358:
bnei_cont.19359:
	j	bnei_cont.19357
bnei_else.19356:
bnei_cont.19357:
	j	bnei_cont.19355
bnei_else.19354:
bnei_cont.19355:
	j	bnei_cont.19351
bnei_else.19350:
bnei_cont.19351:
	j	bnei_cont.19341
bnei_else.19340:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.19368
	addi	%a3, %zero, 83
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19370
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19372
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19374
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19376
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19378
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2924
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19379
bnei_else.19378:
bnei_cont.19379:
	j	bnei_cont.19377
bnei_else.19376:
bnei_cont.19377:
	j	bnei_cont.19375
bnei_else.19374:
bnei_cont.19375:
	j	bnei_cont.19373
bnei_else.19372:
bnei_cont.19373:
	j	bnei_cont.19371
bnei_else.19370:
bnei_cont.19371:
	j	bnei_cont.19369
bnei_else.19368:
bnei_cont.19369:
bnei_cont.19341:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2932
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19339
bnei_else.19338:
bnei_cont.19339:
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.19380
	addi	%v0, %zero, 0
	j	fbgt_cont.19381
fbgt_else.19380:
	addi	%v0, %zero, 1
fbgt_cont.19381:
	beqi	%v0, 0, bnei_else.19382
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.19383
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.19383:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19382:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2942:
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
	beqi	%v1, 0, bnei_else.19384
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 468(%zero)
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
	fmul	%f2, %f2, %f7
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
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
	j	bnei_cont.19385
bnei_else.19384:
	addi	%v1, %zero, 142
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 142
	fsw	%f4, 1(%v1)
	addi	%v1, %zero, 142
	fsw	%f5, 2(%v1)
bnei_cont.19385:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 142
	j	vecunit_sgn.2650
utexture.2947:
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
	beqi	%a0, 1, bnei_else.19386
	beqi	%a0, 2, bnei_else.19387
	beqi	%a0, 3, bnei_else.19388
	beqi	%a0, 4, bnei_else.19389
	jr	%ra
bnei_else.19389:
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
	fblt	%f3, %f4, fbgt_else.19391
	addi	%a0, %zero, 0
	j	fbgt_cont.19392
fbgt_else.19391:
	addi	%a0, %zero, 1
fbgt_cont.19392:
	fsw	%f4, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.19393
	flw	%f0, 453(%zero)
	j	bnei_cont.19394
bnei_else.19393:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19395
	addi	%a0, %zero, 1
	j	fbgt_cont.19396
fbgt_else.19395:
	addi	%a0, %zero, 0
fbgt_cont.19396:
	fabs	%f1, %f0
	flw	%f3, 452(%zero)
	fblt	%f1, %f3, fbgt_else.19397
	flw	%f0, 451(%zero)
	sw	%a0, 4(%sp)
	fblt	%f1, %f0, fbgt_else.19399
	flw	%f0, 474(%zero)
	flw	%f3, 469(%zero)
	fdiv	%f1, %f3, %f1
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2607
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19400
fbgt_else.19399:
	flw	%f0, 473(%zero)
	flw	%f3, 469(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2607
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19400:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.19401
	j	bnei_cont.19402
bnei_else.19401:
	fneg	%f0, %f0
bnei_cont.19402:
	j	fbgt_cont.19398
fbgt_else.19397:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2607
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.19398:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.19394:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	flw	%f1, 1(%v0)
	lw	%v0, 2(%sp)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	lw	%v0, 4(%v0)
	flw	%f2, 1(%v0)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%sp)
	fabs	%f3, %f2
	flw	%f4, 0(%sp)
	fblt	%f3, %f4, fbgt_else.19403
	addi	%v0, %zero, 0
	j	fbgt_cont.19404
fbgt_else.19403:
	addi	%v0, %zero, 1
fbgt_cont.19404:
	fsw	%f0, 7(%sp)
	beqi	%v0, 0, bnei_else.19405
	flw	%f0, 453(%zero)
	j	bnei_cont.19406
bnei_else.19405:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 465(%zero)
	fblt	%f1, %f2, fbgt_else.19407
	addi	%v0, %zero, 1
	j	fbgt_cont.19408
fbgt_else.19407:
	addi	%v0, %zero, 0
fbgt_cont.19408:
	fabs	%f2, %f1
	flw	%f3, 452(%zero)
	fblt	%f2, %f3, fbgt_else.19409
	flw	%f1, 451(%zero)
	sw	%v0, 8(%sp)
	fblt	%f2, %f1, fbgt_else.19411
	flw	%f1, 474(%zero)
	flw	%f3, 469(%zero)
	fdiv	%f2, %f3, %f2
	fsw	%f1, 9(%sp)
	fmov	%f0, %f2
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2607
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19412
fbgt_else.19411:
	flw	%f1, 473(%zero)
	flw	%f3, 469(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fsw	%f1, 10(%sp)
	fmov	%f0, %f2
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2607
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19412:
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.19413
	j	bnei_cont.19414
bnei_else.19413:
	fneg	%f0, %f0
bnei_cont.19414:
	j	fbgt_cont.19410
fbgt_else.19409:
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2607
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
fbgt_cont.19410:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.19406:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 448(%zero)
	flw	%f2, 468(%zero)
	flw	%f3, 7(%sp)
	fsub	%f3, %f2, %f3
	fmul	%f3, %f3, %f3
	fsub	%f1, %f1, %f3
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19415
	addi	%v0, %zero, 0
	j	fbgt_cont.19416
fbgt_else.19415:
	addi	%v0, %zero, 1
fbgt_cont.19416:
	beqi	%v0, 0, bnei_else.19417
	fmov	%f0, %f1
	j	bnei_cont.19418
bnei_else.19417:
bnei_cont.19418:
	flw	%f1, 447(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 446(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.19388:
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
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	cos.2611
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f2, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f2, 1(%v0)
	flw	%f2, 469(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.19387:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	sin.2613
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f2, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f2, 0(%v0)
	flw	%f2, 469(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
bnei_else.19386:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 443(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 442(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fblt	%f0, %f2, fbgt_else.19422
	addi	%a0, %zero, 0
	j	fbgt_cont.19423
fbgt_else.19422:
	addi	%a0, %zero, 1
fbgt_cont.19423:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.19424
	addi	%v0, %zero, 0
	j	fbgt_cont.19425
fbgt_else.19424:
	addi	%v0, %zero, 1
fbgt_cont.19425:
	beqi	%a0, 0, bnei_else.19426
	beqi	%v0, 0, bnei_else.19428
	flw	%f0, 447(%zero)
	j	bnei_cont.19429
bnei_else.19428:
	flw	%f0, 465(%zero)
bnei_cont.19429:
	j	bnei_cont.19427
bnei_else.19426:
	beqi	%v0, 0, bnei_else.19430
	flw	%f0, 465(%zero)
	j	bnei_cont.19431
bnei_else.19430:
	flw	%f0, 447(%zero)
bnei_cont.19431:
bnei_cont.19427:
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
trace_reflections.2954:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.19433
	addi	%a1, %zero, 254
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 1(%a1)
	flw	%f2, 456(%zero)
	addi	%a3, %zero, 137
	fsw	%f2, 0(%a3)
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a3, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2932
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.19434
	addi	%v0, %zero, 0
	j	fbgt_cont.19435
fbgt_else.19434:
	addi	%v0, %zero, 1
fbgt_cont.19435:
	beqi	%v0, 0, bnei_else.19436
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.19438
	addi	%v0, %zero, 0
	j	fbgt_cont.19439
fbgt_else.19438:
	addi	%v0, %zero, 1
fbgt_cont.19439:
	j	bnei_cont.19437
bnei_else.19436:
	addi	%v0, %zero, 0
bnei_cont.19437:
	beqi	%v0, 0, bnei_else.19440
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.19442
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2907
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19444
	j	bnei_cont.19445
bnei_else.19444:
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
	lw	%v1, 7(%sp)
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
	flw	%f3, 465(%zero)
	fblt	%f3, %f0, fbgt_else.19446
	addi	%v0, %zero, 0
	j	fbgt_cont.19447
fbgt_else.19446:
	addi	%v0, %zero, 1
fbgt_cont.19447:
	beqi	%v0, 0, bnei_else.19448
	addi	%v0, %zero, 151
	flw	%f4, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 0(%v0)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	addi	%v0, %zero, 151
	fsw	%f4, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f4, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 1(%v0)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	addi	%v0, %zero, 151
	fsw	%f4, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f4, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 2(%v0)
	fmul	%f0, %f0, %f5
	fadd	%f0, %f4, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	j	bnei_cont.19449
bnei_else.19448:
bnei_cont.19449:
	fblt	%f3, %f1, fbgt_else.19450
	addi	%v0, %zero, 0
	j	fbgt_cont.19451
fbgt_else.19450:
	addi	%v0, %zero, 1
fbgt_cont.19451:
	beqi	%v0, 0, bnei_else.19452
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
	j	bnei_cont.19453
bnei_else.19452:
bnei_cont.19453:
bnei_cont.19445:
	j	beq_cont.19443
beq_else.19442:
beq_cont.19443:
	j	bnei_cont.19441
bnei_else.19440:
bnei_cont.19441:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2954
bgti_else.19433:
	jr	%ra
trace_ray.2959:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.19455
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 456(%zero)
	addi	%a3, %zero, 137
	fsw	%f2, 0(%a3)
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
	fsw	%f1, 0(%sp)
	sw	%a3, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%a0, %v1, 0
	addi	%v0, %a2, 0
	addi	%v1, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_or_matrix.2918
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.19456
	addi	%v0, %zero, 0
	j	fbgt_cont.19457
fbgt_else.19456:
	addi	%v0, %zero, 1
fbgt_cont.19457:
	beqi	%v0, 0, bnei_else.19458
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.19460
	addi	%v0, %zero, 0
	j	fbgt_cont.19461
fbgt_else.19460:
	addi	%v0, %zero, 1
fbgt_cont.19461:
	j	bnei_cont.19459
bnei_else.19458:
	addi	%v0, %zero, 0
bnei_cont.19459:
	beqi	%v0, 0, bnei_else.19462
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	fsw	%f0, 8(%sp)
	sw	%a0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%a2, 11(%sp)
	sw	%v0, 12(%sp)
	sw	%v1, 13(%sp)
	beqi	%a1, 1, bnei_else.19463
	beqi	%a1, 2, bnei_else.19465
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2942
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.19466
bnei_else.19465:
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 0(%a1)
	lw	%a1, 4(%v1)
	flw	%f3, 1(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 1(%a1)
	lw	%a1, 4(%v1)
	flw	%f3, 2(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 2(%a1)
bnei_cont.19466:
	j	bnei_cont.19464
bnei_else.19463:
	addi	%a1, %zero, 136
	lw	%a1, 0(%a1)
	flw	%f3, 465(%zero)
	addi	%a3, %zero, 142
	fsw	%f3, 0(%a3)
	addi	%a3, %zero, 142
	fsw	%f3, 1(%a3)
	addi	%a3, %zero, 142
	fsw	%f3, 2(%a3)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.19467
	addi	%t0, %zero, 1
	j	fbeq_cont.19468
fbeq_else.19467:
	addi	%t0, %zero, 0
fbeq_cont.19468:
	beqi	%t0, 0, bnei_else.19469
	j	bnei_cont.19470
bnei_else.19469:
	fblt	%f3, %f4, fbgt_else.19471
	addi	%t0, %zero, 0
	j	fbgt_cont.19472
fbgt_else.19471:
	addi	%t0, %zero, 1
fbgt_cont.19472:
	beqi	%t0, 0, bnei_else.19473
	flw	%f3, 469(%zero)
	j	bnei_cont.19474
bnei_else.19473:
	flw	%f3, 464(%zero)
bnei_cont.19474:
bnei_cont.19470:
	fneg	%f3, %f3
	addi	%t0, %zero, 142
	add	%at, %t0, %a1
	fsw	%f3, 0(%at)
bnei_cont.19464:
	addi	%v0, %zero, 138
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 159
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 159
	fsw	%f2, 2(%v0)
	addi	%v1, %zero, 138
	lw	%v0, 13(%sp)
	fsw	%f2, 14(%sp)
	fsw	%f1, 15(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	utexture.2947
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 12(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)
	lw	%a1, 1(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f0, 16(%sp)
	fsw	%f0, 0(%a1)
	flw	%f1, 15(%sp)
	fsw	%f1, 1(%a1)
	flw	%f2, 14(%sp)
	fsw	%f2, 2(%a1)
	lw	%a1, 3(%v0)
	lw	%a2, 13(%sp)
	lw	%a3, 7(%a2)
	flw	%f3, 0(%a3)
	flw	%f4, 468(%zero)
	fblt	%f3, %f4, fbgt_else.19475
	addi	%a3, %zero, 0
	j	fbgt_cont.19476
fbgt_else.19475:
	addi	%a3, %zero, 1
fbgt_cont.19476:
	beqi	%a3, 0, bnei_else.19477
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.19478
bnei_else.19477:
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%a3, %zero, 145
	flw	%f3, 0(%a3)
	fsw	%f3, 0(%a1)
	addi	%a3, %zero, 145
	flw	%f3, 1(%a3)
	fsw	%f3, 1(%a1)
	addi	%a3, %zero, 145
	flw	%f3, 2(%a3)
	fsw	%f3, 2(%a1)
	flw	%f3, 441(%zero)
	flw	%f4, 10(%sp)
	fmul	%f3, %f3, %f4
	flw	%f5, 0(%a1)
	fmul	%f5, %f5, %f3
	fsw	%f5, 0(%a1)
	flw	%f5, 1(%a1)
	fmul	%f5, %f5, %f3
	fsw	%f5, 1(%a1)
	flw	%f5, 2(%a1)
	fmul	%f3, %f5, %f3
	fsw	%f3, 2(%a1)
	lw	%a1, 7(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%a3, %zero, 142
	flw	%f3, 0(%a3)
	fsw	%f3, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 1(%a3)
	fsw	%f3, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 2(%a3)
	fsw	%f3, 2(%a1)
bnei_cont.19478:
	flw	%f3, 440(%zero)
	lw	%a1, 5(%sp)
	flw	%f4, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f5, 0(%a3)
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f8, 1(%a3)
	fmul	%f9, %f7, %f8
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	addi	%a3, %zero, 142
	flw	%f10, 2(%a3)
	fmul	%f11, %f9, %f10
	fadd	%f6, %f6, %f11
	fmul	%f3, %f3, %f6
	fmul	%f6, %f3, %f5
	fadd	%f4, %f4, %f6
	fsw	%f4, 0(%a1)
	fmul	%f4, %f3, %f8
	fadd	%f4, %f7, %f4
	fsw	%f4, 1(%a1)
	fmul	%f3, %f3, %f10
	fadd	%f3, %f9, %f3
	fsw	%f3, 2(%a1)
	lw	%a3, 7(%a2)
	flw	%f3, 1(%a3)
	flw	%f4, 4(%sp)
	fmul	%f3, %f4, %f3
	lw	%a3, 2(%sp)
	lw	%t0, 1(%sp)
	fsw	%f3, 17(%sp)
	fsw	%f10, 18(%sp)
	fsw	%f8, 19(%sp)
	fsw	%f5, 20(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	shadow_check_one_or_matrix.2907
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.19479
	j	bnei_cont.19480
bnei_else.19479:
	addi	%v0, %zero, 78
	flw	%f0, 0(%v0)
	flw	%f1, 20(%sp)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	flw	%f3, 19(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	addi	%v0, %zero, 78
	flw	%f3, 2(%v0)
	flw	%f4, 18(%sp)
	fmul	%f4, %f4, %f3
	fadd	%f1, %f1, %f4
	fneg	%f1, %f1
	flw	%f4, 10(%sp)
	fmul	%f1, %f1, %f4
	lw	%v0, 5(%sp)
	flw	%f5, 0(%v0)
	fmul	%f0, %f5, %f0
	flw	%f5, 1(%v0)
	fmul	%f2, %f5, %f2
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v0)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	fneg	%f0, %f0
	flw	%f2, 465(%zero)
	fblt	%f2, %f1, fbgt_else.19481
	addi	%v1, %zero, 0
	j	fbgt_cont.19482
fbgt_else.19481:
	addi	%v1, %zero, 1
fbgt_cont.19482:
	beqi	%v1, 0, bnei_else.19483
	addi	%v1, %zero, 151
	flw	%f3, 0(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 0(%v1)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	addi	%v1, %zero, 151
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 1(%v1)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	addi	%v1, %zero, 151
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 2(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 2(%v1)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
	addi	%v1, %zero, 151
	fsw	%f1, 2(%v1)
	j	bnei_cont.19484
bnei_else.19483:
bnei_cont.19484:
	fblt	%f2, %f0, fbgt_else.19485
	addi	%v1, %zero, 0
	j	fbgt_cont.19486
fbgt_else.19485:
	addi	%v1, %zero, 1
fbgt_cont.19486:
	beqi	%v1, 0, bnei_else.19487
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 17(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 151
	flw	%f2, 0(%v1)
	fadd	%f2, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f2, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f2, 1(%v1)
	fadd	%f2, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f2, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f2, 2(%v1)
	fadd	%f0, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.19488
bnei_else.19487:
bnei_cont.19488:
bnei_cont.19480:
	addi	%v0, %zero, 162
	flw	%f0, 16(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 162
	flw	%f0, 15(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 162
	flw	%f0, 14(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	addi	%v0, %zero, 434
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2954
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 439(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.19489
	addi	%v0, %zero, 0
	j	fbgt_cont.19490
fbgt_else.19489:
	addi	%v0, %zero, 1
fbgt_cont.19490:
	beqi	%v0, 0, bnei_else.19491
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.19492
	j	bgti_cont.19493
bgti_else.19492:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.19493:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.19494
	jr	%ra
bnei_else.19494:
	flw	%f0, 469(%zero)
	lw	%v1, 13(%sp)
	lw	%v1, 7(%v1)
	flw	%f2, 0(%v1)
	fsub	%f0, %f0, %f2
	fmul	%f0, %f1, %f0
	addi	%v0, %v0, 1
	flw	%f1, 8(%sp)
	flw	%f2, 0(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 5(%sp)
	lw	%a0, 3(%sp)
	j	trace_ray.2959
bnei_else.19491:
	jr	%ra
bnei_else.19462:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.19497
	lw	%v0, 5(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.19498
	addi	%v0, %zero, 0
	j	fbgt_cont.19499
fbgt_else.19498:
	addi	%v0, %zero, 1
fbgt_cont.19499:
	beqi	%v0, 0, bnei_else.19500
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
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
bnei_else.19500:
	jr	%ra
bnei_else.19497:
	jr	%ra
bgt_else.19455:
	jr	%ra
trace_diffuse_ray.2965:
	addi	%v1, %zero, 0
	flw	%f1, 456(%zero)
	addi	%a0, %zero, 137
	fsw	%f1, 0(%a0)
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
	fsw	%f0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2932
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.19505
	addi	%v0, %zero, 0
	j	fbgt_cont.19506
fbgt_else.19505:
	addi	%v0, %zero, 1
fbgt_cont.19506:
	beqi	%v0, 0, bnei_else.19507
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.19509
	addi	%v0, %zero, 0
	j	fbgt_cont.19510
fbgt_else.19509:
	addi	%v0, %zero, 1
fbgt_cont.19510:
	j	bnei_cont.19508
bnei_else.19507:
	addi	%v0, %zero, 0
bnei_cont.19508:
	beqi	%v0, 0, bnei_else.19511
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.19512
	beqi	%a0, 2, bnei_else.19514
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2942
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19515
bnei_else.19514:
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
bnei_cont.19515:
	j	bnei_cont.19513
bnei_else.19512:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	flw	%f0, 465(%zero)
	addi	%a1, %zero, 142
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19516
	addi	%v1, %zero, 1
	j	fbeq_cont.19517
fbeq_else.19516:
	addi	%v1, %zero, 0
fbeq_cont.19517:
	beqi	%v1, 0, bnei_else.19518
	j	bnei_cont.19519
bnei_else.19518:
	fblt	%f0, %f1, fbgt_else.19520
	addi	%v1, %zero, 0
	j	fbgt_cont.19521
fbgt_else.19520:
	addi	%v1, %zero, 1
fbgt_cont.19521:
	beqi	%v1, 0, bnei_else.19522
	flw	%f0, 469(%zero)
	j	bnei_cont.19523
bnei_else.19522:
	flw	%f0, 464(%zero)
bnei_cont.19523:
bnei_cont.19519:
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f0, 0(%at)
bnei_cont.19513:
	addi	%v1, %zero, 138
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2947
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2907
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19524
	jr	%ra
bnei_else.19524:
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.19526
	addi	%v0, %zero, 0
	j	fbgt_cont.19527
fbgt_else.19526:
	addi	%v0, %zero, 1
fbgt_cont.19527:
	beqi	%v0, 0, bnei_else.19528
	j	bnei_cont.19529
bnei_else.19528:
	fmov	%f0, %f1
bnei_cont.19529:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
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
bnei_else.19511:
	jr	%ra
iter_trace_diffuse_rays.2968:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.19532
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	lw	%t0, 0(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f2, 1(%t0)
	flw	%f3, 1(%v1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fblt	%f0, %f2, fbgt_else.19533
	addi	%t0, %zero, 0
	j	fbgt_cont.19534
fbgt_else.19533:
	addi	%t0, %zero, 1
fbgt_cont.19534:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.19535
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 438(%zero)
	fdiv	%f0, %f0, %f5
	fsw	%f0, 8(%sp)
	sw	%a2, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	judge_intersection_fast.2936
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19537
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 10(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 11(%sp)
	beqi	%a0, 1, bnei_else.19539
	beqi	%a0, 2, bnei_else.19541
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector_second.2942
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.19542
bnei_else.19541:
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
bnei_cont.19542:
	j	bnei_cont.19540
bnei_else.19539:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 142
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19543
	addi	%v1, %zero, 1
	j	fbeq_cont.19544
fbeq_else.19543:
	addi	%v1, %zero, 0
fbeq_cont.19544:
	beqi	%v1, 0, bnei_else.19545
	fmov	%f1, %f0
	j	bnei_cont.19546
bnei_else.19545:
	fblt	%f0, %f1, fbgt_else.19547
	addi	%v1, %zero, 0
	j	fbgt_cont.19548
fbgt_else.19547:
	addi	%v1, %zero, 1
fbgt_cont.19548:
	beqi	%v1, 0, bnei_else.19549
	flw	%f1, 469(%zero)
	j	bnei_cont.19550
bnei_else.19549:
	flw	%f1, 464(%zero)
bnei_cont.19550:
bnei_cont.19546:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.19540:
	addi	%v1, %zero, 138
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2947
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 134
	lw	%v1, 0(%v0)
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2907
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.19551
	j	bnei_cont.19552
bnei_else.19551:
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
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.19553
	addi	%v0, %zero, 0
	j	fbgt_cont.19554
fbgt_else.19553:
	addi	%v0, %zero, 1
fbgt_cont.19554:
	beqi	%v0, 0, bnei_else.19555
	j	bnei_cont.19556
bnei_else.19555:
	fmov	%f0, %f1
bnei_cont.19556:
	flw	%f2, 8(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 11(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 148
	flw	%f2, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 0(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 1(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.19552:
	j	bnei_cont.19538
bnei_else.19537:
bnei_cont.19538:
	j	bnei_cont.19536
bnei_else.19535:
	flw	%f5, 437(%zero)
	fdiv	%f0, %f0, %f5
	fsw	%f0, 12(%sp)
	sw	%a2, 9(%sp)
	sw	%a3, 13(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	judge_intersection_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19557
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 13(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.19559
	beqi	%a0, 2, bnei_else.19561
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2942
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.19562
bnei_else.19561:
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
bnei_cont.19562:
	j	bnei_cont.19560
bnei_else.19559:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 142
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19563
	addi	%v1, %zero, 1
	j	fbeq_cont.19564
fbeq_else.19563:
	addi	%v1, %zero, 0
fbeq_cont.19564:
	beqi	%v1, 0, bnei_else.19565
	fmov	%f1, %f0
	j	bnei_cont.19566
bnei_else.19565:
	fblt	%f0, %f1, fbgt_else.19567
	addi	%v1, %zero, 0
	j	fbgt_cont.19568
fbgt_else.19567:
	addi	%v1, %zero, 1
fbgt_cont.19568:
	beqi	%v1, 0, bnei_else.19569
	flw	%f1, 469(%zero)
	j	bnei_cont.19570
bnei_else.19569:
	flw	%f1, 464(%zero)
bnei_cont.19570:
bnei_cont.19566:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.19560:
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2947
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v0, %zero, 134
	lw	%v1, 0(%v0)
	lw	%v0, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2907
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.19571
	j	bnei_cont.19572
bnei_else.19571:
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
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.19573
	addi	%v0, %zero, 0
	j	fbgt_cont.19574
fbgt_else.19573:
	addi	%v0, %zero, 1
fbgt_cont.19574:
	beqi	%v0, 0, bnei_else.19575
	j	bnei_cont.19576
bnei_else.19575:
	fmov	%f0, %f1
bnei_cont.19576:
	flw	%f2, 12(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 14(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 148
	flw	%f2, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 0(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 1(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.19572:
	j	bnei_cont.19558
bnei_else.19557:
bnei_cont.19558:
bnei_cont.19536:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.19577
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a1)
	flw	%f2, 3(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.19578
	addi	%a1, %zero, 0
	j	fbgt_cont.19579
fbgt_else.19578:
	addi	%a1, %zero, 1
fbgt_cont.19579:
	sw	%v0, 15(%sp)
	beqi	%a1, 0, bnei_else.19580
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.19581
bnei_else.19580:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.19581:
	lw	%v0, 15(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2968
bgti_else.19577:
	jr	%ra
bgti_else.19532:
	jr	%ra
trace_diffuse_ray_80percent.2977:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.19584
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19585
bnei_else.19584:
bnei_cont.19585:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.19586
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19587
bnei_else.19586:
bnei_cont.19587:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.19588
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19589
bnei_else.19588:
bnei_cont.19589:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.19590
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19591
bnei_else.19590:
bnei_cont.19591:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.19592
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	j	iter_trace_diffuse_rays.2968
bnei_else.19592:
	jr	%ra
calc_diffuse_using_1point.2981:
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
	beqi	%v0, 0, bnei_else.19594
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 2(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19596
	addi	%a0, %zero, 0
	j	fbgt_cont.19597
fbgt_else.19596:
	addi	%a0, %zero, 1
fbgt_cont.19597:
	beqi	%a0, 0, bnei_else.19598
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19599
bnei_else.19598:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19599:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19595
bnei_else.19594:
bnei_cont.19595:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.19600
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 2(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19602
	addi	%a0, %zero, 0
	j	fbgt_cont.19603
fbgt_else.19602:
	addi	%a0, %zero, 1
fbgt_cont.19603:
	beqi	%a0, 0, bnei_else.19604
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19605
bnei_else.19604:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19605:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19601
bnei_else.19600:
bnei_cont.19601:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.19606
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 2(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19608
	addi	%a0, %zero, 0
	j	fbgt_cont.19609
fbgt_else.19608:
	addi	%a0, %zero, 1
fbgt_cont.19609:
	beqi	%a0, 0, bnei_else.19610
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.19611
bnei_else.19610:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.19611:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.19607
bnei_else.19606:
bnei_cont.19607:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.19612
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 2(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19614
	addi	%a0, %zero, 0
	j	fbgt_cont.19615
fbgt_else.19614:
	addi	%a0, %zero, 1
fbgt_cont.19615:
	beqi	%a0, 0, bnei_else.19616
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19617
bnei_else.19616:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19617:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19613
bnei_else.19612:
bnei_cont.19613:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.19618
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 2(%sp)
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
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.19620
	addi	%a0, %zero, 0
	j	fbgt_cont.19621
fbgt_else.19620:
	addi	%a0, %zero, 1
fbgt_cont.19621:
	beqi	%a0, 0, bnei_else.19622
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19623
bnei_else.19622:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19623:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19619
bnei_else.19618:
bnei_cont.19619:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 151
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	jr	%ra
calc_diffuse_using_5points.2984:
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%v1, 5(%v1)
	addi	%a3, %v0, -1
	add	%at, %a0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 5(%a3)
	add	%at, %a0, %v0
	lw	%t0, 0(%at)
	lw	%t1, 5(%t0)
	addi	%t2, %v0, 1
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	lw	%a0, 5(%a0)
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	lw	%v0, 5(%v0)
	add	%at, %v1, %a2
	lw	%v1, 0(%at)
	flw	%f0, 0(%v1)
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a3, %a2
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
	add	%at, %t1, %a2
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
	add	%at, %a0, %a2
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 148
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 148
	flw	%f0, 1(%a0)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 148
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 148
	flw	%f0, 2(%a0)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%v1, %zero, 148
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 148
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 148
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	lw	%v0, 4(%t0)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%v1, %zero, 151
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	jr	%ra
do_without_neighbors.2990:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.19626
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.19627
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.19628
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
	jal	trace_diffuse_ray_80percent.2977
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	addi	%a0, %zero, 148
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	flw	%f1, 1(%v1)
	addi	%a0, %zero, 148
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	flw	%f1, 2(%v1)
	addi	%v1, %zero, 148
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.19629
bnei_else.19628:
bnei_cont.19629:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.19630
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.19631
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.19632
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2981
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19633
bnei_else.19632:
bnei_cont.19633:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2990
bgti_else.19631:
	jr	%ra
bgt_else.19630:
	jr	%ra
bgti_else.19627:
	jr	%ra
bgt_else.19626:
	jr	%ra
try_exploit_neighbors.3006:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.19638
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.19639
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.19640
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.19642
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.19644
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.19646
	addi	%t1, %zero, 1
	j	beq_cont.19647
beq_else.19646:
	addi	%t1, %zero, 0
beq_cont.19647:
	j	beq_cont.19645
beq_else.19644:
	addi	%t1, %zero, 0
beq_cont.19645:
	j	beq_cont.19643
beq_else.19642:
	addi	%t1, %zero, 0
beq_cont.19643:
	j	beq_cont.19641
beq_else.19640:
	addi	%t1, %zero, 0
beq_cont.19641:
	beqi	%t1, 0, bnei_else.19648
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%t1, 0, bnei_else.19649
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_5points.2984
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.19650
bnei_else.19649:
bnei_cont.19650:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.19651
	lw	%v0, 6(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.19652
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	lw	%a1, 2(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	bne	%a1, %a0, beq_else.19653
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	add	%at, %a2, %a1
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.19655
	addi	%a3, %a1, -1
	lw	%t0, 2(%sp)
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.19657
	addi	%a3, %a1, 1
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.19659
	addi	%a0, %zero, 1
	j	beq_cont.19660
beq_else.19659:
	addi	%a0, %zero, 0
beq_cont.19660:
	j	beq_cont.19658
beq_else.19657:
	addi	%a0, %zero, 0
beq_cont.19658:
	j	beq_cont.19656
beq_else.19655:
	addi	%a0, %zero, 0
beq_cont.19656:
	j	beq_cont.19654
beq_else.19653:
	addi	%a0, %zero, 0
beq_cont.19654:
	beqi	%a0, 0, bnei_else.19661
	lw	%v0, 3(%v0)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%v1, 8(%sp)
	beqi	%v0, 0, bnei_else.19662
	lw	%v0, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 4(%sp)
	addi	%k0, %a2, 0
	addi	%a2, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %k0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_5points.2984
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19663
bnei_else.19662:
bnei_cont.19663:
	lw	%v0, 8(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 4(%sp)
	j	try_exploit_neighbors.3006
bnei_else.19661:
	j	do_without_neighbors.2990
bgti_else.19652:
	jr	%ra
bgt_else.19651:
	jr	%ra
bnei_else.19648:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.19666
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.19667
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.19668
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_1point.2981
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19669
bnei_else.19668:
bnei_cont.19669:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.2990
bgti_else.19667:
	jr	%ra
bgt_else.19666:
	jr	%ra
bgti_else.19639:
	jr	%ra
bgt_else.19638:
	jr	%ra
write_rgb_element.3015:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.19674
	blti	%v0, 0, bgti_else.19676
	j	bgti_cont.19677
bgti_else.19676:
	addi	%v0, %zero, 0
bgti_cont.19677:
	j	bgt_cont.19675
bgt_else.19674:
	addi	%v0, %zero, 255
bgt_cont.19675:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.19678
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.19680
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19682
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19684
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19686
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19688
	addi	%v1, %v1, -10
	addi	%a0, %zero, 6
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2617
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.19689
bgti_else.19688:
	addi	%v0, %zero, 5
bgti_cont.19689:
	j	bgti_cont.19687
bgti_else.19686:
	addi	%v0, %zero, 4
bgti_cont.19687:
	j	bgti_cont.19685
bgti_else.19684:
	addi	%v0, %zero, 3
bgti_cont.19685:
	j	bgti_cont.19683
bgti_else.19682:
	addi	%v0, %zero, 2
bgti_cont.19683:
	j	bgti_cont.19681
bgti_else.19680:
	addi	%v0, %zero, 1
bgti_cont.19681:
	j	bgti_cont.19679
bgti_else.19678:
	addi	%v0, %zero, 0
bgti_cont.19679:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.19690
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19692
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19694
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19696
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19698
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19700
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19702
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19704
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19706
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19708
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19710
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19712
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19714
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19716
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2620
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.19717
bgti_else.19716:
	add	%v0, %zero, %v1
bgti_cont.19717:
	j	bgti_cont.19715
bgti_else.19714:
	add	%v0, %zero, %v1
bgti_cont.19715:
	j	bgti_cont.19713
bgti_else.19712:
	add	%v0, %zero, %v1
bgti_cont.19713:
	j	bgti_cont.19711
bgti_else.19710:
	add	%v0, %zero, %v1
bgti_cont.19711:
	j	bgti_cont.19709
bgti_else.19708:
	add	%v0, %zero, %v1
bgti_cont.19709:
	j	bgti_cont.19707
bgti_else.19706:
	add	%v0, %zero, %v1
bgti_cont.19707:
	j	bgti_cont.19705
bgti_else.19704:
	add	%v0, %zero, %v1
bgti_cont.19705:
	j	bgti_cont.19703
bgti_else.19702:
	add	%v0, %zero, %v1
bgti_cont.19703:
	j	bgti_cont.19701
bgti_else.19700:
	add	%v0, %zero, %v1
bgti_cont.19701:
	j	bgti_cont.19699
bgti_else.19698:
	add	%v0, %zero, %v1
bgti_cont.19699:
	j	bgti_cont.19697
bgti_else.19696:
	add	%v0, %zero, %v1
bgti_cont.19697:
	j	bgti_cont.19695
bgti_else.19694:
	add	%v0, %zero, %v1
bgti_cont.19695:
	j	bgti_cont.19693
bgti_else.19692:
	add	%v0, %zero, %v1
bgti_cont.19693:
	j	bgti_cont.19691
bgti_else.19690:
	add	%v0, %zero, %v1
bgti_cont.19691:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19718
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19718:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.19719
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.19721
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19723
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19725
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19727
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19729
	addi	%a0, %a0, -10
	addi	%a1, %zero, 6
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.19730
bgti_else.19729:
	addi	%v0, %zero, 5
bgti_cont.19730:
	j	bgti_cont.19728
bgti_else.19727:
	addi	%v0, %zero, 4
bgti_cont.19728:
	j	bgti_cont.19726
bgti_else.19725:
	addi	%v0, %zero, 3
bgti_cont.19726:
	j	bgti_cont.19724
bgti_else.19723:
	addi	%v0, %zero, 2
bgti_cont.19724:
	j	bgti_cont.19722
bgti_else.19721:
	addi	%v0, %zero, 1
bgti_cont.19722:
	j	bgti_cont.19720
bgti_else.19719:
	addi	%v0, %zero, 0
bgti_cont.19720:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.19731
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19733
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19735
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19737
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19739
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19741
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19743
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19745
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19747
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19749
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19751
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19753
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19755
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19757
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2620
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.19758
bgti_else.19757:
	add	%v0, %zero, %v1
bgti_cont.19758:
	j	bgti_cont.19756
bgti_else.19755:
	add	%v0, %zero, %v1
bgti_cont.19756:
	j	bgti_cont.19754
bgti_else.19753:
	add	%v0, %zero, %v1
bgti_cont.19754:
	j	bgti_cont.19752
bgti_else.19751:
	add	%v0, %zero, %v1
bgti_cont.19752:
	j	bgti_cont.19750
bgti_else.19749:
	add	%v0, %zero, %v1
bgti_cont.19750:
	j	bgti_cont.19748
bgti_else.19747:
	add	%v0, %zero, %v1
bgti_cont.19748:
	j	bgti_cont.19746
bgti_else.19745:
	add	%v0, %zero, %v1
bgti_cont.19746:
	j	bgti_cont.19744
bgti_else.19743:
	add	%v0, %zero, %v1
bgti_cont.19744:
	j	bgti_cont.19742
bgti_else.19741:
	add	%v0, %zero, %v1
bgti_cont.19742:
	j	bgti_cont.19740
bgti_else.19739:
	add	%v0, %zero, %v1
bgti_cont.19740:
	j	bgti_cont.19738
bgti_else.19737:
	add	%v0, %zero, %v1
bgti_cont.19738:
	j	bgti_cont.19736
bgti_else.19735:
	add	%v0, %zero, %v1
bgti_cont.19736:
	j	bgti_cont.19734
bgti_else.19733:
	add	%v0, %zero, %v1
bgti_cont.19734:
	j	bgti_cont.19732
bgti_else.19731:
	add	%v0, %zero, %v1
bgti_cont.19732:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19759
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19759:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.19760
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19762
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19764
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19766
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19768
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19770
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19772
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19774
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19776
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19778
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19780
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19782
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19784
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19786
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2620
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.19787
bgti_else.19786:
	add	%v0, %zero, %v1
bgti_cont.19787:
	j	bgti_cont.19785
bgti_else.19784:
	add	%v0, %zero, %v1
bgti_cont.19785:
	j	bgti_cont.19783
bgti_else.19782:
	add	%v0, %zero, %v1
bgti_cont.19783:
	j	bgti_cont.19781
bgti_else.19780:
	add	%v0, %zero, %v1
bgti_cont.19781:
	j	bgti_cont.19779
bgti_else.19778:
	add	%v0, %zero, %v1
bgti_cont.19779:
	j	bgti_cont.19777
bgti_else.19776:
	add	%v0, %zero, %v1
bgti_cont.19777:
	j	bgti_cont.19775
bgti_else.19774:
	add	%v0, %zero, %v1
bgti_cont.19775:
	j	bgti_cont.19773
bgti_else.19772:
	add	%v0, %zero, %v1
bgti_cont.19773:
	j	bgti_cont.19771
bgti_else.19770:
	add	%v0, %zero, %v1
bgti_cont.19771:
	j	bgti_cont.19769
bgti_else.19768:
	add	%v0, %zero, %v1
bgti_cont.19769:
	j	bgti_cont.19767
bgti_else.19766:
	add	%v0, %zero, %v1
bgti_cont.19767:
	j	bgti_cont.19765
bgti_else.19764:
	add	%v0, %zero, %v1
bgti_cont.19765:
	j	bgti_cont.19763
bgti_else.19762:
	add	%v0, %zero, %v1
bgti_cont.19763:
	j	bgti_cont.19761
bgti_else.19760:
	add	%v0, %zero, %v1
bgti_cont.19761:
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
write_rgb.3017:
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.19788
	blti	%v0, 0, bgti_else.19790
	j	bgti_cont.19791
bgti_else.19790:
	addi	%v0, %zero, 0
bgti_cont.19791:
	j	bgt_cont.19789
bgt_else.19788:
	addi	%v0, %zero, 255
bgt_cont.19789:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2622
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.19792
	blti	%v0, 0, bgti_else.19794
	j	bgti_cont.19795
bgti_else.19794:
	addi	%v0, %zero, 0
bgti_cont.19795:
	j	bgt_cont.19793
bgt_else.19792:
	addi	%v0, %zero, 255
bgt_cont.19793:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.19796
	blti	%v0, 0, bgti_else.19798
	j	bgti_cont.19799
bgti_else.19798:
	addi	%v0, %zero, 0
bgti_cont.19799:
	j	bgt_cont.19797
bgt_else.19796:
	addi	%v0, %zero, 255
bgt_cont.19797:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3019:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.19800
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.19801
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.19802
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 465(%zero)
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
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2968
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
	j	bnei_cont.19803
bnei_else.19802:
bnei_cont.19803:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.19804
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.19805
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.19806
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 465(%zero)
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
	flw	%f1, 0(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 0(%a3)
	flw	%f1, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 1(%a3)
	flw	%f1, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 6(%sp)
	fsw	%f0, 7(%sp)
	sw	%a1, 8(%sp)
	sw	%a0, 9(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 8(%sp)
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
	flw	%f1, 7(%sp)
	fblt	%f0, %f1, fbgt_else.19808
	addi	%a0, %zero, 0
	j	fbgt_cont.19809
fbgt_else.19808:
	addi	%a0, %zero, 1
fbgt_cont.19809:
	beqi	%a0, 0, bnei_else.19810
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19811
bnei_else.19810:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19811:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
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
	j	bnei_cont.19807
bnei_else.19806:
bnei_cont.19807:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3019
bgti_else.19805:
	jr	%ra
bgt_else.19804:
	jr	%ra
bgti_else.19801:
	jr	%ra
bgt_else.19800:
	jr	%ra
pretrace_pixels.3022:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.19816
	addi	%a2, %zero, 158
	flw	%f3, 0(%a2)
	addi	%a2, %zero, 156
	lw	%a2, 0(%a2)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	addi	%a2, %zero, 165
	flw	%f4, 0(%a2)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a2, %zero, 174
	fsw	%f4, 0(%a2)
	addi	%a2, %zero, 1
	addi	%a3, %zero, 165
	flw	%f4, 1(%a3)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a3, %zero, 174
	fsw	%f4, 1(%a3)
	addi	%a3, %zero, 165
	flw	%f4, 2(%a3)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a3, %zero, 174
	fsw	%f3, 2(%a3)
	addi	%a3, %zero, 174
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	vecunit_sgn.2650
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 465(%zero)
	addi	%v0, %zero, 151
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 151
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 151
	fsw	%f1, 2(%v0)
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
	flw	%f0, 469(%zero)
	lw	%v0, 6(%sp)
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 174
	lw	%a2, 5(%sp)
	fsw	%f1, 8(%sp)
	sw	%a0, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_ray.2959
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 0(%v0)
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	fsw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	fsw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 4(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.19817
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.19819
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 179
	add	%at, %a3, %v1
	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	lw	%a2, 0(%a2)
	flw	%f1, 0(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 0(%a3)
	flw	%f1, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 1(%a3)
	flw	%f1, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
	addi	%a3, %a3, -1
	sw	%a2, 10(%sp)
	sw	%a1, 11(%sp)
	sw	%v1, 12(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_startp_constants.2870
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 11(%sp)
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
	flw	%f1, 8(%sp)
	fblt	%f0, %f1, fbgt_else.19821
	addi	%a0, %zero, 0
	j	fbgt_cont.19822
fbgt_else.19821:
	addi	%a0, %zero, 1
fbgt_cont.19822:
	beqi	%a0, 0, bnei_else.19823
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19824
bnei_else.19823:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2965
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.19824:
	addi	%a1, %zero, 116
	lw	%v0, 12(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_trace_diffuse_rays.2968
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 9(%sp)
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
	j	bnei_cont.19820
bnei_else.19819:
bnei_cont.19820:
	lw	%v1, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3019
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.19818
bgti_else.19817:
bgti_cont.19818:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.19825
	addi	%a0, %v0, -5
	j	bgti_cont.19826
bgti_else.19825:
	add	%a0, %zero, %v0
bgti_cont.19826:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	j	pretrace_pixels.3022
bgti_else.19816:
	jr	%ra
scan_pixel.3033:
	addi	%a3, %zero, 0
	addi	%t0, %zero, 154
	lw	%t0, 0(%t0)
	blt	%v0, %t0, bgt_else.19828
	jr	%ra
bgt_else.19828:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t2, 0(%t1)
	flw	%f0, 0(%t2)
	addi	%t3, %zero, 151
	fsw	%f0, 0(%t3)
	addi	%t3, %zero, 1
	flw	%f0, 1(%t2)
	addi	%t4, %zero, 151
	fsw	%f0, 1(%t4)
	flw	%f0, 2(%t2)
	addi	%t2, %zero, 151
	fsw	%f0, 2(%t2)
	addi	%t2, %zero, 154
	lw	%t2, 1(%t2)
	addi	%t4, %v1, 1
	blt	%t4, %t2, bgt_else.19830
	addi	%t5, %zero, 0
	j	bgt_cont.19831
bgt_else.19830:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19832
	addi	%t5, %zero, 0
	j	bgt_cont.19833
bgt_else.19832:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.19834
	addi	%t5, %zero, 0
	j	bgt_cont.19835
bgt_else.19834:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.19836
	addi	%t5, %zero, 0
	j	bgt_cont.19837
bgt_else.19836:
	addi	%t5, %zero, 1
bgt_cont.19837:
bgt_cont.19835:
bgt_cont.19833:
bgt_cont.19831:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.19838
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.19840
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.19842
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.19844
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.19846
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.19848
	addi	%t5, %zero, 1
	j	beq_cont.19849
beq_else.19848:
	addi	%t5, %zero, 0
beq_cont.19849:
	j	beq_cont.19847
beq_else.19846:
	addi	%t5, %zero, 0
beq_cont.19847:
	j	beq_cont.19845
beq_else.19844:
	addi	%t5, %zero, 0
beq_cont.19845:
	j	beq_cont.19843
beq_else.19842:
	addi	%t5, %zero, 0
beq_cont.19843:
	beqi	%t5, 0, bnei_else.19850
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.19852
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.2984
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19853
bnei_else.19852:
bnei_cont.19853:
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3006
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19851
bnei_else.19850:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2990
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19851:
	j	bgti_cont.19841
bgti_else.19840:
bgti_cont.19841:
	j	bnei_cont.19839
bnei_else.19838:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.19854
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.19856
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.2981
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19857
bnei_else.19856:
bnei_cont.19857:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.2990
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.19855
bgti_else.19854:
bgti_cont.19855:
bnei_cont.19839:
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	write_rgb_element.3015
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	write_rgb_element.3015
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	write_rgb_element.3015
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 7(%sp)
	blt	%v0, %v1, bgt_else.19858
	jr	%ra
bgt_else.19858:
	lw	%a1, 6(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a2, %zero, 151
	fsw	%f0, 2(%a2)
	lw	%a2, 4(%sp)
	lw	%a3, 5(%sp)
	blt	%a2, %a3, bgt_else.19860
	addi	%v1, %zero, 0
	j	bgt_cont.19861
bgt_else.19860:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.19862
	addi	%v1, %zero, 0
	j	bgt_cont.19863
bgt_else.19862:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.19864
	addi	%v1, %zero, 0
	j	bgt_cont.19865
bgt_else.19864:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.19866
	addi	%v1, %zero, 0
	j	bgt_cont.19867
bgt_else.19866:
	addi	%v1, %zero, 1
bgt_cont.19867:
bgt_cont.19865:
bgt_cont.19863:
bgt_cont.19861:
	sw	%v0, 12(%sp)
	beqi	%v1, 0, bnei_else.19868
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3006
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19869
bnei_else.19868:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	do_without_neighbors.2990
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.19869:
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	write_rgb.3017
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3033
scan_line.3039:
	addi	%a3, %zero, 1
	addi	%t0, %zero, 154
	lw	%t0, 1(%t0)
	blt	%v0, %t0, bgt_else.19870
	jr	%ra
bgt_else.19870:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.19872
	j	bgt_cont.19873
bgt_else.19872:
	addi	%t2, %v0, 1
	addi	%t3, %zero, 158
	flw	%f0, 0(%t3)
	addi	%t3, %zero, 156
	lw	%t3, 1(%t3)
	sub	%t2, %t2, %t3
	itof	%f1, %t2
	fmul	%f0, %f0, %f1
	addi	%t2, %zero, 168
	flw	%f1, 0(%t2)
	fmul	%f1, %f0, %f1
	addi	%t2, %zero, 171
	flw	%f2, 0(%t2)
	fadd	%f1, %f1, %f2
	addi	%t2, %zero, 168
	flw	%f2, 1(%t2)
	fmul	%f2, %f0, %f2
	addi	%t2, %zero, 171
	flw	%f3, 1(%t2)
	fadd	%f2, %f2, %f3
	addi	%t2, %zero, 168
	flw	%f3, 2(%t2)
	fmul	%f0, %f0, %f3
	addi	%t2, %zero, 171
	flw	%f3, 2(%t2)
	fadd	%f0, %f0, %f3
	addi	%t2, %zero, 154
	lw	%t2, 0(%t2)
	addi	%t2, %t2, -1
	addi	%a0, %a2, 0
	addi	%v1, %t2, 0
	addi	%v0, %a1, 0
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	pretrace_pixels.3022
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.19873:
	addi	%v1, %zero, 0
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.19874
	j	bgt_cont.19875
bgt_else.19874:
	lw	%a1, 7(%sp)
	lw	%a0, 0(%a1)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a2, %zero, 151
	fsw	%f0, 2(%a2)
	lw	%a2, 6(%sp)
	addi	%a3, %a2, 1
	lw	%t0, 5(%sp)
	blt	%a3, %t0, bgt_else.19876
	addi	%a3, %zero, 0
	j	bgt_cont.19877
bgt_else.19876:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.19878
	addi	%a3, %zero, 0
	j	bgt_cont.19879
bgt_else.19878:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.19880
	addi	%a3, %zero, 0
	j	bgt_cont.19881
bgt_else.19880:
	addi	%a3, %zero, 0
bgt_cont.19881:
bgt_cont.19879:
bgt_cont.19877:
	beqi	%a3, 0, bnei_else.19882
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3006
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.19883
bnei_else.19882:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2990
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19883:
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	write_rgb.3017
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3033
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bgt_cont.19875:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.19884
	addi	%a0, %v0, -5
	j	bgti_cont.19885
bgti_else.19884:
	add	%a0, %zero, %v0
bgti_cont.19885:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.19886
	jr	%ra
bgt_else.19886:
	lw	%v0, 0(%sp)
	sw	%a0, 10(%sp)
	sw	%v1, 11(%sp)
	blt	%v1, %v0, bgt_else.19888
	j	bgt_cont.19889
bgt_else.19888:
	addi	%v0, %v1, 1
	addi	%a1, %zero, 158
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 156
	lw	%a1, 1(%a1)
	sub	%v0, %v0, %a1
	itof	%f1, %v0
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 168
	flw	%f1, 0(%v0)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 171
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 168
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 171
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 168
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	addi	%v0, %zero, 171
	flw	%f3, 2(%v0)
	fadd	%f0, %f0, %f3
	lw	%v0, 9(%sp)
	addi	%v0, %v0, -1
	lw	%a1, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_pixels.3022
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bgt_cont.19889:
	lw	%v0, 8(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	scan_pixel.3033
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.19890
	addi	%a2, %v1, -5
	j	bgti_cont.19891
bgti_else.19890:
	add	%a2, %zero, %v1
bgti_cont.19891:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3039
create_pixel.3047:
	addi	%v0, %zero, 3
	flw	%f0, 465(%zero)
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v0, 4(%v1)
	addi	%v0, %zero, 0
	lw	%a0, 3(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 4(%sp)
	lw	%a0, 6(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 11(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 10(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 9(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 7(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 5(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
init_line_elements.3049:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.19892
	addi	%a1, %zero, 3
	flw	%f0, 465(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 11(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 10(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 9(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19893
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_pixel.3047
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 15(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19894
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 21(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 22(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 23(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 22(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 21(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 20(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 19(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 18(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 17(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 16(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19895
	sw	%v0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	create_pixel.3047
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3049
bgti_else.19895:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.19894:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.19893:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.19892:
	jr	%ra
calc_dirvec.3059:
	blti	%v0, 5, bgti_else.19896
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
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
bgti_else.19896:
	fmul	%f0, %f1, %f1
	flw	%f1, 439(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 469(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 465(%zero)
	fblt	%f5, %f6, fbgt_else.19898
	addi	%a1, %zero, 1
	j	fbgt_cont.19899
fbgt_else.19898:
	addi	%a1, %zero, 0
fbgt_cont.19899:
	fabs	%f7, %f5
	flw	%f8, 452(%zero)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f8, 3(%sp)
	fsw	%f6, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f2, 9(%sp)
	fblt	%f7, %f8, fbgt_else.19900
	flw	%f5, 451(%zero)
	sw	%a1, 10(%sp)
	fblt	%f7, %f5, fbgt_else.19902
	flw	%f5, 474(%zero)
	fdiv	%f7, %f4, %f7
	fsw	%f5, 11(%sp)
	fmov	%f0, %f7
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	kernel_atan.2607
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19903
fbgt_else.19902:
	flw	%f5, 473(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	fdiv	%f7, %f9, %f7
	fsw	%f5, 12(%sp)
	fmov	%f0, %f7
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2607
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19903:
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.19904
	j	bnei_cont.19905
bnei_else.19904:
	fneg	%f0, %f0
bnei_cont.19905:
	j	fbgt_cont.19901
fbgt_else.19900:
	fmov	%f0, %f5
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2607
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
fbgt_cont.19901:
	flw	%f1, 9(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	sin.2613
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fsw	%f0, 14(%sp)
	fmov	%f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	cos.2611
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 8(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	fmul	%f1, %f0, %f0
	flw	%f2, 6(%sp)
	fadd	%f1, %f1, %f2
	fsqrt	%f1, %f1
	flw	%f2, 5(%sp)
	fdiv	%f3, %f2, %f1
	flw	%f4, 4(%sp)
	fblt	%f3, %f4, fbgt_else.19906
	addi	%v1, %zero, 1
	j	fbgt_cont.19907
fbgt_else.19906:
	addi	%v1, %zero, 0
fbgt_cont.19907:
	fabs	%f4, %f3
	flw	%f5, 3(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f1, 17(%sp)
	fblt	%f4, %f5, fbgt_else.19908
	flw	%f3, 451(%zero)
	sw	%v1, 18(%sp)
	fblt	%f4, %f3, fbgt_else.19910
	flw	%f3, 474(%zero)
	fdiv	%f2, %f2, %f4
	fsw	%f3, 19(%sp)
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	kernel_atan.2607
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19911
fbgt_else.19910:
	flw	%f3, 473(%zero)
	fsub	%f5, %f4, %f2
	fadd	%f2, %f4, %f2
	fdiv	%f2, %f5, %f2
	fsw	%f3, 20(%sp)
	fmov	%f0, %f2
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2607
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19911:
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.19912
	j	bnei_cont.19913
bnei_else.19912:
	fneg	%f0, %f0
bnei_cont.19913:
	j	fbgt_cont.19909
fbgt_else.19908:
	fmov	%f0, %f3
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2607
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.19909:
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 21(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	sin.2613
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 21(%sp)
	fsw	%f0, 22(%sp)
	fmov	%f0, %f1
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	cos.2611
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 22(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 17(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 15(%sp)
	flw	%f2, 9(%sp)
	flw	%f3, 2(%sp)
	lw	%v0, 16(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3059
calc_dirvecs.3067:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.19914
	itof	%f1, %v0
	flw	%f2, 481(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 436(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 465(%zero)
	fsw	%f3, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f4, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a0, 5(%sp)
	fsw	%f2, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %a1, 0
	fmov	%f3, %f0
	fmov	%f2, %f1
	fmov	%f1, %f4
	fmov	%f0, %f4
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_dirvec.3059
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 439(%zero)
	fadd	%f0, %f0, %f2
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 2
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	sw	%a0, 8(%sp)
	fsw	%f2, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f0
	fmov	%f1, %f3
	fmov	%f0, %f3
	fmov	%f3, %f4
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_dirvec.3059
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.19915
	addi	%v1, %v1, -5
	j	bgti_cont.19916
bgti_else.19915:
bgti_cont.19916:
	blti	%v0, 0, bgti_else.19917
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 0(%sp)
	fsub	%f2, %f0, %f2
	flw	%f0, 2(%sp)
	flw	%f3, 1(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 5(%sp)
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_dirvec.3059
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 9(%sp)
	fadd	%f2, %f0, %f1
	flw	%f0, 2(%sp)
	flw	%f3, 1(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 10(%sp)
	lw	%a1, 8(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_dirvec.3059
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.19918
	addi	%v1, %v1, -5
	j	bgti_cont.19919
bgti_else.19918:
bgti_cont.19919:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3067
bgti_else.19917:
	jr	%ra
bgti_else.19914:
	jr	%ra
calc_dirvec_rows.3072:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.19922
	itof	%f0, %v0
	flw	%f1, 481(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 436(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 465(%zero)
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f4, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%a0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%a2, 8(%sp)
	addi	%v0, %a1, 0
	fmov	%f2, %f0
	fmov	%f1, %f4
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3059
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 439(%zero)
	fadd	%f2, %f0, %f2
	lw	%v1, 6(%sp)
	addi	%a0, %v1, 2
	flw	%f0, 3(%sp)
	flw	%f3, 2(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3059
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.19923
	addi	%a0, %a0, -5
	j	bgti_cont.19924
bgti_else.19923:
bgti_cont.19924:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3067
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.19925
	addi	%v1, %v1, -5
	j	bgti_cont.19926
bgti_else.19925:
bgti_cont.19926:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.19927
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	fsub	%f0, %f0, %f1
	lw	%a1, 8(%sp)
	sw	%a0, 9(%sp)
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_dirvecs.3067
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.19928
	addi	%v1, %v1, -5
	j	bgti_cont.19929
bgti_else.19928:
bgti_cont.19929:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3072
bgti_else.19927:
	jr	%ra
bgti_else.19922:
	jr	%ra
create_dirvec_elements.3078:
	blti	%v1, 0, bgti_else.19932
	addi	%a0, %zero, 3
	flw	%f0, 465(%zero)
	fsw	%f0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v0, 4(%sp)
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
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19933
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%v1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19934
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
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
	add	%v0, %zero, %v1
	lw	%v1, 8(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19935
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
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
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	create_dirvec_elements.3078
bgti_else.19935:
	jr	%ra
bgti_else.19934:
	jr	%ra
bgti_else.19933:
	jr	%ra
bgti_else.19932:
	jr	%ra
create_dirvecs.3081:
	blti	%v0, 0, bgti_else.19940
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 465(%zero)
	fsw	%f0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v0, 4(%sp)
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
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 2(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 179
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%v1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)
	sw	%v0, 118(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
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
	lw	%v1, 6(%sp)
	sw	%v0, 117(%v1)
	addi	%v0, %zero, 116
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%v1, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 10(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)
	sw	%v0, 116(%v1)
	addi	%v0, %zero, 115
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	create_dirvec_elements.3078
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19941
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
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
	lw	%v0, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 11(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 179
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%v1, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 14(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)
	sw	%v0, 118(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%v1, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 15(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)
	sw	%v0, 117(%v1)
	lw	%v0, 9(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_dirvec_elements.3078
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3081
bgti_else.19941:
	jr	%ra
bgti_else.19940:
	jr	%ra
init_dirvec_constants.3083:
	blti	%v1, 0, bgti_else.19944
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%a1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19945
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.19946
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.19948
	beqi	%t1, 2, bnei_else.19950
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2862
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19951
bnei_else.19950:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2859
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19951:
	j	bnei_cont.19949
bnei_else.19948:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2856
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19949:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.19947
bgti_else.19946:
bgti_cont.19947:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19952
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19953
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.19954
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.19956
	beqi	%t1, 2, bnei_else.19958
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2862
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19959
bnei_else.19958:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2859
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19959:
	j	bnei_cont.19957
bnei_else.19956:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2856
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19957:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.19955
bgti_else.19954:
bgti_cont.19955:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3083
bgti_else.19953:
	jr	%ra
bgti_else.19952:
	jr	%ra
bgti_else.19945:
	jr	%ra
bgti_else.19944:
	jr	%ra
init_vecset_constants.3086:
	blti	%v0, 0, bgti_else.19964
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	addi	%a2, %zero, 0
	lw	%a2, 0(%a2)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.19965
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.19967
	beqi	%t2, 2, bnei_else.19969
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2862
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19970
bnei_else.19969:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2859
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19970:
	j	bnei_cont.19968
bnei_else.19967:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2856
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19968:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.19966
bgti_else.19965:
bgti_cont.19966:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.19971
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.19973
	beqi	%t1, 2, bnei_else.19975
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2862
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19976
bnei_else.19975:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2859
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19976:
	j	bnei_cont.19974
bnei_else.19973:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2856
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19974:
	addi	%v0, %v1, -1
	lw	%a0, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.19972
bgti_else.19971:
bgti_cont.19972:
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19977
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	blti	%a0, 0, bgti_else.19978
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 12(%sp)
	beqi	%t0, 1, bnei_else.19980
	beqi	%t0, 2, bnei_else.19982
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_second_table.2862
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19983
bnei_else.19982:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_surface_table.2859
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19983:
	j	bnei_cont.19981
bnei_else.19980:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_rect_table.2856
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19981:
	addi	%v0, %v1, -1
	lw	%a0, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.19979
bgti_else.19978:
bgti_cont.19979:
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19984
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 14(%sp)
	sw	%v1, 15(%sp)
	blti	%a1, 0, bgti_else.19985
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 16(%sp)
	beqi	%t1, 1, bnei_else.19987
	beqi	%t1, 2, bnei_else.19989
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_second_table.2862
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19990
bnei_else.19989:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_surface_table.2859
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19990:
	j	bnei_cont.19988
bnei_else.19987:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_rect_table.2856
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19988:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.19986
bgti_else.19985:
bgti_cont.19986:
	lw	%v0, 15(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.19991
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3086
bgti_else.19991:
	jr	%ra
bgti_else.19984:
	jr	%ra
bgti_else.19977:
	jr	%ra
bgti_else.19964:
	jr	%ra
setup_rect_reflection.3097:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 469(%zero)
	lw	%v1, 7(%v1)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 78
	flw	%f1, 0(%v1)
	fneg	%f2, %f1
	addi	%v1, %zero, 78
	flw	%f3, 1(%v1)
	fneg	%f4, %f3
	addi	%v1, %zero, 78
	flw	%f5, 2(%v1)
	fneg	%f6, %f5
	addi	%v1, %v0, 1
	addi	%a1, %zero, 3
	flw	%f7, 465(%zero)
	fsw	%f5, 0(%sp)
	fsw	%f3, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f7, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a0, 6(%sp)
	sw	%v1, 7(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f6, 9(%sp)
	fsw	%f4, 10(%sp)
	fsw	%f1, 11(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f7
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	sw	%v0, 12(%sp)
	sw	%v1, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 13(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 10(%sp)
	fsw	%f0, 1(%a0)
	flw	%f1, 9(%sp)
	fsw	%f1, 2(%a0)
	lw	%a1, 12(%sp)
	addi	%a2, %a1, -1
	sw	%a2, 14(%sp)
	sw	%v1, 15(%sp)
	blti	%a2, 0, bgti_else.19996
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.19998
	beqi	%t0, 2, bnei_else.20000
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_second_table.2862
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20001
bnei_else.20000:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_surface_table.2859
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20001:
	j	bnei_cont.19999
bnei_else.19998:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_rect_table.2856
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19999:
	addi	%v0, %v1, -1
	lw	%a0, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.19997
bgti_else.19996:
bgti_cont.19997:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 15(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 7(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 6(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	lw	%v1, 5(%sp)
	addi	%a1, %v1, 2
	flw	%f1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%v0, 17(%sp)
	sw	%a1, 18(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 12(%sp)
	sw	%v1, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 19(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a0)
	flw	%f1, 1(%sp)
	fsw	%f1, 1(%a0)
	flw	%f1, 9(%sp)
	fsw	%f1, 2(%a0)
	lw	%a1, 14(%sp)
	sw	%v1, 20(%sp)
	blti	%a1, 0, bgti_else.20002
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20004
	beqi	%a3, 2, bnei_else.20006
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_second_table.2862
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20007
bnei_else.20006:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_surface_table.2859
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20007:
	j	bnei_cont.20005
bnei_else.20004:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_rect_table.2856
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20005:
	addi	%v0, %v1, -1
	lw	%a0, 20(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.20003
bgti_else.20002:
bgti_cont.20003:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 20(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 18(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 17(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 3
	flw	%f1, 3(%sp)
	lw	%a1, 4(%sp)
	sw	%v1, 22(%sp)
	sw	%a0, 23(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 12(%sp)
	sw	%v1, 24(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 24(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 10(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 0(%sp)
	fsw	%f0, 2(%a0)
	lw	%a1, 14(%sp)
	sw	%v1, 25(%sp)
	blti	%a1, 0, bgti_else.20008
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20010
	beqi	%a3, 2, bnei_else.20012
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_second_table.2862
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20013
bnei_else.20012:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_surface_table.2859
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20013:
	j	bnei_cont.20011
bnei_else.20010:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_rect_table.2856
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20011:
	addi	%v1, %v1, -1
	lw	%v0, 25(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.20009
bgti_else.20008:
bgti_cont.20009:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 25(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 23(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 22(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 434
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3100:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 469(%zero)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	lw	%a1, 4(%v1)
	addi	%a2, %zero, 78
	flw	%f1, 0(%a2)
	flw	%f2, 0(%a1)
	fmul	%f2, %f1, %f2
	addi	%a2, %zero, 78
	flw	%f3, 1(%a2)
	flw	%f4, 1(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f2, %f2, %f4
	addi	%a2, %zero, 78
	flw	%f4, 2(%a2)
	flw	%f5, 2(%a1)
	fmul	%f5, %f4, %f5
	fadd	%f2, %f2, %f5
	flw	%f5, 460(%zero)
	lw	%a1, 4(%v1)
	flw	%f6, 0(%a1)
	fmul	%f6, %f5, %f6
	fmul	%f6, %f6, %f2
	fsub	%f1, %f6, %f1
	lw	%a1, 4(%v1)
	flw	%f6, 1(%a1)
	fmul	%f6, %f5, %f6
	fmul	%f6, %f6, %f2
	fsub	%f3, %f6, %f3
	lw	%v1, 4(%v1)
	flw	%f6, 2(%v1)
	fmul	%f5, %f5, %f6
	fmul	%f2, %f5, %f2
	fsub	%f2, %f2, %f4
	addi	%v1, %zero, 3
	flw	%f4, 465(%zero)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
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
	sw	%v0, 6(%sp)
	sw	%v1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%a0, 7(%sp)
	sw	%a0, 0(%v1)
	flw	%f0, 5(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 4(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 3(%sp)
	fsw	%f0, 2(%a0)
	lw	%a1, 6(%sp)
	addi	%a1, %a1, -1
	sw	%v1, 8(%sp)
	blti	%a1, 0, bgti_else.20015
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20017
	beqi	%a3, 2, bnei_else.20019
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_second_table.2862
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20020
bnei_else.20019:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_surface_table.2859
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20020:
	j	bnei_cont.20018
bnei_else.20017:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_rect_table.2856
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20018:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20016
bgti_else.20015:
bgti_cont.20016:
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 8(%sp)
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
rt.3105:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 154
	sw	%v0, 0(%a1)
	addi	%a1, %zero, 1
	addi	%a2, %zero, 154
	sw	%v1, 1(%a2)
	addi	%a2, %zero, 2
	srl	%a3, %v0, 1
	addi	%t0, %zero, 156
	sw	%a3, 0(%t0)
	srl	%v1, %v1, 1
	addi	%a3, %zero, 156
	sw	%v1, 1(%a3)
	flw	%f0, 435(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 158
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixel.3047
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, -2
	sw	%a0, 4(%sp)
	blti	%a0, 0, bgti_else.20022
	addi	%a1, %zero, 3
	flw	%f0, 465(%zero)
	sw	%v0, 5(%sp)
	fsw	%f0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 9(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 9(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 9(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 1(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_float_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 9(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 16(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 16(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 16(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 6(%sp)
	lw	%v0, 7(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 16(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 15(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 14(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 11(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 10(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.20024
	sw	%v0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	create_pixel.3047
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_line_elements.3049
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20025
bgti_else.20024:
	add	%v0, %zero, %a0
bgti_cont.20025:
	j	bgti_cont.20023
bgti_else.20022:
bgti_cont.20023:
	sw	%v0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	create_pixel.3047
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 4(%sp)
	blti	%v1, 0, bgti_else.20026
	addi	%a0, %zero, 3
	flw	%f0, 465(%zero)
	sw	%v0, 19(%sp)
	fsw	%f0, 20(%sp)
	sw	%a0, 21(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_create_float_array
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 22(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%v0, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 23(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 23(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 23(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 23(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 28(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 1(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 23(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f0, 20(%sp)
	lw	%v1, 21(%sp)
	sw	%v0, 30(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 20(%sp)
	lw	%v0, 21(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 29(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 28(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 27(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 26(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 25(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 24(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 22(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 4(%sp)
	lw	%a0, 19(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.20028
	sw	%v0, 31(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	create_pixel.3047
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 19(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	init_line_elements.3049
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.20029
bgti_else.20028:
	add	%v0, %zero, %a0
bgti_cont.20029:
	j	bgti_cont.20027
bgti_else.20026:
bgti_cont.20027:
	sw	%v0, 32(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	create_pixel.3047
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 4(%sp)
	blti	%v1, 0, bgti_else.20030
	addi	%a0, %zero, 3
	flw	%f0, 465(%zero)
	sw	%v0, 33(%sp)
	fsw	%f0, 34(%sp)
	sw	%a0, 35(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%v0, 37(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 37(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 37(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 39(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 40(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_float_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 37(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 37(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 42(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 1(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_create_float_array
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 37(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_create_array
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	flw	%f0, 34(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 44(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_float_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v1, 44(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_float_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v1, 44(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_float_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v1, 44(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 34(%sp)
	lw	%v0, 35(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_float_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v1, 44(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 43(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 42(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 41(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 40(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 39(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 38(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 36(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 4(%sp)
	lw	%a0, 33(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.20032
	sw	%v0, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	create_pixel.3047
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	lw	%a0, 33(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	init_line_elements.3049
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.20033
bgti_else.20032:
	add	%v0, %zero, %a0
bgti_cont.20033:
	j	bgti_cont.20031
bgti_else.20030:
bgti_cont.20031:
	sw	%v0, 46(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	read_screen_settings.2751
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_int
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f1, 463(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 47(%sp)
	fsw	%f1, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	sin.2613
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 1(%v0)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_read_float
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	flw	%f1, 48(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 47(%sp)
	fsw	%f0, 49(%sp)
	fmov	%f0, %f1
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	cos.2611
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	flw	%f1, 49(%sp)
	fsw	%f0, 50(%sp)
	fmov	%f0, %f1
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	sin.2613
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 0(%v0)
	flw	%f0, 49(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	cos.2611
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 2(%v0)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_read_float
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	addi	%v0, %zero, 81
	fsw	%f0, 0(%v0)
	lw	%v0, 2(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2758
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20034
	lw	%v0, 1(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2758
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20036
	lw	%v0, 0(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2758
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20038
	addi	%v0, %zero, 3
	sw	%v0, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	read_nth_object.2758
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	beqi	%v0, 0, bnei_else.20040
	addi	%v0, %zero, 4
	sw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_nth_object.2758
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	beqi	%v0, 0, bnei_else.20042
	addi	%v0, %zero, 5
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_object.2760
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	bnei_cont.20043
bnei_else.20042:
	addi	%v0, %zero, 0
	lw	%v1, 52(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20043:
	j	bnei_cont.20041
bnei_else.20040:
	addi	%v0, %zero, 0
	lw	%v1, 51(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20041:
	j	bnei_cont.20039
bnei_else.20038:
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20039:
	j	bnei_cont.20037
bnei_else.20036:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20037:
	j	bnei_cont.20035
bnei_else.20034:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20035:
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_read_int
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.20044
	lw	%v1, 1(%sp)
	sw	%v0, 53(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2764
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.20045
bnei_else.20044:
	lw	%v0, 1(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
bnei_cont.20045:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20046
	addi	%v1, %zero, 83
	sw	%v0, 0(%v1)
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2764
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20048
	addi	%v1, %zero, 83
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_and_network.2768
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	bnei_cont.20049
bnei_else.20048:
bnei_cont.20049:
	j	bnei_cont.20047
bnei_else.20046:
bnei_cont.20047:
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_or_network.2766
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	addi	%v1, %zero, 134
	sw	%v0, 0(%v1)
	addi	%v0, %zero, 80
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_print_char
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_print_char
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	addi	%v0, %zero, 10
	sw	%v0, 54(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_print_char
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	print_int.2622
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 55(%sp)
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_print_char
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
	sw	%v0, 56(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	print_int.2622
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	lw	%v0, 55(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	min_caml_print_char
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	print_int.2622
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	lw	%v0, 54(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	min_caml_print_char
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	addi	%v0, %zero, 4
	sw	%v0, 57(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	create_dirvecs.3081
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	addi	%v0, %zero, 9
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	calc_dirvec_rows.3072
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	addi	%v1, %zero, 119
	lw	%a0, 119(%v0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%a1, 58(%sp)
	sw	%v1, 59(%sp)
	sw	%v0, 60(%sp)
	blti	%a1, 0, bgti_else.20050
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 61(%sp)
	beqi	%t1, 1, bnei_else.20052
	beqi	%t1, 2, bnei_else.20054
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_second_table.2862
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20055
bnei_else.20054:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_table.2859
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20055:
	j	bnei_cont.20053
bnei_else.20052:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_table.2856
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20053:
	addi	%v0, %v1, -1
	lw	%a0, 61(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	bgti_cont.20051
bgti_else.20050:
bgti_cont.20051:
	addi	%v1, %zero, 118
	lw	%v0, 60(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	addi	%v0, %zero, 179
	lw	%v0, 3(%v0)
	lw	%v1, 59(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3083
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_vecset_constants.3086
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
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
	addi	%v0, %zero, 247
	lw	%v1, 58(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2865
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 58(%sp)
	blti	%v0, 0, bgti_else.20056
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.20058
	j	bnei_cont.20059
bnei_else.20058:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 469(%zero)
	fblt	%f0, %f1, fbgt_else.20060
	addi	%a0, %zero, 0
	j	fbgt_cont.20061
fbgt_else.20060:
	addi	%a0, %zero, 1
fbgt_cont.20061:
	beqi	%a0, 0, bnei_else.20062
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.20064
	beqi	%a0, 2, bnei_else.20066
	j	bnei_cont.20067
bnei_else.20066:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_reflection.3100
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20067:
	j	bnei_cont.20065
bnei_else.20064:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_reflection.3097
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20065:
	j	bnei_cont.20063
bnei_else.20062:
bnei_cont.20063:
bnei_cont.20059:
	j	bgti_cont.20057
bgti_else.20056:
bgti_cont.20057:
	addi	%v0, %zero, 158
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 156
	lw	%v0, 1(%v0)
	lw	%a0, 2(%sp)
	sub	%v1, %a0, %v0
	itof	%f1, %v1
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 168
	flw	%f2, 0(%v1)
	fmul	%f3, %f1, %f2
	addi	%v1, %zero, 171
	flw	%f4, 0(%v1)
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 168
	flw	%f5, 1(%v1)
	fmul	%f6, %f1, %f5
	addi	%v1, %zero, 171
	flw	%f7, 1(%v1)
	fadd	%f6, %f6, %f7
	addi	%v1, %zero, 168
	flw	%f8, 2(%v1)
	fmul	%f1, %f1, %f8
	addi	%v1, %zero, 171
	flw	%f9, 2(%v1)
	fadd	%f1, %f1, %f9
	lw	%v1, 3(%sp)
	addi	%v1, %v1, -1
	lw	%a1, 32(%sp)
	sw	%v1, 63(%sp)
	fsw	%f9, 64(%sp)
	fsw	%f8, 65(%sp)
	fsw	%f7, 66(%sp)
	fsw	%f5, 67(%sp)
	fsw	%f4, 68(%sp)
	fsw	%f2, 69(%sp)
	fsw	%f0, 70(%sp)
	sw	%v0, 71(%sp)
	addi	%v0, %a1, 0
	fmov	%f2, %f1
	fmov	%f0, %f3
	fmov	%f1, %f6
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	pretrace_pixels.3022
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 56(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20068
	jr	%ra
bgt_else.20068:
	addi	%v0, %v0, -1
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20070
	j	bgt_cont.20071
bgt_else.20070:
	lw	%v0, 71(%sp)
	lw	%v1, 1(%sp)
	sub	%v0, %v1, %v0
	itof	%f0, %v0
	flw	%f1, 70(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 69(%sp)
	fmul	%f1, %f0, %f1
	flw	%f2, 68(%sp)
	fadd	%f1, %f1, %f2
	flw	%f2, 67(%sp)
	fmul	%f2, %f0, %f2
	flw	%f3, 66(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 65(%sp)
	fmul	%f0, %f0, %f3
	flw	%f3, 64(%sp)
	fadd	%f0, %f0, %f3
	lw	%v0, 46(%sp)
	lw	%a0, 63(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	pretrace_pixels.3022
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
bgt_cont.20071:
	lw	%v0, 2(%sp)
	lw	%a0, 18(%sp)
	lw	%a1, 32(%sp)
	lw	%a2, 46(%sp)
	addi	%v1, %v0, 0
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	scan_pixel.3033
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 32(%sp)
	lw	%a0, 46(%sp)
	lw	%a1, 18(%sp)
	lw	%a2, 57(%sp)
	j	scan_line.3039
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f0, 465(%zero)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 1
	sw	%v0, 10(%a0)
	sw	%v0, 9(%a0)
	sw	%v0, 8(%a0)
	sw	%v0, 7(%a0)
	lw	%a1, 1(%sp)
	sw	%a1, 6(%a0)
	sw	%v0, 5(%a0)
	sw	%v0, 4(%a0)
	sw	%a1, 3(%a0)
	sw	%a1, 2(%a0)
	sw	%a1, 1(%a0)
	sw	%a1, 0(%a0)
	add	%v0, %zero, %a0
	addi	%a0, %zero, 12
	addi	%v0, %zero, 1
	sw	%v1, 3(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_extarray
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 75
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 78
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f0, 447(%zero)
	addi	%v1, %zero, 81
	lw	%v0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 83
	lw	%v1, 0(%v0)
	addi	%a0, %zero, 133
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 135
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 136
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f0, 456(%zero)
	addi	%v1, %zero, 137
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 138
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 141
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 142
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 145
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 148
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 151
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154
	lw	%v1, 1(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a0, %zero, 156
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 158
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 159
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 162
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 165
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 168
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 171
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 174
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 177
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	lw	%a1, 1(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 177
	sw	%v0, 1(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%a1, 3(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 247
	sw	%v0, 1(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 249
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	lw	%a1, 1(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 249
	sw	%v0, 1(%v1)
	lw	%v0, 9(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 251
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%a0)
	sw	%v0, 1(%a0)
	lw	%v0, 1(%sp)
	sw	%v0, 0(%a0)
	addi	%a0, %zero, 254
	addi	%a1, %zero, 251
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a0, %zero, 434
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 128
	addi	%v1, %v0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	rt.3105
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%g0, %zero, 0
	ret
