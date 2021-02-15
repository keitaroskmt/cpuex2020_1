.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 496
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
reduction_2pi_sub1.2626:
	fblt	%f0, %f1, fbgt_else.32193
	flw	%f16, 495(%zero)
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32194
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32195
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32196
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32197
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32198
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32199
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32200
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32201
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32202
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32203
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32204
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32205
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32206
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32207
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.32208
	fmul	%f1, %f16, %f1
	j	reduction_2pi_sub1.2626
fbgt_else.32208:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32207:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32206:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32205:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32204:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32203:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32202:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32201:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32200:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32199:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32198:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32197:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32196:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32195:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32194:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.32193:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.32319
	fblt	%f0, %f1, fbgt_else.32320
	fsub	%f0, %f0, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32321
	fblt	%f0, %f1, fbgt_else.32322
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32323
	fblt	%f0, %f1, fbgt_else.32324
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32325
	fblt	%f0, %f1, fbgt_else.32326
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32326:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32325:
	jr	%ra
fbgt_else.32324:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32327
	fblt	%f0, %f1, fbgt_else.32328
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32328:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32327:
	jr	%ra
fbgt_else.32323:
	jr	%ra
fbgt_else.32322:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32329
	fblt	%f0, %f1, fbgt_else.32330
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32331
	fblt	%f0, %f1, fbgt_else.32332
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32332:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32331:
	jr	%ra
fbgt_else.32330:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32333
	fblt	%f0, %f1, fbgt_else.32334
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32334:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32333:
	jr	%ra
fbgt_else.32329:
	jr	%ra
fbgt_else.32321:
	jr	%ra
fbgt_else.32320:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32335
	fblt	%f0, %f1, fbgt_else.32336
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32337
	fblt	%f0, %f1, fbgt_else.32338
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32339
	fblt	%f0, %f1, fbgt_else.32340
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32340:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32339:
	jr	%ra
fbgt_else.32338:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32341
	fblt	%f0, %f1, fbgt_else.32342
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32342:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32341:
	jr	%ra
fbgt_else.32337:
	jr	%ra
fbgt_else.32336:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32343
	fblt	%f0, %f1, fbgt_else.32344
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32345
	fblt	%f0, %f1, fbgt_else.32346
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32346:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32345:
	jr	%ra
fbgt_else.32344:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.32347
	fblt	%f0, %f1, fbgt_else.32348
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32348:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.32347:
	jr	%ra
fbgt_else.32343:
	jr	%ra
fbgt_else.32335:
	jr	%ra
fbgt_else.32319:
	jr	%ra
print_int_sub1.2641:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.32417
	blti	%a0, 20, bgti_else.32418
	blti	%a0, 30, bgti_else.32419
	blti	%a0, 40, bgti_else.32420
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.32421
	blti	%a0, 20, bgti_else.32422
	blti	%a0, 30, bgti_else.32423
	blti	%a0, 40, bgti_else.32424
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.32425
	blti	%a0, 20, bgti_else.32426
	blti	%a0, 30, bgti_else.32427
	blti	%a0, 40, bgti_else.32428
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.32429
	blti	%a0, 20, bgti_else.32430
	blti	%a0, 30, bgti_else.32431
	blti	%a0, 40, bgti_else.32432
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2641
bgti_else.32432:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.32431:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.32430:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.32429:
	jr	%ra
bgti_else.32428:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.32427:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.32426:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.32425:
	jr	%ra
bgti_else.32424:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.32423:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.32422:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.32421:
	jr	%ra
bgti_else.32420:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.32419:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.32418:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.32417:
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.32549
	blti	%v0, 20, bgti_else.32550
	blti	%v0, 30, bgti_else.32551
	blti	%v0, 40, bgti_else.32552
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32553
	blti	%v0, 20, bgti_else.32554
	blti	%v0, 30, bgti_else.32555
	blti	%v0, 40, bgti_else.32556
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32557
	blti	%v0, 20, bgti_else.32558
	blti	%v0, 30, bgti_else.32559
	blti	%v0, 40, bgti_else.32560
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32561
	blti	%v0, 20, bgti_else.32562
	blti	%v0, 30, bgti_else.32563
	blti	%v0, 40, bgti_else.32564
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32565
	blti	%v0, 20, bgti_else.32566
	blti	%v0, 30, bgti_else.32567
	blti	%v0, 40, bgti_else.32568
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32569
	blti	%v0, 20, bgti_else.32570
	blti	%v0, 30, bgti_else.32571
	blti	%v0, 40, bgti_else.32572
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32573
	blti	%v0, 20, bgti_else.32574
	blti	%v0, 30, bgti_else.32575
	blti	%v0, 40, bgti_else.32576
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.32577
	blti	%v0, 20, bgti_else.32578
	blti	%v0, 30, bgti_else.32579
	blti	%v0, 40, bgti_else.32580
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.32580:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32579:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32578:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32577:
	jr	%ra
bgti_else.32576:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32575:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32574:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32573:
	jr	%ra
bgti_else.32572:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32571:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32570:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32569:
	jr	%ra
bgti_else.32568:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32567:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32566:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32565:
	jr	%ra
bgti_else.32564:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32563:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32562:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32561:
	jr	%ra
bgti_else.32560:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32559:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32558:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32557:
	jr	%ra
bgti_else.32556:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32555:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32554:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32553:
	jr	%ra
bgti_else.32552:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.32551:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.32550:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.32549:
	jr	%ra
rotate_quadratic_matrix.2779:
	add	%a0, %zero, %ra
	flw	%f18, 0(%v1)
	flw	%f19, 494(%zero)
	fabs	%f17, %f18
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.32998
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.32999
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.32999
fbgt_else.33022:
fbgt_cont.33023:
	j	fbgt_cont.32999
fbgt_else.33020:
fbgt_cont.33021:
	j	fbgt_cont.32999
fbgt_else.33018:
fbgt_cont.33019:
	j	fbgt_cont.32999
fbgt_else.33016:
fbgt_cont.33017:
	j	fbgt_cont.32999
fbgt_else.33014:
fbgt_cont.33015:
	j	fbgt_cont.32999
fbgt_else.33012:
fbgt_cont.33013:
	j	fbgt_cont.32999
fbgt_else.33010:
fbgt_cont.33011:
	j	fbgt_cont.32999
fbgt_else.33008:
fbgt_cont.33009:
	j	fbgt_cont.32999
fbgt_else.33006:
fbgt_cont.33007:
	j	fbgt_cont.32999
fbgt_else.33004:
fbgt_cont.33005:
	j	fbgt_cont.32999
fbgt_else.33002:
fbgt_cont.33003:
	j	fbgt_cont.32999
fbgt_else.33000:
fbgt_cont.33001:
	j	fbgt_cont.32999
fbgt_else.32998:
	fmov	%f1, %f2
fbgt_cont.32999:
	fblt	%f17, %f2, fbgt_else.33024
	fblt	%f17, %f1, fbgt_else.33026
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33025
fbgt_else.33026:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33027:
	j	fbgt_cont.33025
fbgt_else.33024:
fbgt_cont.33025:
	fblt	%f17, %f19, fbgt_else.33028
	add	%a1, %zero, %zero
	j	fbgt_cont.33029
fbgt_else.33028:
	add	%a1, %zero, %k1
fbgt_cont.33029:
	fblt	%f17, %f19, fbgt_else.33030
	fsub	%f17, %f17, %f19
	j	fbgt_cont.33031
fbgt_else.33030:
fbgt_cont.33031:
	flw	%f20, 479(%zero)
	fblt	%f17, %f20, fbgt_else.33032
	beqi	%a1, 0, bnei_else.33034
	add	%a1, %zero, %zero
	j	fbgt_cont.33033
bnei_else.33034:
	add	%a1, %zero, %k1
bnei_cont.33035:
	j	fbgt_cont.33033
fbgt_else.33032:
fbgt_cont.33033:
	fblt	%f17, %f20, fbgt_else.33036
	fsub	%f17, %f19, %f17
	j	fbgt_cont.33037
fbgt_else.33036:
fbgt_cont.33037:
	flw	%f21, 478(%zero)
	fblt	%f21, %f17, fbgt_else.33038
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.33039
fbgt_else.33038:
	fsub	%f22, %f20, %f17
	fmul	%f16, %f22, %f22
	fmul	%f17, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f17, %f1, %f0
fbgt_cont.33039:
	beqi	%a1, 0, bnei_else.33040
	j	bnei_cont.33041
bnei_else.33040:
	fneg	%f17, %f17
bnei_cont.33041:
	fblt	%f18, %fzero, fbgt_else.33042
	add	%a1, %zero, %k1
	j	fbgt_cont.33043
fbgt_else.33042:
	add	%a1, %zero, %zero
fbgt_cont.33043:
	fabs	%f18, %f18
	fblt	%f18, %f2, fbgt_else.33044
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 481(%zero)
	fblt	%f18, %f1, fbgt_cont.33045
	flw	%f1, 480(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33045
fbgt_else.33068:
fbgt_cont.33069:
	j	fbgt_cont.33045
fbgt_else.33066:
fbgt_cont.33067:
	j	fbgt_cont.33045
fbgt_else.33064:
fbgt_cont.33065:
	j	fbgt_cont.33045
fbgt_else.33062:
fbgt_cont.33063:
	j	fbgt_cont.33045
fbgt_else.33060:
fbgt_cont.33061:
	j	fbgt_cont.33045
fbgt_else.33058:
fbgt_cont.33059:
	j	fbgt_cont.33045
fbgt_else.33056:
fbgt_cont.33057:
	j	fbgt_cont.33045
fbgt_else.33054:
fbgt_cont.33055:
	j	fbgt_cont.33045
fbgt_else.33052:
fbgt_cont.33053:
	j	fbgt_cont.33045
fbgt_else.33050:
fbgt_cont.33051:
	j	fbgt_cont.33045
fbgt_else.33048:
fbgt_cont.33049:
	j	fbgt_cont.33045
fbgt_else.33046:
fbgt_cont.33047:
	j	fbgt_cont.33045
fbgt_else.33044:
	fmov	%f1, %f2
fbgt_cont.33045:
	fblt	%f18, %f2, fbgt_else.33070
	fblt	%f18, %f1, fbgt_else.33072
	fsub	%f0, %f18, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33071
fbgt_else.33072:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33073:
	j	fbgt_cont.33071
fbgt_else.33070:
fbgt_cont.33071:
	fblt	%f18, %f19, fbgt_else.33074
	beqi	%a1, 0, bnei_else.33076
	add	%a1, %zero, %zero
	j	fbgt_cont.33075
bnei_else.33076:
	add	%a1, %zero, %k1
bnei_cont.33077:
	j	fbgt_cont.33075
fbgt_else.33074:
fbgt_cont.33075:
	fblt	%f18, %f19, fbgt_else.33078
	fsub	%f18, %f18, %f19
	j	fbgt_cont.33079
fbgt_else.33078:
fbgt_cont.33079:
	fblt	%f18, %f20, fbgt_else.33080
	fsub	%f18, %f19, %f18
	j	fbgt_cont.33081
fbgt_else.33080:
fbgt_cont.33081:
	fblt	%f21, %f18, fbgt_else.33082
	fmul	%f22, %f18, %f18
	fmul	%f16, %f22, %f22
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f22
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.33083
fbgt_else.33082:
	fsub	%f0, %f20, %f18
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.33083:
	beqi	%a1, 0, bnei_else.33084
	j	bnei_cont.33085
bnei_else.33084:
	fneg	%f18, %f18
bnei_cont.33085:
	flw	%f23, 1(%v1)
	fabs	%f22, %f23
	fblt	%f22, %f2, fbgt_else.33086
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 481(%zero)
	fblt	%f22, %f1, fbgt_cont.33087
	flw	%f1, 480(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33087
fbgt_else.33110:
fbgt_cont.33111:
	j	fbgt_cont.33087
fbgt_else.33108:
fbgt_cont.33109:
	j	fbgt_cont.33087
fbgt_else.33106:
fbgt_cont.33107:
	j	fbgt_cont.33087
fbgt_else.33104:
fbgt_cont.33105:
	j	fbgt_cont.33087
fbgt_else.33102:
fbgt_cont.33103:
	j	fbgt_cont.33087
fbgt_else.33100:
fbgt_cont.33101:
	j	fbgt_cont.33087
fbgt_else.33098:
fbgt_cont.33099:
	j	fbgt_cont.33087
fbgt_else.33096:
fbgt_cont.33097:
	j	fbgt_cont.33087
fbgt_else.33094:
fbgt_cont.33095:
	j	fbgt_cont.33087
fbgt_else.33092:
fbgt_cont.33093:
	j	fbgt_cont.33087
fbgt_else.33090:
fbgt_cont.33091:
	j	fbgt_cont.33087
fbgt_else.33088:
fbgt_cont.33089:
	j	fbgt_cont.33087
fbgt_else.33086:
	fmov	%f1, %f2
fbgt_cont.33087:
	fblt	%f22, %f2, fbgt_else.33112
	fblt	%f22, %f1, fbgt_else.33114
	fsub	%f0, %f22, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.33113
fbgt_else.33114:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.33115:
	j	fbgt_cont.33113
fbgt_else.33112:
fbgt_cont.33113:
	fblt	%f22, %f19, fbgt_else.33116
	add	%a1, %zero, %zero
	j	fbgt_cont.33117
fbgt_else.33116:
	add	%a1, %zero, %k1
fbgt_cont.33117:
	fblt	%f22, %f19, fbgt_else.33118
	fsub	%f22, %f22, %f19
	j	fbgt_cont.33119
fbgt_else.33118:
fbgt_cont.33119:
	fblt	%f22, %f20, fbgt_else.33120
	beqi	%a1, 0, bnei_else.33122
	add	%a1, %zero, %zero
	j	fbgt_cont.33121
bnei_else.33122:
	add	%a1, %zero, %k1
bnei_cont.33123:
	j	fbgt_cont.33121
fbgt_else.33120:
fbgt_cont.33121:
	fblt	%f22, %f20, fbgt_else.33124
	fsub	%f22, %f19, %f22
	j	fbgt_cont.33125
fbgt_else.33124:
fbgt_cont.33125:
	fblt	%f21, %f22, fbgt_else.33126
	fmul	%f22, %f22, %f22
	fmul	%f16, %f22, %f22
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
	j	fbgt_cont.33127
fbgt_else.33126:
	fsub	%f24, %f20, %f22
	fmul	%f22, %f24, %f24
	fmul	%f16, %f22, %f22
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
fbgt_cont.33127:
	beqi	%a1, 0, bnei_else.33128
	j	bnei_cont.33129
bnei_else.33128:
	fneg	%f22, %f22
bnei_cont.33129:
	fblt	%f23, %fzero, fbgt_else.33130
	add	%a1, %zero, %k1
	j	fbgt_cont.33131
fbgt_else.33130:
	add	%a1, %zero, %zero
fbgt_cont.33131:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.33132
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 481(%zero)
	fblt	%f23, %f1, fbgt_cont.33133
	flw	%f1, 480(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33133
fbgt_else.33156:
fbgt_cont.33157:
	j	fbgt_cont.33133
fbgt_else.33154:
fbgt_cont.33155:
	j	fbgt_cont.33133
fbgt_else.33152:
fbgt_cont.33153:
	j	fbgt_cont.33133
fbgt_else.33150:
fbgt_cont.33151:
	j	fbgt_cont.33133
fbgt_else.33148:
fbgt_cont.33149:
	j	fbgt_cont.33133
fbgt_else.33146:
fbgt_cont.33147:
	j	fbgt_cont.33133
fbgt_else.33144:
fbgt_cont.33145:
	j	fbgt_cont.33133
fbgt_else.33142:
fbgt_cont.33143:
	j	fbgt_cont.33133
fbgt_else.33140:
fbgt_cont.33141:
	j	fbgt_cont.33133
fbgt_else.33138:
fbgt_cont.33139:
	j	fbgt_cont.33133
fbgt_else.33136:
fbgt_cont.33137:
	j	fbgt_cont.33133
fbgt_else.33134:
fbgt_cont.33135:
	j	fbgt_cont.33133
fbgt_else.33132:
	fmov	%f1, %f2
fbgt_cont.33133:
	fblt	%f23, %f2, fbgt_else.33158
	fblt	%f23, %f1, fbgt_else.33160
	fsub	%f0, %f23, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.33159
fbgt_else.33160:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.33161:
	j	fbgt_cont.33159
fbgt_else.33158:
fbgt_cont.33159:
	fblt	%f23, %f19, fbgt_else.33162
	beqi	%a1, 0, bnei_else.33164
	add	%a1, %zero, %zero
	j	fbgt_cont.33163
bnei_else.33164:
	add	%a1, %zero, %k1
bnei_cont.33165:
	j	fbgt_cont.33163
fbgt_else.33162:
fbgt_cont.33163:
	fblt	%f23, %f19, fbgt_else.33166
	fsub	%f23, %f23, %f19
	j	fbgt_cont.33167
fbgt_else.33166:
fbgt_cont.33167:
	fblt	%f23, %f20, fbgt_else.33168
	fsub	%f23, %f19, %f23
	j	fbgt_cont.33169
fbgt_else.33168:
fbgt_cont.33169:
	fblt	%f21, %f23, fbgt_else.33170
	fmul	%f24, %f23, %f23
	fmul	%f16, %f24, %f24
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f24
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.33171
fbgt_else.33170:
	fsub	%f0, %f20, %f23
	fmul	%f23, %f0, %f0
	fmul	%f16, %f23, %f23
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
fbgt_cont.33171:
	beqi	%a1, 0, bnei_else.33172
	j	bnei_cont.33173
bnei_else.33172:
	fneg	%f23, %f23
bnei_cont.33173:
	flw	%f25, 2(%v1)
	fabs	%f24, %f25
	fblt	%f24, %f2, fbgt_else.33174
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 481(%zero)
	fblt	%f24, %f1, fbgt_cont.33175
	flw	%f1, 480(%zero)
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33175
fbgt_else.33198:
fbgt_cont.33199:
	j	fbgt_cont.33175
fbgt_else.33196:
fbgt_cont.33197:
	j	fbgt_cont.33175
fbgt_else.33194:
fbgt_cont.33195:
	j	fbgt_cont.33175
fbgt_else.33192:
fbgt_cont.33193:
	j	fbgt_cont.33175
fbgt_else.33190:
fbgt_cont.33191:
	j	fbgt_cont.33175
fbgt_else.33188:
fbgt_cont.33189:
	j	fbgt_cont.33175
fbgt_else.33186:
fbgt_cont.33187:
	j	fbgt_cont.33175
fbgt_else.33184:
fbgt_cont.33185:
	j	fbgt_cont.33175
fbgt_else.33182:
fbgt_cont.33183:
	j	fbgt_cont.33175
fbgt_else.33180:
fbgt_cont.33181:
	j	fbgt_cont.33175
fbgt_else.33178:
fbgt_cont.33179:
	j	fbgt_cont.33175
fbgt_else.33176:
fbgt_cont.33177:
	j	fbgt_cont.33175
fbgt_else.33174:
	fmov	%f1, %f2
fbgt_cont.33175:
	fblt	%f24, %f2, fbgt_else.33200
	fblt	%f24, %f1, fbgt_else.33202
	fsub	%f0, %f24, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
	j	fbgt_cont.33201
fbgt_else.33202:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
fbgt_cont.33203:
	j	fbgt_cont.33201
fbgt_else.33200:
fbgt_cont.33201:
	fblt	%f24, %f19, fbgt_else.33204
	add	%a1, %zero, %zero
	j	fbgt_cont.33205
fbgt_else.33204:
	add	%a1, %zero, %k1
fbgt_cont.33205:
	fblt	%f24, %f19, fbgt_else.33206
	fsub	%f24, %f24, %f19
	j	fbgt_cont.33207
fbgt_else.33206:
fbgt_cont.33207:
	fblt	%f24, %f20, fbgt_else.33208
	beqi	%a1, 0, bnei_else.33210
	add	%a1, %zero, %zero
	j	fbgt_cont.33209
bnei_else.33210:
	add	%a1, %zero, %k1
bnei_cont.33211:
	j	fbgt_cont.33209
fbgt_else.33208:
fbgt_cont.33209:
	fblt	%f24, %f20, fbgt_else.33212
	fsub	%f24, %f19, %f24
	j	fbgt_cont.33213
fbgt_else.33212:
fbgt_cont.33213:
	fblt	%f21, %f24, fbgt_else.33214
	fmul	%f24, %f24, %f24
	fmul	%f16, %f24, %f24
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
	j	fbgt_cont.33215
fbgt_else.33214:
	fsub	%f26, %f20, %f24
	fmul	%f24, %f26, %f26
	fmul	%f16, %f24, %f24
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fsub	%f1, %f26, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
fbgt_cont.33215:
	beqi	%a1, 0, bnei_else.33216
	j	bnei_cont.33217
bnei_else.33216:
	fneg	%f24, %f24
bnei_cont.33217:
	fblt	%f25, %fzero, fbgt_else.33218
	add	%a1, %zero, %k1
	j	fbgt_cont.33219
fbgt_else.33218:
	add	%a1, %zero, %zero
fbgt_cont.33219:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.33220
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 481(%zero)
	fblt	%f25, %f1, fbgt_cont.33221
	flw	%f1, 480(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33221
fbgt_else.33244:
fbgt_cont.33245:
	j	fbgt_cont.33221
fbgt_else.33242:
fbgt_cont.33243:
	j	fbgt_cont.33221
fbgt_else.33240:
fbgt_cont.33241:
	j	fbgt_cont.33221
fbgt_else.33238:
fbgt_cont.33239:
	j	fbgt_cont.33221
fbgt_else.33236:
fbgt_cont.33237:
	j	fbgt_cont.33221
fbgt_else.33234:
fbgt_cont.33235:
	j	fbgt_cont.33221
fbgt_else.33232:
fbgt_cont.33233:
	j	fbgt_cont.33221
fbgt_else.33230:
fbgt_cont.33231:
	j	fbgt_cont.33221
fbgt_else.33228:
fbgt_cont.33229:
	j	fbgt_cont.33221
fbgt_else.33226:
fbgt_cont.33227:
	j	fbgt_cont.33221
fbgt_else.33224:
fbgt_cont.33225:
	j	fbgt_cont.33221
fbgt_else.33222:
fbgt_cont.33223:
	j	fbgt_cont.33221
fbgt_else.33220:
	fmov	%f1, %f2
fbgt_cont.33221:
	fblt	%f25, %f2, fbgt_else.33246
	fblt	%f25, %f1, fbgt_else.33248
	fsub	%f0, %f25, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.33247
fbgt_else.33248:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.33249:
	j	fbgt_cont.33247
fbgt_else.33246:
fbgt_cont.33247:
	fblt	%f25, %f19, fbgt_else.33250
	beqi	%a1, 0, bnei_else.33252
	add	%a1, %zero, %zero
	j	fbgt_cont.33251
bnei_else.33252:
	add	%a1, %zero, %k1
bnei_cont.33253:
	j	fbgt_cont.33251
fbgt_else.33250:
fbgt_cont.33251:
	fblt	%f25, %f19, fbgt_else.33254
	fsub	%f25, %f25, %f19
	j	fbgt_cont.33255
fbgt_else.33254:
fbgt_cont.33255:
	fblt	%f25, %f20, fbgt_else.33256
	fsub	%f25, %f19, %f25
	j	fbgt_cont.33257
fbgt_else.33256:
fbgt_cont.33257:
	fblt	%f21, %f25, fbgt_else.33258
	fmul	%f19, %f25, %f25
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f19
	fsub	%f1, %f25, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33259
fbgt_else.33258:
	fsub	%f0, %f20, %f25
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.33259:
	beqi	%a1, 0, bnei_else.33260
	j	bnei_cont.33261
bnei_else.33260:
	fneg	%f0, %f0
bnei_cont.33261:
	fmul	%f1, %f22, %f24
	fmul	%f20, %f18, %f23
	fmul	%f19, %f20, %f24
	fmul	%f16, %f17, %f0
	fsub	%f2, %f19, %f16
	fmul	%f21, %f17, %f23
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0
	fmul	%f20, %f20, %f0
	fmul	%f19, %f17, %f24
	fadd	%f19, %f20, %f19
	fmul	%f20, %f21, %f0
	fmul	%f0, %f18, %f24
	fsub	%f24, %f20, %f0
	fneg	%f23, %f23
	fmul	%f18, %f18, %f22
	fmul	%f21, %f17, %f22
	flw	%f27, 0(%v0)
	flw	%f17, 1(%v0)
	flw	%f26, 2(%v0)
	fmul	%f0, %f1, %f1
	fmul	%f20, %f27, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f2
	fmul	%f20, %f27, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f18, %f18
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f16, %f16
	fmul	%f20, %f27, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 2(%v0)
	flw	%f20, 495(%zero)
	fmul	%f0, %f27, %f2
	fmul	%f22, %f0, %f16
	fmul	%f0, %f17, %f19
	fmul	%f0, %f0, %f24
	fadd	%f22, %f22, %f0
	fmul	%f0, %f26, %f18
	fmul	%f0, %f0, %f21
	fadd	%f0, %f22, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 0(%v1)
	fmul	%f22, %f27, %f1
	fmul	%f1, %f22, %f16
	fmul	%f17, %f17, %f25
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f23
	fmul	%f0, %f16, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 1(%v1)
	fmul	%f1, %f22, %f2
	fmul	%f0, %f17, %f19
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2782:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.33712
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	addi	%s1, %zero, 3
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s2, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s2)
	jal	min_caml_read_float
	fsw	%f0, 1(%s2)
	addi	%s5, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s2)
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	jal	min_caml_read_float
	fsw	%f0, 2(%s3)
	jal	min_caml_read_float
	fblt	%f0, %fzero, fbgt_else.33713
	add	%s4, %zero, %zero
	j	fbgt_cont.33714
fbgt_else.33713:
	add	%s4, %zero, %k1
fbgt_cont.33714:
	addi	%v0, %s5, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s5, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s5)
	jal	min_caml_read_float
	fsw	%f0, 1(%s5)
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s6, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s6)
	jal	min_caml_read_float
	fsw	%f0, 1(%s6)
	jal	min_caml_read_float
	fsw	%f0, 2(%s6)
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	beqi	%s0, 0, bnei_else.33715
	jal	min_caml_read_float
	flw	%f1, 469(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%s1)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%s1)
	j	bnei_cont.33716
bnei_else.33715:
bnei_cont.33716:
	beqi	%a3, 2, bnei_else.33717
	add	%s7, %zero, %s4
	j	bnei_cont.33718
bnei_else.33717:
	add	%s7, %zero, %k1
bnei_cont.33718:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%s1, 9(%ra)
	sw	%s6, 8(%ra)
	sw	%s5, 7(%ra)
	sw	%s7, 6(%ra)
	sw	%s3, 5(%ra)
	sw	%s2, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	sw	%ra, 12(%a0)
	beqi	%a3, 3, bnei_else.33719
	beqi	%a3, 2, bnei_else.33721
	j	bnei_cont.33720
bnei_else.33721:
	beqi	%s4, 0, bnei_else.33723
	add	%a0, %zero, %zero
	j	bnei_cont.33724
bnei_else.33723:
	add	%a0, %zero, %k1
bnei_cont.33724:
	flw	%f18, 0(%s2)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s2)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s2)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.33725
	add	%a2, %zero, %k1
	j	fbeq_cont.33726
fbeq_else.33725:
	add	%a2, %zero, %zero
fbeq_cont.33726:
	beqi	%a2, 0, bnei_else.33727
	fmov	%f0, %f30
	j	bnei_cont.33728
bnei_else.33727:
	beqi	%a0, 0, bnei_else.33729
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.33730
bnei_else.33729:
	fdiv	%f0, %f30, %f1
bnei_cont.33730:
bnei_cont.33728:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s2)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s2)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s2)
bnei_cont.33722:
	j	bnei_cont.33720
bnei_else.33719:
	flw	%f1, 0(%s2)
	fbne	%f1, %fzero, fbeq_else.33731
	add	%a0, %zero, %k1
	j	fbeq_cont.33732
fbeq_else.33731:
	add	%a0, %zero, %zero
fbeq_cont.33732:
	beqi	%a0, 0, bnei_else.33733
	fmov	%f0, %fzero
	j	bnei_cont.33734
bnei_else.33733:
	fbne	%f1, %fzero, fbeq_else.33735
	add	%a0, %zero, %k1
	j	fbeq_cont.33736
fbeq_else.33735:
	add	%a0, %zero, %zero
fbeq_cont.33736:
	beqi	%a0, 0, bnei_else.33737
	fmov	%f0, %fzero
	j	bnei_cont.33738
bnei_else.33737:
	fblt	%fzero, %f1, fbgt_else.33739
	add	%a0, %zero, %zero
	j	fbgt_cont.33740
fbgt_else.33739:
	add	%a0, %zero, %k1
fbgt_cont.33740:
	beqi	%a0, 0, bnei_else.33741
	fmov	%f0, %f30
	j	bnei_cont.33742
bnei_else.33741:
	flw	%f0, 468(%zero)
bnei_cont.33742:
bnei_cont.33738:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.33734:
	fsw	%f0, 0(%s2)
	flw	%f1, 1(%s2)
	fbne	%f1, %fzero, fbeq_else.33743
	add	%a0, %zero, %k1
	j	fbeq_cont.33744
fbeq_else.33743:
	add	%a0, %zero, %zero
fbeq_cont.33744:
	beqi	%a0, 0, bnei_else.33745
	fmov	%f0, %fzero
	j	bnei_cont.33746
bnei_else.33745:
	fbne	%f1, %fzero, fbeq_else.33747
	add	%a0, %zero, %k1
	j	fbeq_cont.33748
fbeq_else.33747:
	add	%a0, %zero, %zero
fbeq_cont.33748:
	beqi	%a0, 0, bnei_else.33749
	fmov	%f0, %fzero
	j	bnei_cont.33750
bnei_else.33749:
	fblt	%fzero, %f1, fbgt_else.33751
	add	%a0, %zero, %zero
	j	fbgt_cont.33752
fbgt_else.33751:
	add	%a0, %zero, %k1
fbgt_cont.33752:
	beqi	%a0, 0, bnei_else.33753
	fmov	%f0, %f30
	j	bnei_cont.33754
bnei_else.33753:
	flw	%f0, 468(%zero)
bnei_cont.33754:
bnei_cont.33750:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.33746:
	fsw	%f0, 1(%s2)
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.33755
	add	%a0, %zero, %k1
	j	fbeq_cont.33756
fbeq_else.33755:
	add	%a0, %zero, %zero
fbeq_cont.33756:
	beqi	%a0, 0, bnei_else.33757
	fmov	%f0, %fzero
	j	bnei_cont.33758
bnei_else.33757:
	fbne	%f1, %fzero, fbeq_else.33759
	add	%a0, %zero, %k1
	j	fbeq_cont.33760
fbeq_else.33759:
	add	%a0, %zero, %zero
fbeq_cont.33760:
	beqi	%a0, 0, bnei_else.33761
	fmov	%f0, %fzero
	j	bnei_cont.33762
bnei_else.33761:
	fblt	%fzero, %f1, fbgt_else.33763
	add	%a0, %zero, %zero
	j	fbgt_cont.33764
fbgt_else.33763:
	add	%a0, %zero, %k1
fbgt_cont.33764:
	beqi	%a0, 0, bnei_else.33765
	fmov	%f0, %f30
	j	bnei_cont.33766
bnei_else.33765:
	flw	%f0, 468(%zero)
bnei_cont.33766:
bnei_cont.33762:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.33758:
	fsw	%f0, 2(%s2)
bnei_cont.33720:
	beqi	%s0, 0, bnei_else.33767
	flw	%f18, 0(%s1)
	flw	%f19, 494(%zero)
	fabs	%f17, %f18
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.33769
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.33770
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33770
fbgt_else.33791:
fbgt_cont.33792:
	j	fbgt_cont.33770
fbgt_else.33789:
fbgt_cont.33790:
	j	fbgt_cont.33770
fbgt_else.33787:
fbgt_cont.33788:
	j	fbgt_cont.33770
fbgt_else.33785:
fbgt_cont.33786:
	j	fbgt_cont.33770
fbgt_else.33783:
fbgt_cont.33784:
	j	fbgt_cont.33770
fbgt_else.33781:
fbgt_cont.33782:
	j	fbgt_cont.33770
fbgt_else.33779:
fbgt_cont.33780:
	j	fbgt_cont.33770
fbgt_else.33777:
fbgt_cont.33778:
	j	fbgt_cont.33770
fbgt_else.33775:
fbgt_cont.33776:
	j	fbgt_cont.33770
fbgt_else.33773:
fbgt_cont.33774:
	j	fbgt_cont.33770
fbgt_else.33771:
fbgt_cont.33772:
	j	fbgt_cont.33770
fbgt_else.33769:
	fmov	%f1, %f2
fbgt_cont.33770:
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33793
	add	%a0, %zero, %zero
	j	fbgt_cont.33794
fbgt_else.33793:
	add	%a0, %zero, %k1
fbgt_cont.33794:
	fblt	%f0, %f19, fbgt_else.33795
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33796
fbgt_else.33795:
fbgt_cont.33796:
	flw	%f20, 479(%zero)
	fblt	%f0, %f20, fbgt_else.33797
	beqi	%a0, 0, bnei_else.33799
	add	%a0, %zero, %zero
	j	fbgt_cont.33798
bnei_else.33799:
	add	%a0, %zero, %k1
bnei_cont.33800:
	j	fbgt_cont.33798
fbgt_else.33797:
fbgt_cont.33798:
	fblt	%f0, %f20, fbgt_else.33801
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33802
fbgt_else.33801:
fbgt_cont.33802:
	flw	%f21, 478(%zero)
	fblt	%f21, %f0, fbgt_else.33803
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.33804
fbgt_else.33803:
	fsub	%f22, %f20, %f0
	fmul	%f16, %f22, %f22
	fmul	%f17, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f17, %f1, %f0
fbgt_cont.33804:
	beqi	%a0, 0, bnei_else.33805
	j	bnei_cont.33806
bnei_else.33805:
	fneg	%f17, %f17
bnei_cont.33806:
	fblt	%f18, %fzero, fbgt_else.33807
	add	%a0, %zero, %k1
	j	fbgt_cont.33808
fbgt_else.33807:
	add	%a0, %zero, %zero
fbgt_cont.33808:
	fabs	%f18, %f18
	fblt	%f18, %f2, fbgt_else.33809
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.33810
	flw	%f1, 481(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33810
fbgt_else.33831:
fbgt_cont.33832:
	j	fbgt_cont.33810
fbgt_else.33829:
fbgt_cont.33830:
	j	fbgt_cont.33810
fbgt_else.33827:
fbgt_cont.33828:
	j	fbgt_cont.33810
fbgt_else.33825:
fbgt_cont.33826:
	j	fbgt_cont.33810
fbgt_else.33823:
fbgt_cont.33824:
	j	fbgt_cont.33810
fbgt_else.33821:
fbgt_cont.33822:
	j	fbgt_cont.33810
fbgt_else.33819:
fbgt_cont.33820:
	j	fbgt_cont.33810
fbgt_else.33817:
fbgt_cont.33818:
	j	fbgt_cont.33810
fbgt_else.33815:
fbgt_cont.33816:
	j	fbgt_cont.33810
fbgt_else.33813:
fbgt_cont.33814:
	j	fbgt_cont.33810
fbgt_else.33811:
fbgt_cont.33812:
	j	fbgt_cont.33810
fbgt_else.33809:
	fmov	%f1, %f2
fbgt_cont.33810:
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33833
	beqi	%a0, 0, bnei_else.33835
	add	%a0, %zero, %zero
	j	fbgt_cont.33834
bnei_else.33835:
	add	%a0, %zero, %k1
bnei_cont.33836:
	j	fbgt_cont.33834
fbgt_else.33833:
fbgt_cont.33834:
	fblt	%f0, %f19, fbgt_else.33837
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33838
fbgt_else.33837:
fbgt_cont.33838:
	fblt	%f0, %f20, fbgt_else.33839
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33840
fbgt_else.33839:
fbgt_cont.33840:
	fblt	%f21, %f0, fbgt_else.33841
	fmul	%f22, %f0, %f0
	fmul	%f18, %f22, %f22
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f22
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fsub	%f18, %f16, %f0
	j	fbgt_cont.33842
fbgt_else.33841:
	fsub	%f0, %f20, %f0
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.33842:
	beqi	%a0, 0, bnei_else.33843
	j	bnei_cont.33844
bnei_else.33843:
	fneg	%f18, %f18
bnei_cont.33844:
	flw	%f23, 1(%s1)
	fabs	%f22, %f23
	fblt	%f22, %f2, fbgt_else.33845
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.33846
	flw	%f1, 481(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33846
fbgt_else.33867:
fbgt_cont.33868:
	j	fbgt_cont.33846
fbgt_else.33865:
fbgt_cont.33866:
	j	fbgt_cont.33846
fbgt_else.33863:
fbgt_cont.33864:
	j	fbgt_cont.33846
fbgt_else.33861:
fbgt_cont.33862:
	j	fbgt_cont.33846
fbgt_else.33859:
fbgt_cont.33860:
	j	fbgt_cont.33846
fbgt_else.33857:
fbgt_cont.33858:
	j	fbgt_cont.33846
fbgt_else.33855:
fbgt_cont.33856:
	j	fbgt_cont.33846
fbgt_else.33853:
fbgt_cont.33854:
	j	fbgt_cont.33846
fbgt_else.33851:
fbgt_cont.33852:
	j	fbgt_cont.33846
fbgt_else.33849:
fbgt_cont.33850:
	j	fbgt_cont.33846
fbgt_else.33847:
fbgt_cont.33848:
	j	fbgt_cont.33846
fbgt_else.33845:
	fmov	%f1, %f2
fbgt_cont.33846:
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33869
	add	%a0, %zero, %zero
	j	fbgt_cont.33870
fbgt_else.33869:
	add	%a0, %zero, %k1
fbgt_cont.33870:
	fblt	%f0, %f19, fbgt_else.33871
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33872
fbgt_else.33871:
fbgt_cont.33872:
	fblt	%f0, %f20, fbgt_else.33873
	beqi	%a0, 0, bnei_else.33875
	add	%a0, %zero, %zero
	j	fbgt_cont.33874
bnei_else.33875:
	add	%a0, %zero, %k1
bnei_cont.33876:
	j	fbgt_cont.33874
fbgt_else.33873:
fbgt_cont.33874:
	fblt	%f0, %f20, fbgt_else.33877
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33878
fbgt_else.33877:
fbgt_cont.33878:
	fblt	%f21, %f0, fbgt_else.33879
	fmul	%f22, %f0, %f0
	fmul	%f16, %f22, %f22
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
	j	fbgt_cont.33880
fbgt_else.33879:
	fsub	%f24, %f20, %f0
	fmul	%f22, %f24, %f24
	fmul	%f16, %f22, %f22
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
fbgt_cont.33880:
	beqi	%a0, 0, bnei_else.33881
	j	bnei_cont.33882
bnei_else.33881:
	fneg	%f22, %f22
bnei_cont.33882:
	fblt	%f23, %fzero, fbgt_else.33883
	add	%a0, %zero, %k1
	j	fbgt_cont.33884
fbgt_else.33883:
	add	%a0, %zero, %zero
fbgt_cont.33884:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.33885
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.33886
	flw	%f1, 481(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33886
fbgt_else.33907:
fbgt_cont.33908:
	j	fbgt_cont.33886
fbgt_else.33905:
fbgt_cont.33906:
	j	fbgt_cont.33886
fbgt_else.33903:
fbgt_cont.33904:
	j	fbgt_cont.33886
fbgt_else.33901:
fbgt_cont.33902:
	j	fbgt_cont.33886
fbgt_else.33899:
fbgt_cont.33900:
	j	fbgt_cont.33886
fbgt_else.33897:
fbgt_cont.33898:
	j	fbgt_cont.33886
fbgt_else.33895:
fbgt_cont.33896:
	j	fbgt_cont.33886
fbgt_else.33893:
fbgt_cont.33894:
	j	fbgt_cont.33886
fbgt_else.33891:
fbgt_cont.33892:
	j	fbgt_cont.33886
fbgt_else.33889:
fbgt_cont.33890:
	j	fbgt_cont.33886
fbgt_else.33887:
fbgt_cont.33888:
	j	fbgt_cont.33886
fbgt_else.33885:
	fmov	%f1, %f2
fbgt_cont.33886:
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33909
	beqi	%a0, 0, bnei_else.33911
	add	%a0, %zero, %zero
	j	fbgt_cont.33910
bnei_else.33911:
	add	%a0, %zero, %k1
bnei_cont.33912:
	j	fbgt_cont.33910
fbgt_else.33909:
fbgt_cont.33910:
	fblt	%f0, %f19, fbgt_else.33913
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33914
fbgt_else.33913:
fbgt_cont.33914:
	fblt	%f0, %f20, fbgt_else.33915
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33916
fbgt_else.33915:
fbgt_cont.33916:
	fblt	%f21, %f0, fbgt_else.33917
	fmul	%f24, %f0, %f0
	fmul	%f23, %f24, %f24
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f24
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f23
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f23
	fsub	%f23, %f16, %f0
	j	fbgt_cont.33918
fbgt_else.33917:
	fsub	%f0, %f20, %f0
	fmul	%f23, %f0, %f0
	fmul	%f16, %f23, %f23
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
fbgt_cont.33918:
	beqi	%a0, 0, bnei_else.33919
	j	bnei_cont.33920
bnei_else.33919:
	fneg	%f23, %f23
bnei_cont.33920:
	flw	%f25, 2(%s1)
	fabs	%f24, %f25
	fblt	%f24, %f2, fbgt_else.33921
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.33922
	flw	%f1, 481(%zero)
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33922
fbgt_else.33943:
fbgt_cont.33944:
	j	fbgt_cont.33922
fbgt_else.33941:
fbgt_cont.33942:
	j	fbgt_cont.33922
fbgt_else.33939:
fbgt_cont.33940:
	j	fbgt_cont.33922
fbgt_else.33937:
fbgt_cont.33938:
	j	fbgt_cont.33922
fbgt_else.33935:
fbgt_cont.33936:
	j	fbgt_cont.33922
fbgt_else.33933:
fbgt_cont.33934:
	j	fbgt_cont.33922
fbgt_else.33931:
fbgt_cont.33932:
	j	fbgt_cont.33922
fbgt_else.33929:
fbgt_cont.33930:
	j	fbgt_cont.33922
fbgt_else.33927:
fbgt_cont.33928:
	j	fbgt_cont.33922
fbgt_else.33925:
fbgt_cont.33926:
	j	fbgt_cont.33922
fbgt_else.33923:
fbgt_cont.33924:
	j	fbgt_cont.33922
fbgt_else.33921:
	fmov	%f1, %f2
fbgt_cont.33922:
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33945
	add	%a0, %zero, %zero
	j	fbgt_cont.33946
fbgt_else.33945:
	add	%a0, %zero, %k1
fbgt_cont.33946:
	fblt	%f0, %f19, fbgt_else.33947
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33948
fbgt_else.33947:
fbgt_cont.33948:
	fblt	%f0, %f20, fbgt_else.33949
	beqi	%a0, 0, bnei_else.33951
	add	%a0, %zero, %zero
	j	fbgt_cont.33950
bnei_else.33951:
	add	%a0, %zero, %k1
bnei_cont.33952:
	j	fbgt_cont.33950
fbgt_else.33949:
fbgt_cont.33950:
	fblt	%f0, %f20, fbgt_else.33953
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33954
fbgt_else.33953:
fbgt_cont.33954:
	fblt	%f21, %f0, fbgt_else.33955
	fmul	%f24, %f0, %f0
	fmul	%f16, %f24, %f24
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
	j	fbgt_cont.33956
fbgt_else.33955:
	fsub	%f26, %f20, %f0
	fmul	%f24, %f26, %f26
	fmul	%f16, %f24, %f24
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fsub	%f1, %f26, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
fbgt_cont.33956:
	beqi	%a0, 0, bnei_else.33957
	j	bnei_cont.33958
bnei_else.33957:
	fneg	%f24, %f24
bnei_cont.33958:
	fblt	%f25, %fzero, fbgt_else.33959
	add	%a0, %zero, %k1
	j	fbgt_cont.33960
fbgt_else.33959:
	add	%a0, %zero, %zero
fbgt_cont.33960:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.33961
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.33962
	flw	%f1, 481(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33962
fbgt_else.33983:
fbgt_cont.33984:
	j	fbgt_cont.33962
fbgt_else.33981:
fbgt_cont.33982:
	j	fbgt_cont.33962
fbgt_else.33979:
fbgt_cont.33980:
	j	fbgt_cont.33962
fbgt_else.33977:
fbgt_cont.33978:
	j	fbgt_cont.33962
fbgt_else.33975:
fbgt_cont.33976:
	j	fbgt_cont.33962
fbgt_else.33973:
fbgt_cont.33974:
	j	fbgt_cont.33962
fbgt_else.33971:
fbgt_cont.33972:
	j	fbgt_cont.33962
fbgt_else.33969:
fbgt_cont.33970:
	j	fbgt_cont.33962
fbgt_else.33967:
fbgt_cont.33968:
	j	fbgt_cont.33962
fbgt_else.33965:
fbgt_cont.33966:
	j	fbgt_cont.33962
fbgt_else.33963:
fbgt_cont.33964:
	j	fbgt_cont.33962
fbgt_else.33961:
	fmov	%f1, %f2
fbgt_cont.33962:
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.33985
	beqi	%a0, 0, bnei_else.33987
	add	%a0, %zero, %zero
	j	fbgt_cont.33986
bnei_else.33987:
	add	%a0, %zero, %k1
bnei_cont.33988:
	j	fbgt_cont.33986
fbgt_else.33985:
fbgt_cont.33986:
	fblt	%f0, %f19, fbgt_else.33989
	fsub	%f0, %f0, %f19
	j	fbgt_cont.33990
fbgt_else.33989:
fbgt_cont.33990:
	fblt	%f0, %f20, fbgt_else.33991
	fsub	%f0, %f19, %f0
	j	fbgt_cont.33992
fbgt_else.33991:
fbgt_cont.33992:
	fblt	%f21, %f0, fbgt_else.33993
	fmul	%f2, %f0, %f0
	fmul	%f19, %f2, %f2
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f2
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fsub	%f0, %f16, %f0
	j	fbgt_cont.33994
fbgt_else.33993:
	fsub	%f0, %f20, %f0
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.33994:
	beqi	%a0, 0, bnei_else.33995
	j	bnei_cont.33996
bnei_else.33995:
	fneg	%f0, %f0
bnei_cont.33996:
	fmul	%f1, %f22, %f24
	fmul	%f20, %f18, %f23
	fmul	%f19, %f20, %f24
	fmul	%f16, %f17, %f0
	fsub	%f2, %f19, %f16
	fmul	%f21, %f17, %f23
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0
	fmul	%f20, %f20, %f0
	fmul	%f19, %f17, %f24
	fadd	%f19, %f20, %f19
	fmul	%f20, %f21, %f0
	fmul	%f0, %f18, %f24
	fsub	%f24, %f20, %f0
	fneg	%f23, %f23
	fmul	%f18, %f18, %f22
	fmul	%f21, %f17, %f22
	flw	%f27, 0(%s2)
	flw	%f17, 1(%s2)
	flw	%f26, 2(%s2)
	fmul	%f0, %f1, %f1
	fmul	%f20, %f27, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 0(%s2)
	fmul	%f0, %f2, %f2
	fmul	%f20, %f27, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f18, %f18
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 1(%s2)
	fmul	%f0, %f16, %f16
	fmul	%f20, %f27, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 2(%s2)
	flw	%f20, 495(%zero)
	fmul	%f0, %f27, %f2
	fmul	%f22, %f0, %f16
	fmul	%f0, %f17, %f19
	fmul	%f0, %f0, %f24
	fadd	%f22, %f22, %f0
	fmul	%f0, %f26, %f18
	fmul	%f0, %f0, %f21
	fadd	%f0, %f22, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 0(%s1)
	fmul	%f22, %f27, %f1
	fmul	%f1, %f22, %f16
	fmul	%f17, %f17, %f25
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f23
	fmul	%f0, %f16, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 1(%s1)
	fmul	%f1, %f22, %f2
	fmul	%f0, %f17, %f19
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 2(%s1)
	j	bnei_cont.33768
bnei_else.33767:
bnei_cont.33768:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33712:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	jr	%ra
read_object.2784:
	add	%a2, %zero, %v0
	add	%t7, %zero, %ra
	blti	%a2, 60, bgti_else.34120
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.34120:
	jal	min_caml_read_int
	addi	%a0, %v0, 0
	beqi	%a0, -1, bnei_else.34122
	jal	min_caml_read_int
	addi	%a1, %v0, 0
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	addi	%s0, %zero, 3
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	fsw	%f0, 1(%s1)
	addi	%s4, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s1)
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s2, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s2)
	jal	min_caml_read_float
	fsw	%f0, 1(%s2)
	jal	min_caml_read_float
	fsw	%f0, 2(%s2)
	jal	min_caml_read_float
	fblt	%f0, %fzero, fbgt_else.34124
	add	%s3, %zero, %zero
	j	fbgt_cont.34125
fbgt_else.34124:
	add	%s3, %zero, %k1
fbgt_cont.34125:
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s4, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s4)
	jal	min_caml_read_float
	fsw	%f0, 1(%s4)
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s5, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s5)
	jal	min_caml_read_float
	fsw	%f0, 1(%s5)
	jal	min_caml_read_float
	fsw	%f0, 2(%s5)
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	beqi	%k0, 0, bnei_else.34126
	jal	min_caml_read_float
	flw	%f1, 469(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%s0)
	j	bnei_cont.34127
bnei_else.34126:
bnei_cont.34127:
	beqi	%a1, 2, bnei_else.34128
	add	%s6, %zero, %s3
	j	bnei_cont.34129
bnei_else.34128:
	add	%s6, %zero, %k1
bnei_cont.34129:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%s0, 9(%ra)
	sw	%s5, 8(%ra)
	sw	%s4, 7(%ra)
	sw	%s6, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a1, 1(%ra)
	sw	%a0, 0(%ra)
	sw	%ra, 12(%a2)
	beqi	%a1, 3, bnei_else.34130
	beqi	%a1, 2, bnei_else.34132
	j	bnei_cont.34131
bnei_else.34132:
	beqi	%s3, 0, bnei_else.34134
	add	%a0, %zero, %zero
	j	bnei_cont.34135
bnei_else.34134:
	add	%a0, %zero, %k1
bnei_cont.34135:
	flw	%f18, 0(%s1)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s1)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s1)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.34136
	add	%a1, %zero, %k1
	j	fbeq_cont.34137
fbeq_else.34136:
	add	%a1, %zero, %zero
fbeq_cont.34137:
	beqi	%a1, 0, bnei_else.34138
	fmov	%f0, %f30
	j	bnei_cont.34139
bnei_else.34138:
	beqi	%a0, 0, bnei_else.34140
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34141
bnei_else.34140:
	fdiv	%f0, %f30, %f1
bnei_cont.34141:
bnei_cont.34139:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s1)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s1)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s1)
bnei_cont.34133:
	j	bnei_cont.34131
bnei_else.34130:
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.34142
	add	%a0, %zero, %k1
	j	fbeq_cont.34143
fbeq_else.34142:
	add	%a0, %zero, %zero
fbeq_cont.34143:
	beqi	%a0, 0, bnei_else.34144
	fmov	%f0, %fzero
	j	bnei_cont.34145
bnei_else.34144:
	fbne	%f1, %fzero, fbeq_else.34146
	add	%a0, %zero, %k1
	j	fbeq_cont.34147
fbeq_else.34146:
	add	%a0, %zero, %zero
fbeq_cont.34147:
	beqi	%a0, 0, bnei_else.34148
	fmov	%f0, %fzero
	j	bnei_cont.34149
bnei_else.34148:
	fblt	%fzero, %f1, fbgt_else.34150
	add	%a0, %zero, %zero
	j	fbgt_cont.34151
fbgt_else.34150:
	add	%a0, %zero, %k1
fbgt_cont.34151:
	beqi	%a0, 0, bnei_else.34152
	fmov	%f0, %f30
	j	bnei_cont.34153
bnei_else.34152:
	flw	%f0, 468(%zero)
bnei_cont.34153:
bnei_cont.34149:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34145:
	fsw	%f0, 0(%s1)
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.34154
	add	%a0, %zero, %k1
	j	fbeq_cont.34155
fbeq_else.34154:
	add	%a0, %zero, %zero
fbeq_cont.34155:
	beqi	%a0, 0, bnei_else.34156
	fmov	%f0, %fzero
	j	bnei_cont.34157
bnei_else.34156:
	fbne	%f1, %fzero, fbeq_else.34158
	add	%a0, %zero, %k1
	j	fbeq_cont.34159
fbeq_else.34158:
	add	%a0, %zero, %zero
fbeq_cont.34159:
	beqi	%a0, 0, bnei_else.34160
	fmov	%f0, %fzero
	j	bnei_cont.34161
bnei_else.34160:
	fblt	%fzero, %f1, fbgt_else.34162
	add	%a0, %zero, %zero
	j	fbgt_cont.34163
fbgt_else.34162:
	add	%a0, %zero, %k1
fbgt_cont.34163:
	beqi	%a0, 0, bnei_else.34164
	fmov	%f0, %f30
	j	bnei_cont.34165
bnei_else.34164:
	flw	%f0, 468(%zero)
bnei_cont.34165:
bnei_cont.34161:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34157:
	fsw	%f0, 1(%s1)
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.34166
	add	%a0, %zero, %k1
	j	fbeq_cont.34167
fbeq_else.34166:
	add	%a0, %zero, %zero
fbeq_cont.34167:
	beqi	%a0, 0, bnei_else.34168
	fmov	%f0, %fzero
	j	bnei_cont.34169
bnei_else.34168:
	fbne	%f1, %fzero, fbeq_else.34170
	add	%a0, %zero, %k1
	j	fbeq_cont.34171
fbeq_else.34170:
	add	%a0, %zero, %zero
fbeq_cont.34171:
	beqi	%a0, 0, bnei_else.34172
	fmov	%f0, %fzero
	j	bnei_cont.34173
bnei_else.34172:
	fblt	%fzero, %f1, fbgt_else.34174
	add	%a0, %zero, %zero
	j	fbgt_cont.34175
fbgt_else.34174:
	add	%a0, %zero, %k1
fbgt_cont.34175:
	beqi	%a0, 0, bnei_else.34176
	fmov	%f0, %f30
	j	bnei_cont.34177
bnei_else.34176:
	flw	%f0, 468(%zero)
bnei_cont.34177:
bnei_cont.34173:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34169:
	fsw	%f0, 2(%s1)
bnei_cont.34131:
	beqi	%k0, 0, bnei_else.34178
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	rotate_quadratic_matrix.2779
	j	bnei_cont.34179
bnei_else.34178:
bnei_cont.34179:
	add	%a0, %zero, %k1
	j	bnei_cont.34123
bnei_else.34122:
	add	%a0, %zero, %zero
bnei_cont.34123:
	beqi	%a0, 0, bnei_else.34180
	addi	%t8, %a2, 1
	blti	%t8, 60, bgti_else.34181
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.34181:
	addi	%v0, %t8, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.34183
	addi	%v0, %t8, 1
	add	%ra, %zero, %t7
	j	read_object.2784
bnei_else.34183:
	add	%ra, %zero, %t7
	sw	%t8, 0(%zero)
	jr	%ra
bnei_else.34180:
	add	%ra, %zero, %t7
	sw	%a2, 0(%zero)
	jr	%ra
read_net_item.2788:
	sw	%v0, 0(%sp)
	sw	%t6, 1(%sp)
	sw	%t5, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%t3, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t0, %v0, 0
	addi	%a0, %zero, -1
	beqi	%t0, -1, bnei_else.34258
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.34259
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.34261
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.34263
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2788
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.34264
bnei_else.34263:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.34264:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.34262
bnei_else.34261:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.34262:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.34260
bnei_else.34259:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.34260:
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%t0, 0(%at)
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
bnei_else.34258:
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 1
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v1, %a0, 0
	j	min_caml_create_array
read_or_network.2790:
	sw	%v0, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	addi	%a3, %zero, -1
	beqi	%a2, -1, bnei_else.34342
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.34344
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.34346
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2788
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%s0, 2(%v1)
	j	bnei_cont.34347
bnei_else.34346:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.34347:
	sw	%k0, 1(%v1)
	j	bnei_cont.34345
bnei_else.34344:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.34345:
	sw	%a2, 0(%v1)
	j	bnei_cont.34343
bnei_else.34342:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.34343:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.34348
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.34349
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.34351
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2788
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%k0, 1(%t1)
	j	bnei_cont.34352
bnei_else.34351:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.34352:
	sw	%a2, 0(%t1)
	j	bnei_cont.34350
bnei_else.34349:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.34350:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.34353
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2790
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.34354
bnei_else.34353:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.34354:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.34348:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_create_array
read_and_network.2792:
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	addi	%s0, %zero, -1
	beqi	%k0, -1, bnei_else.34409
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.34411
	jal	min_caml_read_int
	addi	%s2, %v0, 0
	beqi	%s2, -1, bnei_else.34413
	addi	%v0, %zero, 3
	jal	read_net_item.2788
	sw	%s2, 2(%v0)
	j	bnei_cont.34414
bnei_else.34413:
	addi	%v0, %zero, 3
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.34414:
	sw	%s1, 1(%v0)
	j	bnei_cont.34412
bnei_else.34411:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.34412:
	sw	%k0, 0(%v0)
	j	bnei_cont.34410
bnei_else.34409:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.34410:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.34415
	sw	%v0, 83(%a2)
	addi	%s1, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.34416
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.34418
	addi	%v0, %zero, 2
	jal	read_net_item.2788
	sw	%k0, 1(%v0)
	j	bnei_cont.34419
bnei_else.34418:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.34419:
	sw	%a2, 0(%v0)
	j	bnei_cont.34417
bnei_else.34416:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.34417:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.34420
	sw	%v0, 83(%s1)
	addi	%k0, %s1, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.34421
	addi	%v0, %k1, 0
	jal	read_net_item.2788
	sw	%a2, 0(%v0)
	j	bnei_cont.34422
bnei_else.34421:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.34422:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.34423
	sw	%v0, 83(%k0)
	addi	%a2, %k0, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2788
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.34424
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2792
bnei_else.34424:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.34423:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.34420:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.34415:
	add	%ra, %zero, %a3
	jr	%ra
iter_setup_dirvec_constants.2889:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.34613
	lw	%a3, 12(%a1)
	lw	%s0, 1(%a0)
	lw	%k0, 0(%a0)
	lw	%s3, 9(%a3)
	lw	%s2, 6(%a3)
	lw	%s1, 4(%a3)
	lw	%s4, 3(%a3)
	lw	%a3, 1(%a3)
	beqi	%a3, 1, bnei_else.34614
	beqi	%a3, 2, bnei_else.34616
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f24, 2(%k0)
	fmul	%f0, %f20, %f20
	flw	%f2, 0(%s1)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19
	flw	%f18, 1(%s1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f17, 2(%s1)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%s4, 0, bnei_else.34618
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s3)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.34619
bnei_else.34618:
bnei_cont.34619:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s4, 0, bnei_else.34620
	flw	%f22, 1(%s3)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s3)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 473(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s3)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f20, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f23, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f19, %f17
	fmul	%f1, %f20, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f2, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.34621
bnei_else.34620:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.34621:
	fbne	%f0, %fzero, fbeq_else.34622
	add	%a3, %zero, %k1
	j	fbeq_cont.34623
fbeq_else.34622:
	add	%a3, %zero, %zero
fbeq_cont.34623:
	beqi	%a3, 0, bnei_else.34624
	j	bnei_cont.34625
bnei_else.34624:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.34625:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.34615
bnei_else.34616:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f18, 0(%s1)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%k0)
	flw	%f17, 1(%s1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f16, 2(%s1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.34626
	add	%a3, %zero, %zero
	j	fbgt_cont.34627
fbgt_else.34626:
	add	%a3, %zero, %k1
fbgt_cont.34627:
	beqi	%a3, 0, bnei_else.34628
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.34629
bnei_else.34628:
	fsw	%fzero, 0(%v0)
bnei_cont.34629:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
bnei_cont.34617:
	j	bnei_cont.34615
bnei_else.34614:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.34630
	add	%a3, %zero, %k1
	j	fbeq_cont.34631
fbeq_else.34630:
	add	%a3, %zero, %zero
fbeq_cont.34631:
	beqi	%a3, 0, bnei_else.34632
	fsw	%fzero, 1(%v0)
	j	bnei_cont.34633
bnei_else.34632:
	fblt	%f1, %fzero, fbgt_else.34634
	add	%a3, %zero, %zero
	j	fbgt_cont.34635
fbgt_else.34634:
	add	%a3, %zero, %k1
fbgt_cont.34635:
	beqi	%s2, 0, bnei_else.34636
	beqi	%a3, 0, bnei_else.34638
	add	%a3, %zero, %zero
	j	bnei_cont.34637
bnei_else.34638:
	add	%a3, %zero, %k1
bnei_cont.34639:
	j	bnei_cont.34637
bnei_else.34636:
bnei_cont.34637:
	flw	%f0, 0(%s1)
	beqi	%a3, 0, bnei_else.34640
	j	bnei_cont.34641
bnei_else.34640:
	fneg	%f0, %f0
bnei_cont.34641:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.34633:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.34642
	add	%a3, %zero, %k1
	j	fbeq_cont.34643
fbeq_else.34642:
	add	%a3, %zero, %zero
fbeq_cont.34643:
	beqi	%a3, 0, bnei_else.34644
	fsw	%fzero, 3(%v0)
	j	bnei_cont.34645
bnei_else.34644:
	fblt	%f1, %fzero, fbgt_else.34646
	add	%a3, %zero, %zero
	j	fbgt_cont.34647
fbgt_else.34646:
	add	%a3, %zero, %k1
fbgt_cont.34647:
	beqi	%s2, 0, bnei_else.34648
	beqi	%a3, 0, bnei_else.34650
	add	%a3, %zero, %zero
	j	bnei_cont.34649
bnei_else.34650:
	add	%a3, %zero, %k1
bnei_cont.34651:
	j	bnei_cont.34649
bnei_else.34648:
bnei_cont.34649:
	flw	%f0, 1(%s1)
	beqi	%a3, 0, bnei_else.34652
	j	bnei_cont.34653
bnei_else.34652:
	fneg	%f0, %f0
bnei_cont.34653:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.34645:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.34654
	add	%a3, %zero, %k1
	j	fbeq_cont.34655
fbeq_else.34654:
	add	%a3, %zero, %zero
fbeq_cont.34655:
	beqi	%a3, 0, bnei_else.34656
	fsw	%fzero, 5(%v0)
	j	bnei_cont.34657
bnei_else.34656:
	fblt	%f1, %fzero, fbgt_else.34658
	add	%a3, %zero, %zero
	j	fbgt_cont.34659
fbgt_else.34658:
	add	%a3, %zero, %k1
fbgt_cont.34659:
	beqi	%s2, 0, bnei_else.34660
	beqi	%a3, 0, bnei_else.34662
	add	%a3, %zero, %zero
	j	bnei_cont.34661
bnei_else.34662:
	add	%a3, %zero, %k1
bnei_cont.34663:
	j	bnei_cont.34661
bnei_else.34660:
bnei_cont.34661:
	flw	%f0, 2(%s1)
	beqi	%a3, 0, bnei_else.34664
	j	bnei_cont.34665
bnei_else.34664:
	fneg	%f0, %f0
bnei_cont.34665:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.34657:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
bnei_cont.34615:
	addi	%a3, %a1, -1
	blti	%a3, 0, bgti_else.34666
	lw	%a1, 12(%a3)
	lw	%s3, 9(%a1)
	lw	%s2, 6(%a1)
	lw	%s1, 4(%a1)
	lw	%s4, 3(%a1)
	lw	%a1, 1(%a1)
	beqi	%a1, 1, bnei_else.34667
	beqi	%a1, 2, bnei_else.34669
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f24, 2(%k0)
	fmul	%f0, %f20, %f20
	flw	%f2, 0(%s1)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19
	flw	%f18, 1(%s1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f17, 2(%s1)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%s4, 0, bnei_else.34671
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s3)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.34672
bnei_else.34671:
bnei_cont.34672:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s4, 0, bnei_else.34673
	flw	%f22, 1(%s3)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s3)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 473(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s3)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f20, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f23, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f19, %f17
	fmul	%f1, %f20, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f2, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.34674
bnei_else.34673:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.34674:
	fbne	%f0, %fzero, fbeq_else.34675
	add	%a1, %zero, %k1
	j	fbeq_cont.34676
fbeq_else.34675:
	add	%a1, %zero, %zero
fbeq_cont.34676:
	beqi	%a1, 0, bnei_else.34677
	j	bnei_cont.34678
bnei_else.34677:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.34678:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.34668
bnei_else.34669:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f18, 0(%s1)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%k0)
	flw	%f17, 1(%s1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f16, 2(%s1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.34679
	add	%a1, %zero, %zero
	j	fbgt_cont.34680
fbgt_else.34679:
	add	%a1, %zero, %k1
fbgt_cont.34680:
	beqi	%a1, 0, bnei_else.34681
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.34682
bnei_else.34681:
	fsw	%fzero, 0(%v0)
bnei_cont.34682:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.34670:
	j	bnei_cont.34668
bnei_else.34667:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.34683
	add	%a1, %zero, %k1
	j	fbeq_cont.34684
fbeq_else.34683:
	add	%a1, %zero, %zero
fbeq_cont.34684:
	beqi	%a1, 0, bnei_else.34685
	fsw	%fzero, 1(%v0)
	j	bnei_cont.34686
bnei_else.34685:
	fblt	%f1, %fzero, fbgt_else.34687
	add	%a1, %zero, %zero
	j	fbgt_cont.34688
fbgt_else.34687:
	add	%a1, %zero, %k1
fbgt_cont.34688:
	beqi	%s2, 0, bnei_else.34689
	beqi	%a1, 0, bnei_else.34691
	add	%a1, %zero, %zero
	j	bnei_cont.34690
bnei_else.34691:
	add	%a1, %zero, %k1
bnei_cont.34692:
	j	bnei_cont.34690
bnei_else.34689:
bnei_cont.34690:
	flw	%f0, 0(%s1)
	beqi	%a1, 0, bnei_else.34693
	j	bnei_cont.34694
bnei_else.34693:
	fneg	%f0, %f0
bnei_cont.34694:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.34686:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.34695
	add	%a1, %zero, %k1
	j	fbeq_cont.34696
fbeq_else.34695:
	add	%a1, %zero, %zero
fbeq_cont.34696:
	beqi	%a1, 0, bnei_else.34697
	fsw	%fzero, 3(%v0)
	j	bnei_cont.34698
bnei_else.34697:
	fblt	%f1, %fzero, fbgt_else.34699
	add	%a1, %zero, %zero
	j	fbgt_cont.34700
fbgt_else.34699:
	add	%a1, %zero, %k1
fbgt_cont.34700:
	beqi	%s2, 0, bnei_else.34701
	beqi	%a1, 0, bnei_else.34703
	add	%a1, %zero, %zero
	j	bnei_cont.34702
bnei_else.34703:
	add	%a1, %zero, %k1
bnei_cont.34704:
	j	bnei_cont.34702
bnei_else.34701:
bnei_cont.34702:
	flw	%f0, 1(%s1)
	beqi	%a1, 0, bnei_else.34705
	j	bnei_cont.34706
bnei_else.34705:
	fneg	%f0, %f0
bnei_cont.34706:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.34698:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.34707
	add	%a1, %zero, %k1
	j	fbeq_cont.34708
fbeq_else.34707:
	add	%a1, %zero, %zero
fbeq_cont.34708:
	beqi	%a1, 0, bnei_else.34709
	fsw	%fzero, 5(%v0)
	j	bnei_cont.34710
bnei_else.34709:
	fblt	%f1, %fzero, fbgt_else.34711
	add	%a1, %zero, %zero
	j	fbgt_cont.34712
fbgt_else.34711:
	add	%a1, %zero, %k1
fbgt_cont.34712:
	beqi	%s2, 0, bnei_else.34713
	beqi	%a1, 0, bnei_else.34715
	add	%a1, %zero, %zero
	j	bnei_cont.34714
bnei_else.34715:
	add	%a1, %zero, %k1
bnei_cont.34716:
	j	bnei_cont.34714
bnei_else.34713:
bnei_cont.34714:
	flw	%f0, 2(%s1)
	beqi	%a1, 0, bnei_else.34717
	j	bnei_cont.34718
bnei_else.34717:
	fneg	%f0, %f0
bnei_cont.34718:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.34710:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.34668:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.34666:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.34613:
	add	%ra, %zero, %a2
	jr	%ra
setup_dirvec_constants.2892:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 0(%zero)
	addi	%a3, %a2, -1
	blti	%a3, 0, bgti_else.34823
	lw	%a2, 12(%a3)
	lw	%k0, 1(%a0)
	lw	%s2, 0(%a0)
	lw	%s3, 9(%a2)
	lw	%s1, 6(%a2)
	lw	%s0, 4(%a2)
	lw	%s4, 3(%a2)
	lw	%a2, 1(%a2)
	beqi	%a2, 1, bnei_else.34824
	beqi	%a2, 2, bnei_else.34826
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%s2)
	flw	%f19, 1(%s2)
	flw	%f24, 2(%s2)
	fmul	%f0, %f20, %f20
	flw	%f2, 0(%s0)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19
	flw	%f18, 1(%s0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f17, 2(%s0)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%s4, 0, bnei_else.34828
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s3)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.34829
bnei_else.34828:
bnei_cont.34829:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s4, 0, bnei_else.34830
	flw	%f22, 1(%s3)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s3)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 473(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s3)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f20, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f23, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f19, %f17
	fmul	%f1, %f20, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f2, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.34831
bnei_else.34830:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.34831:
	fbne	%f0, %fzero, fbeq_else.34832
	add	%a2, %zero, %k1
	j	fbeq_cont.34833
fbeq_else.34832:
	add	%a2, %zero, %zero
fbeq_cont.34833:
	beqi	%a2, 0, bnei_else.34834
	j	bnei_cont.34835
bnei_else.34834:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.34835:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.34825
bnei_else.34826:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%s2)
	flw	%f18, 0(%s0)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%s2)
	flw	%f17, 1(%s0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s2)
	flw	%f16, 2(%s0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.34836
	add	%a2, %zero, %zero
	j	fbgt_cont.34837
fbgt_else.34836:
	add	%a2, %zero, %k1
fbgt_cont.34837:
	beqi	%a2, 0, bnei_else.34838
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.34839
bnei_else.34838:
	fsw	%fzero, 0(%v0)
bnei_cont.34839:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.34827:
	j	bnei_cont.34825
bnei_else.34824:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s2)
	fbne	%f1, %fzero, fbeq_else.34840
	add	%a2, %zero, %k1
	j	fbeq_cont.34841
fbeq_else.34840:
	add	%a2, %zero, %zero
fbeq_cont.34841:
	beqi	%a2, 0, bnei_else.34842
	fsw	%fzero, 1(%v0)
	j	bnei_cont.34843
bnei_else.34842:
	fblt	%f1, %fzero, fbgt_else.34844
	add	%a2, %zero, %zero
	j	fbgt_cont.34845
fbgt_else.34844:
	add	%a2, %zero, %k1
fbgt_cont.34845:
	beqi	%s1, 0, bnei_else.34846
	beqi	%a2, 0, bnei_else.34848
	add	%a2, %zero, %zero
	j	bnei_cont.34847
bnei_else.34848:
	add	%a2, %zero, %k1
bnei_cont.34849:
	j	bnei_cont.34847
bnei_else.34846:
bnei_cont.34847:
	flw	%f0, 0(%s0)
	beqi	%a2, 0, bnei_else.34850
	j	bnei_cont.34851
bnei_else.34850:
	fneg	%f0, %f0
bnei_cont.34851:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.34843:
	flw	%f1, 1(%s2)
	fbne	%f1, %fzero, fbeq_else.34852
	add	%a2, %zero, %k1
	j	fbeq_cont.34853
fbeq_else.34852:
	add	%a2, %zero, %zero
fbeq_cont.34853:
	beqi	%a2, 0, bnei_else.34854
	fsw	%fzero, 3(%v0)
	j	bnei_cont.34855
bnei_else.34854:
	fblt	%f1, %fzero, fbgt_else.34856
	add	%a2, %zero, %zero
	j	fbgt_cont.34857
fbgt_else.34856:
	add	%a2, %zero, %k1
fbgt_cont.34857:
	beqi	%s1, 0, bnei_else.34858
	beqi	%a2, 0, bnei_else.34860
	add	%a2, %zero, %zero
	j	bnei_cont.34859
bnei_else.34860:
	add	%a2, %zero, %k1
bnei_cont.34861:
	j	bnei_cont.34859
bnei_else.34858:
bnei_cont.34859:
	flw	%f0, 1(%s0)
	beqi	%a2, 0, bnei_else.34862
	j	bnei_cont.34863
bnei_else.34862:
	fneg	%f0, %f0
bnei_cont.34863:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.34855:
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.34864
	add	%a2, %zero, %k1
	j	fbeq_cont.34865
fbeq_else.34864:
	add	%a2, %zero, %zero
fbeq_cont.34865:
	beqi	%a2, 0, bnei_else.34866
	fsw	%fzero, 5(%v0)
	j	bnei_cont.34867
bnei_else.34866:
	fblt	%f1, %fzero, fbgt_else.34868
	add	%a2, %zero, %zero
	j	fbgt_cont.34869
fbgt_else.34868:
	add	%a2, %zero, %k1
fbgt_cont.34869:
	beqi	%s1, 0, bnei_else.34870
	beqi	%a2, 0, bnei_else.34872
	add	%a2, %zero, %zero
	j	bnei_cont.34871
bnei_else.34872:
	add	%a2, %zero, %k1
bnei_cont.34873:
	j	bnei_cont.34871
bnei_else.34870:
bnei_cont.34871:
	flw	%f0, 2(%s0)
	beqi	%a2, 0, bnei_else.34874
	j	bnei_cont.34875
bnei_else.34874:
	fneg	%f0, %f0
bnei_cont.34875:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.34867:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.34825:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.34823:
	add	%ra, %zero, %a1
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.34913
	lw	%a1, 12(%v1)
	lw	%s0, 10(%a1)
	lw	%a2, 9(%a1)
	lw	%a0, 5(%a1)
	lw	%k0, 4(%a1)
	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	flw	%f1, 0(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%s0)
	flw	%f1, 1(%v0)
	flw	%f0, 1(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%s0)
	flw	%f1, 2(%v0)
	flw	%f0, 2(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%s0)
	beqi	%a1, 2, bnei_else.34914
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.34916
	j	bnei_cont.34915
bgt_else.34916:
	flw	%f17, 0(%s0)
	flw	%f18, 1(%s0)
	flw	%f19, 2(%s0)
	fmul	%f1, %f17, %f17
	flw	%f0, 0(%k0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18
	flw	%f0, 1(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f19
	flw	%f0, 2(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	beqi	%a3, 0, bnei_else.34918
	fmul	%f16, %f18, %f19
	flw	%f1, 0(%a2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f19, %f17
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f17, %f18
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.34919
bnei_else.34918:
bnei_cont.34919:
	beqi	%a1, 3, bnei_else.34920
	j	bnei_cont.34921
bnei_else.34920:
	fsub	%f0, %f0, %f30
bnei_cont.34921:
	fsw	%f0, 3(%s0)
bgt_cont.34917:
	j	bnei_cont.34915
bnei_else.34914:
	flw	%f1, 0(%s0)
	flw	%f17, 1(%s0)
	flw	%f16, 2(%s0)
	flw	%f0, 0(%k0)
	fmul	%f1, %f0, %f1
	flw	%f0, 1(%k0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsw	%f0, 3(%s0)
bnei_cont.34915:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.34913:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35069
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%s0, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.35070
	beqi	%a2, 2, bnei_else.35072
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%s0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%s0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%s0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%k0, 0, bnei_else.35074
	fmul	%f18, %f20, %f21
	flw	%f17, 0(%a3)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	flw	%f16, 1(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	flw	%f16, 2(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.35075
bnei_else.35074:
bnei_cont.35075:
	beqi	%a2, 3, bnei_else.35076
	j	bnei_cont.35077
bnei_else.35076:
	fsub	%f16, %f16, %f30
bnei_cont.35077:
	fblt	%f16, %fzero, fbgt_else.35078
	add	%a0, %zero, %zero
	j	fbgt_cont.35079
fbgt_else.35078:
	add	%a0, %zero, %k1
fbgt_cont.35079:
	beqi	%a1, 0, bnei_else.35080
	beqi	%a0, 0, bnei_else.35082
	add	%a0, %zero, %zero
	j	bnei_cont.35081
bnei_else.35082:
	add	%a0, %zero, %k1
bnei_cont.35083:
	j	bnei_cont.35081
bnei_else.35080:
bnei_cont.35081:
	beqi	%a0, 0, bnei_else.35084
	add	%a1, %zero, %zero
	j	bnei_cont.35071
bnei_else.35084:
	add	%a1, %zero, %k1
bnei_cont.35085:
	j	bnei_cont.35071
bnei_else.35072:
	flw	%f16, 0(%s0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%s0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%s0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.35086
	add	%a0, %zero, %zero
	j	fbgt_cont.35087
fbgt_else.35086:
	add	%a0, %zero, %k1
fbgt_cont.35087:
	beqi	%a1, 0, bnei_else.35088
	beqi	%a0, 0, bnei_else.35090
	add	%a0, %zero, %zero
	j	bnei_cont.35089
bnei_else.35090:
	add	%a0, %zero, %k1
bnei_cont.35091:
	j	bnei_cont.35089
bnei_else.35088:
bnei_cont.35089:
	beqi	%a0, 0, bnei_else.35092
	add	%a1, %zero, %zero
	j	bnei_cont.35071
bnei_else.35092:
	add	%a1, %zero, %k1
bnei_cont.35093:
bnei_cont.35073:
	j	bnei_cont.35071
bnei_else.35070:
	fabs	%f17, %f19
	flw	%f16, 0(%s0)
	fblt	%f17, %f16, fbgt_else.35094
	add	%a0, %zero, %zero
	j	fbgt_cont.35095
fbgt_else.35094:
	add	%a0, %zero, %k1
fbgt_cont.35095:
	beqi	%a0, 0, bnei_else.35096
	fabs	%f17, %f20
	flw	%f16, 1(%s0)
	fblt	%f17, %f16, fbgt_else.35098
	add	%a0, %zero, %zero
	j	fbgt_cont.35099
fbgt_else.35098:
	add	%a0, %zero, %k1
fbgt_cont.35099:
	beqi	%a0, 0, bnei_else.35100
	fabs	%f17, %f21
	flw	%f16, 2(%s0)
	fblt	%f17, %f16, fbgt_else.35102
	add	%a0, %zero, %zero
	j	bnei_cont.35097
fbgt_else.35102:
	add	%a0, %zero, %k1
fbgt_cont.35103:
	j	bnei_cont.35097
bnei_else.35100:
	add	%a0, %zero, %zero
bnei_cont.35101:
	j	bnei_cont.35097
bnei_else.35096:
	add	%a0, %zero, %zero
bnei_cont.35097:
	beqi	%a0, 0, bnei_else.35104
	j	bnei_cont.35105
bnei_else.35104:
	beqi	%a1, 0, bnei_else.35106
	add	%a1, %zero, %zero
	j	bnei_cont.35107
bnei_else.35106:
	add	%a1, %zero, %k1
bnei_cont.35107:
bnei_cont.35105:
bnei_cont.35071:
	beqi	%a1, 0, bnei_else.35108
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35108:
	addi	%s1, %v0, 1
	add	%at, %v1, %s1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35109
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%s0, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.35110
	beqi	%a2, 2, bnei_else.35112
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%s0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%s0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%s0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%k0, 0, bnei_else.35114
	fmul	%f18, %f20, %f21
	flw	%f17, 0(%a3)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	flw	%f16, 1(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	flw	%f16, 2(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.35115
bnei_else.35114:
bnei_cont.35115:
	beqi	%a2, 3, bnei_else.35116
	j	bnei_cont.35117
bnei_else.35116:
	fsub	%f16, %f16, %f30
bnei_cont.35117:
	fblt	%f16, %fzero, fbgt_else.35118
	add	%a0, %zero, %zero
	j	fbgt_cont.35119
fbgt_else.35118:
	add	%a0, %zero, %k1
fbgt_cont.35119:
	beqi	%a1, 0, bnei_else.35120
	beqi	%a0, 0, bnei_else.35122
	add	%a0, %zero, %zero
	j	bnei_cont.35121
bnei_else.35122:
	add	%a0, %zero, %k1
bnei_cont.35123:
	j	bnei_cont.35121
bnei_else.35120:
bnei_cont.35121:
	beqi	%a0, 0, bnei_else.35124
	add	%a1, %zero, %zero
	j	bnei_cont.35111
bnei_else.35124:
	add	%a1, %zero, %k1
bnei_cont.35125:
	j	bnei_cont.35111
bnei_else.35112:
	flw	%f16, 0(%s0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%s0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%s0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.35126
	add	%a0, %zero, %zero
	j	fbgt_cont.35127
fbgt_else.35126:
	add	%a0, %zero, %k1
fbgt_cont.35127:
	beqi	%a1, 0, bnei_else.35128
	beqi	%a0, 0, bnei_else.35130
	add	%a0, %zero, %zero
	j	bnei_cont.35129
bnei_else.35130:
	add	%a0, %zero, %k1
bnei_cont.35131:
	j	bnei_cont.35129
bnei_else.35128:
bnei_cont.35129:
	beqi	%a0, 0, bnei_else.35132
	add	%a1, %zero, %zero
	j	bnei_cont.35111
bnei_else.35132:
	add	%a1, %zero, %k1
bnei_cont.35133:
bnei_cont.35113:
	j	bnei_cont.35111
bnei_else.35110:
	fabs	%f17, %f19
	flw	%f16, 0(%s0)
	fblt	%f17, %f16, fbgt_else.35134
	add	%a0, %zero, %zero
	j	fbgt_cont.35135
fbgt_else.35134:
	add	%a0, %zero, %k1
fbgt_cont.35135:
	beqi	%a0, 0, bnei_else.35136
	fabs	%f17, %f20
	flw	%f16, 1(%s0)
	fblt	%f17, %f16, fbgt_else.35138
	add	%a0, %zero, %zero
	j	fbgt_cont.35139
fbgt_else.35138:
	add	%a0, %zero, %k1
fbgt_cont.35139:
	beqi	%a0, 0, bnei_else.35140
	fabs	%f17, %f21
	flw	%f16, 2(%s0)
	fblt	%f17, %f16, fbgt_else.35142
	add	%a0, %zero, %zero
	j	bnei_cont.35137
fbgt_else.35142:
	add	%a0, %zero, %k1
fbgt_cont.35143:
	j	bnei_cont.35137
bnei_else.35140:
	add	%a0, %zero, %zero
bnei_cont.35141:
	j	bnei_cont.35137
bnei_else.35136:
	add	%a0, %zero, %zero
bnei_cont.35137:
	beqi	%a0, 0, bnei_else.35144
	j	bnei_cont.35145
bnei_else.35144:
	beqi	%a1, 0, bnei_else.35146
	add	%a1, %zero, %zero
	j	bnei_cont.35147
bnei_else.35146:
	add	%a1, %zero, %k1
bnei_cont.35147:
bnei_cont.35145:
bnei_cont.35111:
	beqi	%a1, 0, bnei_else.35148
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35148:
	addi	%a0, %s1, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2919
bnei_else.35109:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35069:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2925:
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra
	add	%at, %v1, %s2
	lw	%ra, 0(%at)
	beqi	%ra, -1, bnei_else.35346
	lw	%a2, 12(%ra)
	flw	%f19, 138(%zero)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%s0, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f0, 0(%a0)
	fsub	%f21, %f19, %f0
	flw	%f16, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f22, %f16, %f0
	flw	%f18, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f23, %f18, %f0
	lw	%ra, 187(%ra)
	beqi	%a2, 1, bnei_else.35347
	beqi	%a2, 2, bnei_else.35349
	flw	%f20, 0(%ra)
	fbne	%f20, %fzero, fbeq_else.35351
	add	%a0, %zero, %k1
	j	fbeq_cont.35352
fbeq_else.35351:
	add	%a0, %zero, %zero
fbeq_cont.35352:
	beqi	%a0, 0, bnei_else.35353
	add	%a0, %zero, %zero
	j	bnei_cont.35348
bnei_else.35353:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f21
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f23
	fadd	%f2, %f1, %f0
	fmul	%f1, %f21, %f21
	flw	%f0, 0(%s0)
	fmul	%f17, %f1, %f0
	fmul	%f1, %f22, %f22
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f23, %f23
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	beqi	%k0, 0, bnei_else.35355
	fmul	%f17, %f22, %f23
	flw	%f1, 0(%a3)
	fmul	%f1, %f17, %f1
	fadd	%f17, %f0, %f1
	fmul	%f1, %f23, %f21
	flw	%f0, 1(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f21, %f22
	flw	%f0, 2(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.35356
bnei_else.35355:
bnei_cont.35356:
	beqi	%a2, 3, bnei_else.35357
	j	bnei_cont.35358
bnei_else.35357:
	fsub	%f0, %f0, %f30
bnei_cont.35358:
	fmul	%f1, %f2, %f2
	fmul	%f0, %f20, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.35359
	add	%a0, %zero, %zero
	j	fbgt_cont.35360
fbgt_else.35359:
	add	%a0, %zero, %k1
fbgt_cont.35360:
	beqi	%a0, 0, bnei_else.35361
	beqi	%a1, 0, bnei_else.35363
	fsqrt	%f0, %f0
	fadd	%f1, %f2, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.35364
bnei_else.35363:
	fsqrt	%f0, %f0
	fsub	%f1, %f2, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.35364:
	add	%a0, %zero, %k1
	j	bnei_cont.35348
bnei_else.35361:
	add	%a0, %zero, %zero
bnei_cont.35362:
bnei_cont.35354:
	j	bnei_cont.35348
bnei_else.35349:
	flw	%f0, 0(%ra)
	fblt	%f0, %fzero, fbgt_else.35365
	add	%a0, %zero, %zero
	j	fbgt_cont.35366
fbgt_else.35365:
	add	%a0, %zero, %k1
fbgt_cont.35366:
	beqi	%a0, 0, bnei_else.35367
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f21
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f23
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35348
bnei_else.35367:
	add	%a0, %zero, %zero
bnei_cont.35368:
bnei_cont.35350:
	j	bnei_cont.35348
bnei_else.35347:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f21
	flw	%f20, 1(%ra)
	fmul	%f24, %f0, %f20
	flw	%f2, 185(%zero)
	fmul	%f0, %f24, %f2
	fadd	%f0, %f0, %f22
	fabs	%f0, %f0
	flw	%f17, 1(%s0)
	fblt	%f0, %f17, fbgt_else.35369
	add	%a0, %zero, %zero
	j	fbgt_cont.35370
fbgt_else.35369:
	add	%a0, %zero, %k1
fbgt_cont.35370:
	beqi	%a0, 0, bnei_else.35371
	flw	%f0, 186(%zero)
	fmul	%f0, %f24, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%s0)
	fblt	%f1, %f0, fbgt_else.35373
	add	%a0, %zero, %zero
	j	fbgt_cont.35374
fbgt_else.35373:
	add	%a0, %zero, %k1
fbgt_cont.35374:
	beqi	%a0, 0, bnei_else.35375
	fbne	%f20, %fzero, fbeq_else.35377
	add	%a0, %zero, %k1
	j	fbeq_cont.35378
fbeq_else.35377:
	add	%a0, %zero, %zero
fbeq_cont.35378:
	beqi	%a0, 0, bnei_else.35379
	add	%a0, %zero, %zero
	j	bnei_cont.35372
bnei_else.35379:
	add	%a0, %zero, %k1
bnei_cont.35380:
	j	bnei_cont.35372
bnei_else.35375:
	add	%a0, %zero, %zero
bnei_cont.35376:
	j	bnei_cont.35372
bnei_else.35371:
	add	%a0, %zero, %zero
bnei_cont.35372:
	beqi	%a0, 0, bnei_else.35381
	fsw	%f24, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35382
bnei_else.35381:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f22
	flw	%f25, 3(%ra)
	fmul	%f26, %f0, %f25
	flw	%f24, 184(%zero)
	fmul	%f0, %f26, %f24
	fadd	%f0, %f0, %f21
	fabs	%f0, %f0
	flw	%f20, 0(%s0)
	fblt	%f0, %f20, fbgt_else.35383
	add	%a0, %zero, %zero
	j	fbgt_cont.35384
fbgt_else.35383:
	add	%a0, %zero, %k1
fbgt_cont.35384:
	beqi	%a0, 0, bnei_else.35385
	flw	%f0, 186(%zero)
	fmul	%f0, %f26, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%s0)
	fblt	%f1, %f0, fbgt_else.35387
	add	%a0, %zero, %zero
	j	fbgt_cont.35388
fbgt_else.35387:
	add	%a0, %zero, %k1
fbgt_cont.35388:
	beqi	%a0, 0, bnei_else.35389
	fbne	%f25, %fzero, fbeq_else.35391
	add	%a0, %zero, %k1
	j	fbeq_cont.35392
fbeq_else.35391:
	add	%a0, %zero, %zero
fbeq_cont.35392:
	beqi	%a0, 0, bnei_else.35393
	add	%a0, %zero, %zero
	j	bnei_cont.35386
bnei_else.35393:
	add	%a0, %zero, %k1
bnei_cont.35394:
	j	bnei_cont.35386
bnei_else.35389:
	add	%a0, %zero, %zero
bnei_cont.35390:
	j	bnei_cont.35386
bnei_else.35385:
	add	%a0, %zero, %zero
bnei_cont.35386:
	beqi	%a0, 0, bnei_else.35395
	fsw	%f26, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.35396
bnei_else.35395:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f23
	flw	%f23, 5(%ra)
	fmul	%f1, %f0, %f23
	fmul	%f0, %f1, %f24
	fadd	%f0, %f0, %f21
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.35397
	add	%a0, %zero, %zero
	j	fbgt_cont.35398
fbgt_else.35397:
	add	%a0, %zero, %k1
fbgt_cont.35398:
	beqi	%a0, 0, bnei_else.35399
	fmul	%f0, %f1, %f2
	fadd	%f0, %f0, %f22
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.35401
	add	%a0, %zero, %zero
	j	fbgt_cont.35402
fbgt_else.35401:
	add	%a0, %zero, %k1
fbgt_cont.35402:
	beqi	%a0, 0, bnei_else.35403
	fbne	%f23, %fzero, fbeq_else.35405
	add	%a0, %zero, %k1
	j	fbeq_cont.35406
fbeq_else.35405:
	add	%a0, %zero, %zero
fbeq_cont.35406:
	beqi	%a0, 0, bnei_else.35407
	add	%a0, %zero, %zero
	j	bnei_cont.35400
bnei_else.35407:
	add	%a0, %zero, %k1
bnei_cont.35408:
	j	bnei_cont.35400
bnei_else.35403:
	add	%a0, %zero, %zero
bnei_cont.35404:
	j	bnei_cont.35400
bnei_else.35399:
	add	%a0, %zero, %zero
bnei_cont.35400:
	beqi	%a0, 0, bnei_else.35409
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.35410
bnei_else.35409:
	add	%a0, %zero, %zero
bnei_cont.35410:
bnei_cont.35396:
bnei_cont.35382:
bnei_cont.35348:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.35411
	flw	%f0, 467(%zero)
	fblt	%f1, %f0, fbgt_else.35413
	add	%a0, %zero, %zero
	j	bnei_cont.35412
fbgt_else.35413:
	add	%a0, %zero, %k1
fbgt_cont.35414:
	j	bnei_cont.35412
bnei_else.35411:
	add	%a0, %zero, %zero
bnei_cont.35412:
	beqi	%a0, 0, bnei_else.35415
	flw	%f0, 466(%zero)
	fadd	%f17, %f1, %f0
	flw	%f0, 78(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f0, %f19
	flw	%f1, 79(%zero)
	fmul	%f1, %f1, %f17
	fadd	%f1, %f1, %f16
	flw	%f16, 80(%zero)
	fmul	%f16, %f16, %f17
	fadd	%f2, %f16, %f18
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.35416
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%ra, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.35418
	beqi	%a2, 2, bnei_else.35420
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%ra)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%k0, 0, bnei_else.35422
	fmul	%f18, %f20, %f21
	flw	%f17, 0(%a3)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	flw	%f16, 1(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	flw	%f16, 2(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.35423
bnei_else.35422:
bnei_cont.35423:
	beqi	%a2, 3, bnei_else.35424
	j	bnei_cont.35425
bnei_else.35424:
	fsub	%f16, %f16, %f30
bnei_cont.35425:
	fblt	%f16, %fzero, fbgt_else.35426
	add	%a0, %zero, %zero
	j	fbgt_cont.35427
fbgt_else.35426:
	add	%a0, %zero, %k1
fbgt_cont.35427:
	beqi	%a1, 0, bnei_else.35428
	beqi	%a0, 0, bnei_else.35430
	add	%a0, %zero, %zero
	j	bnei_cont.35429
bnei_else.35430:
	add	%a0, %zero, %k1
bnei_cont.35431:
	j	bnei_cont.35429
bnei_else.35428:
bnei_cont.35429:
	beqi	%a0, 0, bnei_else.35432
	add	%a1, %zero, %zero
	j	bnei_cont.35419
bnei_else.35432:
	add	%a1, %zero, %k1
bnei_cont.35433:
	j	bnei_cont.35419
bnei_else.35420:
	flw	%f16, 0(%ra)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%ra)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%ra)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.35434
	add	%a0, %zero, %zero
	j	fbgt_cont.35435
fbgt_else.35434:
	add	%a0, %zero, %k1
fbgt_cont.35435:
	beqi	%a1, 0, bnei_else.35436
	beqi	%a0, 0, bnei_else.35438
	add	%a0, %zero, %zero
	j	bnei_cont.35437
bnei_else.35438:
	add	%a0, %zero, %k1
bnei_cont.35439:
	j	bnei_cont.35437
bnei_else.35436:
bnei_cont.35437:
	beqi	%a0, 0, bnei_else.35440
	add	%a1, %zero, %zero
	j	bnei_cont.35419
bnei_else.35440:
	add	%a1, %zero, %k1
bnei_cont.35441:
bnei_cont.35421:
	j	bnei_cont.35419
bnei_else.35418:
	fabs	%f17, %f19
	flw	%f16, 0(%ra)
	fblt	%f17, %f16, fbgt_else.35442
	add	%a0, %zero, %zero
	j	fbgt_cont.35443
fbgt_else.35442:
	add	%a0, %zero, %k1
fbgt_cont.35443:
	beqi	%a0, 0, bnei_else.35444
	fabs	%f17, %f20
	flw	%f16, 1(%ra)
	fblt	%f17, %f16, fbgt_else.35446
	add	%a0, %zero, %zero
	j	fbgt_cont.35447
fbgt_else.35446:
	add	%a0, %zero, %k1
fbgt_cont.35447:
	beqi	%a0, 0, bnei_else.35448
	fabs	%f17, %f21
	flw	%f16, 2(%ra)
	fblt	%f17, %f16, fbgt_else.35450
	add	%a0, %zero, %zero
	j	bnei_cont.35445
fbgt_else.35450:
	add	%a0, %zero, %k1
fbgt_cont.35451:
	j	bnei_cont.35445
bnei_else.35448:
	add	%a0, %zero, %zero
bnei_cont.35449:
	j	bnei_cont.35445
bnei_else.35444:
	add	%a0, %zero, %zero
bnei_cont.35445:
	beqi	%a0, 0, bnei_else.35452
	j	bnei_cont.35453
bnei_else.35452:
	beqi	%a1, 0, bnei_else.35454
	add	%a1, %zero, %zero
	j	bnei_cont.35455
bnei_else.35454:
	add	%a1, %zero, %k1
bnei_cont.35455:
bnei_cont.35453:
bnei_cont.35419:
	beqi	%a1, 0, bnei_else.35456
	add	%v0, %zero, %zero
	j	bnei_cont.35417
bnei_else.35456:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.35457:
	j	bnei_cont.35417
bnei_else.35416:
	add	%v0, %zero, %k1
bnei_cont.35417:
	beqi	%v0, 0, bnei_else.35458
	add	%ra, %zero, %s3
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35458:
	addi	%v0, %s2, 1
	add	%ra, %zero, %s3
	j	shadow_check_and_group.2925
bnei_else.35415:
	beqi	%a1, 0, bnei_else.35459
	addi	%v0, %s2, 1
	add	%ra, %zero, %s3
	j	shadow_check_and_group.2925
bnei_else.35459:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35346:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2928:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	add	%at, %s5, %s4
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35504
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35505
	add	%ra, %zero, %s6
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35505:
	addi	%s4, %s4, 1
	add	%at, %s5, %s4
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35506
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35507
	add	%ra, %zero, %s6
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35507:
	addi	%s4, %s4, 1
	add	%at, %s5, %s4
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35508
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35509
	add	%ra, %zero, %s6
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35509:
	addi	%s4, %s4, 1
	add	%at, %s5, %s4
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35510
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35511
	add	%ra, %zero, %s6
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35511:
	addi	%v0, %s4, 1
	add	%ra, %zero, %s6
	addi	%v1, %s5, 0
	j	shadow_check_one_or_group.2928
bnei_else.35510:
	add	%ra, %zero, %s6
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35508:
	add	%ra, %zero, %s6
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35506:
	add	%ra, %zero, %s6
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.35504:
	add	%ra, %zero, %s6
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %ra
	add	%at, %t7, %s7
	lw	%t9, 0(%at)
	lw	%k0, 0(%t9)
	beqi	%k0, -1, bnei_else.35688
	beqi	%k0, 99, bnei_else.35689
	lw	%a1, 12(%k0)
	flw	%f1, 138(%zero)
	lw	%a2, 9(%a1)
	lw	%ra, 6(%a1)
	lw	%a0, 5(%a1)
	lw	%s0, 4(%a1)
	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%k0, 187(%k0)
	beqi	%a1, 1, bnei_else.35691
	beqi	%a1, 2, bnei_else.35693
	flw	%f18, 0(%k0)
	fbne	%f18, %fzero, fbeq_else.35695
	add	%a0, %zero, %k1
	j	fbeq_cont.35696
fbeq_else.35695:
	add	%a0, %zero, %zero
fbeq_cont.35696:
	beqi	%a0, 0, bnei_else.35697
	add	%a0, %zero, %zero
	j	bnei_cont.35692
bnei_else.35697:
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f20
	fadd	%f17, %f1, %f0
	fmul	%f1, %f19, %f19
	flw	%f0, 0(%s0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f20
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	beqi	%a3, 0, bnei_else.35699
	fmul	%f16, %f2, %f20
	flw	%f1, 0(%a2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f20, %f19
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f2
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35700
bnei_else.35699:
bnei_cont.35700:
	beqi	%a1, 3, bnei_else.35701
	j	bnei_cont.35702
bnei_else.35701:
	fsub	%f0, %f0, %f30
bnei_cont.35702:
	fmul	%f1, %f17, %f17
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.35703
	add	%a0, %zero, %zero
	j	fbgt_cont.35704
fbgt_else.35703:
	add	%a0, %zero, %k1
fbgt_cont.35704:
	beqi	%a0, 0, bnei_else.35705
	beqi	%ra, 0, bnei_else.35707
	fsqrt	%f0, %f0
	fadd	%f1, %f17, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.35708
bnei_else.35707:
	fsqrt	%f0, %f0
	fsub	%f1, %f17, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.35708:
	add	%a0, %zero, %k1
	j	bnei_cont.35692
bnei_else.35705:
	add	%a0, %zero, %zero
bnei_cont.35706:
bnei_cont.35698:
	j	bnei_cont.35692
bnei_else.35693:
	flw	%f0, 0(%k0)
	fblt	%f0, %fzero, fbgt_else.35709
	add	%a0, %zero, %zero
	j	fbgt_cont.35710
fbgt_else.35709:
	add	%a0, %zero, %k1
fbgt_cont.35710:
	beqi	%a0, 0, bnei_else.35711
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f20
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35692
bnei_else.35711:
	add	%a0, %zero, %zero
bnei_cont.35712:
bnei_cont.35694:
	j	bnei_cont.35692
bnei_else.35691:
	flw	%f0, 0(%k0)
	fsub	%f0, %f0, %f19
	flw	%f21, 1(%k0)
	fmul	%f18, %f0, %f21
	flw	%f17, 185(%zero)
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f16, 1(%s0)
	fblt	%f0, %f16, fbgt_else.35713
	add	%a0, %zero, %zero
	j	fbgt_cont.35714
fbgt_else.35713:
	add	%a0, %zero, %k1
fbgt_cont.35714:
	beqi	%a0, 0, bnei_else.35715
	flw	%f0, 186(%zero)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%s0)
	fblt	%f1, %f0, fbgt_else.35717
	add	%a0, %zero, %zero
	j	fbgt_cont.35718
fbgt_else.35717:
	add	%a0, %zero, %k1
fbgt_cont.35718:
	beqi	%a0, 0, bnei_else.35719
	fbne	%f21, %fzero, fbeq_else.35721
	add	%a0, %zero, %k1
	j	fbeq_cont.35722
fbeq_else.35721:
	add	%a0, %zero, %zero
fbeq_cont.35722:
	beqi	%a0, 0, bnei_else.35723
	add	%a0, %zero, %zero
	j	bnei_cont.35716
bnei_else.35723:
	add	%a0, %zero, %k1
bnei_cont.35724:
	j	bnei_cont.35716
bnei_else.35719:
	add	%a0, %zero, %zero
bnei_cont.35720:
	j	bnei_cont.35716
bnei_else.35715:
	add	%a0, %zero, %zero
bnei_cont.35716:
	beqi	%a0, 0, bnei_else.35725
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35726
bnei_else.35725:
	flw	%f0, 2(%k0)
	fsub	%f0, %f0, %f2
	flw	%f23, 3(%k0)
	fmul	%f22, %f0, %f23
	flw	%f21, 184(%zero)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f19
	fabs	%f0, %f0
	flw	%f18, 0(%s0)
	fblt	%f0, %f18, fbgt_else.35727
	add	%a0, %zero, %zero
	j	fbgt_cont.35728
fbgt_else.35727:
	add	%a0, %zero, %k1
fbgt_cont.35728:
	beqi	%a0, 0, bnei_else.35729
	flw	%f0, 186(%zero)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%s0)
	fblt	%f1, %f0, fbgt_else.35731
	add	%a0, %zero, %zero
	j	fbgt_cont.35732
fbgt_else.35731:
	add	%a0, %zero, %k1
fbgt_cont.35732:
	beqi	%a0, 0, bnei_else.35733
	fbne	%f23, %fzero, fbeq_else.35735
	add	%a0, %zero, %k1
	j	fbeq_cont.35736
fbeq_else.35735:
	add	%a0, %zero, %zero
fbeq_cont.35736:
	beqi	%a0, 0, bnei_else.35737
	add	%a0, %zero, %zero
	j	bnei_cont.35730
bnei_else.35737:
	add	%a0, %zero, %k1
bnei_cont.35738:
	j	bnei_cont.35730
bnei_else.35733:
	add	%a0, %zero, %zero
bnei_cont.35734:
	j	bnei_cont.35730
bnei_else.35729:
	add	%a0, %zero, %zero
bnei_cont.35730:
	beqi	%a0, 0, bnei_else.35739
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.35740
bnei_else.35739:
	flw	%f0, 4(%k0)
	fsub	%f0, %f0, %f20
	flw	%f20, 5(%k0)
	fmul	%f1, %f0, %f20
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f19
	fabs	%f0, %f0
	fblt	%f0, %f18, fbgt_else.35741
	add	%a0, %zero, %zero
	j	fbgt_cont.35742
fbgt_else.35741:
	add	%a0, %zero, %k1
fbgt_cont.35742:
	beqi	%a0, 0, bnei_else.35743
	fmul	%f0, %f1, %f17
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f16, fbgt_else.35745
	add	%a0, %zero, %zero
	j	fbgt_cont.35746
fbgt_else.35745:
	add	%a0, %zero, %k1
fbgt_cont.35746:
	beqi	%a0, 0, bnei_else.35747
	fbne	%f20, %fzero, fbeq_else.35749
	add	%a0, %zero, %k1
	j	fbeq_cont.35750
fbeq_else.35749:
	add	%a0, %zero, %zero
fbeq_cont.35750:
	beqi	%a0, 0, bnei_else.35751
	add	%a0, %zero, %zero
	j	bnei_cont.35744
bnei_else.35751:
	add	%a0, %zero, %k1
bnei_cont.35752:
	j	bnei_cont.35744
bnei_else.35747:
	add	%a0, %zero, %zero
bnei_cont.35748:
	j	bnei_cont.35744
bnei_else.35743:
	add	%a0, %zero, %zero
bnei_cont.35744:
	beqi	%a0, 0, bnei_else.35753
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.35754
bnei_else.35753:
	add	%a0, %zero, %zero
bnei_cont.35754:
bnei_cont.35740:
bnei_cont.35726:
bnei_cont.35692:
	beqi	%a0, 0, bnei_else.35755
	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	fblt	%f1, %f0, fbgt_else.35757
	add	%a0, %zero, %zero
	j	fbgt_cont.35758
fbgt_else.35757:
	add	%a0, %zero, %k1
fbgt_cont.35758:
	beqi	%a0, 0, bnei_else.35759
	lw	%a0, 1(%t9)
	beqi	%a0, -1, bnei_else.35761
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35763
	add	%v0, %zero, %k1
	j	bnei_cont.35762
bnei_else.35763:
	lw	%a0, 2(%t9)
	beqi	%a0, -1, bnei_else.35765
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35767
	add	%v0, %zero, %k1
	j	bnei_cont.35762
bnei_else.35767:
	lw	%a0, 3(%t9)
	beqi	%a0, -1, bnei_else.35769
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35771
	add	%v0, %zero, %k1
	j	bnei_cont.35762
bnei_else.35771:
	addi	%v0, %zero, 4
	addi	%v1, %t9, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.35772:
	j	bnei_cont.35762
bnei_else.35769:
	add	%v0, %zero, %zero
bnei_cont.35770:
bnei_cont.35768:
	j	bnei_cont.35762
bnei_else.35765:
	add	%v0, %zero, %zero
bnei_cont.35766:
bnei_cont.35764:
	j	bnei_cont.35762
bnei_else.35761:
	add	%v0, %zero, %zero
bnei_cont.35762:
	beqi	%v0, 0, bnei_else.35773
	add	%a0, %zero, %k1
	j	bnei_cont.35690
bnei_else.35773:
	add	%a0, %zero, %zero
bnei_cont.35774:
	j	bnei_cont.35690
bnei_else.35759:
	add	%a0, %zero, %zero
bnei_cont.35760:
	j	bnei_cont.35690
bnei_else.35755:
	add	%a0, %zero, %zero
bnei_cont.35756:
	j	bnei_cont.35690
bnei_else.35689:
	add	%a0, %zero, %k1
bnei_cont.35690:
	beqi	%a0, 0, bnei_else.35775
	lw	%a0, 1(%t9)
	beqi	%a0, -1, bnei_else.35776
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35778
	add	%v0, %zero, %k1
	j	bnei_cont.35777
bnei_else.35778:
	lw	%a0, 2(%t9)
	beqi	%a0, -1, bnei_else.35780
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35782
	add	%v0, %zero, %k1
	j	bnei_cont.35777
bnei_else.35782:
	lw	%a0, 3(%t9)
	beqi	%a0, -1, bnei_else.35784
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.35786
	add	%v0, %zero, %k1
	j	bnei_cont.35777
bnei_else.35786:
	addi	%v0, %zero, 4
	addi	%v1, %t9, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.35787:
	j	bnei_cont.35777
bnei_else.35784:
	add	%v0, %zero, %zero
bnei_cont.35785:
bnei_cont.35783:
	j	bnei_cont.35777
bnei_else.35780:
	add	%v0, %zero, %zero
bnei_cont.35781:
bnei_cont.35779:
	j	bnei_cont.35777
bnei_else.35776:
	add	%v0, %zero, %zero
bnei_cont.35777:
	beqi	%v0, 0, bnei_else.35788
	add	%ra, %zero, %t8
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.35788:
	addi	%v0, %s7, 1
	add	%ra, %zero, %t8
	addi	%v1, %t7, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.35775:
	addi	%v0, %s7, 1
	add	%ra, %zero, %t8
	addi	%v1, %t7, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.35688:
	add	%ra, %zero, %t8
	add	%v0, %zero, %zero
	jr	%ra
solve_each_element.2934:
	add	%s2, %zero, %v0
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra
	add	%at, %v1, %s2
	lw	%s5, 0(%at)
	beqi	%s5, -1, bnei_else.36036
	lw	%a3, 12(%s5)
	flw	%f19, 159(%zero)
	lw	%k0, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%ra, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f2, %f19, %f0
	flw	%f18, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f21, %f18, %f0
	flw	%f17, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f17, %f0
	beqi	%a3, 1, bnei_else.36037
	beqi	%a3, 2, bnei_else.36039
	flw	%f28, 0(%s3)
	flw	%f26, 1(%s3)
	flw	%f29, 2(%s3)
	fmul	%f0, %f28, %f28
	flw	%f25, 0(%a1)
	fmul	%f1, %f0, %f25
	fmul	%f0, %f26, %f26
	flw	%f24, 1(%a1)
	fmul	%f0, %f0, %f24
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f29
	flw	%f23, 2(%a1)
	fmul	%f0, %f0, %f23
	fadd	%f0, %f1, %f0
	beqi	%ra, 0, bnei_else.36041
	fmul	%f16, %f26, %f29
	flw	%f1, 0(%k0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f29, %f28
	flw	%f0, 1(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f28, %f26
	flw	%f0, 2(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.36042
bnei_else.36041:
bnei_cont.36042:
	fbne	%f0, %fzero, fbeq_else.36043
	add	%a0, %zero, %k1
	j	fbeq_cont.36044
fbeq_else.36043:
	add	%a0, %zero, %zero
fbeq_cont.36044:
	beqi	%a0, 0, bnei_else.36045
	add	%s6, %zero, %zero
	j	bnei_cont.36038
bnei_else.36045:
	fmul	%f1, %f28, %f2
	fmul	%f16, %f1, %f25
	fmul	%f1, %f26, %f21
	fmul	%f1, %f1, %f24
	fadd	%f16, %f16, %f1
	fmul	%f1, %f29, %f20
	fmul	%f1, %f1, %f23
	fadd	%f1, %f16, %f1
	beqi	%ra, 0, bnei_else.36047
	fmul	%f22, %f29, %f21
	fmul	%f16, %f26, %f20
	fadd	%f22, %f22, %f16
	flw	%f16, 0(%k0)
	fmul	%f27, %f22, %f16
	fmul	%f22, %f28, %f20
	fmul	%f16, %f29, %f2
	fadd	%f22, %f22, %f16
	flw	%f16, 1(%k0)
	fmul	%f16, %f22, %f16
	fadd	%f27, %f27, %f16
	fmul	%f22, %f28, %f21
	fmul	%f16, %f26, %f2
	fadd	%f22, %f22, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f22, %f16
	fadd	%f22, %f27, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f22, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.36048
bnei_else.36047:
bnei_cont.36048:
	fmul	%f16, %f2, %f2
	fmul	%f22, %f16, %f25
	fmul	%f16, %f21, %f21
	fmul	%f16, %f16, %f24
	fadd	%f22, %f22, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f23
	fadd	%f16, %f22, %f16
	beqi	%ra, 0, bnei_else.36049
	fmul	%f23, %f21, %f20
	flw	%f22, 0(%k0)
	fmul	%f22, %f23, %f22
	fadd	%f22, %f16, %f22
	fmul	%f20, %f20, %f2
	flw	%f16, 1(%k0)
	fmul	%f16, %f20, %f16
	fadd	%f20, %f22, %f16
	fmul	%f2, %f2, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f2, %f16
	fadd	%f16, %f20, %f16
	j	bnei_cont.36050
bnei_else.36049:
bnei_cont.36050:
	beqi	%a3, 3, bnei_else.36051
	j	bnei_cont.36052
bnei_else.36051:
	fsub	%f16, %f16, %f30
bnei_cont.36052:
	fmul	%f2, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f2, %f16
	fblt	%fzero, %f16, fbgt_else.36053
	add	%a0, %zero, %zero
	j	fbgt_cont.36054
fbgt_else.36053:
	add	%a0, %zero, %k1
fbgt_cont.36054:
	beqi	%a0, 0, bnei_else.36055
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.36057
	j	bnei_cont.36058
bnei_else.36057:
	fneg	%f16, %f16
bnei_cont.36058:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s6, %zero, %k1
	j	bnei_cont.36038
bnei_else.36055:
	add	%s6, %zero, %zero
bnei_cont.36056:
bnei_cont.36046:
	j	bnei_cont.36038
bnei_else.36039:
	flw	%f0, 0(%s3)
	flw	%f24, 0(%a1)
	fmul	%f1, %f0, %f24
	flw	%f0, 1(%s3)
	flw	%f23, 1(%a1)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s3)
	flw	%f22, 2(%a1)
	fmul	%f0, %f0, %f22
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.36059
	add	%a0, %zero, %zero
	j	fbgt_cont.36060
fbgt_else.36059:
	add	%a0, %zero, %k1
fbgt_cont.36060:
	beqi	%a0, 0, bnei_else.36061
	fmul	%f1, %f24, %f2
	fmul	%f0, %f23, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%s6, %zero, %k1
	j	bnei_cont.36038
bnei_else.36061:
	add	%s6, %zero, %zero
bnei_cont.36062:
bnei_cont.36040:
	j	bnei_cont.36038
bnei_else.36037:
	flw	%f22, 0(%s3)
	fbne	%f22, %fzero, fbeq_else.36063
	add	%a0, %zero, %k1
	j	fbeq_cont.36064
fbeq_else.36063:
	add	%a0, %zero, %zero
fbeq_cont.36064:
	beqi	%a0, 0, bnei_else.36065
	add	%a0, %zero, %zero
	j	bnei_cont.36066
bnei_else.36065:
	fblt	%f22, %fzero, fbgt_else.36067
	add	%a0, %zero, %zero
	j	fbgt_cont.36068
fbgt_else.36067:
	add	%a0, %zero, %k1
fbgt_cont.36068:
	beqi	%a2, 0, bnei_else.36069
	beqi	%a0, 0, bnei_else.36071
	add	%a0, %zero, %zero
	j	bnei_cont.36070
bnei_else.36071:
	add	%a0, %zero, %k1
bnei_cont.36072:
	j	bnei_cont.36070
bnei_else.36069:
bnei_cont.36070:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.36073
	j	bnei_cont.36074
bnei_else.36073:
	fneg	%f0, %f0
bnei_cont.36074:
	fsub	%f0, %f0, %f2
	fdiv	%f16, %f0, %f22
	flw	%f0, 1(%s3)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.36075
	add	%a0, %zero, %zero
	j	fbgt_cont.36076
fbgt_else.36075:
	add	%a0, %zero, %k1
fbgt_cont.36076:
	beqi	%a0, 0, bnei_else.36077
	flw	%f0, 2(%s3)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.36079
	add	%a0, %zero, %zero
	j	fbgt_cont.36080
fbgt_else.36079:
	add	%a0, %zero, %k1
fbgt_cont.36080:
	beqi	%a0, 0, bnei_else.36081
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36078
bnei_else.36081:
	add	%a0, %zero, %zero
bnei_cont.36082:
	j	bnei_cont.36078
bnei_else.36077:
	add	%a0, %zero, %zero
bnei_cont.36078:
bnei_cont.36066:
	beqi	%a0, 0, bnei_else.36083
	add	%s6, %zero, %k1
	j	bnei_cont.36084
bnei_else.36083:
	flw	%f16, 1(%s3)
	fbne	%f16, %fzero, fbeq_else.36085
	add	%a0, %zero, %k1
	j	fbeq_cont.36086
fbeq_else.36085:
	add	%a0, %zero, %zero
fbeq_cont.36086:
	beqi	%a0, 0, bnei_else.36087
	add	%a0, %zero, %zero
	j	bnei_cont.36088
bnei_else.36087:
	fblt	%f16, %fzero, fbgt_else.36089
	add	%a0, %zero, %zero
	j	fbgt_cont.36090
fbgt_else.36089:
	add	%a0, %zero, %k1
fbgt_cont.36090:
	beqi	%a2, 0, bnei_else.36091
	beqi	%a0, 0, bnei_else.36093
	add	%a0, %zero, %zero
	j	bnei_cont.36092
bnei_else.36093:
	add	%a0, %zero, %k1
bnei_cont.36094:
	j	bnei_cont.36092
bnei_else.36091:
bnei_cont.36092:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.36095
	j	bnei_cont.36096
bnei_else.36095:
	fneg	%f0, %f0
bnei_cont.36096:
	fsub	%f0, %f0, %f21
	fdiv	%f23, %f0, %f16
	flw	%f0, 2(%s3)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.36097
	add	%a0, %zero, %zero
	j	fbgt_cont.36098
fbgt_else.36097:
	add	%a0, %zero, %k1
fbgt_cont.36098:
	beqi	%a0, 0, bnei_else.36099
	fmul	%f0, %f23, %f22
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.36101
	add	%a0, %zero, %zero
	j	fbgt_cont.36102
fbgt_else.36101:
	add	%a0, %zero, %k1
fbgt_cont.36102:
	beqi	%a0, 0, bnei_else.36103
	fsw	%f23, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36100
bnei_else.36103:
	add	%a0, %zero, %zero
bnei_cont.36104:
	j	bnei_cont.36100
bnei_else.36099:
	add	%a0, %zero, %zero
bnei_cont.36100:
bnei_cont.36088:
	beqi	%a0, 0, bnei_else.36105
	addi	%s6, %zero, 2
	j	bnei_cont.36106
bnei_else.36105:
	flw	%f1, 2(%s3)
	fbne	%f1, %fzero, fbeq_else.36107
	add	%a0, %zero, %k1
	j	fbeq_cont.36108
fbeq_else.36107:
	add	%a0, %zero, %zero
fbeq_cont.36108:
	beqi	%a0, 0, bnei_else.36109
	add	%a0, %zero, %zero
	j	bnei_cont.36110
bnei_else.36109:
	fblt	%f1, %fzero, fbgt_else.36111
	add	%a0, %zero, %zero
	j	fbgt_cont.36112
fbgt_else.36111:
	add	%a0, %zero, %k1
fbgt_cont.36112:
	beqi	%a2, 0, bnei_else.36113
	beqi	%a0, 0, bnei_else.36115
	add	%a0, %zero, %zero
	j	bnei_cont.36114
bnei_else.36115:
	add	%a0, %zero, %k1
bnei_cont.36116:
	j	bnei_cont.36114
bnei_else.36113:
bnei_cont.36114:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.36117
	j	bnei_cont.36118
bnei_else.36117:
	fneg	%f0, %f0
bnei_cont.36118:
	fsub	%f0, %f0, %f20
	fdiv	%f20, %f0, %f1
	fmul	%f0, %f20, %f22
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.36119
	add	%a0, %zero, %zero
	j	fbgt_cont.36120
fbgt_else.36119:
	add	%a0, %zero, %k1
fbgt_cont.36120:
	beqi	%a0, 0, bnei_else.36121
	fmul	%f0, %f20, %f16
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.36123
	add	%a0, %zero, %zero
	j	fbgt_cont.36124
fbgt_else.36123:
	add	%a0, %zero, %k1
fbgt_cont.36124:
	beqi	%a0, 0, bnei_else.36125
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36122
bnei_else.36125:
	add	%a0, %zero, %zero
bnei_cont.36126:
	j	bnei_cont.36122
bnei_else.36121:
	add	%a0, %zero, %zero
bnei_cont.36122:
bnei_cont.36110:
	beqi	%a0, 0, bnei_else.36127
	addi	%s6, %zero, 3
	j	bnei_cont.36128
bnei_else.36127:
	add	%s6, %zero, %zero
bnei_cont.36128:
bnei_cont.36106:
bnei_cont.36084:
bnei_cont.36038:
	beqi	%s6, 0, bnei_else.36129
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.36130
	add	%a0, %zero, %zero
	j	fbgt_cont.36131
fbgt_else.36130:
	add	%a0, %zero, %k1
fbgt_cont.36131:
	beqi	%a0, 0, bnei_else.36132
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.36134
	add	%a0, %zero, %zero
	j	fbgt_cont.36135
fbgt_else.36134:
	add	%a0, %zero, %k1
fbgt_cont.36135:
	beqi	%a0, 0, bnei_cont.36133
	flw	%f0, 466(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%s3)
	fmul	%f0, %f0, %f22
	fadd	%f0, %f0, %f19
	flw	%f1, 1(%s3)
	fmul	%f1, %f1, %f22
	fadd	%f1, %f1, %f18
	flw	%f16, 2(%s3)
	fmul	%f16, %f16, %f22
	fadd	%f2, %f16, %f17
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.36138
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%ra, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.36140
	beqi	%a2, 2, bnei_else.36142
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%ra)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%k0, 0, bnei_else.36144
	fmul	%f18, %f20, %f21
	flw	%f17, 0(%a3)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	flw	%f16, 1(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	flw	%f16, 2(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.36145
bnei_else.36144:
bnei_cont.36145:
	beqi	%a2, 3, bnei_else.36146
	j	bnei_cont.36147
bnei_else.36146:
	fsub	%f16, %f16, %f30
bnei_cont.36147:
	fblt	%f16, %fzero, fbgt_else.36148
	add	%a0, %zero, %zero
	j	fbgt_cont.36149
fbgt_else.36148:
	add	%a0, %zero, %k1
fbgt_cont.36149:
	beqi	%a1, 0, bnei_else.36150
	beqi	%a0, 0, bnei_else.36152
	add	%a0, %zero, %zero
	j	bnei_cont.36151
bnei_else.36152:
	add	%a0, %zero, %k1
bnei_cont.36153:
	j	bnei_cont.36151
bnei_else.36150:
bnei_cont.36151:
	beqi	%a0, 0, bnei_else.36154
	add	%a1, %zero, %zero
	j	bnei_cont.36141
bnei_else.36154:
	add	%a1, %zero, %k1
bnei_cont.36155:
	j	bnei_cont.36141
bnei_else.36142:
	flw	%f16, 0(%ra)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%ra)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%ra)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.36156
	add	%a0, %zero, %zero
	j	fbgt_cont.36157
fbgt_else.36156:
	add	%a0, %zero, %k1
fbgt_cont.36157:
	beqi	%a1, 0, bnei_else.36158
	beqi	%a0, 0, bnei_else.36160
	add	%a0, %zero, %zero
	j	bnei_cont.36159
bnei_else.36160:
	add	%a0, %zero, %k1
bnei_cont.36161:
	j	bnei_cont.36159
bnei_else.36158:
bnei_cont.36159:
	beqi	%a0, 0, bnei_else.36162
	add	%a1, %zero, %zero
	j	bnei_cont.36141
bnei_else.36162:
	add	%a1, %zero, %k1
bnei_cont.36163:
bnei_cont.36143:
	j	bnei_cont.36141
bnei_else.36140:
	fabs	%f17, %f19
	flw	%f16, 0(%ra)
	fblt	%f17, %f16, fbgt_else.36164
	add	%a0, %zero, %zero
	j	fbgt_cont.36165
fbgt_else.36164:
	add	%a0, %zero, %k1
fbgt_cont.36165:
	beqi	%a0, 0, bnei_else.36166
	fabs	%f17, %f20
	flw	%f16, 1(%ra)
	fblt	%f17, %f16, fbgt_else.36168
	add	%a0, %zero, %zero
	j	fbgt_cont.36169
fbgt_else.36168:
	add	%a0, %zero, %k1
fbgt_cont.36169:
	beqi	%a0, 0, bnei_else.36170
	fabs	%f17, %f21
	flw	%f16, 2(%ra)
	fblt	%f17, %f16, fbgt_else.36172
	add	%a0, %zero, %zero
	j	bnei_cont.36167
fbgt_else.36172:
	add	%a0, %zero, %k1
fbgt_cont.36173:
	j	bnei_cont.36167
bnei_else.36170:
	add	%a0, %zero, %zero
bnei_cont.36171:
	j	bnei_cont.36167
bnei_else.36166:
	add	%a0, %zero, %zero
bnei_cont.36167:
	beqi	%a0, 0, bnei_else.36174
	j	bnei_cont.36175
bnei_else.36174:
	beqi	%a1, 0, bnei_else.36176
	add	%a1, %zero, %zero
	j	bnei_cont.36177
bnei_else.36176:
	add	%a1, %zero, %k1
bnei_cont.36177:
bnei_cont.36175:
bnei_cont.36141:
	beqi	%a1, 0, bnei_else.36178
	add	%v0, %zero, %zero
	j	bnei_cont.36139
bnei_else.36178:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.36179:
	j	bnei_cont.36139
bnei_else.36138:
	add	%v0, %zero, %k1
bnei_cont.36139:
	beqi	%v0, 0, bnei_cont.36133
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s5, 141(%zero)
	sw	%s6, 136(%zero)
	j	bnei_cont.36133
bnei_else.36180:
bnei_cont.36181:
	j	bnei_cont.36133
bnei_else.36136:
bnei_cont.36137:
	j	bnei_cont.36133
bnei_else.36132:
bnei_cont.36133:
	addi	%v0, %s2, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	j	solve_each_element.2934
bnei_else.36129:
	beqi	%a2, 0, bnei_else.36182
	addi	%v0, %s2, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	j	solve_each_element.2934
bnei_else.36182:
	add	%ra, %zero, %s4
	jr	%ra
bnei_else.36036:
	add	%ra, %zero, %s4
	jr	%ra
solve_one_or_network.2938:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36237
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36238
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36239
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36240
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36241
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36242
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36243
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36244
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	solve_one_or_network.2938
bnei_else.36244:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36243:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36242:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36241:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36240:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36239:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36238:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.36237:
	add	%ra, %zero, %t9
	jr	%ra
trace_or_matrix.2942:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %v1, %v0
	lw	%s7, 0(%at)
	lw	%a1, 0(%s7)
	beqi	%a1, -1, bnei_else.37099
	beqi	%a1, 99, bnei_else.37100
	lw	%k0, 12(%a1)
	flw	%f1, 159(%zero)
	lw	%ra, 9(%k0)
	lw	%a2, 6(%k0)
	lw	%a3, 5(%k0)
	lw	%a1, 4(%k0)
	lw	%s0, 3(%k0)
	lw	%k0, 1(%k0)
	flw	%f0, 0(%a3)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	flw	%f0, 1(%a3)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	flw	%f0, 2(%a3)
	fsub	%f20, %f1, %f0
	beqi	%k0, 1, bnei_else.37102
	beqi	%k0, 2, bnei_else.37104
	flw	%f25, 0(%a0)
	flw	%f24, 1(%a0)
	flw	%f26, 2(%a0)
	fmul	%f0, %f25, %f25
	flw	%f22, 0(%a1)
	fmul	%f1, %f0, %f22
	fmul	%f0, %f24, %f24
	flw	%f21, 1(%a1)
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26
	flw	%f18, 2(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	beqi	%s0, 0, bnei_else.37106
	fmul	%f16, %f24, %f26
	flw	%f1, 0(%ra)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25
	flw	%f0, 1(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f25, %f24
	flw	%f0, 2(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.37107
bnei_else.37106:
bnei_cont.37107:
	fbne	%f0, %fzero, fbeq_else.37108
	add	%a0, %zero, %k1
	j	fbeq_cont.37109
fbeq_else.37108:
	add	%a0, %zero, %zero
fbeq_cont.37109:
	beqi	%a0, 0, bnei_else.37110
	add	%a0, %zero, %zero
	j	bnei_cont.37103
bnei_else.37110:
	fmul	%f1, %f25, %f19
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2
	fmul	%f1, %f1, %f21
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%s0, 0, bnei_else.37112
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 0(%ra)
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20
	fmul	%f16, %f26, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 1(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f23, %f23, %f16
	fmul	%f17, %f25, %f2
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f23, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37113
bnei_else.37112:
bnei_cont.37113:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%s0, 0, bnei_else.37114
	fmul	%f18, %f2, %f20
	flw	%f17, 0(%ra)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	flw	%f16, 1(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	flw	%f16, 2(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37115
bnei_else.37114:
bnei_cont.37115:
	beqi	%k0, 3, bnei_else.37116
	j	bnei_cont.37117
bnei_else.37116:
	fsub	%f16, %f16, %f30
bnei_cont.37117:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.37118
	add	%a0, %zero, %zero
	j	fbgt_cont.37119
fbgt_else.37118:
	add	%a0, %zero, %k1
fbgt_cont.37119:
	beqi	%a0, 0, bnei_else.37120
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.37122
	j	bnei_cont.37123
bnei_else.37122:
	fneg	%f16, %f16
bnei_cont.37123:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37103
bnei_else.37120:
	add	%a0, %zero, %zero
bnei_cont.37121:
bnei_cont.37111:
	j	bnei_cont.37103
bnei_else.37104:
	flw	%f0, 0(%a0)
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%a0)
	flw	%f18, 1(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f17, 2(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.37124
	add	%a0, %zero, %zero
	j	fbgt_cont.37125
fbgt_else.37124:
	add	%a0, %zero, %k1
fbgt_cont.37125:
	beqi	%a0, 0, bnei_else.37126
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37103
bnei_else.37126:
	add	%a0, %zero, %zero
bnei_cont.37127:
bnei_cont.37105:
	j	bnei_cont.37103
bnei_else.37102:
	flw	%f17, 0(%a0)
	fbne	%f17, %fzero, fbeq_else.37128
	add	%a0, %zero, %k1
	j	fbeq_cont.37129
fbeq_else.37128:
	add	%a0, %zero, %zero
fbeq_cont.37129:
	beqi	%a0, 0, bnei_else.37130
	add	%a0, %zero, %zero
	j	bnei_cont.37131
bnei_else.37130:
	fblt	%f17, %fzero, fbgt_else.37132
	add	%a0, %zero, %zero
	j	fbgt_cont.37133
fbgt_else.37132:
	add	%a0, %zero, %k1
fbgt_cont.37133:
	beqi	%a2, 0, bnei_else.37134
	beqi	%a0, 0, bnei_else.37136
	add	%a0, %zero, %zero
	j	bnei_cont.37135
bnei_else.37136:
	add	%a0, %zero, %k1
bnei_cont.37137:
	j	bnei_cont.37135
bnei_else.37134:
bnei_cont.37135:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.37138
	j	bnei_cont.37139
bnei_else.37138:
	fneg	%f0, %f0
bnei_cont.37139:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	lw	%a0, 2(%sp)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.37140
	add	%a0, %zero, %zero
	j	fbgt_cont.37141
fbgt_else.37140:
	add	%a0, %zero, %k1
fbgt_cont.37141:
	beqi	%a0, 0, bnei_else.37142
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.37144
	add	%a0, %zero, %zero
	j	fbgt_cont.37145
fbgt_else.37144:
	add	%a0, %zero, %k1
fbgt_cont.37145:
	beqi	%a0, 0, bnei_else.37146
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37143
bnei_else.37146:
	add	%a0, %zero, %zero
bnei_cont.37147:
	j	bnei_cont.37143
bnei_else.37142:
	add	%a0, %zero, %zero
bnei_cont.37143:
bnei_cont.37131:
	beqi	%a0, 0, bnei_else.37148
	add	%a0, %zero, %k1
	j	bnei_cont.37149
bnei_else.37148:
	lw	%a0, 2(%sp)
	flw	%f16, 1(%a0)
	fbne	%f16, %fzero, fbeq_else.37150
	add	%a0, %zero, %k1
	j	fbeq_cont.37151
fbeq_else.37150:
	add	%a0, %zero, %zero
fbeq_cont.37151:
	beqi	%a0, 0, bnei_else.37152
	add	%a0, %zero, %zero
	j	bnei_cont.37153
bnei_else.37152:
	fblt	%f16, %fzero, fbgt_else.37154
	add	%a0, %zero, %zero
	j	fbgt_cont.37155
fbgt_else.37154:
	add	%a0, %zero, %k1
fbgt_cont.37155:
	beqi	%a2, 0, bnei_else.37156
	beqi	%a0, 0, bnei_else.37158
	add	%a0, %zero, %zero
	j	bnei_cont.37157
bnei_else.37158:
	add	%a0, %zero, %k1
bnei_cont.37159:
	j	bnei_cont.37157
bnei_else.37156:
bnei_cont.37157:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.37160
	j	bnei_cont.37161
bnei_else.37160:
	fneg	%f0, %f0
bnei_cont.37161:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.37162
	add	%a0, %zero, %zero
	j	fbgt_cont.37163
fbgt_else.37162:
	add	%a0, %zero, %k1
fbgt_cont.37163:
	beqi	%a0, 0, bnei_else.37164
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.37166
	add	%a0, %zero, %zero
	j	fbgt_cont.37167
fbgt_else.37166:
	add	%a0, %zero, %k1
fbgt_cont.37167:
	beqi	%a0, 0, bnei_else.37168
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37165
bnei_else.37168:
	add	%a0, %zero, %zero
bnei_cont.37169:
	j	bnei_cont.37165
bnei_else.37164:
	add	%a0, %zero, %zero
bnei_cont.37165:
bnei_cont.37153:
	beqi	%a0, 0, bnei_else.37170
	addi	%a0, %zero, 2
	j	bnei_cont.37171
bnei_else.37170:
	lw	%a0, 2(%sp)
	flw	%f1, 2(%a0)
	fbne	%f1, %fzero, fbeq_else.37172
	add	%a0, %zero, %k1
	j	fbeq_cont.37173
fbeq_else.37172:
	add	%a0, %zero, %zero
fbeq_cont.37173:
	beqi	%a0, 0, bnei_else.37174
	add	%a0, %zero, %zero
	j	bnei_cont.37175
bnei_else.37174:
	fblt	%f1, %fzero, fbgt_else.37176
	add	%a0, %zero, %zero
	j	fbgt_cont.37177
fbgt_else.37176:
	add	%a0, %zero, %k1
fbgt_cont.37177:
	beqi	%a2, 0, bnei_else.37178
	beqi	%a0, 0, bnei_else.37180
	add	%a0, %zero, %zero
	j	bnei_cont.37179
bnei_else.37180:
	add	%a0, %zero, %k1
bnei_cont.37181:
	j	bnei_cont.37179
bnei_else.37178:
bnei_cont.37179:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.37182
	j	bnei_cont.37183
bnei_else.37182:
	fneg	%f0, %f0
bnei_cont.37183:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.37184
	add	%a0, %zero, %zero
	j	fbgt_cont.37185
fbgt_else.37184:
	add	%a0, %zero, %k1
fbgt_cont.37185:
	beqi	%a0, 0, bnei_else.37186
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.37188
	add	%a0, %zero, %zero
	j	fbgt_cont.37189
fbgt_else.37188:
	add	%a0, %zero, %k1
fbgt_cont.37189:
	beqi	%a0, 0, bnei_else.37190
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37187
bnei_else.37190:
	add	%a0, %zero, %zero
bnei_cont.37191:
	j	bnei_cont.37187
bnei_else.37186:
	add	%a0, %zero, %zero
bnei_cont.37187:
bnei_cont.37175:
	beqi	%a0, 0, bnei_else.37192
	addi	%a0, %zero, 3
	j	bnei_cont.37193
bnei_else.37192:
	add	%a0, %zero, %zero
bnei_cont.37193:
bnei_cont.37171:
bnei_cont.37149:
bnei_cont.37103:
	beqi	%a0, 0, bnei_cont.37101
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37196
	add	%a0, %zero, %zero
	j	fbgt_cont.37197
fbgt_else.37196:
	add	%a0, %zero, %k1
fbgt_cont.37197:
	beqi	%a0, 0, bnei_cont.37101
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.37101
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -4
	j	bnei_cont.37101
bnei_else.37212:
bnei_cont.37213:
	j	bnei_cont.37101
bnei_else.37210:
bnei_cont.37211:
	j	bnei_cont.37101
bnei_else.37208:
bnei_cont.37209:
	j	bnei_cont.37101
bnei_else.37206:
bnei_cont.37207:
	j	bnei_cont.37101
bnei_else.37204:
bnei_cont.37205:
	j	bnei_cont.37101
bnei_else.37202:
bnei_cont.37203:
	j	bnei_cont.37101
bnei_else.37200:
bnei_cont.37201:
	j	bnei_cont.37101
bnei_else.37198:
bnei_cont.37199:
	j	bnei_cont.37101
bnei_else.37194:
bnei_cont.37195:
	j	bnei_cont.37101
bnei_else.37100:
	lw	%a1, 1(%s7)
	beqi	%a1, -1, bnei_else.37214
	lw	%v1, 83(%a1)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.37215
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2934
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -4
	j	bnei_cont.37215
bnei_else.37226:
bnei_cont.37227:
	j	bnei_cont.37215
bnei_else.37224:
bnei_cont.37225:
	j	bnei_cont.37215
bnei_else.37222:
bnei_cont.37223:
	j	bnei_cont.37215
bnei_else.37220:
bnei_cont.37221:
	j	bnei_cont.37215
bnei_else.37218:
bnei_cont.37219:
	j	bnei_cont.37215
bnei_else.37216:
bnei_cont.37217:
	j	bnei_cont.37215
bnei_else.37214:
bnei_cont.37215:
bnei_cont.37101:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 4(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s7, 0(%at)
	lw	%a0, 0(%s7)
	beqi	%a0, -1, bnei_else.37228
	beqi	%a0, 99, bnei_else.37229
	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%k0, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%ra, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	beqi	%a3, 1, bnei_else.37231
	beqi	%a3, 2, bnei_else.37233
	lw	%a0, 2(%sp)
	flw	%f25, 0(%a0)
	flw	%f24, 1(%a0)
	flw	%f26, 2(%a0)
	fmul	%f0, %f25, %f25
	flw	%f22, 0(%a1)
	fmul	%f1, %f0, %f22
	fmul	%f0, %f24, %f24
	flw	%f21, 1(%a1)
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26
	flw	%f18, 2(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	beqi	%ra, 0, bnei_else.37235
	fmul	%f16, %f24, %f26
	flw	%f1, 0(%k0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25
	flw	%f0, 1(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f25, %f24
	flw	%f0, 2(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.37236
bnei_else.37235:
bnei_cont.37236:
	fbne	%f0, %fzero, fbeq_else.37237
	add	%a0, %zero, %k1
	j	fbeq_cont.37238
fbeq_else.37237:
	add	%a0, %zero, %zero
fbeq_cont.37238:
	beqi	%a0, 0, bnei_else.37239
	add	%a0, %zero, %zero
	j	bnei_cont.37232
bnei_else.37239:
	fmul	%f1, %f25, %f19
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2
	fmul	%f1, %f1, %f21
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%ra, 0, bnei_else.37241
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 0(%k0)
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20
	fmul	%f16, %f26, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f23, %f23, %f16
	fmul	%f17, %f25, %f2
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f23, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37242
bnei_else.37241:
bnei_cont.37242:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%ra, 0, bnei_else.37243
	fmul	%f18, %f2, %f20
	flw	%f17, 0(%k0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37244
bnei_else.37243:
bnei_cont.37244:
	beqi	%a3, 3, bnei_else.37245
	j	bnei_cont.37246
bnei_else.37245:
	fsub	%f16, %f16, %f30
bnei_cont.37246:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.37247
	add	%a0, %zero, %zero
	j	fbgt_cont.37248
fbgt_else.37247:
	add	%a0, %zero, %k1
fbgt_cont.37248:
	beqi	%a0, 0, bnei_else.37249
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.37251
	j	bnei_cont.37252
bnei_else.37251:
	fneg	%f16, %f16
bnei_cont.37252:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37232
bnei_else.37249:
	add	%a0, %zero, %zero
bnei_cont.37250:
bnei_cont.37240:
	j	bnei_cont.37232
bnei_else.37233:
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%a0)
	flw	%f18, 1(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f17, 2(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.37253
	add	%a0, %zero, %zero
	j	fbgt_cont.37254
fbgt_else.37253:
	add	%a0, %zero, %k1
fbgt_cont.37254:
	beqi	%a0, 0, bnei_else.37255
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37232
bnei_else.37255:
	add	%a0, %zero, %zero
bnei_cont.37256:
bnei_cont.37234:
	j	bnei_cont.37232
bnei_else.37231:
	lw	%a0, 2(%sp)
	flw	%f17, 0(%a0)
	fbne	%f17, %fzero, fbeq_else.37257
	add	%a0, %zero, %k1
	j	fbeq_cont.37258
fbeq_else.37257:
	add	%a0, %zero, %zero
fbeq_cont.37258:
	beqi	%a0, 0, bnei_else.37259
	add	%a0, %zero, %zero
	j	bnei_cont.37260
bnei_else.37259:
	fblt	%f17, %fzero, fbgt_else.37261
	add	%a0, %zero, %zero
	j	fbgt_cont.37262
fbgt_else.37261:
	add	%a0, %zero, %k1
fbgt_cont.37262:
	beqi	%a2, 0, bnei_else.37263
	beqi	%a0, 0, bnei_else.37265
	add	%a0, %zero, %zero
	j	bnei_cont.37264
bnei_else.37265:
	add	%a0, %zero, %k1
bnei_cont.37266:
	j	bnei_cont.37264
bnei_else.37263:
bnei_cont.37264:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.37267
	j	bnei_cont.37268
bnei_else.37267:
	fneg	%f0, %f0
bnei_cont.37268:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	lw	%a0, 2(%sp)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.37269
	add	%a0, %zero, %zero
	j	fbgt_cont.37270
fbgt_else.37269:
	add	%a0, %zero, %k1
fbgt_cont.37270:
	beqi	%a0, 0, bnei_else.37271
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.37273
	add	%a0, %zero, %zero
	j	fbgt_cont.37274
fbgt_else.37273:
	add	%a0, %zero, %k1
fbgt_cont.37274:
	beqi	%a0, 0, bnei_else.37275
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37272
bnei_else.37275:
	add	%a0, %zero, %zero
bnei_cont.37276:
	j	bnei_cont.37272
bnei_else.37271:
	add	%a0, %zero, %zero
bnei_cont.37272:
bnei_cont.37260:
	beqi	%a0, 0, bnei_else.37277
	add	%a0, %zero, %k1
	j	bnei_cont.37278
bnei_else.37277:
	lw	%a0, 2(%sp)
	flw	%f16, 1(%a0)
	fbne	%f16, %fzero, fbeq_else.37279
	add	%a0, %zero, %k1
	j	fbeq_cont.37280
fbeq_else.37279:
	add	%a0, %zero, %zero
fbeq_cont.37280:
	beqi	%a0, 0, bnei_else.37281
	add	%a0, %zero, %zero
	j	bnei_cont.37282
bnei_else.37281:
	fblt	%f16, %fzero, fbgt_else.37283
	add	%a0, %zero, %zero
	j	fbgt_cont.37284
fbgt_else.37283:
	add	%a0, %zero, %k1
fbgt_cont.37284:
	beqi	%a2, 0, bnei_else.37285
	beqi	%a0, 0, bnei_else.37287
	add	%a0, %zero, %zero
	j	bnei_cont.37286
bnei_else.37287:
	add	%a0, %zero, %k1
bnei_cont.37288:
	j	bnei_cont.37286
bnei_else.37285:
bnei_cont.37286:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.37289
	j	bnei_cont.37290
bnei_else.37289:
	fneg	%f0, %f0
bnei_cont.37290:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.37291
	add	%a0, %zero, %zero
	j	fbgt_cont.37292
fbgt_else.37291:
	add	%a0, %zero, %k1
fbgt_cont.37292:
	beqi	%a0, 0, bnei_else.37293
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.37295
	add	%a0, %zero, %zero
	j	fbgt_cont.37296
fbgt_else.37295:
	add	%a0, %zero, %k1
fbgt_cont.37296:
	beqi	%a0, 0, bnei_else.37297
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37294
bnei_else.37297:
	add	%a0, %zero, %zero
bnei_cont.37298:
	j	bnei_cont.37294
bnei_else.37293:
	add	%a0, %zero, %zero
bnei_cont.37294:
bnei_cont.37282:
	beqi	%a0, 0, bnei_else.37299
	addi	%a0, %zero, 2
	j	bnei_cont.37300
bnei_else.37299:
	lw	%a0, 2(%sp)
	flw	%f1, 2(%a0)
	fbne	%f1, %fzero, fbeq_else.37301
	add	%a0, %zero, %k1
	j	fbeq_cont.37302
fbeq_else.37301:
	add	%a0, %zero, %zero
fbeq_cont.37302:
	beqi	%a0, 0, bnei_else.37303
	add	%a0, %zero, %zero
	j	bnei_cont.37304
bnei_else.37303:
	fblt	%f1, %fzero, fbgt_else.37305
	add	%a0, %zero, %zero
	j	fbgt_cont.37306
fbgt_else.37305:
	add	%a0, %zero, %k1
fbgt_cont.37306:
	beqi	%a2, 0, bnei_else.37307
	beqi	%a0, 0, bnei_else.37309
	add	%a0, %zero, %zero
	j	bnei_cont.37308
bnei_else.37309:
	add	%a0, %zero, %k1
bnei_cont.37310:
	j	bnei_cont.37308
bnei_else.37307:
bnei_cont.37308:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.37311
	j	bnei_cont.37312
bnei_else.37311:
	fneg	%f0, %f0
bnei_cont.37312:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.37313
	add	%a0, %zero, %zero
	j	fbgt_cont.37314
fbgt_else.37313:
	add	%a0, %zero, %k1
fbgt_cont.37314:
	beqi	%a0, 0, bnei_else.37315
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.37317
	add	%a0, %zero, %zero
	j	fbgt_cont.37318
fbgt_else.37317:
	add	%a0, %zero, %k1
fbgt_cont.37318:
	beqi	%a0, 0, bnei_else.37319
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37316
bnei_else.37319:
	add	%a0, %zero, %zero
bnei_cont.37320:
	j	bnei_cont.37316
bnei_else.37315:
	add	%a0, %zero, %zero
bnei_cont.37316:
bnei_cont.37304:
	beqi	%a0, 0, bnei_else.37321
	addi	%a0, %zero, 3
	j	bnei_cont.37322
bnei_else.37321:
	add	%a0, %zero, %zero
bnei_cont.37322:
bnei_cont.37300:
bnei_cont.37278:
bnei_cont.37232:
	beqi	%a0, 0, bnei_cont.37230
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37325
	add	%a0, %zero, %zero
	j	fbgt_cont.37326
fbgt_else.37325:
	add	%a0, %zero, %k1
fbgt_cont.37326:
	beqi	%a0, 0, bnei_cont.37230
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.37230
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -5
	j	bnei_cont.37230
bnei_else.37339:
bnei_cont.37340:
	j	bnei_cont.37230
bnei_else.37337:
bnei_cont.37338:
	j	bnei_cont.37230
bnei_else.37335:
bnei_cont.37336:
	j	bnei_cont.37230
bnei_else.37333:
bnei_cont.37334:
	j	bnei_cont.37230
bnei_else.37331:
bnei_cont.37332:
	j	bnei_cont.37230
bnei_else.37329:
bnei_cont.37330:
	j	bnei_cont.37230
bnei_else.37327:
bnei_cont.37328:
	j	bnei_cont.37230
bnei_else.37323:
bnei_cont.37324:
	j	bnei_cont.37230
bnei_else.37229:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.37341
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.37342
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.37342
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.37342
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.37342
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.37342
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -5
	j	bnei_cont.37342
bnei_else.37351:
bnei_cont.37352:
	j	bnei_cont.37342
bnei_else.37349:
bnei_cont.37350:
	j	bnei_cont.37342
bnei_else.37347:
bnei_cont.37348:
	j	bnei_cont.37342
bnei_else.37345:
bnei_cont.37346:
	j	bnei_cont.37342
bnei_else.37343:
bnei_cont.37344:
	j	bnei_cont.37342
bnei_else.37341:
bnei_cont.37342:
bnei_cont.37230:
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix.2942
bnei_else.37228:
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.37099:
	jr	%ra
solve_each_element_fast.2948:
	add	%s2, %zero, %v0
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra
	lw	%a3, 1(%s3)
	lw	%a1, 0(%s3)
	add	%at, %v1, %s2
	lw	%s5, 0(%at)
	beqi	%s5, -1, bnei_else.37554
	lw	%a0, 12(%s5)
	lw	%k0, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%ra, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f2, 0(%k0)
	flw	%f16, 1(%k0)
	flw	%f18, 2(%k0)
	add	%at, %a3, %s5
	lw	%a3, 0(%at)
	beqi	%a0, 1, bnei_else.37555
	beqi	%a0, 2, bnei_else.37557
	flw	%f17, 0(%a3)
	fbne	%f17, %fzero, fbeq_else.37559
	add	%a0, %zero, %k1
	j	fbeq_cont.37560
fbeq_else.37559:
	add	%a0, %zero, %zero
fbeq_cont.37560:
	beqi	%a0, 0, bnei_else.37561
	add	%s6, %zero, %zero
	j	bnei_cont.37556
bnei_else.37561:
	flw	%f0, 1(%a3)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.37563
	add	%a0, %zero, %zero
	j	fbgt_cont.37564
fbgt_else.37563:
	add	%a0, %zero, %k1
fbgt_cont.37564:
	beqi	%a0, 0, bnei_else.37565
	beqi	%a2, 0, bnei_else.37567
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.37568
bnei_else.37567:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.37568:
	add	%s6, %zero, %k1
	j	bnei_cont.37556
bnei_else.37565:
	add	%s6, %zero, %zero
bnei_cont.37566:
bnei_cont.37562:
	j	bnei_cont.37556
bnei_else.37557:
	flw	%f1, 0(%a3)
	fblt	%f1, %fzero, fbgt_else.37569
	add	%a0, %zero, %zero
	j	fbgt_cont.37570
fbgt_else.37569:
	add	%a0, %zero, %k1
fbgt_cont.37570:
	beqi	%a0, 0, bnei_else.37571
	flw	%f0, 3(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s6, %zero, %k1
	j	bnei_cont.37556
bnei_else.37571:
	add	%s6, %zero, %zero
bnei_cont.37572:
bnei_cont.37558:
	j	bnei_cont.37556
bnei_else.37555:
	flw	%f0, 0(%a3)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%a3)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%ra)
	fblt	%f0, %f17, fbgt_else.37573
	add	%a0, %zero, %zero
	j	fbgt_cont.37574
fbgt_else.37573:
	add	%a0, %zero, %k1
fbgt_cont.37574:
	beqi	%a0, 0, bnei_else.37575
	flw	%f0, 2(%a1)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37577
	add	%a0, %zero, %zero
	j	fbgt_cont.37578
fbgt_else.37577:
	add	%a0, %zero, %k1
fbgt_cont.37578:
	beqi	%a0, 0, bnei_else.37579
	fbne	%f21, %fzero, fbeq_else.37581
	add	%a0, %zero, %k1
	j	fbeq_cont.37582
fbeq_else.37581:
	add	%a0, %zero, %zero
fbeq_cont.37582:
	beqi	%a0, 0, bnei_else.37583
	add	%a0, %zero, %zero
	j	bnei_cont.37576
bnei_else.37583:
	add	%a0, %zero, %k1
bnei_cont.37584:
	j	bnei_cont.37576
bnei_else.37579:
	add	%a0, %zero, %zero
bnei_cont.37580:
	j	bnei_cont.37576
bnei_else.37575:
	add	%a0, %zero, %zero
bnei_cont.37576:
	beqi	%a0, 0, bnei_else.37585
	fsw	%f20, 135(%zero)
	add	%s6, %zero, %k1
	j	bnei_cont.37586
bnei_else.37585:
	flw	%f0, 2(%a3)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%a3)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%a1)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%ra)
	fblt	%f0, %f20, fbgt_else.37587
	add	%a0, %zero, %zero
	j	fbgt_cont.37588
fbgt_else.37587:
	add	%a0, %zero, %k1
fbgt_cont.37588:
	beqi	%a0, 0, bnei_else.37589
	flw	%f0, 2(%a1)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37591
	add	%a0, %zero, %zero
	j	fbgt_cont.37592
fbgt_else.37591:
	add	%a0, %zero, %k1
fbgt_cont.37592:
	beqi	%a0, 0, bnei_else.37593
	fbne	%f23, %fzero, fbeq_else.37595
	add	%a0, %zero, %k1
	j	fbeq_cont.37596
fbeq_else.37595:
	add	%a0, %zero, %zero
fbeq_cont.37596:
	beqi	%a0, 0, bnei_else.37597
	add	%a0, %zero, %zero
	j	bnei_cont.37590
bnei_else.37597:
	add	%a0, %zero, %k1
bnei_cont.37598:
	j	bnei_cont.37590
bnei_else.37593:
	add	%a0, %zero, %zero
bnei_cont.37594:
	j	bnei_cont.37590
bnei_else.37589:
	add	%a0, %zero, %zero
bnei_cont.37590:
	beqi	%a0, 0, bnei_else.37599
	fsw	%f22, 135(%zero)
	addi	%s6, %zero, 2
	j	bnei_cont.37600
bnei_else.37599:
	flw	%f0, 4(%a3)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a3)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.37601
	add	%a0, %zero, %zero
	j	fbgt_cont.37602
fbgt_else.37601:
	add	%a0, %zero, %k1
fbgt_cont.37602:
	beqi	%a0, 0, bnei_else.37603
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.37605
	add	%a0, %zero, %zero
	j	fbgt_cont.37606
fbgt_else.37605:
	add	%a0, %zero, %k1
fbgt_cont.37606:
	beqi	%a0, 0, bnei_else.37607
	fbne	%f18, %fzero, fbeq_else.37609
	add	%a0, %zero, %k1
	j	fbeq_cont.37610
fbeq_else.37609:
	add	%a0, %zero, %zero
fbeq_cont.37610:
	beqi	%a0, 0, bnei_else.37611
	add	%a0, %zero, %zero
	j	bnei_cont.37604
bnei_else.37611:
	add	%a0, %zero, %k1
bnei_cont.37612:
	j	bnei_cont.37604
bnei_else.37607:
	add	%a0, %zero, %zero
bnei_cont.37608:
	j	bnei_cont.37604
bnei_else.37603:
	add	%a0, %zero, %zero
bnei_cont.37604:
	beqi	%a0, 0, bnei_else.37613
	fsw	%f1, 135(%zero)
	addi	%s6, %zero, 3
	j	bnei_cont.37614
bnei_else.37613:
	add	%s6, %zero, %zero
bnei_cont.37614:
bnei_cont.37600:
bnei_cont.37586:
bnei_cont.37556:
	beqi	%s6, 0, bnei_else.37615
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.37616
	add	%a0, %zero, %zero
	j	fbgt_cont.37617
fbgt_else.37616:
	add	%a0, %zero, %k1
fbgt_cont.37617:
	beqi	%a0, 0, bnei_else.37618
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37620
	add	%a0, %zero, %zero
	j	fbgt_cont.37621
fbgt_else.37620:
	add	%a0, %zero, %k1
fbgt_cont.37621:
	beqi	%a0, 0, bnei_cont.37619
	flw	%f0, 466(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%a1)
	fmul	%f1, %f0, %f22
	flw	%f0, 162(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%a1)
	fmul	%f16, %f1, %f22
	flw	%f1, 163(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 2(%a1)
	fmul	%f17, %f16, %f22
	flw	%f16, 164(%zero)
	fadd	%f2, %f17, %f16
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.37624
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%ra, 4(%a2)
	lw	%k0, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.37626
	beqi	%a2, 2, bnei_else.37628
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%ra)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%ra)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%k0, 0, bnei_else.37630
	fmul	%f18, %f20, %f21
	flw	%f17, 0(%a3)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	flw	%f16, 1(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	flw	%f16, 2(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37631
bnei_else.37630:
bnei_cont.37631:
	beqi	%a2, 3, bnei_else.37632
	j	bnei_cont.37633
bnei_else.37632:
	fsub	%f16, %f16, %f30
bnei_cont.37633:
	fblt	%f16, %fzero, fbgt_else.37634
	add	%a0, %zero, %zero
	j	fbgt_cont.37635
fbgt_else.37634:
	add	%a0, %zero, %k1
fbgt_cont.37635:
	beqi	%a1, 0, bnei_else.37636
	beqi	%a0, 0, bnei_else.37638
	add	%a0, %zero, %zero
	j	bnei_cont.37637
bnei_else.37638:
	add	%a0, %zero, %k1
bnei_cont.37639:
	j	bnei_cont.37637
bnei_else.37636:
bnei_cont.37637:
	beqi	%a0, 0, bnei_else.37640
	add	%a1, %zero, %zero
	j	bnei_cont.37627
bnei_else.37640:
	add	%a1, %zero, %k1
bnei_cont.37641:
	j	bnei_cont.37627
bnei_else.37628:
	flw	%f16, 0(%ra)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%ra)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%ra)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.37642
	add	%a0, %zero, %zero
	j	fbgt_cont.37643
fbgt_else.37642:
	add	%a0, %zero, %k1
fbgt_cont.37643:
	beqi	%a1, 0, bnei_else.37644
	beqi	%a0, 0, bnei_else.37646
	add	%a0, %zero, %zero
	j	bnei_cont.37645
bnei_else.37646:
	add	%a0, %zero, %k1
bnei_cont.37647:
	j	bnei_cont.37645
bnei_else.37644:
bnei_cont.37645:
	beqi	%a0, 0, bnei_else.37648
	add	%a1, %zero, %zero
	j	bnei_cont.37627
bnei_else.37648:
	add	%a1, %zero, %k1
bnei_cont.37649:
bnei_cont.37629:
	j	bnei_cont.37627
bnei_else.37626:
	fabs	%f17, %f19
	flw	%f16, 0(%ra)
	fblt	%f17, %f16, fbgt_else.37650
	add	%a0, %zero, %zero
	j	fbgt_cont.37651
fbgt_else.37650:
	add	%a0, %zero, %k1
fbgt_cont.37651:
	beqi	%a0, 0, bnei_else.37652
	fabs	%f17, %f20
	flw	%f16, 1(%ra)
	fblt	%f17, %f16, fbgt_else.37654
	add	%a0, %zero, %zero
	j	fbgt_cont.37655
fbgt_else.37654:
	add	%a0, %zero, %k1
fbgt_cont.37655:
	beqi	%a0, 0, bnei_else.37656
	fabs	%f17, %f21
	flw	%f16, 2(%ra)
	fblt	%f17, %f16, fbgt_else.37658
	add	%a0, %zero, %zero
	j	bnei_cont.37653
fbgt_else.37658:
	add	%a0, %zero, %k1
fbgt_cont.37659:
	j	bnei_cont.37653
bnei_else.37656:
	add	%a0, %zero, %zero
bnei_cont.37657:
	j	bnei_cont.37653
bnei_else.37652:
	add	%a0, %zero, %zero
bnei_cont.37653:
	beqi	%a0, 0, bnei_else.37660
	j	bnei_cont.37661
bnei_else.37660:
	beqi	%a1, 0, bnei_else.37662
	add	%a1, %zero, %zero
	j	bnei_cont.37663
bnei_else.37662:
	add	%a1, %zero, %k1
bnei_cont.37663:
bnei_cont.37661:
bnei_cont.37627:
	beqi	%a1, 0, bnei_else.37664
	add	%v0, %zero, %zero
	j	bnei_cont.37625
bnei_else.37664:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.37665:
	j	bnei_cont.37625
bnei_else.37624:
	add	%v0, %zero, %k1
bnei_cont.37625:
	beqi	%v0, 0, bnei_cont.37619
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s5, 141(%zero)
	sw	%s6, 136(%zero)
	j	bnei_cont.37619
bnei_else.37666:
bnei_cont.37667:
	j	bnei_cont.37619
bnei_else.37622:
bnei_cont.37623:
	j	bnei_cont.37619
bnei_else.37618:
bnei_cont.37619:
	addi	%v0, %s2, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	j	solve_each_element_fast.2948
bnei_else.37615:
	beqi	%a2, 0, bnei_else.37668
	addi	%v0, %s2, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	j	solve_each_element_fast.2948
bnei_else.37668:
	add	%ra, %zero, %s4
	jr	%ra
bnei_else.37554:
	add	%ra, %zero, %s4
	jr	%ra
solve_one_or_network_fast.2952:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37723
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37724
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37726
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37727
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37728
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37729
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37730
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	solve_one_or_network_fast.2952
bnei_else.37730:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37729:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37728:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37727:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37726:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37725:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37724:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37723:
	add	%ra, %zero, %t9
	jr	%ra
trace_or_matrix_fast.2956:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %v1, %v0
	lw	%s7, 0(%at)
	lw	%s1, 0(%s7)
	beqi	%s1, -1, bnei_else.38381
	beqi	%s1, 99, bnei_else.38382
	lw	%a1, 12(%s1)
	lw	%k0, 10(%a1)
	lw	%a3, 6(%a1)
	lw	%ra, 4(%a1)
	lw	%a2, 1(%a1)
	flw	%f2, 0(%k0)
	flw	%f16, 1(%k0)
	flw	%f18, 2(%k0)
	lw	%a1, 1(%a0)
	lw	%s0, 0(%a0)
	add	%at, %a1, %s1
	lw	%a1, 0(%at)
	beqi	%a2, 1, bnei_else.38384
	beqi	%a2, 2, bnei_else.38386
	flw	%f17, 0(%a1)
	fbne	%f17, %fzero, fbeq_else.38388
	add	%a0, %zero, %k1
	j	fbeq_cont.38389
fbeq_else.38388:
	add	%a0, %zero, %zero
fbeq_cont.38389:
	beqi	%a0, 0, bnei_else.38390
	add	%a0, %zero, %zero
	j	bnei_cont.38385
bnei_else.38390:
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38392
	add	%a0, %zero, %zero
	j	fbgt_cont.38393
fbgt_else.38392:
	add	%a0, %zero, %k1
fbgt_cont.38393:
	beqi	%a0, 0, bnei_else.38394
	beqi	%a3, 0, bnei_else.38396
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38397
bnei_else.38396:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38397:
	add	%a0, %zero, %k1
	j	bnei_cont.38385
bnei_else.38394:
	add	%a0, %zero, %zero
bnei_cont.38395:
bnei_cont.38391:
	j	bnei_cont.38385
bnei_else.38386:
	flw	%f1, 0(%a1)
	fblt	%f1, %fzero, fbgt_else.38398
	add	%a0, %zero, %zero
	j	fbgt_cont.38399
fbgt_else.38398:
	add	%a0, %zero, %k1
fbgt_cont.38399:
	beqi	%a0, 0, bnei_else.38400
	flw	%f0, 3(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38385
bnei_else.38400:
	add	%a0, %zero, %zero
bnei_cont.38401:
bnei_cont.38387:
	j	bnei_cont.38385
bnei_else.38384:
	flw	%f0, 0(%a1)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%a1)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%s0)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%ra)
	fblt	%f0, %f17, fbgt_else.38402
	add	%a0, %zero, %zero
	j	fbgt_cont.38403
fbgt_else.38402:
	add	%a0, %zero, %k1
fbgt_cont.38403:
	beqi	%a0, 0, bnei_else.38404
	flw	%f0, 2(%s0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.38406
	add	%a0, %zero, %zero
	j	fbgt_cont.38407
fbgt_else.38406:
	add	%a0, %zero, %k1
fbgt_cont.38407:
	beqi	%a0, 0, bnei_else.38408
	fbne	%f21, %fzero, fbeq_else.38410
	add	%a0, %zero, %k1
	j	fbeq_cont.38411
fbeq_else.38410:
	add	%a0, %zero, %zero
fbeq_cont.38411:
	beqi	%a0, 0, bnei_else.38412
	add	%a0, %zero, %zero
	j	bnei_cont.38405
bnei_else.38412:
	add	%a0, %zero, %k1
bnei_cont.38413:
	j	bnei_cont.38405
bnei_else.38408:
	add	%a0, %zero, %zero
bnei_cont.38409:
	j	bnei_cont.38405
bnei_else.38404:
	add	%a0, %zero, %zero
bnei_cont.38405:
	beqi	%a0, 0, bnei_else.38414
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38415
bnei_else.38414:
	flw	%f0, 2(%a1)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%a1)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%s0)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%ra)
	fblt	%f0, %f20, fbgt_else.38416
	add	%a0, %zero, %zero
	j	fbgt_cont.38417
fbgt_else.38416:
	add	%a0, %zero, %k1
fbgt_cont.38417:
	beqi	%a0, 0, bnei_else.38418
	flw	%f0, 2(%s0)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.38420
	add	%a0, %zero, %zero
	j	fbgt_cont.38421
fbgt_else.38420:
	add	%a0, %zero, %k1
fbgt_cont.38421:
	beqi	%a0, 0, bnei_else.38422
	fbne	%f23, %fzero, fbeq_else.38424
	add	%a0, %zero, %k1
	j	fbeq_cont.38425
fbeq_else.38424:
	add	%a0, %zero, %zero
fbeq_cont.38425:
	beqi	%a0, 0, bnei_else.38426
	add	%a0, %zero, %zero
	j	bnei_cont.38419
bnei_else.38426:
	add	%a0, %zero, %k1
bnei_cont.38427:
	j	bnei_cont.38419
bnei_else.38422:
	add	%a0, %zero, %zero
bnei_cont.38423:
	j	bnei_cont.38419
bnei_else.38418:
	add	%a0, %zero, %zero
bnei_cont.38419:
	beqi	%a0, 0, bnei_else.38428
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38429
bnei_else.38428:
	flw	%f0, 4(%a1)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a1)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.38430
	add	%a0, %zero, %zero
	j	fbgt_cont.38431
fbgt_else.38430:
	add	%a0, %zero, %k1
fbgt_cont.38431:
	beqi	%a0, 0, bnei_else.38432
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.38434
	add	%a0, %zero, %zero
	j	fbgt_cont.38435
fbgt_else.38434:
	add	%a0, %zero, %k1
fbgt_cont.38435:
	beqi	%a0, 0, bnei_else.38436
	fbne	%f18, %fzero, fbeq_else.38438
	add	%a0, %zero, %k1
	j	fbeq_cont.38439
fbeq_else.38438:
	add	%a0, %zero, %zero
fbeq_cont.38439:
	beqi	%a0, 0, bnei_else.38440
	add	%a0, %zero, %zero
	j	bnei_cont.38433
bnei_else.38440:
	add	%a0, %zero, %k1
bnei_cont.38441:
	j	bnei_cont.38433
bnei_else.38436:
	add	%a0, %zero, %zero
bnei_cont.38437:
	j	bnei_cont.38433
bnei_else.38432:
	add	%a0, %zero, %zero
bnei_cont.38433:
	beqi	%a0, 0, bnei_else.38442
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38443
bnei_else.38442:
	add	%a0, %zero, %zero
bnei_cont.38443:
bnei_cont.38429:
bnei_cont.38415:
bnei_cont.38385:
	beqi	%a0, 0, bnei_cont.38383
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38446
	add	%a0, %zero, %zero
	j	fbgt_cont.38447
fbgt_else.38446:
	add	%a0, %zero, %k1
fbgt_cont.38447:
	beqi	%a0, 0, bnei_cont.38383
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.38383
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -4
	j	bnei_cont.38383
bnei_else.38462:
bnei_cont.38463:
	j	bnei_cont.38383
bnei_else.38460:
bnei_cont.38461:
	j	bnei_cont.38383
bnei_else.38458:
bnei_cont.38459:
	j	bnei_cont.38383
bnei_else.38456:
bnei_cont.38457:
	j	bnei_cont.38383
bnei_else.38454:
bnei_cont.38455:
	j	bnei_cont.38383
bnei_else.38452:
bnei_cont.38453:
	j	bnei_cont.38383
bnei_else.38450:
bnei_cont.38451:
	j	bnei_cont.38383
bnei_else.38448:
bnei_cont.38449:
	j	bnei_cont.38383
bnei_else.38444:
bnei_cont.38445:
	j	bnei_cont.38383
bnei_else.38382:
	lw	%a1, 1(%s7)
	beqi	%a1, -1, bnei_else.38464
	lw	%v1, 83(%a1)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.38465
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -4
	j	bnei_cont.38465
bnei_else.38476:
bnei_cont.38477:
	j	bnei_cont.38465
bnei_else.38474:
bnei_cont.38475:
	j	bnei_cont.38465
bnei_else.38472:
bnei_cont.38473:
	j	bnei_cont.38465
bnei_else.38470:
bnei_cont.38471:
	j	bnei_cont.38465
bnei_else.38468:
bnei_cont.38469:
	j	bnei_cont.38465
bnei_else.38466:
bnei_cont.38467:
	j	bnei_cont.38465
bnei_else.38464:
bnei_cont.38465:
bnei_cont.38383:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 4(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s7, 0(%at)
	lw	%s0, 0(%s7)
	beqi	%s0, -1, bnei_else.38478
	beqi	%s0, 99, bnei_else.38479
	lw	%a0, 12(%s0)
	lw	%k0, 10(%a0)
	lw	%a3, 6(%a0)
	lw	%ra, 4(%a0)
	lw	%a2, 1(%a0)
	flw	%f2, 0(%k0)
	flw	%f16, 1(%k0)
	flw	%f18, 2(%k0)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%a1)
	lw	%a1, 0(%a1)
	add	%at, %a0, %s0
	lw	%s0, 0(%at)
	beqi	%a2, 1, bnei_else.38481
	beqi	%a2, 2, bnei_else.38483
	flw	%f17, 0(%s0)
	fbne	%f17, %fzero, fbeq_else.38485
	add	%a0, %zero, %k1
	j	fbeq_cont.38486
fbeq_else.38485:
	add	%a0, %zero, %zero
fbeq_cont.38486:
	beqi	%a0, 0, bnei_else.38487
	add	%a0, %zero, %zero
	j	bnei_cont.38482
bnei_else.38487:
	flw	%f0, 1(%s0)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%s0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%s0)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38489
	add	%a0, %zero, %zero
	j	fbgt_cont.38490
fbgt_else.38489:
	add	%a0, %zero, %k1
fbgt_cont.38490:
	beqi	%a0, 0, bnei_else.38491
	beqi	%a3, 0, bnei_else.38493
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38494
bnei_else.38493:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38494:
	add	%a0, %zero, %k1
	j	bnei_cont.38482
bnei_else.38491:
	add	%a0, %zero, %zero
bnei_cont.38492:
bnei_cont.38488:
	j	bnei_cont.38482
bnei_else.38483:
	flw	%f1, 0(%s0)
	fblt	%f1, %fzero, fbgt_else.38495
	add	%a0, %zero, %zero
	j	fbgt_cont.38496
fbgt_else.38495:
	add	%a0, %zero, %k1
fbgt_cont.38496:
	beqi	%a0, 0, bnei_else.38497
	flw	%f0, 3(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38482
bnei_else.38497:
	add	%a0, %zero, %zero
bnei_cont.38498:
bnei_cont.38484:
	j	bnei_cont.38482
bnei_else.38481:
	flw	%f0, 0(%s0)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%s0)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%ra)
	fblt	%f0, %f17, fbgt_else.38499
	add	%a0, %zero, %zero
	j	fbgt_cont.38500
fbgt_else.38499:
	add	%a0, %zero, %k1
fbgt_cont.38500:
	beqi	%a0, 0, bnei_else.38501
	flw	%f0, 2(%a1)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.38503
	add	%a0, %zero, %zero
	j	fbgt_cont.38504
fbgt_else.38503:
	add	%a0, %zero, %k1
fbgt_cont.38504:
	beqi	%a0, 0, bnei_else.38505
	fbne	%f21, %fzero, fbeq_else.38507
	add	%a0, %zero, %k1
	j	fbeq_cont.38508
fbeq_else.38507:
	add	%a0, %zero, %zero
fbeq_cont.38508:
	beqi	%a0, 0, bnei_else.38509
	add	%a0, %zero, %zero
	j	bnei_cont.38502
bnei_else.38509:
	add	%a0, %zero, %k1
bnei_cont.38510:
	j	bnei_cont.38502
bnei_else.38505:
	add	%a0, %zero, %zero
bnei_cont.38506:
	j	bnei_cont.38502
bnei_else.38501:
	add	%a0, %zero, %zero
bnei_cont.38502:
	beqi	%a0, 0, bnei_else.38511
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38512
bnei_else.38511:
	flw	%f0, 2(%s0)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%s0)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%a1)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%ra)
	fblt	%f0, %f20, fbgt_else.38513
	add	%a0, %zero, %zero
	j	fbgt_cont.38514
fbgt_else.38513:
	add	%a0, %zero, %k1
fbgt_cont.38514:
	beqi	%a0, 0, bnei_else.38515
	flw	%f0, 2(%a1)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.38517
	add	%a0, %zero, %zero
	j	fbgt_cont.38518
fbgt_else.38517:
	add	%a0, %zero, %k1
fbgt_cont.38518:
	beqi	%a0, 0, bnei_else.38519
	fbne	%f23, %fzero, fbeq_else.38521
	add	%a0, %zero, %k1
	j	fbeq_cont.38522
fbeq_else.38521:
	add	%a0, %zero, %zero
fbeq_cont.38522:
	beqi	%a0, 0, bnei_else.38523
	add	%a0, %zero, %zero
	j	bnei_cont.38516
bnei_else.38523:
	add	%a0, %zero, %k1
bnei_cont.38524:
	j	bnei_cont.38516
bnei_else.38519:
	add	%a0, %zero, %zero
bnei_cont.38520:
	j	bnei_cont.38516
bnei_else.38515:
	add	%a0, %zero, %zero
bnei_cont.38516:
	beqi	%a0, 0, bnei_else.38525
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38526
bnei_else.38525:
	flw	%f0, 4(%s0)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%s0)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.38527
	add	%a0, %zero, %zero
	j	fbgt_cont.38528
fbgt_else.38527:
	add	%a0, %zero, %k1
fbgt_cont.38528:
	beqi	%a0, 0, bnei_else.38529
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.38531
	add	%a0, %zero, %zero
	j	fbgt_cont.38532
fbgt_else.38531:
	add	%a0, %zero, %k1
fbgt_cont.38532:
	beqi	%a0, 0, bnei_else.38533
	fbne	%f18, %fzero, fbeq_else.38535
	add	%a0, %zero, %k1
	j	fbeq_cont.38536
fbeq_else.38535:
	add	%a0, %zero, %zero
fbeq_cont.38536:
	beqi	%a0, 0, bnei_else.38537
	add	%a0, %zero, %zero
	j	bnei_cont.38530
bnei_else.38537:
	add	%a0, %zero, %k1
bnei_cont.38538:
	j	bnei_cont.38530
bnei_else.38533:
	add	%a0, %zero, %zero
bnei_cont.38534:
	j	bnei_cont.38530
bnei_else.38529:
	add	%a0, %zero, %zero
bnei_cont.38530:
	beqi	%a0, 0, bnei_else.38539
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38540
bnei_else.38539:
	add	%a0, %zero, %zero
bnei_cont.38540:
bnei_cont.38526:
bnei_cont.38512:
bnei_cont.38482:
	beqi	%a0, 0, bnei_cont.38480
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38543
	add	%a0, %zero, %zero
	j	fbgt_cont.38544
fbgt_else.38543:
	add	%a0, %zero, %k1
fbgt_cont.38544:
	beqi	%a0, 0, bnei_cont.38480
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.38480
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -5
	j	bnei_cont.38480
bnei_else.38557:
bnei_cont.38558:
	j	bnei_cont.38480
bnei_else.38555:
bnei_cont.38556:
	j	bnei_cont.38480
bnei_else.38553:
bnei_cont.38554:
	j	bnei_cont.38480
bnei_else.38551:
bnei_cont.38552:
	j	bnei_cont.38480
bnei_else.38549:
bnei_cont.38550:
	j	bnei_cont.38480
bnei_else.38547:
bnei_cont.38548:
	j	bnei_cont.38480
bnei_else.38545:
bnei_cont.38546:
	j	bnei_cont.38480
bnei_else.38541:
bnei_cont.38542:
	j	bnei_cont.38480
bnei_else.38479:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.38559
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.38560
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.38560
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.38560
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.38560
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.38560
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -5
	j	bnei_cont.38560
bnei_else.38569:
bnei_cont.38570:
	j	bnei_cont.38560
bnei_else.38567:
bnei_cont.38568:
	j	bnei_cont.38560
bnei_else.38565:
bnei_cont.38566:
	j	bnei_cont.38560
bnei_else.38563:
bnei_cont.38564:
	j	bnei_cont.38560
bnei_else.38561:
bnei_cont.38562:
	j	bnei_cont.38560
bnei_else.38559:
bnei_cont.38560:
bnei_cont.38480:
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix_fast.2956
bnei_else.38478:
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.38381:
	jr	%ra
utexture.2971:
	add	%a0, %zero, %ra
	lw	%a1, 8(%v0)
	lw	%k0, 5(%v0)
	lw	%a2, 4(%v0)
	lw	%a3, 0(%v0)
	flw	%f0, 0(%a1)
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a1)
	fsw	%f0, 146(%zero)
	flw	%f0, 2(%a1)
	fsw	%f0, 147(%zero)
	beqi	%a3, 1, bnei_else.38799
	beqi	%a3, 2, bnei_else.38800
	beqi	%a3, 3, bnei_else.38801
	beqi	%a3, 4, bnei_else.38802
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.38802:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%k0)
	fsub	%f1, %f1, %f0
	flw	%f0, 0(%a2)
	fsqrt	%f0, %f0
	fmul	%f19, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%k0)
	fsub	%f1, %f1, %f0
	flw	%f0, 2(%a2)
	fsqrt	%f0, %f0
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19
	fmul	%f0, %f18, %f18
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19
	flw	%f16, 464(%zero)
	fblt	%f0, %f16, fbgt_else.38804
	add	%a1, %zero, %zero
	j	fbgt_cont.38805
fbgt_else.38804:
	add	%a1, %zero, %k1
fbgt_cont.38805:
	beqi	%a1, 0, bnei_else.38806
	flw	%f1, 463(%zero)
	j	bnei_cont.38807
bnei_else.38806:
	fdiv	%f0, %f18, %f19
	fabs	%f2, %f0
	fblt	%f2, %fzero, fbgt_else.38808
	add	%a1, %zero, %k1
	j	fbgt_cont.38809
fbgt_else.38808:
	add	%a1, %zero, %zero
fbgt_cont.38809:
	fabs	%f19, %f2
	flw	%f0, 462(%zero)
	fblt	%f19, %f0, fbgt_else.38810
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.38812
	flw	%f18, 479(%zero)
	fdiv	%f20, %f30, %f19
	fmul	%f21, %f20, %f20
	fmul	%f2, %f21, %f21
	fmul	%f19, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f1, %f20, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38813
fbgt_else.38812:
	flw	%f18, 478(%zero)
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30
	fdiv	%f20, %f1, %f0
	fmul	%f21, %f20, %f20
	fmul	%f2, %f21, %f21
	fmul	%f19, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f1, %f20, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	fadd	%f0, %f18, %f0
fbgt_cont.38813:
	beqi	%a1, 0, bnei_else.38814
	j	fbgt_cont.38811
bnei_else.38814:
	fneg	%f0, %f0
bnei_cont.38815:
	j	fbgt_cont.38811
fbgt_else.38810:
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f18, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
fbgt_cont.38811:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.38807:
	floor	%f0, %f1
	fsub	%f18, %f1, %f0
	flw	%f1, 1(%v1)
	flw	%f0, 1(%k0)
	fsub	%f1, %f1, %f0
	flw	%f0, 1(%a2)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f17
	fblt	%f0, %f16, fbgt_else.38816
	add	%a1, %zero, %zero
	j	fbgt_cont.38817
fbgt_else.38816:
	add	%a1, %zero, %k1
fbgt_cont.38817:
	beqi	%a1, 0, bnei_else.38818
	flw	%f1, 463(%zero)
	j	bnei_cont.38819
bnei_else.38818:
	fdiv	%f0, %f1, %f17
	fabs	%f19, %f0
	fblt	%f19, %fzero, fbgt_else.38820
	add	%a1, %zero, %k1
	j	fbgt_cont.38821
fbgt_else.38820:
	add	%a1, %zero, %zero
fbgt_cont.38821:
	fabs	%f17, %f19
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.38822
	flw	%f0, 455(%zero)
	fblt	%f17, %f0, fbgt_else.38824
	flw	%f16, 479(%zero)
	fdiv	%f2, %f30, %f17
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f17, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.38825
fbgt_else.38824:
	flw	%f16, 478(%zero)
	fsub	%f1, %f17, %f30
	fadd	%f0, %f17, %f30
	fdiv	%f2, %f1, %f0
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f17, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.38825:
	beqi	%a1, 0, bnei_else.38826
	j	fbgt_cont.38823
bnei_else.38826:
	fneg	%f0, %f0
bnei_cont.38827:
	j	fbgt_cont.38823
fbgt_else.38822:
	fmul	%f2, %f19, %f19
	fmul	%f17, %f2, %f2
	fmul	%f16, %f17, %f17
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fsub	%f1, %f19, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
fbgt_cont.38823:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.38819:
	floor	%f0, %f1
	fsub	%f17, %f1, %f0
	flw	%f1, 452(%zero)
	flw	%f16, 473(%zero)
	fsub	%f0, %f16, %f18
	fmul	%f0, %f0, %f0
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	fblt	%f0, %fzero, fbgt_else.38828
	add	%a1, %zero, %zero
	j	fbgt_cont.38829
fbgt_else.38828:
	add	%a1, %zero, %k1
fbgt_cont.38829:
	beqi	%a1, 0, bnei_else.38830
	fmov	%f0, %fzero
	j	bnei_cont.38831
bnei_else.38830:
bnei_cont.38831:
	flw	%f1, 451(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.38801:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%k0)
	fsub	%f16, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%k0)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f16, %f16
	fmul	%f0, %f0, %f0
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 453(%zero)
	fmul	%f0, %f1, %f0
	flw	%f18, 494(%zero)
	fabs	%f17, %f0
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.38833
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.38834
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.38834
fbgt_else.38857:
fbgt_cont.38858:
	j	fbgt_cont.38834
fbgt_else.38855:
fbgt_cont.38856:
	j	fbgt_cont.38834
fbgt_else.38853:
fbgt_cont.38854:
	j	fbgt_cont.38834
fbgt_else.38851:
fbgt_cont.38852:
	j	fbgt_cont.38834
fbgt_else.38849:
fbgt_cont.38850:
	j	fbgt_cont.38834
fbgt_else.38847:
fbgt_cont.38848:
	j	fbgt_cont.38834
fbgt_else.38845:
fbgt_cont.38846:
	j	fbgt_cont.38834
fbgt_else.38843:
fbgt_cont.38844:
	j	fbgt_cont.38834
fbgt_else.38841:
fbgt_cont.38842:
	j	fbgt_cont.38834
fbgt_else.38839:
fbgt_cont.38840:
	j	fbgt_cont.38834
fbgt_else.38837:
fbgt_cont.38838:
	j	fbgt_cont.38834
fbgt_else.38835:
fbgt_cont.38836:
	j	fbgt_cont.38834
fbgt_else.38833:
	fmov	%f1, %f2
fbgt_cont.38834:
	fblt	%f17, %f2, fbgt_else.38859
	fblt	%f17, %f1, fbgt_else.38861
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.38860
fbgt_else.38861:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.38862:
	j	fbgt_cont.38860
fbgt_else.38859:
fbgt_cont.38860:
	fblt	%f17, %f18, fbgt_else.38863
	add	%a1, %zero, %zero
	j	fbgt_cont.38864
fbgt_else.38863:
	add	%a1, %zero, %k1
fbgt_cont.38864:
	fblt	%f17, %f18, fbgt_else.38865
	fsub	%f17, %f17, %f18
	j	fbgt_cont.38866
fbgt_else.38865:
fbgt_cont.38866:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.38867
	beqi	%a1, 0, bnei_else.38869
	add	%a1, %zero, %zero
	j	fbgt_cont.38868
bnei_else.38869:
	add	%a1, %zero, %k1
bnei_cont.38870:
	j	fbgt_cont.38868
fbgt_else.38867:
fbgt_cont.38868:
	fblt	%f17, %f1, fbgt_else.38871
	fsub	%f17, %f18, %f17
	j	fbgt_cont.38872
fbgt_else.38871:
fbgt_cont.38872:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.38873
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38874
fbgt_else.38873:
	fsub	%f18, %f1, %f17
	fmul	%f17, %f18, %f18
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.38874:
	beqi	%a1, 0, bnei_else.38875
	j	bnei_cont.38876
bnei_else.38875:
	fneg	%f0, %f0
bnei_cont.38876:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f0, %f1
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.38800:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f0, %f1, %f0
	flw	%f18, 494(%zero)
	fblt	%f0, %fzero, fbgt_else.38878
	add	%a1, %zero, %k1
	j	fbgt_cont.38879
fbgt_else.38878:
	add	%a1, %zero, %zero
fbgt_cont.38879:
	fabs	%f17, %f0
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.38880
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.38881
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.38881
fbgt_else.38904:
fbgt_cont.38905:
	j	fbgt_cont.38881
fbgt_else.38902:
fbgt_cont.38903:
	j	fbgt_cont.38881
fbgt_else.38900:
fbgt_cont.38901:
	j	fbgt_cont.38881
fbgt_else.38898:
fbgt_cont.38899:
	j	fbgt_cont.38881
fbgt_else.38896:
fbgt_cont.38897:
	j	fbgt_cont.38881
fbgt_else.38894:
fbgt_cont.38895:
	j	fbgt_cont.38881
fbgt_else.38892:
fbgt_cont.38893:
	j	fbgt_cont.38881
fbgt_else.38890:
fbgt_cont.38891:
	j	fbgt_cont.38881
fbgt_else.38888:
fbgt_cont.38889:
	j	fbgt_cont.38881
fbgt_else.38886:
fbgt_cont.38887:
	j	fbgt_cont.38881
fbgt_else.38884:
fbgt_cont.38885:
	j	fbgt_cont.38881
fbgt_else.38882:
fbgt_cont.38883:
	j	fbgt_cont.38881
fbgt_else.38880:
	fmov	%f1, %f2
fbgt_cont.38881:
	fblt	%f17, %f2, fbgt_else.38906
	fblt	%f17, %f1, fbgt_else.38908
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.38907
fbgt_else.38908:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.38909:
	j	fbgt_cont.38907
fbgt_else.38906:
fbgt_cont.38907:
	fblt	%f17, %f18, fbgt_else.38910
	beqi	%a1, 0, bnei_else.38912
	add	%a1, %zero, %zero
	j	fbgt_cont.38911
bnei_else.38912:
	add	%a1, %zero, %k1
bnei_cont.38913:
	j	fbgt_cont.38911
fbgt_else.38910:
fbgt_cont.38911:
	fblt	%f17, %f18, fbgt_else.38914
	fsub	%f17, %f17, %f18
	j	fbgt_cont.38915
fbgt_else.38914:
fbgt_cont.38915:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.38916
	fsub	%f17, %f18, %f17
	j	fbgt_cont.38917
fbgt_else.38916:
fbgt_cont.38917:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.38918
	fmul	%f18, %f17, %f17
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38919
fbgt_else.38918:
	fsub	%f0, %f1, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.38919:
	beqi	%a1, 0, bnei_else.38920
	j	bnei_cont.38921
bnei_else.38920:
	fneg	%f0, %f0
bnei_cont.38921:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f16
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.38799:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%k0)
	fsub	%f1, %f1, %f0
	flw	%f18, 447(%zero)
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	flw	%f17, 446(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	flw	%f16, 449(%zero)
	fblt	%f0, %f16, fbgt_else.38923
	add	%a1, %zero, %zero
	j	fbgt_cont.38924
fbgt_else.38923:
	add	%a1, %zero, %k1
fbgt_cont.38924:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%k0)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	fblt	%f0, %f16, fbgt_else.38925
	add	%a2, %zero, %zero
	j	fbgt_cont.38926
fbgt_else.38925:
	add	%a2, %zero, %k1
fbgt_cont.38926:
	beqi	%a1, 0, bnei_else.38927
	beqi	%a2, 0, bnei_else.38929
	flw	%f0, 451(%zero)
	j	bnei_cont.38928
bnei_else.38929:
	fmov	%f0, %fzero
bnei_cont.38930:
	j	bnei_cont.38928
bnei_else.38927:
	beqi	%a2, 0, bnei_else.38931
	fmov	%f0, %fzero
	j	bnei_cont.38932
bnei_else.38931:
	flw	%f0, 451(%zero)
bnei_cont.38932:
bnei_cont.38928:
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	fmov	%f27, %f0
	fmov	%f28, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%v0, 0, bgti_else.39035
	lw	%a0, 254(%v0)
	flw	%f29, 2(%a0)
	lw	%t0, 1(%a0)
	lw	%a0, 0(%a0)
	sw	%a0, 5(%sp)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -6
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39036
	add	%a0, %zero, %zero
	j	fbgt_cont.39037
fbgt_else.39036:
	add	%a0, %zero, %k1
fbgt_cont.39037:
	beqi	%a0, 0, bnei_else.39038
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39040
	add	%a0, %zero, %zero
	j	bnei_cont.39039
fbgt_else.39040:
	add	%a0, %zero, %k1
fbgt_cont.39041:
	j	bnei_cont.39039
bnei_else.39038:
	add	%a0, %zero, %zero
bnei_cont.39039:
	beqi	%a0, 0, bnei_else.39042
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 5(%sp)
	bne	%a1, %a0, bnei_cont.39043
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.39046
	j	bnei_cont.39043
bnei_else.39046:
	lw	%a0, 0(%t0)
	flw	%f0, 142(%zero)
	flw	%f19, 0(%a0)
	fmul	%f1, %f0, %f19
	flw	%f0, 143(%zero)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 144(%zero)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f27
	fmul	%f16, %f0, %f1
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f19
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fmul	%f17, %f29, %f0
	fblt	%fzero, %f16, fbgt_else.39048
	add	%a0, %zero, %zero
	j	fbgt_cont.39049
fbgt_else.39048:
	add	%a0, %zero, %k1
fbgt_cont.39049:
	beqi	%a0, 0, bnei_else.39050
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.39051
bnei_else.39050:
bnei_cont.39051:
	fblt	%fzero, %f17, fbgt_else.39052
	add	%a0, %zero, %zero
	j	fbgt_cont.39053
fbgt_else.39052:
	add	%a0, %zero, %k1
fbgt_cont.39053:
	beqi	%a0, 0, bnei_cont.39043
	fmul	%f0, %f17, %f17
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f28
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.39043
bnei_else.39054:
bnei_cont.39055:
bnei_cont.39047:
	j	bnei_cont.39043
beq_else.39044:
beq_cont.39045:
	j	bnei_cont.39043
bnei_else.39042:
bnei_cont.39043:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f28
	fmov	%f0, %f27
	j	trace_reflections.2978
bgti_else.39035:
	jr	%ra
trace_ray.2983:
	fmov	%f3, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.39327
	lw	%a2, 7(%a0)
	sw	%a2, 5(%sp)
	lw	%a2, 4(%a0)
	sw	%a2, 6(%sp)
	lw	%a2, 3(%a0)
	sw	%a2, 7(%sp)
	lw	%a2, 2(%a0)
	sw	%a2, 8(%sp)
	lw	%a0, 1(%a0)
	sw	%a0, 9(%sp)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 10(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -11
	flw	%f1, 137(%zero)
	fsw	%f1, 11(%sp)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39328
	add	%a0, %zero, %zero
	j	fbgt_cont.39329
fbgt_else.39328:
	add	%a0, %zero, %k1
fbgt_cont.39329:
	beqi	%a0, 0, bnei_else.39330
	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	fblt	%f0, %f1, fbgt_else.39332
	add	%a0, %zero, %zero
	j	bnei_cont.39331
fbgt_else.39332:
	add	%a0, %zero, %k1
fbgt_cont.39333:
	j	bnei_cont.39331
bnei_else.39330:
	add	%a0, %zero, %zero
bnei_cont.39331:
	beqi	%a0, 0, bnei_else.39334
	lw	%s1, 141(%zero)
	lw	%v0, 12(%s1)
	lw	%a2, 9(%v0)
	lw	%s0, 7(%v0)
	lw	%k0, 6(%v0)
	lw	%a1, 5(%v0)
	lw	%ra, 4(%v0)
	lw	%a3, 3(%v0)
	lw	%a0, 2(%v0)
	sw	%a0, 12(%sp)
	lw	%a0, 1(%v0)
	flw	%f0, 0(%s0)
	fsw	%f0, 13(%sp)
	fmul	%f0, %f0, %f3
	fsw	%f0, 14(%sp)
	beqi	%a0, 1, bnei_else.39335
	beqi	%a0, 2, bnei_else.39337
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%ra)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%ra)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%ra)
	fmul	%f17, %f22, %f0
	beqi	%a3, 0, bnei_else.39339
	flw	%f16, 2(%a2)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a2)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a2)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39340
bnei_else.39339:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39340:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39341
	add	%a0, %zero, %k1
	j	fbeq_cont.39342
fbeq_else.39341:
	add	%a0, %zero, %zero
fbeq_cont.39342:
	beqi	%a0, 0, bnei_else.39343
	fmov	%f0, %f30
	j	bnei_cont.39344
bnei_else.39343:
	beqi	%k0, 0, bnei_else.39345
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39346
bnei_else.39345:
	fdiv	%f0, %f30, %f1
bnei_cont.39346:
bnei_cont.39344:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39336
bnei_else.39337:
	flw	%f0, 0(%ra)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%ra)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%ra)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39338:
	j	bnei_cont.39336
bnei_else.39335:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39347
	add	%a0, %zero, %k1
	j	fbeq_cont.39348
fbeq_else.39347:
	add	%a0, %zero, %zero
fbeq_cont.39348:
	beqi	%a0, 0, bnei_else.39349
	fmov	%f0, %fzero
	j	bnei_cont.39350
bnei_else.39349:
	fblt	%fzero, %f0, fbgt_else.39351
	add	%a0, %zero, %zero
	j	fbgt_cont.39352
fbgt_else.39351:
	add	%a0, %zero, %k1
fbgt_cont.39352:
	beqi	%a0, 0, bnei_else.39353
	fmov	%f0, %f30
	j	bnei_cont.39354
bnei_else.39353:
	flw	%f0, 468(%zero)
bnei_cont.39354:
bnei_cont.39350:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39336:
	flw	%f0, 138(%zero)
	fsw	%f0, 15(%sp)
	fsw	%f0, 159(%zero)
	flw	%f0, 139(%zero)
	fsw	%f0, 16(%sp)
	fsw	%f0, 160(%zero)
	flw	%f0, 140(%zero)
	fsw	%f0, 17(%sp)
	fsw	%f0, 161(%zero)
	addi	%v1, %zero, 138
	addi	%sp, %sp, 18
	jal	utexture.2971
	addi	%sp, %sp, -18
	sll	%a1, %s1, 2
	lw	%a0, 136(%zero)
	add	%a2, %a1, %a0
	lw	%a0, 8(%sp)
	lw	%a1, 1(%sp)
	add	%at, %a0, %a1
	sw	%a2, 0(%at)
	lw	%a0, 9(%sp)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	flw	%f0, 15(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 16(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 17(%sp)
	fsw	%f0, 2(%a0)
	flw	%f1, 473(%zero)
	flw	%f0, 13(%sp)
	fblt	%f0, %f1, fbgt_else.39355
	add	%a0, %zero, %zero
	j	fbgt_cont.39356
fbgt_else.39355:
	add	%a0, %zero, %k1
fbgt_cont.39356:
	beqi	%a0, 0, bnei_else.39357
	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.39358
bnei_else.39357:
	lw	%a0, 7(%sp)
	lw	%a1, 1(%sp)
	add	%at, %a0, %a1
	sw	%k1, 0(%at)
	lw	%a0, 6(%sp)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	flw	%f0, 145(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 146(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 147(%zero)
	fsw	%f0, 2(%a0)
	flw	%f1, 443(%zero)
	flw	%f0, 14(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%a0)
	lw	%a0, 5(%sp)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	flw	%f0, 142(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 143(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 144(%zero)
	fsw	%f0, 2(%a0)
bnei_cont.39358:
	flw	%f19, 442(%zero)
	lw	%a0, 2(%sp)
	flw	%f18, 0(%a0)
	flw	%f29, 142(%zero)
	fmul	%f1, %f18, %f29
	flw	%f17, 1(%a0)
	flw	%f28, 143(%zero)
	fmul	%f0, %f17, %f28
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%a0)
	flw	%f27, 144(%zero)
	fmul	%f0, %f16, %f27
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f0
	fmul	%f0, %f1, %f29
	fadd	%f0, %f18, %f0
	fsw	%f0, 0(%a0)
	fmul	%f0, %f1, %f28
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%a0)
	fmul	%f0, %f1, %f27
	fadd	%f0, %f16, %f0
	fsw	%f0, 2(%a0)
	flw	%f0, 1(%s0)
	fmul	%f0, %f3, %f0
	fsw	%f0, 18(%sp)
	lw	%v1, 10(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 19
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.39359
	j	bnei_cont.39360
bnei_else.39359:
	flw	%f19, 78(%zero)
	fmul	%f1, %f29, %f19
	flw	%f18, 79(%zero)
	fmul	%f0, %f28, %f18
	fadd	%f1, %f1, %f0
	flw	%f17, 80(%zero)
	fmul	%f0, %f27, %f17
	fadd	%f0, %f1, %f0
	fneg	%f1, %f0
	flw	%f0, 14(%sp)
	fmul	%f16, %f1, %f0
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f19
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fneg	%f17, %f0
	fblt	%fzero, %f16, fbgt_else.39361
	add	%a0, %zero, %zero
	j	fbgt_cont.39362
fbgt_else.39361:
	add	%a0, %zero, %k1
fbgt_cont.39362:
	beqi	%a0, 0, bnei_else.39363
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.39364
bnei_else.39363:
bnei_cont.39364:
	fblt	%fzero, %f17, fbgt_else.39365
	add	%a0, %zero, %zero
	j	fbgt_cont.39366
fbgt_else.39365:
	add	%a0, %zero, %k1
fbgt_cont.39366:
	beqi	%a0, 0, bnei_else.39367
	fmul	%f0, %f17, %f17
	fmul	%f1, %f0, %f0
	flw	%f0, 18(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.39368
bnei_else.39367:
bnei_cont.39368:
bnei_cont.39360:
	flw	%f0, 15(%sp)
	fsw	%f0, 162(%zero)
	flw	%f0, 16(%sp)
	fsw	%f0, 163(%zero)
	flw	%f0, 17(%sp)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %zero, 138
	addi	%sp, %sp, 19
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -19
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 18(%sp)
	flw	%f0, 14(%sp)
	lw	%v1, 2(%sp)
	addi	%sp, %sp, 19
	jal	trace_reflections.2978
	addi	%sp, %sp, -19
	flw	%f0, 441(%zero)
	fblt	%f0, %f3, fbgt_else.39369
	add	%a0, %zero, %zero
	j	fbgt_cont.39370
fbgt_else.39369:
	add	%a0, %zero, %k1
fbgt_cont.39370:
	beqi	%a0, 0, bnei_else.39371
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.39372
	j	bgti_cont.39373
bgti_else.39372:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 8(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.39373:
	lw	%a0, 12(%sp)
	beqi	%a0, 2, bnei_else.39374
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.39374:
	flw	%f0, 13(%sp)
	fsub	%f0, %f30, %f0
	fmul	%f0, %f3, %f0
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 1
	flw	%f16, 0(%sp)
	flw	%f1, 11(%sp)
	fadd	%f1, %f16, %f1
	lw	%ra, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	j	trace_ray.2983
bnei_else.39371:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.39334:
	addi	%a2, %zero, -1
	lw	%a1, 8(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.39377
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f1, %f0
	fblt	%fzero, %f1, fbgt_else.39378
	add	%a0, %zero, %zero
	j	fbgt_cont.39379
fbgt_else.39378:
	add	%a0, %zero, %k1
fbgt_cont.39379:
	beqi	%a0, 0, bnei_else.39380
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f1
	fmul	%f1, %f0, %f3
	flw	%f0, 81(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	lw	%ra, 4(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.39380:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.39377:
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.39327:
	jr	%ra
iter_trace_diffuse_rays.2992:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	blti	%a1, 0, bgti_else.40395
	add	%at, %v0, %a1
	lw	%t0, 0(%at)
	lw	%ra, 1(%t0)
	lw	%t1, 0(%t0)
	flw	%f21, 0(%t1)
	flw	%f27, 0(%v1)
	fmul	%f1, %f21, %f27
	flw	%f19, 1(%t1)
	flw	%f28, 1(%v1)
	fmul	%f0, %f19, %f28
	fadd	%f16, %f1, %f0
	flw	%f1, 2(%t1)
	flw	%f29, 2(%v1)
	fmul	%f0, %f1, %f29
	fadd	%f16, %f16, %f0
	fblt	%f16, %fzero, fbgt_else.40396
	add	%a0, %zero, %zero
	j	fbgt_cont.40397
fbgt_else.40396:
	add	%a0, %zero, %k1
fbgt_cont.40397:
	beqi	%a0, 0, bnei_else.40398
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t0, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f3, %f16, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s7, 0(%t1)
	lw	%s0, 0(%s7)
	beqi	%s0, -1, bnei_else.40400
	beqi	%s0, 99, bnei_else.40402
	lw	%a0, 12(%s0)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%k0, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f20, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	lw	%a0, 1(%t0)
	lw	%ra, 0(%t0)
	add	%at, %a0, %s0
	lw	%s0, 0(%at)
	beqi	%a1, 1, bnei_else.40404
	beqi	%a1, 2, bnei_else.40406
	flw	%f17, 0(%s0)
	fbne	%f17, %fzero, fbeq_else.40408
	add	%a0, %zero, %k1
	j	fbeq_cont.40409
fbeq_else.40408:
	add	%a0, %zero, %zero
fbeq_cont.40409:
	beqi	%a0, 0, bnei_else.40410
	add	%a0, %zero, %zero
	j	bnei_cont.40405
bnei_else.40410:
	flw	%f0, 1(%s0)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%s0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%s0)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.40412
	add	%a0, %zero, %zero
	j	fbgt_cont.40413
fbgt_else.40412:
	add	%a0, %zero, %k1
fbgt_cont.40413:
	beqi	%a0, 0, bnei_else.40414
	beqi	%a2, 0, bnei_else.40416
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.40417
bnei_else.40416:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.40417:
	add	%a0, %zero, %k1
	j	bnei_cont.40405
bnei_else.40414:
	add	%a0, %zero, %zero
bnei_cont.40415:
bnei_cont.40411:
	j	bnei_cont.40405
bnei_else.40406:
	flw	%f1, 0(%s0)
	fblt	%f1, %fzero, fbgt_else.40418
	add	%a0, %zero, %zero
	j	fbgt_cont.40419
fbgt_else.40418:
	add	%a0, %zero, %k1
fbgt_cont.40419:
	beqi	%a0, 0, bnei_else.40420
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40405
bnei_else.40420:
	add	%a0, %zero, %zero
bnei_cont.40421:
bnei_cont.40407:
	j	bnei_cont.40405
bnei_else.40404:
	flw	%f0, 0(%s0)
	fsub	%f0, %f0, %f20
	flw	%f2, 1(%s0)
	fmul	%f21, %f0, %f2
	flw	%f19, 1(%ra)
	fmul	%f0, %f21, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%k0)
	fblt	%f0, %f17, fbgt_else.40422
	add	%a0, %zero, %zero
	j	fbgt_cont.40423
fbgt_else.40422:
	add	%a0, %zero, %k1
fbgt_cont.40423:
	beqi	%a0, 0, bnei_else.40424
	flw	%f0, 2(%ra)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.40426
	add	%a0, %zero, %zero
	j	fbgt_cont.40427
fbgt_else.40426:
	add	%a0, %zero, %k1
fbgt_cont.40427:
	beqi	%a0, 0, bnei_else.40428
	fbne	%f2, %fzero, fbeq_else.40430
	add	%a0, %zero, %k1
	j	fbeq_cont.40431
fbeq_else.40430:
	add	%a0, %zero, %zero
fbeq_cont.40431:
	beqi	%a0, 0, bnei_else.40432
	add	%a0, %zero, %zero
	j	bnei_cont.40425
bnei_else.40432:
	add	%a0, %zero, %k1
bnei_cont.40433:
	j	bnei_cont.40425
bnei_else.40428:
	add	%a0, %zero, %zero
bnei_cont.40429:
	j	bnei_cont.40425
bnei_else.40424:
	add	%a0, %zero, %zero
bnei_cont.40425:
	beqi	%a0, 0, bnei_else.40434
	fsw	%f21, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40435
bnei_else.40434:
	flw	%f0, 2(%s0)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%s0)
	fmul	%f23, %f0, %f22
	flw	%f21, 0(%ra)
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	flw	%f2, 0(%k0)
	fblt	%f0, %f2, fbgt_else.40436
	add	%a0, %zero, %zero
	j	fbgt_cont.40437
fbgt_else.40436:
	add	%a0, %zero, %k1
fbgt_cont.40437:
	beqi	%a0, 0, bnei_else.40438
	flw	%f0, 2(%ra)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.40440
	add	%a0, %zero, %zero
	j	fbgt_cont.40441
fbgt_else.40440:
	add	%a0, %zero, %k1
fbgt_cont.40441:
	beqi	%a0, 0, bnei_else.40442
	fbne	%f22, %fzero, fbeq_else.40444
	add	%a0, %zero, %k1
	j	fbeq_cont.40445
fbeq_else.40444:
	add	%a0, %zero, %zero
fbeq_cont.40445:
	beqi	%a0, 0, bnei_else.40446
	add	%a0, %zero, %zero
	j	bnei_cont.40439
bnei_else.40446:
	add	%a0, %zero, %k1
bnei_cont.40447:
	j	bnei_cont.40439
bnei_else.40442:
	add	%a0, %zero, %zero
bnei_cont.40443:
	j	bnei_cont.40439
bnei_else.40438:
	add	%a0, %zero, %zero
bnei_cont.40439:
	beqi	%a0, 0, bnei_else.40448
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.40449
bnei_else.40448:
	flw	%f0, 4(%s0)
	fsub	%f0, %f0, %f18
	flw	%f1, 5(%s0)
	fmul	%f18, %f0, %f1
	fmul	%f0, %f18, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.40450
	add	%a0, %zero, %zero
	j	fbgt_cont.40451
fbgt_else.40450:
	add	%a0, %zero, %k1
fbgt_cont.40451:
	beqi	%a0, 0, bnei_else.40452
	fmul	%f0, %f18, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.40454
	add	%a0, %zero, %zero
	j	fbgt_cont.40455
fbgt_else.40454:
	add	%a0, %zero, %k1
fbgt_cont.40455:
	beqi	%a0, 0, bnei_else.40456
	fbne	%f1, %fzero, fbeq_else.40458
	add	%a0, %zero, %k1
	j	fbeq_cont.40459
fbeq_else.40458:
	add	%a0, %zero, %zero
fbeq_cont.40459:
	beqi	%a0, 0, bnei_else.40460
	add	%a0, %zero, %zero
	j	bnei_cont.40453
bnei_else.40460:
	add	%a0, %zero, %k1
bnei_cont.40461:
	j	bnei_cont.40453
bnei_else.40456:
	add	%a0, %zero, %zero
bnei_cont.40457:
	j	bnei_cont.40453
bnei_else.40452:
	add	%a0, %zero, %zero
bnei_cont.40453:
	beqi	%a0, 0, bnei_else.40462
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.40463
bnei_else.40462:
	add	%a0, %zero, %zero
bnei_cont.40463:
bnei_cont.40449:
bnei_cont.40435:
bnei_cont.40405:
	beqi	%a0, 0, bnei_cont.40403
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.40466
	add	%a0, %zero, %zero
	j	fbgt_cont.40467
fbgt_else.40466:
	add	%a0, %zero, %k1
fbgt_cont.40467:
	beqi	%a0, 0, bnei_cont.40403
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.40403
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.40403
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.40403
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.40403
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s7, 0
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.40403
bnei_else.40476:
bnei_cont.40477:
	j	bnei_cont.40403
bnei_else.40474:
bnei_cont.40475:
	j	bnei_cont.40403
bnei_else.40472:
bnei_cont.40473:
	j	bnei_cont.40403
bnei_else.40470:
bnei_cont.40471:
	j	bnei_cont.40403
bnei_else.40468:
bnei_cont.40469:
	j	bnei_cont.40403
bnei_else.40464:
bnei_cont.40465:
	j	bnei_cont.40403
bnei_else.40402:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.40478
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.40479
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.40479
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.40479
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s7, 0
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.40479
bnei_else.40484:
bnei_cont.40485:
	j	bnei_cont.40479
bnei_else.40482:
bnei_cont.40483:
	j	bnei_cont.40479
bnei_else.40480:
bnei_cont.40481:
	j	bnei_cont.40479
bnei_else.40478:
bnei_cont.40479:
bnei_cont.40403:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	j	bnei_cont.40401
bnei_else.40400:
bnei_cont.40401:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40486
	add	%a0, %zero, %zero
	j	fbgt_cont.40487
fbgt_else.40486:
	add	%a0, %zero, %k1
fbgt_cont.40487:
	beqi	%a0, 0, bnei_else.40488
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40490
	add	%a0, %zero, %zero
	j	bnei_cont.40489
fbgt_else.40490:
	add	%a0, %zero, %k1
fbgt_cont.40491:
	j	bnei_cont.40489
bnei_else.40488:
	add	%a0, %zero, %zero
bnei_cont.40489:
	beqi	%a0, 0, bnei_cont.40399
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%s0, 0(%t0)
	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.40494
	beqi	%ra, 2, bnei_else.40496
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f19, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f2, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40498
	flw	%f16, 2(%a1)
	fmul	%f1, %f2, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f19, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f19, %f20
	fmul	%f0, %f2, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40499
bnei_else.40498:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40499:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40500
	add	%a0, %zero, %k1
	j	fbeq_cont.40501
fbeq_else.40500:
	add	%a0, %zero, %zero
fbeq_cont.40501:
	beqi	%a0, 0, bnei_else.40502
	fmov	%f0, %f30
	j	bnei_cont.40503
bnei_else.40502:
	beqi	%a3, 0, bnei_else.40504
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40505
bnei_else.40504:
	fdiv	%f0, %f30, %f1
bnei_cont.40505:
bnei_cont.40503:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40495
bnei_else.40496:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40497:
	j	bnei_cont.40495
bnei_else.40494:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %s0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40506
	add	%a0, %zero, %k1
	j	fbeq_cont.40507
fbeq_else.40506:
	add	%a0, %zero, %zero
fbeq_cont.40507:
	beqi	%a0, 0, bnei_else.40508
	fmov	%f0, %fzero
	j	bnei_cont.40509
bnei_else.40508:
	fblt	%fzero, %f0, fbgt_else.40510
	add	%a0, %zero, %zero
	j	fbgt_cont.40511
fbgt_else.40510:
	add	%a0, %zero, %k1
fbgt_cont.40511:
	beqi	%a0, 0, bnei_else.40512
	fmov	%f0, %f30
	j	bnei_cont.40513
bnei_else.40512:
	flw	%f0, 468(%zero)
bnei_cont.40513:
bnei_cont.40509:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40495:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.40514
	j	bnei_cont.40399
bnei_else.40514:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.40516
	add	%a0, %zero, %zero
	j	fbgt_cont.40517
fbgt_else.40516:
	add	%a0, %zero, %k1
fbgt_cont.40517:
	beqi	%a0, 0, bnei_else.40518
	j	bnei_cont.40519
bnei_else.40518:
	fmov	%f0, %fzero
bnei_cont.40519:
	fmul	%f1, %f3, %f0
	flw	%f0, 0(%t0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.40515:
	j	bnei_cont.40399
bnei_else.40492:
bnei_cont.40493:
	j	bnei_cont.40399
bnei_else.40398:
	flw	%f0, 439(%zero)
	fdiv	%f3, %f16, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s7, 0(%t2)
	lw	%k0, 0(%s7)
	beqi	%k0, -1, bnei_else.40520
	beqi	%k0, 99, bnei_else.40522
	lw	%a0, 12(%k0)
	lw	%a2, 10(%a0)
	lw	%a1, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f20, 0(%a2)
	flw	%f16, 1(%a2)
	flw	%f18, 2(%a2)
	add	%at, %ra, %k0
	lw	%k0, 0(%at)
	beqi	%a0, 1, bnei_else.40524
	beqi	%a0, 2, bnei_else.40526
	flw	%f17, 0(%k0)
	fbne	%f17, %fzero, fbeq_else.40528
	add	%a0, %zero, %k1
	j	fbeq_cont.40529
fbeq_else.40528:
	add	%a0, %zero, %zero
fbeq_cont.40529:
	beqi	%a0, 0, bnei_else.40530
	add	%a0, %zero, %zero
	j	bnei_cont.40525
bnei_else.40530:
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.40532
	add	%a0, %zero, %zero
	j	fbgt_cont.40533
fbgt_else.40532:
	add	%a0, %zero, %k1
fbgt_cont.40533:
	beqi	%a0, 0, bnei_else.40534
	beqi	%a1, 0, bnei_else.40536
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.40537
bnei_else.40536:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.40537:
	add	%a0, %zero, %k1
	j	bnei_cont.40525
bnei_else.40534:
	add	%a0, %zero, %zero
bnei_cont.40535:
bnei_cont.40531:
	j	bnei_cont.40525
bnei_else.40526:
	flw	%f1, 0(%k0)
	fblt	%f1, %fzero, fbgt_else.40538
	add	%a0, %zero, %zero
	j	fbgt_cont.40539
fbgt_else.40538:
	add	%a0, %zero, %k1
fbgt_cont.40539:
	beqi	%a0, 0, bnei_else.40540
	flw	%f0, 3(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40525
bnei_else.40540:
	add	%a0, %zero, %zero
bnei_cont.40541:
bnei_cont.40527:
	j	bnei_cont.40525
bnei_else.40524:
	flw	%f0, 0(%k0)
	fsub	%f0, %f0, %f20
	flw	%f22, 1(%k0)
	fmul	%f23, %f0, %f22
	fmul	%f0, %f23, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%a3)
	fblt	%f0, %f17, fbgt_else.40542
	add	%a0, %zero, %zero
	j	fbgt_cont.40543
fbgt_else.40542:
	add	%a0, %zero, %k1
fbgt_cont.40543:
	beqi	%a0, 0, bnei_else.40544
	fmul	%f0, %f23, %f1
	fadd	%f0, %f0, %f18
	fabs	%f2, %f0
	flw	%f0, 2(%a3)
	fblt	%f2, %f0, fbgt_else.40546
	add	%a0, %zero, %zero
	j	fbgt_cont.40547
fbgt_else.40546:
	add	%a0, %zero, %k1
fbgt_cont.40547:
	beqi	%a0, 0, bnei_else.40548
	fbne	%f22, %fzero, fbeq_else.40550
	add	%a0, %zero, %k1
	j	fbeq_cont.40551
fbeq_else.40550:
	add	%a0, %zero, %zero
fbeq_cont.40551:
	beqi	%a0, 0, bnei_else.40552
	add	%a0, %zero, %zero
	j	bnei_cont.40545
bnei_else.40552:
	add	%a0, %zero, %k1
bnei_cont.40553:
	j	bnei_cont.40545
bnei_else.40548:
	add	%a0, %zero, %zero
bnei_cont.40549:
	j	bnei_cont.40545
bnei_else.40544:
	add	%a0, %zero, %zero
bnei_cont.40545:
	beqi	%a0, 0, bnei_else.40554
	fsw	%f23, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40555
bnei_else.40554:
	flw	%f0, 2(%k0)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%k0)
	fmul	%f23, %f0, %f22
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	flw	%f2, 0(%a3)
	fblt	%f0, %f2, fbgt_else.40556
	add	%a0, %zero, %zero
	j	fbgt_cont.40557
fbgt_else.40556:
	add	%a0, %zero, %k1
fbgt_cont.40557:
	beqi	%a0, 0, bnei_else.40558
	fmul	%f0, %f23, %f1
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.40560
	add	%a0, %zero, %zero
	j	fbgt_cont.40561
fbgt_else.40560:
	add	%a0, %zero, %k1
fbgt_cont.40561:
	beqi	%a0, 0, bnei_else.40562
	fbne	%f22, %fzero, fbeq_else.40564
	add	%a0, %zero, %k1
	j	fbeq_cont.40565
fbeq_else.40564:
	add	%a0, %zero, %zero
fbeq_cont.40565:
	beqi	%a0, 0, bnei_else.40566
	add	%a0, %zero, %zero
	j	bnei_cont.40559
bnei_else.40566:
	add	%a0, %zero, %k1
bnei_cont.40567:
	j	bnei_cont.40559
bnei_else.40562:
	add	%a0, %zero, %zero
bnei_cont.40563:
	j	bnei_cont.40559
bnei_else.40558:
	add	%a0, %zero, %zero
bnei_cont.40559:
	beqi	%a0, 0, bnei_else.40568
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.40569
bnei_else.40568:
	flw	%f0, 4(%k0)
	fsub	%f0, %f0, %f18
	flw	%f1, 5(%k0)
	fmul	%f18, %f0, %f1
	fmul	%f0, %f18, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.40570
	add	%a0, %zero, %zero
	j	fbgt_cont.40571
fbgt_else.40570:
	add	%a0, %zero, %k1
fbgt_cont.40571:
	beqi	%a0, 0, bnei_else.40572
	fmul	%f0, %f18, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.40574
	add	%a0, %zero, %zero
	j	fbgt_cont.40575
fbgt_else.40574:
	add	%a0, %zero, %k1
fbgt_cont.40575:
	beqi	%a0, 0, bnei_else.40576
	fbne	%f1, %fzero, fbeq_else.40578
	add	%a0, %zero, %k1
	j	fbeq_cont.40579
fbeq_else.40578:
	add	%a0, %zero, %zero
fbeq_cont.40579:
	beqi	%a0, 0, bnei_else.40580
	add	%a0, %zero, %zero
	j	bnei_cont.40573
bnei_else.40580:
	add	%a0, %zero, %k1
bnei_cont.40581:
	j	bnei_cont.40573
bnei_else.40576:
	add	%a0, %zero, %zero
bnei_cont.40577:
	j	bnei_cont.40573
bnei_else.40572:
	add	%a0, %zero, %zero
bnei_cont.40573:
	beqi	%a0, 0, bnei_else.40582
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.40583
bnei_else.40582:
	add	%a0, %zero, %zero
bnei_cont.40583:
bnei_cont.40569:
bnei_cont.40555:
bnei_cont.40525:
	beqi	%a0, 0, bnei_cont.40523
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.40586
	add	%a0, %zero, %zero
	j	fbgt_cont.40587
fbgt_else.40586:
	add	%a0, %zero, %k1
fbgt_cont.40587:
	beqi	%a0, 0, bnei_cont.40523
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.40523
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.40523
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.40523
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.40523
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s7, 0
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.40523
bnei_else.40596:
bnei_cont.40597:
	j	bnei_cont.40523
bnei_else.40594:
bnei_cont.40595:
	j	bnei_cont.40523
bnei_else.40592:
bnei_cont.40593:
	j	bnei_cont.40523
bnei_else.40590:
bnei_cont.40591:
	j	bnei_cont.40523
bnei_else.40588:
bnei_cont.40589:
	j	bnei_cont.40523
bnei_else.40584:
bnei_cont.40585:
	j	bnei_cont.40523
bnei_else.40522:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.40598
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.40599
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.40599
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.40599
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s7, 0
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.40599
bnei_else.40604:
bnei_cont.40605:
	j	bnei_cont.40599
bnei_else.40602:
bnei_cont.40603:
	j	bnei_cont.40599
bnei_else.40600:
bnei_cont.40601:
	j	bnei_cont.40599
bnei_else.40598:
bnei_cont.40599:
bnei_cont.40523:
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	j	bnei_cont.40521
bnei_else.40520:
bnei_cont.40521:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40606
	add	%a0, %zero, %zero
	j	fbgt_cont.40607
fbgt_else.40606:
	add	%a0, %zero, %k1
fbgt_cont.40607:
	beqi	%a0, 0, bnei_else.40608
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40610
	add	%a0, %zero, %zero
	j	bnei_cont.40609
fbgt_else.40610:
	add	%a0, %zero, %k1
fbgt_cont.40611:
	j	bnei_cont.40609
bnei_else.40608:
	add	%a0, %zero, %zero
bnei_cont.40609:
	beqi	%a0, 0, bnei_else.40612
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.40614
	beqi	%ra, 2, bnei_else.40616
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f19, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f2, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40618
	flw	%f16, 2(%a1)
	fmul	%f1, %f2, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f19, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f19, %f20
	fmul	%f0, %f2, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40619
bnei_else.40618:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40619:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40620
	add	%a0, %zero, %k1
	j	fbeq_cont.40621
fbeq_else.40620:
	add	%a0, %zero, %zero
fbeq_cont.40621:
	beqi	%a0, 0, bnei_else.40622
	fmov	%f0, %f30
	j	bnei_cont.40623
bnei_else.40622:
	beqi	%a3, 0, bnei_else.40624
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40625
bnei_else.40624:
	fdiv	%f0, %f30, %f1
bnei_cont.40625:
bnei_cont.40623:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40615
bnei_else.40616:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40617:
	j	bnei_cont.40615
bnei_else.40614:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t1, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40626
	add	%a0, %zero, %k1
	j	fbeq_cont.40627
fbeq_else.40626:
	add	%a0, %zero, %zero
fbeq_cont.40627:
	beqi	%a0, 0, bnei_else.40628
	fmov	%f0, %fzero
	j	bnei_cont.40629
bnei_else.40628:
	fblt	%fzero, %f0, fbgt_else.40630
	add	%a0, %zero, %zero
	j	fbgt_cont.40631
fbgt_else.40630:
	add	%a0, %zero, %k1
fbgt_cont.40631:
	beqi	%a0, 0, bnei_else.40632
	fmov	%f0, %f30
	j	bnei_cont.40633
bnei_else.40632:
	flw	%f0, 468(%zero)
bnei_cont.40633:
bnei_cont.40629:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40615:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.40634
	j	bnei_cont.40613
bnei_else.40634:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.40636
	add	%a0, %zero, %zero
	j	fbgt_cont.40637
fbgt_else.40636:
	add	%a0, %zero, %k1
fbgt_cont.40637:
	beqi	%a0, 0, bnei_else.40638
	j	bnei_cont.40639
bnei_else.40638:
	fmov	%f0, %fzero
bnei_cont.40639:
	fmul	%f1, %f3, %f0
	flw	%f0, 0(%t0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.40635:
	j	bnei_cont.40613
bnei_else.40612:
bnei_cont.40613:
bnei_cont.40399:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.40640
	lw	%a0, 0(%sp)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	lw	%t1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f1, %f0, %f27
	flw	%f0, 1(%t1)
	fmul	%f0, %f0, %f28
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t1)
	fmul	%f0, %f0, %f29
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.40641
	add	%a1, %zero, %zero
	j	fbgt_cont.40642
fbgt_else.40641:
	add	%a1, %zero, %k1
fbgt_cont.40642:
	beqi	%a1, 0, bnei_else.40643
	addi	%a1, %t0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t1, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40645
	add	%a0, %zero, %zero
	j	fbgt_cont.40646
fbgt_else.40645:
	add	%a0, %zero, %k1
fbgt_cont.40646:
	beqi	%a0, 0, bnei_else.40647
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40649
	add	%a0, %zero, %zero
	j	bnei_cont.40648
fbgt_else.40649:
	add	%a0, %zero, %k1
fbgt_cont.40650:
	j	bnei_cont.40648
bnei_else.40647:
	add	%a0, %zero, %zero
bnei_cont.40648:
	beqi	%a0, 0, bnei_cont.40644
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%s0, 0(%t1)
	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.40653
	beqi	%ra, 2, bnei_else.40655
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40657
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40658
bnei_else.40657:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40658:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40659
	add	%a0, %zero, %k1
	j	fbeq_cont.40660
fbeq_else.40659:
	add	%a0, %zero, %zero
fbeq_cont.40660:
	beqi	%a0, 0, bnei_else.40661
	fmov	%f0, %f30
	j	bnei_cont.40662
bnei_else.40661:
	beqi	%a3, 0, bnei_else.40663
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40664
bnei_else.40663:
	fdiv	%f0, %f30, %f1
bnei_cont.40664:
bnei_cont.40662:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40654
bnei_else.40655:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40656:
	j	bnei_cont.40654
bnei_else.40653:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %s0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40665
	add	%a0, %zero, %k1
	j	fbeq_cont.40666
fbeq_else.40665:
	add	%a0, %zero, %zero
fbeq_cont.40666:
	beqi	%a0, 0, bnei_else.40667
	fmov	%f0, %fzero
	j	bnei_cont.40668
bnei_else.40667:
	fblt	%fzero, %f0, fbgt_else.40669
	add	%a0, %zero, %zero
	j	fbgt_cont.40670
fbgt_else.40669:
	add	%a0, %zero, %k1
fbgt_cont.40670:
	beqi	%a0, 0, bnei_else.40671
	fmov	%f0, %f30
	j	bnei_cont.40672
bnei_else.40671:
	flw	%f0, 468(%zero)
bnei_cont.40672:
bnei_cont.40668:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40654:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.40673
	j	bnei_cont.40644
bnei_else.40673:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.40675
	add	%a0, %zero, %zero
	j	fbgt_cont.40676
fbgt_else.40675:
	add	%a0, %zero, %k1
fbgt_cont.40676:
	beqi	%a0, 0, bnei_else.40677
	j	bnei_cont.40678
bnei_else.40677:
	fmov	%f0, %fzero
bnei_cont.40678:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.40674:
	j	bnei_cont.40644
bnei_else.40651:
bnei_cont.40652:
	j	bnei_cont.40644
bnei_else.40643:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40679
	add	%a0, %zero, %zero
	j	fbgt_cont.40680
fbgt_else.40679:
	add	%a0, %zero, %k1
fbgt_cont.40680:
	beqi	%a0, 0, bnei_else.40681
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40683
	add	%a0, %zero, %zero
	j	bnei_cont.40682
fbgt_else.40683:
	add	%a0, %zero, %k1
fbgt_cont.40684:
	j	bnei_cont.40682
bnei_else.40681:
	add	%a0, %zero, %zero
bnei_cont.40682:
	beqi	%a0, 0, bnei_else.40685
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%a0, 7(%v0)
	sw	%a0, 8(%sp)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.40687
	beqi	%ra, 2, bnei_else.40689
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40691
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40692
bnei_else.40691:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40692:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40693
	add	%a0, %zero, %k1
	j	fbeq_cont.40694
fbeq_else.40693:
	add	%a0, %zero, %zero
fbeq_cont.40694:
	beqi	%a0, 0, bnei_else.40695
	fmov	%f0, %f30
	j	bnei_cont.40696
bnei_else.40695:
	beqi	%a3, 0, bnei_else.40697
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40698
bnei_else.40697:
	fdiv	%f0, %f30, %f1
bnei_cont.40698:
bnei_cont.40696:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40688
bnei_else.40689:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40690:
	j	bnei_cont.40688
bnei_else.40687:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t1, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40699
	add	%a0, %zero, %k1
	j	fbeq_cont.40700
fbeq_else.40699:
	add	%a0, %zero, %zero
fbeq_cont.40700:
	beqi	%a0, 0, bnei_else.40701
	fmov	%f0, %fzero
	j	bnei_cont.40702
bnei_else.40701:
	fblt	%fzero, %f0, fbgt_else.40703
	add	%a0, %zero, %zero
	j	fbgt_cont.40704
fbgt_else.40703:
	add	%a0, %zero, %k1
fbgt_cont.40704:
	beqi	%a0, 0, bnei_else.40705
	fmov	%f0, %f30
	j	bnei_cont.40706
bnei_else.40705:
	flw	%f0, 468(%zero)
bnei_cont.40706:
bnei_cont.40702:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40688:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 9
	jal	utexture.2971
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.40707
	j	bnei_cont.40686
bnei_else.40707:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.40709
	add	%a0, %zero, %zero
	j	fbgt_cont.40710
fbgt_else.40709:
	add	%a0, %zero, %k1
fbgt_cont.40710:
	beqi	%a0, 0, bnei_else.40711
	j	bnei_cont.40712
bnei_else.40711:
	fmov	%f0, %fzero
bnei_cont.40712:
	fmul	%f1, %f27, %f0
	lw	%a0, 8(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.40708:
	j	bnei_cont.40686
bnei_else.40685:
bnei_cont.40686:
bnei_cont.40644:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.40640:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgti_else.40395:
	jr	%ra
trace_diffuse_rays.2997:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	lw	%a0, 118(%a0)
	lw	%t0, 0(%a0)
	flw	%f1, 0(%t0)
	lw	%a1, 1(%sp)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%t0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%t0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.40968
	add	%a1, %zero, %zero
	j	fbgt_cont.40969
fbgt_else.40968:
	add	%a1, %zero, %k1
fbgt_cont.40969:
	beqi	%a1, 0, bnei_else.40970
	lw	%a0, 0(%sp)
	lw	%t0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40972
	add	%a0, %zero, %zero
	j	fbgt_cont.40973
fbgt_else.40972:
	add	%a0, %zero, %k1
fbgt_cont.40973:
	beqi	%a0, 0, bnei_else.40974
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40976
	add	%a0, %zero, %zero
	j	bnei_cont.40975
fbgt_else.40976:
	add	%a0, %zero, %k1
fbgt_cont.40977:
	j	bnei_cont.40975
bnei_else.40974:
	add	%a0, %zero, %zero
bnei_cont.40975:
	beqi	%a0, 0, bnei_cont.40971
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%s0, 0(%t0)
	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.40980
	beqi	%ra, 2, bnei_else.40982
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40984
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40985
bnei_else.40984:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40985:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40986
	add	%a0, %zero, %k1
	j	fbeq_cont.40987
fbeq_else.40986:
	add	%a0, %zero, %zero
fbeq_cont.40987:
	beqi	%a0, 0, bnei_else.40988
	fmov	%f0, %f30
	j	bnei_cont.40989
bnei_else.40988:
	beqi	%a3, 0, bnei_else.40990
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40991
bnei_else.40990:
	fdiv	%f0, %f30, %f1
bnei_cont.40991:
bnei_cont.40989:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40981
bnei_else.40982:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40983:
	j	bnei_cont.40981
bnei_else.40980:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %s0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40992
	add	%a0, %zero, %k1
	j	fbeq_cont.40993
fbeq_else.40992:
	add	%a0, %zero, %zero
fbeq_cont.40993:
	beqi	%a0, 0, bnei_else.40994
	fmov	%f0, %fzero
	j	bnei_cont.40995
bnei_else.40994:
	fblt	%fzero, %f0, fbgt_else.40996
	add	%a0, %zero, %zero
	j	fbgt_cont.40997
fbgt_else.40996:
	add	%a0, %zero, %k1
fbgt_cont.40997:
	beqi	%a0, 0, bnei_else.40998
	fmov	%f0, %f30
	j	bnei_cont.40999
bnei_else.40998:
	flw	%f0, 468(%zero)
bnei_cont.40999:
bnei_cont.40995:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40981:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2971
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.41000
	j	bnei_cont.40971
bnei_else.41000:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.41002
	add	%a0, %zero, %zero
	j	fbgt_cont.41003
fbgt_else.41002:
	add	%a0, %zero, %k1
fbgt_cont.41003:
	beqi	%a0, 0, bnei_else.41004
	j	bnei_cont.41005
bnei_else.41004:
	fmov	%f0, %fzero
bnei_cont.41005:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.41001:
	j	bnei_cont.40971
bnei_else.40978:
bnei_cont.40979:
	j	bnei_cont.40971
bnei_else.40970:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41006
	add	%a0, %zero, %zero
	j	fbgt_cont.41007
fbgt_else.41006:
	add	%a0, %zero, %k1
fbgt_cont.41007:
	beqi	%a0, 0, bnei_else.41008
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41010
	add	%a0, %zero, %zero
	j	bnei_cont.41009
fbgt_else.41010:
	add	%a0, %zero, %k1
fbgt_cont.41011:
	j	bnei_cont.41009
bnei_else.41008:
	add	%a0, %zero, %zero
bnei_cont.41009:
	beqi	%a0, 0, bnei_else.41012
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.41014
	beqi	%ra, 2, bnei_else.41016
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.41018
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41019
bnei_else.41018:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.41019:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41020
	add	%a0, %zero, %k1
	j	fbeq_cont.41021
fbeq_else.41020:
	add	%a0, %zero, %zero
fbeq_cont.41021:
	beqi	%a0, 0, bnei_else.41022
	fmov	%f0, %f30
	j	bnei_cont.41023
bnei_else.41022:
	beqi	%a3, 0, bnei_else.41024
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41025
bnei_else.41024:
	fdiv	%f0, %f30, %f1
bnei_cont.41025:
bnei_cont.41023:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41015
bnei_else.41016:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41017:
	j	bnei_cont.41015
bnei_else.41014:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41026
	add	%a0, %zero, %k1
	j	fbeq_cont.41027
fbeq_else.41026:
	add	%a0, %zero, %zero
fbeq_cont.41027:
	beqi	%a0, 0, bnei_else.41028
	fmov	%f0, %fzero
	j	bnei_cont.41029
bnei_else.41028:
	fblt	%fzero, %f0, fbgt_else.41030
	add	%a0, %zero, %zero
	j	fbgt_cont.41031
fbgt_else.41030:
	add	%a0, %zero, %k1
fbgt_cont.41031:
	beqi	%a0, 0, bnei_else.41032
	fmov	%f0, %f30
	j	bnei_cont.41033
bnei_else.41032:
	flw	%f0, 468(%zero)
bnei_cont.41033:
bnei_cont.41029:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41015:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2971
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.41034
	j	bnei_cont.41013
bnei_else.41034:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.41036
	add	%a0, %zero, %zero
	j	fbgt_cont.41037
fbgt_else.41036:
	add	%a0, %zero, %k1
fbgt_cont.41037:
	beqi	%a0, 0, bnei_else.41038
	j	bnei_cont.41039
bnei_else.41038:
	fmov	%f0, %fzero
bnei_cont.41039:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t2)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.41035:
	j	bnei_cont.41013
bnei_else.41012:
bnei_cont.41013:
bnei_cont.40971:
	addi	%a1, %zero, 116
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
do_without_neighbors.3014:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.41202
	lw	%a2, 7(%v0)
	sw	%a2, 7(%sp)
	lw	%k0, 6(%v0)
	sw	%k0, 8(%sp)
	lw	%t0, 5(%v0)
	lw	%a1, 4(%v0)
	sw	%a1, 9(%sp)
	lw	%s0, 3(%v0)
	sw	%s0, 10(%sp)
	lw	%a1, 2(%v0)
	sw	%a1, 11(%sp)
	lw	%a3, 1(%v0)
	sw	%a3, 12(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	blti	%a1, 0, bgti_else.41203
	add	%at, %s0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41204
	add	%at, %t0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%t2, 0(%k0)
	add	%at, %a2, %v1
	lw	%t1, 0(%at)
	add	%at, %a3, %v1
	lw	%t3, 0(%at)
	beqi	%t2, 0, bnei_else.41206
	lw	%s1, 179(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	j	bnei_cont.41207
bnei_else.41206:
bnei_cont.41207:
	beqi	%t2, 1, bnei_else.41208
	lw	%s1, 180(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	j	bnei_cont.41209
bnei_else.41208:
bnei_cont.41209:
	beqi	%t2, 2, bnei_else.41210
	lw	%s1, 181(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	j	bnei_cont.41211
bnei_else.41210:
bnei_cont.41211:
	beqi	%t2, 3, bnei_else.41212
	lw	%s1, 182(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	j	bnei_cont.41213
bnei_else.41212:
bnei_cont.41213:
	beqi	%t2, 4, bnei_else.41214
	lw	%s1, 183(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	j	bnei_cont.41215
bnei_else.41214:
bnei_cont.41215:
	lw	%a1, 9(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.41205
bnei_else.41204:
bnei_cont.41205:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.41216
	lw	%a0, 11(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41217
	lw	%a0, 10(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41218
	add	%at, %t0, %t2
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 8(%sp)
	lw	%t3, 0(%a0)
	lw	%a0, 7(%sp)
	add	%at, %a0, %t2
	lw	%t1, 0(%at)
	lw	%a0, 12(%sp)
	add	%at, %a0, %t2
	lw	%t0, 0(%at)
	beqi	%t3, 0, bnei_else.41220
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -13
	j	bnei_cont.41221
bnei_else.41220:
bnei_cont.41221:
	beqi	%t3, 1, bnei_else.41222
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -13
	j	bnei_cont.41223
bnei_else.41222:
bnei_cont.41223:
	beqi	%t3, 2, bnei_else.41224
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -13
	j	bnei_cont.41225
bnei_else.41224:
bnei_cont.41225:
	beqi	%t3, 3, bnei_else.41226
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -13
	j	bnei_cont.41227
bnei_else.41226:
bnei_cont.41227:
	beqi	%t3, 4, bnei_else.41228
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -13
	j	bnei_cont.41229
bnei_else.41228:
bnei_cont.41229:
	lw	%a0, 9(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.41219
bnei_else.41218:
bnei_cont.41219:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.41217:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.41216:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.41203:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.41202:
	add	%t0, %zero, %a0
	jr	%ra
try_exploit_neighbors.3030:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s3, 0(%at)
	sw	%s3, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.41446
	lw	%s5, 7(%s3)
	lw	%s6, 6(%s3)
	lw	%s2, 5(%s3)
	lw	%k0, 4(%s3)
	sw	%k0, 3(%sp)
	lw	%s0, 3(%s3)
	lw	%s1, 2(%s3)
	lw	%k0, 1(%s3)
	add	%at, %s1, %a3
	lw	%s7, 0(%at)
	blti	%s7, 0, bgti_else.41447
	add	%at, %a0, %v0
	lw	%ra, 0(%at)
	lw	%s3, 5(%ra)
	lw	%s4, 2(%ra)
	add	%at, %s4, %a3
	lw	%ra, 0(%at)
	bne	%ra, %s7, beq_else.41448
	add	%at, %a2, %v0
	lw	%ra, 0(%at)
	lw	%ra, 2(%ra)
	add	%at, %ra, %a3
	lw	%ra, 0(%at)
	bne	%ra, %s7, beq_else.41450
	addi	%ra, %v0, -1
	add	%at, %a1, %ra
	lw	%ra, 0(%at)
	lw	%ra, 2(%ra)
	add	%at, %ra, %a3
	lw	%ra, 0(%at)
	bne	%ra, %s7, beq_else.41452
	addi	%ra, %v0, 1
	add	%at, %a1, %ra
	lw	%ra, 0(%at)
	lw	%ra, 2(%ra)
	add	%at, %ra, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s7, beq_else.41454
	add	%a3, %zero, %k1
	j	beq_cont.41449
beq_else.41454:
	add	%a3, %zero, %zero
beq_cont.41455:
	j	beq_cont.41449
beq_else.41452:
	add	%a3, %zero, %zero
beq_cont.41453:
	j	beq_cont.41449
beq_else.41450:
	add	%a3, %zero, %zero
beq_cont.41451:
	j	beq_cont.41449
beq_else.41448:
	add	%a3, %zero, %zero
beq_cont.41449:
	beqi	%a3, 0, bnei_else.41456
	lw	%ra, 0(%sp)
	add	%at, %s0, %ra
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.41457
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s6, 5(%a3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s5, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%k0, 5(%a3)
	add	%at, %s3, %ra
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 150(%zero)
	add	%at, %s6, %ra
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s2, %ra
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s5, %ra
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %k0, %ra
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a3, 3(%sp)
	add	%at, %a3, %ra
	lw	%a3, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a3)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a3)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a3)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.41458
bnei_else.41457:
bnei_cont.41458:
	lw	%a3, 0(%sp)
	addi	%k0, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %k0, bgt_else.41459
	add	%at, %s1, %k0
	lw	%ra, 0(%at)
	blti	%ra, 0, bgti_else.41460
	add	%at, %s4, %k0
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.41461
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.41463
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.41465
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.41467
	add	%a3, %zero, %k1
	j	beq_cont.41462
beq_else.41467:
	add	%a3, %zero, %zero
beq_cont.41468:
	j	beq_cont.41462
beq_else.41465:
	add	%a3, %zero, %zero
beq_cont.41466:
	j	beq_cont.41462
beq_else.41463:
	add	%a3, %zero, %zero
beq_cont.41464:
	j	beq_cont.41462
beq_else.41461:
	add	%a3, %zero, %zero
beq_cont.41462:
	beqi	%a3, 0, bnei_else.41469
	add	%at, %s0, %k0
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.41470
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s1, 5(%a3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s0, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%ra, 5(%a3)
	add	%at, %s3, %k0
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 150(%zero)
	add	%at, %s1, %k0
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s2, %k0
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s0, %k0
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %ra, %k0
	lw	%a3, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a3)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a3, 3(%sp)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a3)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a3)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a3)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.41471
bnei_else.41470:
bnei_cont.41471:
	addi	%a3, %k0, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3030
bnei_else.41469:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %k0, 0
	j	do_without_neighbors.3014
bgti_else.41460:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.41459:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.41456:
	lw	%a2, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.41474
	blti	%s7, 0, bgti_else.41475
	add	%at, %s0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41476
	add	%at, %s2, %a2
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a1, 0(%s6)
	sw	%a1, 4(%sp)
	add	%at, %s5, %a2
	lw	%v1, 0(%at)
	sw	%v1, 5(%sp)
	add	%at, %k0, %a2
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	beqi	%a1, 0, bnei_else.41478
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41479
bnei_else.41478:
bnei_cont.41479:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.41480
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41481
bnei_else.41480:
bnei_cont.41481:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.41482
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41483
bnei_else.41482:
bnei_cont.41483:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.41484
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41485
bnei_else.41484:
bnei_cont.41485:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.41486
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41487
bnei_else.41486:
bnei_cont.41487:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.41477
bnei_else.41476:
bnei_cont.41477:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3014
bgti_else.41475:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.41474:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.41447:
	jr	%ra
bgt_else.41446:
	jr	%ra
pretrace_diffuse_rays.3043:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.41819
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	sw	%a3, 5(%sp)
	lw	%a1, 5(%v0)
	sw	%a1, 6(%sp)
	lw	%k0, 3(%v0)
	sw	%k0, 7(%sp)
	lw	%a1, 2(%v0)
	sw	%a1, 8(%sp)
	lw	%a2, 1(%v0)
	sw	%a2, 9(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	blti	%a1, 0, bgti_else.41820
	add	%at, %k0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41821
	lw	%a0, 0(%a3)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%s2, 179(%a0)
	add	%at, %t0, %v1
	lw	%s1, 0(%at)
	add	%at, %a2, %v1
	lw	%v0, 0(%at)
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2894
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0
	addi	%v1, %s1, 0
	addi	%v0, %s2, 0
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -10
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.41822
bnei_else.41821:
bnei_cont.41822:
	lw	%a0, 1(%sp)
	addi	%t1, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t1, bgt_else.41823
	lw	%a0, 8(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41824
	lw	%a0, 7(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41825
	lw	%a0, 5(%sp)
	lw	%a0, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a0, 179(%a0)
	sw	%a0, 10(%sp)
	add	%at, %t0, %t1
	lw	%a0, 0(%at)
	sw	%a0, 11(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %t1
	lw	%t0, 0(%at)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -12
	lw	%a0, 10(%sp)
	lw	%a0, 118(%a0)
	lw	%a2, 0(%a0)
	sw	%a2, 12(%sp)
	flw	%f1, 0(%a2)
	lw	%a1, 11(%sp)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a2)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a2)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.41827
	add	%a1, %zero, %zero
	j	fbgt_cont.41828
fbgt_else.41827:
	add	%a1, %zero, %k1
fbgt_cont.41828:
	beqi	%a1, 0, bnei_else.41829
	lw	%a0, 10(%sp)
	lw	%a0, 119(%a0)
	sw	%a0, 13(%sp)
	flw	%f0, 440(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 14(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -15
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41831
	add	%a0, %zero, %zero
	j	fbgt_cont.41832
fbgt_else.41831:
	add	%a0, %zero, %k1
fbgt_cont.41832:
	beqi	%a0, 0, bnei_else.41833
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41835
	add	%a0, %zero, %zero
	j	bnei_cont.41834
fbgt_else.41835:
	add	%a0, %zero, %k1
fbgt_cont.41836:
	j	bnei_cont.41834
bnei_else.41833:
	add	%a0, %zero, %zero
bnei_cont.41834:
	beqi	%a0, 0, bnei_cont.41830
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a0, 13(%sp)
	lw	%s0, 0(%a0)
	lw	%a1, 9(%v0)
	lw	%a0, 7(%v0)
	sw	%a0, 15(%sp)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.41839
	beqi	%ra, 2, bnei_else.41841
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.41843
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41844
bnei_else.41843:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.41844:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41845
	add	%a0, %zero, %k1
	j	fbeq_cont.41846
fbeq_else.41845:
	add	%a0, %zero, %zero
fbeq_cont.41846:
	beqi	%a0, 0, bnei_else.41847
	fmov	%f0, %f30
	j	bnei_cont.41848
bnei_else.41847:
	beqi	%a3, 0, bnei_else.41849
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41850
bnei_else.41849:
	fdiv	%f0, %f30, %f1
bnei_cont.41850:
bnei_cont.41848:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41840
bnei_else.41841:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41842:
	j	bnei_cont.41840
bnei_else.41839:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %s0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41851
	add	%a0, %zero, %k1
	j	fbeq_cont.41852
fbeq_else.41851:
	add	%a0, %zero, %zero
fbeq_cont.41852:
	beqi	%a0, 0, bnei_else.41853
	fmov	%f0, %fzero
	j	bnei_cont.41854
bnei_else.41853:
	fblt	%fzero, %f0, fbgt_else.41855
	add	%a0, %zero, %zero
	j	fbgt_cont.41856
fbgt_else.41855:
	add	%a0, %zero, %k1
fbgt_cont.41856:
	beqi	%a0, 0, bnei_else.41857
	fmov	%f0, %f30
	j	bnei_cont.41858
bnei_else.41857:
	flw	%f0, 468(%zero)
bnei_cont.41858:
bnei_cont.41854:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41840:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 16
	jal	utexture.2971
	addi	%sp, %sp, -16
	lw	%v1, 14(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.41859
	j	bnei_cont.41830
bnei_else.41859:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.41861
	add	%a0, %zero, %zero
	j	fbgt_cont.41862
fbgt_else.41861:
	add	%a0, %zero, %k1
fbgt_cont.41862:
	beqi	%a0, 0, bnei_else.41863
	j	bnei_cont.41864
bnei_else.41863:
	fmov	%f0, %fzero
bnei_cont.41864:
	fmul	%f1, %f27, %f0
	lw	%a0, 15(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.41860:
	j	bnei_cont.41830
bnei_else.41837:
bnei_cont.41838:
	j	bnei_cont.41830
bnei_else.41829:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 16(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 17
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -17
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41865
	add	%a0, %zero, %zero
	j	fbgt_cont.41866
fbgt_else.41865:
	add	%a0, %zero, %k1
fbgt_cont.41866:
	beqi	%a0, 0, bnei_else.41867
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41869
	add	%a0, %zero, %zero
	j	bnei_cont.41868
fbgt_else.41869:
	add	%a0, %zero, %k1
fbgt_cont.41870:
	j	bnei_cont.41868
bnei_else.41867:
	add	%a0, %zero, %zero
bnei_cont.41868:
	beqi	%a0, 0, bnei_else.41871
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%a0, 7(%v0)
	sw	%a0, 17(%sp)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.41873
	beqi	%ra, 2, bnei_else.41875
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.41877
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41878
bnei_else.41877:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.41878:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41879
	add	%a0, %zero, %k1
	j	fbeq_cont.41880
fbeq_else.41879:
	add	%a0, %zero, %zero
fbeq_cont.41880:
	beqi	%a0, 0, bnei_else.41881
	fmov	%f0, %f30
	j	bnei_cont.41882
bnei_else.41881:
	beqi	%a3, 0, bnei_else.41883
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41884
bnei_else.41883:
	fdiv	%f0, %f30, %f1
bnei_cont.41884:
bnei_cont.41882:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41874
bnei_else.41875:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41876:
	j	bnei_cont.41874
bnei_else.41873:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 12(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41885
	add	%a0, %zero, %k1
	j	fbeq_cont.41886
fbeq_else.41885:
	add	%a0, %zero, %zero
fbeq_cont.41886:
	beqi	%a0, 0, bnei_else.41887
	fmov	%f0, %fzero
	j	bnei_cont.41888
bnei_else.41887:
	fblt	%fzero, %f0, fbgt_else.41889
	add	%a0, %zero, %zero
	j	fbgt_cont.41890
fbgt_else.41889:
	add	%a0, %zero, %k1
fbgt_cont.41890:
	beqi	%a0, 0, bnei_else.41891
	fmov	%f0, %f30
	j	bnei_cont.41892
bnei_else.41891:
	flw	%f0, 468(%zero)
bnei_cont.41892:
bnei_cont.41888:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41874:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 18
	jal	utexture.2971
	addi	%sp, %sp, -18
	lw	%v1, 16(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 18
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -18
	beqi	%v0, 0, bnei_else.41893
	j	bnei_cont.41872
bnei_else.41893:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.41895
	add	%a0, %zero, %zero
	j	fbgt_cont.41896
fbgt_else.41895:
	add	%a0, %zero, %k1
fbgt_cont.41896:
	beqi	%a0, 0, bnei_else.41897
	j	bnei_cont.41898
bnei_else.41897:
	fmov	%f0, %fzero
bnei_cont.41898:
	fmul	%f1, %f27, %f0
	lw	%a0, 17(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.41894:
	j	bnei_cont.41872
bnei_else.41871:
bnei_cont.41872:
bnei_cont.41830:
	addi	%a1, %zero, 116
	lw	%v1, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%a0, %t0, 0
	addi	%sp, %sp, 18
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -18
	lw	%a0, 6(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.41826
bnei_else.41825:
bnei_cont.41826:
	addi	%v1, %t1, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3043
bgti_else.41824:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.41823:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.41820:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.41819:
	add	%t0, %zero, %a0
	jr	%ra
pretrace_pixels.3046:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%t5, 6(%sp)
	sw	%t4, 7(%sp)
	sw	%t3, 8(%sp)
	sw	%t2, 9(%sp)
	sw	%t1, 10(%sp)
	sw	%t0, 11(%sp)
	sw	%ra, 12(%sp)
	blti	%v1, 0, bgti_else.42210
	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	sub	%a0, %v1, %a0
	itof	%f16, %a0
	fmul	%f17, %f17, %f16
	flw	%f16, 165(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f0, %f16, %f0
	fsw	%f0, 174(%zero)
	flw	%f0, 166(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f1
	fsw	%f0, 175(%zero)
	flw	%f0, 167(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f2
	fsw	%f0, 176(%zero)
	flw	%f18, 174(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 175(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 176(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fbne	%f0, %fzero, fbeq_else.42211
	add	%a0, %zero, %k1
	j	fbeq_cont.42212
fbeq_else.42211:
	add	%a0, %zero, %zero
fbeq_cont.42212:
	beqi	%a0, 0, bnei_else.42213
	fmov	%f0, %f30
	j	bnei_cont.42214
bnei_else.42213:
	fdiv	%f0, %f30, %f0
bnei_cont.42214:
	fmul	%f1, %f18, %f0
	fsw	%f1, 174(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 175(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 176(%zero)
	fsw	%fzero, 151(%zero)
	fsw	%fzero, 152(%zero)
	fsw	%fzero, 153(%zero)
	flw	%f0, 75(%zero)
	fsw	%f0, 159(%zero)
	flw	%f0, 76(%zero)
	fsw	%f0, 160(%zero)
	flw	%f0, 77(%zero)
	fsw	%f0, 161(%zero)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%t0, 0(%at)
	addi	%v1, %zero, 174
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %f30
	addi	%sp, %sp, 13
	jal	trace_ray.2983
	addi	%sp, %sp, -13
	lw	%a2, 7(%t0)
	lw	%k0, 6(%t0)
	lw	%a0, 5(%t0)
	sw	%a0, 13(%sp)
	lw	%ra, 3(%t0)
	lw	%a1, 2(%t0)
	lw	%a3, 1(%t0)
	lw	%a0, 0(%t0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%a0)
	lw	%a0, 5(%sp)
	sw	%a0, 0(%k0)
	lw	%a0, 0(%a1)
	blti	%a0, 0, bgti_else.42215
	lw	%a0, 0(%ra)
	beqi	%a0, 0, bnei_else.42217
	lw	%a0, 0(%k0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%t2, 179(%a0)
	lw	%t3, 0(%a2)
	lw	%t1, 0(%a3)
	flw	%f0, 0(%t1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -14
	lw	%a0, 118(%t2)
	lw	%t4, 0(%a0)
	flw	%f1, 0(%t4)
	flw	%f0, 0(%t3)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%t4)
	flw	%f0, 1(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%t4)
	flw	%f0, 2(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.42219
	add	%a1, %zero, %zero
	j	fbgt_cont.42220
fbgt_else.42219:
	add	%a1, %zero, %k1
fbgt_cont.42220:
	beqi	%a1, 0, bnei_else.42221
	lw	%t4, 119(%t2)
	flw	%f0, 440(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t5, 134(%zero)
	addi	%a0, %t4, 0
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 14
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.42223
	add	%a0, %zero, %zero
	j	fbgt_cont.42224
fbgt_else.42223:
	add	%a0, %zero, %k1
fbgt_cont.42224:
	beqi	%a0, 0, bnei_else.42225
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.42227
	add	%a0, %zero, %zero
	j	bnei_cont.42226
fbgt_else.42227:
	add	%a0, %zero, %k1
fbgt_cont.42228:
	j	bnei_cont.42226
bnei_else.42225:
	add	%a0, %zero, %zero
bnei_cont.42226:
	beqi	%a0, 0, bnei_cont.42222
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%s0, 0(%t4)
	lw	%a1, 9(%v0)
	lw	%t4, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.42231
	beqi	%ra, 2, bnei_else.42233
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.42235
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42236
bnei_else.42235:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.42236:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.42237
	add	%a0, %zero, %k1
	j	fbeq_cont.42238
fbeq_else.42237:
	add	%a0, %zero, %zero
fbeq_cont.42238:
	beqi	%a0, 0, bnei_else.42239
	fmov	%f0, %f30
	j	bnei_cont.42240
bnei_else.42239:
	beqi	%a3, 0, bnei_else.42241
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.42242
bnei_else.42241:
	fdiv	%f0, %f30, %f1
bnei_cont.42242:
bnei_cont.42240:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42232
bnei_else.42233:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.42234:
	j	bnei_cont.42232
bnei_else.42231:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %s0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.42243
	add	%a0, %zero, %k1
	j	fbeq_cont.42244
fbeq_else.42243:
	add	%a0, %zero, %zero
fbeq_cont.42244:
	beqi	%a0, 0, bnei_else.42245
	fmov	%f0, %fzero
	j	bnei_cont.42246
bnei_else.42245:
	fblt	%fzero, %f0, fbgt_else.42247
	add	%a0, %zero, %zero
	j	fbgt_cont.42248
fbgt_else.42247:
	add	%a0, %zero, %k1
fbgt_cont.42248:
	beqi	%a0, 0, bnei_else.42249
	fmov	%f0, %f30
	j	bnei_cont.42250
bnei_else.42249:
	flw	%f0, 468(%zero)
bnei_cont.42250:
bnei_cont.42246:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.42232:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	jal	utexture.2971
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.42251
	j	bnei_cont.42222
bnei_else.42251:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.42253
	add	%a0, %zero, %zero
	j	fbgt_cont.42254
fbgt_else.42253:
	add	%a0, %zero, %k1
fbgt_cont.42254:
	beqi	%a0, 0, bnei_else.42255
	j	bnei_cont.42256
bnei_else.42255:
	fmov	%f0, %fzero
bnei_cont.42256:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t4)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.42252:
	j	bnei_cont.42222
bnei_else.42229:
bnei_cont.42230:
	j	bnei_cont.42222
bnei_else.42221:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t5, 134(%zero)
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 14
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.42257
	add	%a0, %zero, %zero
	j	fbgt_cont.42258
fbgt_else.42257:
	add	%a0, %zero, %k1
fbgt_cont.42258:
	beqi	%a0, 0, bnei_else.42259
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.42261
	add	%a0, %zero, %zero
	j	bnei_cont.42260
fbgt_else.42261:
	add	%a0, %zero, %k1
fbgt_cont.42262:
	j	bnei_cont.42260
bnei_else.42259:
	add	%a0, %zero, %zero
bnei_cont.42260:
	beqi	%a0, 0, bnei_else.42263
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%a0, 7(%v0)
	sw	%a0, 14(%sp)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%k0, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%ra, 1(%v0)
	beqi	%ra, 1, bnei_else.42265
	beqi	%ra, 2, bnei_else.42267
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%k0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%k0)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.42269
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	flw	%f16, 0(%a1)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42270
bnei_else.42269:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.42270:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.42271
	add	%a0, %zero, %k1
	j	fbeq_cont.42272
fbeq_else.42271:
	add	%a0, %zero, %zero
fbeq_cont.42272:
	beqi	%a0, 0, bnei_else.42273
	fmov	%f0, %f30
	j	bnei_cont.42274
bnei_else.42273:
	beqi	%a3, 0, bnei_else.42275
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.42276
bnei_else.42275:
	fdiv	%f0, %f30, %f1
bnei_cont.42276:
bnei_cont.42274:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42266
bnei_else.42267:
	flw	%f0, 0(%k0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%k0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%k0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.42268:
	j	bnei_cont.42266
bnei_else.42265:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t4, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.42277
	add	%a0, %zero, %k1
	j	fbeq_cont.42278
fbeq_else.42277:
	add	%a0, %zero, %zero
fbeq_cont.42278:
	beqi	%a0, 0, bnei_else.42279
	fmov	%f0, %fzero
	j	bnei_cont.42280
bnei_else.42279:
	fblt	%fzero, %f0, fbgt_else.42281
	add	%a0, %zero, %zero
	j	fbgt_cont.42282
fbgt_else.42281:
	add	%a0, %zero, %k1
fbgt_cont.42282:
	beqi	%a0, 0, bnei_else.42283
	fmov	%f0, %f30
	j	bnei_cont.42284
bnei_else.42283:
	flw	%f0, 468(%zero)
bnei_cont.42284:
bnei_cont.42280:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.42266:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 15
	jal	utexture.2971
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.42285
	j	bnei_cont.42264
bnei_else.42285:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.42287
	add	%a0, %zero, %zero
	j	fbgt_cont.42288
fbgt_else.42287:
	add	%a0, %zero, %k1
fbgt_cont.42288:
	beqi	%a0, 0, bnei_else.42289
	j	bnei_cont.42290
bnei_else.42289:
	fmov	%f0, %fzero
bnei_cont.42290:
	fmul	%f1, %f27, %f0
	lw	%a0, 14(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.42286:
	j	bnei_cont.42264
bnei_else.42263:
bnei_cont.42264:
bnei_cont.42222:
	addi	%a1, %zero, 116
	addi	%a0, %t1, 0
	addi	%v1, %t3, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 15
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -15
	lw	%a0, 13(%sp)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.42218
bnei_else.42217:
bnei_cont.42218:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 15
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -15
	j	bgti_cont.42216
bgti_else.42215:
bgti_cont.42216:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.42291
	addi	%a0, %a0, -5
	j	bgti_cont.42292
bgti_else.42291:
bgti_cont.42292:
	lw	%t5, 6(%sp)
	lw	%t4, 7(%sp)
	lw	%t3, 8(%sp)
	lw	%t2, 9(%sp)
	lw	%t1, 10(%sp)
	lw	%t0, 11(%sp)
	lw	%ra, 12(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.42210:
	jr	%ra
scan_pixel.3057:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%t4, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 9(%sp)
	sw	%ra, 10(%sp)
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.44615
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.44615:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%k0, 7(%t1)
	lw	%s1, 6(%t1)
	lw	%ra, 5(%t1)
	lw	%a0, 4(%t1)
	sw	%a0, 11(%sp)
	lw	%a1, 3(%t1)
	lw	%a3, 2(%t1)
	lw	%s0, 1(%t1)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a2, 155(%zero)
	sw	%a2, 12(%sp)
	addi	%a0, %v1, 1
	sw	%a0, 13(%sp)
	blt	%a0, %a2, bgt_else.44617
	add	%a0, %zero, %zero
	j	bgt_cont.44618
bgt_else.44617:
	blt	%zero, %v1, bgt_else.44619
	add	%a0, %zero, %zero
	j	bgt_cont.44620
bgt_else.44619:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.44621
	add	%a0, %zero, %zero
	j	bgt_cont.44622
bgt_else.44621:
	blt	%zero, %v0, bgt_else.44623
	add	%a0, %zero, %zero
	j	bgt_cont.44624
bgt_else.44623:
	add	%a0, %zero, %k1
bgt_cont.44624:
bgt_cont.44622:
bgt_cont.44620:
bgt_cont.44618:
	beqi	%a0, 0, bnei_else.44625
	lw	%k0, 0(%a3)
	blti	%k0, 0, bnei_cont.44626
	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%s0, 5(%a0)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %k0, beq_else.44629
	lw	%a0, 4(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %k0, beq_else.44631
	addi	%a0, %a3, -1
	lw	%a2, 3(%sp)
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %k0, beq_else.44633
	addi	%a0, %a3, 1
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %k0, beq_else.44635
	add	%a0, %zero, %k1
	j	beq_cont.44630
beq_else.44635:
	add	%a0, %zero, %zero
beq_cont.44636:
	j	beq_cont.44630
beq_else.44633:
	add	%a0, %zero, %zero
beq_cont.44634:
	j	beq_cont.44630
beq_else.44631:
	add	%a0, %zero, %zero
beq_cont.44632:
	j	beq_cont.44630
beq_else.44629:
	add	%a0, %zero, %zero
beq_cont.44630:
	beqi	%a0, 0, bnei_else.44637
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.44639
	lw	%k0, 0(%sp)
	addi	%a0, %k0, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a3, 5(%a0)
	addi	%a0, %k0, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	add	%at, %a0, %k0
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	lw	%a0, 0(%s0)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%a3)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%ra)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%a2)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%a1)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 11(%sp)
	lw	%a0, 0(%a0)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.44640
bnei_else.44639:
bnei_cont.44640:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -14
	j	bnei_cont.44626
bnei_else.44637:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
bnei_cont.44638:
	j	bnei_cont.44626
bgti_else.44627:
bgti_cont.44628:
	j	bnei_cont.44626
bnei_else.44625:
	lw	%a0, 0(%a3)
	blti	%a0, 0, bgti_else.44641
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.44643
	lw	%a0, 0(%ra)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%t4, 0(%s1)
	lw	%t3, 0(%k0)
	lw	%t2, 0(%s0)
	beqi	%t4, 0, bnei_else.44645
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44646
bnei_else.44645:
bnei_cont.44646:
	beqi	%t4, 1, bnei_else.44647
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44648
bnei_else.44647:
bnei_cont.44648:
	beqi	%t4, 2, bnei_else.44649
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44650
bnei_else.44649:
bnei_cont.44650:
	beqi	%t4, 3, bnei_else.44651
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44652
bnei_else.44651:
bnei_cont.44652:
	beqi	%t4, 4, bnei_else.44653
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44654
bnei_else.44653:
bnei_cont.44654:
	lw	%a0, 11(%sp)
	lw	%a0, 0(%a0)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.44644
bnei_else.44643:
bnei_cont.44644:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
	j	bgti_cont.44642
bgti_else.44641:
bgti_cont.44642:
bnei_cont.44626:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44655
	blti	%a1, 0, bgti_else.44657
	j	bgt_cont.44656
bgti_else.44657:
	add	%a1, %zero, %zero
bgti_cont.44658:
	j	bgt_cont.44656
bgt_else.44655:
	addi	%a1, %zero, 255
bgt_cont.44656:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	blti	%a1, 10, bgti_else.44659
	blti	%a1, 20, bgti_else.44661
	blti	%a1, 30, bgti_else.44663
	blti	%a1, 40, bgti_else.44665
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44660
	blti	%a1, 20, bgti_else.44669
	blti	%a1, 30, bgti_else.44671
	blti	%a1, 40, bgti_else.44673
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44660
	blti	%a1, 20, bgti_else.44677
	blti	%a1, 30, bgti_else.44679
	blti	%a1, 40, bgti_else.44681
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44660
	blti	%a1, 20, bgti_else.44685
	blti	%a1, 30, bgti_else.44687
	blti	%a1, 40, bgti_else.44689
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44660
bgti_else.44689:
	addi	%a1, %a1, -30
bgti_cont.44690:
	j	bgti_cont.44660
bgti_else.44687:
	addi	%a1, %a1, -20
bgti_cont.44688:
	j	bgti_cont.44660
bgti_else.44685:
	addi	%a1, %a1, -10
bgti_cont.44686:
	j	bgti_cont.44660
bgti_else.44683:
bgti_cont.44684:
	j	bgti_cont.44660
bgti_else.44681:
	addi	%a1, %a1, -30
bgti_cont.44682:
	j	bgti_cont.44660
bgti_else.44679:
	addi	%a1, %a1, -20
bgti_cont.44680:
	j	bgti_cont.44660
bgti_else.44677:
	addi	%a1, %a1, -10
bgti_cont.44678:
	j	bgti_cont.44660
bgti_else.44675:
bgti_cont.44676:
	j	bgti_cont.44660
bgti_else.44673:
	addi	%a1, %a1, -30
bgti_cont.44674:
	j	bgti_cont.44660
bgti_else.44671:
	addi	%a1, %a1, -20
bgti_cont.44672:
	j	bgti_cont.44660
bgti_else.44669:
	addi	%a1, %a1, -10
bgti_cont.44670:
	j	bgti_cont.44660
bgti_else.44667:
bgti_cont.44668:
	j	bgti_cont.44660
bgti_else.44665:
	addi	%a1, %a1, -30
bgti_cont.44666:
	j	bgti_cont.44660
bgti_else.44663:
	addi	%a1, %a1, -20
bgti_cont.44664:
	j	bgti_cont.44660
bgti_else.44661:
	addi	%a1, %a1, -10
bgti_cont.44662:
	j	bgti_cont.44660
bgti_else.44659:
bgti_cont.44660:
	blt	%zero, %a2, bgt_else.44691
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44692
bgt_else.44691:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44693
	blti	%a2, 20, bgti_else.44695
	blti	%a2, 30, bgti_else.44697
	blti	%a2, 40, bgti_else.44699
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44694
	blti	%a2, 20, bgti_else.44703
	blti	%a2, 30, bgti_else.44705
	blti	%a2, 40, bgti_else.44707
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44694
	blti	%a2, 20, bgti_else.44711
	blti	%a2, 30, bgti_else.44713
	blti	%a2, 40, bgti_else.44715
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44694
	blti	%a2, 20, bgti_else.44719
	blti	%a2, 30, bgti_else.44721
	blti	%a2, 40, bgti_else.44723
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44694
bgti_else.44723:
	addi	%a2, %a2, -30
bgti_cont.44724:
	j	bgti_cont.44694
bgti_else.44721:
	addi	%a2, %a2, -20
bgti_cont.44722:
	j	bgti_cont.44694
bgti_else.44719:
	addi	%a2, %a2, -10
bgti_cont.44720:
	j	bgti_cont.44694
bgti_else.44717:
bgti_cont.44718:
	j	bgti_cont.44694
bgti_else.44715:
	addi	%a2, %a2, -30
bgti_cont.44716:
	j	bgti_cont.44694
bgti_else.44713:
	addi	%a2, %a2, -20
bgti_cont.44714:
	j	bgti_cont.44694
bgti_else.44711:
	addi	%a2, %a2, -10
bgti_cont.44712:
	j	bgti_cont.44694
bgti_else.44709:
bgti_cont.44710:
	j	bgti_cont.44694
bgti_else.44707:
	addi	%a2, %a2, -30
bgti_cont.44708:
	j	bgti_cont.44694
bgti_else.44705:
	addi	%a2, %a2, -20
bgti_cont.44706:
	j	bgti_cont.44694
bgti_else.44703:
	addi	%a2, %a2, -10
bgti_cont.44704:
	j	bgti_cont.44694
bgti_else.44701:
bgti_cont.44702:
	j	bgti_cont.44694
bgti_else.44699:
	addi	%a2, %a2, -30
bgti_cont.44700:
	j	bgti_cont.44694
bgti_else.44697:
	addi	%a2, %a2, -20
bgti_cont.44698:
	j	bgti_cont.44694
bgti_else.44695:
	addi	%a2, %a2, -10
bgti_cont.44696:
	j	bgti_cont.44694
bgti_else.44693:
bgti_cont.44694:
	blt	%zero, %a0, bgt_else.44725
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44726
bgt_else.44725:
	blti	%a0, 10, bgti_else.44727
	blti	%a0, 20, bgti_else.44729
	blti	%a0, 30, bgti_else.44731
	blti	%a0, 40, bgti_else.44733
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44728
	blti	%a0, 20, bgti_else.44737
	blti	%a0, 30, bgti_else.44739
	blti	%a0, 40, bgti_else.44741
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44728
	blti	%a0, 20, bgti_else.44745
	blti	%a0, 30, bgti_else.44747
	blti	%a0, 40, bgti_else.44749
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44728
	blti	%a0, 20, bgti_else.44753
	blti	%a0, 30, bgti_else.44755
	blti	%a0, 40, bgti_else.44757
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44728
bgti_else.44757:
	addi	%a0, %a0, -30
bgti_cont.44758:
	j	bgti_cont.44728
bgti_else.44755:
	addi	%a0, %a0, -20
bgti_cont.44756:
	j	bgti_cont.44728
bgti_else.44753:
	addi	%a0, %a0, -10
bgti_cont.44754:
	j	bgti_cont.44728
bgti_else.44751:
bgti_cont.44752:
	j	bgti_cont.44728
bgti_else.44749:
	addi	%a0, %a0, -30
bgti_cont.44750:
	j	bgti_cont.44728
bgti_else.44747:
	addi	%a0, %a0, -20
bgti_cont.44748:
	j	bgti_cont.44728
bgti_else.44745:
	addi	%a0, %a0, -10
bgti_cont.44746:
	j	bgti_cont.44728
bgti_else.44743:
bgti_cont.44744:
	j	bgti_cont.44728
bgti_else.44741:
	addi	%a0, %a0, -30
bgti_cont.44742:
	j	bgti_cont.44728
bgti_else.44739:
	addi	%a0, %a0, -20
bgti_cont.44740:
	j	bgti_cont.44728
bgti_else.44737:
	addi	%a0, %a0, -10
bgti_cont.44738:
	j	bgti_cont.44728
bgti_else.44735:
bgti_cont.44736:
	j	bgti_cont.44728
bgti_else.44733:
	addi	%a0, %a0, -30
bgti_cont.44734:
	j	bgti_cont.44728
bgti_else.44731:
	addi	%a0, %a0, -20
bgti_cont.44732:
	j	bgti_cont.44728
bgti_else.44729:
	addi	%a0, %a0, -10
bgti_cont.44730:
	j	bgti_cont.44728
bgti_else.44727:
bgti_cont.44728:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44726:
bgt_cont.44692:
	addi	%t2, %zero, 32
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44759
	blti	%a1, 0, bgti_else.44761
	j	bgt_cont.44760
bgti_else.44761:
	add	%a1, %zero, %zero
bgti_cont.44762:
	j	bgt_cont.44760
bgt_else.44759:
	addi	%a1, %zero, 255
bgt_cont.44760:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.44763
	blti	%a1, 20, bgti_else.44765
	blti	%a1, 30, bgti_else.44767
	blti	%a1, 40, bgti_else.44769
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44764
	blti	%a1, 20, bgti_else.44773
	blti	%a1, 30, bgti_else.44775
	blti	%a1, 40, bgti_else.44777
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44764
	blti	%a1, 20, bgti_else.44781
	blti	%a1, 30, bgti_else.44783
	blti	%a1, 40, bgti_else.44785
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44764
	blti	%a1, 20, bgti_else.44789
	blti	%a1, 30, bgti_else.44791
	blti	%a1, 40, bgti_else.44793
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44764
bgti_else.44793:
	addi	%a1, %a1, -30
bgti_cont.44794:
	j	bgti_cont.44764
bgti_else.44791:
	addi	%a1, %a1, -20
bgti_cont.44792:
	j	bgti_cont.44764
bgti_else.44789:
	addi	%a1, %a1, -10
bgti_cont.44790:
	j	bgti_cont.44764
bgti_else.44787:
bgti_cont.44788:
	j	bgti_cont.44764
bgti_else.44785:
	addi	%a1, %a1, -30
bgti_cont.44786:
	j	bgti_cont.44764
bgti_else.44783:
	addi	%a1, %a1, -20
bgti_cont.44784:
	j	bgti_cont.44764
bgti_else.44781:
	addi	%a1, %a1, -10
bgti_cont.44782:
	j	bgti_cont.44764
bgti_else.44779:
bgti_cont.44780:
	j	bgti_cont.44764
bgti_else.44777:
	addi	%a1, %a1, -30
bgti_cont.44778:
	j	bgti_cont.44764
bgti_else.44775:
	addi	%a1, %a1, -20
bgti_cont.44776:
	j	bgti_cont.44764
bgti_else.44773:
	addi	%a1, %a1, -10
bgti_cont.44774:
	j	bgti_cont.44764
bgti_else.44771:
bgti_cont.44772:
	j	bgti_cont.44764
bgti_else.44769:
	addi	%a1, %a1, -30
bgti_cont.44770:
	j	bgti_cont.44764
bgti_else.44767:
	addi	%a1, %a1, -20
bgti_cont.44768:
	j	bgti_cont.44764
bgti_else.44765:
	addi	%a1, %a1, -10
bgti_cont.44766:
	j	bgti_cont.44764
bgti_else.44763:
bgti_cont.44764:
	blt	%zero, %a2, bgt_else.44795
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44796
bgt_else.44795:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44797
	blti	%a2, 20, bgti_else.44799
	blti	%a2, 30, bgti_else.44801
	blti	%a2, 40, bgti_else.44803
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44798
	blti	%a2, 20, bgti_else.44807
	blti	%a2, 30, bgti_else.44809
	blti	%a2, 40, bgti_else.44811
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44798
	blti	%a2, 20, bgti_else.44815
	blti	%a2, 30, bgti_else.44817
	blti	%a2, 40, bgti_else.44819
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44798
	blti	%a2, 20, bgti_else.44823
	blti	%a2, 30, bgti_else.44825
	blti	%a2, 40, bgti_else.44827
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44798
bgti_else.44827:
	addi	%a2, %a2, -30
bgti_cont.44828:
	j	bgti_cont.44798
bgti_else.44825:
	addi	%a2, %a2, -20
bgti_cont.44826:
	j	bgti_cont.44798
bgti_else.44823:
	addi	%a2, %a2, -10
bgti_cont.44824:
	j	bgti_cont.44798
bgti_else.44821:
bgti_cont.44822:
	j	bgti_cont.44798
bgti_else.44819:
	addi	%a2, %a2, -30
bgti_cont.44820:
	j	bgti_cont.44798
bgti_else.44817:
	addi	%a2, %a2, -20
bgti_cont.44818:
	j	bgti_cont.44798
bgti_else.44815:
	addi	%a2, %a2, -10
bgti_cont.44816:
	j	bgti_cont.44798
bgti_else.44813:
bgti_cont.44814:
	j	bgti_cont.44798
bgti_else.44811:
	addi	%a2, %a2, -30
bgti_cont.44812:
	j	bgti_cont.44798
bgti_else.44809:
	addi	%a2, %a2, -20
bgti_cont.44810:
	j	bgti_cont.44798
bgti_else.44807:
	addi	%a2, %a2, -10
bgti_cont.44808:
	j	bgti_cont.44798
bgti_else.44805:
bgti_cont.44806:
	j	bgti_cont.44798
bgti_else.44803:
	addi	%a2, %a2, -30
bgti_cont.44804:
	j	bgti_cont.44798
bgti_else.44801:
	addi	%a2, %a2, -20
bgti_cont.44802:
	j	bgti_cont.44798
bgti_else.44799:
	addi	%a2, %a2, -10
bgti_cont.44800:
	j	bgti_cont.44798
bgti_else.44797:
bgti_cont.44798:
	blt	%zero, %a0, bgt_else.44829
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44830
bgt_else.44829:
	blti	%a0, 10, bgti_else.44831
	blti	%a0, 20, bgti_else.44833
	blti	%a0, 30, bgti_else.44835
	blti	%a0, 40, bgti_else.44837
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44832
	blti	%a0, 20, bgti_else.44841
	blti	%a0, 30, bgti_else.44843
	blti	%a0, 40, bgti_else.44845
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44832
	blti	%a0, 20, bgti_else.44849
	blti	%a0, 30, bgti_else.44851
	blti	%a0, 40, bgti_else.44853
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44832
	blti	%a0, 20, bgti_else.44857
	blti	%a0, 30, bgti_else.44859
	blti	%a0, 40, bgti_else.44861
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44832
bgti_else.44861:
	addi	%a0, %a0, -30
bgti_cont.44862:
	j	bgti_cont.44832
bgti_else.44859:
	addi	%a0, %a0, -20
bgti_cont.44860:
	j	bgti_cont.44832
bgti_else.44857:
	addi	%a0, %a0, -10
bgti_cont.44858:
	j	bgti_cont.44832
bgti_else.44855:
bgti_cont.44856:
	j	bgti_cont.44832
bgti_else.44853:
	addi	%a0, %a0, -30
bgti_cont.44854:
	j	bgti_cont.44832
bgti_else.44851:
	addi	%a0, %a0, -20
bgti_cont.44852:
	j	bgti_cont.44832
bgti_else.44849:
	addi	%a0, %a0, -10
bgti_cont.44850:
	j	bgti_cont.44832
bgti_else.44847:
bgti_cont.44848:
	j	bgti_cont.44832
bgti_else.44845:
	addi	%a0, %a0, -30
bgti_cont.44846:
	j	bgti_cont.44832
bgti_else.44843:
	addi	%a0, %a0, -20
bgti_cont.44844:
	j	bgti_cont.44832
bgti_else.44841:
	addi	%a0, %a0, -10
bgti_cont.44842:
	j	bgti_cont.44832
bgti_else.44839:
bgti_cont.44840:
	j	bgti_cont.44832
bgti_else.44837:
	addi	%a0, %a0, -30
bgti_cont.44838:
	j	bgti_cont.44832
bgti_else.44835:
	addi	%a0, %a0, -20
bgti_cont.44836:
	j	bgti_cont.44832
bgti_else.44833:
	addi	%a0, %a0, -10
bgti_cont.44834:
	j	bgti_cont.44832
bgti_else.44831:
bgti_cont.44832:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44830:
bgt_cont.44796:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44863
	blti	%a1, 0, bgti_else.44865
	j	bgt_cont.44864
bgti_else.44865:
	add	%a1, %zero, %zero
bgti_cont.44866:
	j	bgt_cont.44864
bgt_else.44863:
	addi	%a1, %zero, 255
bgt_cont.44864:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.44867
	blti	%a1, 20, bgti_else.44869
	blti	%a1, 30, bgti_else.44871
	blti	%a1, 40, bgti_else.44873
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44868
	blti	%a1, 20, bgti_else.44877
	blti	%a1, 30, bgti_else.44879
	blti	%a1, 40, bgti_else.44881
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44868
	blti	%a1, 20, bgti_else.44885
	blti	%a1, 30, bgti_else.44887
	blti	%a1, 40, bgti_else.44889
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44868
	blti	%a1, 20, bgti_else.44893
	blti	%a1, 30, bgti_else.44895
	blti	%a1, 40, bgti_else.44897
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44868
bgti_else.44897:
	addi	%a1, %a1, -30
bgti_cont.44898:
	j	bgti_cont.44868
bgti_else.44895:
	addi	%a1, %a1, -20
bgti_cont.44896:
	j	bgti_cont.44868
bgti_else.44893:
	addi	%a1, %a1, -10
bgti_cont.44894:
	j	bgti_cont.44868
bgti_else.44891:
bgti_cont.44892:
	j	bgti_cont.44868
bgti_else.44889:
	addi	%a1, %a1, -30
bgti_cont.44890:
	j	bgti_cont.44868
bgti_else.44887:
	addi	%a1, %a1, -20
bgti_cont.44888:
	j	bgti_cont.44868
bgti_else.44885:
	addi	%a1, %a1, -10
bgti_cont.44886:
	j	bgti_cont.44868
bgti_else.44883:
bgti_cont.44884:
	j	bgti_cont.44868
bgti_else.44881:
	addi	%a1, %a1, -30
bgti_cont.44882:
	j	bgti_cont.44868
bgti_else.44879:
	addi	%a1, %a1, -20
bgti_cont.44880:
	j	bgti_cont.44868
bgti_else.44877:
	addi	%a1, %a1, -10
bgti_cont.44878:
	j	bgti_cont.44868
bgti_else.44875:
bgti_cont.44876:
	j	bgti_cont.44868
bgti_else.44873:
	addi	%a1, %a1, -30
bgti_cont.44874:
	j	bgti_cont.44868
bgti_else.44871:
	addi	%a1, %a1, -20
bgti_cont.44872:
	j	bgti_cont.44868
bgti_else.44869:
	addi	%a1, %a1, -10
bgti_cont.44870:
	j	bgti_cont.44868
bgti_else.44867:
bgti_cont.44868:
	blt	%zero, %a2, bgt_else.44899
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44900
bgt_else.44899:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44901
	blti	%a2, 20, bgti_else.44903
	blti	%a2, 30, bgti_else.44905
	blti	%a2, 40, bgti_else.44907
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44902
	blti	%a2, 20, bgti_else.44911
	blti	%a2, 30, bgti_else.44913
	blti	%a2, 40, bgti_else.44915
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44902
	blti	%a2, 20, bgti_else.44919
	blti	%a2, 30, bgti_else.44921
	blti	%a2, 40, bgti_else.44923
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44902
	blti	%a2, 20, bgti_else.44927
	blti	%a2, 30, bgti_else.44929
	blti	%a2, 40, bgti_else.44931
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44902
bgti_else.44931:
	addi	%a2, %a2, -30
bgti_cont.44932:
	j	bgti_cont.44902
bgti_else.44929:
	addi	%a2, %a2, -20
bgti_cont.44930:
	j	bgti_cont.44902
bgti_else.44927:
	addi	%a2, %a2, -10
bgti_cont.44928:
	j	bgti_cont.44902
bgti_else.44925:
bgti_cont.44926:
	j	bgti_cont.44902
bgti_else.44923:
	addi	%a2, %a2, -30
bgti_cont.44924:
	j	bgti_cont.44902
bgti_else.44921:
	addi	%a2, %a2, -20
bgti_cont.44922:
	j	bgti_cont.44902
bgti_else.44919:
	addi	%a2, %a2, -10
bgti_cont.44920:
	j	bgti_cont.44902
bgti_else.44917:
bgti_cont.44918:
	j	bgti_cont.44902
bgti_else.44915:
	addi	%a2, %a2, -30
bgti_cont.44916:
	j	bgti_cont.44902
bgti_else.44913:
	addi	%a2, %a2, -20
bgti_cont.44914:
	j	bgti_cont.44902
bgti_else.44911:
	addi	%a2, %a2, -10
bgti_cont.44912:
	j	bgti_cont.44902
bgti_else.44909:
bgti_cont.44910:
	j	bgti_cont.44902
bgti_else.44907:
	addi	%a2, %a2, -30
bgti_cont.44908:
	j	bgti_cont.44902
bgti_else.44905:
	addi	%a2, %a2, -20
bgti_cont.44906:
	j	bgti_cont.44902
bgti_else.44903:
	addi	%a2, %a2, -10
bgti_cont.44904:
	j	bgti_cont.44902
bgti_else.44901:
bgti_cont.44902:
	blt	%zero, %a0, bgt_else.44933
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44934
bgt_else.44933:
	blti	%a0, 10, bgti_else.44935
	blti	%a0, 20, bgti_else.44937
	blti	%a0, 30, bgti_else.44939
	blti	%a0, 40, bgti_else.44941
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44936
	blti	%a0, 20, bgti_else.44945
	blti	%a0, 30, bgti_else.44947
	blti	%a0, 40, bgti_else.44949
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44936
	blti	%a0, 20, bgti_else.44953
	blti	%a0, 30, bgti_else.44955
	blti	%a0, 40, bgti_else.44957
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44936
	blti	%a0, 20, bgti_else.44961
	blti	%a0, 30, bgti_else.44963
	blti	%a0, 40, bgti_else.44965
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44936
bgti_else.44965:
	addi	%a0, %a0, -30
bgti_cont.44966:
	j	bgti_cont.44936
bgti_else.44963:
	addi	%a0, %a0, -20
bgti_cont.44964:
	j	bgti_cont.44936
bgti_else.44961:
	addi	%a0, %a0, -10
bgti_cont.44962:
	j	bgti_cont.44936
bgti_else.44959:
bgti_cont.44960:
	j	bgti_cont.44936
bgti_else.44957:
	addi	%a0, %a0, -30
bgti_cont.44958:
	j	bgti_cont.44936
bgti_else.44955:
	addi	%a0, %a0, -20
bgti_cont.44956:
	j	bgti_cont.44936
bgti_else.44953:
	addi	%a0, %a0, -10
bgti_cont.44954:
	j	bgti_cont.44936
bgti_else.44951:
bgti_cont.44952:
	j	bgti_cont.44936
bgti_else.44949:
	addi	%a0, %a0, -30
bgti_cont.44950:
	j	bgti_cont.44936
bgti_else.44947:
	addi	%a0, %a0, -20
bgti_cont.44948:
	j	bgti_cont.44936
bgti_else.44945:
	addi	%a0, %a0, -10
bgti_cont.44946:
	j	bgti_cont.44936
bgti_else.44943:
bgti_cont.44944:
	j	bgti_cont.44936
bgti_else.44941:
	addi	%a0, %a0, -30
bgti_cont.44942:
	j	bgti_cont.44936
bgti_else.44939:
	addi	%a0, %a0, -20
bgti_cont.44940:
	j	bgti_cont.44936
bgti_else.44937:
	addi	%a0, %a0, -10
bgti_cont.44938:
	j	bgti_cont.44936
bgti_else.44935:
bgti_cont.44936:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44934:
bgt_cont.44900:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%a0, 0(%sp)
	addi	%t3, %a0, 1
	blt	%t3, %t0, bgt_else.44967
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.44967:
	lw	%a0, 3(%sp)
	add	%at, %a0, %t3
	lw	%v0, 0(%at)
	lw	%a0, 0(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 12(%sp)
	lw	%a0, 13(%sp)
	blt	%a0, %a1, bgt_else.44969
	add	%a0, %zero, %zero
	j	bgt_cont.44970
bgt_else.44969:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.44971
	add	%a0, %zero, %zero
	j	bgt_cont.44972
bgt_else.44971:
	addi	%a0, %t3, 1
	blt	%a0, %t0, bgt_else.44973
	add	%a0, %zero, %zero
	j	bgt_cont.44974
bgt_else.44973:
	blt	%zero, %t3, bgt_else.44975
	add	%a0, %zero, %zero
	j	bgt_cont.44976
bgt_else.44975:
	add	%a0, %zero, %k1
bgt_cont.44976:
bgt_cont.44974:
bgt_cont.44972:
bgt_cont.44970:
	beqi	%a0, 0, bnei_else.44977
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -14
	j	bnei_cont.44978
bnei_else.44977:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
bnei_cont.44978:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44979
	blti	%a1, 0, bgti_else.44981
	j	bgt_cont.44980
bgti_else.44981:
	add	%a1, %zero, %zero
bgti_cont.44982:
	j	bgt_cont.44980
bgt_else.44979:
	addi	%a1, %zero, 255
bgt_cont.44980:
	blti	%a1, 10, bgti_else.44983
	blti	%a1, 20, bgti_else.44985
	blti	%a1, 30, bgti_else.44987
	blti	%a1, 40, bgti_else.44989
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44991
	blti	%a0, 20, bgti_else.44993
	blti	%a0, 30, bgti_else.44995
	blti	%a0, 40, bgti_else.44997
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44999
	blti	%a0, 20, bgti_else.45001
	blti	%a0, 30, bgti_else.45003
	blti	%a0, 40, bgti_else.45005
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44984
bgti_else.45005:
	addi	%a2, %zero, 11
bgti_cont.45006:
	j	bgti_cont.44984
bgti_else.45003:
	addi	%a2, %zero, 10
bgti_cont.45004:
	j	bgti_cont.44984
bgti_else.45001:
	addi	%a2, %zero, 9
bgti_cont.45002:
	j	bgti_cont.44984
bgti_else.44999:
	addi	%a2, %zero, 8
bgti_cont.45000:
	j	bgti_cont.44984
bgti_else.44997:
	addi	%a2, %zero, 7
bgti_cont.44998:
	j	bgti_cont.44984
bgti_else.44995:
	addi	%a2, %zero, 6
bgti_cont.44996:
	j	bgti_cont.44984
bgti_else.44993:
	addi	%a2, %zero, 5
bgti_cont.44994:
	j	bgti_cont.44984
bgti_else.44991:
	addi	%a2, %zero, 4
bgti_cont.44992:
	j	bgti_cont.44984
bgti_else.44989:
	addi	%a2, %zero, 3
bgti_cont.44990:
	j	bgti_cont.44984
bgti_else.44987:
	addi	%a2, %zero, 2
bgti_cont.44988:
	j	bgti_cont.44984
bgti_else.44985:
	add	%a2, %zero, %k1
bgti_cont.44986:
	j	bgti_cont.44984
bgti_else.44983:
	add	%a2, %zero, %zero
bgti_cont.44984:
	blti	%a1, 10, bgti_else.45007
	blti	%a1, 20, bgti_else.45009
	blti	%a1, 30, bgti_else.45011
	blti	%a1, 40, bgti_else.45013
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45008
	blti	%a1, 20, bgti_else.45017
	blti	%a1, 30, bgti_else.45019
	blti	%a1, 40, bgti_else.45021
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45008
	blti	%a1, 20, bgti_else.45025
	blti	%a1, 30, bgti_else.45027
	blti	%a1, 40, bgti_else.45029
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.45008
bgti_else.45029:
	addi	%a1, %a1, -30
bgti_cont.45030:
	j	bgti_cont.45008
bgti_else.45027:
	addi	%a1, %a1, -20
bgti_cont.45028:
	j	bgti_cont.45008
bgti_else.45025:
	addi	%a1, %a1, -10
bgti_cont.45026:
	j	bgti_cont.45008
bgti_else.45023:
bgti_cont.45024:
	j	bgti_cont.45008
bgti_else.45021:
	addi	%a1, %a1, -30
bgti_cont.45022:
	j	bgti_cont.45008
bgti_else.45019:
	addi	%a1, %a1, -20
bgti_cont.45020:
	j	bgti_cont.45008
bgti_else.45017:
	addi	%a1, %a1, -10
bgti_cont.45018:
	j	bgti_cont.45008
bgti_else.45015:
bgti_cont.45016:
	j	bgti_cont.45008
bgti_else.45013:
	addi	%a1, %a1, -30
bgti_cont.45014:
	j	bgti_cont.45008
bgti_else.45011:
	addi	%a1, %a1, -20
bgti_cont.45012:
	j	bgti_cont.45008
bgti_else.45009:
	addi	%a1, %a1, -10
bgti_cont.45010:
	j	bgti_cont.45008
bgti_else.45007:
bgti_cont.45008:
	blt	%zero, %a2, bgt_else.45031
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45032
bgt_else.45031:
	blti	%a2, 10, bgti_else.45033
	blti	%a2, 20, bgti_else.45035
	blti	%a2, 30, bgti_else.45037
	blti	%a2, 40, bgti_else.45039
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45041
	blti	%a0, 20, bgti_else.45043
	blti	%a0, 30, bgti_else.45045
	blti	%a0, 40, bgti_else.45047
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45049
	blti	%a0, 20, bgti_else.45051
	blti	%a0, 30, bgti_else.45053
	blti	%a0, 40, bgti_else.45055
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45034
bgti_else.45055:
	addi	%a0, %zero, 11
bgti_cont.45056:
	j	bgti_cont.45034
bgti_else.45053:
	addi	%a0, %zero, 10
bgti_cont.45054:
	j	bgti_cont.45034
bgti_else.45051:
	addi	%a0, %zero, 9
bgti_cont.45052:
	j	bgti_cont.45034
bgti_else.45049:
	addi	%a0, %zero, 8
bgti_cont.45050:
	j	bgti_cont.45034
bgti_else.45047:
	addi	%a0, %zero, 7
bgti_cont.45048:
	j	bgti_cont.45034
bgti_else.45045:
	addi	%a0, %zero, 6
bgti_cont.45046:
	j	bgti_cont.45034
bgti_else.45043:
	addi	%a0, %zero, 5
bgti_cont.45044:
	j	bgti_cont.45034
bgti_else.45041:
	addi	%a0, %zero, 4
bgti_cont.45042:
	j	bgti_cont.45034
bgti_else.45039:
	addi	%a0, %zero, 3
bgti_cont.45040:
	j	bgti_cont.45034
bgti_else.45037:
	addi	%a0, %zero, 2
bgti_cont.45038:
	j	bgti_cont.45034
bgti_else.45035:
	add	%a0, %zero, %k1
bgti_cont.45036:
	j	bgti_cont.45034
bgti_else.45033:
	add	%a0, %zero, %zero
bgti_cont.45034:
	blti	%a2, 10, bgti_else.45057
	blti	%a2, 20, bgti_else.45059
	blti	%a2, 30, bgti_else.45061
	blti	%a2, 40, bgti_else.45063
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45058
	blti	%a2, 20, bgti_else.45067
	blti	%a2, 30, bgti_else.45069
	blti	%a2, 40, bgti_else.45071
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45058
	blti	%a2, 20, bgti_else.45075
	blti	%a2, 30, bgti_else.45077
	blti	%a2, 40, bgti_else.45079
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45058
bgti_else.45079:
	addi	%a2, %a2, -30
bgti_cont.45080:
	j	bgti_cont.45058
bgti_else.45077:
	addi	%a2, %a2, -20
bgti_cont.45078:
	j	bgti_cont.45058
bgti_else.45075:
	addi	%a2, %a2, -10
bgti_cont.45076:
	j	bgti_cont.45058
bgti_else.45073:
bgti_cont.45074:
	j	bgti_cont.45058
bgti_else.45071:
	addi	%a2, %a2, -30
bgti_cont.45072:
	j	bgti_cont.45058
bgti_else.45069:
	addi	%a2, %a2, -20
bgti_cont.45070:
	j	bgti_cont.45058
bgti_else.45067:
	addi	%a2, %a2, -10
bgti_cont.45068:
	j	bgti_cont.45058
bgti_else.45065:
bgti_cont.45066:
	j	bgti_cont.45058
bgti_else.45063:
	addi	%a2, %a2, -30
bgti_cont.45064:
	j	bgti_cont.45058
bgti_else.45061:
	addi	%a2, %a2, -20
bgti_cont.45062:
	j	bgti_cont.45058
bgti_else.45059:
	addi	%a2, %a2, -10
bgti_cont.45060:
	j	bgti_cont.45058
bgti_else.45057:
bgti_cont.45058:
	blt	%zero, %a0, bgt_else.45081
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45082
bgt_else.45081:
	blti	%a0, 10, bgti_else.45083
	blti	%a0, 20, bgti_else.45085
	blti	%a0, 30, bgti_else.45087
	blti	%a0, 40, bgti_else.45089
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45084
	blti	%a0, 20, bgti_else.45093
	blti	%a0, 30, bgti_else.45095
	blti	%a0, 40, bgti_else.45097
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45084
	blti	%a0, 20, bgti_else.45101
	blti	%a0, 30, bgti_else.45103
	blti	%a0, 40, bgti_else.45105
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45084
bgti_else.45105:
	addi	%a0, %a0, -30
bgti_cont.45106:
	j	bgti_cont.45084
bgti_else.45103:
	addi	%a0, %a0, -20
bgti_cont.45104:
	j	bgti_cont.45084
bgti_else.45101:
	addi	%a0, %a0, -10
bgti_cont.45102:
	j	bgti_cont.45084
bgti_else.45099:
bgti_cont.45100:
	j	bgti_cont.45084
bgti_else.45097:
	addi	%a0, %a0, -30
bgti_cont.45098:
	j	bgti_cont.45084
bgti_else.45095:
	addi	%a0, %a0, -20
bgti_cont.45096:
	j	bgti_cont.45084
bgti_else.45093:
	addi	%a0, %a0, -10
bgti_cont.45094:
	j	bgti_cont.45084
bgti_else.45091:
bgti_cont.45092:
	j	bgti_cont.45084
bgti_else.45089:
	addi	%a0, %a0, -30
bgti_cont.45090:
	j	bgti_cont.45084
bgti_else.45087:
	addi	%a0, %a0, -20
bgti_cont.45088:
	j	bgti_cont.45084
bgti_else.45085:
	addi	%a0, %a0, -10
bgti_cont.45086:
	j	bgti_cont.45084
bgti_else.45083:
bgti_cont.45084:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.45082:
bgt_cont.45032:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45107
	blti	%a1, 0, bgti_else.45109
	j	bgt_cont.45108
bgti_else.45109:
	add	%a1, %zero, %zero
bgti_cont.45110:
	j	bgt_cont.45108
bgt_else.45107:
	addi	%a1, %zero, 255
bgt_cont.45108:
	blti	%a1, 10, bgti_else.45111
	blti	%a1, 20, bgti_else.45113
	blti	%a1, 30, bgti_else.45115
	blti	%a1, 40, bgti_else.45117
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.45119
	blti	%a0, 20, bgti_else.45121
	blti	%a0, 30, bgti_else.45123
	blti	%a0, 40, bgti_else.45125
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45127
	blti	%a0, 20, bgti_else.45129
	blti	%a0, 30, bgti_else.45131
	blti	%a0, 40, bgti_else.45133
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45112
bgti_else.45133:
	addi	%a2, %zero, 11
bgti_cont.45134:
	j	bgti_cont.45112
bgti_else.45131:
	addi	%a2, %zero, 10
bgti_cont.45132:
	j	bgti_cont.45112
bgti_else.45129:
	addi	%a2, %zero, 9
bgti_cont.45130:
	j	bgti_cont.45112
bgti_else.45127:
	addi	%a2, %zero, 8
bgti_cont.45128:
	j	bgti_cont.45112
bgti_else.45125:
	addi	%a2, %zero, 7
bgti_cont.45126:
	j	bgti_cont.45112
bgti_else.45123:
	addi	%a2, %zero, 6
bgti_cont.45124:
	j	bgti_cont.45112
bgti_else.45121:
	addi	%a2, %zero, 5
bgti_cont.45122:
	j	bgti_cont.45112
bgti_else.45119:
	addi	%a2, %zero, 4
bgti_cont.45120:
	j	bgti_cont.45112
bgti_else.45117:
	addi	%a2, %zero, 3
bgti_cont.45118:
	j	bgti_cont.45112
bgti_else.45115:
	addi	%a2, %zero, 2
bgti_cont.45116:
	j	bgti_cont.45112
bgti_else.45113:
	add	%a2, %zero, %k1
bgti_cont.45114:
	j	bgti_cont.45112
bgti_else.45111:
	add	%a2, %zero, %zero
bgti_cont.45112:
	blti	%a1, 10, bgti_else.45135
	blti	%a1, 20, bgti_else.45137
	blti	%a1, 30, bgti_else.45139
	blti	%a1, 40, bgti_else.45141
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45136
	blti	%a1, 20, bgti_else.45145
	blti	%a1, 30, bgti_else.45147
	blti	%a1, 40, bgti_else.45149
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45136
	blti	%a1, 20, bgti_else.45153
	blti	%a1, 30, bgti_else.45155
	blti	%a1, 40, bgti_else.45157
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.45136
bgti_else.45157:
	addi	%a1, %a1, -30
bgti_cont.45158:
	j	bgti_cont.45136
bgti_else.45155:
	addi	%a1, %a1, -20
bgti_cont.45156:
	j	bgti_cont.45136
bgti_else.45153:
	addi	%a1, %a1, -10
bgti_cont.45154:
	j	bgti_cont.45136
bgti_else.45151:
bgti_cont.45152:
	j	bgti_cont.45136
bgti_else.45149:
	addi	%a1, %a1, -30
bgti_cont.45150:
	j	bgti_cont.45136
bgti_else.45147:
	addi	%a1, %a1, -20
bgti_cont.45148:
	j	bgti_cont.45136
bgti_else.45145:
	addi	%a1, %a1, -10
bgti_cont.45146:
	j	bgti_cont.45136
bgti_else.45143:
bgti_cont.45144:
	j	bgti_cont.45136
bgti_else.45141:
	addi	%a1, %a1, -30
bgti_cont.45142:
	j	bgti_cont.45136
bgti_else.45139:
	addi	%a1, %a1, -20
bgti_cont.45140:
	j	bgti_cont.45136
bgti_else.45137:
	addi	%a1, %a1, -10
bgti_cont.45138:
	j	bgti_cont.45136
bgti_else.45135:
bgti_cont.45136:
	blt	%zero, %a2, bgt_else.45159
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45160
bgt_else.45159:
	blti	%a2, 10, bgti_else.45161
	blti	%a2, 20, bgti_else.45163
	blti	%a2, 30, bgti_else.45165
	blti	%a2, 40, bgti_else.45167
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45169
	blti	%a0, 20, bgti_else.45171
	blti	%a0, 30, bgti_else.45173
	blti	%a0, 40, bgti_else.45175
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45177
	blti	%a0, 20, bgti_else.45179
	blti	%a0, 30, bgti_else.45181
	blti	%a0, 40, bgti_else.45183
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45162
bgti_else.45183:
	addi	%a0, %zero, 11
bgti_cont.45184:
	j	bgti_cont.45162
bgti_else.45181:
	addi	%a0, %zero, 10
bgti_cont.45182:
	j	bgti_cont.45162
bgti_else.45179:
	addi	%a0, %zero, 9
bgti_cont.45180:
	j	bgti_cont.45162
bgti_else.45177:
	addi	%a0, %zero, 8
bgti_cont.45178:
	j	bgti_cont.45162
bgti_else.45175:
	addi	%a0, %zero, 7
bgti_cont.45176:
	j	bgti_cont.45162
bgti_else.45173:
	addi	%a0, %zero, 6
bgti_cont.45174:
	j	bgti_cont.45162
bgti_else.45171:
	addi	%a0, %zero, 5
bgti_cont.45172:
	j	bgti_cont.45162
bgti_else.45169:
	addi	%a0, %zero, 4
bgti_cont.45170:
	j	bgti_cont.45162
bgti_else.45167:
	addi	%a0, %zero, 3
bgti_cont.45168:
	j	bgti_cont.45162
bgti_else.45165:
	addi	%a0, %zero, 2
bgti_cont.45166:
	j	bgti_cont.45162
bgti_else.45163:
	add	%a0, %zero, %k1
bgti_cont.45164:
	j	bgti_cont.45162
bgti_else.45161:
	add	%a0, %zero, %zero
bgti_cont.45162:
	blti	%a2, 10, bgti_else.45185
	blti	%a2, 20, bgti_else.45187
	blti	%a2, 30, bgti_else.45189
	blti	%a2, 40, bgti_else.45191
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45186
	blti	%a2, 20, bgti_else.45195
	blti	%a2, 30, bgti_else.45197
	blti	%a2, 40, bgti_else.45199
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45186
	blti	%a2, 20, bgti_else.45203
	blti	%a2, 30, bgti_else.45205
	blti	%a2, 40, bgti_else.45207
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45186
bgti_else.45207:
	addi	%a2, %a2, -30
bgti_cont.45208:
	j	bgti_cont.45186
bgti_else.45205:
	addi	%a2, %a2, -20
bgti_cont.45206:
	j	bgti_cont.45186
bgti_else.45203:
	addi	%a2, %a2, -10
bgti_cont.45204:
	j	bgti_cont.45186
bgti_else.45201:
bgti_cont.45202:
	j	bgti_cont.45186
bgti_else.45199:
	addi	%a2, %a2, -30
bgti_cont.45200:
	j	bgti_cont.45186
bgti_else.45197:
	addi	%a2, %a2, -20
bgti_cont.45198:
	j	bgti_cont.45186
bgti_else.45195:
	addi	%a2, %a2, -10
bgti_cont.45196:
	j	bgti_cont.45186
bgti_else.45193:
bgti_cont.45194:
	j	bgti_cont.45186
bgti_else.45191:
	addi	%a2, %a2, -30
bgti_cont.45192:
	j	bgti_cont.45186
bgti_else.45189:
	addi	%a2, %a2, -20
bgti_cont.45190:
	j	bgti_cont.45186
bgti_else.45187:
	addi	%a2, %a2, -10
bgti_cont.45188:
	j	bgti_cont.45186
bgti_else.45185:
bgti_cont.45186:
	blt	%zero, %a0, bgt_else.45209
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45210
bgt_else.45209:
	blti	%a0, 10, bgti_else.45211
	blti	%a0, 20, bgti_else.45213
	blti	%a0, 30, bgti_else.45215
	blti	%a0, 40, bgti_else.45217
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45212
	blti	%a0, 20, bgti_else.45221
	blti	%a0, 30, bgti_else.45223
	blti	%a0, 40, bgti_else.45225
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45212
	blti	%a0, 20, bgti_else.45229
	blti	%a0, 30, bgti_else.45231
	blti	%a0, 40, bgti_else.45233
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45212
bgti_else.45233:
	addi	%a0, %a0, -30
bgti_cont.45234:
	j	bgti_cont.45212
bgti_else.45231:
	addi	%a0, %a0, -20
bgti_cont.45232:
	j	bgti_cont.45212
bgti_else.45229:
	addi	%a0, %a0, -10
bgti_cont.45230:
	j	bgti_cont.45212
bgti_else.45227:
bgti_cont.45228:
	j	bgti_cont.45212
bgti_else.45225:
	addi	%a0, %a0, -30
bgti_cont.45226:
	j	bgti_cont.45212
bgti_else.45223:
	addi	%a0, %a0, -20
bgti_cont.45224:
	j	bgti_cont.45212
bgti_else.45221:
	addi	%a0, %a0, -10
bgti_cont.45222:
	j	bgti_cont.45212
bgti_else.45219:
bgti_cont.45220:
	j	bgti_cont.45212
bgti_else.45217:
	addi	%a0, %a0, -30
bgti_cont.45218:
	j	bgti_cont.45212
bgti_else.45215:
	addi	%a0, %a0, -20
bgti_cont.45216:
	j	bgti_cont.45212
bgti_else.45213:
	addi	%a0, %a0, -10
bgti_cont.45214:
	j	bgti_cont.45212
bgti_else.45211:
bgti_cont.45212:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.45210:
bgt_cont.45160:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45235
	blti	%a1, 0, bgti_else.45237
	j	bgt_cont.45236
bgti_else.45237:
	add	%a1, %zero, %zero
bgti_cont.45238:
	j	bgt_cont.45236
bgt_else.45235:
	addi	%a1, %zero, 255
bgt_cont.45236:
	blti	%a1, 10, bgti_else.45239
	blti	%a1, 20, bgti_else.45241
	blti	%a1, 30, bgti_else.45243
	blti	%a1, 40, bgti_else.45245
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.45247
	blti	%a0, 20, bgti_else.45249
	blti	%a0, 30, bgti_else.45251
	blti	%a0, 40, bgti_else.45253
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45255
	blti	%a0, 20, bgti_else.45257
	blti	%a0, 30, bgti_else.45259
	blti	%a0, 40, bgti_else.45261
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45240
bgti_else.45261:
	addi	%a2, %zero, 11
bgti_cont.45262:
	j	bgti_cont.45240
bgti_else.45259:
	addi	%a2, %zero, 10
bgti_cont.45260:
	j	bgti_cont.45240
bgti_else.45257:
	addi	%a2, %zero, 9
bgti_cont.45258:
	j	bgti_cont.45240
bgti_else.45255:
	addi	%a2, %zero, 8
bgti_cont.45256:
	j	bgti_cont.45240
bgti_else.45253:
	addi	%a2, %zero, 7
bgti_cont.45254:
	j	bgti_cont.45240
bgti_else.45251:
	addi	%a2, %zero, 6
bgti_cont.45252:
	j	bgti_cont.45240
bgti_else.45249:
	addi	%a2, %zero, 5
bgti_cont.45250:
	j	bgti_cont.45240
bgti_else.45247:
	addi	%a2, %zero, 4
bgti_cont.45248:
	j	bgti_cont.45240
bgti_else.45245:
	addi	%a2, %zero, 3
bgti_cont.45246:
	j	bgti_cont.45240
bgti_else.45243:
	addi	%a2, %zero, 2
bgti_cont.45244:
	j	bgti_cont.45240
bgti_else.45241:
	add	%a2, %zero, %k1
bgti_cont.45242:
	j	bgti_cont.45240
bgti_else.45239:
	add	%a2, %zero, %zero
bgti_cont.45240:
	blti	%a1, 10, bgti_else.45263
	blti	%a1, 20, bgti_else.45265
	blti	%a1, 30, bgti_else.45267
	blti	%a1, 40, bgti_else.45269
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45264
	blti	%a1, 20, bgti_else.45273
	blti	%a1, 30, bgti_else.45275
	blti	%a1, 40, bgti_else.45277
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45264
	blti	%a1, 20, bgti_else.45281
	blti	%a1, 30, bgti_else.45283
	blti	%a1, 40, bgti_else.45285
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.45264
bgti_else.45285:
	addi	%a1, %a1, -30
bgti_cont.45286:
	j	bgti_cont.45264
bgti_else.45283:
	addi	%a1, %a1, -20
bgti_cont.45284:
	j	bgti_cont.45264
bgti_else.45281:
	addi	%a1, %a1, -10
bgti_cont.45282:
	j	bgti_cont.45264
bgti_else.45279:
bgti_cont.45280:
	j	bgti_cont.45264
bgti_else.45277:
	addi	%a1, %a1, -30
bgti_cont.45278:
	j	bgti_cont.45264
bgti_else.45275:
	addi	%a1, %a1, -20
bgti_cont.45276:
	j	bgti_cont.45264
bgti_else.45273:
	addi	%a1, %a1, -10
bgti_cont.45274:
	j	bgti_cont.45264
bgti_else.45271:
bgti_cont.45272:
	j	bgti_cont.45264
bgti_else.45269:
	addi	%a1, %a1, -30
bgti_cont.45270:
	j	bgti_cont.45264
bgti_else.45267:
	addi	%a1, %a1, -20
bgti_cont.45268:
	j	bgti_cont.45264
bgti_else.45265:
	addi	%a1, %a1, -10
bgti_cont.45266:
	j	bgti_cont.45264
bgti_else.45263:
bgti_cont.45264:
	blt	%zero, %a2, bgt_else.45287
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45288
bgt_else.45287:
	blti	%a2, 10, bgti_else.45289
	blti	%a2, 20, bgti_else.45291
	blti	%a2, 30, bgti_else.45293
	blti	%a2, 40, bgti_else.45295
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45297
	blti	%a0, 20, bgti_else.45299
	blti	%a0, 30, bgti_else.45301
	blti	%a0, 40, bgti_else.45303
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45305
	blti	%a0, 20, bgti_else.45307
	blti	%a0, 30, bgti_else.45309
	blti	%a0, 40, bgti_else.45311
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45290
bgti_else.45311:
	addi	%a0, %zero, 11
bgti_cont.45312:
	j	bgti_cont.45290
bgti_else.45309:
	addi	%a0, %zero, 10
bgti_cont.45310:
	j	bgti_cont.45290
bgti_else.45307:
	addi	%a0, %zero, 9
bgti_cont.45308:
	j	bgti_cont.45290
bgti_else.45305:
	addi	%a0, %zero, 8
bgti_cont.45306:
	j	bgti_cont.45290
bgti_else.45303:
	addi	%a0, %zero, 7
bgti_cont.45304:
	j	bgti_cont.45290
bgti_else.45301:
	addi	%a0, %zero, 6
bgti_cont.45302:
	j	bgti_cont.45290
bgti_else.45299:
	addi	%a0, %zero, 5
bgti_cont.45300:
	j	bgti_cont.45290
bgti_else.45297:
	addi	%a0, %zero, 4
bgti_cont.45298:
	j	bgti_cont.45290
bgti_else.45295:
	addi	%a0, %zero, 3
bgti_cont.45296:
	j	bgti_cont.45290
bgti_else.45293:
	addi	%a0, %zero, 2
bgti_cont.45294:
	j	bgti_cont.45290
bgti_else.45291:
	add	%a0, %zero, %k1
bgti_cont.45292:
	j	bgti_cont.45290
bgti_else.45289:
	add	%a0, %zero, %zero
bgti_cont.45290:
	blti	%a2, 10, bgti_else.45313
	blti	%a2, 20, bgti_else.45315
	blti	%a2, 30, bgti_else.45317
	blti	%a2, 40, bgti_else.45319
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45314
	blti	%a2, 20, bgti_else.45323
	blti	%a2, 30, bgti_else.45325
	blti	%a2, 40, bgti_else.45327
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45314
	blti	%a2, 20, bgti_else.45331
	blti	%a2, 30, bgti_else.45333
	blti	%a2, 40, bgti_else.45335
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45314
bgti_else.45335:
	addi	%a2, %a2, -30
bgti_cont.45336:
	j	bgti_cont.45314
bgti_else.45333:
	addi	%a2, %a2, -20
bgti_cont.45334:
	j	bgti_cont.45314
bgti_else.45331:
	addi	%a2, %a2, -10
bgti_cont.45332:
	j	bgti_cont.45314
bgti_else.45329:
bgti_cont.45330:
	j	bgti_cont.45314
bgti_else.45327:
	addi	%a2, %a2, -30
bgti_cont.45328:
	j	bgti_cont.45314
bgti_else.45325:
	addi	%a2, %a2, -20
bgti_cont.45326:
	j	bgti_cont.45314
bgti_else.45323:
	addi	%a2, %a2, -10
bgti_cont.45324:
	j	bgti_cont.45314
bgti_else.45321:
bgti_cont.45322:
	j	bgti_cont.45314
bgti_else.45319:
	addi	%a2, %a2, -30
bgti_cont.45320:
	j	bgti_cont.45314
bgti_else.45317:
	addi	%a2, %a2, -20
bgti_cont.45318:
	j	bgti_cont.45314
bgti_else.45315:
	addi	%a2, %a2, -10
bgti_cont.45316:
	j	bgti_cont.45314
bgti_else.45313:
bgti_cont.45314:
	blt	%zero, %a0, bgt_else.45337
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45338
bgt_else.45337:
	blti	%a0, 10, bgti_else.45339
	blti	%a0, 20, bgti_else.45341
	blti	%a0, 30, bgti_else.45343
	blti	%a0, 40, bgti_else.45345
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45340
	blti	%a0, 20, bgti_else.45349
	blti	%a0, 30, bgti_else.45351
	blti	%a0, 40, bgti_else.45353
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45340
	blti	%a0, 20, bgti_else.45357
	blti	%a0, 30, bgti_else.45359
	blti	%a0, 40, bgti_else.45361
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45340
bgti_else.45361:
	addi	%a0, %a0, -30
bgti_cont.45362:
	j	bgti_cont.45340
bgti_else.45359:
	addi	%a0, %a0, -20
bgti_cont.45360:
	j	bgti_cont.45340
bgti_else.45357:
	addi	%a0, %a0, -10
bgti_cont.45358:
	j	bgti_cont.45340
bgti_else.45355:
bgti_cont.45356:
	j	bgti_cont.45340
bgti_else.45353:
	addi	%a0, %a0, -30
bgti_cont.45354:
	j	bgti_cont.45340
bgti_else.45351:
	addi	%a0, %a0, -20
bgti_cont.45352:
	j	bgti_cont.45340
bgti_else.45349:
	addi	%a0, %a0, -10
bgti_cont.45350:
	j	bgti_cont.45340
bgti_else.45347:
bgti_cont.45348:
	j	bgti_cont.45340
bgti_else.45345:
	addi	%a0, %a0, -30
bgti_cont.45346:
	j	bgti_cont.45340
bgti_else.45343:
	addi	%a0, %a0, -20
bgti_cont.45344:
	j	bgti_cont.45340
bgti_else.45341:
	addi	%a0, %a0, -10
bgti_cont.45342:
	j	bgti_cont.45340
bgti_else.45339:
bgti_cont.45340:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.45338:
bgt_cont.45288:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %t3, 1
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	scan_pixel.3057
scan_line.3063:
	add	%a3, %zero, %v0
	sw	%a3, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	add	%v0, %zero, %a1
	sw	%v0, 3(%sp)
	add	%a0, %zero, %a2
	sw	%a0, 4(%sp)
	sw	%t3, 5(%sp)
	sw	%t2, 6(%sp)
	sw	%t1, 7(%sp)
	add	%a1, %zero, %t0
	sw	%a1, 8(%sp)
	sw	%ra, 9(%sp)
	lw	%t0, 155(%zero)
	blt	%a3, %t0, bgt_else.46646
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.46646:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.46648
	j	bgt_cont.46649
bgt_else.46648:
	addi	%a2, %a3, 1
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%a1, %a2, %a1
	itof	%f0, %a1
	fmul	%f17, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f17, %f0
	flw	%f0, 171(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f16, %f17, %f1
	flw	%f1, 172(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 170(%zero)
	fmul	%f17, %f17, %f16
	flw	%f16, 173(%zero)
	fadd	%f2, %f17, %f16
	lw	%a1, 154(%zero)
	addi	%v1, %a1, -1
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -11
bgt_cont.46649:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.46650
	j	bgt_cont.46651
bgt_else.46650:
	lw	%a0, 2(%sp)
	lw	%v0, 0(%a0)
	lw	%a0, 0(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 0(%sp)
	addi	%a0, %a1, 1
	blt	%a0, %t0, bgt_else.46652
	j	bgt_cont.46653
bgt_else.46652:
	blt	%zero, %a1, bgt_else.46654
	j	bgt_cont.46655
bgt_else.46654:
	blt	%k1, %t1, bgt_else.46656
	j	bgt_cont.46657
bgt_else.46656:
bgt_cont.46657:
bgt_cont.46655:
bgt_cont.46653:
	beqi	%zero, 0, bnei_else.46658
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	j	bnei_cont.46659
bnei_else.46658:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
bnei_cont.46659:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.46660
	blti	%a1, 0, bgti_else.46662
	j	bgt_cont.46661
bgti_else.46662:
	add	%a1, %zero, %zero
bgti_cont.46663:
	j	bgt_cont.46661
bgt_else.46660:
	addi	%a1, %zero, 255
bgt_cont.46661:
	addi	%a3, %zero, 10
	blti	%a1, 10, bgti_else.46664
	blti	%a1, 20, bgti_else.46666
	blti	%a1, 30, bgti_else.46668
	blti	%a1, 40, bgti_else.46670
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.46672
	blti	%a0, 20, bgti_else.46674
	blti	%a0, 30, bgti_else.46676
	blti	%a0, 40, bgti_else.46678
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46680
	blti	%a0, 20, bgti_else.46682
	blti	%a0, 30, bgti_else.46684
	blti	%a0, 40, bgti_else.46686
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46665
bgti_else.46686:
	addi	%a2, %zero, 11
bgti_cont.46687:
	j	bgti_cont.46665
bgti_else.46684:
	addi	%a2, %zero, 10
bgti_cont.46685:
	j	bgti_cont.46665
bgti_else.46682:
	addi	%a2, %zero, 9
bgti_cont.46683:
	j	bgti_cont.46665
bgti_else.46680:
	addi	%a2, %zero, 8
bgti_cont.46681:
	j	bgti_cont.46665
bgti_else.46678:
	addi	%a2, %zero, 7
bgti_cont.46679:
	j	bgti_cont.46665
bgti_else.46676:
	addi	%a2, %zero, 6
bgti_cont.46677:
	j	bgti_cont.46665
bgti_else.46674:
	addi	%a2, %zero, 5
bgti_cont.46675:
	j	bgti_cont.46665
bgti_else.46672:
	addi	%a2, %zero, 4
bgti_cont.46673:
	j	bgti_cont.46665
bgti_else.46670:
	addi	%a2, %zero, 3
bgti_cont.46671:
	j	bgti_cont.46665
bgti_else.46668:
	addi	%a2, %zero, 2
bgti_cont.46669:
	j	bgti_cont.46665
bgti_else.46666:
	add	%a2, %zero, %k1
bgti_cont.46667:
	j	bgti_cont.46665
bgti_else.46664:
	add	%a2, %zero, %zero
bgti_cont.46665:
	blti	%a1, 10, bgti_else.46688
	blti	%a1, 20, bgti_else.46690
	blti	%a1, 30, bgti_else.46692
	blti	%a1, 40, bgti_else.46694
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46689
	blti	%a1, 20, bgti_else.46698
	blti	%a1, 30, bgti_else.46700
	blti	%a1, 40, bgti_else.46702
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46689
	blti	%a1, 20, bgti_else.46706
	blti	%a1, 30, bgti_else.46708
	blti	%a1, 40, bgti_else.46710
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.46689
bgti_else.46710:
	addi	%a1, %a1, -30
bgti_cont.46711:
	j	bgti_cont.46689
bgti_else.46708:
	addi	%a1, %a1, -20
bgti_cont.46709:
	j	bgti_cont.46689
bgti_else.46706:
	addi	%a1, %a1, -10
bgti_cont.46707:
	j	bgti_cont.46689
bgti_else.46704:
bgti_cont.46705:
	j	bgti_cont.46689
bgti_else.46702:
	addi	%a1, %a1, -30
bgti_cont.46703:
	j	bgti_cont.46689
bgti_else.46700:
	addi	%a1, %a1, -20
bgti_cont.46701:
	j	bgti_cont.46689
bgti_else.46698:
	addi	%a1, %a1, -10
bgti_cont.46699:
	j	bgti_cont.46689
bgti_else.46696:
bgti_cont.46697:
	j	bgti_cont.46689
bgti_else.46694:
	addi	%a1, %a1, -30
bgti_cont.46695:
	j	bgti_cont.46689
bgti_else.46692:
	addi	%a1, %a1, -20
bgti_cont.46693:
	j	bgti_cont.46689
bgti_else.46690:
	addi	%a1, %a1, -10
bgti_cont.46691:
	j	bgti_cont.46689
bgti_else.46688:
bgti_cont.46689:
	blt	%zero, %a2, bgt_else.46712
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46713
bgt_else.46712:
	blti	%a2, 10, bgti_else.46714
	blti	%a2, 20, bgti_else.46716
	blti	%a2, 30, bgti_else.46718
	blti	%a2, 40, bgti_else.46720
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46722
	blti	%a0, 20, bgti_else.46724
	blti	%a0, 30, bgti_else.46726
	blti	%a0, 40, bgti_else.46728
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46730
	blti	%a0, 20, bgti_else.46732
	blti	%a0, 30, bgti_else.46734
	blti	%a0, 40, bgti_else.46736
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46715
bgti_else.46736:
	addi	%a0, %zero, 11
bgti_cont.46737:
	j	bgti_cont.46715
bgti_else.46734:
	addi	%a0, %zero, 10
bgti_cont.46735:
	j	bgti_cont.46715
bgti_else.46732:
	addi	%a0, %zero, 9
bgti_cont.46733:
	j	bgti_cont.46715
bgti_else.46730:
	addi	%a0, %zero, 8
bgti_cont.46731:
	j	bgti_cont.46715
bgti_else.46728:
	addi	%a0, %zero, 7
bgti_cont.46729:
	j	bgti_cont.46715
bgti_else.46726:
	addi	%a0, %zero, 6
bgti_cont.46727:
	j	bgti_cont.46715
bgti_else.46724:
	addi	%a0, %zero, 5
bgti_cont.46725:
	j	bgti_cont.46715
bgti_else.46722:
	addi	%a0, %zero, 4
bgti_cont.46723:
	j	bgti_cont.46715
bgti_else.46720:
	addi	%a0, %zero, 3
bgti_cont.46721:
	j	bgti_cont.46715
bgti_else.46718:
	addi	%a0, %zero, 2
bgti_cont.46719:
	j	bgti_cont.46715
bgti_else.46716:
	add	%a0, %zero, %k1
bgti_cont.46717:
	j	bgti_cont.46715
bgti_else.46714:
	add	%a0, %zero, %zero
bgti_cont.46715:
	blti	%a2, 10, bgti_else.46738
	blti	%a2, 20, bgti_else.46740
	blti	%a2, 30, bgti_else.46742
	blti	%a2, 40, bgti_else.46744
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46739
	blti	%a2, 20, bgti_else.46748
	blti	%a2, 30, bgti_else.46750
	blti	%a2, 40, bgti_else.46752
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46739
	blti	%a2, 20, bgti_else.46756
	blti	%a2, 30, bgti_else.46758
	blti	%a2, 40, bgti_else.46760
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46739
bgti_else.46760:
	addi	%a2, %a2, -30
bgti_cont.46761:
	j	bgti_cont.46739
bgti_else.46758:
	addi	%a2, %a2, -20
bgti_cont.46759:
	j	bgti_cont.46739
bgti_else.46756:
	addi	%a2, %a2, -10
bgti_cont.46757:
	j	bgti_cont.46739
bgti_else.46754:
bgti_cont.46755:
	j	bgti_cont.46739
bgti_else.46752:
	addi	%a2, %a2, -30
bgti_cont.46753:
	j	bgti_cont.46739
bgti_else.46750:
	addi	%a2, %a2, -20
bgti_cont.46751:
	j	bgti_cont.46739
bgti_else.46748:
	addi	%a2, %a2, -10
bgti_cont.46749:
	j	bgti_cont.46739
bgti_else.46746:
bgti_cont.46747:
	j	bgti_cont.46739
bgti_else.46744:
	addi	%a2, %a2, -30
bgti_cont.46745:
	j	bgti_cont.46739
bgti_else.46742:
	addi	%a2, %a2, -20
bgti_cont.46743:
	j	bgti_cont.46739
bgti_else.46740:
	addi	%a2, %a2, -10
bgti_cont.46741:
	j	bgti_cont.46739
bgti_else.46738:
bgti_cont.46739:
	blt	%zero, %a0, bgt_else.46762
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46763
bgt_else.46762:
	blti	%a0, 10, bgti_else.46764
	blti	%a0, 20, bgti_else.46766
	blti	%a0, 30, bgti_else.46768
	blti	%a0, 40, bgti_else.46770
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46765
	blti	%a0, 20, bgti_else.46774
	blti	%a0, 30, bgti_else.46776
	blti	%a0, 40, bgti_else.46778
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46765
	blti	%a0, 20, bgti_else.46782
	blti	%a0, 30, bgti_else.46784
	blti	%a0, 40, bgti_else.46786
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46765
bgti_else.46786:
	addi	%a0, %a0, -30
bgti_cont.46787:
	j	bgti_cont.46765
bgti_else.46784:
	addi	%a0, %a0, -20
bgti_cont.46785:
	j	bgti_cont.46765
bgti_else.46782:
	addi	%a0, %a0, -10
bgti_cont.46783:
	j	bgti_cont.46765
bgti_else.46780:
bgti_cont.46781:
	j	bgti_cont.46765
bgti_else.46778:
	addi	%a0, %a0, -30
bgti_cont.46779:
	j	bgti_cont.46765
bgti_else.46776:
	addi	%a0, %a0, -20
bgti_cont.46777:
	j	bgti_cont.46765
bgti_else.46774:
	addi	%a0, %a0, -10
bgti_cont.46775:
	j	bgti_cont.46765
bgti_else.46772:
bgti_cont.46773:
	j	bgti_cont.46765
bgti_else.46770:
	addi	%a0, %a0, -30
bgti_cont.46771:
	j	bgti_cont.46765
bgti_else.46768:
	addi	%a0, %a0, -20
bgti_cont.46769:
	j	bgti_cont.46765
bgti_else.46766:
	addi	%a0, %a0, -10
bgti_cont.46767:
	j	bgti_cont.46765
bgti_else.46764:
bgti_cont.46765:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.46763:
bgt_cont.46713:
	addi	%a1, %zero, 32
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%a2, %f0
	addi	%at, %zero, 255
	blt	%at, %a2, bgt_else.46788
	blti	%a2, 0, bgti_else.46790
	j	bgt_cont.46789
bgti_else.46790:
	add	%a2, %zero, %zero
bgti_cont.46791:
	j	bgt_cont.46789
bgt_else.46788:
	addi	%a2, %zero, 255
bgt_cont.46789:
	blti	%a2, 10, bgti_else.46792
	blti	%a2, 20, bgti_else.46794
	blti	%a2, 30, bgti_else.46796
	blti	%a2, 40, bgti_else.46798
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46800
	blti	%a0, 20, bgti_else.46802
	blti	%a0, 30, bgti_else.46804
	blti	%a0, 40, bgti_else.46806
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46808
	blti	%a0, 20, bgti_else.46810
	blti	%a0, 30, bgti_else.46812
	blti	%a0, 40, bgti_else.46814
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0
	j	bgti_cont.46793
bgti_else.46814:
	addi	%k0, %zero, 11
bgti_cont.46815:
	j	bgti_cont.46793
bgti_else.46812:
	addi	%k0, %zero, 10
bgti_cont.46813:
	j	bgti_cont.46793
bgti_else.46810:
	addi	%k0, %zero, 9
bgti_cont.46811:
	j	bgti_cont.46793
bgti_else.46808:
	addi	%k0, %zero, 8
bgti_cont.46809:
	j	bgti_cont.46793
bgti_else.46806:
	addi	%k0, %zero, 7
bgti_cont.46807:
	j	bgti_cont.46793
bgti_else.46804:
	addi	%k0, %zero, 6
bgti_cont.46805:
	j	bgti_cont.46793
bgti_else.46802:
	addi	%k0, %zero, 5
bgti_cont.46803:
	j	bgti_cont.46793
bgti_else.46800:
	addi	%k0, %zero, 4
bgti_cont.46801:
	j	bgti_cont.46793
bgti_else.46798:
	addi	%k0, %zero, 3
bgti_cont.46799:
	j	bgti_cont.46793
bgti_else.46796:
	addi	%k0, %zero, 2
bgti_cont.46797:
	j	bgti_cont.46793
bgti_else.46794:
	add	%k0, %zero, %k1
bgti_cont.46795:
	j	bgti_cont.46793
bgti_else.46792:
	add	%k0, %zero, %zero
bgti_cont.46793:
	blti	%a2, 10, bgti_else.46816
	blti	%a2, 20, bgti_else.46818
	blti	%a2, 30, bgti_else.46820
	blti	%a2, 40, bgti_else.46822
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46817
	blti	%a2, 20, bgti_else.46826
	blti	%a2, 30, bgti_else.46828
	blti	%a2, 40, bgti_else.46830
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46817
	blti	%a2, 20, bgti_else.46834
	blti	%a2, 30, bgti_else.46836
	blti	%a2, 40, bgti_else.46838
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46817
bgti_else.46838:
	addi	%a2, %a2, -30
bgti_cont.46839:
	j	bgti_cont.46817
bgti_else.46836:
	addi	%a2, %a2, -20
bgti_cont.46837:
	j	bgti_cont.46817
bgti_else.46834:
	addi	%a2, %a2, -10
bgti_cont.46835:
	j	bgti_cont.46817
bgti_else.46832:
bgti_cont.46833:
	j	bgti_cont.46817
bgti_else.46830:
	addi	%a2, %a2, -30
bgti_cont.46831:
	j	bgti_cont.46817
bgti_else.46828:
	addi	%a2, %a2, -20
bgti_cont.46829:
	j	bgti_cont.46817
bgti_else.46826:
	addi	%a2, %a2, -10
bgti_cont.46827:
	j	bgti_cont.46817
bgti_else.46824:
bgti_cont.46825:
	j	bgti_cont.46817
bgti_else.46822:
	addi	%a2, %a2, -30
bgti_cont.46823:
	j	bgti_cont.46817
bgti_else.46820:
	addi	%a2, %a2, -20
bgti_cont.46821:
	j	bgti_cont.46817
bgti_else.46818:
	addi	%a2, %a2, -10
bgti_cont.46819:
	j	bgti_cont.46817
bgti_else.46816:
bgti_cont.46817:
	blt	%zero, %k0, bgt_else.46840
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46841
bgt_else.46840:
	blti	%k0, 10, bgti_else.46842
	blti	%k0, 20, bgti_else.46844
	blti	%k0, 30, bgti_else.46846
	blti	%k0, 40, bgti_else.46848
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.46850
	blti	%a0, 20, bgti_else.46852
	blti	%a0, 30, bgti_else.46854
	blti	%a0, 40, bgti_else.46856
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46858
	blti	%a0, 20, bgti_else.46860
	blti	%a0, 30, bgti_else.46862
	blti	%a0, 40, bgti_else.46864
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46843
bgti_else.46864:
	addi	%a0, %zero, 11
bgti_cont.46865:
	j	bgti_cont.46843
bgti_else.46862:
	addi	%a0, %zero, 10
bgti_cont.46863:
	j	bgti_cont.46843
bgti_else.46860:
	addi	%a0, %zero, 9
bgti_cont.46861:
	j	bgti_cont.46843
bgti_else.46858:
	addi	%a0, %zero, 8
bgti_cont.46859:
	j	bgti_cont.46843
bgti_else.46856:
	addi	%a0, %zero, 7
bgti_cont.46857:
	j	bgti_cont.46843
bgti_else.46854:
	addi	%a0, %zero, 6
bgti_cont.46855:
	j	bgti_cont.46843
bgti_else.46852:
	addi	%a0, %zero, 5
bgti_cont.46853:
	j	bgti_cont.46843
bgti_else.46850:
	addi	%a0, %zero, 4
bgti_cont.46851:
	j	bgti_cont.46843
bgti_else.46848:
	addi	%a0, %zero, 3
bgti_cont.46849:
	j	bgti_cont.46843
bgti_else.46846:
	addi	%a0, %zero, 2
bgti_cont.46847:
	j	bgti_cont.46843
bgti_else.46844:
	add	%a0, %zero, %k1
bgti_cont.46845:
	j	bgti_cont.46843
bgti_else.46842:
	add	%a0, %zero, %zero
bgti_cont.46843:
	blti	%k0, 10, bgti_else.46866
	blti	%k0, 20, bgti_else.46868
	blti	%k0, 30, bgti_else.46870
	blti	%k0, 40, bgti_else.46872
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.46867
	blti	%k0, 20, bgti_else.46876
	blti	%k0, 30, bgti_else.46878
	blti	%k0, 40, bgti_else.46880
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.46867
	blti	%k0, 20, bgti_else.46884
	blti	%k0, 30, bgti_else.46886
	blti	%k0, 40, bgti_else.46888
	addi	%v0, %k0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0
	j	bgti_cont.46867
bgti_else.46888:
	addi	%k0, %k0, -30
bgti_cont.46889:
	j	bgti_cont.46867
bgti_else.46886:
	addi	%k0, %k0, -20
bgti_cont.46887:
	j	bgti_cont.46867
bgti_else.46884:
	addi	%k0, %k0, -10
bgti_cont.46885:
	j	bgti_cont.46867
bgti_else.46882:
bgti_cont.46883:
	j	bgti_cont.46867
bgti_else.46880:
	addi	%k0, %k0, -30
bgti_cont.46881:
	j	bgti_cont.46867
bgti_else.46878:
	addi	%k0, %k0, -20
bgti_cont.46879:
	j	bgti_cont.46867
bgti_else.46876:
	addi	%k0, %k0, -10
bgti_cont.46877:
	j	bgti_cont.46867
bgti_else.46874:
bgti_cont.46875:
	j	bgti_cont.46867
bgti_else.46872:
	addi	%k0, %k0, -30
bgti_cont.46873:
	j	bgti_cont.46867
bgti_else.46870:
	addi	%k0, %k0, -20
bgti_cont.46871:
	j	bgti_cont.46867
bgti_else.46868:
	addi	%k0, %k0, -10
bgti_cont.46869:
	j	bgti_cont.46867
bgti_else.46866:
bgti_cont.46867:
	blt	%zero, %a0, bgt_else.46890
	addi	%v0, %k0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46891
bgt_else.46890:
	blti	%a0, 10, bgti_else.46892
	blti	%a0, 20, bgti_else.46894
	blti	%a0, 30, bgti_else.46896
	blti	%a0, 40, bgti_else.46898
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46893
	blti	%a0, 20, bgti_else.46902
	blti	%a0, 30, bgti_else.46904
	blti	%a0, 40, bgti_else.46906
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46893
	blti	%a0, 20, bgti_else.46910
	blti	%a0, 30, bgti_else.46912
	blti	%a0, 40, bgti_else.46914
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46893
bgti_else.46914:
	addi	%a0, %a0, -30
bgti_cont.46915:
	j	bgti_cont.46893
bgti_else.46912:
	addi	%a0, %a0, -20
bgti_cont.46913:
	j	bgti_cont.46893
bgti_else.46910:
	addi	%a0, %a0, -10
bgti_cont.46911:
	j	bgti_cont.46893
bgti_else.46908:
bgti_cont.46909:
	j	bgti_cont.46893
bgti_else.46906:
	addi	%a0, %a0, -30
bgti_cont.46907:
	j	bgti_cont.46893
bgti_else.46904:
	addi	%a0, %a0, -20
bgti_cont.46905:
	j	bgti_cont.46893
bgti_else.46902:
	addi	%a0, %a0, -10
bgti_cont.46903:
	j	bgti_cont.46893
bgti_else.46900:
bgti_cont.46901:
	j	bgti_cont.46893
bgti_else.46898:
	addi	%a0, %a0, -30
bgti_cont.46899:
	j	bgti_cont.46893
bgti_else.46896:
	addi	%a0, %a0, -20
bgti_cont.46897:
	j	bgti_cont.46893
bgti_else.46894:
	addi	%a0, %a0, -10
bgti_cont.46895:
	j	bgti_cont.46893
bgti_else.46892:
bgti_cont.46893:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.46891:
bgt_cont.46841:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.46916
	blti	%a1, 0, bgti_else.46918
	j	bgt_cont.46917
bgti_else.46918:
	add	%a1, %zero, %zero
bgti_cont.46919:
	j	bgt_cont.46917
bgt_else.46916:
	addi	%a1, %zero, 255
bgt_cont.46917:
	blti	%a1, 10, bgti_else.46920
	blti	%a1, 20, bgti_else.46922
	blti	%a1, 30, bgti_else.46924
	blti	%a1, 40, bgti_else.46926
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.46928
	blti	%a0, 20, bgti_else.46930
	blti	%a0, 30, bgti_else.46932
	blti	%a0, 40, bgti_else.46934
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46936
	blti	%a0, 20, bgti_else.46938
	blti	%a0, 30, bgti_else.46940
	blti	%a0, 40, bgti_else.46942
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46921
bgti_else.46942:
	addi	%a2, %zero, 11
bgti_cont.46943:
	j	bgti_cont.46921
bgti_else.46940:
	addi	%a2, %zero, 10
bgti_cont.46941:
	j	bgti_cont.46921
bgti_else.46938:
	addi	%a2, %zero, 9
bgti_cont.46939:
	j	bgti_cont.46921
bgti_else.46936:
	addi	%a2, %zero, 8
bgti_cont.46937:
	j	bgti_cont.46921
bgti_else.46934:
	addi	%a2, %zero, 7
bgti_cont.46935:
	j	bgti_cont.46921
bgti_else.46932:
	addi	%a2, %zero, 6
bgti_cont.46933:
	j	bgti_cont.46921
bgti_else.46930:
	addi	%a2, %zero, 5
bgti_cont.46931:
	j	bgti_cont.46921
bgti_else.46928:
	addi	%a2, %zero, 4
bgti_cont.46929:
	j	bgti_cont.46921
bgti_else.46926:
	addi	%a2, %zero, 3
bgti_cont.46927:
	j	bgti_cont.46921
bgti_else.46924:
	addi	%a2, %zero, 2
bgti_cont.46925:
	j	bgti_cont.46921
bgti_else.46922:
	add	%a2, %zero, %k1
bgti_cont.46923:
	j	bgti_cont.46921
bgti_else.46920:
	add	%a2, %zero, %zero
bgti_cont.46921:
	blti	%a1, 10, bgti_else.46944
	blti	%a1, 20, bgti_else.46946
	blti	%a1, 30, bgti_else.46948
	blti	%a1, 40, bgti_else.46950
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46945
	blti	%a1, 20, bgti_else.46954
	blti	%a1, 30, bgti_else.46956
	blti	%a1, 40, bgti_else.46958
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46945
	blti	%a1, 20, bgti_else.46962
	blti	%a1, 30, bgti_else.46964
	blti	%a1, 40, bgti_else.46966
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.46945
bgti_else.46966:
	addi	%a1, %a1, -30
bgti_cont.46967:
	j	bgti_cont.46945
bgti_else.46964:
	addi	%a1, %a1, -20
bgti_cont.46965:
	j	bgti_cont.46945
bgti_else.46962:
	addi	%a1, %a1, -10
bgti_cont.46963:
	j	bgti_cont.46945
bgti_else.46960:
bgti_cont.46961:
	j	bgti_cont.46945
bgti_else.46958:
	addi	%a1, %a1, -30
bgti_cont.46959:
	j	bgti_cont.46945
bgti_else.46956:
	addi	%a1, %a1, -20
bgti_cont.46957:
	j	bgti_cont.46945
bgti_else.46954:
	addi	%a1, %a1, -10
bgti_cont.46955:
	j	bgti_cont.46945
bgti_else.46952:
bgti_cont.46953:
	j	bgti_cont.46945
bgti_else.46950:
	addi	%a1, %a1, -30
bgti_cont.46951:
	j	bgti_cont.46945
bgti_else.46948:
	addi	%a1, %a1, -20
bgti_cont.46949:
	j	bgti_cont.46945
bgti_else.46946:
	addi	%a1, %a1, -10
bgti_cont.46947:
	j	bgti_cont.46945
bgti_else.46944:
bgti_cont.46945:
	blt	%zero, %a2, bgt_else.46968
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46969
bgt_else.46968:
	blti	%a2, 10, bgti_else.46970
	blti	%a2, 20, bgti_else.46972
	blti	%a2, 30, bgti_else.46974
	blti	%a2, 40, bgti_else.46976
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46978
	blti	%a0, 20, bgti_else.46980
	blti	%a0, 30, bgti_else.46982
	blti	%a0, 40, bgti_else.46984
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46986
	blti	%a0, 20, bgti_else.46988
	blti	%a0, 30, bgti_else.46990
	blti	%a0, 40, bgti_else.46992
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46971
bgti_else.46992:
	addi	%a0, %zero, 11
bgti_cont.46993:
	j	bgti_cont.46971
bgti_else.46990:
	addi	%a0, %zero, 10
bgti_cont.46991:
	j	bgti_cont.46971
bgti_else.46988:
	addi	%a0, %zero, 9
bgti_cont.46989:
	j	bgti_cont.46971
bgti_else.46986:
	addi	%a0, %zero, 8
bgti_cont.46987:
	j	bgti_cont.46971
bgti_else.46984:
	addi	%a0, %zero, 7
bgti_cont.46985:
	j	bgti_cont.46971
bgti_else.46982:
	addi	%a0, %zero, 6
bgti_cont.46983:
	j	bgti_cont.46971
bgti_else.46980:
	addi	%a0, %zero, 5
bgti_cont.46981:
	j	bgti_cont.46971
bgti_else.46978:
	addi	%a0, %zero, 4
bgti_cont.46979:
	j	bgti_cont.46971
bgti_else.46976:
	addi	%a0, %zero, 3
bgti_cont.46977:
	j	bgti_cont.46971
bgti_else.46974:
	addi	%a0, %zero, 2
bgti_cont.46975:
	j	bgti_cont.46971
bgti_else.46972:
	add	%a0, %zero, %k1
bgti_cont.46973:
	j	bgti_cont.46971
bgti_else.46970:
	add	%a0, %zero, %zero
bgti_cont.46971:
	blti	%a2, 10, bgti_else.46994
	blti	%a2, 20, bgti_else.46996
	blti	%a2, 30, bgti_else.46998
	blti	%a2, 40, bgti_else.47000
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46995
	blti	%a2, 20, bgti_else.47004
	blti	%a2, 30, bgti_else.47006
	blti	%a2, 40, bgti_else.47008
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46995
	blti	%a2, 20, bgti_else.47012
	blti	%a2, 30, bgti_else.47014
	blti	%a2, 40, bgti_else.47016
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46995
bgti_else.47016:
	addi	%a2, %a2, -30
bgti_cont.47017:
	j	bgti_cont.46995
bgti_else.47014:
	addi	%a2, %a2, -20
bgti_cont.47015:
	j	bgti_cont.46995
bgti_else.47012:
	addi	%a2, %a2, -10
bgti_cont.47013:
	j	bgti_cont.46995
bgti_else.47010:
bgti_cont.47011:
	j	bgti_cont.46995
bgti_else.47008:
	addi	%a2, %a2, -30
bgti_cont.47009:
	j	bgti_cont.46995
bgti_else.47006:
	addi	%a2, %a2, -20
bgti_cont.47007:
	j	bgti_cont.46995
bgti_else.47004:
	addi	%a2, %a2, -10
bgti_cont.47005:
	j	bgti_cont.46995
bgti_else.47002:
bgti_cont.47003:
	j	bgti_cont.46995
bgti_else.47000:
	addi	%a2, %a2, -30
bgti_cont.47001:
	j	bgti_cont.46995
bgti_else.46998:
	addi	%a2, %a2, -20
bgti_cont.46999:
	j	bgti_cont.46995
bgti_else.46996:
	addi	%a2, %a2, -10
bgti_cont.46997:
	j	bgti_cont.46995
bgti_else.46994:
bgti_cont.46995:
	blt	%zero, %a0, bgt_else.47018
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.47019
bgt_else.47018:
	blti	%a0, 10, bgti_else.47020
	blti	%a0, 20, bgti_else.47022
	blti	%a0, 30, bgti_else.47024
	blti	%a0, 40, bgti_else.47026
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47021
	blti	%a0, 20, bgti_else.47030
	blti	%a0, 30, bgti_else.47032
	blti	%a0, 40, bgti_else.47034
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47021
	blti	%a0, 20, bgti_else.47038
	blti	%a0, 30, bgti_else.47040
	blti	%a0, 40, bgti_else.47042
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.47021
bgti_else.47042:
	addi	%a0, %a0, -30
bgti_cont.47043:
	j	bgti_cont.47021
bgti_else.47040:
	addi	%a0, %a0, -20
bgti_cont.47041:
	j	bgti_cont.47021
bgti_else.47038:
	addi	%a0, %a0, -10
bgti_cont.47039:
	j	bgti_cont.47021
bgti_else.47036:
bgti_cont.47037:
	j	bgti_cont.47021
bgti_else.47034:
	addi	%a0, %a0, -30
bgti_cont.47035:
	j	bgti_cont.47021
bgti_else.47032:
	addi	%a0, %a0, -20
bgti_cont.47033:
	j	bgti_cont.47021
bgti_else.47030:
	addi	%a0, %a0, -10
bgti_cont.47031:
	j	bgti_cont.47021
bgti_else.47028:
bgti_cont.47029:
	j	bgti_cont.47021
bgti_else.47026:
	addi	%a0, %a0, -30
bgti_cont.47027:
	j	bgti_cont.47021
bgti_else.47024:
	addi	%a0, %a0, -20
bgti_cont.47025:
	j	bgti_cont.47021
bgti_else.47022:
	addi	%a0, %a0, -10
bgti_cont.47023:
	j	bgti_cont.47021
bgti_else.47020:
bgti_cont.47021:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.47019:
bgt_cont.46969:
	addi	%v0, %a3, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3057
	addi	%sp, %sp, -11
bgt_cont.46651:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.47044
	addi	%t3, %t3, -5
	j	bgti_cont.47045
bgti_else.47044:
bgti_cont.47045:
	blt	%t2, %t0, bgt_else.47046
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.47046:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.47048
	j	bgt_cont.47049
bgt_else.47048:
	addi	%a1, %t2, 1
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %a1, %a0
	itof	%f0, %a0
	fmul	%f17, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f17, %f0
	flw	%f0, 171(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f16, %f17, %f1
	flw	%f1, 172(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 170(%zero)
	fmul	%f17, %f17, %f16
	flw	%f16, 173(%zero)
	fadd	%f2, %f17, %f16
	addi	%v1, %t1, -1
	lw	%v0, 1(%sp)
	addi	%a0, %t3, 0
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -11
bgt_cont.47049:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3057
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1
	addi	%a2, %t3, 2
	blti	%a2, 5, bgti_else.47050
	addi	%a2, %a2, -5
	j	bgti_cont.47051
bgti_else.47050:
bgti_cont.47051:
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	j	scan_line.3063
init_line_elements.3073:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.47084
	addi	%k0, %zero, 3
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%s1, %zero, 5
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s4, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s6)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s7, 6(%ra)
	sw	%s6, 5(%ra)
	sw	%s5, 4(%ra)
	sw	%s4, 3(%ra)
	sw	%s3, 2(%ra)
	sw	%s2, 1(%ra)
	sw	%s0, 0(%ra)
	add	%at, %a1, %a2
	sw	%ra, 0(%at)
	addi	%s4, %a2, -1
	blti	%s4, 0, bgti_else.47085
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s6)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s7, 6(%ra)
	sw	%s6, 5(%ra)
	sw	%s5, 4(%ra)
	sw	%s3, 3(%ra)
	sw	%s2, 2(%ra)
	sw	%s0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.47086
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s6)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s7, 6(%ra)
	sw	%s6, 5(%ra)
	sw	%s5, 4(%ra)
	sw	%s3, 3(%ra)
	sw	%s2, 2(%ra)
	sw	%s0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.47087
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s6)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s6)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%k0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%k0)
	sw	%s7, 6(%k0)
	sw	%s6, 5(%k0)
	sw	%s5, 4(%k0)
	sw	%s3, 3(%k0)
	sw	%s2, 2(%k0)
	sw	%s0, 1(%k0)
	sw	%a2, 0(%k0)
	add	%at, %a1, %s4
	sw	%k0, 0(%at)
	addi	%v1, %s4, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	init_line_elements.3073
bgti_else.47087:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47086:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47085:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47084:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3083:
	fmov	%f17, %f2
	add	%a1, %zero, %ra
	blti	%v0, 5, bgti_else.47520
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1
	fadd	%f16, %f17, %f16
	fadd	%f16, %f16, %f30
	fsqrt	%f17, %f16
	fdiv	%f19, %f0, %f17
	fdiv	%f16, %f1, %f17
	fdiv	%f18, %f30, %f17
	lw	%a3, 179(%v1)
	add	%at, %a3, %a0
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fsw	%f19, 0(%a2)
	fsw	%f16, 1(%a2)
	fsw	%f18, 2(%a2)
	addi	%a2, %a0, 40
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f0, %f16
	fsw	%f19, 0(%a2)
	fsw	%f18, 1(%a2)
	fsw	%f0, 2(%a2)
	addi	%a2, %a0, 80
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f1, %f19
	fneg	%f0, %f16
	fsw	%f18, 0(%a2)
	fsw	%f1, 1(%a2)
	fsw	%f0, 2(%a2)
	addi	%a2, %a0, 1
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f17, %f19
	fneg	%f1, %f16
	fneg	%f0, %f18
	fsw	%f17, 0(%a2)
	fsw	%f1, 1(%a2)
	fsw	%f0, 2(%a2)
	addi	%a2, %a0, 41
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f1, %f19
	fneg	%f0, %f18
	fsw	%f1, 0(%a2)
	fsw	%f0, 1(%a2)
	fsw	%f16, 2(%a2)
	addi	%a0, %a0, 81
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f18
	fsw	%f0, 0(%a0)
	fsw	%f19, 1(%a0)
	add	%ra, %zero, %a1
	fsw	%f16, 2(%a0)
	jr	%ra
bgti_else.47520:
	fmul	%f0, %f1, %f1
	flw	%f19, 441(%zero)
	fadd	%f0, %f0, %f19
	fsqrt	%f21, %f0
	fdiv	%f2, %f30, %f21
	fblt	%f2, %fzero, fbgt_else.47522
	add	%a2, %zero, %k1
	j	fbgt_cont.47523
fbgt_else.47522:
	add	%a2, %zero, %zero
fbgt_cont.47523:
	fabs	%f18, %f2
	flw	%f20, 462(%zero)
	fblt	%f18, %f20, fbgt_else.47524
	flw	%f0, 455(%zero)
	fblt	%f18, %f0, fbgt_else.47526
	flw	%f16, 479(%zero)
	fdiv	%f22, %f30, %f18
	fmul	%f23, %f22, %f22
	fmul	%f2, %f23, %f23
	fmul	%f18, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fsub	%f1, %f22, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.47527
fbgt_else.47526:
	flw	%f16, 478(%zero)
	fsub	%f1, %f18, %f30
	fadd	%f0, %f18, %f30
	fdiv	%f22, %f1, %f0
	fmul	%f23, %f22, %f22
	fmul	%f2, %f23, %f23
	fmul	%f18, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fsub	%f1, %f22, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.47527:
	beqi	%a2, 0, bnei_else.47528
	j	fbgt_cont.47525
bnei_else.47528:
	fneg	%f0, %f0
bnei_cont.47529:
	j	fbgt_cont.47525
fbgt_else.47524:
	fmul	%f22, %f2, %f2
	fmul	%f18, %f22, %f22
	fmul	%f16, %f18, %f18
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f22
	fsub	%f1, %f2, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
fbgt_cont.47525:
	fmul	%f23, %f0, %f17
	flw	%f22, 494(%zero)
	fblt	%f23, %fzero, fbgt_else.47530
	add	%a2, %zero, %k1
	j	fbgt_cont.47531
fbgt_else.47530:
	add	%a2, %zero, %zero
fbgt_cont.47531:
	fabs	%f18, %f23
	flw	%f2, 493(%zero)
	fblt	%f18, %f2, fbgt_else.47532
	flw	%f0, 492(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 491(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 490(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 489(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 488(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 487(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 486(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 485(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 484(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f0, 483(%zero)
	fblt	%f18, %f0, fbgt_cont.47533
	flw	%f1, 482(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47533
fbgt_else.47552:
fbgt_cont.47553:
	j	fbgt_cont.47533
fbgt_else.47550:
fbgt_cont.47551:
	j	fbgt_cont.47533
fbgt_else.47548:
fbgt_cont.47549:
	j	fbgt_cont.47533
fbgt_else.47546:
fbgt_cont.47547:
	j	fbgt_cont.47533
fbgt_else.47544:
fbgt_cont.47545:
	j	fbgt_cont.47533
fbgt_else.47542:
fbgt_cont.47543:
	j	fbgt_cont.47533
fbgt_else.47540:
fbgt_cont.47541:
	j	fbgt_cont.47533
fbgt_else.47538:
fbgt_cont.47539:
	j	fbgt_cont.47533
fbgt_else.47536:
fbgt_cont.47537:
	j	fbgt_cont.47533
fbgt_else.47534:
fbgt_cont.47535:
	j	fbgt_cont.47533
fbgt_else.47532:
	fmov	%f0, %f2
fbgt_cont.47533:
	fblt	%f18, %f2, fbgt_else.47554
	fblt	%f18, %f0, fbgt_else.47556
	fsub	%f18, %f18, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f0, fbgt_else.47560
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f1, fbgt_else.47564
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47555
fbgt_else.47564:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47565:
	j	fbgt_cont.47555
fbgt_else.47562:
fbgt_cont.47563:
	j	fbgt_cont.47555
fbgt_else.47560:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f1, fbgt_else.47568
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47555
fbgt_else.47568:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47569:
	j	fbgt_cont.47555
fbgt_else.47566:
fbgt_cont.47567:
fbgt_cont.47561:
	j	fbgt_cont.47555
fbgt_else.47558:
fbgt_cont.47559:
	j	fbgt_cont.47555
fbgt_else.47556:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f0, fbgt_else.47572
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f1, fbgt_else.47576
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47555
fbgt_else.47576:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47577:
	j	fbgt_cont.47555
fbgt_else.47574:
fbgt_cont.47575:
	j	fbgt_cont.47555
fbgt_else.47572:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47555
	fblt	%f18, %f1, fbgt_else.47580
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47555
fbgt_else.47580:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47581:
	j	fbgt_cont.47555
fbgt_else.47578:
fbgt_cont.47579:
fbgt_cont.47573:
	j	fbgt_cont.47555
fbgt_else.47570:
fbgt_cont.47571:
fbgt_cont.47557:
	j	fbgt_cont.47555
fbgt_else.47554:
fbgt_cont.47555:
	fblt	%f18, %f22, fbgt_else.47582
	beqi	%a2, 0, bnei_else.47584
	add	%a2, %zero, %zero
	j	fbgt_cont.47583
bnei_else.47584:
	add	%a2, %zero, %k1
bnei_cont.47585:
	j	fbgt_cont.47583
fbgt_else.47582:
fbgt_cont.47583:
	fblt	%f18, %f22, fbgt_else.47586
	fsub	%f18, %f18, %f22
	j	fbgt_cont.47587
fbgt_else.47586:
fbgt_cont.47587:
	flw	%f24, 479(%zero)
	fblt	%f18, %f24, fbgt_else.47588
	fsub	%f18, %f22, %f18
	j	fbgt_cont.47589
fbgt_else.47588:
fbgt_cont.47589:
	flw	%f25, 478(%zero)
	fblt	%f25, %f18, fbgt_else.47590
	fmul	%f26, %f18, %f18
	fmul	%f16, %f26, %f26
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f26
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.47591
fbgt_else.47590:
	fsub	%f0, %f24, %f18
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.47591:
	beqi	%a2, 0, bnei_else.47592
	j	bnei_cont.47593
bnei_else.47592:
	fneg	%f18, %f18
bnei_cont.47593:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.47594
	flw	%f0, 492(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 491(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 490(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 489(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 488(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 487(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 486(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 485(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 484(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f0, 483(%zero)
	fblt	%f23, %f0, fbgt_cont.47595
	flw	%f1, 482(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47595
fbgt_else.47614:
fbgt_cont.47615:
	j	fbgt_cont.47595
fbgt_else.47612:
fbgt_cont.47613:
	j	fbgt_cont.47595
fbgt_else.47610:
fbgt_cont.47611:
	j	fbgt_cont.47595
fbgt_else.47608:
fbgt_cont.47609:
	j	fbgt_cont.47595
fbgt_else.47606:
fbgt_cont.47607:
	j	fbgt_cont.47595
fbgt_else.47604:
fbgt_cont.47605:
	j	fbgt_cont.47595
fbgt_else.47602:
fbgt_cont.47603:
	j	fbgt_cont.47595
fbgt_else.47600:
fbgt_cont.47601:
	j	fbgt_cont.47595
fbgt_else.47598:
fbgt_cont.47599:
	j	fbgt_cont.47595
fbgt_else.47596:
fbgt_cont.47597:
	j	fbgt_cont.47595
fbgt_else.47594:
	fmov	%f0, %f2
fbgt_cont.47595:
	fblt	%f23, %f2, fbgt_else.47616
	fblt	%f23, %f0, fbgt_else.47618
	fsub	%f23, %f23, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f0, fbgt_else.47622
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f1, fbgt_else.47626
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47617
fbgt_else.47626:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47627:
	j	fbgt_cont.47617
fbgt_else.47624:
fbgt_cont.47625:
	j	fbgt_cont.47617
fbgt_else.47622:
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f1, fbgt_else.47630
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47617
fbgt_else.47630:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47631:
	j	fbgt_cont.47617
fbgt_else.47628:
fbgt_cont.47629:
fbgt_cont.47623:
	j	fbgt_cont.47617
fbgt_else.47620:
fbgt_cont.47621:
	j	fbgt_cont.47617
fbgt_else.47618:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f0, fbgt_else.47634
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f1, fbgt_else.47638
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47617
fbgt_else.47638:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47639:
	j	fbgt_cont.47617
fbgt_else.47636:
fbgt_cont.47637:
	j	fbgt_cont.47617
fbgt_else.47634:
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47617
	fblt	%f23, %f1, fbgt_else.47642
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47617
fbgt_else.47642:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47643:
	j	fbgt_cont.47617
fbgt_else.47640:
fbgt_cont.47641:
fbgt_cont.47635:
	j	fbgt_cont.47617
fbgt_else.47632:
fbgt_cont.47633:
fbgt_cont.47619:
	j	fbgt_cont.47617
fbgt_else.47616:
fbgt_cont.47617:
	fblt	%f23, %f22, fbgt_else.47644
	add	%a2, %zero, %zero
	j	fbgt_cont.47645
fbgt_else.47644:
	add	%a2, %zero, %k1
fbgt_cont.47645:
	fblt	%f23, %f22, fbgt_else.47646
	fsub	%f23, %f23, %f22
	j	fbgt_cont.47647
fbgt_else.47646:
fbgt_cont.47647:
	fblt	%f23, %f24, fbgt_else.47648
	beqi	%a2, 0, bnei_else.47650
	add	%a2, %zero, %zero
	j	fbgt_cont.47649
bnei_else.47650:
	add	%a2, %zero, %k1
bnei_cont.47651:
	j	fbgt_cont.47649
fbgt_else.47648:
fbgt_cont.47649:
	fblt	%f23, %f24, fbgt_else.47652
	fsub	%f23, %f22, %f23
	j	fbgt_cont.47653
fbgt_else.47652:
fbgt_cont.47653:
	fblt	%f25, %f23, fbgt_else.47654
	fmul	%f23, %f23, %f23
	fmul	%f16, %f23, %f23
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47655
fbgt_else.47654:
	fsub	%f26, %f24, %f23
	fmul	%f23, %f26, %f26
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f23
	fsub	%f1, %f26, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.47655:
	beqi	%a2, 0, bnei_else.47656
	j	bnei_cont.47657
bnei_else.47656:
	fneg	%f0, %f0
bnei_cont.47657:
	fdiv	%f0, %f18, %f0
	fmul	%f18, %f0, %f21
	addi	%v0, %v0, 1
	fmul	%f0, %f18, %f18
	fadd	%f0, %f0, %f19
	fsqrt	%f21, %f0
	fdiv	%f16, %f30, %f21
	fblt	%f16, %fzero, fbgt_else.47658
	add	%a2, %zero, %k1
	j	fbgt_cont.47659
fbgt_else.47658:
	add	%a2, %zero, %zero
fbgt_cont.47659:
	fabs	%f19, %f16
	fblt	%f19, %f20, fbgt_else.47660
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.47662
	fdiv	%f20, %f30, %f19
	fmul	%f23, %f20, %f20
	fmul	%f19, %f23, %f23
	fmul	%f16, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fsub	%f1, %f20, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsub	%f0, %f24, %f0
	j	fbgt_cont.47663
fbgt_else.47662:
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30
	fdiv	%f20, %f1, %f0
	fmul	%f23, %f20, %f20
	fmul	%f19, %f23, %f23
	fmul	%f16, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fsub	%f1, %f20, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fadd	%f0, %f25, %f0
fbgt_cont.47663:
	beqi	%a2, 0, bnei_else.47664
	j	fbgt_cont.47661
bnei_else.47664:
	fneg	%f0, %f0
bnei_cont.47665:
	j	fbgt_cont.47661
fbgt_else.47660:
	fmul	%f23, %f16, %f16
	fmul	%f20, %f23, %f23
	fmul	%f19, %f20, %f20
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fsub	%f1, %f16, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
fbgt_cont.47661:
	fmul	%f20, %f0, %f3
	fblt	%f20, %fzero, fbgt_else.47666
	add	%a2, %zero, %k1
	j	fbgt_cont.47667
fbgt_else.47666:
	add	%a2, %zero, %zero
fbgt_cont.47667:
	fabs	%f19, %f20
	fblt	%f19, %f2, fbgt_else.47668
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f0, 483(%zero)
	fblt	%f19, %f0, fbgt_cont.47669
	flw	%f1, 482(%zero)
	fmov	%f0, %f19
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47669
fbgt_else.47688:
fbgt_cont.47689:
	j	fbgt_cont.47669
fbgt_else.47686:
fbgt_cont.47687:
	j	fbgt_cont.47669
fbgt_else.47684:
fbgt_cont.47685:
	j	fbgt_cont.47669
fbgt_else.47682:
fbgt_cont.47683:
	j	fbgt_cont.47669
fbgt_else.47680:
fbgt_cont.47681:
	j	fbgt_cont.47669
fbgt_else.47678:
fbgt_cont.47679:
	j	fbgt_cont.47669
fbgt_else.47676:
fbgt_cont.47677:
	j	fbgt_cont.47669
fbgt_else.47674:
fbgt_cont.47675:
	j	fbgt_cont.47669
fbgt_else.47672:
fbgt_cont.47673:
	j	fbgt_cont.47669
fbgt_else.47670:
fbgt_cont.47671:
	j	fbgt_cont.47669
fbgt_else.47668:
	fmov	%f0, %f2
fbgt_cont.47669:
	fblt	%f19, %f2, fbgt_else.47690
	fblt	%f19, %f0, fbgt_else.47692
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f0, fbgt_else.47696
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f1, fbgt_else.47700
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47691
fbgt_else.47700:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47701:
	j	fbgt_cont.47691
fbgt_else.47698:
fbgt_cont.47699:
	j	fbgt_cont.47691
fbgt_else.47696:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f1, fbgt_else.47704
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47691
fbgt_else.47704:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47705:
	j	fbgt_cont.47691
fbgt_else.47702:
fbgt_cont.47703:
fbgt_cont.47697:
	j	fbgt_cont.47691
fbgt_else.47694:
fbgt_cont.47695:
	j	fbgt_cont.47691
fbgt_else.47692:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f0, fbgt_else.47708
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f1, fbgt_else.47712
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47691
fbgt_else.47712:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47713:
	j	fbgt_cont.47691
fbgt_else.47710:
fbgt_cont.47711:
	j	fbgt_cont.47691
fbgt_else.47708:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47691
	fblt	%f19, %f1, fbgt_else.47716
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47691
fbgt_else.47716:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47717:
	j	fbgt_cont.47691
fbgt_else.47714:
fbgt_cont.47715:
fbgt_cont.47709:
	j	fbgt_cont.47691
fbgt_else.47706:
fbgt_cont.47707:
fbgt_cont.47693:
	j	fbgt_cont.47691
fbgt_else.47690:
fbgt_cont.47691:
	fblt	%f19, %f22, fbgt_else.47718
	beqi	%a2, 0, bnei_else.47720
	add	%a2, %zero, %zero
	j	fbgt_cont.47719
bnei_else.47720:
	add	%a2, %zero, %k1
bnei_cont.47721:
	j	fbgt_cont.47719
fbgt_else.47718:
fbgt_cont.47719:
	fblt	%f19, %f22, fbgt_else.47722
	fsub	%f19, %f19, %f22
	j	fbgt_cont.47723
fbgt_else.47722:
fbgt_cont.47723:
	fblt	%f19, %f24, fbgt_else.47724
	fsub	%f19, %f22, %f19
	j	fbgt_cont.47725
fbgt_else.47724:
fbgt_cont.47725:
	fblt	%f25, %f19, fbgt_else.47726
	fmul	%f23, %f19, %f19
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f23
	fsub	%f1, %f19, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
	j	fbgt_cont.47727
fbgt_else.47726:
	fsub	%f0, %f24, %f19
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
fbgt_cont.47727:
	beqi	%a2, 0, bnei_else.47728
	j	bnei_cont.47729
bnei_else.47728:
	fneg	%f19, %f19
bnei_cont.47729:
	fabs	%f20, %f20
	fblt	%f20, %f2, fbgt_else.47730
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f0, 483(%zero)
	fblt	%f20, %f0, fbgt_cont.47731
	flw	%f1, 482(%zero)
	fmov	%f0, %f20
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47731
fbgt_else.47750:
fbgt_cont.47751:
	j	fbgt_cont.47731
fbgt_else.47748:
fbgt_cont.47749:
	j	fbgt_cont.47731
fbgt_else.47746:
fbgt_cont.47747:
	j	fbgt_cont.47731
fbgt_else.47744:
fbgt_cont.47745:
	j	fbgt_cont.47731
fbgt_else.47742:
fbgt_cont.47743:
	j	fbgt_cont.47731
fbgt_else.47740:
fbgt_cont.47741:
	j	fbgt_cont.47731
fbgt_else.47738:
fbgt_cont.47739:
	j	fbgt_cont.47731
fbgt_else.47736:
fbgt_cont.47737:
	j	fbgt_cont.47731
fbgt_else.47734:
fbgt_cont.47735:
	j	fbgt_cont.47731
fbgt_else.47732:
fbgt_cont.47733:
	j	fbgt_cont.47731
fbgt_else.47730:
	fmov	%f0, %f2
fbgt_cont.47731:
	fblt	%f20, %f2, fbgt_else.47752
	fblt	%f20, %f0, fbgt_else.47754
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f0, fbgt_else.47758
	fsub	%f20, %f20, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f1, fbgt_else.47762
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
	j	fbgt_cont.47753
fbgt_else.47762:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
fbgt_cont.47763:
	j	fbgt_cont.47753
fbgt_else.47760:
fbgt_cont.47761:
	j	fbgt_cont.47753
fbgt_else.47758:
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f1, fbgt_else.47766
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
	j	fbgt_cont.47753
fbgt_else.47766:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
fbgt_cont.47767:
	j	fbgt_cont.47753
fbgt_else.47764:
fbgt_cont.47765:
fbgt_cont.47759:
	j	fbgt_cont.47753
fbgt_else.47756:
fbgt_cont.47757:
	j	fbgt_cont.47753
fbgt_else.47754:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f0, fbgt_else.47770
	fsub	%f20, %f20, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f1, fbgt_else.47774
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
	j	fbgt_cont.47753
fbgt_else.47774:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
fbgt_cont.47775:
	j	fbgt_cont.47753
fbgt_else.47772:
fbgt_cont.47773:
	j	fbgt_cont.47753
fbgt_else.47770:
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.47753
	fblt	%f20, %f1, fbgt_else.47778
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
	j	fbgt_cont.47753
fbgt_else.47778:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
fbgt_cont.47779:
	j	fbgt_cont.47753
fbgt_else.47776:
fbgt_cont.47777:
fbgt_cont.47771:
	j	fbgt_cont.47753
fbgt_else.47768:
fbgt_cont.47769:
fbgt_cont.47755:
	j	fbgt_cont.47753
fbgt_else.47752:
fbgt_cont.47753:
	fblt	%f20, %f22, fbgt_else.47780
	add	%a2, %zero, %zero
	j	fbgt_cont.47781
fbgt_else.47780:
	add	%a2, %zero, %k1
fbgt_cont.47781:
	fblt	%f20, %f22, fbgt_else.47782
	fsub	%f20, %f20, %f22
	j	fbgt_cont.47783
fbgt_else.47782:
fbgt_cont.47783:
	fblt	%f20, %f24, fbgt_else.47784
	beqi	%a2, 0, bnei_else.47786
	add	%a2, %zero, %zero
	j	fbgt_cont.47785
bnei_else.47786:
	add	%a2, %zero, %k1
bnei_cont.47787:
	j	fbgt_cont.47785
fbgt_else.47784:
fbgt_cont.47785:
	fblt	%f20, %f24, fbgt_else.47788
	fsub	%f20, %f22, %f20
	j	fbgt_cont.47789
fbgt_else.47788:
fbgt_cont.47789:
	fblt	%f25, %f20, fbgt_else.47790
	fmul	%f2, %f20, %f20
	fmul	%f16, %f2, %f2
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f2
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47791
fbgt_else.47790:
	fsub	%f20, %f24, %f20
	fmul	%f16, %f20, %f20
	fmul	%f2, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
fbgt_cont.47791:
	beqi	%a2, 0, bnei_else.47792
	j	bnei_cont.47793
bnei_else.47792:
	fneg	%f0, %f0
bnei_cont.47793:
	fdiv	%f0, %f19, %f0
	fmul	%f1, %f0, %f21
	add	%ra, %zero, %a1
	fmov	%f2, %f17
	fmov	%f0, %f18
	j	calc_dirvec.3083
calc_dirvecs.3091:
	fmov	%f3, %f0
	add	%k0, %zero, %v0
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	blti	%k0, 0, bgti_else.47828
	itof	%f0, %k0
	flw	%f27, 460(%zero)
	fmul	%f0, %f0, %f27
	flw	%f28, 438(%zero)
	fsub	%f2, %f0, %f28
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	flw	%f29, 441(%zero)
	fadd	%f2, %f0, %f29
	addi	%s2, %s0, 2
	addi	%a0, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%k0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.47829
	addi	%v1, %v1, -5
	j	bgti_cont.47830
bgti_else.47829:
bgti_cont.47830:
	blti	%k0, 0, bgti_else.47831
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	fsub	%f2, %f0, %f28
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	fadd	%f2, %f0, %f29
	addi	%a0, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%v0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.47832
	addi	%v1, %v1, -5
	j	bgti_cont.47833
bgti_else.47832:
bgti_cont.47833:
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3091
bgti_else.47831:
	add	%ra, %zero, %s1
	jr	%ra
bgti_else.47828:
	add	%ra, %zero, %s1
	jr	%ra
calc_dirvec_rows.3096:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	fsw	%f5, 0(%sp)
	fsw	%f4, 1(%sp)
	add	%s6, %zero, %ra
	blti	%s3, 0, bgti_else.47896
	itof	%f0, %s3
	flw	%f4, 460(%zero)
	fmul	%f0, %f0, %f4
	flw	%f5, 438(%zero)
	fsub	%f3, %f0, %f5
	addi	%s7, %zero, 4
	itof	%f0, %s7
	fmul	%f0, %f0, %f4
	fsub	%f2, %f0, %f5
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	calc_dirvec.3083
	itof	%f0, %s7
	fmul	%f1, %f0, %f4
	flw	%f0, 441(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s5, 2
	addi	%v1, %s4, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3
	addi	%v1, %s4, 1
	blti	%v1, 5, bgti_else.47897
	addi	%v1, %v1, -5
	j	bgti_cont.47898
bgti_else.47897:
bgti_cont.47898:
	addi	%a0, %s5, 0
	fmov	%f0, %f3
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%t7, %s3, -1
	addi	%s3, %s4, 2
	blti	%s3, 5, bgti_else.47899
	addi	%s3, %s3, -5
	j	bgti_cont.47900
bgti_else.47899:
bgti_cont.47900:
	addi	%s4, %s5, 4
	blti	%t7, 0, bgti_else.47901
	itof	%f0, %t7
	fmul	%f0, %f0, %f4
	fsub	%f0, %f0, %f5
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %s7, 0
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%v0, %t7, -1
	addi	%v1, %s3, 2
	blti	%v1, 5, bgti_else.47902
	addi	%v1, %v1, -5
	j	bgti_cont.47903
bgti_else.47902:
bgti_cont.47903:
	addi	%a0, %s4, 4
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s6
	j	calc_dirvec_rows.3096
bgti_else.47901:
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.47896:
	add	%ra, %zero, %s6
	jr	%ra
create_dirvec_elements.3102:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.47942
	addi	%k0, %zero, 3
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	lw	%s1, 0(%zero)
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%s0, 0(%a0)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%s0, %a2, -1
	blti	%s0, 0, bgti_else.47943
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%s0, %s0, -1
	blti	%s0, 0, bgti_else.47944
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%s0, %s0, -1
	blti	%s0, 0, bgti_else.47945
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%v1, %s0, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	create_dirvec_elements.3102
bgti_else.47945:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47944:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47943:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47942:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3105:
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra
	blti	%s2, 0, bgti_else.47978
	addi	%s6, %zero, 120
	addi	%s4, %zero, 3
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	lw	%s5, 0(%zero)
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s2)
	lw	%a2, 179(%s2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%s7, %zero, 116
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 116(%a2)
	addi	%v1, %zero, 115
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102
	addi	%s2, %s2, -1
	blti	%s2, 0, bgti_else.47979
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s2)
	lw	%a2, 179(%s2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%v1, %s7, 0
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102
	addi	%v0, %s2, -1
	add	%ra, %zero, %s3
	j	create_dirvecs.3105
bgti_else.47979:
	add	%ra, %zero, %s3
	jr	%ra
bgti_else.47978:
	add	%ra, %zero, %s3
	jr	%ra
init_dirvec_constants.3107:
	add	%s5, %zero, %v0
	add	%s6, %zero, %v1
	add	%s7, %zero, %ra
	blti	%s6, 0, bgti_else.48099
	add	%at, %s5, %s6
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%t7, %a0, -1
	addi	%v1, %t7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48100
	add	%at, %s5, %s6
	lw	%a1, 0(%at)
	blti	%t7, 0, bgti_else.48101
	lw	%a0, 12(%t7)
	lw	%a3, 1(%a1)
	lw	%a2, 0(%a1)
	lw	%s1, 9(%a0)
	lw	%s0, 6(%a0)
	lw	%k0, 4(%a0)
	lw	%s2, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.48103
	beqi	%a0, 2, bnei_else.48105
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%a2)
	flw	%f19, 1(%a2)
	flw	%f24, 2(%a2)
	fmul	%f0, %f20, %f20
	flw	%f2, 0(%k0)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19
	flw	%f18, 1(%k0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f17, 2(%k0)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%s2, 0, bnei_else.48107
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s1)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.48108
bnei_else.48107:
bnei_cont.48108:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s2, 0, bnei_else.48109
	flw	%f22, 1(%s1)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s1)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 473(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s1)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f20, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f23, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f19, %f17
	fmul	%f1, %f20, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f2, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.48110
bnei_else.48109:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.48110:
	fbne	%f0, %fzero, fbeq_else.48111
	add	%a0, %zero, %k1
	j	fbeq_cont.48112
fbeq_else.48111:
	add	%a0, %zero, %zero
fbeq_cont.48112:
	beqi	%a0, 0, bnei_else.48113
	j	bnei_cont.48114
bnei_else.48113:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.48114:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
	j	bnei_cont.48104
bnei_else.48105:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%a2)
	flw	%f18, 0(%k0)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%a2)
	flw	%f17, 1(%k0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a2)
	flw	%f16, 2(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.48115
	add	%a0, %zero, %zero
	j	fbgt_cont.48116
fbgt_else.48115:
	add	%a0, %zero, %k1
fbgt_cont.48116:
	beqi	%a0, 0, bnei_else.48117
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.48118
bnei_else.48117:
	fsw	%fzero, 0(%v0)
bnei_cont.48118:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48106:
	j	bnei_cont.48104
bnei_else.48103:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a2)
	fbne	%f1, %fzero, fbeq_else.48119
	add	%a0, %zero, %k1
	j	fbeq_cont.48120
fbeq_else.48119:
	add	%a0, %zero, %zero
fbeq_cont.48120:
	beqi	%a0, 0, bnei_else.48121
	fsw	%fzero, 1(%v0)
	j	bnei_cont.48122
bnei_else.48121:
	fblt	%f1, %fzero, fbgt_else.48123
	add	%a0, %zero, %zero
	j	fbgt_cont.48124
fbgt_else.48123:
	add	%a0, %zero, %k1
fbgt_cont.48124:
	beqi	%s0, 0, bnei_else.48125
	beqi	%a0, 0, bnei_else.48127
	add	%a0, %zero, %zero
	j	bnei_cont.48126
bnei_else.48127:
	add	%a0, %zero, %k1
bnei_cont.48128:
	j	bnei_cont.48126
bnei_else.48125:
bnei_cont.48126:
	flw	%f0, 0(%k0)
	beqi	%a0, 0, bnei_else.48129
	j	bnei_cont.48130
bnei_else.48129:
	fneg	%f0, %f0
bnei_cont.48130:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.48122:
	flw	%f1, 1(%a2)
	fbne	%f1, %fzero, fbeq_else.48131
	add	%a0, %zero, %k1
	j	fbeq_cont.48132
fbeq_else.48131:
	add	%a0, %zero, %zero
fbeq_cont.48132:
	beqi	%a0, 0, bnei_else.48133
	fsw	%fzero, 3(%v0)
	j	bnei_cont.48134
bnei_else.48133:
	fblt	%f1, %fzero, fbgt_else.48135
	add	%a0, %zero, %zero
	j	fbgt_cont.48136
fbgt_else.48135:
	add	%a0, %zero, %k1
fbgt_cont.48136:
	beqi	%s0, 0, bnei_else.48137
	beqi	%a0, 0, bnei_else.48139
	add	%a0, %zero, %zero
	j	bnei_cont.48138
bnei_else.48139:
	add	%a0, %zero, %k1
bnei_cont.48140:
	j	bnei_cont.48138
bnei_else.48137:
bnei_cont.48138:
	flw	%f0, 1(%k0)
	beqi	%a0, 0, bnei_else.48141
	j	bnei_cont.48142
bnei_else.48141:
	fneg	%f0, %f0
bnei_cont.48142:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.48134:
	flw	%f1, 2(%a2)
	fbne	%f1, %fzero, fbeq_else.48143
	add	%a0, %zero, %k1
	j	fbeq_cont.48144
fbeq_else.48143:
	add	%a0, %zero, %zero
fbeq_cont.48144:
	beqi	%a0, 0, bnei_else.48145
	fsw	%fzero, 5(%v0)
	j	bnei_cont.48146
bnei_else.48145:
	fblt	%f1, %fzero, fbgt_else.48147
	add	%a0, %zero, %zero
	j	fbgt_cont.48148
fbgt_else.48147:
	add	%a0, %zero, %k1
fbgt_cont.48148:
	beqi	%s0, 0, bnei_else.48149
	beqi	%a0, 0, bnei_else.48151
	add	%a0, %zero, %zero
	j	bnei_cont.48150
bnei_else.48151:
	add	%a0, %zero, %k1
bnei_cont.48152:
	j	bnei_cont.48150
bnei_else.48149:
bnei_cont.48150:
	flw	%f0, 2(%k0)
	beqi	%a0, 0, bnei_else.48153
	j	bnei_cont.48154
bnei_else.48153:
	fneg	%f0, %f0
bnei_cont.48154:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.48146:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48104:
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.48102
bgti_else.48101:
bgti_cont.48102:
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48155
	add	%at, %s5, %s6
	lw	%v0, 0(%at)
	addi	%v1, %t7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48156
	add	%at, %s5, %s6
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2892
	addi	%v1, %s6, -1
	add	%ra, %zero, %s7
	addi	%v0, %s5, 0
	j	init_dirvec_constants.3107
bgti_else.48156:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48155:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48100:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48099:
	add	%ra, %zero, %s7
	jr	%ra
init_vecset_constants.3110:
	sw	%v0, 0(%sp)
	add	%t8, %zero, %ra
	blti	%v0, 0, bgti_else.48382
	lw	%s5, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s5)
	lw	%a0, 0(%zero)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.48383
	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	lw	%s0, 0(%a1)
	lw	%s1, 9(%a0)
	lw	%k0, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s2, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.48385
	beqi	%a0, 2, bnei_else.48387
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	flw	%f20, 0(%s0)
	flw	%f19, 1(%s0)
	flw	%f24, 2(%s0)
	fmul	%f0, %f20, %f20
	flw	%f2, 0(%a3)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19
	flw	%f18, 1(%a3)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f17, 2(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%s2, 0, bnei_else.48389
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s1)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.48390
bnei_else.48389:
bnei_cont.48390:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s2, 0, bnei_else.48391
	flw	%f22, 1(%s1)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s1)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 473(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s1)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f20, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f23, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f19, %f17
	fmul	%f1, %f20, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f21
	fsub	%f1, %f2, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.48392
bnei_else.48391:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.48392:
	fbne	%f0, %fzero, fbeq_else.48393
	add	%a0, %zero, %k1
	j	fbeq_cont.48394
fbeq_else.48393:
	add	%a0, %zero, %zero
fbeq_cont.48394:
	beqi	%a0, 0, bnei_else.48395
	j	bnei_cont.48396
bnei_else.48395:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.48396:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
	j	bnei_cont.48386
bnei_else.48387:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	flw	%f0, 0(%s0)
	flw	%f18, 0(%a3)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%s0)
	flw	%f17, 1(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s0)
	flw	%f16, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.48397
	add	%a0, %zero, %zero
	j	fbgt_cont.48398
fbgt_else.48397:
	add	%a0, %zero, %k1
fbgt_cont.48398:
	beqi	%a0, 0, bnei_else.48399
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.48400
bnei_else.48399:
	fsw	%fzero, 0(%v0)
bnei_cont.48400:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.48388:
	j	bnei_cont.48386
bnei_else.48385:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.48401
	add	%a0, %zero, %k1
	j	fbeq_cont.48402
fbeq_else.48401:
	add	%a0, %zero, %zero
fbeq_cont.48402:
	beqi	%a0, 0, bnei_else.48403
	fsw	%fzero, 1(%v0)
	j	bnei_cont.48404
bnei_else.48403:
	fblt	%f1, %fzero, fbgt_else.48405
	add	%a0, %zero, %zero
	j	fbgt_cont.48406
fbgt_else.48405:
	add	%a0, %zero, %k1
fbgt_cont.48406:
	beqi	%k0, 0, bnei_else.48407
	beqi	%a0, 0, bnei_else.48409
	add	%a0, %zero, %zero
	j	bnei_cont.48408
bnei_else.48409:
	add	%a0, %zero, %k1
bnei_cont.48410:
	j	bnei_cont.48408
bnei_else.48407:
bnei_cont.48408:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.48411
	j	bnei_cont.48412
bnei_else.48411:
	fneg	%f0, %f0
bnei_cont.48412:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.48404:
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.48413
	add	%a0, %zero, %k1
	j	fbeq_cont.48414
fbeq_else.48413:
	add	%a0, %zero, %zero
fbeq_cont.48414:
	beqi	%a0, 0, bnei_else.48415
	fsw	%fzero, 3(%v0)
	j	bnei_cont.48416
bnei_else.48415:
	fblt	%f1, %fzero, fbgt_else.48417
	add	%a0, %zero, %zero
	j	fbgt_cont.48418
fbgt_else.48417:
	add	%a0, %zero, %k1
fbgt_cont.48418:
	beqi	%k0, 0, bnei_else.48419
	beqi	%a0, 0, bnei_else.48421
	add	%a0, %zero, %zero
	j	bnei_cont.48420
bnei_else.48421:
	add	%a0, %zero, %k1
bnei_cont.48422:
	j	bnei_cont.48420
bnei_else.48419:
bnei_cont.48420:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.48423
	j	bnei_cont.48424
bnei_else.48423:
	fneg	%f0, %f0
bnei_cont.48424:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.48416:
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.48425
	add	%a0, %zero, %k1
	j	fbeq_cont.48426
fbeq_else.48425:
	add	%a0, %zero, %zero
fbeq_cont.48426:
	beqi	%a0, 0, bnei_else.48427
	fsw	%fzero, 5(%v0)
	j	bnei_cont.48428
bnei_else.48427:
	fblt	%f1, %fzero, fbgt_else.48429
	add	%a0, %zero, %zero
	j	fbgt_cont.48430
fbgt_else.48429:
	add	%a0, %zero, %k1
fbgt_cont.48430:
	beqi	%k0, 0, bnei_else.48431
	beqi	%a0, 0, bnei_else.48433
	add	%a0, %zero, %zero
	j	bnei_cont.48432
bnei_else.48433:
	add	%a0, %zero, %k1
bnei_cont.48434:
	j	bnei_cont.48432
bnei_else.48431:
bnei_cont.48432:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.48435
	j	bnei_cont.48436
bnei_else.48435:
	fneg	%f0, %f0
bnei_cont.48436:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.48428:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.48386:
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0
	addi	%sp, %sp, 1
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -1
	j	bgti_cont.48384
bgti_else.48383:
bgti_cont.48384:
	addi	%a0, %zero, 118
	lw	%v0, 118(%s5)
	addi	%v1, %t9, 0
	addi	%sp, %sp, 1
	jal	iter_setup_dirvec_constants.2889
	addi	%a0, %zero, 117
	lw	%v0, 117(%s5)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 116
	addi	%v0, %s5, 0
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -1
	lw	%a0, 0(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.48437
	lw	%s5, 179(%a0)
	lw	%v0, 119(%s5)
	addi	%v1, %t9, 0
	addi	%sp, %sp, 2
	jal	iter_setup_dirvec_constants.2889
	lw	%v0, 118(%s5)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 117
	addi	%v0, %s5, 0
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -2
	lw	%a0, 1(%sp)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.48438
	lw	%s5, 179(%t9)
	lw	%v0, 119(%s5)
	addi	%sp, %sp, 2
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 118
	addi	%v0, %s5, 0
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -2
	addi	%t9, %t9, -1
	blti	%t9, 0, bgti_else.48439
	lw	%v0, 179(%t9)
	addi	%v1, %zero, 119
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -2
	addi	%v0, %t9, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3110
bgti_else.48439:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.48438:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.48437:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.48382:
	add	%ra, %zero, %t8
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %k1, 0
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	sw	%zero, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%zero, 4(%zero)
	sw	%zero, 3(%zero)
	sw	%zero, 2(%zero)
	sw	%zero, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %k1, 0
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 75
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 78
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	flw	%f0, 451(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%a3, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 135
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	flw	%f0, 445(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 138
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 142
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 145
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 148
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 151
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 156
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 158
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 159
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 162
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 165
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 168
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 171
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 174
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a3, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	sw	%v0, 178(%zero)
	sw	%a3, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray
	addi	%v1, %zero, 184
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 184
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a3, %v0, 0
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	sw	%v0, 248(%zero)
	sw	%a3, 247(%zero)
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %v0, 0
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 249
	sw	%v0, 250(%zero)
	sw	%a2, 249(%zero)
	addi	%v0, %zero, 180
	fsw	%fzero, 253(%zero)
	sw	%a0, 252(%zero)
	sw	%zero, 251(%zero)
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	jal	min_caml_create_extarray
	addi	%a0, %zero, 434
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a1, %zero, 128
	sw	%a1, 154(%zero)
	sw	%a1, 155(%zero)
	addi	%a0, %zero, 64
	sw	%a0, 156(%zero)
	sw	%a0, 157(%zero)
	flw	%f1, 437(%zero)
	itof	%f0, %a1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 158(%zero)
	lw	%a0, 154(%zero)
	sw	%a0, 0(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a2)
	addi	%a0, %zero, 4
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	lw	%a0, 0(%sp)
	addi	%t7, %a0, -2
	blti	%t7, 0, bgti_else.50803
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s3, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %t7
	sw	%ra, 0(%at)
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3073
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	j	bgti_cont.50804
bgti_else.50803:
bgti_cont.50804:
	sw	%a1, 1(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	blti	%t7, 0, bgti_else.50805
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s3, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %t7
	sw	%ra, 0(%at)
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3073
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	j	bgti_cont.50806
bgti_else.50805:
bgti_cont.50806:
	sw	%a1, 2(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	blti	%t7, 0, bgti_else.50807
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s3, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %t7
	sw	%ra, 0(%at)
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3073
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	j	bgti_cont.50808
bgti_else.50807:
bgti_cont.50808:
	sw	%a1, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	fsw	%f0, 72(%zero)
	jal	min_caml_read_float
	fsw	%f0, 73(%zero)
	jal	min_caml_read_float
	fsw	%f0, 74(%zero)
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	flw	%f19, 469(%zero)
	fmul	%f20, %f0, %f19
	flw	%f18, 494(%zero)
	fabs	%f17, %f20
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.50809
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.50810
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50810
fbgt_else.50827:
fbgt_cont.50828:
	j	fbgt_cont.50810
fbgt_else.50825:
fbgt_cont.50826:
	j	fbgt_cont.50810
fbgt_else.50823:
fbgt_cont.50824:
	j	fbgt_cont.50810
fbgt_else.50821:
fbgt_cont.50822:
	j	fbgt_cont.50810
fbgt_else.50819:
fbgt_cont.50820:
	j	fbgt_cont.50810
fbgt_else.50817:
fbgt_cont.50818:
	j	fbgt_cont.50810
fbgt_else.50815:
fbgt_cont.50816:
	j	fbgt_cont.50810
fbgt_else.50813:
fbgt_cont.50814:
	j	fbgt_cont.50810
fbgt_else.50811:
fbgt_cont.50812:
	j	fbgt_cont.50810
fbgt_else.50809:
	fmov	%f0, %f2
fbgt_cont.50810:
	fblt	%f17, %f2, fbgt_else.50829
	fblt	%f17, %f0, fbgt_else.50831
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50830
	fblt	%f17, %f1, fbgt_else.50835
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
	j	fbgt_cont.50830
fbgt_else.50835:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
fbgt_cont.50836:
	j	fbgt_cont.50830
fbgt_else.50833:
fbgt_cont.50834:
	j	fbgt_cont.50830
fbgt_else.50831:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50830
	fblt	%f17, %f1, fbgt_else.50839
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
	j	fbgt_cont.50830
fbgt_else.50839:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
fbgt_cont.50840:
	j	fbgt_cont.50830
fbgt_else.50837:
fbgt_cont.50838:
fbgt_cont.50832:
	j	fbgt_cont.50830
fbgt_else.50829:
fbgt_cont.50830:
	fblt	%f17, %f18, fbgt_else.50841
	add	%a0, %zero, %zero
	j	fbgt_cont.50842
fbgt_else.50841:
	add	%a0, %zero, %k1
fbgt_cont.50842:
	fblt	%f17, %f18, fbgt_else.50843
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50844
fbgt_else.50843:
fbgt_cont.50844:
	flw	%f21, 479(%zero)
	fblt	%f17, %f21, fbgt_else.50845
	beqi	%a0, 0, bnei_else.50847
	add	%a0, %zero, %zero
	j	fbgt_cont.50846
bnei_else.50847:
	add	%a0, %zero, %k1
bnei_cont.50848:
	j	fbgt_cont.50846
fbgt_else.50845:
fbgt_cont.50846:
	fblt	%f17, %f21, fbgt_else.50849
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50850
fbgt_else.50849:
fbgt_cont.50850:
	flw	%f22, 478(%zero)
	fblt	%f22, %f17, fbgt_else.50851
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.50852
fbgt_else.50851:
	fsub	%f23, %f21, %f17
	fmul	%f17, %f23, %f23
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f17
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.50852:
	beqi	%a0, 0, bnei_else.50853
	j	bnei_cont.50854
bnei_else.50853:
	fneg	%f17, %f17
bnei_cont.50854:
	fblt	%f20, %fzero, fbgt_else.50855
	add	%a0, %zero, %k1
	j	fbgt_cont.50856
fbgt_else.50855:
	add	%a0, %zero, %zero
fbgt_cont.50856:
	fabs	%f20, %f20
	fblt	%f20, %f2, fbgt_else.50857
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.50858
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50858
fbgt_else.50875:
fbgt_cont.50876:
	j	fbgt_cont.50858
fbgt_else.50873:
fbgt_cont.50874:
	j	fbgt_cont.50858
fbgt_else.50871:
fbgt_cont.50872:
	j	fbgt_cont.50858
fbgt_else.50869:
fbgt_cont.50870:
	j	fbgt_cont.50858
fbgt_else.50867:
fbgt_cont.50868:
	j	fbgt_cont.50858
fbgt_else.50865:
fbgt_cont.50866:
	j	fbgt_cont.50858
fbgt_else.50863:
fbgt_cont.50864:
	j	fbgt_cont.50858
fbgt_else.50861:
fbgt_cont.50862:
	j	fbgt_cont.50858
fbgt_else.50859:
fbgt_cont.50860:
	j	fbgt_cont.50858
fbgt_else.50857:
	fmov	%f0, %f2
fbgt_cont.50858:
	fblt	%f20, %f2, fbgt_else.50877
	fblt	%f20, %f0, fbgt_else.50879
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50878
	fblt	%f20, %f1, fbgt_else.50883
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
	j	fbgt_cont.50878
fbgt_else.50883:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
fbgt_cont.50884:
	j	fbgt_cont.50878
fbgt_else.50881:
fbgt_cont.50882:
	j	fbgt_cont.50878
fbgt_else.50879:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50878
	fblt	%f20, %f1, fbgt_else.50887
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
	j	fbgt_cont.50878
fbgt_else.50887:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
fbgt_cont.50888:
	j	fbgt_cont.50878
fbgt_else.50885:
fbgt_cont.50886:
fbgt_cont.50880:
	j	fbgt_cont.50878
fbgt_else.50877:
fbgt_cont.50878:
	fblt	%f20, %f18, fbgt_else.50889
	beqi	%a0, 0, bnei_else.50891
	add	%a0, %zero, %zero
	j	fbgt_cont.50890
bnei_else.50891:
	add	%a0, %zero, %k1
bnei_cont.50892:
	j	fbgt_cont.50890
fbgt_else.50889:
fbgt_cont.50890:
	fblt	%f20, %f18, fbgt_else.50893
	fsub	%f20, %f20, %f18
	j	fbgt_cont.50894
fbgt_else.50893:
fbgt_cont.50894:
	fblt	%f20, %f21, fbgt_else.50895
	fsub	%f20, %f18, %f20
	j	fbgt_cont.50896
fbgt_else.50895:
fbgt_cont.50896:
	fblt	%f22, %f20, fbgt_else.50897
	fmul	%f23, %f20, %f20
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f20, %f1, %f0
	j	fbgt_cont.50898
fbgt_else.50897:
	fsub	%f0, %f21, %f20
	fmul	%f20, %f0, %f0
	fmul	%f16, %f20, %f20
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f20, %f1, %f0
fbgt_cont.50898:
	beqi	%a0, 0, bnei_else.50899
	j	bnei_cont.50900
bnei_else.50899:
	fneg	%f20, %f20
bnei_cont.50900:
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f24, %f0, %f19
	fabs	%f23, %f24
	fblt	%f23, %f2, fbgt_else.50901
	flw	%f0, 492(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 491(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 490(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 489(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 488(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 487(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 486(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 485(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f0, 484(%zero)
	fblt	%f23, %f0, fbgt_cont.50902
	flw	%f1, 483(%zero)
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50902
fbgt_else.50919:
fbgt_cont.50920:
	j	fbgt_cont.50902
fbgt_else.50917:
fbgt_cont.50918:
	j	fbgt_cont.50902
fbgt_else.50915:
fbgt_cont.50916:
	j	fbgt_cont.50902
fbgt_else.50913:
fbgt_cont.50914:
	j	fbgt_cont.50902
fbgt_else.50911:
fbgt_cont.50912:
	j	fbgt_cont.50902
fbgt_else.50909:
fbgt_cont.50910:
	j	fbgt_cont.50902
fbgt_else.50907:
fbgt_cont.50908:
	j	fbgt_cont.50902
fbgt_else.50905:
fbgt_cont.50906:
	j	fbgt_cont.50902
fbgt_else.50903:
fbgt_cont.50904:
	j	fbgt_cont.50902
fbgt_else.50901:
	fmov	%f0, %f2
fbgt_cont.50902:
	fblt	%f23, %f2, fbgt_else.50921
	fblt	%f23, %f0, fbgt_else.50923
	fsub	%f23, %f23, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.50922
	fblt	%f23, %f1, fbgt_else.50927
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
	j	fbgt_cont.50922
fbgt_else.50927:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
fbgt_cont.50928:
	j	fbgt_cont.50922
fbgt_else.50925:
fbgt_cont.50926:
	j	fbgt_cont.50922
fbgt_else.50923:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.50922
	fblt	%f23, %f1, fbgt_else.50931
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
	j	fbgt_cont.50922
fbgt_else.50931:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
fbgt_cont.50932:
	j	fbgt_cont.50922
fbgt_else.50929:
fbgt_cont.50930:
fbgt_cont.50924:
	j	fbgt_cont.50922
fbgt_else.50921:
fbgt_cont.50922:
	fblt	%f23, %f18, fbgt_else.50933
	add	%a0, %zero, %zero
	j	fbgt_cont.50934
fbgt_else.50933:
	add	%a0, %zero, %k1
fbgt_cont.50934:
	fblt	%f23, %f18, fbgt_else.50935
	fsub	%f23, %f23, %f18
	j	fbgt_cont.50936
fbgt_else.50935:
fbgt_cont.50936:
	fblt	%f23, %f21, fbgt_else.50937
	beqi	%a0, 0, bnei_else.50939
	add	%a0, %zero, %zero
	j	fbgt_cont.50938
bnei_else.50939:
	add	%a0, %zero, %k1
bnei_cont.50940:
	j	fbgt_cont.50938
fbgt_else.50937:
fbgt_cont.50938:
	fblt	%f23, %f21, fbgt_else.50941
	fsub	%f23, %f18, %f23
	j	fbgt_cont.50942
fbgt_else.50941:
fbgt_cont.50942:
	fblt	%f22, %f23, fbgt_else.50943
	fmul	%f23, %f23, %f23
	fmul	%f16, %f23, %f23
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.50944
fbgt_else.50943:
	fsub	%f25, %f21, %f23
	fmul	%f23, %f25, %f25
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f23
	fsub	%f1, %f25, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
fbgt_cont.50944:
	beqi	%a0, 0, bnei_else.50945
	j	bnei_cont.50946
bnei_else.50945:
	fneg	%f23, %f23
bnei_cont.50946:
	fblt	%f24, %fzero, fbgt_else.50947
	add	%a0, %zero, %k1
	j	fbgt_cont.50948
fbgt_else.50947:
	add	%a0, %zero, %zero
fbgt_cont.50948:
	fabs	%f24, %f24
	fblt	%f24, %f2, fbgt_else.50949
	flw	%f0, 492(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 491(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 490(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 489(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 488(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 487(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 486(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 485(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f0, 484(%zero)
	fblt	%f24, %f0, fbgt_cont.50950
	flw	%f1, 483(%zero)
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50950
fbgt_else.50967:
fbgt_cont.50968:
	j	fbgt_cont.50950
fbgt_else.50965:
fbgt_cont.50966:
	j	fbgt_cont.50950
fbgt_else.50963:
fbgt_cont.50964:
	j	fbgt_cont.50950
fbgt_else.50961:
fbgt_cont.50962:
	j	fbgt_cont.50950
fbgt_else.50959:
fbgt_cont.50960:
	j	fbgt_cont.50950
fbgt_else.50957:
fbgt_cont.50958:
	j	fbgt_cont.50950
fbgt_else.50955:
fbgt_cont.50956:
	j	fbgt_cont.50950
fbgt_else.50953:
fbgt_cont.50954:
	j	fbgt_cont.50950
fbgt_else.50951:
fbgt_cont.50952:
	j	fbgt_cont.50950
fbgt_else.50949:
	fmov	%f0, %f2
fbgt_cont.50950:
	fblt	%f24, %f2, fbgt_else.50969
	fblt	%f24, %f0, fbgt_else.50971
	fsub	%f24, %f24, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.50970
	fblt	%f24, %f1, fbgt_else.50975
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
	j	fbgt_cont.50970
fbgt_else.50975:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
fbgt_cont.50976:
	j	fbgt_cont.50970
fbgt_else.50973:
fbgt_cont.50974:
	j	fbgt_cont.50970
fbgt_else.50971:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.50970
	fblt	%f24, %f1, fbgt_else.50979
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
	j	fbgt_cont.50970
fbgt_else.50979:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
fbgt_cont.50980:
	j	fbgt_cont.50970
fbgt_else.50977:
fbgt_cont.50978:
fbgt_cont.50972:
	j	fbgt_cont.50970
fbgt_else.50969:
fbgt_cont.50970:
	fblt	%f24, %f18, fbgt_else.50981
	beqi	%a0, 0, bnei_else.50983
	add	%a0, %zero, %zero
	j	fbgt_cont.50982
bnei_else.50983:
	add	%a0, %zero, %k1
bnei_cont.50984:
	j	fbgt_cont.50982
fbgt_else.50981:
fbgt_cont.50982:
	fblt	%f24, %f18, fbgt_else.50985
	fsub	%f24, %f24, %f18
	j	fbgt_cont.50986
fbgt_else.50985:
fbgt_cont.50986:
	fblt	%f24, %f21, fbgt_else.50987
	fsub	%f24, %f18, %f24
	j	fbgt_cont.50988
fbgt_else.50987:
fbgt_cont.50988:
	fblt	%f22, %f24, fbgt_else.50989
	fmul	%f25, %f24, %f24
	fmul	%f16, %f25, %f25
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50990
fbgt_else.50989:
	fsub	%f0, %f21, %f24
	fmul	%f24, %f0, %f0
	fmul	%f16, %f24, %f24
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.50990:
	beqi	%a0, 0, bnei_else.50991
	j	bnei_cont.50992
bnei_else.50991:
	fneg	%f0, %f0
bnei_cont.50992:
	fmul	%f1, %f17, %f0
	flw	%f16, 436(%zero)
	fmul	%f1, %f1, %f16
	fsw	%f1, 171(%zero)
	flw	%f1, 435(%zero)
	fmul	%f1, %f20, %f1
	fsw	%f1, 172(%zero)
	fmul	%f1, %f17, %f23
	fmul	%f1, %f1, %f16
	fsw	%f1, 173(%zero)
	fsw	%f23, 165(%zero)
	fsw	%fzero, 166(%zero)
	fneg	%f1, %f0
	fsw	%f1, 167(%zero)
	fneg	%f1, %f20
	fmul	%f0, %f1, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f17
	fsw	%f0, 169(%zero)
	fneg	%f0, %f20
	fmul	%f0, %f0, %f23
	fsw	%f0, 170(%zero)
	flw	%f1, 72(%zero)
	flw	%f0, 171(%zero)
	fsw	%f0, 4(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 75(%zero)
	flw	%f1, 73(%zero)
	flw	%f0, 172(%zero)
	fsw	%f0, 5(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 76(%zero)
	flw	%f1, 74(%zero)
	flw	%f0, 173(%zero)
	fsw	%f0, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 77(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fmul	%f20, %f0, %f19
	fblt	%f20, %fzero, fbgt_else.50993
	add	%a0, %zero, %k1
	j	fbgt_cont.50994
fbgt_else.50993:
	add	%a0, %zero, %zero
fbgt_cont.50994:
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.50995
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.50996
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.50996
fbgt_else.51013:
fbgt_cont.51014:
	j	fbgt_cont.50996
fbgt_else.51011:
fbgt_cont.51012:
	j	fbgt_cont.50996
fbgt_else.51009:
fbgt_cont.51010:
	j	fbgt_cont.50996
fbgt_else.51007:
fbgt_cont.51008:
	j	fbgt_cont.50996
fbgt_else.51005:
fbgt_cont.51006:
	j	fbgt_cont.50996
fbgt_else.51003:
fbgt_cont.51004:
	j	fbgt_cont.50996
fbgt_else.51001:
fbgt_cont.51002:
	j	fbgt_cont.50996
fbgt_else.50999:
fbgt_cont.51000:
	j	fbgt_cont.50996
fbgt_else.50997:
fbgt_cont.50998:
	j	fbgt_cont.50996
fbgt_else.50995:
	fmov	%f0, %f2
fbgt_cont.50996:
	fblt	%f17, %f2, fbgt_else.51015
	fblt	%f17, %f0, fbgt_else.51017
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51016
	fblt	%f17, %f1, fbgt_else.51021
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.51016
fbgt_else.51021:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.51022:
	j	fbgt_cont.51016
fbgt_else.51019:
fbgt_cont.51020:
	j	fbgt_cont.51016
fbgt_else.51017:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51016
	fblt	%f17, %f1, fbgt_else.51025
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.51016
fbgt_else.51025:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.51026:
	j	fbgt_cont.51016
fbgt_else.51023:
fbgt_cont.51024:
fbgt_cont.51018:
	j	fbgt_cont.51016
fbgt_else.51015:
fbgt_cont.51016:
	fblt	%f17, %f18, fbgt_else.51027
	beqi	%a0, 0, bnei_else.51029
	add	%a0, %zero, %zero
	j	fbgt_cont.51028
bnei_else.51029:
	add	%a0, %zero, %k1
bnei_cont.51030:
	j	fbgt_cont.51028
fbgt_else.51027:
fbgt_cont.51028:
	fblt	%f17, %f18, fbgt_else.51031
	fsub	%f17, %f17, %f18
	j	fbgt_cont.51032
fbgt_else.51031:
fbgt_cont.51032:
	fblt	%f17, %f21, fbgt_else.51033
	fsub	%f17, %f18, %f17
	j	fbgt_cont.51034
fbgt_else.51033:
fbgt_cont.51034:
	fblt	%f22, %f17, fbgt_else.51035
	fmul	%f23, %f17, %f17
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f23
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51036
fbgt_else.51035:
	fsub	%f0, %f21, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51036:
	beqi	%a0, 0, bnei_else.51037
	j	bnei_cont.51038
bnei_else.51037:
	fneg	%f0, %f0
bnei_cont.51038:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fmul	%f19, %f0, %f19
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.51039
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.51040
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.51040
fbgt_else.51057:
fbgt_cont.51058:
	j	fbgt_cont.51040
fbgt_else.51055:
fbgt_cont.51056:
	j	fbgt_cont.51040
fbgt_else.51053:
fbgt_cont.51054:
	j	fbgt_cont.51040
fbgt_else.51051:
fbgt_cont.51052:
	j	fbgt_cont.51040
fbgt_else.51049:
fbgt_cont.51050:
	j	fbgt_cont.51040
fbgt_else.51047:
fbgt_cont.51048:
	j	fbgt_cont.51040
fbgt_else.51045:
fbgt_cont.51046:
	j	fbgt_cont.51040
fbgt_else.51043:
fbgt_cont.51044:
	j	fbgt_cont.51040
fbgt_else.51041:
fbgt_cont.51042:
	j	fbgt_cont.51040
fbgt_else.51039:
	fmov	%f0, %f2
fbgt_cont.51040:
	fblt	%f17, %f2, fbgt_else.51059
	fblt	%f17, %f0, fbgt_else.51061
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51060
	fblt	%f17, %f1, fbgt_else.51065
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.51060
fbgt_else.51065:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.51066:
	j	fbgt_cont.51060
fbgt_else.51063:
fbgt_cont.51064:
	j	fbgt_cont.51060
fbgt_else.51061:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51060
	fblt	%f17, %f1, fbgt_else.51069
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.51060
fbgt_else.51069:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.51070:
	j	fbgt_cont.51060
fbgt_else.51067:
fbgt_cont.51068:
fbgt_cont.51062:
	j	fbgt_cont.51060
fbgt_else.51059:
fbgt_cont.51060:
	fblt	%f17, %f18, fbgt_else.51071
	add	%a0, %zero, %zero
	j	fbgt_cont.51072
fbgt_else.51071:
	add	%a0, %zero, %k1
fbgt_cont.51072:
	fblt	%f17, %f18, fbgt_else.51073
	fsub	%f17, %f17, %f18
	j	fbgt_cont.51074
fbgt_else.51073:
fbgt_cont.51074:
	fblt	%f17, %f21, fbgt_else.51075
	beqi	%a0, 0, bnei_else.51077
	add	%a0, %zero, %zero
	j	fbgt_cont.51076
bnei_else.51077:
	add	%a0, %zero, %k1
bnei_cont.51078:
	j	fbgt_cont.51076
fbgt_else.51075:
fbgt_cont.51076:
	fblt	%f17, %f21, fbgt_else.51079
	fsub	%f17, %f18, %f17
	j	fbgt_cont.51080
fbgt_else.51079:
fbgt_cont.51080:
	fblt	%f22, %f17, fbgt_else.51081
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.51082
fbgt_else.51081:
	fsub	%f20, %f21, %f17
	fmul	%f16, %f20, %f20
	fmul	%f17, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f17, %f1, %f0
fbgt_cont.51082:
	beqi	%a0, 0, bnei_else.51083
	j	bnei_cont.51084
bnei_else.51083:
	fneg	%f17, %f17
bnei_cont.51084:
	fblt	%f19, %fzero, fbgt_else.51085
	add	%a0, %zero, %k1
	j	fbgt_cont.51086
fbgt_else.51085:
	add	%a0, %zero, %zero
fbgt_cont.51086:
	fabs	%f20, %f19
	fblt	%f20, %f2, fbgt_else.51087
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.51088
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.51088
fbgt_else.51105:
fbgt_cont.51106:
	j	fbgt_cont.51088
fbgt_else.51103:
fbgt_cont.51104:
	j	fbgt_cont.51088
fbgt_else.51101:
fbgt_cont.51102:
	j	fbgt_cont.51088
fbgt_else.51099:
fbgt_cont.51100:
	j	fbgt_cont.51088
fbgt_else.51097:
fbgt_cont.51098:
	j	fbgt_cont.51088
fbgt_else.51095:
fbgt_cont.51096:
	j	fbgt_cont.51088
fbgt_else.51093:
fbgt_cont.51094:
	j	fbgt_cont.51088
fbgt_else.51091:
fbgt_cont.51092:
	j	fbgt_cont.51088
fbgt_else.51089:
fbgt_cont.51090:
	j	fbgt_cont.51088
fbgt_else.51087:
	fmov	%f0, %f2
fbgt_cont.51088:
	fblt	%f20, %f2, fbgt_else.51107
	fblt	%f20, %f0, fbgt_else.51109
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51108
	fblt	%f20, %f1, fbgt_else.51113
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
	j	fbgt_cont.51108
fbgt_else.51113:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
fbgt_cont.51114:
	j	fbgt_cont.51108
fbgt_else.51111:
fbgt_cont.51112:
	j	fbgt_cont.51108
fbgt_else.51109:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51108
	fblt	%f20, %f1, fbgt_else.51117
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
	j	fbgt_cont.51108
fbgt_else.51117:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
fbgt_cont.51118:
	j	fbgt_cont.51108
fbgt_else.51115:
fbgt_cont.51116:
fbgt_cont.51110:
	j	fbgt_cont.51108
fbgt_else.51107:
fbgt_cont.51108:
	fblt	%f20, %f18, fbgt_else.51119
	beqi	%a0, 0, bnei_else.51121
	add	%a0, %zero, %zero
	j	fbgt_cont.51120
bnei_else.51121:
	add	%a0, %zero, %k1
bnei_cont.51122:
	j	fbgt_cont.51120
fbgt_else.51119:
fbgt_cont.51120:
	fblt	%f20, %f18, fbgt_else.51123
	fsub	%f20, %f20, %f18
	j	fbgt_cont.51124
fbgt_else.51123:
fbgt_cont.51124:
	fblt	%f20, %f21, fbgt_else.51125
	fsub	%f20, %f18, %f20
	j	fbgt_cont.51126
fbgt_else.51125:
fbgt_cont.51126:
	fblt	%f22, %f20, fbgt_else.51127
	fmul	%f23, %f20, %f20
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51128
fbgt_else.51127:
	fsub	%f0, %f21, %f20
	fmul	%f20, %f0, %f0
	fmul	%f16, %f20, %f20
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51128:
	beqi	%a0, 0, bnei_else.51129
	j	bnei_cont.51130
bnei_else.51129:
	fneg	%f0, %f0
bnei_cont.51130:
	fmul	%f0, %f17, %f0
	fsw	%f0, 78(%zero)
	fabs	%f19, %f19
	fblt	%f19, %f2, fbgt_else.51131
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.51132
	flw	%f1, 483(%zero)
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.51132
fbgt_else.51149:
fbgt_cont.51150:
	j	fbgt_cont.51132
fbgt_else.51147:
fbgt_cont.51148:
	j	fbgt_cont.51132
fbgt_else.51145:
fbgt_cont.51146:
	j	fbgt_cont.51132
fbgt_else.51143:
fbgt_cont.51144:
	j	fbgt_cont.51132
fbgt_else.51141:
fbgt_cont.51142:
	j	fbgt_cont.51132
fbgt_else.51139:
fbgt_cont.51140:
	j	fbgt_cont.51132
fbgt_else.51137:
fbgt_cont.51138:
	j	fbgt_cont.51132
fbgt_else.51135:
fbgt_cont.51136:
	j	fbgt_cont.51132
fbgt_else.51133:
fbgt_cont.51134:
	j	fbgt_cont.51132
fbgt_else.51131:
	fmov	%f0, %f2
fbgt_cont.51132:
	fblt	%f19, %f2, fbgt_else.51151
	fblt	%f19, %f0, fbgt_else.51153
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.51152
	fblt	%f19, %f1, fbgt_else.51157
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
	j	fbgt_cont.51152
fbgt_else.51157:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
fbgt_cont.51158:
	j	fbgt_cont.51152
fbgt_else.51155:
fbgt_cont.51156:
	j	fbgt_cont.51152
fbgt_else.51153:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.51152
	fblt	%f19, %f1, fbgt_else.51161
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
	j	fbgt_cont.51152
fbgt_else.51161:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
fbgt_cont.51162:
	j	fbgt_cont.51152
fbgt_else.51159:
fbgt_cont.51160:
fbgt_cont.51154:
	j	fbgt_cont.51152
fbgt_else.51151:
fbgt_cont.51152:
	fblt	%f19, %f18, fbgt_else.51163
	add	%a0, %zero, %zero
	j	fbgt_cont.51164
fbgt_else.51163:
	add	%a0, %zero, %k1
fbgt_cont.51164:
	fblt	%f19, %f18, fbgt_else.51165
	fsub	%f19, %f19, %f18
	j	fbgt_cont.51166
fbgt_else.51165:
fbgt_cont.51166:
	fblt	%f19, %f21, fbgt_else.51167
	beqi	%a0, 0, bnei_else.51169
	add	%a0, %zero, %zero
	j	fbgt_cont.51168
bnei_else.51169:
	add	%a0, %zero, %k1
bnei_cont.51170:
	j	fbgt_cont.51168
fbgt_else.51167:
fbgt_cont.51168:
	fblt	%f19, %f21, fbgt_else.51171
	fsub	%f19, %f18, %f19
	j	fbgt_cont.51172
fbgt_else.51171:
fbgt_cont.51172:
	fblt	%f22, %f19, fbgt_else.51173
	fmul	%f18, %f19, %f19
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51174
fbgt_else.51173:
	fsub	%f19, %f21, %f19
	fmul	%f18, %f19, %f19
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f1, %f19, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51174:
	beqi	%a0, 0, bnei_else.51175
	j	bnei_cont.51176
bnei_else.51175:
	fneg	%f0, %f0
bnei_cont.51176:
	fmul	%f0, %f17, %f0
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	jal	read_object.2784
	addi	%v0, %zero, 0
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.51177
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_and_network.2792
	addi	%sp, %sp, -7
	j	bnei_cont.51178
bnei_else.51177:
bnei_cont.51178:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	addi	%s1, %v0, 0
	lw	%a0, 0(%s1)
	beqi	%a0, -1, bnei_else.51179
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_or_network.2790
	addi	%sp, %sp, -7
	sw	%s1, 0(%v0)
	j	bnei_cont.51180
bnei_else.51179:
	addi	%v1, %s1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
bnei_cont.51180:
	sw	%v0, 134(%zero)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %zero, 51
	jal	min_caml_print_char
	addi	%a1, %zero, 10
	addi	%v0, %a1, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%v0, 0(%sp)
	addi	%v1, %zero, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%a3, 0(%sp)
	blti	%a3, 10, bgti_else.51181
	blti	%a3, 20, bgti_else.51183
	blti	%a3, 30, bgti_else.51185
	blti	%a3, 40, bgti_else.51187
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51182
	blti	%a3, 20, bgti_else.51191
	blti	%a3, 30, bgti_else.51193
	blti	%a3, 40, bgti_else.51195
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51182
	blti	%a3, 20, bgti_else.51199
	blti	%a3, 30, bgti_else.51201
	blti	%a3, 40, bgti_else.51203
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51182
	blti	%a3, 20, bgti_else.51207
	blti	%a3, 30, bgti_else.51209
	blti	%a3, 40, bgti_else.51211
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.51182
bgti_else.51211:
	addi	%a3, %a3, -30
bgti_cont.51212:
	j	bgti_cont.51182
bgti_else.51209:
	addi	%a3, %a3, -20
bgti_cont.51210:
	j	bgti_cont.51182
bgti_else.51207:
	addi	%a3, %a3, -10
bgti_cont.51208:
	j	bgti_cont.51182
bgti_else.51205:
bgti_cont.51206:
	j	bgti_cont.51182
bgti_else.51203:
	addi	%a3, %a3, -30
bgti_cont.51204:
	j	bgti_cont.51182
bgti_else.51201:
	addi	%a3, %a3, -20
bgti_cont.51202:
	j	bgti_cont.51182
bgti_else.51199:
	addi	%a3, %a3, -10
bgti_cont.51200:
	j	bgti_cont.51182
bgti_else.51197:
bgti_cont.51198:
	j	bgti_cont.51182
bgti_else.51195:
	addi	%a3, %a3, -30
bgti_cont.51196:
	j	bgti_cont.51182
bgti_else.51193:
	addi	%a3, %a3, -20
bgti_cont.51194:
	j	bgti_cont.51182
bgti_else.51191:
	addi	%a3, %a3, -10
bgti_cont.51192:
	j	bgti_cont.51182
bgti_else.51189:
bgti_cont.51190:
	j	bgti_cont.51182
bgti_else.51187:
	addi	%a3, %a3, -30
bgti_cont.51188:
	j	bgti_cont.51182
bgti_else.51185:
	addi	%a3, %a3, -20
bgti_cont.51186:
	j	bgti_cont.51182
bgti_else.51183:
	addi	%a3, %a3, -10
bgti_cont.51184:
	j	bgti_cont.51182
bgti_else.51181:
bgti_cont.51182:
	blt	%zero, %a2, bgt_else.51213
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51214
bgt_else.51213:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.51215
	blti	%a2, 20, bgti_else.51217
	blti	%a2, 30, bgti_else.51219
	blti	%a2, 40, bgti_else.51221
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51216
	blti	%a2, 20, bgti_else.51225
	blti	%a2, 30, bgti_else.51227
	blti	%a2, 40, bgti_else.51229
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51216
	blti	%a2, 20, bgti_else.51233
	blti	%a2, 30, bgti_else.51235
	blti	%a2, 40, bgti_else.51237
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51216
	blti	%a2, 20, bgti_else.51241
	blti	%a2, 30, bgti_else.51243
	blti	%a2, 40, bgti_else.51245
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.51216
bgti_else.51245:
	addi	%a2, %a2, -30
bgti_cont.51246:
	j	bgti_cont.51216
bgti_else.51243:
	addi	%a2, %a2, -20
bgti_cont.51244:
	j	bgti_cont.51216
bgti_else.51241:
	addi	%a2, %a2, -10
bgti_cont.51242:
	j	bgti_cont.51216
bgti_else.51239:
bgti_cont.51240:
	j	bgti_cont.51216
bgti_else.51237:
	addi	%a2, %a2, -30
bgti_cont.51238:
	j	bgti_cont.51216
bgti_else.51235:
	addi	%a2, %a2, -20
bgti_cont.51236:
	j	bgti_cont.51216
bgti_else.51233:
	addi	%a2, %a2, -10
bgti_cont.51234:
	j	bgti_cont.51216
bgti_else.51231:
bgti_cont.51232:
	j	bgti_cont.51216
bgti_else.51229:
	addi	%a2, %a2, -30
bgti_cont.51230:
	j	bgti_cont.51216
bgti_else.51227:
	addi	%a2, %a2, -20
bgti_cont.51228:
	j	bgti_cont.51216
bgti_else.51225:
	addi	%a2, %a2, -10
bgti_cont.51226:
	j	bgti_cont.51216
bgti_else.51223:
bgti_cont.51224:
	j	bgti_cont.51216
bgti_else.51221:
	addi	%a2, %a2, -30
bgti_cont.51222:
	j	bgti_cont.51216
bgti_else.51219:
	addi	%a2, %a2, -20
bgti_cont.51220:
	j	bgti_cont.51216
bgti_else.51217:
	addi	%a2, %a2, -10
bgti_cont.51218:
	j	bgti_cont.51216
bgti_else.51215:
bgti_cont.51216:
	blt	%zero, %a0, bgt_else.51247
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51248
bgt_else.51247:
	blti	%a0, 10, bgti_else.51249
	blti	%a0, 20, bgti_else.51251
	blti	%a0, 30, bgti_else.51253
	blti	%a0, 40, bgti_else.51255
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51250
	blti	%a0, 20, bgti_else.51259
	blti	%a0, 30, bgti_else.51261
	blti	%a0, 40, bgti_else.51263
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51250
	blti	%a0, 20, bgti_else.51267
	blti	%a0, 30, bgti_else.51269
	blti	%a0, 40, bgti_else.51271
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51250
	blti	%a0, 20, bgti_else.51275
	blti	%a0, 30, bgti_else.51277
	blti	%a0, 40, bgti_else.51279
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.51250
bgti_else.51279:
	addi	%a0, %a0, -30
bgti_cont.51280:
	j	bgti_cont.51250
bgti_else.51277:
	addi	%a0, %a0, -20
bgti_cont.51278:
	j	bgti_cont.51250
bgti_else.51275:
	addi	%a0, %a0, -10
bgti_cont.51276:
	j	bgti_cont.51250
bgti_else.51273:
bgti_cont.51274:
	j	bgti_cont.51250
bgti_else.51271:
	addi	%a0, %a0, -30
bgti_cont.51272:
	j	bgti_cont.51250
bgti_else.51269:
	addi	%a0, %a0, -20
bgti_cont.51270:
	j	bgti_cont.51250
bgti_else.51267:
	addi	%a0, %a0, -10
bgti_cont.51268:
	j	bgti_cont.51250
bgti_else.51265:
bgti_cont.51266:
	j	bgti_cont.51250
bgti_else.51263:
	addi	%a0, %a0, -30
bgti_cont.51264:
	j	bgti_cont.51250
bgti_else.51261:
	addi	%a0, %a0, -20
bgti_cont.51262:
	j	bgti_cont.51250
bgti_else.51259:
	addi	%a0, %a0, -10
bgti_cont.51260:
	j	bgti_cont.51250
bgti_else.51257:
bgti_cont.51258:
	j	bgti_cont.51250
bgti_else.51255:
	addi	%a0, %a0, -30
bgti_cont.51256:
	j	bgti_cont.51250
bgti_else.51253:
	addi	%a0, %a0, -20
bgti_cont.51254:
	j	bgti_cont.51250
bgti_else.51251:
	addi	%a0, %a0, -10
bgti_cont.51252:
	j	bgti_cont.51250
bgti_else.51249:
bgti_cont.51250:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.51248:
bgt_cont.51214:
	addi	%a2, %zero, 32
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	addi	%v0, %a3, 0
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0
	blti	%a3, 10, bgti_else.51281
	blti	%a3, 20, bgti_else.51283
	blti	%a3, 30, bgti_else.51285
	blti	%a3, 40, bgti_else.51287
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51282
	blti	%a3, 20, bgti_else.51291
	blti	%a3, 30, bgti_else.51293
	blti	%a3, 40, bgti_else.51295
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51282
	blti	%a3, 20, bgti_else.51299
	blti	%a3, 30, bgti_else.51301
	blti	%a3, 40, bgti_else.51303
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51282
	blti	%a3, 20, bgti_else.51307
	blti	%a3, 30, bgti_else.51309
	blti	%a3, 40, bgti_else.51311
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.51282
bgti_else.51311:
	addi	%a3, %a3, -30
bgti_cont.51312:
	j	bgti_cont.51282
bgti_else.51309:
	addi	%a3, %a3, -20
bgti_cont.51310:
	j	bgti_cont.51282
bgti_else.51307:
	addi	%a3, %a3, -10
bgti_cont.51308:
	j	bgti_cont.51282
bgti_else.51305:
bgti_cont.51306:
	j	bgti_cont.51282
bgti_else.51303:
	addi	%a3, %a3, -30
bgti_cont.51304:
	j	bgti_cont.51282
bgti_else.51301:
	addi	%a3, %a3, -20
bgti_cont.51302:
	j	bgti_cont.51282
bgti_else.51299:
	addi	%a3, %a3, -10
bgti_cont.51300:
	j	bgti_cont.51282
bgti_else.51297:
bgti_cont.51298:
	j	bgti_cont.51282
bgti_else.51295:
	addi	%a3, %a3, -30
bgti_cont.51296:
	j	bgti_cont.51282
bgti_else.51293:
	addi	%a3, %a3, -20
bgti_cont.51294:
	j	bgti_cont.51282
bgti_else.51291:
	addi	%a3, %a3, -10
bgti_cont.51292:
	j	bgti_cont.51282
bgti_else.51289:
bgti_cont.51290:
	j	bgti_cont.51282
bgti_else.51287:
	addi	%a3, %a3, -30
bgti_cont.51288:
	j	bgti_cont.51282
bgti_else.51285:
	addi	%a3, %a3, -20
bgti_cont.51286:
	j	bgti_cont.51282
bgti_else.51283:
	addi	%a3, %a3, -10
bgti_cont.51284:
	j	bgti_cont.51282
bgti_else.51281:
bgti_cont.51282:
	blt	%zero, %k0, bgt_else.51313
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51314
bgt_else.51313:
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%k0, 10, bgti_else.51315
	blti	%k0, 20, bgti_else.51317
	blti	%k0, 30, bgti_else.51319
	blti	%k0, 40, bgti_else.51321
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51316
	blti	%k0, 20, bgti_else.51325
	blti	%k0, 30, bgti_else.51327
	blti	%k0, 40, bgti_else.51329
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51316
	blti	%k0, 20, bgti_else.51333
	blti	%k0, 30, bgti_else.51335
	blti	%k0, 40, bgti_else.51337
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51316
	blti	%k0, 20, bgti_else.51341
	blti	%k0, 30, bgti_else.51343
	blti	%k0, 40, bgti_else.51345
	addi	%v0, %k0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0
	j	bgti_cont.51316
bgti_else.51345:
	addi	%k0, %k0, -30
bgti_cont.51346:
	j	bgti_cont.51316
bgti_else.51343:
	addi	%k0, %k0, -20
bgti_cont.51344:
	j	bgti_cont.51316
bgti_else.51341:
	addi	%k0, %k0, -10
bgti_cont.51342:
	j	bgti_cont.51316
bgti_else.51339:
bgti_cont.51340:
	j	bgti_cont.51316
bgti_else.51337:
	addi	%k0, %k0, -30
bgti_cont.51338:
	j	bgti_cont.51316
bgti_else.51335:
	addi	%k0, %k0, -20
bgti_cont.51336:
	j	bgti_cont.51316
bgti_else.51333:
	addi	%k0, %k0, -10
bgti_cont.51334:
	j	bgti_cont.51316
bgti_else.51331:
bgti_cont.51332:
	j	bgti_cont.51316
bgti_else.51329:
	addi	%k0, %k0, -30
bgti_cont.51330:
	j	bgti_cont.51316
bgti_else.51327:
	addi	%k0, %k0, -20
bgti_cont.51328:
	j	bgti_cont.51316
bgti_else.51325:
	addi	%k0, %k0, -10
bgti_cont.51326:
	j	bgti_cont.51316
bgti_else.51323:
bgti_cont.51324:
	j	bgti_cont.51316
bgti_else.51321:
	addi	%k0, %k0, -30
bgti_cont.51322:
	j	bgti_cont.51316
bgti_else.51319:
	addi	%k0, %k0, -20
bgti_cont.51320:
	j	bgti_cont.51316
bgti_else.51317:
	addi	%k0, %k0, -10
bgti_cont.51318:
	j	bgti_cont.51316
bgti_else.51315:
bgti_cont.51316:
	blt	%zero, %a0, bgt_else.51347
	addi	%v0, %k0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51348
bgt_else.51347:
	blti	%a0, 10, bgti_else.51349
	blti	%a0, 20, bgti_else.51351
	blti	%a0, 30, bgti_else.51353
	blti	%a0, 40, bgti_else.51355
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51350
	blti	%a0, 20, bgti_else.51359
	blti	%a0, 30, bgti_else.51361
	blti	%a0, 40, bgti_else.51363
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51350
	blti	%a0, 20, bgti_else.51367
	blti	%a0, 30, bgti_else.51369
	blti	%a0, 40, bgti_else.51371
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51350
	blti	%a0, 20, bgti_else.51375
	blti	%a0, 30, bgti_else.51377
	blti	%a0, 40, bgti_else.51379
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.51350
bgti_else.51379:
	addi	%a0, %a0, -30
bgti_cont.51380:
	j	bgti_cont.51350
bgti_else.51377:
	addi	%a0, %a0, -20
bgti_cont.51378:
	j	bgti_cont.51350
bgti_else.51375:
	addi	%a0, %a0, -10
bgti_cont.51376:
	j	bgti_cont.51350
bgti_else.51373:
bgti_cont.51374:
	j	bgti_cont.51350
bgti_else.51371:
	addi	%a0, %a0, -30
bgti_cont.51372:
	j	bgti_cont.51350
bgti_else.51369:
	addi	%a0, %a0, -20
bgti_cont.51370:
	j	bgti_cont.51350
bgti_else.51367:
	addi	%a0, %a0, -10
bgti_cont.51368:
	j	bgti_cont.51350
bgti_else.51365:
bgti_cont.51366:
	j	bgti_cont.51350
bgti_else.51363:
	addi	%a0, %a0, -30
bgti_cont.51364:
	j	bgti_cont.51350
bgti_else.51361:
	addi	%a0, %a0, -20
bgti_cont.51362:
	j	bgti_cont.51350
bgti_else.51359:
	addi	%a0, %a0, -10
bgti_cont.51360:
	j	bgti_cont.51350
bgti_else.51357:
bgti_cont.51358:
	j	bgti_cont.51350
bgti_else.51355:
	addi	%a0, %a0, -30
bgti_cont.51356:
	j	bgti_cont.51350
bgti_else.51353:
	addi	%a0, %a0, -20
bgti_cont.51354:
	j	bgti_cont.51350
bgti_else.51351:
	addi	%a0, %a0, -10
bgti_cont.51352:
	j	bgti_cont.51350
bgti_else.51349:
bgti_cont.51350:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.51348:
bgt_cont.51314:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	jal	print_int_sub1.2641
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	blt	%zero, %a2, bgt_else.51381
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51382
bgt_else.51381:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.51383
	blti	%a2, 20, bgti_else.51385
	blti	%a2, 30, bgti_else.51387
	blti	%a2, 40, bgti_else.51389
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51384
	blti	%a2, 20, bgti_else.51393
	blti	%a2, 30, bgti_else.51395
	blti	%a2, 40, bgti_else.51397
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51384
	blti	%a2, 20, bgti_else.51401
	blti	%a2, 30, bgti_else.51403
	blti	%a2, 40, bgti_else.51405
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51384
	blti	%a2, 20, bgti_else.51409
	blti	%a2, 30, bgti_else.51411
	blti	%a2, 40, bgti_else.51413
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.51384
bgti_else.51413:
	addi	%a2, %a2, -30
bgti_cont.51414:
	j	bgti_cont.51384
bgti_else.51411:
	addi	%a2, %a2, -20
bgti_cont.51412:
	j	bgti_cont.51384
bgti_else.51409:
	addi	%a2, %a2, -10
bgti_cont.51410:
	j	bgti_cont.51384
bgti_else.51407:
bgti_cont.51408:
	j	bgti_cont.51384
bgti_else.51405:
	addi	%a2, %a2, -30
bgti_cont.51406:
	j	bgti_cont.51384
bgti_else.51403:
	addi	%a2, %a2, -20
bgti_cont.51404:
	j	bgti_cont.51384
bgti_else.51401:
	addi	%a2, %a2, -10
bgti_cont.51402:
	j	bgti_cont.51384
bgti_else.51399:
bgti_cont.51400:
	j	bgti_cont.51384
bgti_else.51397:
	addi	%a2, %a2, -30
bgti_cont.51398:
	j	bgti_cont.51384
bgti_else.51395:
	addi	%a2, %a2, -20
bgti_cont.51396:
	j	bgti_cont.51384
bgti_else.51393:
	addi	%a2, %a2, -10
bgti_cont.51394:
	j	bgti_cont.51384
bgti_else.51391:
bgti_cont.51392:
	j	bgti_cont.51384
bgti_else.51389:
	addi	%a2, %a2, -30
bgti_cont.51390:
	j	bgti_cont.51384
bgti_else.51387:
	addi	%a2, %a2, -20
bgti_cont.51388:
	j	bgti_cont.51384
bgti_else.51385:
	addi	%a2, %a2, -10
bgti_cont.51386:
	j	bgti_cont.51384
bgti_else.51383:
bgti_cont.51384:
	blt	%zero, %a0, bgt_else.51415
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51416
bgt_else.51415:
	blti	%a0, 10, bgti_else.51417
	blti	%a0, 20, bgti_else.51419
	blti	%a0, 30, bgti_else.51421
	blti	%a0, 40, bgti_else.51423
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51418
	blti	%a0, 20, bgti_else.51427
	blti	%a0, 30, bgti_else.51429
	blti	%a0, 40, bgti_else.51431
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51418
	blti	%a0, 20, bgti_else.51435
	blti	%a0, 30, bgti_else.51437
	blti	%a0, 40, bgti_else.51439
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51418
	blti	%a0, 20, bgti_else.51443
	blti	%a0, 30, bgti_else.51445
	blti	%a0, 40, bgti_else.51447
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.51418
bgti_else.51447:
	addi	%a0, %a0, -30
bgti_cont.51448:
	j	bgti_cont.51418
bgti_else.51445:
	addi	%a0, %a0, -20
bgti_cont.51446:
	j	bgti_cont.51418
bgti_else.51443:
	addi	%a0, %a0, -10
bgti_cont.51444:
	j	bgti_cont.51418
bgti_else.51441:
bgti_cont.51442:
	j	bgti_cont.51418
bgti_else.51439:
	addi	%a0, %a0, -30
bgti_cont.51440:
	j	bgti_cont.51418
bgti_else.51437:
	addi	%a0, %a0, -20
bgti_cont.51438:
	j	bgti_cont.51418
bgti_else.51435:
	addi	%a0, %a0, -10
bgti_cont.51436:
	j	bgti_cont.51418
bgti_else.51433:
bgti_cont.51434:
	j	bgti_cont.51418
bgti_else.51431:
	addi	%a0, %a0, -30
bgti_cont.51432:
	j	bgti_cont.51418
bgti_else.51429:
	addi	%a0, %a0, -20
bgti_cont.51430:
	j	bgti_cont.51418
bgti_else.51427:
	addi	%a0, %a0, -10
bgti_cont.51428:
	j	bgti_cont.51418
bgti_else.51425:
bgti_cont.51426:
	j	bgti_cont.51418
bgti_else.51423:
	addi	%a0, %a0, -30
bgti_cont.51424:
	j	bgti_cont.51418
bgti_else.51421:
	addi	%a0, %a0, -20
bgti_cont.51422:
	j	bgti_cont.51418
bgti_else.51419:
	addi	%a0, %a0, -10
bgti_cont.51420:
	j	bgti_cont.51418
bgti_else.51417:
bgti_cont.51418:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.51416:
bgt_cont.51382:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	addi	%a1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %a2, 0
	jal	min_caml_create_array
	sw	%v0, 183(%zero)
	lw	%t8, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %t8, 0
	jal	create_dirvec_elements.3102
	addi	%v0, %zero, 3
	jal	create_dirvecs.3105
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 460(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 438(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	jal	calc_dirvecs.3091
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	jal	calc_dirvec_rows.3096
	addi	%v1, %zero, 119
	addi	%v0, %t8, 0
	jal	init_dirvec_constants.3107
	addi	%v0, %zero, 3
	jal	init_vecset_constants.3110
	addi	%sp, %sp, -8
	flw	%f26, 78(%zero)
	fsw	%f26, 184(%zero)
	flw	%f27, 79(%zero)
	fsw	%f27, 185(%zero)
	flw	%f28, 80(%zero)
	fsw	%f28, 186(%zero)
	lw	%a0, 7(%sp)
	addi	%s5, %a0, -1
	blti	%s5, 0, bgti_else.51449
	lw	%a0, 12(%s5)
	lw	%a2, 9(%a0)
	lw	%k0, 6(%a0)
	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.51451
	beqi	%a0, 2, bnei_else.51453
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f20, 184(%zero)
	flw	%f18, 185(%zero)
	flw	%f16, 186(%zero)
	fmul	%f0, %f20, %f20
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	fmul	%f0, %f18, %f18
	flw	%f2, 1(%a1)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16
	flw	%f19, 2(%a1)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	beqi	%a3, 0, bnei_else.51455
	fmul	%f17, %f18, %f16
	flw	%f1, 0(%a2)
	fmul	%f1, %f17, %f1
	fadd	%f17, %f0, %f1
	fmul	%f1, %f16, %f20
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f20, %f18
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.51456
bnei_else.51455:
bnei_cont.51456:
	fmul	%f1, %f20, %f21
	fneg	%f24, %f1
	fmul	%f1, %f18, %f2
	fneg	%f22, %f1
	fmul	%f1, %f16, %f19
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%a3, 0, bnei_else.51457
	flw	%f21, 1(%a2)
	fmul	%f17, %f16, %f21
	flw	%f23, 2(%a2)
	fmul	%f1, %f18, %f23
	fadd	%f1, %f17, %f1
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f24, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%a2)
	fmul	%f16, %f16, %f17
	fmul	%f1, %f20, %f23
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f22, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f18, %f17
	fmul	%f1, %f20, %f21
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.51458
bnei_else.51457:
	fsw	%f24, 1(%v0)
	fsw	%f22, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.51458:
	fbne	%f0, %fzero, fbeq_else.51459
	add	%a0, %zero, %k1
	j	fbeq_cont.51460
fbeq_else.51459:
	add	%a0, %zero, %zero
fbeq_cont.51460:
	beqi	%a0, 0, bnei_else.51461
	j	bnei_cont.51462
bnei_else.51461:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.51462:
	sw	%v0, 187(%s5)
	j	bnei_cont.51452
bnei_else.51453:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f0, 184(%zero)
	flw	%f18, 0(%a1)
	fmul	%f1, %f0, %f18
	flw	%f0, 185(%zero)
	flw	%f17, 1(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 186(%zero)
	flw	%f16, 2(%a1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.51463
	add	%a0, %zero, %zero
	j	fbgt_cont.51464
fbgt_else.51463:
	add	%a0, %zero, %k1
fbgt_cont.51464:
	beqi	%a0, 0, bnei_else.51465
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.51466
bnei_else.51465:
	fsw	%fzero, 0(%v0)
bnei_cont.51466:
	sw	%v0, 187(%s5)
bnei_cont.51454:
	j	bnei_cont.51452
bnei_else.51451:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f1, 184(%zero)
	fbne	%f1, %fzero, fbeq_else.51467
	add	%a0, %zero, %k1
	j	fbeq_cont.51468
fbeq_else.51467:
	add	%a0, %zero, %zero
fbeq_cont.51468:
	beqi	%a0, 0, bnei_else.51469
	fsw	%fzero, 1(%v0)
	j	bnei_cont.51470
bnei_else.51469:
	fblt	%f1, %fzero, fbgt_else.51471
	add	%a0, %zero, %zero
	j	fbgt_cont.51472
fbgt_else.51471:
	add	%a0, %zero, %k1
fbgt_cont.51472:
	beqi	%k0, 0, bnei_else.51473
	beqi	%a0, 0, bnei_else.51475
	add	%a0, %zero, %zero
	j	bnei_cont.51474
bnei_else.51475:
	add	%a0, %zero, %k1
bnei_cont.51476:
	j	bnei_cont.51474
bnei_else.51473:
bnei_cont.51474:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.51477
	j	bnei_cont.51478
bnei_else.51477:
	fneg	%f0, %f0
bnei_cont.51478:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.51470:
	flw	%f1, 185(%zero)
	fbne	%f1, %fzero, fbeq_else.51479
	add	%a0, %zero, %k1
	j	fbeq_cont.51480
fbeq_else.51479:
	add	%a0, %zero, %zero
fbeq_cont.51480:
	beqi	%a0, 0, bnei_else.51481
	fsw	%fzero, 3(%v0)
	j	bnei_cont.51482
bnei_else.51481:
	fblt	%f1, %fzero, fbgt_else.51483
	add	%a0, %zero, %zero
	j	fbgt_cont.51484
fbgt_else.51483:
	add	%a0, %zero, %k1
fbgt_cont.51484:
	beqi	%k0, 0, bnei_else.51485
	beqi	%a0, 0, bnei_else.51487
	add	%a0, %zero, %zero
	j	bnei_cont.51486
bnei_else.51487:
	add	%a0, %zero, %k1
bnei_cont.51488:
	j	bnei_cont.51486
bnei_else.51485:
bnei_cont.51486:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.51489
	j	bnei_cont.51490
bnei_else.51489:
	fneg	%f0, %f0
bnei_cont.51490:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.51482:
	flw	%f1, 186(%zero)
	fbne	%f1, %fzero, fbeq_else.51491
	add	%a0, %zero, %k1
	j	fbeq_cont.51492
fbeq_else.51491:
	add	%a0, %zero, %zero
fbeq_cont.51492:
	beqi	%a0, 0, bnei_else.51493
	fsw	%fzero, 5(%v0)
	j	bnei_cont.51494
bnei_else.51493:
	fblt	%f1, %fzero, fbgt_else.51495
	add	%a0, %zero, %zero
	j	fbgt_cont.51496
fbgt_else.51495:
	add	%a0, %zero, %k1
fbgt_cont.51496:
	beqi	%k0, 0, bnei_else.51497
	beqi	%a0, 0, bnei_else.51499
	add	%a0, %zero, %zero
	j	bnei_cont.51498
bnei_else.51499:
	add	%a0, %zero, %k1
bnei_cont.51500:
	j	bnei_cont.51498
bnei_else.51497:
bnei_cont.51498:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.51501
	j	bnei_cont.51502
bnei_else.51501:
	fneg	%f0, %f0
bnei_cont.51502:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.51494:
	sw	%v0, 187(%s5)
bnei_cont.51452:
	addi	%v1, %s5, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	j	bgti_cont.51450
bgti_else.51449:
bgti_cont.51450:
	blti	%s5, 0, bgti_else.51503
	lw	%a1, 12(%s5)
	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	beqi	%a0, 2, bnei_else.51505
	j	bgti_cont.51504
bnei_else.51505:
	flw	%f0, 0(%a2)
	fblt	%f0, %f30, fbgt_else.51507
	add	%a0, %zero, %zero
	j	fbgt_cont.51508
fbgt_else.51507:
	add	%a0, %zero, %k1
fbgt_cont.51508:
	beqi	%a0, 0, bgti_cont.51504
	beqi	%a1, 1, bnei_else.51511
	beqi	%a1, 2, bnei_else.51513
	j	bgti_cont.51504
bnei_else.51513:
	sll	%a0, %s5, 2
	addi	%s6, %a0, 1
	lw	%s7, 434(%zero)
	fsub	%f29, %f30, %f0
	flw	%f17, 0(%a3)
	fmul	%f1, %f26, %f17
	flw	%f16, 1(%a3)
	fmul	%f0, %f27, %f16
	fadd	%f1, %f1, %f0
	flw	%f19, 2(%a3)
	fmul	%f0, %f28, %f19
	fadd	%f18, %f1, %f0
	flw	%f1, 495(%zero)
	fmul	%f0, %f1, %f17
	fmul	%f0, %f0, %f18
	fsub	%f17, %f0, %f26
	fmul	%f0, %f1, %f16
	fmul	%f0, %f0, %f18
	fsub	%f16, %f0, %f27
	fmul	%f0, %f1, %f19
	fmul	%f0, %f0, %f18
	fsub	%f1, %f0, %f28
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0
	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t7)
	sw	%a1, 0(%t7)
	fsw	%f17, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %s5, 0
	addi	%v0, %t7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%a0, %s7, 1
	sw	%a0, 434(%zero)
bnei_cont.51514:
	j	bgti_cont.51504
bnei_else.51511:
	sll	%s6, %s5, 2
	lw	%s7, 434(%zero)
	fsub	%f29, %f30, %f0
	fneg	%f0, %f26
	fsw	%f0, 8(%sp)
	fneg	%f0, %f27
	fsw	%f0, 9(%sp)
	fneg	%f3, %f28
	addi	%t7, %s6, 1
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t8)
	sw	%a1, 0(%t8)
	fsw	%f26, 0(%a1)
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%a1)
	fsw	%f3, 2(%a1)
	addi	%v1, %s5, 0
	addi	%v0, %t8, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t8, 1(%a0)
	sw	%t7, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%t7, %s7, 1
	addi	%t8, %s6, 2
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	add	%t9, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t9)
	sw	%a1, 0(%t9)
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a1)
	fsw	%f27, 1(%a1)
	fsw	%f3, 2(%a1)
	addi	%v1, %s5, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t9, 1(%a0)
	sw	%t8, 0(%a0)
	sw	%a0, 254(%t7)
	addi	%t7, %s7, 2
	addi	%s6, %s6, 3
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t8)
	sw	%a1, 0(%t8)
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a1)
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%a1)
	fsw	%f28, 2(%a1)
	addi	%v1, %s5, 0
	addi	%v0, %t8, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t8, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%t7)
	addi	%a0, %s7, 3
	sw	%a0, 434(%zero)
bnei_cont.51512:
	j	bgti_cont.51504
bnei_else.51509:
bnei_cont.51510:
bnei_cont.51506:
	j	bgti_cont.51504
bgti_else.51503:
bgti_cont.51504:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %zero, %a0
	itof	%f0, %a0
	fmul	%f17, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f17, %f0
	flw	%f0, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f16, %f17, %f1
	flw	%f1, 5(%sp)
	fadd	%f1, %f16, %f1
	flw	%f16, 170(%zero)
	fmul	%f17, %f17, %f16
	flw	%f16, 6(%sp)
	fadd	%f2, %f17, %f16
	lw	%a0, 0(%sp)
	addi	%v1, %a0, -1
	lw	%v0, 2(%sp)
	addi	%a0, %zero, 0
	addi	%sp, %sp, 10
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -10
	addi	%a2, %zero, 2
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 10
	jal	scan_line.3063
	addi	%sp, %sp, -10
	add	%g0, %zero, %zero
	ret
