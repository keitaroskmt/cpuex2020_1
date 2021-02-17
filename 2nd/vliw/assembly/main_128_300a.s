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
reduction_2pi_sub1.2626:
	fmov	%f16, %f0
	fmov	%f0, %f1
	fblt	%f16, %f0, fbgt_else.33181
	flw	%f1, 495(%zero)
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33182
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33183
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33184
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33185
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33186
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33187
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33188
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33189
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33190
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33191
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33192
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33193
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33194
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33195
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.33196
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16
	j	reduction_2pi_sub1.2626
fbgt_else.33196:
	jr	%ra
fbgt_else.33195:
	jr	%ra
fbgt_else.33194:
	jr	%ra
fbgt_else.33193:
	jr	%ra
fbgt_else.33192:
	jr	%ra
fbgt_else.33191:
	jr	%ra
fbgt_else.33190:
	jr	%ra
fbgt_else.33189:
	jr	%ra
fbgt_else.33188:
	jr	%ra
fbgt_else.33187:
	jr	%ra
fbgt_else.33186:
	jr	%ra
fbgt_else.33185:
	jr	%ra
fbgt_else.33184:
	jr	%ra
fbgt_else.33183:
	jr	%ra
fbgt_else.33182:
	jr	%ra
fbgt_else.33181:
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.33305
	fblt	%f0, %f1, fbgt_else.33306
	fsub	%f0, %f0, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33307
	fblt	%f0, %f1, fbgt_else.33308
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33309
	fblt	%f0, %f1, fbgt_else.33310
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33311
	fblt	%f0, %f1, fbgt_else.33312
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33312:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33311:
	jr	%ra
fbgt_else.33310:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33313
	fblt	%f0, %f1, fbgt_else.33314
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33314:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33313:
	jr	%ra
fbgt_else.33309:
	jr	%ra
fbgt_else.33308:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33315
	fblt	%f0, %f1, fbgt_else.33316
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33317
	fblt	%f0, %f1, fbgt_else.33318
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33318:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33317:
	jr	%ra
fbgt_else.33316:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33319
	fblt	%f0, %f1, fbgt_else.33320
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33320:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33319:
	jr	%ra
fbgt_else.33315:
	jr	%ra
fbgt_else.33307:
	jr	%ra
fbgt_else.33306:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33321
	fblt	%f0, %f1, fbgt_else.33322
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33323
	fblt	%f0, %f1, fbgt_else.33324
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33325
	fblt	%f0, %f1, fbgt_else.33326
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33326:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33325:
	jr	%ra
fbgt_else.33324:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33327
	fblt	%f0, %f1, fbgt_else.33328
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33328:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33327:
	jr	%ra
fbgt_else.33323:
	jr	%ra
fbgt_else.33322:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33329
	fblt	%f0, %f1, fbgt_else.33330
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33331
	fblt	%f0, %f1, fbgt_else.33332
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33332:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33331:
	jr	%ra
fbgt_else.33330:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.33333
	fblt	%f0, %f1, fbgt_else.33334
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33334:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.33333:
	jr	%ra
fbgt_else.33329:
	jr	%ra
fbgt_else.33321:
	jr	%ra
fbgt_else.33305:
	jr	%ra
print_int_sub1.2641:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.33401
	blti	%a0, 20, bgti_else.33402
	blti	%a0, 30, bgti_else.33403
	blti	%a0, 40, bgti_else.33404
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.33405
	blti	%a0, 20, bgti_else.33406
	blti	%a0, 30, bgti_else.33407
	blti	%a0, 40, bgti_else.33408
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.33409
	blti	%a0, 20, bgti_else.33410
	blti	%a0, 30, bgti_else.33411
	blti	%a0, 40, bgti_else.33412
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.33413
	blti	%a0, 20, bgti_else.33414
	blti	%a0, 30, bgti_else.33415
	blti	%a0, 40, bgti_else.33416
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2641
bgti_else.33416:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.33415:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.33414:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.33413:
	jr	%ra
bgti_else.33412:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.33411:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.33410:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.33409:
	jr	%ra
bgti_else.33408:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.33407:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.33406:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.33405:
	jr	%ra
bgti_else.33404:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.33403:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.33402:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.33401:
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.33531
	blti	%v0, 20, bgti_else.33532
	blti	%v0, 30, bgti_else.33533
	blti	%v0, 40, bgti_else.33534
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33535
	blti	%v0, 20, bgti_else.33536
	blti	%v0, 30, bgti_else.33537
	blti	%v0, 40, bgti_else.33538
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33539
	blti	%v0, 20, bgti_else.33540
	blti	%v0, 30, bgti_else.33541
	blti	%v0, 40, bgti_else.33542
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33543
	blti	%v0, 20, bgti_else.33544
	blti	%v0, 30, bgti_else.33545
	blti	%v0, 40, bgti_else.33546
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33547
	blti	%v0, 20, bgti_else.33548
	blti	%v0, 30, bgti_else.33549
	blti	%v0, 40, bgti_else.33550
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33551
	blti	%v0, 20, bgti_else.33552
	blti	%v0, 30, bgti_else.33553
	blti	%v0, 40, bgti_else.33554
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33555
	blti	%v0, 20, bgti_else.33556
	blti	%v0, 30, bgti_else.33557
	blti	%v0, 40, bgti_else.33558
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33559
	blti	%v0, 20, bgti_else.33560
	blti	%v0, 30, bgti_else.33561
	blti	%v0, 40, bgti_else.33562
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.33562:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33561:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33560:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33559:
	jr	%ra
bgti_else.33558:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33557:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33556:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33555:
	jr	%ra
bgti_else.33554:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33553:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33552:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33551:
	jr	%ra
bgti_else.33550:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33549:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33548:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33547:
	jr	%ra
bgti_else.33546:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33545:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33544:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33543:
	jr	%ra
bgti_else.33542:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33541:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33540:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33539:
	jr	%ra
bgti_else.33538:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33537:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33536:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33535:
	jr	%ra
bgti_else.33534:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33533:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33532:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33531:
	jr	%ra
rotate_quadratic_matrix.2779:
	add	%a0, %zero, %ra
	flw	%f18, 0(%v1)
	flw	%f19, 494(%zero)
	fabs	%f17, %f18
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.33978
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.33979
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.33979
fbgt_else.34002:
fbgt_cont.34003:
	j	fbgt_cont.33979
fbgt_else.34000:
fbgt_cont.34001:
	j	fbgt_cont.33979
fbgt_else.33998:
fbgt_cont.33999:
	j	fbgt_cont.33979
fbgt_else.33996:
fbgt_cont.33997:
	j	fbgt_cont.33979
fbgt_else.33994:
fbgt_cont.33995:
	j	fbgt_cont.33979
fbgt_else.33992:
fbgt_cont.33993:
	j	fbgt_cont.33979
fbgt_else.33990:
fbgt_cont.33991:
	j	fbgt_cont.33979
fbgt_else.33988:
fbgt_cont.33989:
	j	fbgt_cont.33979
fbgt_else.33986:
fbgt_cont.33987:
	j	fbgt_cont.33979
fbgt_else.33984:
fbgt_cont.33985:
	j	fbgt_cont.33979
fbgt_else.33982:
fbgt_cont.33983:
	j	fbgt_cont.33979
fbgt_else.33980:
fbgt_cont.33981:
	j	fbgt_cont.33979
fbgt_else.33978:
	fmov	%f1, %f2
fbgt_cont.33979:
	fblt	%f17, %f2, fbgt_else.34004
	fblt	%f17, %f1, fbgt_else.34006
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.34005
fbgt_else.34006:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.34007:
	j	fbgt_cont.34005
fbgt_else.34004:
fbgt_cont.34005:
	fblt	%f17, %f19, fbgt_else.34008
	add	%a1, %zero, %zero
	j	fbgt_cont.34009
fbgt_else.34008:
	add	%a1, %zero, %k1
fbgt_cont.34009:
	fblt	%f17, %f19, fbgt_else.34010
	fsub	%f17, %f17, %f19
	j	fbgt_cont.34011
fbgt_else.34010:
fbgt_cont.34011:
	flw	%f20, 479(%zero)
	fblt	%f17, %f20, fbgt_else.34012
	beqi	%a1, 0, bnei_else.34014
	add	%a1, %zero, %zero
	j	fbgt_cont.34013
bnei_else.34014:
	add	%a1, %zero, %k1
bnei_cont.34015:
	j	fbgt_cont.34013
fbgt_else.34012:
fbgt_cont.34013:
	fblt	%f17, %f20, fbgt_else.34016
	fsub	%f17, %f19, %f17
	j	fbgt_cont.34017
fbgt_else.34016:
fbgt_cont.34017:
	flw	%f21, 478(%zero)
	fblt	%f21, %f17, fbgt_else.34018
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
	j	fbgt_cont.34019
fbgt_else.34018:
	fsub	%f22, %f20, %f17
	fmul	%f17, %f22, %f22
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.34019:
	beqi	%a1, 0, bnei_else.34020
	j	bnei_cont.34021
bnei_else.34020:
	fneg	%f17, %f17
bnei_cont.34021:
	fblt	%f18, %fzero, fbgt_else.34022
	add	%a1, %zero, %k1
	j	fbgt_cont.34023
fbgt_else.34022:
	add	%a1, %zero, %zero
fbgt_cont.34023:
	fabs	%f18, %f18
	fblt	%f18, %f2, fbgt_else.34024
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 481(%zero)
	fblt	%f18, %f1, fbgt_cont.34025
	flw	%f1, 480(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34025
fbgt_else.34048:
fbgt_cont.34049:
	j	fbgt_cont.34025
fbgt_else.34046:
fbgt_cont.34047:
	j	fbgt_cont.34025
fbgt_else.34044:
fbgt_cont.34045:
	j	fbgt_cont.34025
fbgt_else.34042:
fbgt_cont.34043:
	j	fbgt_cont.34025
fbgt_else.34040:
fbgt_cont.34041:
	j	fbgt_cont.34025
fbgt_else.34038:
fbgt_cont.34039:
	j	fbgt_cont.34025
fbgt_else.34036:
fbgt_cont.34037:
	j	fbgt_cont.34025
fbgt_else.34034:
fbgt_cont.34035:
	j	fbgt_cont.34025
fbgt_else.34032:
fbgt_cont.34033:
	j	fbgt_cont.34025
fbgt_else.34030:
fbgt_cont.34031:
	j	fbgt_cont.34025
fbgt_else.34028:
fbgt_cont.34029:
	j	fbgt_cont.34025
fbgt_else.34026:
fbgt_cont.34027:
	j	fbgt_cont.34025
fbgt_else.34024:
	fmov	%f1, %f2
fbgt_cont.34025:
	fblt	%f18, %f2, fbgt_else.34050
	fblt	%f18, %f1, fbgt_else.34052
	fsub	%f0, %f18, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.34051
fbgt_else.34052:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.34053:
	j	fbgt_cont.34051
fbgt_else.34050:
fbgt_cont.34051:
	fblt	%f18, %f19, fbgt_else.34054
	beqi	%a1, 0, bnei_else.34056
	add	%a1, %zero, %zero
	j	fbgt_cont.34055
bnei_else.34056:
	add	%a1, %zero, %k1
bnei_cont.34057:
	j	fbgt_cont.34055
fbgt_else.34054:
fbgt_cont.34055:
	fblt	%f18, %f19, fbgt_else.34058
	fsub	%f18, %f18, %f19
	j	fbgt_cont.34059
fbgt_else.34058:
fbgt_cont.34059:
	fblt	%f18, %f20, fbgt_else.34060
	fsub	%f18, %f19, %f18
	j	fbgt_cont.34061
fbgt_else.34060:
fbgt_cont.34061:
	fblt	%f21, %f18, fbgt_else.34062
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
	j	fbgt_cont.34063
fbgt_else.34062:
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
fbgt_cont.34063:
	beqi	%a1, 0, bnei_else.34064
	j	bnei_cont.34065
bnei_else.34064:
	fneg	%f18, %f18
bnei_cont.34065:
	flw	%f23, 1(%v1)
	fabs	%f22, %f23
	fblt	%f22, %f2, fbgt_else.34066
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 481(%zero)
	fblt	%f22, %f1, fbgt_cont.34067
	flw	%f1, 480(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34067
fbgt_else.34090:
fbgt_cont.34091:
	j	fbgt_cont.34067
fbgt_else.34088:
fbgt_cont.34089:
	j	fbgt_cont.34067
fbgt_else.34086:
fbgt_cont.34087:
	j	fbgt_cont.34067
fbgt_else.34084:
fbgt_cont.34085:
	j	fbgt_cont.34067
fbgt_else.34082:
fbgt_cont.34083:
	j	fbgt_cont.34067
fbgt_else.34080:
fbgt_cont.34081:
	j	fbgt_cont.34067
fbgt_else.34078:
fbgt_cont.34079:
	j	fbgt_cont.34067
fbgt_else.34076:
fbgt_cont.34077:
	j	fbgt_cont.34067
fbgt_else.34074:
fbgt_cont.34075:
	j	fbgt_cont.34067
fbgt_else.34072:
fbgt_cont.34073:
	j	fbgt_cont.34067
fbgt_else.34070:
fbgt_cont.34071:
	j	fbgt_cont.34067
fbgt_else.34068:
fbgt_cont.34069:
	j	fbgt_cont.34067
fbgt_else.34066:
	fmov	%f1, %f2
fbgt_cont.34067:
	fblt	%f22, %f2, fbgt_else.34092
	fblt	%f22, %f1, fbgt_else.34094
	fsub	%f0, %f22, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.34093
fbgt_else.34094:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.34095:
	j	fbgt_cont.34093
fbgt_else.34092:
fbgt_cont.34093:
	fblt	%f22, %f19, fbgt_else.34096
	add	%a1, %zero, %zero
	j	fbgt_cont.34097
fbgt_else.34096:
	add	%a1, %zero, %k1
fbgt_cont.34097:
	fblt	%f22, %f19, fbgt_else.34098
	fsub	%f22, %f22, %f19
	j	fbgt_cont.34099
fbgt_else.34098:
fbgt_cont.34099:
	fblt	%f22, %f20, fbgt_else.34100
	beqi	%a1, 0, bnei_else.34102
	add	%a1, %zero, %zero
	j	fbgt_cont.34101
bnei_else.34102:
	add	%a1, %zero, %k1
bnei_cont.34103:
	j	fbgt_cont.34101
fbgt_else.34100:
fbgt_cont.34101:
	fblt	%f22, %f20, fbgt_else.34104
	fsub	%f22, %f19, %f22
	j	fbgt_cont.34105
fbgt_else.34104:
fbgt_cont.34105:
	fblt	%f21, %f22, fbgt_else.34106
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
	j	fbgt_cont.34107
fbgt_else.34106:
	fsub	%f24, %f20, %f22
	fmul	%f16, %f24, %f24
	fmul	%f22, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f22
	fsub	%f22, %f1, %f0
fbgt_cont.34107:
	beqi	%a1, 0, bnei_else.34108
	j	bnei_cont.34109
bnei_else.34108:
	fneg	%f22, %f22
bnei_cont.34109:
	fblt	%f23, %fzero, fbgt_else.34110
	add	%a1, %zero, %k1
	j	fbgt_cont.34111
fbgt_else.34110:
	add	%a1, %zero, %zero
fbgt_cont.34111:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.34112
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 481(%zero)
	fblt	%f23, %f1, fbgt_cont.34113
	flw	%f1, 480(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34113
fbgt_else.34136:
fbgt_cont.34137:
	j	fbgt_cont.34113
fbgt_else.34134:
fbgt_cont.34135:
	j	fbgt_cont.34113
fbgt_else.34132:
fbgt_cont.34133:
	j	fbgt_cont.34113
fbgt_else.34130:
fbgt_cont.34131:
	j	fbgt_cont.34113
fbgt_else.34128:
fbgt_cont.34129:
	j	fbgt_cont.34113
fbgt_else.34126:
fbgt_cont.34127:
	j	fbgt_cont.34113
fbgt_else.34124:
fbgt_cont.34125:
	j	fbgt_cont.34113
fbgt_else.34122:
fbgt_cont.34123:
	j	fbgt_cont.34113
fbgt_else.34120:
fbgt_cont.34121:
	j	fbgt_cont.34113
fbgt_else.34118:
fbgt_cont.34119:
	j	fbgt_cont.34113
fbgt_else.34116:
fbgt_cont.34117:
	j	fbgt_cont.34113
fbgt_else.34114:
fbgt_cont.34115:
	j	fbgt_cont.34113
fbgt_else.34112:
	fmov	%f1, %f2
fbgt_cont.34113:
	fblt	%f23, %f2, fbgt_else.34138
	fblt	%f23, %f1, fbgt_else.34140
	fsub	%f0, %f23, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.34139
fbgt_else.34140:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.34141:
	j	fbgt_cont.34139
fbgt_else.34138:
fbgt_cont.34139:
	fblt	%f23, %f19, fbgt_else.34142
	beqi	%a1, 0, bnei_else.34144
	add	%a1, %zero, %zero
	j	fbgt_cont.34143
bnei_else.34144:
	add	%a1, %zero, %k1
bnei_cont.34145:
	j	fbgt_cont.34143
fbgt_else.34142:
fbgt_cont.34143:
	fblt	%f23, %f19, fbgt_else.34146
	fsub	%f23, %f23, %f19
	j	fbgt_cont.34147
fbgt_else.34146:
fbgt_cont.34147:
	fblt	%f23, %f20, fbgt_else.34148
	fsub	%f23, %f19, %f23
	j	fbgt_cont.34149
fbgt_else.34148:
fbgt_cont.34149:
	fblt	%f21, %f23, fbgt_else.34150
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
	j	fbgt_cont.34151
fbgt_else.34150:
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
fbgt_cont.34151:
	beqi	%a1, 0, bnei_else.34152
	j	bnei_cont.34153
bnei_else.34152:
	fneg	%f23, %f23
bnei_cont.34153:
	flw	%f25, 2(%v1)
	fabs	%f24, %f25
	fblt	%f24, %f2, fbgt_else.34154
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 481(%zero)
	fblt	%f24, %f1, fbgt_cont.34155
	flw	%f1, 480(%zero)
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34155
fbgt_else.34178:
fbgt_cont.34179:
	j	fbgt_cont.34155
fbgt_else.34176:
fbgt_cont.34177:
	j	fbgt_cont.34155
fbgt_else.34174:
fbgt_cont.34175:
	j	fbgt_cont.34155
fbgt_else.34172:
fbgt_cont.34173:
	j	fbgt_cont.34155
fbgt_else.34170:
fbgt_cont.34171:
	j	fbgt_cont.34155
fbgt_else.34168:
fbgt_cont.34169:
	j	fbgt_cont.34155
fbgt_else.34166:
fbgt_cont.34167:
	j	fbgt_cont.34155
fbgt_else.34164:
fbgt_cont.34165:
	j	fbgt_cont.34155
fbgt_else.34162:
fbgt_cont.34163:
	j	fbgt_cont.34155
fbgt_else.34160:
fbgt_cont.34161:
	j	fbgt_cont.34155
fbgt_else.34158:
fbgt_cont.34159:
	j	fbgt_cont.34155
fbgt_else.34156:
fbgt_cont.34157:
	j	fbgt_cont.34155
fbgt_else.34154:
	fmov	%f1, %f2
fbgt_cont.34155:
	fblt	%f24, %f2, fbgt_else.34180
	fblt	%f24, %f1, fbgt_else.34182
	fsub	%f0, %f24, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
	j	fbgt_cont.34181
fbgt_else.34182:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
fbgt_cont.34183:
	j	fbgt_cont.34181
fbgt_else.34180:
fbgt_cont.34181:
	fblt	%f24, %f19, fbgt_else.34184
	add	%a1, %zero, %zero
	j	fbgt_cont.34185
fbgt_else.34184:
	add	%a1, %zero, %k1
fbgt_cont.34185:
	fblt	%f24, %f19, fbgt_else.34186
	fsub	%f24, %f24, %f19
	j	fbgt_cont.34187
fbgt_else.34186:
fbgt_cont.34187:
	fblt	%f24, %f20, fbgt_else.34188
	beqi	%a1, 0, bnei_else.34190
	add	%a1, %zero, %zero
	j	fbgt_cont.34189
bnei_else.34190:
	add	%a1, %zero, %k1
bnei_cont.34191:
	j	fbgt_cont.34189
fbgt_else.34188:
fbgt_cont.34189:
	fblt	%f24, %f20, fbgt_else.34192
	fsub	%f24, %f19, %f24
	j	fbgt_cont.34193
fbgt_else.34192:
fbgt_cont.34193:
	fblt	%f21, %f24, fbgt_else.34194
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
	j	fbgt_cont.34195
fbgt_else.34194:
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
fbgt_cont.34195:
	beqi	%a1, 0, bnei_else.34196
	j	bnei_cont.34197
bnei_else.34196:
	fneg	%f24, %f24
bnei_cont.34197:
	fblt	%f25, %fzero, fbgt_else.34198
	add	%a1, %zero, %k1
	j	fbgt_cont.34199
fbgt_else.34198:
	add	%a1, %zero, %zero
fbgt_cont.34199:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.34200
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 481(%zero)
	fblt	%f25, %f1, fbgt_cont.34201
	flw	%f1, 480(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34201
fbgt_else.34224:
fbgt_cont.34225:
	j	fbgt_cont.34201
fbgt_else.34222:
fbgt_cont.34223:
	j	fbgt_cont.34201
fbgt_else.34220:
fbgt_cont.34221:
	j	fbgt_cont.34201
fbgt_else.34218:
fbgt_cont.34219:
	j	fbgt_cont.34201
fbgt_else.34216:
fbgt_cont.34217:
	j	fbgt_cont.34201
fbgt_else.34214:
fbgt_cont.34215:
	j	fbgt_cont.34201
fbgt_else.34212:
fbgt_cont.34213:
	j	fbgt_cont.34201
fbgt_else.34210:
fbgt_cont.34211:
	j	fbgt_cont.34201
fbgt_else.34208:
fbgt_cont.34209:
	j	fbgt_cont.34201
fbgt_else.34206:
fbgt_cont.34207:
	j	fbgt_cont.34201
fbgt_else.34204:
fbgt_cont.34205:
	j	fbgt_cont.34201
fbgt_else.34202:
fbgt_cont.34203:
	j	fbgt_cont.34201
fbgt_else.34200:
	fmov	%f1, %f2
fbgt_cont.34201:
	fblt	%f25, %f2, fbgt_else.34226
	fblt	%f25, %f1, fbgt_else.34228
	fsub	%f0, %f25, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.34227
fbgt_else.34228:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.34229:
	j	fbgt_cont.34227
fbgt_else.34226:
fbgt_cont.34227:
	fblt	%f25, %f19, fbgt_else.34230
	beqi	%a1, 0, bnei_else.34232
	add	%a1, %zero, %zero
	j	fbgt_cont.34231
bnei_else.34232:
	add	%a1, %zero, %k1
bnei_cont.34233:
	j	fbgt_cont.34231
fbgt_else.34230:
fbgt_cont.34231:
	fblt	%f25, %f19, fbgt_else.34234
	fsub	%f25, %f25, %f19
	j	fbgt_cont.34235
fbgt_else.34234:
fbgt_cont.34235:
	fblt	%f25, %f20, fbgt_else.34236
	fsub	%f25, %f19, %f25
	j	fbgt_cont.34237
fbgt_else.34236:
fbgt_cont.34237:
	fblt	%f21, %f25, fbgt_else.34238
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
	j	fbgt_cont.34239
fbgt_else.34238:
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
fbgt_cont.34239:
	beqi	%a1, 0, bnei_else.34240
	j	bnei_cont.34241
bnei_else.34240:
	fneg	%f0, %f0
bnei_cont.34241:
	fmul	%f1, %f22, %f24
	fmul	%f2, %f18, %f23
	fmul	%f19, %f2, %f24
	fmul	%f16, %f17, %f0
	fsub	%f20, %f19, %f16
	fmul	%f21, %f17, %f23
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0
	fmul	%f2, %f2, %f0
	fmul	%f19, %f17, %f24
	fadd	%f2, %f2, %f19
	fmul	%f19, %f21, %f0
	fmul	%f0, %f18, %f24
	fsub	%f24, %f19, %f0
	fneg	%f23, %f23
	fmul	%f19, %f18, %f22
	fmul	%f22, %f17, %f22
	flw	%f18, 0(%v0)
	flw	%f27, 1(%v0)
	flw	%f26, 2(%v0)
	fmul	%f0, %f1, %f1
	fmul	%f17, %f18, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 0(%v0)
	fmul	%f0, %f20, %f20
	fmul	%f17, %f18, %f0
	fmul	%f0, %f2, %f2
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f16, %f16
	fmul	%f17, %f18, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 2(%v0)
	flw	%f21, 495(%zero)
	fmul	%f0, %f18, %f20
	fmul	%f17, %f0, %f16
	fmul	%f0, %f27, %f2
	fmul	%f0, %f0, %f24
	fadd	%f17, %f17, %f0
	fmul	%f0, %f26, %f19
	fmul	%f0, %f0, %f22
	fadd	%f0, %f17, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 0(%v1)
	fmul	%f18, %f18, %f1
	fmul	%f1, %f18, %f16
	fmul	%f17, %f27, %f25
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f23
	fmul	%f0, %f16, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 1(%v1)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f17, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f19
	fadd	%f0, %f1, %f0
	fmul	%f0, %f21, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2782:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.34690
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
	fblt	%f0, %fzero, fbgt_else.34691
	add	%s4, %zero, %zero
	j	fbgt_cont.34692
fbgt_else.34691:
	add	%s4, %zero, %k1
fbgt_cont.34692:
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
	beqi	%s0, 0, bnei_else.34693
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
	j	bnei_cont.34694
bnei_else.34693:
bnei_cont.34694:
	beqi	%a3, 2, bnei_else.34695
	add	%s7, %zero, %s4
	j	bnei_cont.34696
bnei_else.34695:
	add	%s7, %zero, %k1
bnei_cont.34696:
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
	beqi	%a3, 3, bnei_else.34697
	beqi	%a3, 2, bnei_else.34699
	j	bnei_cont.34698
bnei_else.34699:
	beqi	%s4, 0, bnei_else.34701
	add	%a0, %zero, %zero
	j	bnei_cont.34702
bnei_else.34701:
	add	%a0, %zero, %k1
bnei_cont.34702:
	flw	%f18, 0(%s2)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s2)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s2)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.34703
	add	%a2, %zero, %k1
	j	fbeq_cont.34704
fbeq_else.34703:
	add	%a2, %zero, %zero
fbeq_cont.34704:
	beqi	%a2, 0, bnei_else.34705
	fmov	%f0, %f30
	j	bnei_cont.34706
bnei_else.34705:
	beqi	%a0, 0, bnei_else.34707
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34708
bnei_else.34707:
	fdiv	%f0, %f30, %f1
bnei_cont.34708:
bnei_cont.34706:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s2)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s2)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s2)
bnei_cont.34700:
	j	bnei_cont.34698
bnei_else.34697:
	flw	%f1, 0(%s2)
	fbne	%f1, %fzero, fbeq_else.34709
	add	%a0, %zero, %k1
	j	fbeq_cont.34710
fbeq_else.34709:
	add	%a0, %zero, %zero
fbeq_cont.34710:
	beqi	%a0, 0, bnei_else.34711
	fmov	%f0, %fzero
	j	bnei_cont.34712
bnei_else.34711:
	fbne	%f1, %fzero, fbeq_else.34713
	add	%a0, %zero, %k1
	j	fbeq_cont.34714
fbeq_else.34713:
	add	%a0, %zero, %zero
fbeq_cont.34714:
	beqi	%a0, 0, bnei_else.34715
	fmov	%f0, %fzero
	j	bnei_cont.34716
bnei_else.34715:
	fblt	%fzero, %f1, fbgt_else.34717
	add	%a0, %zero, %zero
	j	fbgt_cont.34718
fbgt_else.34717:
	add	%a0, %zero, %k1
fbgt_cont.34718:
	beqi	%a0, 0, bnei_else.34719
	fmov	%f0, %f30
	j	bnei_cont.34720
bnei_else.34719:
	flw	%f0, 468(%zero)
bnei_cont.34720:
bnei_cont.34716:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34712:
	fsw	%f0, 0(%s2)
	flw	%f1, 1(%s2)
	fbne	%f1, %fzero, fbeq_else.34721
	add	%a0, %zero, %k1
	j	fbeq_cont.34722
fbeq_else.34721:
	add	%a0, %zero, %zero
fbeq_cont.34722:
	beqi	%a0, 0, bnei_else.34723
	fmov	%f0, %fzero
	j	bnei_cont.34724
bnei_else.34723:
	fbne	%f1, %fzero, fbeq_else.34725
	add	%a0, %zero, %k1
	j	fbeq_cont.34726
fbeq_else.34725:
	add	%a0, %zero, %zero
fbeq_cont.34726:
	beqi	%a0, 0, bnei_else.34727
	fmov	%f0, %fzero
	j	bnei_cont.34728
bnei_else.34727:
	fblt	%fzero, %f1, fbgt_else.34729
	add	%a0, %zero, %zero
	j	fbgt_cont.34730
fbgt_else.34729:
	add	%a0, %zero, %k1
fbgt_cont.34730:
	beqi	%a0, 0, bnei_else.34731
	fmov	%f0, %f30
	j	bnei_cont.34732
bnei_else.34731:
	flw	%f0, 468(%zero)
bnei_cont.34732:
bnei_cont.34728:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34724:
	fsw	%f0, 1(%s2)
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.34733
	add	%a0, %zero, %k1
	j	fbeq_cont.34734
fbeq_else.34733:
	add	%a0, %zero, %zero
fbeq_cont.34734:
	beqi	%a0, 0, bnei_else.34735
	fmov	%f0, %fzero
	j	bnei_cont.34736
bnei_else.34735:
	fbne	%f1, %fzero, fbeq_else.34737
	add	%a0, %zero, %k1
	j	fbeq_cont.34738
fbeq_else.34737:
	add	%a0, %zero, %zero
fbeq_cont.34738:
	beqi	%a0, 0, bnei_else.34739
	fmov	%f0, %fzero
	j	bnei_cont.34740
bnei_else.34739:
	fblt	%fzero, %f1, fbgt_else.34741
	add	%a0, %zero, %zero
	j	fbgt_cont.34742
fbgt_else.34741:
	add	%a0, %zero, %k1
fbgt_cont.34742:
	beqi	%a0, 0, bnei_else.34743
	fmov	%f0, %f30
	j	bnei_cont.34744
bnei_else.34743:
	flw	%f0, 468(%zero)
bnei_cont.34744:
bnei_cont.34740:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.34736:
	fsw	%f0, 2(%s2)
bnei_cont.34698:
	beqi	%s0, 0, bnei_else.34745
	flw	%f18, 0(%s1)
	flw	%f19, 494(%zero)
	fabs	%f17, %f18
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.34747
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.34748
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34748
fbgt_else.34769:
fbgt_cont.34770:
	j	fbgt_cont.34748
fbgt_else.34767:
fbgt_cont.34768:
	j	fbgt_cont.34748
fbgt_else.34765:
fbgt_cont.34766:
	j	fbgt_cont.34748
fbgt_else.34763:
fbgt_cont.34764:
	j	fbgt_cont.34748
fbgt_else.34761:
fbgt_cont.34762:
	j	fbgt_cont.34748
fbgt_else.34759:
fbgt_cont.34760:
	j	fbgt_cont.34748
fbgt_else.34757:
fbgt_cont.34758:
	j	fbgt_cont.34748
fbgt_else.34755:
fbgt_cont.34756:
	j	fbgt_cont.34748
fbgt_else.34753:
fbgt_cont.34754:
	j	fbgt_cont.34748
fbgt_else.34751:
fbgt_cont.34752:
	j	fbgt_cont.34748
fbgt_else.34749:
fbgt_cont.34750:
	j	fbgt_cont.34748
fbgt_else.34747:
	fmov	%f1, %f2
fbgt_cont.34748:
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34771
	add	%a0, %zero, %zero
	j	fbgt_cont.34772
fbgt_else.34771:
	add	%a0, %zero, %k1
fbgt_cont.34772:
	fblt	%f0, %f19, fbgt_else.34773
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34774
fbgt_else.34773:
fbgt_cont.34774:
	flw	%f20, 479(%zero)
	fblt	%f0, %f20, fbgt_else.34775
	beqi	%a0, 0, bnei_else.34777
	add	%a0, %zero, %zero
	j	fbgt_cont.34776
bnei_else.34777:
	add	%a0, %zero, %k1
bnei_cont.34778:
	j	fbgt_cont.34776
fbgt_else.34775:
fbgt_cont.34776:
	fblt	%f0, %f20, fbgt_else.34779
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34780
fbgt_else.34779:
fbgt_cont.34780:
	flw	%f21, 478(%zero)
	fblt	%f21, %f0, fbgt_else.34781
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
	j	fbgt_cont.34782
fbgt_else.34781:
	fsub	%f22, %f20, %f0
	fmul	%f17, %f22, %f22
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.34782:
	beqi	%a0, 0, bnei_else.34783
	j	bnei_cont.34784
bnei_else.34783:
	fneg	%f17, %f17
bnei_cont.34784:
	fblt	%f18, %fzero, fbgt_else.34785
	add	%a0, %zero, %k1
	j	fbgt_cont.34786
fbgt_else.34785:
	add	%a0, %zero, %zero
fbgt_cont.34786:
	fabs	%f18, %f18
	fblt	%f18, %f2, fbgt_else.34787
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.34788
	flw	%f1, 481(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34788
fbgt_else.34809:
fbgt_cont.34810:
	j	fbgt_cont.34788
fbgt_else.34807:
fbgt_cont.34808:
	j	fbgt_cont.34788
fbgt_else.34805:
fbgt_cont.34806:
	j	fbgt_cont.34788
fbgt_else.34803:
fbgt_cont.34804:
	j	fbgt_cont.34788
fbgt_else.34801:
fbgt_cont.34802:
	j	fbgt_cont.34788
fbgt_else.34799:
fbgt_cont.34800:
	j	fbgt_cont.34788
fbgt_else.34797:
fbgt_cont.34798:
	j	fbgt_cont.34788
fbgt_else.34795:
fbgt_cont.34796:
	j	fbgt_cont.34788
fbgt_else.34793:
fbgt_cont.34794:
	j	fbgt_cont.34788
fbgt_else.34791:
fbgt_cont.34792:
	j	fbgt_cont.34788
fbgt_else.34789:
fbgt_cont.34790:
	j	fbgt_cont.34788
fbgt_else.34787:
	fmov	%f1, %f2
fbgt_cont.34788:
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34811
	beqi	%a0, 0, bnei_else.34813
	add	%a0, %zero, %zero
	j	fbgt_cont.34812
bnei_else.34813:
	add	%a0, %zero, %k1
bnei_cont.34814:
	j	fbgt_cont.34812
fbgt_else.34811:
fbgt_cont.34812:
	fblt	%f0, %f19, fbgt_else.34815
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34816
fbgt_else.34815:
fbgt_cont.34816:
	fblt	%f0, %f20, fbgt_else.34817
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34818
fbgt_else.34817:
fbgt_cont.34818:
	fblt	%f21, %f0, fbgt_else.34819
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
	j	fbgt_cont.34820
fbgt_else.34819:
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
fbgt_cont.34820:
	beqi	%a0, 0, bnei_else.34821
	j	bnei_cont.34822
bnei_else.34821:
	fneg	%f18, %f18
bnei_cont.34822:
	flw	%f23, 1(%s1)
	fabs	%f22, %f23
	fblt	%f22, %f2, fbgt_else.34823
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.34824
	flw	%f1, 481(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34824
fbgt_else.34845:
fbgt_cont.34846:
	j	fbgt_cont.34824
fbgt_else.34843:
fbgt_cont.34844:
	j	fbgt_cont.34824
fbgt_else.34841:
fbgt_cont.34842:
	j	fbgt_cont.34824
fbgt_else.34839:
fbgt_cont.34840:
	j	fbgt_cont.34824
fbgt_else.34837:
fbgt_cont.34838:
	j	fbgt_cont.34824
fbgt_else.34835:
fbgt_cont.34836:
	j	fbgt_cont.34824
fbgt_else.34833:
fbgt_cont.34834:
	j	fbgt_cont.34824
fbgt_else.34831:
fbgt_cont.34832:
	j	fbgt_cont.34824
fbgt_else.34829:
fbgt_cont.34830:
	j	fbgt_cont.34824
fbgt_else.34827:
fbgt_cont.34828:
	j	fbgt_cont.34824
fbgt_else.34825:
fbgt_cont.34826:
	j	fbgt_cont.34824
fbgt_else.34823:
	fmov	%f1, %f2
fbgt_cont.34824:
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34847
	add	%a0, %zero, %zero
	j	fbgt_cont.34848
fbgt_else.34847:
	add	%a0, %zero, %k1
fbgt_cont.34848:
	fblt	%f0, %f19, fbgt_else.34849
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34850
fbgt_else.34849:
fbgt_cont.34850:
	fblt	%f0, %f20, fbgt_else.34851
	beqi	%a0, 0, bnei_else.34853
	add	%a0, %zero, %zero
	j	fbgt_cont.34852
bnei_else.34853:
	add	%a0, %zero, %k1
bnei_cont.34854:
	j	fbgt_cont.34852
fbgt_else.34851:
fbgt_cont.34852:
	fblt	%f0, %f20, fbgt_else.34855
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34856
fbgt_else.34855:
fbgt_cont.34856:
	fblt	%f21, %f0, fbgt_else.34857
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
	j	fbgt_cont.34858
fbgt_else.34857:
	fsub	%f24, %f20, %f0
	fmul	%f16, %f24, %f24
	fmul	%f22, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f22
	fsub	%f22, %f1, %f0
fbgt_cont.34858:
	beqi	%a0, 0, bnei_else.34859
	j	bnei_cont.34860
bnei_else.34859:
	fneg	%f22, %f22
bnei_cont.34860:
	fblt	%f23, %fzero, fbgt_else.34861
	add	%a0, %zero, %k1
	j	fbgt_cont.34862
fbgt_else.34861:
	add	%a0, %zero, %zero
fbgt_cont.34862:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.34863
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.34864
	flw	%f1, 481(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34864
fbgt_else.34885:
fbgt_cont.34886:
	j	fbgt_cont.34864
fbgt_else.34883:
fbgt_cont.34884:
	j	fbgt_cont.34864
fbgt_else.34881:
fbgt_cont.34882:
	j	fbgt_cont.34864
fbgt_else.34879:
fbgt_cont.34880:
	j	fbgt_cont.34864
fbgt_else.34877:
fbgt_cont.34878:
	j	fbgt_cont.34864
fbgt_else.34875:
fbgt_cont.34876:
	j	fbgt_cont.34864
fbgt_else.34873:
fbgt_cont.34874:
	j	fbgt_cont.34864
fbgt_else.34871:
fbgt_cont.34872:
	j	fbgt_cont.34864
fbgt_else.34869:
fbgt_cont.34870:
	j	fbgt_cont.34864
fbgt_else.34867:
fbgt_cont.34868:
	j	fbgt_cont.34864
fbgt_else.34865:
fbgt_cont.34866:
	j	fbgt_cont.34864
fbgt_else.34863:
	fmov	%f1, %f2
fbgt_cont.34864:
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34887
	beqi	%a0, 0, bnei_else.34889
	add	%a0, %zero, %zero
	j	fbgt_cont.34888
bnei_else.34889:
	add	%a0, %zero, %k1
bnei_cont.34890:
	j	fbgt_cont.34888
fbgt_else.34887:
fbgt_cont.34888:
	fblt	%f0, %f19, fbgt_else.34891
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34892
fbgt_else.34891:
fbgt_cont.34892:
	fblt	%f0, %f20, fbgt_else.34893
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34894
fbgt_else.34893:
fbgt_cont.34894:
	fblt	%f21, %f0, fbgt_else.34895
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
	j	fbgt_cont.34896
fbgt_else.34895:
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
fbgt_cont.34896:
	beqi	%a0, 0, bnei_else.34897
	j	bnei_cont.34898
bnei_else.34897:
	fneg	%f23, %f23
bnei_cont.34898:
	flw	%f25, 2(%s1)
	fabs	%f24, %f25
	fblt	%f24, %f2, fbgt_else.34899
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.34900
	flw	%f1, 481(%zero)
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34900
fbgt_else.34921:
fbgt_cont.34922:
	j	fbgt_cont.34900
fbgt_else.34919:
fbgt_cont.34920:
	j	fbgt_cont.34900
fbgt_else.34917:
fbgt_cont.34918:
	j	fbgt_cont.34900
fbgt_else.34915:
fbgt_cont.34916:
	j	fbgt_cont.34900
fbgt_else.34913:
fbgt_cont.34914:
	j	fbgt_cont.34900
fbgt_else.34911:
fbgt_cont.34912:
	j	fbgt_cont.34900
fbgt_else.34909:
fbgt_cont.34910:
	j	fbgt_cont.34900
fbgt_else.34907:
fbgt_cont.34908:
	j	fbgt_cont.34900
fbgt_else.34905:
fbgt_cont.34906:
	j	fbgt_cont.34900
fbgt_else.34903:
fbgt_cont.34904:
	j	fbgt_cont.34900
fbgt_else.34901:
fbgt_cont.34902:
	j	fbgt_cont.34900
fbgt_else.34899:
	fmov	%f1, %f2
fbgt_cont.34900:
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34923
	add	%a0, %zero, %zero
	j	fbgt_cont.34924
fbgt_else.34923:
	add	%a0, %zero, %k1
fbgt_cont.34924:
	fblt	%f0, %f19, fbgt_else.34925
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34926
fbgt_else.34925:
fbgt_cont.34926:
	fblt	%f0, %f20, fbgt_else.34927
	beqi	%a0, 0, bnei_else.34929
	add	%a0, %zero, %zero
	j	fbgt_cont.34928
bnei_else.34929:
	add	%a0, %zero, %k1
bnei_cont.34930:
	j	fbgt_cont.34928
fbgt_else.34927:
fbgt_cont.34928:
	fblt	%f0, %f20, fbgt_else.34931
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34932
fbgt_else.34931:
fbgt_cont.34932:
	fblt	%f21, %f0, fbgt_else.34933
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
	j	fbgt_cont.34934
fbgt_else.34933:
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
fbgt_cont.34934:
	beqi	%a0, 0, bnei_else.34935
	j	bnei_cont.34936
bnei_else.34935:
	fneg	%f24, %f24
bnei_cont.34936:
	fblt	%f25, %fzero, fbgt_else.34937
	add	%a0, %zero, %k1
	j	fbgt_cont.34938
fbgt_else.34937:
	add	%a0, %zero, %zero
fbgt_cont.34938:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.34939
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.34940
	flw	%f1, 481(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.34940
fbgt_else.34961:
fbgt_cont.34962:
	j	fbgt_cont.34940
fbgt_else.34959:
fbgt_cont.34960:
	j	fbgt_cont.34940
fbgt_else.34957:
fbgt_cont.34958:
	j	fbgt_cont.34940
fbgt_else.34955:
fbgt_cont.34956:
	j	fbgt_cont.34940
fbgt_else.34953:
fbgt_cont.34954:
	j	fbgt_cont.34940
fbgt_else.34951:
fbgt_cont.34952:
	j	fbgt_cont.34940
fbgt_else.34949:
fbgt_cont.34950:
	j	fbgt_cont.34940
fbgt_else.34947:
fbgt_cont.34948:
	j	fbgt_cont.34940
fbgt_else.34945:
fbgt_cont.34946:
	j	fbgt_cont.34940
fbgt_else.34943:
fbgt_cont.34944:
	j	fbgt_cont.34940
fbgt_else.34941:
fbgt_cont.34942:
	j	fbgt_cont.34940
fbgt_else.34939:
	fmov	%f1, %f2
fbgt_cont.34940:
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f19, fbgt_else.34963
	beqi	%a0, 0, bnei_else.34965
	add	%a0, %zero, %zero
	j	fbgt_cont.34964
bnei_else.34965:
	add	%a0, %zero, %k1
bnei_cont.34966:
	j	fbgt_cont.34964
fbgt_else.34963:
fbgt_cont.34964:
	fblt	%f0, %f19, fbgt_else.34967
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34968
fbgt_else.34967:
fbgt_cont.34968:
	fblt	%f0, %f20, fbgt_else.34969
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34970
fbgt_else.34969:
fbgt_cont.34970:
	fblt	%f21, %f0, fbgt_else.34971
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
	j	fbgt_cont.34972
fbgt_else.34971:
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
fbgt_cont.34972:
	beqi	%a0, 0, bnei_else.34973
	j	bnei_cont.34974
bnei_else.34973:
	fneg	%f0, %f0
bnei_cont.34974:
	fmul	%f1, %f22, %f24
	fmul	%f2, %f18, %f23
	fmul	%f19, %f2, %f24
	fmul	%f16, %f17, %f0
	fsub	%f20, %f19, %f16
	fmul	%f21, %f17, %f23
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0
	fmul	%f2, %f2, %f0
	fmul	%f19, %f17, %f24
	fadd	%f2, %f2, %f19
	fmul	%f19, %f21, %f0
	fmul	%f0, %f18, %f24
	fsub	%f24, %f19, %f0
	fneg	%f23, %f23
	fmul	%f19, %f18, %f22
	fmul	%f22, %f17, %f22
	flw	%f18, 0(%s2)
	flw	%f27, 1(%s2)
	flw	%f26, 2(%s2)
	fmul	%f0, %f1, %f1
	fmul	%f17, %f18, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 0(%s2)
	fmul	%f0, %f20, %f20
	fmul	%f17, %f18, %f0
	fmul	%f0, %f2, %f2
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%s2)
	fmul	%f0, %f16, %f16
	fmul	%f17, %f18, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 2(%s2)
	flw	%f21, 495(%zero)
	fmul	%f0, %f18, %f20
	fmul	%f17, %f0, %f16
	fmul	%f0, %f27, %f2
	fmul	%f0, %f0, %f24
	fadd	%f17, %f17, %f0
	fmul	%f0, %f26, %f19
	fmul	%f0, %f0, %f22
	fadd	%f0, %f17, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 0(%s1)
	fmul	%f18, %f18, %f1
	fmul	%f1, %f18, %f16
	fmul	%f17, %f27, %f25
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f23
	fmul	%f0, %f16, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 1(%s1)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f17, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f19
	fadd	%f0, %f1, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 2(%s1)
	j	bnei_cont.34746
bnei_else.34745:
bnei_cont.34746:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.34690:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	jr	%ra
read_object.2784:
	add	%a2, %zero, %v0
	add	%t7, %zero, %ra
	blti	%a2, 60, bgti_else.35096
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.35096:
	jal	min_caml_read_int
	addi	%a0, %v0, 0
	beqi	%a0, -1, bnei_else.35098
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
	fblt	%f0, %fzero, fbgt_else.35100
	add	%s3, %zero, %zero
	j	fbgt_cont.35101
fbgt_else.35100:
	add	%s3, %zero, %k1
fbgt_cont.35101:
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
	beqi	%k0, 0, bnei_else.35102
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
	j	bnei_cont.35103
bnei_else.35102:
bnei_cont.35103:
	beqi	%a1, 2, bnei_else.35104
	add	%s6, %zero, %s3
	j	bnei_cont.35105
bnei_else.35104:
	add	%s6, %zero, %k1
bnei_cont.35105:
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
	beqi	%a1, 3, bnei_else.35106
	beqi	%a1, 2, bnei_else.35108
	j	bnei_cont.35107
bnei_else.35108:
	beqi	%s3, 0, bnei_else.35110
	add	%a0, %zero, %zero
	j	bnei_cont.35111
bnei_else.35110:
	add	%a0, %zero, %k1
bnei_cont.35111:
	flw	%f18, 0(%s1)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s1)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s1)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35112
	add	%a1, %zero, %k1
	j	fbeq_cont.35113
fbeq_else.35112:
	add	%a1, %zero, %zero
fbeq_cont.35113:
	beqi	%a1, 0, bnei_else.35114
	fmov	%f0, %f30
	j	bnei_cont.35115
bnei_else.35114:
	beqi	%a0, 0, bnei_else.35116
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35117
bnei_else.35116:
	fdiv	%f0, %f30, %f1
bnei_cont.35117:
bnei_cont.35115:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s1)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s1)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s1)
bnei_cont.35109:
	j	bnei_cont.35107
bnei_else.35106:
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.35118
	add	%a0, %zero, %k1
	j	fbeq_cont.35119
fbeq_else.35118:
	add	%a0, %zero, %zero
fbeq_cont.35119:
	beqi	%a0, 0, bnei_else.35120
	fmov	%f0, %fzero
	j	bnei_cont.35121
bnei_else.35120:
	fbne	%f1, %fzero, fbeq_else.35122
	add	%a0, %zero, %k1
	j	fbeq_cont.35123
fbeq_else.35122:
	add	%a0, %zero, %zero
fbeq_cont.35123:
	beqi	%a0, 0, bnei_else.35124
	fmov	%f0, %fzero
	j	bnei_cont.35125
bnei_else.35124:
	fblt	%fzero, %f1, fbgt_else.35126
	add	%a0, %zero, %zero
	j	fbgt_cont.35127
fbgt_else.35126:
	add	%a0, %zero, %k1
fbgt_cont.35127:
	beqi	%a0, 0, bnei_else.35128
	fmov	%f0, %f30
	j	bnei_cont.35129
bnei_else.35128:
	flw	%f0, 468(%zero)
bnei_cont.35129:
bnei_cont.35125:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.35121:
	fsw	%f0, 0(%s1)
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.35130
	add	%a0, %zero, %k1
	j	fbeq_cont.35131
fbeq_else.35130:
	add	%a0, %zero, %zero
fbeq_cont.35131:
	beqi	%a0, 0, bnei_else.35132
	fmov	%f0, %fzero
	j	bnei_cont.35133
bnei_else.35132:
	fbne	%f1, %fzero, fbeq_else.35134
	add	%a0, %zero, %k1
	j	fbeq_cont.35135
fbeq_else.35134:
	add	%a0, %zero, %zero
fbeq_cont.35135:
	beqi	%a0, 0, bnei_else.35136
	fmov	%f0, %fzero
	j	bnei_cont.35137
bnei_else.35136:
	fblt	%fzero, %f1, fbgt_else.35138
	add	%a0, %zero, %zero
	j	fbgt_cont.35139
fbgt_else.35138:
	add	%a0, %zero, %k1
fbgt_cont.35139:
	beqi	%a0, 0, bnei_else.35140
	fmov	%f0, %f30
	j	bnei_cont.35141
bnei_else.35140:
	flw	%f0, 468(%zero)
bnei_cont.35141:
bnei_cont.35137:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.35133:
	fsw	%f0, 1(%s1)
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.35142
	add	%a0, %zero, %k1
	j	fbeq_cont.35143
fbeq_else.35142:
	add	%a0, %zero, %zero
fbeq_cont.35143:
	beqi	%a0, 0, bnei_else.35144
	fmov	%f0, %fzero
	j	bnei_cont.35145
bnei_else.35144:
	fbne	%f1, %fzero, fbeq_else.35146
	add	%a0, %zero, %k1
	j	fbeq_cont.35147
fbeq_else.35146:
	add	%a0, %zero, %zero
fbeq_cont.35147:
	beqi	%a0, 0, bnei_else.35148
	fmov	%f0, %fzero
	j	bnei_cont.35149
bnei_else.35148:
	fblt	%fzero, %f1, fbgt_else.35150
	add	%a0, %zero, %zero
	j	fbgt_cont.35151
fbgt_else.35150:
	add	%a0, %zero, %k1
fbgt_cont.35151:
	beqi	%a0, 0, bnei_else.35152
	fmov	%f0, %f30
	j	bnei_cont.35153
bnei_else.35152:
	flw	%f0, 468(%zero)
bnei_cont.35153:
bnei_cont.35149:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.35145:
	fsw	%f0, 2(%s1)
bnei_cont.35107:
	beqi	%k0, 0, bnei_else.35154
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	rotate_quadratic_matrix.2779
	j	bnei_cont.35155
bnei_else.35154:
bnei_cont.35155:
	add	%a0, %zero, %k1
	j	bnei_cont.35099
bnei_else.35098:
	add	%a0, %zero, %zero
bnei_cont.35099:
	beqi	%a0, 0, bnei_else.35156
	addi	%t8, %a2, 1
	blti	%t8, 60, bgti_else.35157
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.35157:
	addi	%v0, %t8, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.35159
	addi	%v0, %t8, 1
	add	%ra, %zero, %t7
	j	read_object.2784
bnei_else.35159:
	add	%ra, %zero, %t7
	sw	%t8, 0(%zero)
	jr	%ra
bnei_else.35156:
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
	beqi	%t0, -1, bnei_else.35232
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.35233
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.35235
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.35237
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2788
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.35238
bnei_else.35237:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.35238:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.35236
bnei_else.35235:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.35236:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.35234
bnei_else.35233:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.35234:
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
bnei_else.35232:
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
	beqi	%a2, -1, bnei_else.35314
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.35316
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.35318
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2788
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%s0, 2(%v1)
	j	bnei_cont.35319
bnei_else.35318:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.35319:
	sw	%k0, 1(%v1)
	j	bnei_cont.35317
bnei_else.35316:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.35317:
	sw	%a2, 0(%v1)
	j	bnei_cont.35315
bnei_else.35314:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.35315:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.35320
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.35321
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.35323
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2788
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%k0, 1(%t1)
	j	bnei_cont.35324
bnei_else.35323:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.35324:
	sw	%a2, 0(%t1)
	j	bnei_cont.35322
bnei_else.35321:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.35322:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.35325
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2790
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.35326
bnei_else.35325:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.35326:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.35320:
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
	beqi	%k0, -1, bnei_else.35379
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.35381
	jal	min_caml_read_int
	addi	%s2, %v0, 0
	beqi	%s2, -1, bnei_else.35383
	addi	%v0, %zero, 3
	jal	read_net_item.2788
	sw	%s2, 2(%v0)
	j	bnei_cont.35384
bnei_else.35383:
	addi	%v0, %zero, 3
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.35384:
	sw	%s1, 1(%v0)
	j	bnei_cont.35382
bnei_else.35381:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.35382:
	sw	%k0, 0(%v0)
	j	bnei_cont.35380
bnei_else.35379:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.35380:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35385
	sw	%v0, 83(%a2)
	addi	%s1, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.35386
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.35388
	addi	%v0, %zero, 2
	jal	read_net_item.2788
	sw	%k0, 1(%v0)
	j	bnei_cont.35389
bnei_else.35388:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.35389:
	sw	%a2, 0(%v0)
	j	bnei_cont.35387
bnei_else.35386:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.35387:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35390
	sw	%v0, 83(%s1)
	addi	%k0, %s1, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.35391
	addi	%v0, %k1, 0
	jal	read_net_item.2788
	sw	%a2, 0(%v0)
	j	bnei_cont.35392
bnei_else.35391:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.35392:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35393
	sw	%v0, 83(%k0)
	addi	%a2, %k0, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2788
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35394
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2792
bnei_else.35394:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.35393:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.35390:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.35385:
	add	%ra, %zero, %a3
	jr	%ra
iter_setup_dirvec_constants.2889:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.35581
	lw	%k0, 12(%a1)
	lw	%s0, 1(%a0)
	lw	%s1, 0(%a0)
	lw	%a3, 1(%k0)
	beqi	%a3, 1, bnei_else.35582
	beqi	%a3, 2, bnei_else.35584
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f19, 0(%s1)
	flw	%f2, 1(%s1)
	flw	%f24, 2(%s1)
	fmul	%f1, %f19, %f19
	lw	%a3, 4(%k0)
	flw	%f0, 0(%a3)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	lw	%a3, 4(%k0)
	flw	%f0, 1(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f24, %f24
	lw	%a3, 4(%k0)
	flw	%f0, 2(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a3, 3(%k0)
	beqi	%a3, 0, bnei_else.35586
	fmul	%f16, %f2, %f24
	lw	%a3, 9(%k0)
	flw	%f1, 0(%a3)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f19
	lw	%a3, 9(%k0)
	flw	%f0, 1(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f2
	lw	%a3, 9(%k0)
	flw	%f0, 2(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35587
bnei_else.35586:
bnei_cont.35587:
	lw	%a3, 4(%k0)
	flw	%f1, 0(%a3)
	fmul	%f1, %f19, %f1
	fneg	%f17, %f1
	lw	%a3, 4(%k0)
	flw	%f1, 1(%a3)
	fmul	%f1, %f2, %f1
	fneg	%f21, %f1
	lw	%a3, 4(%k0)
	flw	%f1, 2(%a3)
	fmul	%f1, %f24, %f1
	fneg	%f20, %f1
	fsw	%f0, 0(%v0)
	lw	%a3, 3(%k0)
	beqi	%a3, 0, bnei_else.35588
	lw	%a3, 9(%k0)
	flw	%f22, 1(%a3)
	fmul	%f16, %f24, %f22
	lw	%a3, 9(%k0)
	flw	%f18, 2(%a3)
	fmul	%f1, %f2, %f18
	fadd	%f1, %f16, %f1
	flw	%f23, 473(%zero)
	fmul	%f1, %f1, %f23
	fsub	%f1, %f17, %f1
	fsw	%f1, 1(%v0)
	lw	%a3, 9(%k0)
	flw	%f17, 0(%a3)
	fmul	%f16, %f24, %f17
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f23
	fsub	%f1, %f21, %f1
	fsw	%f1, 2(%v0)
	fmul	%f16, %f2, %f17
	fmul	%f1, %f19, %f22
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f23
	fsub	%f1, %f20, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.35589
bnei_else.35588:
	fsw	%f17, 1(%v0)
	fsw	%f21, 2(%v0)
	fsw	%f20, 3(%v0)
bnei_cont.35589:
	fbne	%f0, %fzero, fbeq_else.35590
	add	%a3, %zero, %k1
	j	fbeq_cont.35591
fbeq_else.35590:
	add	%a3, %zero, %zero
fbeq_cont.35591:
	beqi	%a3, 0, bnei_else.35592
	j	bnei_cont.35593
bnei_else.35592:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35593:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.35583
bnei_else.35584:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%s1)
	lw	%a3, 4(%k0)
	flw	%f18, 0(%a3)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%s1)
	lw	%a3, 4(%k0)
	flw	%f17, 1(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s1)
	lw	%a3, 4(%k0)
	flw	%f16, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.35594
	add	%a3, %zero, %zero
	j	fbgt_cont.35595
fbgt_else.35594:
	add	%a3, %zero, %k1
fbgt_cont.35595:
	beqi	%a3, 0, bnei_else.35596
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
	j	bnei_cont.35597
bnei_else.35596:
	fsw	%fzero, 0(%v0)
bnei_cont.35597:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
bnei_cont.35585:
	j	bnei_cont.35583
bnei_else.35582:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.35598
	add	%a3, %zero, %k1
	j	fbeq_cont.35599
fbeq_else.35598:
	add	%a3, %zero, %zero
fbeq_cont.35599:
	beqi	%a3, 0, bnei_else.35600
	fsw	%fzero, 1(%v0)
	j	bnei_cont.35601
bnei_else.35600:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35602
	add	%a3, %zero, %zero
	j	fbgt_cont.35603
fbgt_else.35602:
	add	%a3, %zero, %k1
fbgt_cont.35603:
	beqi	%ra, 0, bnei_else.35604
	beqi	%a3, 0, bnei_else.35606
	add	%a3, %zero, %zero
	j	bnei_cont.35605
bnei_else.35606:
	add	%a3, %zero, %k1
bnei_cont.35607:
	j	bnei_cont.35605
bnei_else.35604:
bnei_cont.35605:
	lw	%ra, 4(%k0)
	flw	%f0, 0(%ra)
	beqi	%a3, 0, bnei_else.35608
	j	bnei_cont.35609
bnei_else.35608:
	fneg	%f0, %f0
bnei_cont.35609:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.35601:
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.35610
	add	%a3, %zero, %k1
	j	fbeq_cont.35611
fbeq_else.35610:
	add	%a3, %zero, %zero
fbeq_cont.35611:
	beqi	%a3, 0, bnei_else.35612
	fsw	%fzero, 3(%v0)
	j	bnei_cont.35613
bnei_else.35612:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35614
	add	%a3, %zero, %zero
	j	fbgt_cont.35615
fbgt_else.35614:
	add	%a3, %zero, %k1
fbgt_cont.35615:
	beqi	%ra, 0, bnei_else.35616
	beqi	%a3, 0, bnei_else.35618
	add	%a3, %zero, %zero
	j	bnei_cont.35617
bnei_else.35618:
	add	%a3, %zero, %k1
bnei_cont.35619:
	j	bnei_cont.35617
bnei_else.35616:
bnei_cont.35617:
	lw	%ra, 4(%k0)
	flw	%f0, 1(%ra)
	beqi	%a3, 0, bnei_else.35620
	j	bnei_cont.35621
bnei_else.35620:
	fneg	%f0, %f0
bnei_cont.35621:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.35613:
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.35622
	add	%a3, %zero, %k1
	j	fbeq_cont.35623
fbeq_else.35622:
	add	%a3, %zero, %zero
fbeq_cont.35623:
	beqi	%a3, 0, bnei_else.35624
	fsw	%fzero, 5(%v0)
	j	bnei_cont.35625
bnei_else.35624:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35626
	add	%a3, %zero, %zero
	j	fbgt_cont.35627
fbgt_else.35626:
	add	%a3, %zero, %k1
fbgt_cont.35627:
	beqi	%ra, 0, bnei_else.35628
	beqi	%a3, 0, bnei_else.35630
	add	%a3, %zero, %zero
	j	bnei_cont.35629
bnei_else.35630:
	add	%a3, %zero, %k1
bnei_cont.35631:
	j	bnei_cont.35629
bnei_else.35628:
bnei_cont.35629:
	lw	%k0, 4(%k0)
	flw	%f0, 2(%k0)
	beqi	%a3, 0, bnei_else.35632
	j	bnei_cont.35633
bnei_else.35632:
	fneg	%f0, %f0
bnei_cont.35633:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.35625:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
bnei_cont.35583:
	addi	%a3, %a1, -1
	blti	%a3, 0, bgti_else.35634
	lw	%k0, 12(%a3)
	lw	%s0, 1(%a0)
	lw	%s1, 0(%a0)
	lw	%a1, 1(%k0)
	beqi	%a1, 1, bnei_else.35635
	beqi	%a1, 2, bnei_else.35637
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f18, 0(%s1)
	flw	%f19, 1(%s1)
	flw	%f21, 2(%s1)
	fmul	%f1, %f18, %f18
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a1, 3(%k0)
	beqi	%a1, 0, bnei_else.35639
	fmul	%f16, %f19, %f21
	lw	%a1, 9(%k0)
	flw	%f1, 0(%a1)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18
	lw	%a1, 9(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f18, %f19
	lw	%a1, 9(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35640
bnei_else.35639:
bnei_cont.35640:
	lw	%a1, 4(%k0)
	flw	%f1, 0(%a1)
	fmul	%f1, %f18, %f1
	fneg	%f22, %f1
	lw	%a1, 4(%k0)
	flw	%f1, 1(%a1)
	fmul	%f1, %f19, %f1
	fneg	%f20, %f1
	lw	%a1, 4(%k0)
	flw	%f1, 2(%a1)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 3(%k0)
	beqi	%a1, 0, bnei_else.35641
	lw	%a1, 9(%k0)
	flw	%f1, 1(%a1)
	fmul	%f16, %f21, %f1
	lw	%a1, 9(%k0)
	flw	%f1, 2(%a1)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a1, 9(%k0)
	flw	%f1, 0(%a1)
	fmul	%f16, %f21, %f1
	lw	%a1, 9(%k0)
	flw	%f1, 2(%a1)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a1, 9(%k0)
	flw	%f1, 0(%a1)
	fmul	%f16, %f19, %f1
	lw	%a1, 9(%k0)
	flw	%f1, 1(%a1)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.35642
bnei_else.35641:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.35642:
	fbne	%f0, %fzero, fbeq_else.35643
	add	%a1, %zero, %k1
	j	fbeq_cont.35644
fbeq_else.35643:
	add	%a1, %zero, %zero
fbeq_cont.35644:
	beqi	%a1, 0, bnei_else.35645
	j	bnei_cont.35646
bnei_else.35645:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35646:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.35636
bnei_else.35637:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.35647
	add	%a1, %zero, %zero
	j	fbgt_cont.35648
fbgt_else.35647:
	add	%a1, %zero, %k1
fbgt_cont.35648:
	beqi	%a1, 0, bnei_else.35649
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.35650
bnei_else.35649:
	fsw	%fzero, 0(%v0)
bnei_cont.35650:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35638:
	j	bnei_cont.35636
bnei_else.35635:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.35651
	add	%a1, %zero, %k1
	j	fbeq_cont.35652
fbeq_else.35651:
	add	%a1, %zero, %zero
fbeq_cont.35652:
	beqi	%a1, 0, bnei_else.35653
	fsw	%fzero, 1(%v0)
	j	bnei_cont.35654
bnei_else.35653:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35655
	add	%a1, %zero, %zero
	j	fbgt_cont.35656
fbgt_else.35655:
	add	%a1, %zero, %k1
fbgt_cont.35656:
	beqi	%ra, 0, bnei_else.35657
	beqi	%a1, 0, bnei_else.35659
	add	%a1, %zero, %zero
	j	bnei_cont.35658
bnei_else.35659:
	add	%a1, %zero, %k1
bnei_cont.35660:
	j	bnei_cont.35658
bnei_else.35657:
bnei_cont.35658:
	lw	%ra, 4(%k0)
	flw	%f0, 0(%ra)
	beqi	%a1, 0, bnei_else.35661
	j	bnei_cont.35662
bnei_else.35661:
	fneg	%f0, %f0
bnei_cont.35662:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.35654:
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.35663
	add	%a1, %zero, %k1
	j	fbeq_cont.35664
fbeq_else.35663:
	add	%a1, %zero, %zero
fbeq_cont.35664:
	beqi	%a1, 0, bnei_else.35665
	fsw	%fzero, 3(%v0)
	j	bnei_cont.35666
bnei_else.35665:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35667
	add	%a1, %zero, %zero
	j	fbgt_cont.35668
fbgt_else.35667:
	add	%a1, %zero, %k1
fbgt_cont.35668:
	beqi	%ra, 0, bnei_else.35669
	beqi	%a1, 0, bnei_else.35671
	add	%a1, %zero, %zero
	j	bnei_cont.35670
bnei_else.35671:
	add	%a1, %zero, %k1
bnei_cont.35672:
	j	bnei_cont.35670
bnei_else.35669:
bnei_cont.35670:
	lw	%ra, 4(%k0)
	flw	%f0, 1(%ra)
	beqi	%a1, 0, bnei_else.35673
	j	bnei_cont.35674
bnei_else.35673:
	fneg	%f0, %f0
bnei_cont.35674:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.35666:
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.35675
	add	%a1, %zero, %k1
	j	fbeq_cont.35676
fbeq_else.35675:
	add	%a1, %zero, %zero
fbeq_cont.35676:
	beqi	%a1, 0, bnei_else.35677
	fsw	%fzero, 5(%v0)
	j	bnei_cont.35678
bnei_else.35677:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35679
	add	%a1, %zero, %zero
	j	fbgt_cont.35680
fbgt_else.35679:
	add	%a1, %zero, %k1
fbgt_cont.35680:
	beqi	%ra, 0, bnei_else.35681
	beqi	%a1, 0, bnei_else.35683
	add	%a1, %zero, %zero
	j	bnei_cont.35682
bnei_else.35683:
	add	%a1, %zero, %k1
bnei_cont.35684:
	j	bnei_cont.35682
bnei_else.35681:
bnei_cont.35682:
	lw	%k0, 4(%k0)
	flw	%f0, 2(%k0)
	beqi	%a1, 0, bnei_else.35685
	j	bnei_cont.35686
bnei_else.35685:
	fneg	%f0, %f0
bnei_cont.35686:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.35678:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35636:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.35634:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.35581:
	add	%ra, %zero, %a2
	jr	%ra
setup_dirvec_constants.2892:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 0(%zero)
	addi	%a3, %a2, -1
	blti	%a3, 0, bgti_else.35789
	lw	%k0, 12(%a3)
	lw	%s0, 1(%a0)
	lw	%s1, 0(%a0)
	lw	%a2, 1(%k0)
	beqi	%a2, 1, bnei_else.35790
	beqi	%a2, 2, bnei_else.35792
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f18, 0(%s1)
	flw	%f19, 1(%s1)
	flw	%f21, 2(%s1)
	fmul	%f1, %f18, %f18
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a2, 3(%k0)
	beqi	%a2, 0, bnei_else.35794
	fmul	%f16, %f19, %f21
	lw	%a2, 9(%k0)
	flw	%f1, 0(%a2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18
	lw	%a2, 9(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f18, %f19
	lw	%a2, 9(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35795
bnei_else.35794:
bnei_cont.35795:
	lw	%a2, 4(%k0)
	flw	%f1, 0(%a2)
	fmul	%f1, %f18, %f1
	fneg	%f22, %f1
	lw	%a2, 4(%k0)
	flw	%f1, 1(%a2)
	fmul	%f1, %f19, %f1
	fneg	%f20, %f1
	lw	%a2, 4(%k0)
	flw	%f1, 2(%a2)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a2, 3(%k0)
	beqi	%a2, 0, bnei_else.35796
	lw	%a2, 9(%k0)
	flw	%f1, 1(%a2)
	fmul	%f16, %f21, %f1
	lw	%a2, 9(%k0)
	flw	%f1, 2(%a2)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a2, 9(%k0)
	flw	%f1, 0(%a2)
	fmul	%f16, %f21, %f1
	lw	%a2, 9(%k0)
	flw	%f1, 2(%a2)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a2, 9(%k0)
	flw	%f1, 0(%a2)
	fmul	%f16, %f19, %f1
	lw	%a2, 9(%k0)
	flw	%f1, 1(%a2)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.35797
bnei_else.35796:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.35797:
	fbne	%f0, %fzero, fbeq_else.35798
	add	%a2, %zero, %k1
	j	fbeq_cont.35799
fbeq_else.35798:
	add	%a2, %zero, %zero
fbeq_cont.35799:
	beqi	%a2, 0, bnei_else.35800
	j	bnei_cont.35801
bnei_else.35800:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35801:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.35791
bnei_else.35792:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.35802
	add	%a2, %zero, %zero
	j	fbgt_cont.35803
fbgt_else.35802:
	add	%a2, %zero, %k1
fbgt_cont.35803:
	beqi	%a2, 0, bnei_else.35804
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.35805
bnei_else.35804:
	fsw	%fzero, 0(%v0)
bnei_cont.35805:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35793:
	j	bnei_cont.35791
bnei_else.35790:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.35806
	add	%a2, %zero, %k1
	j	fbeq_cont.35807
fbeq_else.35806:
	add	%a2, %zero, %zero
fbeq_cont.35807:
	beqi	%a2, 0, bnei_else.35808
	fsw	%fzero, 1(%v0)
	j	bnei_cont.35809
bnei_else.35808:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35810
	add	%a2, %zero, %zero
	j	fbgt_cont.35811
fbgt_else.35810:
	add	%a2, %zero, %k1
fbgt_cont.35811:
	beqi	%ra, 0, bnei_else.35812
	beqi	%a2, 0, bnei_else.35814
	add	%a2, %zero, %zero
	j	bnei_cont.35813
bnei_else.35814:
	add	%a2, %zero, %k1
bnei_cont.35815:
	j	bnei_cont.35813
bnei_else.35812:
bnei_cont.35813:
	lw	%ra, 4(%k0)
	flw	%f0, 0(%ra)
	beqi	%a2, 0, bnei_else.35816
	j	bnei_cont.35817
bnei_else.35816:
	fneg	%f0, %f0
bnei_cont.35817:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.35809:
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.35818
	add	%a2, %zero, %k1
	j	fbeq_cont.35819
fbeq_else.35818:
	add	%a2, %zero, %zero
fbeq_cont.35819:
	beqi	%a2, 0, bnei_else.35820
	fsw	%fzero, 3(%v0)
	j	bnei_cont.35821
bnei_else.35820:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35822
	add	%a2, %zero, %zero
	j	fbgt_cont.35823
fbgt_else.35822:
	add	%a2, %zero, %k1
fbgt_cont.35823:
	beqi	%ra, 0, bnei_else.35824
	beqi	%a2, 0, bnei_else.35826
	add	%a2, %zero, %zero
	j	bnei_cont.35825
bnei_else.35826:
	add	%a2, %zero, %k1
bnei_cont.35827:
	j	bnei_cont.35825
bnei_else.35824:
bnei_cont.35825:
	lw	%ra, 4(%k0)
	flw	%f0, 1(%ra)
	beqi	%a2, 0, bnei_else.35828
	j	bnei_cont.35829
bnei_else.35828:
	fneg	%f0, %f0
bnei_cont.35829:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.35821:
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.35830
	add	%a2, %zero, %k1
	j	fbeq_cont.35831
fbeq_else.35830:
	add	%a2, %zero, %zero
fbeq_cont.35831:
	beqi	%a2, 0, bnei_else.35832
	fsw	%fzero, 5(%v0)
	j	bnei_cont.35833
bnei_else.35832:
	lw	%ra, 6(%k0)
	fblt	%f1, %fzero, fbgt_else.35834
	add	%a2, %zero, %zero
	j	fbgt_cont.35835
fbgt_else.35834:
	add	%a2, %zero, %k1
fbgt_cont.35835:
	beqi	%ra, 0, bnei_else.35836
	beqi	%a2, 0, bnei_else.35838
	add	%a2, %zero, %zero
	j	bnei_cont.35837
bnei_else.35838:
	add	%a2, %zero, %k1
bnei_cont.35839:
	j	bnei_cont.35837
bnei_else.35836:
bnei_cont.35837:
	lw	%k0, 4(%k0)
	flw	%f0, 2(%k0)
	beqi	%a2, 0, bnei_else.35840
	j	bnei_cont.35841
bnei_else.35840:
	fneg	%f0, %f0
bnei_cont.35841:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.35833:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35791:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.35789:
	add	%ra, %zero, %a1
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.35877
	lw	%a2, 12(%v1)
	lw	%a3, 10(%a2)
	lw	%a1, 1(%a2)
	flw	%f1, 0(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%a3)
	flw	%f1, 1(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 1(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%a3)
	flw	%f1, 2(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 2(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%a3)
	beqi	%a1, 2, bnei_else.35878
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.35880
	j	bnei_cont.35879
bgt_else.35880:
	flw	%f17, 0(%a3)
	flw	%f18, 1(%a3)
	flw	%f19, 2(%a3)
	fmul	%f1, %f17, %f17
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.35882
	fmul	%f16, %f18, %f19
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f19, %f17
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f17, %f18
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35883
bnei_else.35882:
bnei_cont.35883:
	beqi	%a1, 3, bnei_else.35884
	j	bnei_cont.35885
bnei_else.35884:
	fsub	%f0, %f0, %f30
bnei_cont.35885:
	fsw	%f0, 3(%a3)
bgt_cont.35881:
	j	bnei_cont.35879
bnei_else.35878:
	lw	%a0, 4(%a2)
	flw	%f1, 0(%a3)
	flw	%f17, 1(%a3)
	flw	%f16, 2(%a3)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f1
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsw	%f0, 3(%a3)
bnei_cont.35879:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.35877:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36031
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36032
	beqi	%a0, 2, bnei_else.36034
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.36036
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.36037
bnei_else.36036:
bnei_cont.36037:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.36038
	j	bnei_cont.36039
bnei_else.36038:
	fsub	%f16, %f16, %f30
bnei_cont.36039:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.36040
	add	%a0, %zero, %zero
	j	fbgt_cont.36041
fbgt_else.36040:
	add	%a0, %zero, %k1
fbgt_cont.36041:
	beqi	%a1, 0, bnei_else.36042
	beqi	%a0, 0, bnei_else.36044
	add	%a0, %zero, %zero
	j	bnei_cont.36043
bnei_else.36044:
	add	%a0, %zero, %k1
bnei_cont.36045:
	j	bnei_cont.36043
bnei_else.36042:
bnei_cont.36043:
	beqi	%a0, 0, bnei_else.36046
	add	%a0, %zero, %zero
	j	bnei_cont.36033
bnei_else.36046:
	add	%a0, %zero, %k1
bnei_cont.36047:
	j	bnei_cont.36033
bnei_else.36034:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.36048
	add	%a0, %zero, %zero
	j	fbgt_cont.36049
fbgt_else.36048:
	add	%a0, %zero, %k1
fbgt_cont.36049:
	beqi	%a1, 0, bnei_else.36050
	beqi	%a0, 0, bnei_else.36052
	add	%a0, %zero, %zero
	j	bnei_cont.36051
bnei_else.36052:
	add	%a0, %zero, %k1
bnei_cont.36053:
	j	bnei_cont.36051
bnei_else.36050:
bnei_cont.36051:
	beqi	%a0, 0, bnei_else.36054
	add	%a0, %zero, %zero
	j	bnei_cont.36033
bnei_else.36054:
	add	%a0, %zero, %k1
bnei_cont.36055:
bnei_cont.36035:
	j	bnei_cont.36033
bnei_else.36032:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36056
	add	%a0, %zero, %zero
	j	fbgt_cont.36057
fbgt_else.36056:
	add	%a0, %zero, %k1
fbgt_cont.36057:
	beqi	%a0, 0, bnei_else.36058
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36060
	add	%a0, %zero, %zero
	j	fbgt_cont.36061
fbgt_else.36060:
	add	%a0, %zero, %k1
fbgt_cont.36061:
	beqi	%a0, 0, bnei_else.36062
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36064
	add	%a0, %zero, %zero
	j	bnei_cont.36059
fbgt_else.36064:
	add	%a0, %zero, %k1
fbgt_cont.36065:
	j	bnei_cont.36059
bnei_else.36062:
	add	%a0, %zero, %zero
bnei_cont.36063:
	j	bnei_cont.36059
bnei_else.36058:
	add	%a0, %zero, %zero
bnei_cont.36059:
	beqi	%a0, 0, bnei_else.36066
	lw	%a0, 6(%a1)
	j	bnei_cont.36067
bnei_else.36066:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36068
	add	%a0, %zero, %zero
	j	bnei_cont.36069
bnei_else.36068:
	add	%a0, %zero, %k1
bnei_cont.36069:
bnei_cont.36067:
bnei_cont.36033:
	beqi	%a0, 0, bnei_else.36070
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36070:
	addi	%a1, %v0, 1
	add	%at, %v1, %a1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36071
	lw	%a2, 12(%a0)
	lw	%a0, 5(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a2)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a2)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.36072
	beqi	%a0, 2, bnei_else.36074
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.36076
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a2)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.36077
bnei_else.36076:
bnei_cont.36077:
	lw	%a0, 1(%a2)
	beqi	%a0, 3, bnei_else.36078
	j	bnei_cont.36079
bnei_else.36078:
	fsub	%f16, %f16, %f30
bnei_cont.36079:
	lw	%a2, 6(%a2)
	fblt	%f16, %fzero, fbgt_else.36080
	add	%a0, %zero, %zero
	j	fbgt_cont.36081
fbgt_else.36080:
	add	%a0, %zero, %k1
fbgt_cont.36081:
	beqi	%a2, 0, bnei_else.36082
	beqi	%a0, 0, bnei_else.36084
	add	%a0, %zero, %zero
	j	bnei_cont.36083
bnei_else.36084:
	add	%a0, %zero, %k1
bnei_cont.36085:
	j	bnei_cont.36083
bnei_else.36082:
bnei_cont.36083:
	beqi	%a0, 0, bnei_else.36086
	add	%a0, %zero, %zero
	j	bnei_cont.36073
bnei_else.36086:
	add	%a0, %zero, %k1
bnei_cont.36087:
	j	bnei_cont.36073
bnei_else.36074:
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a2, 6(%a2)
	fblt	%f16, %fzero, fbgt_else.36088
	add	%a0, %zero, %zero
	j	fbgt_cont.36089
fbgt_else.36088:
	add	%a0, %zero, %k1
fbgt_cont.36089:
	beqi	%a2, 0, bnei_else.36090
	beqi	%a0, 0, bnei_else.36092
	add	%a0, %zero, %zero
	j	bnei_cont.36091
bnei_else.36092:
	add	%a0, %zero, %k1
bnei_cont.36093:
	j	bnei_cont.36091
bnei_else.36090:
bnei_cont.36091:
	beqi	%a0, 0, bnei_else.36094
	add	%a0, %zero, %zero
	j	bnei_cont.36073
bnei_else.36094:
	add	%a0, %zero, %k1
bnei_cont.36095:
bnei_cont.36075:
	j	bnei_cont.36073
bnei_else.36072:
	fabs	%f17, %f19
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36096
	add	%a0, %zero, %zero
	j	fbgt_cont.36097
fbgt_else.36096:
	add	%a0, %zero, %k1
fbgt_cont.36097:
	beqi	%a0, 0, bnei_else.36098
	fabs	%f17, %f20
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36100
	add	%a0, %zero, %zero
	j	fbgt_cont.36101
fbgt_else.36100:
	add	%a0, %zero, %k1
fbgt_cont.36101:
	beqi	%a0, 0, bnei_else.36102
	fabs	%f17, %f21
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36104
	add	%a0, %zero, %zero
	j	bnei_cont.36099
fbgt_else.36104:
	add	%a0, %zero, %k1
fbgt_cont.36105:
	j	bnei_cont.36099
bnei_else.36102:
	add	%a0, %zero, %zero
bnei_cont.36103:
	j	bnei_cont.36099
bnei_else.36098:
	add	%a0, %zero, %zero
bnei_cont.36099:
	beqi	%a0, 0, bnei_else.36106
	lw	%a0, 6(%a2)
	j	bnei_cont.36107
bnei_else.36106:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.36108
	add	%a0, %zero, %zero
	j	bnei_cont.36109
bnei_else.36108:
	add	%a0, %zero, %k1
bnei_cont.36109:
bnei_cont.36107:
bnei_cont.36073:
	beqi	%a0, 0, bnei_else.36110
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36110:
	addi	%a0, %a1, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2919
bnei_else.36071:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36031:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2925:
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	add	%at, %v1, %a3
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.36306
	lw	%a1, 12(%a2)
	flw	%f19, 138(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f21, %f19, %f0
	flw	%f16, 139(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f22, %f16, %f0
	flw	%f18, 140(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f23, %f18, %f0
	lw	%a2, 187(%a2)
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36307
	beqi	%a0, 2, bnei_else.36309
	flw	%f20, 0(%a2)
	fbne	%f20, %fzero, fbeq_else.36311
	add	%a0, %zero, %k1
	j	fbeq_cont.36312
fbeq_else.36311:
	add	%a0, %zero, %zero
fbeq_cont.36312:
	beqi	%a0, 0, bnei_else.36313
	add	%a0, %zero, %zero
	j	bnei_cont.36308
bnei_else.36313:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f21
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f23
	fadd	%f2, %f1, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f17, %f1, %f0
	fmul	%f1, %f22, %f22
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.36315
	fmul	%f17, %f22, %f23
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f17, %f1
	fadd	%f17, %f0, %f1
	fmul	%f1, %f23, %f21
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f21, %f22
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.36316
bnei_else.36315:
bnei_cont.36316:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.36317
	j	bnei_cont.36318
bnei_else.36317:
	fsub	%f0, %f0, %f30
bnei_cont.36318:
	fmul	%f1, %f2, %f2
	fmul	%f0, %f20, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.36319
	add	%a0, %zero, %zero
	j	fbgt_cont.36320
fbgt_else.36319:
	add	%a0, %zero, %k1
fbgt_cont.36320:
	beqi	%a0, 0, bnei_else.36321
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36323
	fsqrt	%f0, %f0
	fadd	%f1, %f2, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36324
bnei_else.36323:
	fsqrt	%f0, %f0
	fsub	%f1, %f2, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36324:
	add	%a0, %zero, %k1
	j	bnei_cont.36308
bnei_else.36321:
	add	%a0, %zero, %zero
bnei_cont.36322:
bnei_cont.36314:
	j	bnei_cont.36308
bnei_else.36309:
	flw	%f0, 0(%a2)
	fblt	%f0, %fzero, fbgt_else.36325
	add	%a0, %zero, %zero
	j	fbgt_cont.36326
fbgt_else.36325:
	add	%a0, %zero, %k1
fbgt_cont.36326:
	beqi	%a0, 0, bnei_else.36327
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f21
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f23
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36308
bnei_else.36327:
	add	%a0, %zero, %zero
bnei_cont.36328:
bnei_cont.36310:
	j	bnei_cont.36308
bnei_else.36307:
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f21
	flw	%f20, 1(%a2)
	fmul	%f2, %f0, %f20
	flw	%f17, 185(%zero)
	fmul	%f0, %f2, %f17
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36329
	add	%a0, %zero, %zero
	j	fbgt_cont.36330
fbgt_else.36329:
	add	%a0, %zero, %k1
fbgt_cont.36330:
	beqi	%a0, 0, bnei_else.36331
	flw	%f0, 186(%zero)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36333
	add	%a0, %zero, %zero
	j	fbgt_cont.36334
fbgt_else.36333:
	add	%a0, %zero, %k1
fbgt_cont.36334:
	beqi	%a0, 0, bnei_else.36335
	fbne	%f20, %fzero, fbeq_else.36337
	add	%a0, %zero, %k1
	j	fbeq_cont.36338
fbeq_else.36337:
	add	%a0, %zero, %zero
fbeq_cont.36338:
	beqi	%a0, 0, bnei_else.36339
	add	%a0, %zero, %zero
	j	bnei_cont.36332
bnei_else.36339:
	add	%a0, %zero, %k1
bnei_cont.36340:
	j	bnei_cont.36332
bnei_else.36335:
	add	%a0, %zero, %zero
bnei_cont.36336:
	j	bnei_cont.36332
bnei_else.36331:
	add	%a0, %zero, %zero
bnei_cont.36332:
	beqi	%a0, 0, bnei_else.36341
	fsw	%f2, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36342
bnei_else.36341:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f22
	flw	%f24, 3(%a2)
	fmul	%f2, %f0, %f24
	flw	%f20, 184(%zero)
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36343
	add	%a0, %zero, %zero
	j	fbgt_cont.36344
fbgt_else.36343:
	add	%a0, %zero, %k1
fbgt_cont.36344:
	beqi	%a0, 0, bnei_else.36345
	flw	%f0, 186(%zero)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36347
	add	%a0, %zero, %zero
	j	fbgt_cont.36348
fbgt_else.36347:
	add	%a0, %zero, %k1
fbgt_cont.36348:
	beqi	%a0, 0, bnei_else.36349
	fbne	%f24, %fzero, fbeq_else.36351
	add	%a0, %zero, %k1
	j	fbeq_cont.36352
fbeq_else.36351:
	add	%a0, %zero, %zero
fbeq_cont.36352:
	beqi	%a0, 0, bnei_else.36353
	add	%a0, %zero, %zero
	j	bnei_cont.36346
bnei_else.36353:
	add	%a0, %zero, %k1
bnei_cont.36354:
	j	bnei_cont.36346
bnei_else.36349:
	add	%a0, %zero, %zero
bnei_cont.36350:
	j	bnei_cont.36346
bnei_else.36345:
	add	%a0, %zero, %zero
bnei_cont.36346:
	beqi	%a0, 0, bnei_else.36355
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36356
bnei_else.36355:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f23
	flw	%f23, 5(%a2)
	fmul	%f2, %f0, %f23
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36357
	add	%a0, %zero, %zero
	j	fbgt_cont.36358
fbgt_else.36357:
	add	%a0, %zero, %k1
fbgt_cont.36358:
	beqi	%a0, 0, bnei_else.36359
	fmul	%f0, %f2, %f17
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36361
	add	%a0, %zero, %zero
	j	fbgt_cont.36362
fbgt_else.36361:
	add	%a0, %zero, %k1
fbgt_cont.36362:
	beqi	%a0, 0, bnei_else.36363
	fbne	%f23, %fzero, fbeq_else.36365
	add	%a0, %zero, %k1
	j	fbeq_cont.36366
fbeq_else.36365:
	add	%a0, %zero, %zero
fbeq_cont.36366:
	beqi	%a0, 0, bnei_else.36367
	add	%a0, %zero, %zero
	j	bnei_cont.36360
bnei_else.36367:
	add	%a0, %zero, %k1
bnei_cont.36368:
	j	bnei_cont.36360
bnei_else.36363:
	add	%a0, %zero, %zero
bnei_cont.36364:
	j	bnei_cont.36360
bnei_else.36359:
	add	%a0, %zero, %zero
bnei_cont.36360:
	beqi	%a0, 0, bnei_else.36369
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36370
bnei_else.36369:
	add	%a0, %zero, %zero
bnei_cont.36370:
bnei_cont.36356:
bnei_cont.36342:
bnei_cont.36308:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.36371
	flw	%f0, 467(%zero)
	fblt	%f1, %f0, fbgt_else.36373
	add	%a0, %zero, %zero
	j	bnei_cont.36372
fbgt_else.36373:
	add	%a0, %zero, %k1
fbgt_cont.36374:
	j	bnei_cont.36372
bnei_else.36371:
	add	%a0, %zero, %zero
bnei_cont.36372:
	beqi	%a0, 0, bnei_else.36375
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
	beqi	%a0, -1, bnei_else.36376
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36378
	beqi	%a0, 2, bnei_else.36380
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.36382
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.36383
bnei_else.36382:
bnei_cont.36383:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.36384
	j	bnei_cont.36385
bnei_else.36384:
	fsub	%f16, %f16, %f30
bnei_cont.36385:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.36386
	add	%a0, %zero, %zero
	j	fbgt_cont.36387
fbgt_else.36386:
	add	%a0, %zero, %k1
fbgt_cont.36387:
	beqi	%a1, 0, bnei_else.36388
	beqi	%a0, 0, bnei_else.36390
	add	%a0, %zero, %zero
	j	bnei_cont.36389
bnei_else.36390:
	add	%a0, %zero, %k1
bnei_cont.36391:
	j	bnei_cont.36389
bnei_else.36388:
bnei_cont.36389:
	beqi	%a0, 0, bnei_else.36392
	add	%a0, %zero, %zero
	j	bnei_cont.36379
bnei_else.36392:
	add	%a0, %zero, %k1
bnei_cont.36393:
	j	bnei_cont.36379
bnei_else.36380:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.36394
	add	%a0, %zero, %zero
	j	fbgt_cont.36395
fbgt_else.36394:
	add	%a0, %zero, %k1
fbgt_cont.36395:
	beqi	%a1, 0, bnei_else.36396
	beqi	%a0, 0, bnei_else.36398
	add	%a0, %zero, %zero
	j	bnei_cont.36397
bnei_else.36398:
	add	%a0, %zero, %k1
bnei_cont.36399:
	j	bnei_cont.36397
bnei_else.36396:
bnei_cont.36397:
	beqi	%a0, 0, bnei_else.36400
	add	%a0, %zero, %zero
	j	bnei_cont.36379
bnei_else.36400:
	add	%a0, %zero, %k1
bnei_cont.36401:
bnei_cont.36381:
	j	bnei_cont.36379
bnei_else.36378:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36402
	add	%a0, %zero, %zero
	j	fbgt_cont.36403
fbgt_else.36402:
	add	%a0, %zero, %k1
fbgt_cont.36403:
	beqi	%a0, 0, bnei_else.36404
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36406
	add	%a0, %zero, %zero
	j	fbgt_cont.36407
fbgt_else.36406:
	add	%a0, %zero, %k1
fbgt_cont.36407:
	beqi	%a0, 0, bnei_else.36408
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36410
	add	%a0, %zero, %zero
	j	bnei_cont.36405
fbgt_else.36410:
	add	%a0, %zero, %k1
fbgt_cont.36411:
	j	bnei_cont.36405
bnei_else.36408:
	add	%a0, %zero, %zero
bnei_cont.36409:
	j	bnei_cont.36405
bnei_else.36404:
	add	%a0, %zero, %zero
bnei_cont.36405:
	beqi	%a0, 0, bnei_else.36412
	lw	%a0, 6(%a1)
	j	bnei_cont.36413
bnei_else.36412:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36414
	add	%a0, %zero, %zero
	j	bnei_cont.36415
bnei_else.36414:
	add	%a0, %zero, %k1
bnei_cont.36415:
bnei_cont.36413:
bnei_cont.36379:
	beqi	%a0, 0, bnei_else.36416
	add	%v0, %zero, %zero
	j	bnei_cont.36377
bnei_else.36416:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.36417:
	j	bnei_cont.36377
bnei_else.36376:
	add	%v0, %zero, %k1
bnei_cont.36377:
	beqi	%v0, 0, bnei_else.36418
	add	%ra, %zero, %k0
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36418:
	addi	%v0, %a3, 1
	add	%ra, %zero, %k0
	j	shadow_check_and_group.2925
bnei_else.36375:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36419
	addi	%v0, %a3, 1
	add	%ra, %zero, %k0
	j	shadow_check_and_group.2925
bnei_else.36419:
	add	%ra, %zero, %k0
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36306:
	add	%ra, %zero, %k0
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2928:
	add	%s0, %zero, %v0
	add	%s1, %zero, %v1
	add	%s2, %zero, %ra
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36462
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36463
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36463:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36464
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36465
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36465:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36466
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36467
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36467:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36468
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36469
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36469:
	addi	%v0, %s0, 1
	add	%ra, %zero, %s2
	addi	%v1, %s1, 0
	j	shadow_check_one_or_group.2928
bnei_else.36468:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36466:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36464:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.36462:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	add	%at, %s4, %s3
	lw	%s6, 0(%at)
	lw	%a1, 0(%s6)
	beqi	%a1, -1, bnei_else.36644
	beqi	%a1, 99, bnei_else.36645
	lw	%a2, 12(%a1)
	flw	%f1, 138(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a1, 187(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.36647
	beqi	%a0, 2, bnei_else.36649
	flw	%f18, 0(%a1)
	fbne	%f18, %fzero, fbeq_else.36651
	add	%a0, %zero, %k1
	j	fbeq_cont.36652
fbeq_else.36651:
	add	%a0, %zero, %zero
fbeq_cont.36652:
	beqi	%a0, 0, bnei_else.36653
	add	%a0, %zero, %zero
	j	bnei_cont.36648
bnei_else.36653:
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f20
	fadd	%f17, %f1, %f0
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f20
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.36655
	fmul	%f16, %f2, %f20
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f20, %f19
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f2
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.36656
bnei_else.36655:
bnei_cont.36656:
	lw	%a0, 1(%a2)
	beqi	%a0, 3, bnei_else.36657
	j	bnei_cont.36658
bnei_else.36657:
	fsub	%f0, %f0, %f30
bnei_cont.36658:
	fmul	%f1, %f17, %f17
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.36659
	add	%a0, %zero, %zero
	j	fbgt_cont.36660
fbgt_else.36659:
	add	%a0, %zero, %k1
fbgt_cont.36660:
	beqi	%a0, 0, bnei_else.36661
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.36663
	fsqrt	%f0, %f0
	fadd	%f1, %f17, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36664
bnei_else.36663:
	fsqrt	%f0, %f0
	fsub	%f1, %f17, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36664:
	add	%a0, %zero, %k1
	j	bnei_cont.36648
bnei_else.36661:
	add	%a0, %zero, %zero
bnei_cont.36662:
bnei_cont.36654:
	j	bnei_cont.36648
bnei_else.36649:
	flw	%f0, 0(%a1)
	fblt	%f0, %fzero, fbgt_else.36665
	add	%a0, %zero, %zero
	j	fbgt_cont.36666
fbgt_else.36665:
	add	%a0, %zero, %k1
fbgt_cont.36666:
	beqi	%a0, 0, bnei_else.36667
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f20
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36648
bnei_else.36667:
	add	%a0, %zero, %zero
bnei_cont.36668:
bnei_cont.36650:
	j	bnei_cont.36648
bnei_else.36647:
	flw	%f0, 0(%a1)
	fsub	%f0, %f0, %f19
	flw	%f18, 1(%a1)
	fmul	%f17, %f0, %f18
	flw	%f16, 185(%zero)
	fmul	%f0, %f17, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36669
	add	%a0, %zero, %zero
	j	fbgt_cont.36670
fbgt_else.36669:
	add	%a0, %zero, %k1
fbgt_cont.36670:
	beqi	%a0, 0, bnei_else.36671
	flw	%f0, 186(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36673
	add	%a0, %zero, %zero
	j	fbgt_cont.36674
fbgt_else.36673:
	add	%a0, %zero, %k1
fbgt_cont.36674:
	beqi	%a0, 0, bnei_else.36675
	fbne	%f18, %fzero, fbeq_else.36677
	add	%a0, %zero, %k1
	j	fbeq_cont.36678
fbeq_else.36677:
	add	%a0, %zero, %zero
fbeq_cont.36678:
	beqi	%a0, 0, bnei_else.36679
	add	%a0, %zero, %zero
	j	bnei_cont.36672
bnei_else.36679:
	add	%a0, %zero, %k1
bnei_cont.36680:
	j	bnei_cont.36672
bnei_else.36675:
	add	%a0, %zero, %zero
bnei_cont.36676:
	j	bnei_cont.36672
bnei_else.36671:
	add	%a0, %zero, %zero
bnei_cont.36672:
	beqi	%a0, 0, bnei_else.36681
	fsw	%f17, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36682
bnei_else.36681:
	flw	%f0, 2(%a1)
	fsub	%f0, %f0, %f2
	flw	%f18, 3(%a1)
	fmul	%f17, %f0, %f18
	flw	%f21, 184(%zero)
	fmul	%f0, %f17, %f21
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36683
	add	%a0, %zero, %zero
	j	fbgt_cont.36684
fbgt_else.36683:
	add	%a0, %zero, %k1
fbgt_cont.36684:
	beqi	%a0, 0, bnei_else.36685
	flw	%f0, 186(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36687
	add	%a0, %zero, %zero
	j	fbgt_cont.36688
fbgt_else.36687:
	add	%a0, %zero, %k1
fbgt_cont.36688:
	beqi	%a0, 0, bnei_else.36689
	fbne	%f18, %fzero, fbeq_else.36691
	add	%a0, %zero, %k1
	j	fbeq_cont.36692
fbeq_else.36691:
	add	%a0, %zero, %zero
fbeq_cont.36692:
	beqi	%a0, 0, bnei_else.36693
	add	%a0, %zero, %zero
	j	bnei_cont.36686
bnei_else.36693:
	add	%a0, %zero, %k1
bnei_cont.36694:
	j	bnei_cont.36686
bnei_else.36689:
	add	%a0, %zero, %zero
bnei_cont.36690:
	j	bnei_cont.36686
bnei_else.36685:
	add	%a0, %zero, %zero
bnei_cont.36686:
	beqi	%a0, 0, bnei_else.36695
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36696
bnei_else.36695:
	flw	%f0, 4(%a1)
	fsub	%f0, %f0, %f20
	flw	%f18, 5(%a1)
	fmul	%f17, %f0, %f18
	fmul	%f0, %f17, %f21
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36697
	add	%a0, %zero, %zero
	j	fbgt_cont.36698
fbgt_else.36697:
	add	%a0, %zero, %k1
fbgt_cont.36698:
	beqi	%a0, 0, bnei_else.36699
	fmul	%f0, %f17, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36701
	add	%a0, %zero, %zero
	j	fbgt_cont.36702
fbgt_else.36701:
	add	%a0, %zero, %k1
fbgt_cont.36702:
	beqi	%a0, 0, bnei_else.36703
	fbne	%f18, %fzero, fbeq_else.36705
	add	%a0, %zero, %k1
	j	fbeq_cont.36706
fbeq_else.36705:
	add	%a0, %zero, %zero
fbeq_cont.36706:
	beqi	%a0, 0, bnei_else.36707
	add	%a0, %zero, %zero
	j	bnei_cont.36700
bnei_else.36707:
	add	%a0, %zero, %k1
bnei_cont.36708:
	j	bnei_cont.36700
bnei_else.36703:
	add	%a0, %zero, %zero
bnei_cont.36704:
	j	bnei_cont.36700
bnei_else.36699:
	add	%a0, %zero, %zero
bnei_cont.36700:
	beqi	%a0, 0, bnei_else.36709
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36710
bnei_else.36709:
	add	%a0, %zero, %zero
bnei_cont.36710:
bnei_cont.36696:
bnei_cont.36682:
bnei_cont.36648:
	beqi	%a0, 0, bnei_else.36711
	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	fblt	%f1, %f0, fbgt_else.36713
	add	%a0, %zero, %zero
	j	fbgt_cont.36714
fbgt_else.36713:
	add	%a0, %zero, %k1
fbgt_cont.36714:
	beqi	%a0, 0, bnei_else.36715
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36717
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36719
	add	%v0, %zero, %k1
	j	bnei_cont.36718
bnei_else.36719:
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_else.36721
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36723
	add	%v0, %zero, %k1
	j	bnei_cont.36718
bnei_else.36723:
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_else.36725
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36727
	add	%v0, %zero, %k1
	j	bnei_cont.36718
bnei_else.36727:
	addi	%v0, %zero, 4
	addi	%v1, %s6, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.36728:
	j	bnei_cont.36718
bnei_else.36725:
	add	%v0, %zero, %zero
bnei_cont.36726:
bnei_cont.36724:
	j	bnei_cont.36718
bnei_else.36721:
	add	%v0, %zero, %zero
bnei_cont.36722:
bnei_cont.36720:
	j	bnei_cont.36718
bnei_else.36717:
	add	%v0, %zero, %zero
bnei_cont.36718:
	beqi	%v0, 0, bnei_else.36729
	add	%a0, %zero, %k1
	j	bnei_cont.36646
bnei_else.36729:
	add	%a0, %zero, %zero
bnei_cont.36730:
	j	bnei_cont.36646
bnei_else.36715:
	add	%a0, %zero, %zero
bnei_cont.36716:
	j	bnei_cont.36646
bnei_else.36711:
	add	%a0, %zero, %zero
bnei_cont.36712:
	j	bnei_cont.36646
bnei_else.36645:
	add	%a0, %zero, %k1
bnei_cont.36646:
	beqi	%a0, 0, bnei_else.36731
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36732
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36734
	add	%v0, %zero, %k1
	j	bnei_cont.36733
bnei_else.36734:
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_else.36736
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36738
	add	%v0, %zero, %k1
	j	bnei_cont.36733
bnei_else.36738:
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_else.36740
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36742
	add	%v0, %zero, %k1
	j	bnei_cont.36733
bnei_else.36742:
	addi	%v0, %zero, 4
	addi	%v1, %s6, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.36743:
	j	bnei_cont.36733
bnei_else.36740:
	add	%v0, %zero, %zero
bnei_cont.36741:
bnei_cont.36739:
	j	bnei_cont.36733
bnei_else.36736:
	add	%v0, %zero, %zero
bnei_cont.36737:
bnei_cont.36735:
	j	bnei_cont.36733
bnei_else.36732:
	add	%v0, %zero, %zero
bnei_cont.36733:
	beqi	%v0, 0, bnei_else.36744
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.36744:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.36731:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.36644:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
solve_each_element.2934:
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra
	add	%at, %v1, %a3
	lw	%s1, 0(%at)
	beqi	%s1, -1, bnei_else.36990
	lw	%a1, 12(%s1)
	flw	%f19, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f21, %f19, %f0
	flw	%f18, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f22, %f18, %f0
	flw	%f17, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f23, %f17, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36991
	beqi	%a0, 2, bnei_else.36993
	flw	%f28, 0(%k0)
	flw	%f27, 1(%k0)
	flw	%f29, 2(%k0)
	fmul	%f0, %f28, %f28
	lw	%a0, 4(%a1)
	flw	%f25, 0(%a0)
	fmul	%f1, %f0, %f25
	fmul	%f0, %f27, %f27
	lw	%a0, 4(%a1)
	flw	%f24, 1(%a0)
	fmul	%f0, %f0, %f24
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f29
	lw	%a0, 4(%a1)
	flw	%f20, 2(%a0)
	fmul	%f0, %f0, %f20
	fadd	%f0, %f1, %f0
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.36995
	fmul	%f16, %f27, %f29
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f29, %f28
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f28, %f27
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.36996
bnei_else.36995:
bnei_cont.36996:
	fbne	%f0, %fzero, fbeq_else.36997
	add	%a0, %zero, %k1
	j	fbeq_cont.36998
fbeq_else.36997:
	add	%a0, %zero, %zero
fbeq_cont.36998:
	beqi	%a0, 0, bnei_else.36999
	add	%s2, %zero, %zero
	j	bnei_cont.36992
bnei_else.36999:
	fmul	%f1, %f28, %f21
	fmul	%f16, %f1, %f25
	fmul	%f1, %f27, %f22
	fmul	%f1, %f1, %f24
	fadd	%f16, %f16, %f1
	fmul	%f1, %f29, %f23
	fmul	%f1, %f1, %f20
	fadd	%f1, %f16, %f1
	beqi	%a2, 0, bnei_else.37001
	fmul	%f2, %f29, %f22
	fmul	%f16, %f27, %f23
	fadd	%f2, %f2, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f26, %f2, %f16
	fmul	%f2, %f28, %f23
	fmul	%f16, %f29, %f21
	fadd	%f2, %f2, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f2, %f16
	fadd	%f26, %f26, %f16
	fmul	%f2, %f28, %f22
	fmul	%f16, %f27, %f21
	fadd	%f2, %f2, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f2, %f16
	fadd	%f2, %f26, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f2, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37002
bnei_else.37001:
bnei_cont.37002:
	fmul	%f16, %f21, %f21
	fmul	%f2, %f16, %f25
	fmul	%f16, %f22, %f22
	fmul	%f16, %f16, %f24
	fadd	%f2, %f2, %f16
	fmul	%f16, %f23, %f23
	fmul	%f16, %f16, %f20
	fadd	%f16, %f2, %f16
	beqi	%a2, 0, bnei_else.37003
	fmul	%f20, %f22, %f23
	lw	%a0, 9(%a1)
	flw	%f2, 0(%a0)
	fmul	%f2, %f20, %f2
	fadd	%f20, %f16, %f2
	fmul	%f2, %f23, %f21
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f2, %f16
	fadd	%f20, %f20, %f16
	fmul	%f2, %f21, %f22
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f2, %f16
	fadd	%f16, %f20, %f16
	j	bnei_cont.37004
bnei_else.37003:
bnei_cont.37004:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.37005
	j	bnei_cont.37006
bnei_else.37005:
	fsub	%f16, %f16, %f30
bnei_cont.37006:
	fmul	%f2, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f2, %f16
	fblt	%fzero, %f16, fbgt_else.37007
	add	%a0, %zero, %zero
	j	fbgt_cont.37008
fbgt_else.37007:
	add	%a0, %zero, %k1
fbgt_cont.37008:
	beqi	%a0, 0, bnei_else.37009
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37011
	j	bnei_cont.37012
bnei_else.37011:
	fneg	%f16, %f16
bnei_cont.37012:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s2, %zero, %k1
	j	bnei_cont.36992
bnei_else.37009:
	add	%s2, %zero, %zero
bnei_cont.37010:
bnei_cont.37000:
	j	bnei_cont.36992
bnei_else.36993:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%k0)
	flw	%f24, 0(%a0)
	fmul	%f1, %f0, %f24
	flw	%f0, 1(%k0)
	flw	%f20, 1(%a0)
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f2, 2(%a0)
	fmul	%f0, %f0, %f2
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.37013
	add	%a0, %zero, %zero
	j	fbgt_cont.37014
fbgt_else.37013:
	add	%a0, %zero, %k1
fbgt_cont.37014:
	beqi	%a0, 0, bnei_else.37015
	fmul	%f1, %f24, %f21
	fmul	%f0, %f20, %f22
	fadd	%f1, %f1, %f0
	fmul	%f0, %f2, %f23
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%s2, %zero, %k1
	j	bnei_cont.36992
bnei_else.37015:
	add	%s2, %zero, %zero
bnei_cont.37016:
bnei_cont.36994:
	j	bnei_cont.36992
bnei_else.36991:
	flw	%f2, 0(%k0)
	fbne	%f2, %fzero, fbeq_else.37017
	add	%a0, %zero, %k1
	j	fbeq_cont.37018
fbeq_else.37017:
	add	%a0, %zero, %zero
fbeq_cont.37018:
	beqi	%a0, 0, bnei_else.37019
	add	%a0, %zero, %zero
	j	bnei_cont.37020
bnei_else.37019:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f2, %fzero, fbgt_else.37021
	add	%a0, %zero, %zero
	j	fbgt_cont.37022
fbgt_else.37021:
	add	%a0, %zero, %k1
fbgt_cont.37022:
	beqi	%a2, 0, bnei_else.37023
	beqi	%a0, 0, bnei_else.37025
	add	%a0, %zero, %zero
	j	bnei_cont.37024
bnei_else.37025:
	add	%a0, %zero, %k1
bnei_cont.37026:
	j	bnei_cont.37024
bnei_else.37023:
bnei_cont.37024:
	flw	%f0, 0(%ra)
	beqi	%a0, 0, bnei_else.37027
	j	bnei_cont.37028
bnei_else.37027:
	fneg	%f0, %f0
bnei_cont.37028:
	fsub	%f0, %f0, %f21
	fdiv	%f16, %f0, %f2
	flw	%f0, 1(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	flw	%f0, 1(%ra)
	fblt	%f1, %f0, fbgt_else.37029
	add	%a0, %zero, %zero
	j	fbgt_cont.37030
fbgt_else.37029:
	add	%a0, %zero, %k1
fbgt_cont.37030:
	beqi	%a0, 0, bnei_else.37031
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37033
	add	%a0, %zero, %zero
	j	fbgt_cont.37034
fbgt_else.37033:
	add	%a0, %zero, %k1
fbgt_cont.37034:
	beqi	%a0, 0, bnei_else.37035
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37032
bnei_else.37035:
	add	%a0, %zero, %zero
bnei_cont.37036:
	j	bnei_cont.37032
bnei_else.37031:
	add	%a0, %zero, %zero
bnei_cont.37032:
bnei_cont.37020:
	beqi	%a0, 0, bnei_else.37037
	add	%s2, %zero, %k1
	j	bnei_cont.37038
bnei_else.37037:
	flw	%f16, 1(%k0)
	fbne	%f16, %fzero, fbeq_else.37039
	add	%a0, %zero, %k1
	j	fbeq_cont.37040
fbeq_else.37039:
	add	%a0, %zero, %zero
fbeq_cont.37040:
	beqi	%a0, 0, bnei_else.37041
	add	%a0, %zero, %zero
	j	bnei_cont.37042
bnei_else.37041:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.37043
	add	%a0, %zero, %zero
	j	fbgt_cont.37044
fbgt_else.37043:
	add	%a0, %zero, %k1
fbgt_cont.37044:
	beqi	%a2, 0, bnei_else.37045
	beqi	%a0, 0, bnei_else.37047
	add	%a0, %zero, %zero
	j	bnei_cont.37046
bnei_else.37047:
	add	%a0, %zero, %k1
bnei_cont.37048:
	j	bnei_cont.37046
bnei_else.37045:
bnei_cont.37046:
	flw	%f0, 1(%ra)
	beqi	%a0, 0, bnei_else.37049
	j	bnei_cont.37050
bnei_else.37049:
	fneg	%f0, %f0
bnei_cont.37050:
	fsub	%f0, %f0, %f22
	fdiv	%f20, %f0, %f16
	flw	%f0, 2(%k0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37051
	add	%a0, %zero, %zero
	j	fbgt_cont.37052
fbgt_else.37051:
	add	%a0, %zero, %k1
fbgt_cont.37052:
	beqi	%a0, 0, bnei_else.37053
	fmul	%f0, %f20, %f2
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 0(%ra)
	fblt	%f1, %f0, fbgt_else.37055
	add	%a0, %zero, %zero
	j	fbgt_cont.37056
fbgt_else.37055:
	add	%a0, %zero, %k1
fbgt_cont.37056:
	beqi	%a0, 0, bnei_else.37057
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37054
bnei_else.37057:
	add	%a0, %zero, %zero
bnei_cont.37058:
	j	bnei_cont.37054
bnei_else.37053:
	add	%a0, %zero, %zero
bnei_cont.37054:
bnei_cont.37042:
	beqi	%a0, 0, bnei_else.37059
	addi	%s2, %zero, 2
	j	bnei_cont.37060
bnei_else.37059:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.37061
	add	%a0, %zero, %k1
	j	fbeq_cont.37062
fbeq_else.37061:
	add	%a0, %zero, %zero
fbeq_cont.37062:
	beqi	%a0, 0, bnei_else.37063
	add	%a0, %zero, %zero
	j	bnei_cont.37064
bnei_else.37063:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.37065
	add	%a0, %zero, %zero
	j	fbgt_cont.37066
fbgt_else.37065:
	add	%a0, %zero, %k1
fbgt_cont.37066:
	beqi	%a2, 0, bnei_else.37067
	beqi	%a0, 0, bnei_else.37069
	add	%a0, %zero, %zero
	j	bnei_cont.37068
bnei_else.37069:
	add	%a0, %zero, %k1
bnei_cont.37070:
	j	bnei_cont.37068
bnei_else.37067:
bnei_cont.37068:
	flw	%f0, 2(%ra)
	beqi	%a0, 0, bnei_else.37071
	j	bnei_cont.37072
bnei_else.37071:
	fneg	%f0, %f0
bnei_cont.37072:
	fsub	%f0, %f0, %f23
	fdiv	%f20, %f0, %f1
	fmul	%f0, %f20, %f2
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 0(%ra)
	fblt	%f1, %f0, fbgt_else.37073
	add	%a0, %zero, %zero
	j	fbgt_cont.37074
fbgt_else.37073:
	add	%a0, %zero, %k1
fbgt_cont.37074:
	beqi	%a0, 0, bnei_else.37075
	fmul	%f0, %f20, %f16
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	flw	%f0, 1(%ra)
	fblt	%f1, %f0, fbgt_else.37077
	add	%a0, %zero, %zero
	j	fbgt_cont.37078
fbgt_else.37077:
	add	%a0, %zero, %k1
fbgt_cont.37078:
	beqi	%a0, 0, bnei_else.37079
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37076
bnei_else.37079:
	add	%a0, %zero, %zero
bnei_cont.37080:
	j	bnei_cont.37076
bnei_else.37075:
	add	%a0, %zero, %zero
bnei_cont.37076:
bnei_cont.37064:
	beqi	%a0, 0, bnei_else.37081
	addi	%s2, %zero, 3
	j	bnei_cont.37082
bnei_else.37081:
	add	%s2, %zero, %zero
bnei_cont.37082:
bnei_cont.37060:
bnei_cont.37038:
bnei_cont.36992:
	beqi	%s2, 0, bnei_else.37083
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.37084
	add	%a0, %zero, %zero
	j	fbgt_cont.37085
fbgt_else.37084:
	add	%a0, %zero, %k1
fbgt_cont.37085:
	beqi	%a0, 0, bnei_else.37086
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37088
	add	%a0, %zero, %zero
	j	fbgt_cont.37089
fbgt_else.37088:
	add	%a0, %zero, %k1
fbgt_cont.37089:
	beqi	%a0, 0, bnei_cont.37087
	flw	%f0, 466(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f0, %f0, %f22
	fadd	%f0, %f0, %f19
	flw	%f1, 1(%k0)
	fmul	%f1, %f1, %f22
	fadd	%f1, %f1, %f18
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f22
	fadd	%f2, %f16, %f17
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.37092
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.37094
	beqi	%a0, 2, bnei_else.37096
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.37098
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37099
bnei_else.37098:
bnei_cont.37099:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.37100
	j	bnei_cont.37101
bnei_else.37100:
	fsub	%f16, %f16, %f30
bnei_cont.37101:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.37102
	add	%a0, %zero, %zero
	j	fbgt_cont.37103
fbgt_else.37102:
	add	%a0, %zero, %k1
fbgt_cont.37103:
	beqi	%a1, 0, bnei_else.37104
	beqi	%a0, 0, bnei_else.37106
	add	%a0, %zero, %zero
	j	bnei_cont.37105
bnei_else.37106:
	add	%a0, %zero, %k1
bnei_cont.37107:
	j	bnei_cont.37105
bnei_else.37104:
bnei_cont.37105:
	beqi	%a0, 0, bnei_else.37108
	add	%a0, %zero, %zero
	j	bnei_cont.37095
bnei_else.37108:
	add	%a0, %zero, %k1
bnei_cont.37109:
	j	bnei_cont.37095
bnei_else.37096:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.37110
	add	%a0, %zero, %zero
	j	fbgt_cont.37111
fbgt_else.37110:
	add	%a0, %zero, %k1
fbgt_cont.37111:
	beqi	%a1, 0, bnei_else.37112
	beqi	%a0, 0, bnei_else.37114
	add	%a0, %zero, %zero
	j	bnei_cont.37113
bnei_else.37114:
	add	%a0, %zero, %k1
bnei_cont.37115:
	j	bnei_cont.37113
bnei_else.37112:
bnei_cont.37113:
	beqi	%a0, 0, bnei_else.37116
	add	%a0, %zero, %zero
	j	bnei_cont.37095
bnei_else.37116:
	add	%a0, %zero, %k1
bnei_cont.37117:
bnei_cont.37097:
	j	bnei_cont.37095
bnei_else.37094:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.37118
	add	%a0, %zero, %zero
	j	fbgt_cont.37119
fbgt_else.37118:
	add	%a0, %zero, %k1
fbgt_cont.37119:
	beqi	%a0, 0, bnei_else.37120
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.37122
	add	%a0, %zero, %zero
	j	fbgt_cont.37123
fbgt_else.37122:
	add	%a0, %zero, %k1
fbgt_cont.37123:
	beqi	%a0, 0, bnei_else.37124
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.37126
	add	%a0, %zero, %zero
	j	bnei_cont.37121
fbgt_else.37126:
	add	%a0, %zero, %k1
fbgt_cont.37127:
	j	bnei_cont.37121
bnei_else.37124:
	add	%a0, %zero, %zero
bnei_cont.37125:
	j	bnei_cont.37121
bnei_else.37120:
	add	%a0, %zero, %zero
bnei_cont.37121:
	beqi	%a0, 0, bnei_else.37128
	lw	%a0, 6(%a1)
	j	bnei_cont.37129
bnei_else.37128:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37130
	add	%a0, %zero, %zero
	j	bnei_cont.37131
bnei_else.37130:
	add	%a0, %zero, %k1
bnei_cont.37131:
bnei_cont.37129:
bnei_cont.37095:
	beqi	%a0, 0, bnei_else.37132
	add	%v0, %zero, %zero
	j	bnei_cont.37093
bnei_else.37132:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.37133:
	j	bnei_cont.37093
bnei_else.37092:
	add	%v0, %zero, %k1
bnei_cont.37093:
	beqi	%v0, 0, bnei_cont.37087
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s1, 141(%zero)
	sw	%s2, 136(%zero)
	j	bnei_cont.37087
bnei_else.37134:
bnei_cont.37135:
	j	bnei_cont.37087
bnei_else.37090:
bnei_cont.37091:
	j	bnei_cont.37087
bnei_else.37086:
bnei_cont.37087:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element.2934
bnei_else.37083:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37136
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element.2934
bnei_else.37136:
	add	%ra, %zero, %s0
	jr	%ra
bnei_else.36990:
	add	%ra, %zero, %s0
	jr	%ra
solve_one_or_network.2938:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37189
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37190
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37191
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37192
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37193
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37194
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37195
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37196
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	j	solve_one_or_network.2938
bnei_else.37196:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37195:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37194:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37193:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37192:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37191:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37190:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.37189:
	add	%ra, %zero, %s6
	jr	%ra
trace_or_matrix.2942:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	add	%at, %t7, %s7
	lw	%s3, 0(%at)
	lw	%a0, 0(%s3)
	beqi	%a0, -1, bnei_else.37609
	beqi	%a0, 99, bnei_else.37610
	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.37612
	beqi	%a0, 2, bnei_else.37614
	flw	%f25, 0(%t8)
	flw	%f24, 1(%t8)
	flw	%f26, 2(%t8)
	fmul	%f0, %f25, %f25
	lw	%a0, 4(%a1)
	flw	%f23, 0(%a0)
	fmul	%f1, %f0, %f23
	fmul	%f0, %f24, %f24
	lw	%a0, 4(%a1)
	flw	%f21, 1(%a0)
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26
	lw	%a0, 4(%a1)
	flw	%f18, 2(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.37616
	fmul	%f16, %f24, %f26
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f25, %f24
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.37617
bnei_else.37616:
bnei_cont.37617:
	fbne	%f0, %fzero, fbeq_else.37618
	add	%a0, %zero, %k1
	j	fbeq_cont.37619
fbeq_else.37618:
	add	%a0, %zero, %zero
fbeq_cont.37619:
	beqi	%a0, 0, bnei_else.37620
	add	%a0, %zero, %zero
	j	bnei_cont.37613
bnei_else.37620:
	fmul	%f1, %f25, %f19
	fmul	%f16, %f1, %f23
	fmul	%f1, %f24, %f2
	fmul	%f1, %f1, %f21
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%a2, 0, bnei_else.37622
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f22, %f17, %f16
	fmul	%f17, %f25, %f20
	fmul	%f16, %f26, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f22, %f22, %f16
	fmul	%f17, %f25, %f2
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f22, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37623
bnei_else.37622:
bnei_cont.37623:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f23
	fmul	%f16, %f2, %f2
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%a2, 0, bnei_else.37624
	fmul	%f18, %f2, %f20
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37625
bnei_else.37624:
bnei_cont.37625:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.37626
	j	bnei_cont.37627
bnei_else.37626:
	fsub	%f16, %f16, %f30
bnei_cont.37627:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.37628
	add	%a0, %zero, %zero
	j	fbgt_cont.37629
fbgt_else.37628:
	add	%a0, %zero, %k1
fbgt_cont.37629:
	beqi	%a0, 0, bnei_else.37630
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37632
	j	bnei_cont.37633
bnei_else.37632:
	fneg	%f16, %f16
bnei_cont.37633:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37613
bnei_else.37630:
	add	%a0, %zero, %zero
bnei_cont.37631:
bnei_cont.37621:
	j	bnei_cont.37613
bnei_else.37614:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%t8)
	flw	%f21, 0(%a0)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%t8)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t8)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.37634
	add	%a0, %zero, %zero
	j	fbgt_cont.37635
fbgt_else.37634:
	add	%a0, %zero, %k1
fbgt_cont.37635:
	beqi	%a0, 0, bnei_else.37636
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37613
bnei_else.37636:
	add	%a0, %zero, %zero
bnei_cont.37637:
bnei_cont.37615:
	j	bnei_cont.37613
bnei_else.37612:
	flw	%f17, 0(%t8)
	fbne	%f17, %fzero, fbeq_else.37638
	add	%a0, %zero, %k1
	j	fbeq_cont.37639
fbeq_else.37638:
	add	%a0, %zero, %zero
fbeq_cont.37639:
	beqi	%a0, 0, bnei_else.37640
	add	%a0, %zero, %zero
	j	bnei_cont.37641
bnei_else.37640:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f17, %fzero, fbgt_else.37642
	add	%a0, %zero, %zero
	j	fbgt_cont.37643
fbgt_else.37642:
	add	%a0, %zero, %k1
fbgt_cont.37643:
	beqi	%a2, 0, bnei_else.37644
	beqi	%a0, 0, bnei_else.37646
	add	%a0, %zero, %zero
	j	bnei_cont.37645
bnei_else.37646:
	add	%a0, %zero, %k1
bnei_cont.37647:
	j	bnei_cont.37645
bnei_else.37644:
bnei_cont.37645:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.37648
	j	bnei_cont.37649
bnei_else.37648:
	fneg	%f0, %f0
bnei_cont.37649:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a3)
	fblt	%f1, %f0, fbgt_else.37650
	add	%a0, %zero, %zero
	j	fbgt_cont.37651
fbgt_else.37650:
	add	%a0, %zero, %k1
fbgt_cont.37651:
	beqi	%a0, 0, bnei_else.37652
	flw	%f0, 2(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.37654
	add	%a0, %zero, %zero
	j	fbgt_cont.37655
fbgt_else.37654:
	add	%a0, %zero, %k1
fbgt_cont.37655:
	beqi	%a0, 0, bnei_else.37656
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37653
bnei_else.37656:
	add	%a0, %zero, %zero
bnei_cont.37657:
	j	bnei_cont.37653
bnei_else.37652:
	add	%a0, %zero, %zero
bnei_cont.37653:
bnei_cont.37641:
	beqi	%a0, 0, bnei_else.37658
	add	%a0, %zero, %k1
	j	bnei_cont.37659
bnei_else.37658:
	flw	%f16, 1(%t8)
	fbne	%f16, %fzero, fbeq_else.37660
	add	%a0, %zero, %k1
	j	fbeq_cont.37661
fbeq_else.37660:
	add	%a0, %zero, %zero
fbeq_cont.37661:
	beqi	%a0, 0, bnei_else.37662
	add	%a0, %zero, %zero
	j	bnei_cont.37663
bnei_else.37662:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.37664
	add	%a0, %zero, %zero
	j	fbgt_cont.37665
fbgt_else.37664:
	add	%a0, %zero, %k1
fbgt_cont.37665:
	beqi	%a2, 0, bnei_else.37666
	beqi	%a0, 0, bnei_else.37668
	add	%a0, %zero, %zero
	j	bnei_cont.37667
bnei_else.37668:
	add	%a0, %zero, %k1
bnei_cont.37669:
	j	bnei_cont.37667
bnei_else.37666:
bnei_cont.37667:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.37670
	j	bnei_cont.37671
bnei_else.37670:
	fneg	%f0, %f0
bnei_cont.37671:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	flw	%f0, 2(%t8)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.37672
	add	%a0, %zero, %zero
	j	fbgt_cont.37673
fbgt_else.37672:
	add	%a0, %zero, %k1
fbgt_cont.37673:
	beqi	%a0, 0, bnei_else.37674
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a3)
	fblt	%f1, %f0, fbgt_else.37676
	add	%a0, %zero, %zero
	j	fbgt_cont.37677
fbgt_else.37676:
	add	%a0, %zero, %k1
fbgt_cont.37677:
	beqi	%a0, 0, bnei_else.37678
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37675
bnei_else.37678:
	add	%a0, %zero, %zero
bnei_cont.37679:
	j	bnei_cont.37675
bnei_else.37674:
	add	%a0, %zero, %zero
bnei_cont.37675:
bnei_cont.37663:
	beqi	%a0, 0, bnei_else.37680
	addi	%a0, %zero, 2
	j	bnei_cont.37681
bnei_else.37680:
	flw	%f1, 2(%t8)
	fbne	%f1, %fzero, fbeq_else.37682
	add	%a0, %zero, %k1
	j	fbeq_cont.37683
fbeq_else.37682:
	add	%a0, %zero, %zero
fbeq_cont.37683:
	beqi	%a0, 0, bnei_else.37684
	add	%a0, %zero, %zero
	j	bnei_cont.37685
bnei_else.37684:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.37686
	add	%a0, %zero, %zero
	j	fbgt_cont.37687
fbgt_else.37686:
	add	%a0, %zero, %k1
fbgt_cont.37687:
	beqi	%a1, 0, bnei_else.37688
	beqi	%a0, 0, bnei_else.37690
	add	%a0, %zero, %zero
	j	bnei_cont.37689
bnei_else.37690:
	add	%a0, %zero, %k1
bnei_cont.37691:
	j	bnei_cont.37689
bnei_else.37688:
bnei_cont.37689:
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.37692
	j	bnei_cont.37693
bnei_else.37692:
	fneg	%f0, %f0
bnei_cont.37693:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a2)
	fblt	%f1, %f0, fbgt_else.37694
	add	%a0, %zero, %zero
	j	fbgt_cont.37695
fbgt_else.37694:
	add	%a0, %zero, %k1
fbgt_cont.37695:
	beqi	%a0, 0, bnei_else.37696
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.37698
	add	%a0, %zero, %zero
	j	fbgt_cont.37699
fbgt_else.37698:
	add	%a0, %zero, %k1
fbgt_cont.37699:
	beqi	%a0, 0, bnei_else.37700
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37697
bnei_else.37700:
	add	%a0, %zero, %zero
bnei_cont.37701:
	j	bnei_cont.37697
bnei_else.37696:
	add	%a0, %zero, %zero
bnei_cont.37697:
bnei_cont.37685:
	beqi	%a0, 0, bnei_else.37702
	addi	%a0, %zero, 3
	j	bnei_cont.37703
bnei_else.37702:
	add	%a0, %zero, %zero
bnei_cont.37703:
bnei_cont.37681:
bnei_cont.37659:
bnei_cont.37613:
	beqi	%a0, 0, bnei_cont.37611
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37706
	add	%a0, %zero, %zero
	j	fbgt_cont.37707
fbgt_else.37706:
	add	%a0, %zero, %k1
fbgt_cont.37707:
	beqi	%a0, 0, bnei_cont.37611
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.37611
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938
	j	bnei_cont.37611
bnei_else.37722:
bnei_cont.37723:
	j	bnei_cont.37611
bnei_else.37720:
bnei_cont.37721:
	j	bnei_cont.37611
bnei_else.37718:
bnei_cont.37719:
	j	bnei_cont.37611
bnei_else.37716:
bnei_cont.37717:
	j	bnei_cont.37611
bnei_else.37714:
bnei_cont.37715:
	j	bnei_cont.37611
bnei_else.37712:
bnei_cont.37713:
	j	bnei_cont.37611
bnei_else.37710:
bnei_cont.37711:
	j	bnei_cont.37611
bnei_else.37708:
bnei_cont.37709:
	j	bnei_cont.37611
bnei_else.37704:
bnei_cont.37705:
	j	bnei_cont.37611
bnei_else.37610:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.37724
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.37725
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938
	j	bnei_cont.37725
bnei_else.37736:
bnei_cont.37737:
	j	bnei_cont.37725
bnei_else.37734:
bnei_cont.37735:
	j	bnei_cont.37725
bnei_else.37732:
bnei_cont.37733:
	j	bnei_cont.37725
bnei_else.37730:
bnei_cont.37731:
	j	bnei_cont.37725
bnei_else.37728:
bnei_cont.37729:
	j	bnei_cont.37725
bnei_else.37726:
bnei_cont.37727:
	j	bnei_cont.37725
bnei_else.37724:
bnei_cont.37725:
bnei_cont.37611:
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%s3, 0(%at)
	lw	%a0, 0(%s3)
	beqi	%a0, -1, bnei_else.37738
	beqi	%a0, 99, bnei_else.37739
	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.37741
	beqi	%a0, 2, bnei_else.37743
	flw	%f22, 0(%t8)
	flw	%f21, 1(%t8)
	flw	%f23, 2(%t8)
	fmul	%f1, %f22, %f22
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.37745
	fmul	%f16, %f21, %f23
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f23, %f22
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f22, %f21
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.37746
bnei_else.37745:
bnei_cont.37746:
	fbne	%f0, %fzero, fbeq_else.37747
	add	%a0, %zero, %k1
	j	fbeq_cont.37748
fbeq_else.37747:
	add	%a0, %zero, %zero
fbeq_cont.37748:
	beqi	%a0, 0, bnei_else.37749
	add	%a0, %zero, %zero
	j	bnei_cont.37742
bnei_else.37749:
	fmul	%f16, %f22, %f19
	lw	%a0, 4(%a1)
	flw	%f1, 0(%a0)
	fmul	%f17, %f16, %f1
	fmul	%f16, %f21, %f2
	lw	%a0, 4(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f17, %f17, %f1
	fmul	%f16, %f23, %f20
	lw	%a0, 4(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f1, %f17, %f1
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.37751
	fmul	%f17, %f23, %f2
	fmul	%f16, %f21, %f20
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f22, %f20
	fmul	%f16, %f23, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f22, %f2
	fmul	%f16, %f21, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f18, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37752
bnei_else.37751:
bnei_cont.37752:
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f2, %f2
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.37753
	fmul	%f18, %f2, %f20
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.37754
bnei_else.37753:
bnei_cont.37754:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.37755
	j	bnei_cont.37756
bnei_else.37755:
	fsub	%f16, %f16, %f30
bnei_cont.37756:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.37757
	add	%a0, %zero, %zero
	j	fbgt_cont.37758
fbgt_else.37757:
	add	%a0, %zero, %k1
fbgt_cont.37758:
	beqi	%a0, 0, bnei_else.37759
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37761
	j	bnei_cont.37762
bnei_else.37761:
	fneg	%f16, %f16
bnei_cont.37762:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37742
bnei_else.37759:
	add	%a0, %zero, %zero
bnei_cont.37760:
bnei_cont.37750:
	j	bnei_cont.37742
bnei_else.37743:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%t8)
	flw	%f21, 0(%a0)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%t8)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t8)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.37763
	add	%a0, %zero, %zero
	j	fbgt_cont.37764
fbgt_else.37763:
	add	%a0, %zero, %k1
fbgt_cont.37764:
	beqi	%a0, 0, bnei_else.37765
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37742
bnei_else.37765:
	add	%a0, %zero, %zero
bnei_cont.37766:
bnei_cont.37744:
	j	bnei_cont.37742
bnei_else.37741:
	flw	%f17, 0(%t8)
	fbne	%f17, %fzero, fbeq_else.37767
	add	%a0, %zero, %k1
	j	fbeq_cont.37768
fbeq_else.37767:
	add	%a0, %zero, %zero
fbeq_cont.37768:
	beqi	%a0, 0, bnei_else.37769
	add	%a0, %zero, %zero
	j	bnei_cont.37770
bnei_else.37769:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f17, %fzero, fbgt_else.37771
	add	%a0, %zero, %zero
	j	fbgt_cont.37772
fbgt_else.37771:
	add	%a0, %zero, %k1
fbgt_cont.37772:
	beqi	%a2, 0, bnei_else.37773
	beqi	%a0, 0, bnei_else.37775
	add	%a0, %zero, %zero
	j	bnei_cont.37774
bnei_else.37775:
	add	%a0, %zero, %k1
bnei_cont.37776:
	j	bnei_cont.37774
bnei_else.37773:
bnei_cont.37774:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.37777
	j	bnei_cont.37778
bnei_else.37777:
	fneg	%f0, %f0
bnei_cont.37778:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a3)
	fblt	%f1, %f0, fbgt_else.37779
	add	%a0, %zero, %zero
	j	fbgt_cont.37780
fbgt_else.37779:
	add	%a0, %zero, %k1
fbgt_cont.37780:
	beqi	%a0, 0, bnei_else.37781
	flw	%f0, 2(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.37783
	add	%a0, %zero, %zero
	j	fbgt_cont.37784
fbgt_else.37783:
	add	%a0, %zero, %k1
fbgt_cont.37784:
	beqi	%a0, 0, bnei_else.37785
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37782
bnei_else.37785:
	add	%a0, %zero, %zero
bnei_cont.37786:
	j	bnei_cont.37782
bnei_else.37781:
	add	%a0, %zero, %zero
bnei_cont.37782:
bnei_cont.37770:
	beqi	%a0, 0, bnei_else.37787
	add	%a0, %zero, %k1
	j	bnei_cont.37788
bnei_else.37787:
	flw	%f16, 1(%t8)
	fbne	%f16, %fzero, fbeq_else.37789
	add	%a0, %zero, %k1
	j	fbeq_cont.37790
fbeq_else.37789:
	add	%a0, %zero, %zero
fbeq_cont.37790:
	beqi	%a0, 0, bnei_else.37791
	add	%a0, %zero, %zero
	j	bnei_cont.37792
bnei_else.37791:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.37793
	add	%a0, %zero, %zero
	j	fbgt_cont.37794
fbgt_else.37793:
	add	%a0, %zero, %k1
fbgt_cont.37794:
	beqi	%a2, 0, bnei_else.37795
	beqi	%a0, 0, bnei_else.37797
	add	%a0, %zero, %zero
	j	bnei_cont.37796
bnei_else.37797:
	add	%a0, %zero, %k1
bnei_cont.37798:
	j	bnei_cont.37796
bnei_else.37795:
bnei_cont.37796:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.37799
	j	bnei_cont.37800
bnei_else.37799:
	fneg	%f0, %f0
bnei_cont.37800:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	flw	%f0, 2(%t8)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.37801
	add	%a0, %zero, %zero
	j	fbgt_cont.37802
fbgt_else.37801:
	add	%a0, %zero, %k1
fbgt_cont.37802:
	beqi	%a0, 0, bnei_else.37803
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a3)
	fblt	%f1, %f0, fbgt_else.37805
	add	%a0, %zero, %zero
	j	fbgt_cont.37806
fbgt_else.37805:
	add	%a0, %zero, %k1
fbgt_cont.37806:
	beqi	%a0, 0, bnei_else.37807
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37804
bnei_else.37807:
	add	%a0, %zero, %zero
bnei_cont.37808:
	j	bnei_cont.37804
bnei_else.37803:
	add	%a0, %zero, %zero
bnei_cont.37804:
bnei_cont.37792:
	beqi	%a0, 0, bnei_else.37809
	addi	%a0, %zero, 2
	j	bnei_cont.37810
bnei_else.37809:
	flw	%f1, 2(%t8)
	fbne	%f1, %fzero, fbeq_else.37811
	add	%a0, %zero, %k1
	j	fbeq_cont.37812
fbeq_else.37811:
	add	%a0, %zero, %zero
fbeq_cont.37812:
	beqi	%a0, 0, bnei_else.37813
	add	%a0, %zero, %zero
	j	bnei_cont.37814
bnei_else.37813:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.37815
	add	%a0, %zero, %zero
	j	fbgt_cont.37816
fbgt_else.37815:
	add	%a0, %zero, %k1
fbgt_cont.37816:
	beqi	%a1, 0, bnei_else.37817
	beqi	%a0, 0, bnei_else.37819
	add	%a0, %zero, %zero
	j	bnei_cont.37818
bnei_else.37819:
	add	%a0, %zero, %k1
bnei_cont.37820:
	j	bnei_cont.37818
bnei_else.37817:
bnei_cont.37818:
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.37821
	j	bnei_cont.37822
bnei_else.37821:
	fneg	%f0, %f0
bnei_cont.37822:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a2)
	fblt	%f1, %f0, fbgt_else.37823
	add	%a0, %zero, %zero
	j	fbgt_cont.37824
fbgt_else.37823:
	add	%a0, %zero, %k1
fbgt_cont.37824:
	beqi	%a0, 0, bnei_else.37825
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.37827
	add	%a0, %zero, %zero
	j	fbgt_cont.37828
fbgt_else.37827:
	add	%a0, %zero, %k1
fbgt_cont.37828:
	beqi	%a0, 0, bnei_else.37829
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.37826
bnei_else.37829:
	add	%a0, %zero, %zero
bnei_cont.37830:
	j	bnei_cont.37826
bnei_else.37825:
	add	%a0, %zero, %zero
bnei_cont.37826:
bnei_cont.37814:
	beqi	%a0, 0, bnei_else.37831
	addi	%a0, %zero, 3
	j	bnei_cont.37832
bnei_else.37831:
	add	%a0, %zero, %zero
bnei_cont.37832:
bnei_cont.37810:
bnei_cont.37788:
bnei_cont.37742:
	beqi	%a0, 0, bnei_cont.37740
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37835
	add	%a0, %zero, %zero
	j	fbgt_cont.37836
fbgt_else.37835:
	add	%a0, %zero, %k1
fbgt_cont.37836:
	beqi	%a0, 0, bnei_cont.37740
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.37740
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938
	j	bnei_cont.37740
bnei_else.37849:
bnei_cont.37850:
	j	bnei_cont.37740
bnei_else.37847:
bnei_cont.37848:
	j	bnei_cont.37740
bnei_else.37845:
bnei_cont.37846:
	j	bnei_cont.37740
bnei_else.37843:
bnei_cont.37844:
	j	bnei_cont.37740
bnei_else.37841:
bnei_cont.37842:
	j	bnei_cont.37740
bnei_else.37839:
bnei_cont.37840:
	j	bnei_cont.37740
bnei_else.37837:
bnei_cont.37838:
	j	bnei_cont.37740
bnei_else.37833:
bnei_cont.37834:
	j	bnei_cont.37740
bnei_else.37739:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.37851
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.37852
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.37852
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.37852
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.37852
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.37852
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938
	j	bnei_cont.37852
bnei_else.37861:
bnei_cont.37862:
	j	bnei_cont.37852
bnei_else.37859:
bnei_cont.37860:
	j	bnei_cont.37852
bnei_else.37857:
bnei_cont.37858:
	j	bnei_cont.37852
bnei_else.37855:
bnei_cont.37856:
	j	bnei_cont.37852
bnei_else.37853:
bnei_cont.37854:
	j	bnei_cont.37852
bnei_else.37851:
bnei_cont.37852:
bnei_cont.37740:
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	trace_or_matrix.2942
bnei_else.37738:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.37609:
	add	%ra, %zero, %t9
	jr	%ra
solve_each_element_fast.2948:
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra
	lw	%a1, 0(%k0)
	add	%at, %v1, %a3
	lw	%s1, 0(%at)
	beqi	%s1, -1, bnei_else.38062
	lw	%a2, 12(%s1)
	lw	%s2, 10(%a2)
	flw	%f19, 0(%s2)
	flw	%f16, 1(%s2)
	flw	%f17, 2(%s2)
	lw	%a0, 1(%k0)
	add	%at, %a0, %s1
	lw	%ra, 0(%at)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.38063
	beqi	%a0, 2, bnei_else.38065
	flw	%f18, 0(%ra)
	fbne	%f18, %fzero, fbeq_else.38067
	add	%a0, %zero, %k1
	j	fbeq_cont.38068
fbeq_else.38067:
	add	%a0, %zero, %zero
fbeq_cont.38068:
	beqi	%a0, 0, bnei_else.38069
	add	%s2, %zero, %zero
	j	bnei_cont.38064
bnei_else.38069:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%s2)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38071
	add	%a0, %zero, %zero
	j	fbgt_cont.38072
fbgt_else.38071:
	add	%a0, %zero, %k1
fbgt_cont.38072:
	beqi	%a0, 0, bnei_else.38073
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.38075
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38076
bnei_else.38075:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38076:
	add	%s2, %zero, %k1
	j	bnei_cont.38064
bnei_else.38073:
	add	%s2, %zero, %zero
bnei_cont.38074:
bnei_cont.38070:
	j	bnei_cont.38064
bnei_else.38065:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.38077
	add	%a0, %zero, %zero
	j	fbgt_cont.38078
fbgt_else.38077:
	add	%a0, %zero, %k1
fbgt_cont.38078:
	beqi	%a0, 0, bnei_else.38079
	flw	%f0, 3(%s2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s2, %zero, %k1
	j	bnei_cont.38064
bnei_else.38079:
	add	%s2, %zero, %zero
bnei_cont.38080:
bnei_cont.38066:
	j	bnei_cont.38064
bnei_else.38063:
	lw	%s2, 0(%k0)
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f19
	flw	%f20, 1(%ra)
	fmul	%f2, %f0, %f20
	flw	%f18, 1(%s2)
	fmul	%f0, %f2, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38081
	add	%a0, %zero, %zero
	j	fbgt_cont.38082
fbgt_else.38081:
	add	%a0, %zero, %k1
fbgt_cont.38082:
	beqi	%a0, 0, bnei_else.38083
	flw	%f0, 2(%s2)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38085
	add	%a0, %zero, %zero
	j	fbgt_cont.38086
fbgt_else.38085:
	add	%a0, %zero, %k1
fbgt_cont.38086:
	beqi	%a0, 0, bnei_else.38087
	fbne	%f20, %fzero, fbeq_else.38089
	add	%a0, %zero, %k1
	j	fbeq_cont.38090
fbeq_else.38089:
	add	%a0, %zero, %zero
fbeq_cont.38090:
	beqi	%a0, 0, bnei_else.38091
	add	%a0, %zero, %zero
	j	bnei_cont.38084
bnei_else.38091:
	add	%a0, %zero, %k1
bnei_cont.38092:
	j	bnei_cont.38084
bnei_else.38087:
	add	%a0, %zero, %zero
bnei_cont.38088:
	j	bnei_cont.38084
bnei_else.38083:
	add	%a0, %zero, %zero
bnei_cont.38084:
	beqi	%a0, 0, bnei_else.38093
	fsw	%f2, 135(%zero)
	add	%s2, %zero, %k1
	j	bnei_cont.38094
bnei_else.38093:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f16
	flw	%f21, 3(%ra)
	fmul	%f2, %f0, %f21
	flw	%f20, 0(%s2)
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38095
	add	%a0, %zero, %zero
	j	fbgt_cont.38096
fbgt_else.38095:
	add	%a0, %zero, %k1
fbgt_cont.38096:
	beqi	%a0, 0, bnei_else.38097
	flw	%f0, 2(%s2)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38099
	add	%a0, %zero, %zero
	j	fbgt_cont.38100
fbgt_else.38099:
	add	%a0, %zero, %k1
fbgt_cont.38100:
	beqi	%a0, 0, bnei_else.38101
	fbne	%f21, %fzero, fbeq_else.38103
	add	%a0, %zero, %k1
	j	fbeq_cont.38104
fbeq_else.38103:
	add	%a0, %zero, %zero
fbeq_cont.38104:
	beqi	%a0, 0, bnei_else.38105
	add	%a0, %zero, %zero
	j	bnei_cont.38098
bnei_else.38105:
	add	%a0, %zero, %k1
bnei_cont.38106:
	j	bnei_cont.38098
bnei_else.38101:
	add	%a0, %zero, %zero
bnei_cont.38102:
	j	bnei_cont.38098
bnei_else.38097:
	add	%a0, %zero, %zero
bnei_cont.38098:
	beqi	%a0, 0, bnei_else.38107
	fsw	%f2, 135(%zero)
	addi	%s2, %zero, 2
	j	bnei_cont.38108
bnei_else.38107:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f17
	flw	%f2, 5(%ra)
	fmul	%f17, %f0, %f2
	fmul	%f0, %f17, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38109
	add	%a0, %zero, %zero
	j	fbgt_cont.38110
fbgt_else.38109:
	add	%a0, %zero, %k1
fbgt_cont.38110:
	beqi	%a0, 0, bnei_else.38111
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38113
	add	%a0, %zero, %zero
	j	fbgt_cont.38114
fbgt_else.38113:
	add	%a0, %zero, %k1
fbgt_cont.38114:
	beqi	%a0, 0, bnei_else.38115
	fbne	%f2, %fzero, fbeq_else.38117
	add	%a0, %zero, %k1
	j	fbeq_cont.38118
fbeq_else.38117:
	add	%a0, %zero, %zero
fbeq_cont.38118:
	beqi	%a0, 0, bnei_else.38119
	add	%a0, %zero, %zero
	j	bnei_cont.38112
bnei_else.38119:
	add	%a0, %zero, %k1
bnei_cont.38120:
	j	bnei_cont.38112
bnei_else.38115:
	add	%a0, %zero, %zero
bnei_cont.38116:
	j	bnei_cont.38112
bnei_else.38111:
	add	%a0, %zero, %zero
bnei_cont.38112:
	beqi	%a0, 0, bnei_else.38121
	fsw	%f17, 135(%zero)
	addi	%s2, %zero, 3
	j	bnei_cont.38122
bnei_else.38121:
	add	%s2, %zero, %zero
bnei_cont.38122:
bnei_cont.38108:
bnei_cont.38094:
bnei_cont.38064:
	beqi	%s2, 0, bnei_else.38123
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.38124
	add	%a0, %zero, %zero
	j	fbgt_cont.38125
fbgt_else.38124:
	add	%a0, %zero, %k1
fbgt_cont.38125:
	beqi	%a0, 0, bnei_else.38126
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38128
	add	%a0, %zero, %zero
	j	fbgt_cont.38129
fbgt_else.38128:
	add	%a0, %zero, %k1
fbgt_cont.38129:
	beqi	%a0, 0, bnei_cont.38127
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
	beqi	%a0, -1, bnei_else.38132
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.38134
	beqi	%a0, 2, bnei_else.38136
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.38138
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.38139
bnei_else.38138:
bnei_cont.38139:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.38140
	j	bnei_cont.38141
bnei_else.38140:
	fsub	%f16, %f16, %f30
bnei_cont.38141:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.38142
	add	%a0, %zero, %zero
	j	fbgt_cont.38143
fbgt_else.38142:
	add	%a0, %zero, %k1
fbgt_cont.38143:
	beqi	%a1, 0, bnei_else.38144
	beqi	%a0, 0, bnei_else.38146
	add	%a0, %zero, %zero
	j	bnei_cont.38145
bnei_else.38146:
	add	%a0, %zero, %k1
bnei_cont.38147:
	j	bnei_cont.38145
bnei_else.38144:
bnei_cont.38145:
	beqi	%a0, 0, bnei_else.38148
	add	%a0, %zero, %zero
	j	bnei_cont.38135
bnei_else.38148:
	add	%a0, %zero, %k1
bnei_cont.38149:
	j	bnei_cont.38135
bnei_else.38136:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.38150
	add	%a0, %zero, %zero
	j	fbgt_cont.38151
fbgt_else.38150:
	add	%a0, %zero, %k1
fbgt_cont.38151:
	beqi	%a1, 0, bnei_else.38152
	beqi	%a0, 0, bnei_else.38154
	add	%a0, %zero, %zero
	j	bnei_cont.38153
bnei_else.38154:
	add	%a0, %zero, %k1
bnei_cont.38155:
	j	bnei_cont.38153
bnei_else.38152:
bnei_cont.38153:
	beqi	%a0, 0, bnei_else.38156
	add	%a0, %zero, %zero
	j	bnei_cont.38135
bnei_else.38156:
	add	%a0, %zero, %k1
bnei_cont.38157:
bnei_cont.38137:
	j	bnei_cont.38135
bnei_else.38134:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.38158
	add	%a0, %zero, %zero
	j	fbgt_cont.38159
fbgt_else.38158:
	add	%a0, %zero, %k1
fbgt_cont.38159:
	beqi	%a0, 0, bnei_else.38160
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.38162
	add	%a0, %zero, %zero
	j	fbgt_cont.38163
fbgt_else.38162:
	add	%a0, %zero, %k1
fbgt_cont.38163:
	beqi	%a0, 0, bnei_else.38164
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.38166
	add	%a0, %zero, %zero
	j	bnei_cont.38161
fbgt_else.38166:
	add	%a0, %zero, %k1
fbgt_cont.38167:
	j	bnei_cont.38161
bnei_else.38164:
	add	%a0, %zero, %zero
bnei_cont.38165:
	j	bnei_cont.38161
bnei_else.38160:
	add	%a0, %zero, %zero
bnei_cont.38161:
	beqi	%a0, 0, bnei_else.38168
	lw	%a0, 6(%a1)
	j	bnei_cont.38169
bnei_else.38168:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.38170
	add	%a0, %zero, %zero
	j	bnei_cont.38171
bnei_else.38170:
	add	%a0, %zero, %k1
bnei_cont.38171:
bnei_cont.38169:
bnei_cont.38135:
	beqi	%a0, 0, bnei_else.38172
	add	%v0, %zero, %zero
	j	bnei_cont.38133
bnei_else.38172:
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.38173:
	j	bnei_cont.38133
bnei_else.38132:
	add	%v0, %zero, %k1
bnei_cont.38133:
	beqi	%v0, 0, bnei_cont.38127
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s1, 141(%zero)
	sw	%s2, 136(%zero)
	j	bnei_cont.38127
bnei_else.38174:
bnei_cont.38175:
	j	bnei_cont.38127
bnei_else.38130:
bnei_cont.38131:
	j	bnei_cont.38127
bnei_else.38126:
bnei_cont.38127:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.38123:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.38176
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.38176:
	add	%ra, %zero, %s0
	jr	%ra
bnei_else.38062:
	add	%ra, %zero, %s0
	jr	%ra
solve_one_or_network_fast.2952:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38229
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38230
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38231
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38232
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38233
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38234
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38235
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38236
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	j	solve_one_or_network_fast.2952
bnei_else.38236:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38235:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38234:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38233:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38232:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38231:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38230:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38229:
	add	%ra, %zero, %s6
	jr	%ra
trace_or_matrix_fast.2956:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	add	%at, %t7, %s7
	lw	%s3, 0(%at)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.38553
	beqi	%a2, 99, bnei_else.38554
	lw	%a1, 12(%a2)
	lw	%a3, 10(%a1)
	flw	%f19, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f17, 2(%a3)
	lw	%a0, 1(%t8)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.38556
	beqi	%a0, 2, bnei_else.38558
	flw	%f18, 0(%a2)
	fbne	%f18, %fzero, fbeq_else.38560
	add	%a0, %zero, %k1
	j	fbeq_cont.38561
fbeq_else.38560:
	add	%a0, %zero, %zero
fbeq_cont.38561:
	beqi	%a0, 0, bnei_else.38562
	add	%a0, %zero, %zero
	j	bnei_cont.38557
bnei_else.38562:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38564
	add	%a0, %zero, %zero
	j	fbgt_cont.38565
fbgt_else.38564:
	add	%a0, %zero, %k1
fbgt_cont.38565:
	beqi	%a0, 0, bnei_else.38566
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.38568
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38569
bnei_else.38568:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38569:
	add	%a0, %zero, %k1
	j	bnei_cont.38557
bnei_else.38566:
	add	%a0, %zero, %zero
bnei_cont.38567:
bnei_cont.38563:
	j	bnei_cont.38557
bnei_else.38558:
	flw	%f1, 0(%a2)
	fblt	%f1, %fzero, fbgt_else.38570
	add	%a0, %zero, %zero
	j	fbgt_cont.38571
fbgt_else.38570:
	add	%a0, %zero, %k1
fbgt_cont.38571:
	beqi	%a0, 0, bnei_else.38572
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38557
bnei_else.38572:
	add	%a0, %zero, %zero
bnei_cont.38573:
bnei_cont.38559:
	j	bnei_cont.38557
bnei_else.38556:
	lw	%a3, 0(%t8)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f19
	flw	%f20, 1(%a2)
	fmul	%f2, %f0, %f20
	flw	%f18, 1(%a3)
	fmul	%f0, %f2, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38574
	add	%a0, %zero, %zero
	j	fbgt_cont.38575
fbgt_else.38574:
	add	%a0, %zero, %k1
fbgt_cont.38575:
	beqi	%a0, 0, bnei_else.38576
	flw	%f0, 2(%a3)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38578
	add	%a0, %zero, %zero
	j	fbgt_cont.38579
fbgt_else.38578:
	add	%a0, %zero, %k1
fbgt_cont.38579:
	beqi	%a0, 0, bnei_else.38580
	fbne	%f20, %fzero, fbeq_else.38582
	add	%a0, %zero, %k1
	j	fbeq_cont.38583
fbeq_else.38582:
	add	%a0, %zero, %zero
fbeq_cont.38583:
	beqi	%a0, 0, bnei_else.38584
	add	%a0, %zero, %zero
	j	bnei_cont.38577
bnei_else.38584:
	add	%a0, %zero, %k1
bnei_cont.38585:
	j	bnei_cont.38577
bnei_else.38580:
	add	%a0, %zero, %zero
bnei_cont.38581:
	j	bnei_cont.38577
bnei_else.38576:
	add	%a0, %zero, %zero
bnei_cont.38577:
	beqi	%a0, 0, bnei_else.38586
	fsw	%f2, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38587
bnei_else.38586:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f16
	flw	%f21, 3(%a2)
	fmul	%f2, %f0, %f21
	flw	%f20, 0(%a3)
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38588
	add	%a0, %zero, %zero
	j	fbgt_cont.38589
fbgt_else.38588:
	add	%a0, %zero, %k1
fbgt_cont.38589:
	beqi	%a0, 0, bnei_else.38590
	flw	%f0, 2(%a3)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38592
	add	%a0, %zero, %zero
	j	fbgt_cont.38593
fbgt_else.38592:
	add	%a0, %zero, %k1
fbgt_cont.38593:
	beqi	%a0, 0, bnei_else.38594
	fbne	%f21, %fzero, fbeq_else.38596
	add	%a0, %zero, %k1
	j	fbeq_cont.38597
fbeq_else.38596:
	add	%a0, %zero, %zero
fbeq_cont.38597:
	beqi	%a0, 0, bnei_else.38598
	add	%a0, %zero, %zero
	j	bnei_cont.38591
bnei_else.38598:
	add	%a0, %zero, %k1
bnei_cont.38599:
	j	bnei_cont.38591
bnei_else.38594:
	add	%a0, %zero, %zero
bnei_cont.38595:
	j	bnei_cont.38591
bnei_else.38590:
	add	%a0, %zero, %zero
bnei_cont.38591:
	beqi	%a0, 0, bnei_else.38600
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38601
bnei_else.38600:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f17
	flw	%f2, 5(%a2)
	fmul	%f17, %f0, %f2
	fmul	%f0, %f17, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38602
	add	%a0, %zero, %zero
	j	fbgt_cont.38603
fbgt_else.38602:
	add	%a0, %zero, %k1
fbgt_cont.38603:
	beqi	%a0, 0, bnei_else.38604
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38606
	add	%a0, %zero, %zero
	j	fbgt_cont.38607
fbgt_else.38606:
	add	%a0, %zero, %k1
fbgt_cont.38607:
	beqi	%a0, 0, bnei_else.38608
	fbne	%f2, %fzero, fbeq_else.38610
	add	%a0, %zero, %k1
	j	fbeq_cont.38611
fbeq_else.38610:
	add	%a0, %zero, %zero
fbeq_cont.38611:
	beqi	%a0, 0, bnei_else.38612
	add	%a0, %zero, %zero
	j	bnei_cont.38605
bnei_else.38612:
	add	%a0, %zero, %k1
bnei_cont.38613:
	j	bnei_cont.38605
bnei_else.38608:
	add	%a0, %zero, %zero
bnei_cont.38609:
	j	bnei_cont.38605
bnei_else.38604:
	add	%a0, %zero, %zero
bnei_cont.38605:
	beqi	%a0, 0, bnei_else.38614
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38615
bnei_else.38614:
	add	%a0, %zero, %zero
bnei_cont.38615:
bnei_cont.38601:
bnei_cont.38587:
bnei_cont.38557:
	beqi	%a0, 0, bnei_cont.38555
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38618
	add	%a0, %zero, %zero
	j	fbgt_cont.38619
fbgt_else.38618:
	add	%a0, %zero, %k1
fbgt_cont.38619:
	beqi	%a0, 0, bnei_cont.38555
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.38555
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952
	j	bnei_cont.38555
bnei_else.38634:
bnei_cont.38635:
	j	bnei_cont.38555
bnei_else.38632:
bnei_cont.38633:
	j	bnei_cont.38555
bnei_else.38630:
bnei_cont.38631:
	j	bnei_cont.38555
bnei_else.38628:
bnei_cont.38629:
	j	bnei_cont.38555
bnei_else.38626:
bnei_cont.38627:
	j	bnei_cont.38555
bnei_else.38624:
bnei_cont.38625:
	j	bnei_cont.38555
bnei_else.38622:
bnei_cont.38623:
	j	bnei_cont.38555
bnei_else.38620:
bnei_cont.38621:
	j	bnei_cont.38555
bnei_else.38616:
bnei_cont.38617:
	j	bnei_cont.38555
bnei_else.38554:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.38636
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.38637
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952
	j	bnei_cont.38637
bnei_else.38648:
bnei_cont.38649:
	j	bnei_cont.38637
bnei_else.38646:
bnei_cont.38647:
	j	bnei_cont.38637
bnei_else.38644:
bnei_cont.38645:
	j	bnei_cont.38637
bnei_else.38642:
bnei_cont.38643:
	j	bnei_cont.38637
bnei_else.38640:
bnei_cont.38641:
	j	bnei_cont.38637
bnei_else.38638:
bnei_cont.38639:
	j	bnei_cont.38637
bnei_else.38636:
bnei_cont.38637:
bnei_cont.38555:
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%s3, 0(%at)
	lw	%a1, 0(%s3)
	beqi	%a1, -1, bnei_else.38650
	beqi	%a1, 99, bnei_else.38651
	lw	%a2, 12(%a1)
	lw	%a3, 10(%a2)
	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	lw	%a0, 1(%t8)
	add	%at, %a0, %a1
	lw	%a1, 0(%at)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.38653
	beqi	%a0, 2, bnei_else.38655
	flw	%f17, 0(%a1)
	fbne	%f17, %fzero, fbeq_else.38657
	add	%a0, %zero, %k1
	j	fbeq_cont.38658
fbeq_else.38657:
	add	%a0, %zero, %zero
fbeq_cont.38658:
	beqi	%a0, 0, bnei_else.38659
	add	%a0, %zero, %zero
	j	bnei_cont.38654
bnei_else.38659:
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38661
	add	%a0, %zero, %zero
	j	fbgt_cont.38662
fbgt_else.38661:
	add	%a0, %zero, %k1
fbgt_cont.38662:
	beqi	%a0, 0, bnei_else.38663
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.38665
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38666
bnei_else.38665:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38666:
	add	%a0, %zero, %k1
	j	bnei_cont.38654
bnei_else.38663:
	add	%a0, %zero, %zero
bnei_cont.38664:
bnei_cont.38660:
	j	bnei_cont.38654
bnei_else.38655:
	flw	%f1, 0(%a1)
	fblt	%f1, %fzero, fbgt_else.38667
	add	%a0, %zero, %zero
	j	fbgt_cont.38668
fbgt_else.38667:
	add	%a0, %zero, %k1
fbgt_cont.38668:
	beqi	%a0, 0, bnei_else.38669
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38654
bnei_else.38669:
	add	%a0, %zero, %zero
bnei_cont.38670:
bnei_cont.38656:
	j	bnei_cont.38654
bnei_else.38653:
	lw	%a3, 0(%t8)
	flw	%f0, 0(%a1)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%a1)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%a3)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a2)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.38671
	add	%a0, %zero, %zero
	j	fbgt_cont.38672
fbgt_else.38671:
	add	%a0, %zero, %k1
fbgt_cont.38672:
	beqi	%a0, 0, bnei_else.38673
	flw	%f0, 2(%a3)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38675
	add	%a0, %zero, %zero
	j	fbgt_cont.38676
fbgt_else.38675:
	add	%a0, %zero, %k1
fbgt_cont.38676:
	beqi	%a0, 0, bnei_else.38677
	fbne	%f21, %fzero, fbeq_else.38679
	add	%a0, %zero, %k1
	j	fbeq_cont.38680
fbeq_else.38679:
	add	%a0, %zero, %zero
fbeq_cont.38680:
	beqi	%a0, 0, bnei_else.38681
	add	%a0, %zero, %zero
	j	bnei_cont.38674
bnei_else.38681:
	add	%a0, %zero, %k1
bnei_cont.38682:
	j	bnei_cont.38674
bnei_else.38677:
	add	%a0, %zero, %zero
bnei_cont.38678:
	j	bnei_cont.38674
bnei_else.38673:
	add	%a0, %zero, %zero
bnei_cont.38674:
	beqi	%a0, 0, bnei_else.38683
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38684
bnei_else.38683:
	flw	%f0, 2(%a1)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%a1)
	fmul	%f20, %f0, %f23
	flw	%f22, 0(%a3)
	fmul	%f0, %f20, %f22
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%a0, 4(%a2)
	flw	%f21, 0(%a0)
	fblt	%f0, %f21, fbgt_else.38685
	add	%a0, %zero, %zero
	j	fbgt_cont.38686
fbgt_else.38685:
	add	%a0, %zero, %k1
fbgt_cont.38686:
	beqi	%a0, 0, bnei_else.38687
	flw	%f0, 2(%a3)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38689
	add	%a0, %zero, %zero
	j	fbgt_cont.38690
fbgt_else.38689:
	add	%a0, %zero, %k1
fbgt_cont.38690:
	beqi	%a0, 0, bnei_else.38691
	fbne	%f23, %fzero, fbeq_else.38693
	add	%a0, %zero, %k1
	j	fbeq_cont.38694
fbeq_else.38693:
	add	%a0, %zero, %zero
fbeq_cont.38694:
	beqi	%a0, 0, bnei_else.38695
	add	%a0, %zero, %zero
	j	bnei_cont.38688
bnei_else.38695:
	add	%a0, %zero, %k1
bnei_cont.38696:
	j	bnei_cont.38688
bnei_else.38691:
	add	%a0, %zero, %zero
bnei_cont.38692:
	j	bnei_cont.38688
bnei_else.38687:
	add	%a0, %zero, %zero
bnei_cont.38688:
	beqi	%a0, 0, bnei_else.38697
	fsw	%f20, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38698
bnei_else.38697:
	flw	%f0, 4(%a1)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a1)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f22
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f21, fbgt_else.38699
	add	%a0, %zero, %zero
	j	fbgt_cont.38700
fbgt_else.38699:
	add	%a0, %zero, %k1
fbgt_cont.38700:
	beqi	%a0, 0, bnei_else.38701
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.38703
	add	%a0, %zero, %zero
	j	fbgt_cont.38704
fbgt_else.38703:
	add	%a0, %zero, %k1
fbgt_cont.38704:
	beqi	%a0, 0, bnei_else.38705
	fbne	%f18, %fzero, fbeq_else.38707
	add	%a0, %zero, %k1
	j	fbeq_cont.38708
fbeq_else.38707:
	add	%a0, %zero, %zero
fbeq_cont.38708:
	beqi	%a0, 0, bnei_else.38709
	add	%a0, %zero, %zero
	j	bnei_cont.38702
bnei_else.38709:
	add	%a0, %zero, %k1
bnei_cont.38710:
	j	bnei_cont.38702
bnei_else.38705:
	add	%a0, %zero, %zero
bnei_cont.38706:
	j	bnei_cont.38702
bnei_else.38701:
	add	%a0, %zero, %zero
bnei_cont.38702:
	beqi	%a0, 0, bnei_else.38711
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38712
bnei_else.38711:
	add	%a0, %zero, %zero
bnei_cont.38712:
bnei_cont.38698:
bnei_cont.38684:
bnei_cont.38654:
	beqi	%a0, 0, bnei_cont.38652
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38715
	add	%a0, %zero, %zero
	j	fbgt_cont.38716
fbgt_else.38715:
	add	%a0, %zero, %k1
fbgt_cont.38716:
	beqi	%a0, 0, bnei_cont.38652
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38652
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952
	j	bnei_cont.38652
bnei_else.38729:
bnei_cont.38730:
	j	bnei_cont.38652
bnei_else.38727:
bnei_cont.38728:
	j	bnei_cont.38652
bnei_else.38725:
bnei_cont.38726:
	j	bnei_cont.38652
bnei_else.38723:
bnei_cont.38724:
	j	bnei_cont.38652
bnei_else.38721:
bnei_cont.38722:
	j	bnei_cont.38652
bnei_else.38719:
bnei_cont.38720:
	j	bnei_cont.38652
bnei_else.38717:
bnei_cont.38718:
	j	bnei_cont.38652
bnei_else.38713:
bnei_cont.38714:
	j	bnei_cont.38652
bnei_else.38651:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.38731
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38732
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38732
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38732
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38732
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38732
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952
	j	bnei_cont.38732
bnei_else.38741:
bnei_cont.38742:
	j	bnei_cont.38732
bnei_else.38739:
bnei_cont.38740:
	j	bnei_cont.38732
bnei_else.38737:
bnei_cont.38738:
	j	bnei_cont.38732
bnei_else.38735:
bnei_cont.38736:
	j	bnei_cont.38732
bnei_else.38733:
bnei_cont.38734:
	j	bnei_cont.38732
bnei_else.38731:
bnei_cont.38732:
bnei_cont.38652:
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	trace_or_matrix_fast.2956
bnei_else.38650:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.38553:
	add	%ra, %zero, %t9
	jr	%ra
utexture.2971:
	add	%a0, %zero, %ra
	lw	%a2, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	fsw	%f0, 145(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	fsw	%f0, 147(%zero)
	beqi	%a2, 1, bnei_else.38969
	beqi	%a2, 2, bnei_else.38970
	beqi	%a2, 3, bnei_else.38971
	beqi	%a2, 4, bnei_else.38972
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.38972:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 0(%a1)
	fsqrt	%f0, %f0
	fmul	%f19, %f1, %f0
	flw	%f1, 2(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 2(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 2(%a1)
	fsqrt	%f0, %f0
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19
	fmul	%f0, %f18, %f18
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19
	flw	%f16, 464(%zero)
	fblt	%f0, %f16, fbgt_else.38974
	add	%a1, %zero, %zero
	j	fbgt_cont.38975
fbgt_else.38974:
	add	%a1, %zero, %k1
fbgt_cont.38975:
	beqi	%a1, 0, bnei_else.38976
	flw	%f1, 463(%zero)
	j	bnei_cont.38977
bnei_else.38976:
	fdiv	%f0, %f18, %f19
	fabs	%f2, %f0
	fblt	%f2, %fzero, fbgt_else.38978
	add	%a1, %zero, %k1
	j	fbgt_cont.38979
fbgt_else.38978:
	add	%a1, %zero, %zero
fbgt_cont.38979:
	fabs	%f19, %f2
	flw	%f0, 462(%zero)
	fblt	%f19, %f0, fbgt_else.38980
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.38982
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
	j	fbgt_cont.38983
fbgt_else.38982:
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
fbgt_cont.38983:
	beqi	%a1, 0, bnei_else.38984
	j	fbgt_cont.38981
bnei_else.38984:
	fneg	%f0, %f0
bnei_cont.38985:
	j	fbgt_cont.38981
fbgt_else.38980:
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
fbgt_cont.38981:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.38977:
	floor	%f0, %f1
	fsub	%f18, %f1, %f0
	flw	%f1, 1(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 1(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 1(%a1)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f17
	fblt	%f0, %f16, fbgt_else.38986
	add	%a1, %zero, %zero
	j	fbgt_cont.38987
fbgt_else.38986:
	add	%a1, %zero, %k1
fbgt_cont.38987:
	beqi	%a1, 0, bnei_else.38988
	flw	%f1, 463(%zero)
	j	bnei_cont.38989
bnei_else.38988:
	fdiv	%f0, %f1, %f17
	fabs	%f19, %f0
	fblt	%f19, %fzero, fbgt_else.38990
	add	%a1, %zero, %k1
	j	fbgt_cont.38991
fbgt_else.38990:
	add	%a1, %zero, %zero
fbgt_cont.38991:
	fabs	%f17, %f19
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.38992
	flw	%f0, 455(%zero)
	fblt	%f17, %f0, fbgt_else.38994
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
	j	fbgt_cont.38995
fbgt_else.38994:
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
fbgt_cont.38995:
	beqi	%a1, 0, bnei_else.38996
	j	fbgt_cont.38993
bnei_else.38996:
	fneg	%f0, %f0
bnei_cont.38997:
	j	fbgt_cont.38993
fbgt_else.38992:
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
fbgt_cont.38993:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.38989:
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
	fblt	%f0, %fzero, fbgt_else.38998
	add	%a1, %zero, %zero
	j	fbgt_cont.38999
fbgt_else.38998:
	add	%a1, %zero, %k1
fbgt_cont.38999:
	beqi	%a1, 0, bnei_else.39000
	fmov	%f0, %fzero
	j	bnei_cont.39001
bnei_else.39000:
bnei_cont.39001:
	flw	%f1, 451(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.38971:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f16, %f1, %f0
	flw	%f1, 2(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 2(%a1)
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
	fblt	%f17, %f2, fbgt_else.39003
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.39004
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.39004
fbgt_else.39027:
fbgt_cont.39028:
	j	fbgt_cont.39004
fbgt_else.39025:
fbgt_cont.39026:
	j	fbgt_cont.39004
fbgt_else.39023:
fbgt_cont.39024:
	j	fbgt_cont.39004
fbgt_else.39021:
fbgt_cont.39022:
	j	fbgt_cont.39004
fbgt_else.39019:
fbgt_cont.39020:
	j	fbgt_cont.39004
fbgt_else.39017:
fbgt_cont.39018:
	j	fbgt_cont.39004
fbgt_else.39015:
fbgt_cont.39016:
	j	fbgt_cont.39004
fbgt_else.39013:
fbgt_cont.39014:
	j	fbgt_cont.39004
fbgt_else.39011:
fbgt_cont.39012:
	j	fbgt_cont.39004
fbgt_else.39009:
fbgt_cont.39010:
	j	fbgt_cont.39004
fbgt_else.39007:
fbgt_cont.39008:
	j	fbgt_cont.39004
fbgt_else.39005:
fbgt_cont.39006:
	j	fbgt_cont.39004
fbgt_else.39003:
	fmov	%f1, %f2
fbgt_cont.39004:
	fblt	%f17, %f2, fbgt_else.39029
	fblt	%f17, %f1, fbgt_else.39031
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.39030
fbgt_else.39031:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.39032:
	j	fbgt_cont.39030
fbgt_else.39029:
fbgt_cont.39030:
	fblt	%f17, %f18, fbgt_else.39033
	add	%a1, %zero, %zero
	j	fbgt_cont.39034
fbgt_else.39033:
	add	%a1, %zero, %k1
fbgt_cont.39034:
	fblt	%f17, %f18, fbgt_else.39035
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39036
fbgt_else.39035:
fbgt_cont.39036:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.39037
	beqi	%a1, 0, bnei_else.39039
	add	%a1, %zero, %zero
	j	fbgt_cont.39038
bnei_else.39039:
	add	%a1, %zero, %k1
bnei_cont.39040:
	j	fbgt_cont.39038
fbgt_else.39037:
fbgt_cont.39038:
	fblt	%f17, %f1, fbgt_else.39041
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39042
fbgt_else.39041:
fbgt_cont.39042:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.39043
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
	j	fbgt_cont.39044
fbgt_else.39043:
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
fbgt_cont.39044:
	beqi	%a1, 0, bnei_else.39045
	j	bnei_cont.39046
bnei_else.39045:
	fneg	%f0, %f0
bnei_cont.39046:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f0, %f1
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.38970:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f0, %f1, %f0
	flw	%f18, 494(%zero)
	fblt	%f0, %fzero, fbgt_else.39048
	add	%a1, %zero, %k1
	j	fbgt_cont.39049
fbgt_else.39048:
	add	%a1, %zero, %zero
fbgt_cont.39049:
	fabs	%f17, %f0
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.39050
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.39051
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.39051
fbgt_else.39074:
fbgt_cont.39075:
	j	fbgt_cont.39051
fbgt_else.39072:
fbgt_cont.39073:
	j	fbgt_cont.39051
fbgt_else.39070:
fbgt_cont.39071:
	j	fbgt_cont.39051
fbgt_else.39068:
fbgt_cont.39069:
	j	fbgt_cont.39051
fbgt_else.39066:
fbgt_cont.39067:
	j	fbgt_cont.39051
fbgt_else.39064:
fbgt_cont.39065:
	j	fbgt_cont.39051
fbgt_else.39062:
fbgt_cont.39063:
	j	fbgt_cont.39051
fbgt_else.39060:
fbgt_cont.39061:
	j	fbgt_cont.39051
fbgt_else.39058:
fbgt_cont.39059:
	j	fbgt_cont.39051
fbgt_else.39056:
fbgt_cont.39057:
	j	fbgt_cont.39051
fbgt_else.39054:
fbgt_cont.39055:
	j	fbgt_cont.39051
fbgt_else.39052:
fbgt_cont.39053:
	j	fbgt_cont.39051
fbgt_else.39050:
	fmov	%f1, %f2
fbgt_cont.39051:
	fblt	%f17, %f2, fbgt_else.39076
	fblt	%f17, %f1, fbgt_else.39078
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.39077
fbgt_else.39078:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.39079:
	j	fbgt_cont.39077
fbgt_else.39076:
fbgt_cont.39077:
	fblt	%f17, %f18, fbgt_else.39080
	beqi	%a1, 0, bnei_else.39082
	add	%a1, %zero, %zero
	j	fbgt_cont.39081
bnei_else.39082:
	add	%a1, %zero, %k1
bnei_cont.39083:
	j	fbgt_cont.39081
fbgt_else.39080:
fbgt_cont.39081:
	fblt	%f17, %f18, fbgt_else.39084
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39085
fbgt_else.39084:
fbgt_cont.39085:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.39086
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39087
fbgt_else.39086:
fbgt_cont.39087:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.39088
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
	j	fbgt_cont.39089
fbgt_else.39088:
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
fbgt_cont.39089:
	beqi	%a1, 0, bnei_else.39090
	j	bnei_cont.39091
bnei_else.39090:
	fneg	%f0, %f0
bnei_cont.39091:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f16
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.38969:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f1, %f1, %f0
	flw	%f18, 447(%zero)
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	flw	%f17, 446(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	flw	%f16, 449(%zero)
	fblt	%f0, %f16, fbgt_else.39093
	add	%a1, %zero, %zero
	j	fbgt_cont.39094
fbgt_else.39093:
	add	%a1, %zero, %k1
fbgt_cont.39094:
	flw	%f1, 2(%v1)
	lw	%a2, 5(%v0)
	flw	%f0, 2(%a2)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	fblt	%f0, %f16, fbgt_else.39095
	add	%a2, %zero, %zero
	j	fbgt_cont.39096
fbgt_else.39095:
	add	%a2, %zero, %k1
fbgt_cont.39096:
	beqi	%a1, 0, bnei_else.39097
	beqi	%a2, 0, bnei_else.39099
	flw	%f0, 451(%zero)
	j	bnei_cont.39098
bnei_else.39099:
	fmov	%f0, %fzero
bnei_cont.39100:
	j	bnei_cont.39098
bnei_else.39097:
	beqi	%a2, 0, bnei_else.39101
	fmov	%f0, %fzero
	j	bnei_cont.39102
bnei_else.39101:
	flw	%f0, 451(%zero)
bnei_cont.39102:
bnei_cont.39098:
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	fmov	%f25, %f0
	fmov	%f26, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t2, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	blti	%v0, 0, bgti_else.39203
	lw	%t2, 254(%v0)
	lw	%t0, 1(%t2)
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
	fblt	%f0, %f1, fbgt_else.39204
	add	%a0, %zero, %zero
	j	fbgt_cont.39205
fbgt_else.39204:
	add	%a0, %zero, %k1
fbgt_cont.39205:
	beqi	%a0, 0, bnei_else.39206
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39208
	add	%a0, %zero, %zero
	j	bnei_cont.39207
fbgt_else.39208:
	add	%a0, %zero, %k1
fbgt_cont.39209:
	j	bnei_cont.39207
bnei_else.39206:
	add	%a0, %zero, %zero
bnei_cont.39207:
	beqi	%a0, 0, bnei_else.39210
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 0(%t2)
	bne	%a1, %a0, bnei_cont.39211
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.39214
	j	bnei_cont.39211
bnei_else.39214:
	lw	%a0, 0(%t0)
	flw	%f1, 142(%zero)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	flw	%f18, 2(%t2)
	fmul	%f0, %f18, %f25
	fmul	%f17, %f0, %f1
	lw	%a1, 0(%t0)
	lw	%a0, 1(%sp)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fmul	%f16, %f18, %f0
	fblt	%fzero, %f17, fbgt_else.39216
	add	%a0, %zero, %zero
	j	fbgt_cont.39217
fbgt_else.39216:
	add	%a0, %zero, %k1
fbgt_cont.39217:
	beqi	%a0, 0, bnei_else.39218
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.39219
bnei_else.39218:
bnei_cont.39219:
	fblt	%fzero, %f16, fbgt_else.39220
	add	%a0, %zero, %zero
	j	fbgt_cont.39221
fbgt_else.39220:
	add	%a0, %zero, %k1
fbgt_cont.39221:
	beqi	%a0, 0, bnei_cont.39211
	fmul	%f0, %f16, %f16
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f26
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.39211
bnei_else.39222:
bnei_cont.39223:
bnei_cont.39215:
	j	bnei_cont.39211
beq_else.39212:
beq_cont.39213:
	j	bnei_cont.39211
bnei_else.39210:
bnei_cont.39211:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f26
	fmov	%f0, %f25
	j	trace_reflections.2978
bgti_else.39203:
	jr	%ra
trace_ray.2983:
	fmov	%f3, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.39477
	lw	%a0, 2(%a0)
	sw	%a0, 6(%sp)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 7(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	fsw	%f1, 8(%sp)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39478
	add	%a0, %zero, %zero
	j	fbgt_cont.39479
fbgt_else.39478:
	add	%a0, %zero, %k1
fbgt_cont.39479:
	beqi	%a0, 0, bnei_else.39480
	flw	%f1, 444(%zero)
	flw	%f0, 8(%sp)
	fblt	%f0, %f1, fbgt_else.39482
	add	%a0, %zero, %zero
	j	bnei_cont.39481
fbgt_else.39482:
	add	%a0, %zero, %k1
fbgt_cont.39483:
	j	bnei_cont.39481
bnei_else.39480:
	add	%a0, %zero, %zero
bnei_cont.39481:
	beqi	%a0, 0, bnei_else.39484
	lw	%a3, 141(%zero)
	lw	%t0, 12(%a3)
	lw	%a0, 2(%t0)
	sw	%a0, 9(%sp)
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fmul	%f25, %f0, %f3
	lw	%a0, 1(%t0)
	beqi	%a0, 1, bnei_else.39485
	beqi	%a0, 2, bnei_else.39487
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t0)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t0)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t0)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t0)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%t0)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t0)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t0)
	beqi	%a0, 0, bnei_else.39489
	lw	%a0, 9(%t0)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t0)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t0)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t0)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t0)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39490
bnei_else.39489:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.39490:
	lw	%a1, 6(%t0)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39491
	add	%a0, %zero, %k1
	j	fbeq_cont.39492
fbeq_else.39491:
	add	%a0, %zero, %zero
fbeq_cont.39492:
	beqi	%a0, 0, bnei_else.39493
	fmov	%f0, %f30
	j	bnei_cont.39494
bnei_else.39493:
	beqi	%a1, 0, bnei_else.39495
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39496
bnei_else.39495:
	fdiv	%f0, %f30, %f1
bnei_cont.39496:
bnei_cont.39494:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39486
bnei_else.39487:
	lw	%a0, 4(%t0)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t0)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t0)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39488:
	j	bnei_cont.39486
bnei_else.39485:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39497
	add	%a0, %zero, %k1
	j	fbeq_cont.39498
fbeq_else.39497:
	add	%a0, %zero, %zero
fbeq_cont.39498:
	beqi	%a0, 0, bnei_else.39499
	fmov	%f0, %fzero
	j	bnei_cont.39500
bnei_else.39499:
	fblt	%fzero, %f0, fbgt_else.39501
	add	%a0, %zero, %zero
	j	fbgt_cont.39502
fbgt_else.39501:
	add	%a0, %zero, %k1
fbgt_cont.39502:
	beqi	%a0, 0, bnei_else.39503
	fmov	%f0, %f30
	j	bnei_cont.39504
bnei_else.39503:
	flw	%f0, 468(%zero)
bnei_cont.39504:
bnei_cont.39500:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39486:
	flw	%f26, 138(%zero)
	fsw	%f26, 159(%zero)
	flw	%f27, 139(%zero)
	fsw	%f27, 160(%zero)
	flw	%f28, 140(%zero)
	fsw	%f28, 161(%zero)
	addi	%v1, %zero, 138
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	utexture.2971
	addi	%sp, %sp, -10
	sll	%a1, %a3, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 6(%sp)
	lw	%a2, 1(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
	lw	%a1, 3(%sp)
	lw	%a0, 1(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	fsw	%f26, 0(%a0)
	fsw	%f27, 1(%a0)
	fsw	%f28, 2(%a0)
	lw	%a1, 3(%a1)
	lw	%a0, 7(%t0)
	flw	%f1, 0(%a0)
	flw	%f0, 473(%zero)
	fblt	%f1, %f0, fbgt_else.39505
	add	%a0, %zero, %zero
	j	fbgt_cont.39506
fbgt_else.39505:
	add	%a0, %zero, %k1
fbgt_cont.39506:
	beqi	%a0, 0, bnei_else.39507
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.39508
bnei_else.39507:
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%k1, 0(%at)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f0, 145(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 146(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 147(%zero)
	fsw	%f0, 2(%a0)
	flw	%f0, 443(%zero)
	fmul	%f1, %f0, %f25
	flw	%f0, 0(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%a0)
	lw	%a0, 7(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f0, 142(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 143(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 144(%zero)
	fsw	%f0, 2(%a0)
bnei_cont.39508:
	flw	%f19, 442(%zero)
	lw	%a0, 2(%sp)
	flw	%f16, 0(%a0)
	flw	%f5, 142(%zero)
	fmul	%f1, %f16, %f5
	flw	%f17, 1(%a0)
	flw	%f4, 143(%zero)
	fmul	%f0, %f17, %f4
	fadd	%f1, %f1, %f0
	flw	%f18, 2(%a0)
	flw	%f29, 144(%zero)
	fmul	%f0, %f18, %f29
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f0
	fmul	%f0, %f1, %f5
	fadd	%f0, %f16, %f0
	fsw	%f0, 0(%a0)
	fmul	%f0, %f1, %f4
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%a0)
	fmul	%f0, %f1, %f29
	fadd	%f0, %f18, %f0
	fsw	%f0, 2(%a0)
	lw	%a0, 7(%t0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f3, %f0
	fsw	%f0, 10(%sp)
	lw	%v1, 7(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.39509
	j	bnei_cont.39510
bnei_else.39509:
	flw	%f19, 78(%zero)
	fmul	%f1, %f5, %f19
	flw	%f18, 79(%zero)
	fmul	%f0, %f4, %f18
	fadd	%f1, %f1, %f0
	flw	%f17, 80(%zero)
	fmul	%f0, %f29, %f17
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fmul	%f16, %f0, %f25
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
	fblt	%fzero, %f16, fbgt_else.39511
	add	%a0, %zero, %zero
	j	fbgt_cont.39512
fbgt_else.39511:
	add	%a0, %zero, %k1
fbgt_cont.39512:
	beqi	%a0, 0, bnei_else.39513
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
	j	bnei_cont.39514
bnei_else.39513:
bnei_cont.39514:
	fblt	%fzero, %f17, fbgt_else.39515
	add	%a0, %zero, %zero
	j	fbgt_cont.39516
fbgt_else.39515:
	add	%a0, %zero, %k1
fbgt_cont.39516:
	beqi	%a0, 0, bnei_else.39517
	fmul	%f0, %f17, %f17
	fmul	%f1, %f0, %f0
	flw	%f0, 10(%sp)
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
	j	bnei_cont.39518
bnei_else.39517:
bnei_cont.39518:
bnei_cont.39510:
	fsw	%f26, 162(%zero)
	fsw	%f27, 163(%zero)
	fsw	%f28, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %zero, 138
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -11
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 10(%sp)
	lw	%v1, 2(%sp)
	fmov	%f0, %f25
	addi	%sp, %sp, 11
	jal	trace_reflections.2978
	addi	%sp, %sp, -11
	flw	%f0, 441(%zero)
	fblt	%f0, %f3, fbgt_else.39519
	add	%a0, %zero, %zero
	j	fbgt_cont.39520
fbgt_else.39519:
	add	%a0, %zero, %k1
fbgt_cont.39520:
	beqi	%a0, 0, bnei_else.39521
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.39522
	j	bgti_cont.39523
bgti_else.39522:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 6(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.39523:
	lw	%a0, 9(%sp)
	beqi	%a0, 2, bnei_else.39524
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.39524:
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f30, %f0
	fmul	%f0, %f3, %f0
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 1
	flw	%f16, 0(%sp)
	flw	%f1, 8(%sp)
	fadd	%f1, %f16, %f1
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	j	trace_ray.2983
bnei_else.39521:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.39484:
	addi	%a2, %zero, -1
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.39527
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
	fblt	%fzero, %f1, fbgt_else.39528
	add	%a0, %zero, %zero
	j	fbgt_cont.39529
fbgt_else.39528:
	add	%a0, %zero, %k1
fbgt_cont.39529:
	beqi	%a0, 0, bnei_else.39530
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
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.39530:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.39527:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.39477:
	jr	%ra
trace_diffuse_ray.2989:
	fmov	%f25, %f0
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -3
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39669
	add	%a0, %zero, %zero
	j	fbgt_cont.39670
fbgt_else.39669:
	add	%a0, %zero, %k1
fbgt_cont.39670:
	beqi	%a0, 0, bnei_else.39671
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39673
	add	%a0, %zero, %zero
	j	bnei_cont.39672
fbgt_else.39673:
	add	%a0, %zero, %k1
fbgt_cont.39674:
	j	bnei_cont.39672
bnei_else.39671:
	add	%a0, %zero, %zero
bnei_cont.39672:
	beqi	%a0, 0, bnei_else.39675
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a0, 0(%sp)
	lw	%a2, 0(%a0)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.39676
	beqi	%a0, 2, bnei_else.39678
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.39680
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39681
bnei_else.39680:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.39681:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39682
	add	%a0, %zero, %k1
	j	fbeq_cont.39683
fbeq_else.39682:
	add	%a0, %zero, %zero
fbeq_cont.39683:
	beqi	%a0, 0, bnei_else.39684
	fmov	%f0, %f30
	j	bnei_cont.39685
bnei_else.39684:
	beqi	%a1, 0, bnei_else.39686
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39687
bnei_else.39686:
	fdiv	%f0, %f30, %f1
bnei_cont.39687:
bnei_cont.39685:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39677
bnei_else.39678:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39679:
	j	bnei_cont.39677
bnei_else.39676:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39688
	add	%a0, %zero, %k1
	j	fbeq_cont.39689
fbeq_else.39688:
	add	%a0, %zero, %zero
fbeq_cont.39689:
	beqi	%a0, 0, bnei_else.39690
	fmov	%f0, %fzero
	j	bnei_cont.39691
bnei_else.39690:
	fblt	%fzero, %f0, fbgt_else.39692
	add	%a0, %zero, %zero
	j	fbgt_cont.39693
fbgt_else.39692:
	add	%a0, %zero, %k1
fbgt_cont.39693:
	beqi	%a0, 0, bnei_else.39694
	fmov	%f0, %f30
	j	bnei_cont.39695
bnei_else.39694:
	flw	%f0, 468(%zero)
bnei_cont.39695:
bnei_cont.39691:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39677:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 3
	jal	utexture.2971
	addi	%sp, %sp, -3
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.39696
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.39696:
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
	fblt	%fzero, %f0, fbgt_else.39698
	add	%a0, %zero, %zero
	j	fbgt_cont.39699
fbgt_else.39698:
	add	%a0, %zero, %k1
fbgt_cont.39699:
	beqi	%a0, 0, bnei_else.39700
	j	bnei_cont.39701
bnei_else.39700:
	fmov	%f0, %fzero
bnei_cont.39701:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%s7)
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
	lw	%ra, 1(%sp)
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.39675:
	lw	%ra, 1(%sp)
	jr	%ra
iter_trace_diffuse_rays.2992:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%t1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	blti	%a1, 0, bgti_else.40711
	add	%at, %v0, %a1
	lw	%t0, 0(%at)
	lw	%a0, 0(%t0)
	flw	%f0, 0(%a0)
	flw	%f25, 0(%v1)
	fmul	%f1, %f0, %f25
	flw	%f0, 1(%a0)
	flw	%f26, 1(%v1)
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f27, 2(%v1)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.40712
	add	%a0, %zero, %zero
	j	fbgt_cont.40713
fbgt_else.40712:
	add	%a0, %zero, %k1
fbgt_cont.40713:
	beqi	%a0, 0, bnei_else.40714
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t0, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f28, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s3, 0(%t1)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.40716
	beqi	%a2, 99, bnei_else.40718
	lw	%a3, 12(%a2)
	lw	%a1, 10(%a3)
	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f18, 2(%a1)
	lw	%a0, 1(%t0)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a3)
	beqi	%a0, 1, bnei_else.40720
	beqi	%a0, 2, bnei_else.40722
	flw	%f17, 0(%a2)
	fbne	%f17, %fzero, fbeq_else.40724
	add	%a0, %zero, %k1
	j	fbeq_cont.40725
fbeq_else.40724:
	add	%a0, %zero, %zero
fbeq_cont.40725:
	beqi	%a0, 0, bnei_else.40726
	add	%a0, %zero, %zero
	j	bnei_cont.40721
bnei_else.40726:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.40728
	add	%a0, %zero, %zero
	j	fbgt_cont.40729
fbgt_else.40728:
	add	%a0, %zero, %k1
fbgt_cont.40729:
	beqi	%a0, 0, bnei_else.40730
	lw	%a0, 6(%a3)
	beqi	%a0, 0, bnei_else.40732
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.40733
bnei_else.40732:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.40733:
	add	%a0, %zero, %k1
	j	bnei_cont.40721
bnei_else.40730:
	add	%a0, %zero, %zero
bnei_cont.40731:
bnei_cont.40727:
	j	bnei_cont.40721
bnei_else.40722:
	flw	%f1, 0(%a2)
	fblt	%f1, %fzero, fbgt_else.40734
	add	%a0, %zero, %zero
	j	fbgt_cont.40735
fbgt_else.40734:
	add	%a0, %zero, %k1
fbgt_cont.40735:
	beqi	%a0, 0, bnei_else.40736
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40721
bnei_else.40736:
	add	%a0, %zero, %zero
bnei_cont.40737:
bnei_cont.40723:
	j	bnei_cont.40721
bnei_else.40720:
	lw	%a1, 0(%t0)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f20
	flw	%f21, 1(%a2)
	fmul	%f2, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f2, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.40738
	add	%a0, %zero, %zero
	j	fbgt_cont.40739
fbgt_else.40738:
	add	%a0, %zero, %k1
fbgt_cont.40739:
	beqi	%a0, 0, bnei_else.40740
	flw	%f0, 2(%a1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.40742
	add	%a0, %zero, %zero
	j	fbgt_cont.40743
fbgt_else.40742:
	add	%a0, %zero, %k1
fbgt_cont.40743:
	beqi	%a0, 0, bnei_else.40744
	fbne	%f21, %fzero, fbeq_else.40746
	add	%a0, %zero, %k1
	j	fbeq_cont.40747
fbeq_else.40746:
	add	%a0, %zero, %zero
fbeq_cont.40747:
	beqi	%a0, 0, bnei_else.40748
	add	%a0, %zero, %zero
	j	bnei_cont.40741
bnei_else.40748:
	add	%a0, %zero, %k1
bnei_cont.40749:
	j	bnei_cont.40741
bnei_else.40744:
	add	%a0, %zero, %zero
bnei_cont.40745:
	j	bnei_cont.40741
bnei_else.40740:
	add	%a0, %zero, %zero
bnei_cont.40741:
	beqi	%a0, 0, bnei_else.40750
	fsw	%f2, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40751
bnei_else.40750:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%a2)
	fmul	%f23, %f0, %f22
	flw	%f21, 0(%a1)
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f2, 0(%a0)
	fblt	%f0, %f2, fbgt_else.40752
	add	%a0, %zero, %zero
	j	fbgt_cont.40753
fbgt_else.40752:
	add	%a0, %zero, %k1
fbgt_cont.40753:
	beqi	%a0, 0, bnei_else.40754
	flw	%f0, 2(%a1)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.40756
	add	%a0, %zero, %zero
	j	fbgt_cont.40757
fbgt_else.40756:
	add	%a0, %zero, %k1
fbgt_cont.40757:
	beqi	%a0, 0, bnei_else.40758
	fbne	%f22, %fzero, fbeq_else.40760
	add	%a0, %zero, %k1
	j	fbeq_cont.40761
fbeq_else.40760:
	add	%a0, %zero, %zero
fbeq_cont.40761:
	beqi	%a0, 0, bnei_else.40762
	add	%a0, %zero, %zero
	j	bnei_cont.40755
bnei_else.40762:
	add	%a0, %zero, %k1
bnei_cont.40763:
	j	bnei_cont.40755
bnei_else.40758:
	add	%a0, %zero, %zero
bnei_cont.40759:
	j	bnei_cont.40755
bnei_else.40754:
	add	%a0, %zero, %zero
bnei_cont.40755:
	beqi	%a0, 0, bnei_else.40764
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.40765
bnei_else.40764:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a2)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.40766
	add	%a0, %zero, %zero
	j	fbgt_cont.40767
fbgt_else.40766:
	add	%a0, %zero, %k1
fbgt_cont.40767:
	beqi	%a0, 0, bnei_else.40768
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.40770
	add	%a0, %zero, %zero
	j	fbgt_cont.40771
fbgt_else.40770:
	add	%a0, %zero, %k1
fbgt_cont.40771:
	beqi	%a0, 0, bnei_else.40772
	fbne	%f18, %fzero, fbeq_else.40774
	add	%a0, %zero, %k1
	j	fbeq_cont.40775
fbeq_else.40774:
	add	%a0, %zero, %zero
fbeq_cont.40775:
	beqi	%a0, 0, bnei_else.40776
	add	%a0, %zero, %zero
	j	bnei_cont.40769
bnei_else.40776:
	add	%a0, %zero, %k1
bnei_cont.40777:
	j	bnei_cont.40769
bnei_else.40772:
	add	%a0, %zero, %zero
bnei_cont.40773:
	j	bnei_cont.40769
bnei_else.40768:
	add	%a0, %zero, %zero
bnei_cont.40769:
	beqi	%a0, 0, bnei_else.40778
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.40779
bnei_else.40778:
	add	%a0, %zero, %zero
bnei_cont.40779:
bnei_cont.40765:
bnei_cont.40751:
bnei_cont.40721:
	beqi	%a0, 0, bnei_cont.40719
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.40782
	add	%a0, %zero, %zero
	j	fbgt_cont.40783
fbgt_else.40782:
	add	%a0, %zero, %k1
fbgt_cont.40783:
	beqi	%a0, 0, bnei_cont.40719
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.40719
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.40719
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.40719
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.40719
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -7
	j	bnei_cont.40719
bnei_else.40792:
bnei_cont.40793:
	j	bnei_cont.40719
bnei_else.40790:
bnei_cont.40791:
	j	bnei_cont.40719
bnei_else.40788:
bnei_cont.40789:
	j	bnei_cont.40719
bnei_else.40786:
bnei_cont.40787:
	j	bnei_cont.40719
bnei_else.40784:
bnei_cont.40785:
	j	bnei_cont.40719
bnei_else.40780:
bnei_cont.40781:
	j	bnei_cont.40719
bnei_else.40718:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.40794
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.40795
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.40795
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.40795
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -7
	j	bnei_cont.40795
bnei_else.40800:
bnei_cont.40801:
	j	bnei_cont.40795
bnei_else.40798:
bnei_cont.40799:
	j	bnei_cont.40795
bnei_else.40796:
bnei_cont.40797:
	j	bnei_cont.40795
bnei_else.40794:
bnei_cont.40795:
bnei_cont.40719:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -7
	j	bnei_cont.40717
bnei_else.40716:
bnei_cont.40717:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40802
	add	%a0, %zero, %zero
	j	fbgt_cont.40803
fbgt_else.40802:
	add	%a0, %zero, %k1
fbgt_cont.40803:
	beqi	%a0, 0, bnei_else.40804
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40806
	add	%a0, %zero, %zero
	j	bnei_cont.40805
fbgt_else.40806:
	add	%a0, %zero, %k1
fbgt_cont.40807:
	j	bnei_cont.40805
bnei_else.40804:
	add	%a0, %zero, %zero
bnei_cont.40805:
	beqi	%a0, 0, bnei_cont.40715
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.40810
	beqi	%a0, 2, bnei_else.40812
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f23, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f17, %f22, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.40814
	lw	%a0, 9(%s7)
	flw	%f16, 2(%a0)
	fmul	%f1, %f19, %f16
	lw	%a0, 9(%s7)
	flw	%f20, 1(%a0)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	lw	%a0, 9(%s7)
	flw	%f16, 0(%a0)
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
	j	bnei_cont.40815
bnei_else.40814:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40815:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40816
	add	%a0, %zero, %k1
	j	fbeq_cont.40817
fbeq_else.40816:
	add	%a0, %zero, %zero
fbeq_cont.40817:
	beqi	%a0, 0, bnei_else.40818
	fmov	%f0, %f30
	j	bnei_cont.40819
bnei_else.40818:
	beqi	%a1, 0, bnei_else.40820
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40821
bnei_else.40820:
	fdiv	%f0, %f30, %f1
bnei_cont.40821:
bnei_cont.40819:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40811
bnei_else.40812:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40813:
	j	bnei_cont.40811
bnei_else.40810:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40822
	add	%a0, %zero, %k1
	j	fbeq_cont.40823
fbeq_else.40822:
	add	%a0, %zero, %zero
fbeq_cont.40823:
	beqi	%a0, 0, bnei_else.40824
	fmov	%f0, %fzero
	j	bnei_cont.40825
bnei_else.40824:
	fblt	%fzero, %f0, fbgt_else.40826
	add	%a0, %zero, %zero
	j	fbgt_cont.40827
fbgt_else.40826:
	add	%a0, %zero, %k1
fbgt_cont.40827:
	beqi	%a0, 0, bnei_else.40828
	fmov	%f0, %f30
	j	bnei_cont.40829
bnei_else.40828:
	flw	%f0, 468(%zero)
bnei_cont.40829:
bnei_cont.40825:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40811:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 7
	jal	utexture.2971
	addi	%sp, %sp, -7
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.40830
	j	bnei_cont.40715
bnei_else.40830:
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
	fblt	%fzero, %f0, fbgt_else.40832
	add	%a0, %zero, %zero
	j	fbgt_cont.40833
fbgt_else.40832:
	add	%a0, %zero, %k1
fbgt_cont.40833:
	beqi	%a0, 0, bnei_else.40834
	j	bnei_cont.40835
bnei_else.40834:
	fmov	%f0, %fzero
bnei_cont.40835:
	fmul	%f1, %f28, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.40831:
	j	bnei_cont.40715
bnei_else.40808:
bnei_cont.40809:
	j	bnei_cont.40715
bnei_else.40714:
	flw	%f0, 439(%zero)
	fdiv	%f28, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s3, 0(%t1)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.40836
	beqi	%a2, 99, bnei_else.40838
	lw	%a3, 12(%a2)
	lw	%a1, 10(%a3)
	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f18, 2(%a1)
	lw	%a0, 1(%t0)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a3)
	beqi	%a0, 1, bnei_else.40840
	beqi	%a0, 2, bnei_else.40842
	flw	%f17, 0(%a2)
	fbne	%f17, %fzero, fbeq_else.40844
	add	%a0, %zero, %k1
	j	fbeq_cont.40845
fbeq_else.40844:
	add	%a0, %zero, %zero
fbeq_cont.40845:
	beqi	%a0, 0, bnei_else.40846
	add	%a0, %zero, %zero
	j	bnei_cont.40841
bnei_else.40846:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.40848
	add	%a0, %zero, %zero
	j	fbgt_cont.40849
fbgt_else.40848:
	add	%a0, %zero, %k1
fbgt_cont.40849:
	beqi	%a0, 0, bnei_else.40850
	lw	%a0, 6(%a3)
	beqi	%a0, 0, bnei_else.40852
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.40853
bnei_else.40852:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.40853:
	add	%a0, %zero, %k1
	j	bnei_cont.40841
bnei_else.40850:
	add	%a0, %zero, %zero
bnei_cont.40851:
bnei_cont.40847:
	j	bnei_cont.40841
bnei_else.40842:
	flw	%f1, 0(%a2)
	fblt	%f1, %fzero, fbgt_else.40854
	add	%a0, %zero, %zero
	j	fbgt_cont.40855
fbgt_else.40854:
	add	%a0, %zero, %k1
fbgt_cont.40855:
	beqi	%a0, 0, bnei_else.40856
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40841
bnei_else.40856:
	add	%a0, %zero, %zero
bnei_cont.40857:
bnei_cont.40843:
	j	bnei_cont.40841
bnei_else.40840:
	lw	%a1, 0(%t0)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f20
	flw	%f21, 1(%a2)
	fmul	%f2, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f2, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.40858
	add	%a0, %zero, %zero
	j	fbgt_cont.40859
fbgt_else.40858:
	add	%a0, %zero, %k1
fbgt_cont.40859:
	beqi	%a0, 0, bnei_else.40860
	flw	%f0, 2(%a1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.40862
	add	%a0, %zero, %zero
	j	fbgt_cont.40863
fbgt_else.40862:
	add	%a0, %zero, %k1
fbgt_cont.40863:
	beqi	%a0, 0, bnei_else.40864
	fbne	%f21, %fzero, fbeq_else.40866
	add	%a0, %zero, %k1
	j	fbeq_cont.40867
fbeq_else.40866:
	add	%a0, %zero, %zero
fbeq_cont.40867:
	beqi	%a0, 0, bnei_else.40868
	add	%a0, %zero, %zero
	j	bnei_cont.40861
bnei_else.40868:
	add	%a0, %zero, %k1
bnei_cont.40869:
	j	bnei_cont.40861
bnei_else.40864:
	add	%a0, %zero, %zero
bnei_cont.40865:
	j	bnei_cont.40861
bnei_else.40860:
	add	%a0, %zero, %zero
bnei_cont.40861:
	beqi	%a0, 0, bnei_else.40870
	fsw	%f2, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.40871
bnei_else.40870:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%a2)
	fmul	%f23, %f0, %f22
	flw	%f21, 0(%a1)
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f2, 0(%a0)
	fblt	%f0, %f2, fbgt_else.40872
	add	%a0, %zero, %zero
	j	fbgt_cont.40873
fbgt_else.40872:
	add	%a0, %zero, %k1
fbgt_cont.40873:
	beqi	%a0, 0, bnei_else.40874
	flw	%f0, 2(%a1)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.40876
	add	%a0, %zero, %zero
	j	fbgt_cont.40877
fbgt_else.40876:
	add	%a0, %zero, %k1
fbgt_cont.40877:
	beqi	%a0, 0, bnei_else.40878
	fbne	%f22, %fzero, fbeq_else.40880
	add	%a0, %zero, %k1
	j	fbeq_cont.40881
fbeq_else.40880:
	add	%a0, %zero, %zero
fbeq_cont.40881:
	beqi	%a0, 0, bnei_else.40882
	add	%a0, %zero, %zero
	j	bnei_cont.40875
bnei_else.40882:
	add	%a0, %zero, %k1
bnei_cont.40883:
	j	bnei_cont.40875
bnei_else.40878:
	add	%a0, %zero, %zero
bnei_cont.40879:
	j	bnei_cont.40875
bnei_else.40874:
	add	%a0, %zero, %zero
bnei_cont.40875:
	beqi	%a0, 0, bnei_else.40884
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.40885
bnei_else.40884:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a2)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.40886
	add	%a0, %zero, %zero
	j	fbgt_cont.40887
fbgt_else.40886:
	add	%a0, %zero, %k1
fbgt_cont.40887:
	beqi	%a0, 0, bnei_else.40888
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.40890
	add	%a0, %zero, %zero
	j	fbgt_cont.40891
fbgt_else.40890:
	add	%a0, %zero, %k1
fbgt_cont.40891:
	beqi	%a0, 0, bnei_else.40892
	fbne	%f18, %fzero, fbeq_else.40894
	add	%a0, %zero, %k1
	j	fbeq_cont.40895
fbeq_else.40894:
	add	%a0, %zero, %zero
fbeq_cont.40895:
	beqi	%a0, 0, bnei_else.40896
	add	%a0, %zero, %zero
	j	bnei_cont.40889
bnei_else.40896:
	add	%a0, %zero, %k1
bnei_cont.40897:
	j	bnei_cont.40889
bnei_else.40892:
	add	%a0, %zero, %zero
bnei_cont.40893:
	j	bnei_cont.40889
bnei_else.40888:
	add	%a0, %zero, %zero
bnei_cont.40889:
	beqi	%a0, 0, bnei_else.40898
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.40899
bnei_else.40898:
	add	%a0, %zero, %zero
bnei_cont.40899:
bnei_cont.40885:
bnei_cont.40871:
bnei_cont.40841:
	beqi	%a0, 0, bnei_cont.40839
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.40902
	add	%a0, %zero, %zero
	j	fbgt_cont.40903
fbgt_else.40902:
	add	%a0, %zero, %k1
fbgt_cont.40903:
	beqi	%a0, 0, bnei_cont.40839
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.40839
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.40839
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.40839
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.40839
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -7
	j	bnei_cont.40839
bnei_else.40912:
bnei_cont.40913:
	j	bnei_cont.40839
bnei_else.40910:
bnei_cont.40911:
	j	bnei_cont.40839
bnei_else.40908:
bnei_cont.40909:
	j	bnei_cont.40839
bnei_else.40906:
bnei_cont.40907:
	j	bnei_cont.40839
bnei_else.40904:
bnei_cont.40905:
	j	bnei_cont.40839
bnei_else.40900:
bnei_cont.40901:
	j	bnei_cont.40839
bnei_else.40838:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.40914
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.40915
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.40915
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.40915
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -7
	j	bnei_cont.40915
bnei_else.40920:
bnei_cont.40921:
	j	bnei_cont.40915
bnei_else.40918:
bnei_cont.40919:
	j	bnei_cont.40915
bnei_else.40916:
bnei_cont.40917:
	j	bnei_cont.40915
bnei_else.40914:
bnei_cont.40915:
bnei_cont.40839:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -7
	j	bnei_cont.40837
bnei_else.40836:
bnei_cont.40837:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40922
	add	%a0, %zero, %zero
	j	fbgt_cont.40923
fbgt_else.40922:
	add	%a0, %zero, %k1
fbgt_cont.40923:
	beqi	%a0, 0, bnei_else.40924
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40926
	add	%a0, %zero, %zero
	j	bnei_cont.40925
fbgt_else.40926:
	add	%a0, %zero, %k1
fbgt_cont.40927:
	j	bnei_cont.40925
bnei_else.40924:
	add	%a0, %zero, %zero
bnei_cont.40925:
	beqi	%a0, 0, bnei_else.40928
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.40930
	beqi	%a0, 2, bnei_else.40932
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f23, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f17, %f22, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.40934
	lw	%a0, 9(%s7)
	flw	%f16, 2(%a0)
	fmul	%f1, %f19, %f16
	lw	%a0, 9(%s7)
	flw	%f20, 1(%a0)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 473(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	lw	%a0, 9(%s7)
	flw	%f16, 0(%a0)
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
	j	bnei_cont.40935
bnei_else.40934:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40935:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40936
	add	%a0, %zero, %k1
	j	fbeq_cont.40937
fbeq_else.40936:
	add	%a0, %zero, %zero
fbeq_cont.40937:
	beqi	%a0, 0, bnei_else.40938
	fmov	%f0, %f30
	j	bnei_cont.40939
bnei_else.40938:
	beqi	%a1, 0, bnei_else.40940
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40941
bnei_else.40940:
	fdiv	%f0, %f30, %f1
bnei_cont.40941:
bnei_cont.40939:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40931
bnei_else.40932:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40933:
	j	bnei_cont.40931
bnei_else.40930:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40942
	add	%a0, %zero, %k1
	j	fbeq_cont.40943
fbeq_else.40942:
	add	%a0, %zero, %zero
fbeq_cont.40943:
	beqi	%a0, 0, bnei_else.40944
	fmov	%f0, %fzero
	j	bnei_cont.40945
bnei_else.40944:
	fblt	%fzero, %f0, fbgt_else.40946
	add	%a0, %zero, %zero
	j	fbgt_cont.40947
fbgt_else.40946:
	add	%a0, %zero, %k1
fbgt_cont.40947:
	beqi	%a0, 0, bnei_else.40948
	fmov	%f0, %f30
	j	bnei_cont.40949
bnei_else.40948:
	flw	%f0, 468(%zero)
bnei_cont.40949:
bnei_cont.40945:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40931:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 7
	jal	utexture.2971
	addi	%sp, %sp, -7
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.40950
	j	bnei_cont.40929
bnei_else.40950:
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
	fblt	%fzero, %f0, fbgt_else.40952
	add	%a0, %zero, %zero
	j	fbgt_cont.40953
fbgt_else.40952:
	add	%a0, %zero, %k1
fbgt_cont.40953:
	beqi	%a0, 0, bnei_else.40954
	j	bnei_cont.40955
bnei_else.40954:
	fmov	%f0, %fzero
bnei_cont.40955:
	fmul	%f1, %f28, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.40951:
	j	bnei_cont.40929
bnei_else.40928:
bnei_cont.40929:
bnei_cont.40715:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.40956
	lw	%a0, 0(%sp)
	add	%at, %a0, %t0
	lw	%t1, 0(%at)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f25
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.40957
	add	%a0, %zero, %zero
	j	fbgt_cont.40958
fbgt_else.40957:
	add	%a0, %zero, %k1
fbgt_cont.40958:
	beqi	%a0, 0, bnei_else.40959
	addi	%a1, %t0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t1, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f25, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 7(%sp)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40961
	add	%a0, %zero, %zero
	j	fbgt_cont.40962
fbgt_else.40961:
	add	%a0, %zero, %k1
fbgt_cont.40962:
	beqi	%a0, 0, bnei_else.40963
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40965
	add	%a0, %zero, %zero
	j	bnei_cont.40964
fbgt_else.40965:
	add	%a0, %zero, %k1
fbgt_cont.40966:
	j	bnei_cont.40964
bnei_else.40963:
	add	%a0, %zero, %zero
bnei_cont.40964:
	beqi	%a0, 0, bnei_cont.40960
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.40969
	beqi	%a0, 2, bnei_else.40971
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.40973
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40974
bnei_else.40973:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.40974:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40975
	add	%a0, %zero, %k1
	j	fbeq_cont.40976
fbeq_else.40975:
	add	%a0, %zero, %zero
fbeq_cont.40976:
	beqi	%a0, 0, bnei_else.40977
	fmov	%f0, %f30
	j	bnei_cont.40978
bnei_else.40977:
	beqi	%a1, 0, bnei_else.40979
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40980
bnei_else.40979:
	fdiv	%f0, %f30, %f1
bnei_cont.40980:
bnei_cont.40978:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40970
bnei_else.40971:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40972:
	j	bnei_cont.40970
bnei_else.40969:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40981
	add	%a0, %zero, %k1
	j	fbeq_cont.40982
fbeq_else.40981:
	add	%a0, %zero, %zero
fbeq_cont.40982:
	beqi	%a0, 0, bnei_else.40983
	fmov	%f0, %fzero
	j	bnei_cont.40984
bnei_else.40983:
	fblt	%fzero, %f0, fbgt_else.40985
	add	%a0, %zero, %zero
	j	fbgt_cont.40986
fbgt_else.40985:
	add	%a0, %zero, %k1
fbgt_cont.40986:
	beqi	%a0, 0, bnei_else.40987
	fmov	%f0, %f30
	j	bnei_cont.40988
bnei_else.40987:
	flw	%f0, 468(%zero)
bnei_cont.40988:
bnei_cont.40984:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40970:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%sp, %sp, -8
	lw	%v1, 7(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.40989
	j	bnei_cont.40960
bnei_else.40989:
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
	fblt	%fzero, %f0, fbgt_else.40991
	add	%a0, %zero, %zero
	j	fbgt_cont.40992
fbgt_else.40991:
	add	%a0, %zero, %k1
fbgt_cont.40992:
	beqi	%a0, 0, bnei_else.40993
	j	bnei_cont.40994
bnei_else.40993:
	fmov	%f0, %fzero
bnei_cont.40994:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.40990:
	j	bnei_cont.40960
bnei_else.40967:
bnei_cont.40968:
	j	bnei_cont.40960
bnei_else.40959:
	flw	%f0, 439(%zero)
	fdiv	%f25, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 8(%sp)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40995
	add	%a0, %zero, %zero
	j	fbgt_cont.40996
fbgt_else.40995:
	add	%a0, %zero, %k1
fbgt_cont.40996:
	beqi	%a0, 0, bnei_else.40997
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40999
	add	%a0, %zero, %zero
	j	bnei_cont.40998
fbgt_else.40999:
	add	%a0, %zero, %k1
fbgt_cont.41000:
	j	bnei_cont.40998
bnei_else.40997:
	add	%a0, %zero, %zero
bnei_cont.40998:
	beqi	%a0, 0, bnei_else.41001
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.41003
	beqi	%a0, 2, bnei_else.41005
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.41007
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41008
bnei_else.41007:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.41008:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41009
	add	%a0, %zero, %k1
	j	fbeq_cont.41010
fbeq_else.41009:
	add	%a0, %zero, %zero
fbeq_cont.41010:
	beqi	%a0, 0, bnei_else.41011
	fmov	%f0, %f30
	j	bnei_cont.41012
bnei_else.41011:
	beqi	%a1, 0, bnei_else.41013
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41014
bnei_else.41013:
	fdiv	%f0, %f30, %f1
bnei_cont.41014:
bnei_cont.41012:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41004
bnei_else.41005:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41006:
	j	bnei_cont.41004
bnei_else.41003:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41015
	add	%a0, %zero, %k1
	j	fbeq_cont.41016
fbeq_else.41015:
	add	%a0, %zero, %zero
fbeq_cont.41016:
	beqi	%a0, 0, bnei_else.41017
	fmov	%f0, %fzero
	j	bnei_cont.41018
bnei_else.41017:
	fblt	%fzero, %f0, fbgt_else.41019
	add	%a0, %zero, %zero
	j	fbgt_cont.41020
fbgt_else.41019:
	add	%a0, %zero, %k1
fbgt_cont.41020:
	beqi	%a0, 0, bnei_else.41021
	fmov	%f0, %f30
	j	bnei_cont.41022
bnei_else.41021:
	flw	%f0, 468(%zero)
bnei_cont.41022:
bnei_cont.41018:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41004:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 9
	jal	utexture.2971
	addi	%sp, %sp, -9
	lw	%v1, 8(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.41023
	j	bnei_cont.41002
bnei_else.41023:
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
	fblt	%fzero, %f0, fbgt_else.41025
	add	%a0, %zero, %zero
	j	fbgt_cont.41026
fbgt_else.41025:
	add	%a0, %zero, %k1
fbgt_cont.41026:
	beqi	%a0, 0, bnei_else.41027
	j	bnei_cont.41028
bnei_else.41027:
	fmov	%f0, %fzero
bnei_cont.41028:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.41024:
	j	bnei_cont.41002
bnei_else.41001:
bnei_cont.41002:
bnei_cont.40960:
	addi	%a1, %t0, -2
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.40956:
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.40711:
	jr	%ra
trace_diffuse_rays.2997:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	lw	%t0, 118(%a0)
	lw	%a1, 0(%t0)
	flw	%f1, 0(%a1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.41280
	add	%a0, %zero, %zero
	j	fbgt_cont.41281
fbgt_else.41280:
	add	%a0, %zero, %k1
fbgt_cont.41281:
	beqi	%a0, 0, bnei_else.41282
	lw	%a0, 0(%sp)
	lw	%t0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f25, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.41284
	add	%a0, %zero, %zero
	j	fbgt_cont.41285
fbgt_else.41284:
	add	%a0, %zero, %k1
fbgt_cont.41285:
	beqi	%a0, 0, bnei_else.41286
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41288
	add	%a0, %zero, %zero
	j	bnei_cont.41287
fbgt_else.41288:
	add	%a0, %zero, %k1
fbgt_cont.41289:
	j	bnei_cont.41287
bnei_else.41286:
	add	%a0, %zero, %zero
bnei_cont.41287:
	beqi	%a0, 0, bnei_cont.41283
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.41292
	beqi	%a0, 2, bnei_else.41294
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.41296
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41297
bnei_else.41296:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.41297:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41298
	add	%a0, %zero, %k1
	j	fbeq_cont.41299
fbeq_else.41298:
	add	%a0, %zero, %zero
fbeq_cont.41299:
	beqi	%a0, 0, bnei_else.41300
	fmov	%f0, %f30
	j	bnei_cont.41301
bnei_else.41300:
	beqi	%a1, 0, bnei_else.41302
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41303
bnei_else.41302:
	fdiv	%f0, %f30, %f1
bnei_cont.41303:
bnei_cont.41301:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41293
bnei_else.41294:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41295:
	j	bnei_cont.41293
bnei_else.41292:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41304
	add	%a0, %zero, %k1
	j	fbeq_cont.41305
fbeq_else.41304:
	add	%a0, %zero, %zero
fbeq_cont.41305:
	beqi	%a0, 0, bnei_else.41306
	fmov	%f0, %fzero
	j	bnei_cont.41307
bnei_else.41306:
	fblt	%fzero, %f0, fbgt_else.41308
	add	%a0, %zero, %zero
	j	fbgt_cont.41309
fbgt_else.41308:
	add	%a0, %zero, %k1
fbgt_cont.41309:
	beqi	%a0, 0, bnei_else.41310
	fmov	%f0, %f30
	j	bnei_cont.41311
bnei_else.41310:
	flw	%f0, 468(%zero)
bnei_cont.41311:
bnei_cont.41307:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41293:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 6
	jal	utexture.2971
	addi	%sp, %sp, -6
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.41312
	j	bnei_cont.41283
bnei_else.41312:
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
	fblt	%fzero, %f0, fbgt_else.41314
	add	%a0, %zero, %zero
	j	fbgt_cont.41315
fbgt_else.41314:
	add	%a0, %zero, %k1
fbgt_cont.41315:
	beqi	%a0, 0, bnei_else.41316
	j	bnei_cont.41317
bnei_else.41316:
	fmov	%f0, %fzero
bnei_cont.41317:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.41313:
	j	bnei_cont.41283
bnei_else.41290:
bnei_cont.41291:
	j	bnei_cont.41283
bnei_else.41282:
	flw	%f0, 439(%zero)
	fdiv	%f25, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.41318
	add	%a0, %zero, %zero
	j	fbgt_cont.41319
fbgt_else.41318:
	add	%a0, %zero, %k1
fbgt_cont.41319:
	beqi	%a0, 0, bnei_else.41320
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41322
	add	%a0, %zero, %zero
	j	bnei_cont.41321
fbgt_else.41322:
	add	%a0, %zero, %k1
fbgt_cont.41323:
	j	bnei_cont.41321
bnei_else.41320:
	add	%a0, %zero, %zero
bnei_cont.41321:
	beqi	%a0, 0, bnei_else.41324
	lw	%a0, 141(%zero)
	lw	%s7, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%s7)
	beqi	%a0, 1, bnei_else.41326
	beqi	%a0, 2, bnei_else.41328
	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%s7)
	beqi	%a0, 0, bnei_else.41330
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%s7)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%s7)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41331
bnei_else.41330:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.41331:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.41332
	add	%a0, %zero, %k1
	j	fbeq_cont.41333
fbeq_else.41332:
	add	%a0, %zero, %zero
fbeq_cont.41333:
	beqi	%a0, 0, bnei_else.41334
	fmov	%f0, %f30
	j	bnei_cont.41335
bnei_else.41334:
	beqi	%a1, 0, bnei_else.41336
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41337
bnei_else.41336:
	fdiv	%f0, %f30, %f1
bnei_cont.41337:
bnei_cont.41335:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41327
bnei_else.41328:
	lw	%a0, 4(%s7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%s7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41329:
	j	bnei_cont.41327
bnei_else.41326:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.41338
	add	%a0, %zero, %k1
	j	fbeq_cont.41339
fbeq_else.41338:
	add	%a0, %zero, %zero
fbeq_cont.41339:
	beqi	%a0, 0, bnei_else.41340
	fmov	%f0, %fzero
	j	bnei_cont.41341
bnei_else.41340:
	fblt	%fzero, %f0, fbgt_else.41342
	add	%a0, %zero, %zero
	j	fbgt_cont.41343
fbgt_else.41342:
	add	%a0, %zero, %k1
fbgt_cont.41343:
	beqi	%a0, 0, bnei_else.41344
	fmov	%f0, %f30
	j	bnei_cont.41345
bnei_else.41344:
	flw	%f0, 468(%zero)
bnei_cont.41345:
bnei_cont.41341:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41327:
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0
	addi	%sp, %sp, 6
	jal	utexture.2971
	addi	%sp, %sp, -6
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.41346
	j	bnei_cont.41325
bnei_else.41346:
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
	fblt	%fzero, %f0, fbgt_else.41348
	add	%a0, %zero, %zero
	j	fbgt_cont.41349
fbgt_else.41348:
	add	%a0, %zero, %k1
fbgt_cont.41349:
	beqi	%a0, 0, bnei_else.41350
	j	bnei_cont.41351
bnei_else.41350:
	fmov	%f0, %fzero
bnei_cont.41351:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%s7)
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
bnei_cont.41347:
	j	bnei_cont.41325
bnei_else.41324:
bnei_cont.41325:
bnei_cont.41283:
	addi	%a1, %zero, 116
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
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
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.41502
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41503
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41504
	lw	%a0, 5(%v0)
	lw	%a2, 7(%v0)
	lw	%a1, 1(%v0)
	lw	%t1, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)
	lw	%t2, 0(%a0)
	add	%at, %a2, %v1
	lw	%t0, 0(%at)
	add	%at, %a1, %v1
	lw	%t3, 0(%at)
	beqi	%t2, 0, bnei_else.41506
	lw	%k0, 179(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.41507
bnei_else.41506:
bnei_cont.41507:
	beqi	%t2, 1, bnei_else.41508
	lw	%k0, 180(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.41509
bnei_else.41508:
bnei_cont.41509:
	beqi	%t2, 2, bnei_else.41510
	lw	%k0, 181(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.41511
bnei_else.41510:
bnei_cont.41511:
	beqi	%t2, 3, bnei_else.41512
	lw	%k0, 182(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.41513
bnei_else.41512:
bnei_cont.41513:
	beqi	%t2, 4, bnei_else.41514
	lw	%k0, 183(%zero)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.41515
bnei_else.41514:
bnei_cont.41515:
	lw	%a0, 1(%sp)
	add	%at, %t1, %a0
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
	j	bnei_cont.41505
bnei_else.41504:
bnei_cont.41505:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.41516
	lw	%k0, 0(%sp)
	lw	%a0, 2(%k0)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41517
	lw	%a0, 3(%k0)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41518
	lw	%a3, 5(%k0)
	lw	%a2, 7(%k0)
	lw	%a1, 1(%k0)
	lw	%a0, 4(%k0)
	sw	%a0, 7(%sp)
	add	%at, %a3, %t2
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%k0)
	lw	%t3, 0(%a0)
	add	%at, %a2, %t2
	lw	%t1, 0(%at)
	add	%at, %a1, %t2
	lw	%t0, 0(%at)
	beqi	%t3, 0, bnei_else.41520
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.41521
bnei_else.41520:
bnei_cont.41521:
	beqi	%t3, 1, bnei_else.41522
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.41523
bnei_else.41522:
bnei_cont.41523:
	beqi	%t3, 2, bnei_else.41524
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.41525
bnei_else.41524:
bnei_cont.41525:
	beqi	%t3, 3, bnei_else.41526
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.41527
bnei_else.41526:
bnei_cont.41527:
	beqi	%t3, 4, bnei_else.41528
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.41529
bnei_else.41528:
bnei_cont.41529:
	lw	%a0, 7(%sp)
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
	j	bnei_cont.41519
bnei_else.41518:
bnei_cont.41519:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.41517:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.41516:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.41503:
	jr	%ra
bgt_else.41502:
	jr	%ra
try_exploit_neighbors.3030:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s0, 0(%at)
	sw	%s0, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.41746
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	blti	%k0, 0, bgti_else.41747
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%s0, 0(%at)
	add	%at, %a0, %v0
	lw	%ra, 0(%at)
	lw	%k0, 2(%ra)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.41748
	add	%at, %a2, %v0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.41750
	addi	%k0, %v0, -1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.41752
	addi	%k0, %v0, 1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.41754
	add	%a3, %zero, %k1
	j	beq_cont.41749
beq_else.41754:
	add	%a3, %zero, %zero
beq_cont.41755:
	j	beq_cont.41749
beq_else.41752:
	add	%a3, %zero, %zero
beq_cont.41753:
	j	beq_cont.41749
beq_else.41750:
	add	%a3, %zero, %zero
beq_cont.41751:
	j	beq_cont.41749
beq_else.41748:
	add	%a3, %zero, %zero
beq_cont.41749:
	beqi	%a3, 0, bnei_else.41756
	lw	%s3, 2(%sp)
	lw	%a3, 3(%s3)
	lw	%s2, 0(%sp)
	add	%at, %a3, %s2
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.41757
	lw	%s5, 5(%ra)
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s4, 5(%a3)
	lw	%s1, 5(%s3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s0, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%k0, 5(%a3)
	add	%at, %s5, %s2
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 150(%zero)
	add	%at, %s4, %s2
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
	add	%at, %s1, %s2
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
	add	%at, %s0, %s2
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
	add	%at, %k0, %s2
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
	lw	%a3, 4(%s3)
	add	%at, %a3, %s2
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
	j	bnei_cont.41758
bnei_else.41757:
bnei_cont.41758:
	lw	%a3, 0(%sp)
	addi	%k0, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %k0, bgt_else.41759
	lw	%s0, 2(%sp)
	lw	%a3, 2(%s0)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	blti	%a3, 0, bgti_else.41760
	lw	%a3, 2(%s0)
	add	%at, %a3, %k0
	lw	%s0, 0(%at)
	lw	%a3, 2(%ra)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.41761
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.41763
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.41765
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.41767
	add	%a3, %zero, %k1
	j	beq_cont.41762
beq_else.41767:
	add	%a3, %zero, %zero
beq_cont.41768:
	j	beq_cont.41762
beq_else.41765:
	add	%a3, %zero, %zero
beq_cont.41766:
	j	beq_cont.41762
beq_else.41763:
	add	%a3, %zero, %zero
beq_cont.41764:
	j	beq_cont.41762
beq_else.41761:
	add	%a3, %zero, %zero
beq_cont.41762:
	beqi	%a3, 0, bnei_else.41769
	lw	%s3, 2(%sp)
	lw	%a3, 3(%s3)
	add	%at, %a3, %k0
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.41770
	lw	%s4, 5(%ra)
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s2, 5(%a3)
	lw	%s1, 5(%s3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s0, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%ra, 5(%a3)
	add	%at, %s4, %k0
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
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
	lw	%a3, 4(%s3)
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
	j	bnei_cont.41771
bnei_else.41770:
bnei_cont.41771:
	addi	%a3, %k0, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3030
bnei_else.41769:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %k0, 0
	j	do_without_neighbors.3014
bgti_else.41760:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.41759:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.41756:
	lw	%ra, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %ra, bgt_else.41774
	lw	%k0, 2(%sp)
	lw	%a0, 2(%k0)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41775
	lw	%a0, 3(%k0)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41776
	lw	%a1, 5(%k0)
	lw	%a3, 7(%k0)
	lw	%a2, 1(%k0)
	lw	%a0, 4(%k0)
	sw	%a0, 3(%sp)
	add	%at, %a1, %ra
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%k0)
	lw	%a1, 0(%a0)
	sw	%a1, 4(%sp)
	add	%at, %a3, %ra
	lw	%v1, 0(%at)
	sw	%v1, 5(%sp)
	add	%at, %a2, %ra
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	beqi	%a1, 0, bnei_else.41778
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41779
bnei_else.41778:
bnei_cont.41779:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.41780
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41781
bnei_else.41780:
bnei_cont.41781:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.41782
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41783
bnei_else.41782:
bnei_cont.41783:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.41784
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41785
bnei_else.41784:
bnei_cont.41785:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.41786
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.41787
bnei_else.41786:
bnei_cont.41787:
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
	j	bnei_cont.41777
bnei_else.41776:
bnei_cont.41777:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3014
bgti_else.41775:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.41774:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.41747:
	jr	%ra
bgt_else.41746:
	jr	%ra
pretrace_diffuse_rays.3043:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.41893
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41894
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41895
	lw	%a0, 6(%v0)
	lw	%a2, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a0, 1(%v0)
	lw	%s0, 179(%a2)
	add	%at, %a1, %v1
	lw	%k0, 0(%at)
	add	%at, %a0, %v1
	lw	%v0, 0(%at)
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 5
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -5
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -5
	lw	%a0, 0(%sp)
	lw	%a1, 5(%a0)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.41896
bnei_else.41895:
bnei_cont.41896:
	lw	%a0, 1(%sp)
	addi	%t0, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t0, bgt_else.41897
	lw	%a1, 0(%sp)
	lw	%a0, 2(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.41898
	lw	%a0, 3(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.41899
	lw	%a0, 6(%a1)
	lw	%a0, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a2, 7(%a1)
	lw	%a1, 1(%a1)
	lw	%a0, 179(%a0)
	sw	%a0, 5(%sp)
	add	%at, %a2, %t0
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	add	%at, %a1, %t0
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t1, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%a0, 5(%sp)
	lw	%v0, 118(%a0)
	lw	%a1, 0(%v0)
	flw	%f1, 0(%a1)
	lw	%a0, 6(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.41901
	add	%a0, %zero, %zero
	j	fbgt_cont.41902
fbgt_else.41901:
	add	%a0, %zero, %k1
fbgt_cont.41902:
	beqi	%a0, 0, bnei_else.41903
	lw	%a0, 5(%sp)
	lw	%v0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.41904
bnei_else.41903:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.41904:
	addi	%a1, %zero, 116
	lw	%v1, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%a0, %t1, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	lw	%a0, 5(%a0)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.41900
bnei_else.41899:
bnei_cont.41900:
	addi	%v1, %t0, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3043
bgti_else.41898:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.41897:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.41894:
	jr	%ra
bgt_else.41893:
	jr	%ra
pretrace_pixels.3046:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%ra, 10(%sp)
	blti	%v1, 0, bgti_else.42002
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
	fbne	%f0, %fzero, fbeq_else.42003
	add	%a0, %zero, %k1
	j	fbeq_cont.42004
fbeq_else.42003:
	add	%a0, %zero, %zero
fbeq_cont.42004:
	beqi	%a0, 0, bnei_else.42005
	fmov	%f0, %f30
	j	bnei_cont.42006
bnei_else.42005:
	fdiv	%f0, %f30, %f0
bnei_cont.42006:
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
	addi	%sp, %sp, 11
	jal	trace_ray.2983
	addi	%sp, %sp, -11
	lw	%a0, 0(%t0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%a0)
	lw	%a1, 6(%t0)
	lw	%a0, 5(%sp)
	sw	%a0, 0(%a1)
	lw	%a0, 2(%t0)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bgti_else.42007
	lw	%a0, 3(%t0)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.42009
	lw	%a0, 6(%t0)
	lw	%a2, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%t0)
	lw	%a0, 1(%t0)
	lw	%t1, 179(%a2)
	lw	%t2, 0(%a1)
	lw	%t3, 0(%a0)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -11
	lw	%v0, 118(%t1)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.42011
	add	%a0, %zero, %zero
	j	fbgt_cont.42012
fbgt_else.42011:
	add	%a0, %zero, %k1
fbgt_cont.42012:
	beqi	%a0, 0, bnei_else.42013
	lw	%v0, 119(%t1)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	j	bnei_cont.42014
bnei_else.42013:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
bnei_cont.42014:
	addi	%a1, %zero, 116
	addi	%a0, %t3, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%a0, 5(%t0)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.42010
bnei_else.42009:
bnei_cont.42010:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -11
	j	bgti_cont.42008
bgti_else.42007:
bgti_cont.42008:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.42015
	addi	%a0, %a0, -5
	j	bgti_cont.42016
bgti_else.42015:
bgti_cont.42016:
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.42002:
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
	blt	%v0, %t0, bgt_else.44336
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.44336:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 155(%zero)
	sw	%a1, 11(%sp)
	addi	%a0, %v1, 1
	sw	%a0, 12(%sp)
	blt	%a0, %a1, bgt_else.44338
	add	%a0, %zero, %zero
	j	bgt_cont.44339
bgt_else.44338:
	blt	%zero, %v1, bgt_else.44340
	add	%a0, %zero, %zero
	j	bgt_cont.44341
bgt_else.44340:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.44342
	add	%a0, %zero, %zero
	j	bgt_cont.44343
bgt_else.44342:
	blt	%zero, %v0, bgt_else.44344
	add	%a0, %zero, %zero
	j	bgt_cont.44345
bgt_else.44344:
	add	%a0, %zero, %k1
bgt_cont.44345:
bgt_cont.44343:
bgt_cont.44341:
bgt_cont.44339:
	beqi	%a0, 0, bnei_else.44346
	lw	%a0, 2(%t1)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bnei_cont.44347
	lw	%a0, 2(%t1)
	lw	%a2, 0(%a0)
	lw	%a0, 2(%sp)
	lw	%k0, 0(%sp)
	add	%at, %a0, %k0
	lw	%a3, 0(%at)
	lw	%a0, 2(%a3)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.44350
	lw	%a0, 4(%sp)
	add	%at, %a0, %k0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.44352
	addi	%a0, %k0, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.44354
	addi	%a0, %k0, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.44356
	add	%a0, %zero, %k1
	j	beq_cont.44351
beq_else.44356:
	add	%a0, %zero, %zero
beq_cont.44357:
	j	beq_cont.44351
beq_else.44354:
	add	%a0, %zero, %zero
beq_cont.44355:
	j	beq_cont.44351
beq_else.44352:
	add	%a0, %zero, %zero
beq_cont.44353:
	j	beq_cont.44351
beq_else.44350:
	add	%a0, %zero, %zero
beq_cont.44351:
	beqi	%a0, 0, bnei_else.44358
	lw	%a0, 3(%t1)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.44360
	lw	%s0, 5(%a3)
	lw	%ra, 0(%sp)
	addi	%a0, %ra, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%k0, 5(%a0)
	lw	%a3, 5(%t1)
	addi	%a0, %ra, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	lw	%a0, 0(%s0)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%k0)
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
	lw	%a0, 4(%t1)
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
	j	bnei_cont.44361
bnei_else.44360:
bnei_cont.44361:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 13
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -13
	j	bnei_cont.44347
bnei_else.44358:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 13
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -13
bnei_cont.44359:
	j	bnei_cont.44347
bgti_else.44348:
bgti_cont.44349:
	j	bnei_cont.44347
bnei_else.44346:
	lw	%a0, 2(%t1)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bgti_else.44362
	lw	%a0, 3(%t1)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.44364
	lw	%a3, 5(%t1)
	lw	%a2, 7(%t1)
	lw	%a1, 1(%t1)
	lw	%a0, 4(%t1)
	sw	%a0, 13(%sp)
	lw	%a0, 0(%a3)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%t1)
	lw	%t4, 0(%a0)
	lw	%t3, 0(%a2)
	lw	%t2, 0(%a1)
	beqi	%t4, 0, bnei_else.44366
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44367
bnei_else.44366:
bnei_cont.44367:
	beqi	%t4, 1, bnei_else.44368
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44369
bnei_else.44368:
bnei_cont.44369:
	beqi	%t4, 2, bnei_else.44370
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44371
bnei_else.44370:
bnei_cont.44371:
	beqi	%t4, 3, bnei_else.44372
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44373
bnei_else.44372:
bnei_cont.44373:
	beqi	%t4, 4, bnei_else.44374
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -14
	j	bnei_cont.44375
bnei_else.44374:
bnei_cont.44375:
	lw	%a0, 13(%sp)
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
	j	bnei_cont.44365
bnei_else.44364:
bnei_cont.44365:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
	j	bgti_cont.44363
bgti_else.44362:
bgti_cont.44363:
bnei_cont.44347:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44376
	blti	%a1, 0, bgti_else.44378
	j	bgt_cont.44377
bgti_else.44378:
	add	%a1, %zero, %zero
bgti_cont.44379:
	j	bgt_cont.44377
bgt_else.44376:
	addi	%a1, %zero, 255
bgt_cont.44377:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	blti	%a1, 10, bgti_else.44380
	blti	%a1, 20, bgti_else.44382
	blti	%a1, 30, bgti_else.44384
	blti	%a1, 40, bgti_else.44386
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44381
	blti	%a1, 20, bgti_else.44390
	blti	%a1, 30, bgti_else.44392
	blti	%a1, 40, bgti_else.44394
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44381
	blti	%a1, 20, bgti_else.44398
	blti	%a1, 30, bgti_else.44400
	blti	%a1, 40, bgti_else.44402
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44381
	blti	%a1, 20, bgti_else.44406
	blti	%a1, 30, bgti_else.44408
	blti	%a1, 40, bgti_else.44410
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44381
bgti_else.44410:
	addi	%a1, %a1, -30
bgti_cont.44411:
	j	bgti_cont.44381
bgti_else.44408:
	addi	%a1, %a1, -20
bgti_cont.44409:
	j	bgti_cont.44381
bgti_else.44406:
	addi	%a1, %a1, -10
bgti_cont.44407:
	j	bgti_cont.44381
bgti_else.44404:
bgti_cont.44405:
	j	bgti_cont.44381
bgti_else.44402:
	addi	%a1, %a1, -30
bgti_cont.44403:
	j	bgti_cont.44381
bgti_else.44400:
	addi	%a1, %a1, -20
bgti_cont.44401:
	j	bgti_cont.44381
bgti_else.44398:
	addi	%a1, %a1, -10
bgti_cont.44399:
	j	bgti_cont.44381
bgti_else.44396:
bgti_cont.44397:
	j	bgti_cont.44381
bgti_else.44394:
	addi	%a1, %a1, -30
bgti_cont.44395:
	j	bgti_cont.44381
bgti_else.44392:
	addi	%a1, %a1, -20
bgti_cont.44393:
	j	bgti_cont.44381
bgti_else.44390:
	addi	%a1, %a1, -10
bgti_cont.44391:
	j	bgti_cont.44381
bgti_else.44388:
bgti_cont.44389:
	j	bgti_cont.44381
bgti_else.44386:
	addi	%a1, %a1, -30
bgti_cont.44387:
	j	bgti_cont.44381
bgti_else.44384:
	addi	%a1, %a1, -20
bgti_cont.44385:
	j	bgti_cont.44381
bgti_else.44382:
	addi	%a1, %a1, -10
bgti_cont.44383:
	j	bgti_cont.44381
bgti_else.44380:
bgti_cont.44381:
	blt	%zero, %a2, bgt_else.44412
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44413
bgt_else.44412:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44414
	blti	%a2, 20, bgti_else.44416
	blti	%a2, 30, bgti_else.44418
	blti	%a2, 40, bgti_else.44420
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44415
	blti	%a2, 20, bgti_else.44424
	blti	%a2, 30, bgti_else.44426
	blti	%a2, 40, bgti_else.44428
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44415
	blti	%a2, 20, bgti_else.44432
	blti	%a2, 30, bgti_else.44434
	blti	%a2, 40, bgti_else.44436
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44415
	blti	%a2, 20, bgti_else.44440
	blti	%a2, 30, bgti_else.44442
	blti	%a2, 40, bgti_else.44444
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44415
bgti_else.44444:
	addi	%a2, %a2, -30
bgti_cont.44445:
	j	bgti_cont.44415
bgti_else.44442:
	addi	%a2, %a2, -20
bgti_cont.44443:
	j	bgti_cont.44415
bgti_else.44440:
	addi	%a2, %a2, -10
bgti_cont.44441:
	j	bgti_cont.44415
bgti_else.44438:
bgti_cont.44439:
	j	bgti_cont.44415
bgti_else.44436:
	addi	%a2, %a2, -30
bgti_cont.44437:
	j	bgti_cont.44415
bgti_else.44434:
	addi	%a2, %a2, -20
bgti_cont.44435:
	j	bgti_cont.44415
bgti_else.44432:
	addi	%a2, %a2, -10
bgti_cont.44433:
	j	bgti_cont.44415
bgti_else.44430:
bgti_cont.44431:
	j	bgti_cont.44415
bgti_else.44428:
	addi	%a2, %a2, -30
bgti_cont.44429:
	j	bgti_cont.44415
bgti_else.44426:
	addi	%a2, %a2, -20
bgti_cont.44427:
	j	bgti_cont.44415
bgti_else.44424:
	addi	%a2, %a2, -10
bgti_cont.44425:
	j	bgti_cont.44415
bgti_else.44422:
bgti_cont.44423:
	j	bgti_cont.44415
bgti_else.44420:
	addi	%a2, %a2, -30
bgti_cont.44421:
	j	bgti_cont.44415
bgti_else.44418:
	addi	%a2, %a2, -20
bgti_cont.44419:
	j	bgti_cont.44415
bgti_else.44416:
	addi	%a2, %a2, -10
bgti_cont.44417:
	j	bgti_cont.44415
bgti_else.44414:
bgti_cont.44415:
	blt	%zero, %a0, bgt_else.44446
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44447
bgt_else.44446:
	blti	%a0, 10, bgti_else.44448
	blti	%a0, 20, bgti_else.44450
	blti	%a0, 30, bgti_else.44452
	blti	%a0, 40, bgti_else.44454
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44449
	blti	%a0, 20, bgti_else.44458
	blti	%a0, 30, bgti_else.44460
	blti	%a0, 40, bgti_else.44462
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44449
	blti	%a0, 20, bgti_else.44466
	blti	%a0, 30, bgti_else.44468
	blti	%a0, 40, bgti_else.44470
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44449
	blti	%a0, 20, bgti_else.44474
	blti	%a0, 30, bgti_else.44476
	blti	%a0, 40, bgti_else.44478
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44449
bgti_else.44478:
	addi	%a0, %a0, -30
bgti_cont.44479:
	j	bgti_cont.44449
bgti_else.44476:
	addi	%a0, %a0, -20
bgti_cont.44477:
	j	bgti_cont.44449
bgti_else.44474:
	addi	%a0, %a0, -10
bgti_cont.44475:
	j	bgti_cont.44449
bgti_else.44472:
bgti_cont.44473:
	j	bgti_cont.44449
bgti_else.44470:
	addi	%a0, %a0, -30
bgti_cont.44471:
	j	bgti_cont.44449
bgti_else.44468:
	addi	%a0, %a0, -20
bgti_cont.44469:
	j	bgti_cont.44449
bgti_else.44466:
	addi	%a0, %a0, -10
bgti_cont.44467:
	j	bgti_cont.44449
bgti_else.44464:
bgti_cont.44465:
	j	bgti_cont.44449
bgti_else.44462:
	addi	%a0, %a0, -30
bgti_cont.44463:
	j	bgti_cont.44449
bgti_else.44460:
	addi	%a0, %a0, -20
bgti_cont.44461:
	j	bgti_cont.44449
bgti_else.44458:
	addi	%a0, %a0, -10
bgti_cont.44459:
	j	bgti_cont.44449
bgti_else.44456:
bgti_cont.44457:
	j	bgti_cont.44449
bgti_else.44454:
	addi	%a0, %a0, -30
bgti_cont.44455:
	j	bgti_cont.44449
bgti_else.44452:
	addi	%a0, %a0, -20
bgti_cont.44453:
	j	bgti_cont.44449
bgti_else.44450:
	addi	%a0, %a0, -10
bgti_cont.44451:
	j	bgti_cont.44449
bgti_else.44448:
bgti_cont.44449:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44447:
bgt_cont.44413:
	addi	%t2, %zero, 32
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44480
	blti	%a1, 0, bgti_else.44482
	j	bgt_cont.44481
bgti_else.44482:
	add	%a1, %zero, %zero
bgti_cont.44483:
	j	bgt_cont.44481
bgt_else.44480:
	addi	%a1, %zero, 255
bgt_cont.44481:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.44484
	blti	%a1, 20, bgti_else.44486
	blti	%a1, 30, bgti_else.44488
	blti	%a1, 40, bgti_else.44490
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44485
	blti	%a1, 20, bgti_else.44494
	blti	%a1, 30, bgti_else.44496
	blti	%a1, 40, bgti_else.44498
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44485
	blti	%a1, 20, bgti_else.44502
	blti	%a1, 30, bgti_else.44504
	blti	%a1, 40, bgti_else.44506
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44485
	blti	%a1, 20, bgti_else.44510
	blti	%a1, 30, bgti_else.44512
	blti	%a1, 40, bgti_else.44514
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44485
bgti_else.44514:
	addi	%a1, %a1, -30
bgti_cont.44515:
	j	bgti_cont.44485
bgti_else.44512:
	addi	%a1, %a1, -20
bgti_cont.44513:
	j	bgti_cont.44485
bgti_else.44510:
	addi	%a1, %a1, -10
bgti_cont.44511:
	j	bgti_cont.44485
bgti_else.44508:
bgti_cont.44509:
	j	bgti_cont.44485
bgti_else.44506:
	addi	%a1, %a1, -30
bgti_cont.44507:
	j	bgti_cont.44485
bgti_else.44504:
	addi	%a1, %a1, -20
bgti_cont.44505:
	j	bgti_cont.44485
bgti_else.44502:
	addi	%a1, %a1, -10
bgti_cont.44503:
	j	bgti_cont.44485
bgti_else.44500:
bgti_cont.44501:
	j	bgti_cont.44485
bgti_else.44498:
	addi	%a1, %a1, -30
bgti_cont.44499:
	j	bgti_cont.44485
bgti_else.44496:
	addi	%a1, %a1, -20
bgti_cont.44497:
	j	bgti_cont.44485
bgti_else.44494:
	addi	%a1, %a1, -10
bgti_cont.44495:
	j	bgti_cont.44485
bgti_else.44492:
bgti_cont.44493:
	j	bgti_cont.44485
bgti_else.44490:
	addi	%a1, %a1, -30
bgti_cont.44491:
	j	bgti_cont.44485
bgti_else.44488:
	addi	%a1, %a1, -20
bgti_cont.44489:
	j	bgti_cont.44485
bgti_else.44486:
	addi	%a1, %a1, -10
bgti_cont.44487:
	j	bgti_cont.44485
bgti_else.44484:
bgti_cont.44485:
	blt	%zero, %a2, bgt_else.44516
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44517
bgt_else.44516:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44518
	blti	%a2, 20, bgti_else.44520
	blti	%a2, 30, bgti_else.44522
	blti	%a2, 40, bgti_else.44524
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44519
	blti	%a2, 20, bgti_else.44528
	blti	%a2, 30, bgti_else.44530
	blti	%a2, 40, bgti_else.44532
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44519
	blti	%a2, 20, bgti_else.44536
	blti	%a2, 30, bgti_else.44538
	blti	%a2, 40, bgti_else.44540
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44519
	blti	%a2, 20, bgti_else.44544
	blti	%a2, 30, bgti_else.44546
	blti	%a2, 40, bgti_else.44548
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44519
bgti_else.44548:
	addi	%a2, %a2, -30
bgti_cont.44549:
	j	bgti_cont.44519
bgti_else.44546:
	addi	%a2, %a2, -20
bgti_cont.44547:
	j	bgti_cont.44519
bgti_else.44544:
	addi	%a2, %a2, -10
bgti_cont.44545:
	j	bgti_cont.44519
bgti_else.44542:
bgti_cont.44543:
	j	bgti_cont.44519
bgti_else.44540:
	addi	%a2, %a2, -30
bgti_cont.44541:
	j	bgti_cont.44519
bgti_else.44538:
	addi	%a2, %a2, -20
bgti_cont.44539:
	j	bgti_cont.44519
bgti_else.44536:
	addi	%a2, %a2, -10
bgti_cont.44537:
	j	bgti_cont.44519
bgti_else.44534:
bgti_cont.44535:
	j	bgti_cont.44519
bgti_else.44532:
	addi	%a2, %a2, -30
bgti_cont.44533:
	j	bgti_cont.44519
bgti_else.44530:
	addi	%a2, %a2, -20
bgti_cont.44531:
	j	bgti_cont.44519
bgti_else.44528:
	addi	%a2, %a2, -10
bgti_cont.44529:
	j	bgti_cont.44519
bgti_else.44526:
bgti_cont.44527:
	j	bgti_cont.44519
bgti_else.44524:
	addi	%a2, %a2, -30
bgti_cont.44525:
	j	bgti_cont.44519
bgti_else.44522:
	addi	%a2, %a2, -20
bgti_cont.44523:
	j	bgti_cont.44519
bgti_else.44520:
	addi	%a2, %a2, -10
bgti_cont.44521:
	j	bgti_cont.44519
bgti_else.44518:
bgti_cont.44519:
	blt	%zero, %a0, bgt_else.44550
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44551
bgt_else.44550:
	blti	%a0, 10, bgti_else.44552
	blti	%a0, 20, bgti_else.44554
	blti	%a0, 30, bgti_else.44556
	blti	%a0, 40, bgti_else.44558
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44553
	blti	%a0, 20, bgti_else.44562
	blti	%a0, 30, bgti_else.44564
	blti	%a0, 40, bgti_else.44566
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44553
	blti	%a0, 20, bgti_else.44570
	blti	%a0, 30, bgti_else.44572
	blti	%a0, 40, bgti_else.44574
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44553
	blti	%a0, 20, bgti_else.44578
	blti	%a0, 30, bgti_else.44580
	blti	%a0, 40, bgti_else.44582
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44553
bgti_else.44582:
	addi	%a0, %a0, -30
bgti_cont.44583:
	j	bgti_cont.44553
bgti_else.44580:
	addi	%a0, %a0, -20
bgti_cont.44581:
	j	bgti_cont.44553
bgti_else.44578:
	addi	%a0, %a0, -10
bgti_cont.44579:
	j	bgti_cont.44553
bgti_else.44576:
bgti_cont.44577:
	j	bgti_cont.44553
bgti_else.44574:
	addi	%a0, %a0, -30
bgti_cont.44575:
	j	bgti_cont.44553
bgti_else.44572:
	addi	%a0, %a0, -20
bgti_cont.44573:
	j	bgti_cont.44553
bgti_else.44570:
	addi	%a0, %a0, -10
bgti_cont.44571:
	j	bgti_cont.44553
bgti_else.44568:
bgti_cont.44569:
	j	bgti_cont.44553
bgti_else.44566:
	addi	%a0, %a0, -30
bgti_cont.44567:
	j	bgti_cont.44553
bgti_else.44564:
	addi	%a0, %a0, -20
bgti_cont.44565:
	j	bgti_cont.44553
bgti_else.44562:
	addi	%a0, %a0, -10
bgti_cont.44563:
	j	bgti_cont.44553
bgti_else.44560:
bgti_cont.44561:
	j	bgti_cont.44553
bgti_else.44558:
	addi	%a0, %a0, -30
bgti_cont.44559:
	j	bgti_cont.44553
bgti_else.44556:
	addi	%a0, %a0, -20
bgti_cont.44557:
	j	bgti_cont.44553
bgti_else.44554:
	addi	%a0, %a0, -10
bgti_cont.44555:
	j	bgti_cont.44553
bgti_else.44552:
bgti_cont.44553:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44551:
bgt_cont.44517:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44584
	blti	%a1, 0, bgti_else.44586
	j	bgt_cont.44585
bgti_else.44586:
	add	%a1, %zero, %zero
bgti_cont.44587:
	j	bgt_cont.44585
bgt_else.44584:
	addi	%a1, %zero, 255
bgt_cont.44585:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.44588
	blti	%a1, 20, bgti_else.44590
	blti	%a1, 30, bgti_else.44592
	blti	%a1, 40, bgti_else.44594
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44589
	blti	%a1, 20, bgti_else.44598
	blti	%a1, 30, bgti_else.44600
	blti	%a1, 40, bgti_else.44602
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44589
	blti	%a1, 20, bgti_else.44606
	blti	%a1, 30, bgti_else.44608
	blti	%a1, 40, bgti_else.44610
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44589
	blti	%a1, 20, bgti_else.44614
	blti	%a1, 30, bgti_else.44616
	blti	%a1, 40, bgti_else.44618
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44589
bgti_else.44618:
	addi	%a1, %a1, -30
bgti_cont.44619:
	j	bgti_cont.44589
bgti_else.44616:
	addi	%a1, %a1, -20
bgti_cont.44617:
	j	bgti_cont.44589
bgti_else.44614:
	addi	%a1, %a1, -10
bgti_cont.44615:
	j	bgti_cont.44589
bgti_else.44612:
bgti_cont.44613:
	j	bgti_cont.44589
bgti_else.44610:
	addi	%a1, %a1, -30
bgti_cont.44611:
	j	bgti_cont.44589
bgti_else.44608:
	addi	%a1, %a1, -20
bgti_cont.44609:
	j	bgti_cont.44589
bgti_else.44606:
	addi	%a1, %a1, -10
bgti_cont.44607:
	j	bgti_cont.44589
bgti_else.44604:
bgti_cont.44605:
	j	bgti_cont.44589
bgti_else.44602:
	addi	%a1, %a1, -30
bgti_cont.44603:
	j	bgti_cont.44589
bgti_else.44600:
	addi	%a1, %a1, -20
bgti_cont.44601:
	j	bgti_cont.44589
bgti_else.44598:
	addi	%a1, %a1, -10
bgti_cont.44599:
	j	bgti_cont.44589
bgti_else.44596:
bgti_cont.44597:
	j	bgti_cont.44589
bgti_else.44594:
	addi	%a1, %a1, -30
bgti_cont.44595:
	j	bgti_cont.44589
bgti_else.44592:
	addi	%a1, %a1, -20
bgti_cont.44593:
	j	bgti_cont.44589
bgti_else.44590:
	addi	%a1, %a1, -10
bgti_cont.44591:
	j	bgti_cont.44589
bgti_else.44588:
bgti_cont.44589:
	blt	%zero, %a2, bgt_else.44620
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44621
bgt_else.44620:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.44622
	blti	%a2, 20, bgti_else.44624
	blti	%a2, 30, bgti_else.44626
	blti	%a2, 40, bgti_else.44628
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44623
	blti	%a2, 20, bgti_else.44632
	blti	%a2, 30, bgti_else.44634
	blti	%a2, 40, bgti_else.44636
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44623
	blti	%a2, 20, bgti_else.44640
	blti	%a2, 30, bgti_else.44642
	blti	%a2, 40, bgti_else.44644
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44623
	blti	%a2, 20, bgti_else.44648
	blti	%a2, 30, bgti_else.44650
	blti	%a2, 40, bgti_else.44652
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44623
bgti_else.44652:
	addi	%a2, %a2, -30
bgti_cont.44653:
	j	bgti_cont.44623
bgti_else.44650:
	addi	%a2, %a2, -20
bgti_cont.44651:
	j	bgti_cont.44623
bgti_else.44648:
	addi	%a2, %a2, -10
bgti_cont.44649:
	j	bgti_cont.44623
bgti_else.44646:
bgti_cont.44647:
	j	bgti_cont.44623
bgti_else.44644:
	addi	%a2, %a2, -30
bgti_cont.44645:
	j	bgti_cont.44623
bgti_else.44642:
	addi	%a2, %a2, -20
bgti_cont.44643:
	j	bgti_cont.44623
bgti_else.44640:
	addi	%a2, %a2, -10
bgti_cont.44641:
	j	bgti_cont.44623
bgti_else.44638:
bgti_cont.44639:
	j	bgti_cont.44623
bgti_else.44636:
	addi	%a2, %a2, -30
bgti_cont.44637:
	j	bgti_cont.44623
bgti_else.44634:
	addi	%a2, %a2, -20
bgti_cont.44635:
	j	bgti_cont.44623
bgti_else.44632:
	addi	%a2, %a2, -10
bgti_cont.44633:
	j	bgti_cont.44623
bgti_else.44630:
bgti_cont.44631:
	j	bgti_cont.44623
bgti_else.44628:
	addi	%a2, %a2, -30
bgti_cont.44629:
	j	bgti_cont.44623
bgti_else.44626:
	addi	%a2, %a2, -20
bgti_cont.44627:
	j	bgti_cont.44623
bgti_else.44624:
	addi	%a2, %a2, -10
bgti_cont.44625:
	j	bgti_cont.44623
bgti_else.44622:
bgti_cont.44623:
	blt	%zero, %a0, bgt_else.44654
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44655
bgt_else.44654:
	blti	%a0, 10, bgti_else.44656
	blti	%a0, 20, bgti_else.44658
	blti	%a0, 30, bgti_else.44660
	blti	%a0, 40, bgti_else.44662
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44657
	blti	%a0, 20, bgti_else.44666
	blti	%a0, 30, bgti_else.44668
	blti	%a0, 40, bgti_else.44670
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44657
	blti	%a0, 20, bgti_else.44674
	blti	%a0, 30, bgti_else.44676
	blti	%a0, 40, bgti_else.44678
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44657
	blti	%a0, 20, bgti_else.44682
	blti	%a0, 30, bgti_else.44684
	blti	%a0, 40, bgti_else.44686
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44657
bgti_else.44686:
	addi	%a0, %a0, -30
bgti_cont.44687:
	j	bgti_cont.44657
bgti_else.44684:
	addi	%a0, %a0, -20
bgti_cont.44685:
	j	bgti_cont.44657
bgti_else.44682:
	addi	%a0, %a0, -10
bgti_cont.44683:
	j	bgti_cont.44657
bgti_else.44680:
bgti_cont.44681:
	j	bgti_cont.44657
bgti_else.44678:
	addi	%a0, %a0, -30
bgti_cont.44679:
	j	bgti_cont.44657
bgti_else.44676:
	addi	%a0, %a0, -20
bgti_cont.44677:
	j	bgti_cont.44657
bgti_else.44674:
	addi	%a0, %a0, -10
bgti_cont.44675:
	j	bgti_cont.44657
bgti_else.44672:
bgti_cont.44673:
	j	bgti_cont.44657
bgti_else.44670:
	addi	%a0, %a0, -30
bgti_cont.44671:
	j	bgti_cont.44657
bgti_else.44668:
	addi	%a0, %a0, -20
bgti_cont.44669:
	j	bgti_cont.44657
bgti_else.44666:
	addi	%a0, %a0, -10
bgti_cont.44667:
	j	bgti_cont.44657
bgti_else.44664:
bgti_cont.44665:
	j	bgti_cont.44657
bgti_else.44662:
	addi	%a0, %a0, -30
bgti_cont.44663:
	j	bgti_cont.44657
bgti_else.44660:
	addi	%a0, %a0, -20
bgti_cont.44661:
	j	bgti_cont.44657
bgti_else.44658:
	addi	%a0, %a0, -10
bgti_cont.44659:
	j	bgti_cont.44657
bgti_else.44656:
bgti_cont.44657:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44655:
bgt_cont.44621:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%a0, 0(%sp)
	addi	%t3, %a0, 1
	blt	%t3, %t0, bgt_else.44688
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.44688:
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
	lw	%a1, 11(%sp)
	lw	%a0, 12(%sp)
	blt	%a0, %a1, bgt_else.44690
	add	%a0, %zero, %zero
	j	bgt_cont.44691
bgt_else.44690:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.44692
	add	%a0, %zero, %zero
	j	bgt_cont.44693
bgt_else.44692:
	addi	%a0, %t3, 1
	blt	%a0, %t0, bgt_else.44694
	add	%a0, %zero, %zero
	j	bgt_cont.44695
bgt_else.44694:
	blt	%zero, %t3, bgt_else.44696
	add	%a0, %zero, %zero
	j	bgt_cont.44697
bgt_else.44696:
	add	%a0, %zero, %k1
bgt_cont.44697:
bgt_cont.44695:
bgt_cont.44693:
bgt_cont.44691:
	beqi	%a0, 0, bnei_else.44698
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -14
	j	bnei_cont.44699
bnei_else.44698:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
bnei_cont.44699:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44700
	blti	%a1, 0, bgti_else.44702
	j	bgt_cont.44701
bgti_else.44702:
	add	%a1, %zero, %zero
bgti_cont.44703:
	j	bgt_cont.44701
bgt_else.44700:
	addi	%a1, %zero, 255
bgt_cont.44701:
	blti	%a1, 10, bgti_else.44704
	blti	%a1, 20, bgti_else.44706
	blti	%a1, 30, bgti_else.44708
	blti	%a1, 40, bgti_else.44710
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44712
	blti	%a0, 20, bgti_else.44714
	blti	%a0, 30, bgti_else.44716
	blti	%a0, 40, bgti_else.44718
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44720
	blti	%a0, 20, bgti_else.44722
	blti	%a0, 30, bgti_else.44724
	blti	%a0, 40, bgti_else.44726
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44705
bgti_else.44726:
	addi	%a2, %zero, 11
bgti_cont.44727:
	j	bgti_cont.44705
bgti_else.44724:
	addi	%a2, %zero, 10
bgti_cont.44725:
	j	bgti_cont.44705
bgti_else.44722:
	addi	%a2, %zero, 9
bgti_cont.44723:
	j	bgti_cont.44705
bgti_else.44720:
	addi	%a2, %zero, 8
bgti_cont.44721:
	j	bgti_cont.44705
bgti_else.44718:
	addi	%a2, %zero, 7
bgti_cont.44719:
	j	bgti_cont.44705
bgti_else.44716:
	addi	%a2, %zero, 6
bgti_cont.44717:
	j	bgti_cont.44705
bgti_else.44714:
	addi	%a2, %zero, 5
bgti_cont.44715:
	j	bgti_cont.44705
bgti_else.44712:
	addi	%a2, %zero, 4
bgti_cont.44713:
	j	bgti_cont.44705
bgti_else.44710:
	addi	%a2, %zero, 3
bgti_cont.44711:
	j	bgti_cont.44705
bgti_else.44708:
	addi	%a2, %zero, 2
bgti_cont.44709:
	j	bgti_cont.44705
bgti_else.44706:
	add	%a2, %zero, %k1
bgti_cont.44707:
	j	bgti_cont.44705
bgti_else.44704:
	add	%a2, %zero, %zero
bgti_cont.44705:
	blti	%a1, 10, bgti_else.44728
	blti	%a1, 20, bgti_else.44730
	blti	%a1, 30, bgti_else.44732
	blti	%a1, 40, bgti_else.44734
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44729
	blti	%a1, 20, bgti_else.44738
	blti	%a1, 30, bgti_else.44740
	blti	%a1, 40, bgti_else.44742
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44729
	blti	%a1, 20, bgti_else.44746
	blti	%a1, 30, bgti_else.44748
	blti	%a1, 40, bgti_else.44750
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44729
bgti_else.44750:
	addi	%a1, %a1, -30
bgti_cont.44751:
	j	bgti_cont.44729
bgti_else.44748:
	addi	%a1, %a1, -20
bgti_cont.44749:
	j	bgti_cont.44729
bgti_else.44746:
	addi	%a1, %a1, -10
bgti_cont.44747:
	j	bgti_cont.44729
bgti_else.44744:
bgti_cont.44745:
	j	bgti_cont.44729
bgti_else.44742:
	addi	%a1, %a1, -30
bgti_cont.44743:
	j	bgti_cont.44729
bgti_else.44740:
	addi	%a1, %a1, -20
bgti_cont.44741:
	j	bgti_cont.44729
bgti_else.44738:
	addi	%a1, %a1, -10
bgti_cont.44739:
	j	bgti_cont.44729
bgti_else.44736:
bgti_cont.44737:
	j	bgti_cont.44729
bgti_else.44734:
	addi	%a1, %a1, -30
bgti_cont.44735:
	j	bgti_cont.44729
bgti_else.44732:
	addi	%a1, %a1, -20
bgti_cont.44733:
	j	bgti_cont.44729
bgti_else.44730:
	addi	%a1, %a1, -10
bgti_cont.44731:
	j	bgti_cont.44729
bgti_else.44728:
bgti_cont.44729:
	blt	%zero, %a2, bgt_else.44752
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44753
bgt_else.44752:
	blti	%a2, 10, bgti_else.44754
	blti	%a2, 20, bgti_else.44756
	blti	%a2, 30, bgti_else.44758
	blti	%a2, 40, bgti_else.44760
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44762
	blti	%a0, 20, bgti_else.44764
	blti	%a0, 30, bgti_else.44766
	blti	%a0, 40, bgti_else.44768
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44770
	blti	%a0, 20, bgti_else.44772
	blti	%a0, 30, bgti_else.44774
	blti	%a0, 40, bgti_else.44776
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44755
bgti_else.44776:
	addi	%a0, %zero, 11
bgti_cont.44777:
	j	bgti_cont.44755
bgti_else.44774:
	addi	%a0, %zero, 10
bgti_cont.44775:
	j	bgti_cont.44755
bgti_else.44772:
	addi	%a0, %zero, 9
bgti_cont.44773:
	j	bgti_cont.44755
bgti_else.44770:
	addi	%a0, %zero, 8
bgti_cont.44771:
	j	bgti_cont.44755
bgti_else.44768:
	addi	%a0, %zero, 7
bgti_cont.44769:
	j	bgti_cont.44755
bgti_else.44766:
	addi	%a0, %zero, 6
bgti_cont.44767:
	j	bgti_cont.44755
bgti_else.44764:
	addi	%a0, %zero, 5
bgti_cont.44765:
	j	bgti_cont.44755
bgti_else.44762:
	addi	%a0, %zero, 4
bgti_cont.44763:
	j	bgti_cont.44755
bgti_else.44760:
	addi	%a0, %zero, 3
bgti_cont.44761:
	j	bgti_cont.44755
bgti_else.44758:
	addi	%a0, %zero, 2
bgti_cont.44759:
	j	bgti_cont.44755
bgti_else.44756:
	add	%a0, %zero, %k1
bgti_cont.44757:
	j	bgti_cont.44755
bgti_else.44754:
	add	%a0, %zero, %zero
bgti_cont.44755:
	blti	%a2, 10, bgti_else.44778
	blti	%a2, 20, bgti_else.44780
	blti	%a2, 30, bgti_else.44782
	blti	%a2, 40, bgti_else.44784
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44779
	blti	%a2, 20, bgti_else.44788
	blti	%a2, 30, bgti_else.44790
	blti	%a2, 40, bgti_else.44792
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44779
	blti	%a2, 20, bgti_else.44796
	blti	%a2, 30, bgti_else.44798
	blti	%a2, 40, bgti_else.44800
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44779
bgti_else.44800:
	addi	%a2, %a2, -30
bgti_cont.44801:
	j	bgti_cont.44779
bgti_else.44798:
	addi	%a2, %a2, -20
bgti_cont.44799:
	j	bgti_cont.44779
bgti_else.44796:
	addi	%a2, %a2, -10
bgti_cont.44797:
	j	bgti_cont.44779
bgti_else.44794:
bgti_cont.44795:
	j	bgti_cont.44779
bgti_else.44792:
	addi	%a2, %a2, -30
bgti_cont.44793:
	j	bgti_cont.44779
bgti_else.44790:
	addi	%a2, %a2, -20
bgti_cont.44791:
	j	bgti_cont.44779
bgti_else.44788:
	addi	%a2, %a2, -10
bgti_cont.44789:
	j	bgti_cont.44779
bgti_else.44786:
bgti_cont.44787:
	j	bgti_cont.44779
bgti_else.44784:
	addi	%a2, %a2, -30
bgti_cont.44785:
	j	bgti_cont.44779
bgti_else.44782:
	addi	%a2, %a2, -20
bgti_cont.44783:
	j	bgti_cont.44779
bgti_else.44780:
	addi	%a2, %a2, -10
bgti_cont.44781:
	j	bgti_cont.44779
bgti_else.44778:
bgti_cont.44779:
	blt	%zero, %a0, bgt_else.44802
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44803
bgt_else.44802:
	blti	%a0, 10, bgti_else.44804
	blti	%a0, 20, bgti_else.44806
	blti	%a0, 30, bgti_else.44808
	blti	%a0, 40, bgti_else.44810
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44805
	blti	%a0, 20, bgti_else.44814
	blti	%a0, 30, bgti_else.44816
	blti	%a0, 40, bgti_else.44818
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44805
	blti	%a0, 20, bgti_else.44822
	blti	%a0, 30, bgti_else.44824
	blti	%a0, 40, bgti_else.44826
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44805
bgti_else.44826:
	addi	%a0, %a0, -30
bgti_cont.44827:
	j	bgti_cont.44805
bgti_else.44824:
	addi	%a0, %a0, -20
bgti_cont.44825:
	j	bgti_cont.44805
bgti_else.44822:
	addi	%a0, %a0, -10
bgti_cont.44823:
	j	bgti_cont.44805
bgti_else.44820:
bgti_cont.44821:
	j	bgti_cont.44805
bgti_else.44818:
	addi	%a0, %a0, -30
bgti_cont.44819:
	j	bgti_cont.44805
bgti_else.44816:
	addi	%a0, %a0, -20
bgti_cont.44817:
	j	bgti_cont.44805
bgti_else.44814:
	addi	%a0, %a0, -10
bgti_cont.44815:
	j	bgti_cont.44805
bgti_else.44812:
bgti_cont.44813:
	j	bgti_cont.44805
bgti_else.44810:
	addi	%a0, %a0, -30
bgti_cont.44811:
	j	bgti_cont.44805
bgti_else.44808:
	addi	%a0, %a0, -20
bgti_cont.44809:
	j	bgti_cont.44805
bgti_else.44806:
	addi	%a0, %a0, -10
bgti_cont.44807:
	j	bgti_cont.44805
bgti_else.44804:
bgti_cont.44805:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44803:
bgt_cont.44753:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44828
	blti	%a1, 0, bgti_else.44830
	j	bgt_cont.44829
bgti_else.44830:
	add	%a1, %zero, %zero
bgti_cont.44831:
	j	bgt_cont.44829
bgt_else.44828:
	addi	%a1, %zero, 255
bgt_cont.44829:
	blti	%a1, 10, bgti_else.44832
	blti	%a1, 20, bgti_else.44834
	blti	%a1, 30, bgti_else.44836
	blti	%a1, 40, bgti_else.44838
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44840
	blti	%a0, 20, bgti_else.44842
	blti	%a0, 30, bgti_else.44844
	blti	%a0, 40, bgti_else.44846
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44848
	blti	%a0, 20, bgti_else.44850
	blti	%a0, 30, bgti_else.44852
	blti	%a0, 40, bgti_else.44854
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44833
bgti_else.44854:
	addi	%a2, %zero, 11
bgti_cont.44855:
	j	bgti_cont.44833
bgti_else.44852:
	addi	%a2, %zero, 10
bgti_cont.44853:
	j	bgti_cont.44833
bgti_else.44850:
	addi	%a2, %zero, 9
bgti_cont.44851:
	j	bgti_cont.44833
bgti_else.44848:
	addi	%a2, %zero, 8
bgti_cont.44849:
	j	bgti_cont.44833
bgti_else.44846:
	addi	%a2, %zero, 7
bgti_cont.44847:
	j	bgti_cont.44833
bgti_else.44844:
	addi	%a2, %zero, 6
bgti_cont.44845:
	j	bgti_cont.44833
bgti_else.44842:
	addi	%a2, %zero, 5
bgti_cont.44843:
	j	bgti_cont.44833
bgti_else.44840:
	addi	%a2, %zero, 4
bgti_cont.44841:
	j	bgti_cont.44833
bgti_else.44838:
	addi	%a2, %zero, 3
bgti_cont.44839:
	j	bgti_cont.44833
bgti_else.44836:
	addi	%a2, %zero, 2
bgti_cont.44837:
	j	bgti_cont.44833
bgti_else.44834:
	add	%a2, %zero, %k1
bgti_cont.44835:
	j	bgti_cont.44833
bgti_else.44832:
	add	%a2, %zero, %zero
bgti_cont.44833:
	blti	%a1, 10, bgti_else.44856
	blti	%a1, 20, bgti_else.44858
	blti	%a1, 30, bgti_else.44860
	blti	%a1, 40, bgti_else.44862
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44857
	blti	%a1, 20, bgti_else.44866
	blti	%a1, 30, bgti_else.44868
	blti	%a1, 40, bgti_else.44870
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44857
	blti	%a1, 20, bgti_else.44874
	blti	%a1, 30, bgti_else.44876
	blti	%a1, 40, bgti_else.44878
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44857
bgti_else.44878:
	addi	%a1, %a1, -30
bgti_cont.44879:
	j	bgti_cont.44857
bgti_else.44876:
	addi	%a1, %a1, -20
bgti_cont.44877:
	j	bgti_cont.44857
bgti_else.44874:
	addi	%a1, %a1, -10
bgti_cont.44875:
	j	bgti_cont.44857
bgti_else.44872:
bgti_cont.44873:
	j	bgti_cont.44857
bgti_else.44870:
	addi	%a1, %a1, -30
bgti_cont.44871:
	j	bgti_cont.44857
bgti_else.44868:
	addi	%a1, %a1, -20
bgti_cont.44869:
	j	bgti_cont.44857
bgti_else.44866:
	addi	%a1, %a1, -10
bgti_cont.44867:
	j	bgti_cont.44857
bgti_else.44864:
bgti_cont.44865:
	j	bgti_cont.44857
bgti_else.44862:
	addi	%a1, %a1, -30
bgti_cont.44863:
	j	bgti_cont.44857
bgti_else.44860:
	addi	%a1, %a1, -20
bgti_cont.44861:
	j	bgti_cont.44857
bgti_else.44858:
	addi	%a1, %a1, -10
bgti_cont.44859:
	j	bgti_cont.44857
bgti_else.44856:
bgti_cont.44857:
	blt	%zero, %a2, bgt_else.44880
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44881
bgt_else.44880:
	blti	%a2, 10, bgti_else.44882
	blti	%a2, 20, bgti_else.44884
	blti	%a2, 30, bgti_else.44886
	blti	%a2, 40, bgti_else.44888
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44890
	blti	%a0, 20, bgti_else.44892
	blti	%a0, 30, bgti_else.44894
	blti	%a0, 40, bgti_else.44896
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44898
	blti	%a0, 20, bgti_else.44900
	blti	%a0, 30, bgti_else.44902
	blti	%a0, 40, bgti_else.44904
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44883
bgti_else.44904:
	addi	%a0, %zero, 11
bgti_cont.44905:
	j	bgti_cont.44883
bgti_else.44902:
	addi	%a0, %zero, 10
bgti_cont.44903:
	j	bgti_cont.44883
bgti_else.44900:
	addi	%a0, %zero, 9
bgti_cont.44901:
	j	bgti_cont.44883
bgti_else.44898:
	addi	%a0, %zero, 8
bgti_cont.44899:
	j	bgti_cont.44883
bgti_else.44896:
	addi	%a0, %zero, 7
bgti_cont.44897:
	j	bgti_cont.44883
bgti_else.44894:
	addi	%a0, %zero, 6
bgti_cont.44895:
	j	bgti_cont.44883
bgti_else.44892:
	addi	%a0, %zero, 5
bgti_cont.44893:
	j	bgti_cont.44883
bgti_else.44890:
	addi	%a0, %zero, 4
bgti_cont.44891:
	j	bgti_cont.44883
bgti_else.44888:
	addi	%a0, %zero, 3
bgti_cont.44889:
	j	bgti_cont.44883
bgti_else.44886:
	addi	%a0, %zero, 2
bgti_cont.44887:
	j	bgti_cont.44883
bgti_else.44884:
	add	%a0, %zero, %k1
bgti_cont.44885:
	j	bgti_cont.44883
bgti_else.44882:
	add	%a0, %zero, %zero
bgti_cont.44883:
	blti	%a2, 10, bgti_else.44906
	blti	%a2, 20, bgti_else.44908
	blti	%a2, 30, bgti_else.44910
	blti	%a2, 40, bgti_else.44912
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44907
	blti	%a2, 20, bgti_else.44916
	blti	%a2, 30, bgti_else.44918
	blti	%a2, 40, bgti_else.44920
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44907
	blti	%a2, 20, bgti_else.44924
	blti	%a2, 30, bgti_else.44926
	blti	%a2, 40, bgti_else.44928
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44907
bgti_else.44928:
	addi	%a2, %a2, -30
bgti_cont.44929:
	j	bgti_cont.44907
bgti_else.44926:
	addi	%a2, %a2, -20
bgti_cont.44927:
	j	bgti_cont.44907
bgti_else.44924:
	addi	%a2, %a2, -10
bgti_cont.44925:
	j	bgti_cont.44907
bgti_else.44922:
bgti_cont.44923:
	j	bgti_cont.44907
bgti_else.44920:
	addi	%a2, %a2, -30
bgti_cont.44921:
	j	bgti_cont.44907
bgti_else.44918:
	addi	%a2, %a2, -20
bgti_cont.44919:
	j	bgti_cont.44907
bgti_else.44916:
	addi	%a2, %a2, -10
bgti_cont.44917:
	j	bgti_cont.44907
bgti_else.44914:
bgti_cont.44915:
	j	bgti_cont.44907
bgti_else.44912:
	addi	%a2, %a2, -30
bgti_cont.44913:
	j	bgti_cont.44907
bgti_else.44910:
	addi	%a2, %a2, -20
bgti_cont.44911:
	j	bgti_cont.44907
bgti_else.44908:
	addi	%a2, %a2, -10
bgti_cont.44909:
	j	bgti_cont.44907
bgti_else.44906:
bgti_cont.44907:
	blt	%zero, %a0, bgt_else.44930
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.44931
bgt_else.44930:
	blti	%a0, 10, bgti_else.44932
	blti	%a0, 20, bgti_else.44934
	blti	%a0, 30, bgti_else.44936
	blti	%a0, 40, bgti_else.44938
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44933
	blti	%a0, 20, bgti_else.44942
	blti	%a0, 30, bgti_else.44944
	blti	%a0, 40, bgti_else.44946
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44933
	blti	%a0, 20, bgti_else.44950
	blti	%a0, 30, bgti_else.44952
	blti	%a0, 40, bgti_else.44954
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.44933
bgti_else.44954:
	addi	%a0, %a0, -30
bgti_cont.44955:
	j	bgti_cont.44933
bgti_else.44952:
	addi	%a0, %a0, -20
bgti_cont.44953:
	j	bgti_cont.44933
bgti_else.44950:
	addi	%a0, %a0, -10
bgti_cont.44951:
	j	bgti_cont.44933
bgti_else.44948:
bgti_cont.44949:
	j	bgti_cont.44933
bgti_else.44946:
	addi	%a0, %a0, -30
bgti_cont.44947:
	j	bgti_cont.44933
bgti_else.44944:
	addi	%a0, %a0, -20
bgti_cont.44945:
	j	bgti_cont.44933
bgti_else.44942:
	addi	%a0, %a0, -10
bgti_cont.44943:
	j	bgti_cont.44933
bgti_else.44940:
bgti_cont.44941:
	j	bgti_cont.44933
bgti_else.44938:
	addi	%a0, %a0, -30
bgti_cont.44939:
	j	bgti_cont.44933
bgti_else.44936:
	addi	%a0, %a0, -20
bgti_cont.44937:
	j	bgti_cont.44933
bgti_else.44934:
	addi	%a0, %a0, -10
bgti_cont.44935:
	j	bgti_cont.44933
bgti_else.44932:
bgti_cont.44933:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.44931:
bgt_cont.44881:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44956
	blti	%a1, 0, bgti_else.44958
	j	bgt_cont.44957
bgti_else.44958:
	add	%a1, %zero, %zero
bgti_cont.44959:
	j	bgt_cont.44957
bgt_else.44956:
	addi	%a1, %zero, 255
bgt_cont.44957:
	blti	%a1, 10, bgti_else.44960
	blti	%a1, 20, bgti_else.44962
	blti	%a1, 30, bgti_else.44964
	blti	%a1, 40, bgti_else.44966
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44968
	blti	%a0, 20, bgti_else.44970
	blti	%a0, 30, bgti_else.44972
	blti	%a0, 40, bgti_else.44974
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44976
	blti	%a0, 20, bgti_else.44978
	blti	%a0, 30, bgti_else.44980
	blti	%a0, 40, bgti_else.44982
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.44961
bgti_else.44982:
	addi	%a2, %zero, 11
bgti_cont.44983:
	j	bgti_cont.44961
bgti_else.44980:
	addi	%a2, %zero, 10
bgti_cont.44981:
	j	bgti_cont.44961
bgti_else.44978:
	addi	%a2, %zero, 9
bgti_cont.44979:
	j	bgti_cont.44961
bgti_else.44976:
	addi	%a2, %zero, 8
bgti_cont.44977:
	j	bgti_cont.44961
bgti_else.44974:
	addi	%a2, %zero, 7
bgti_cont.44975:
	j	bgti_cont.44961
bgti_else.44972:
	addi	%a2, %zero, 6
bgti_cont.44973:
	j	bgti_cont.44961
bgti_else.44970:
	addi	%a2, %zero, 5
bgti_cont.44971:
	j	bgti_cont.44961
bgti_else.44968:
	addi	%a2, %zero, 4
bgti_cont.44969:
	j	bgti_cont.44961
bgti_else.44966:
	addi	%a2, %zero, 3
bgti_cont.44967:
	j	bgti_cont.44961
bgti_else.44964:
	addi	%a2, %zero, 2
bgti_cont.44965:
	j	bgti_cont.44961
bgti_else.44962:
	add	%a2, %zero, %k1
bgti_cont.44963:
	j	bgti_cont.44961
bgti_else.44960:
	add	%a2, %zero, %zero
bgti_cont.44961:
	blti	%a1, 10, bgti_else.44984
	blti	%a1, 20, bgti_else.44986
	blti	%a1, 30, bgti_else.44988
	blti	%a1, 40, bgti_else.44990
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44985
	blti	%a1, 20, bgti_else.44994
	blti	%a1, 30, bgti_else.44996
	blti	%a1, 40, bgti_else.44998
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44985
	blti	%a1, 20, bgti_else.45002
	blti	%a1, 30, bgti_else.45004
	blti	%a1, 40, bgti_else.45006
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.44985
bgti_else.45006:
	addi	%a1, %a1, -30
bgti_cont.45007:
	j	bgti_cont.44985
bgti_else.45004:
	addi	%a1, %a1, -20
bgti_cont.45005:
	j	bgti_cont.44985
bgti_else.45002:
	addi	%a1, %a1, -10
bgti_cont.45003:
	j	bgti_cont.44985
bgti_else.45000:
bgti_cont.45001:
	j	bgti_cont.44985
bgti_else.44998:
	addi	%a1, %a1, -30
bgti_cont.44999:
	j	bgti_cont.44985
bgti_else.44996:
	addi	%a1, %a1, -20
bgti_cont.44997:
	j	bgti_cont.44985
bgti_else.44994:
	addi	%a1, %a1, -10
bgti_cont.44995:
	j	bgti_cont.44985
bgti_else.44992:
bgti_cont.44993:
	j	bgti_cont.44985
bgti_else.44990:
	addi	%a1, %a1, -30
bgti_cont.44991:
	j	bgti_cont.44985
bgti_else.44988:
	addi	%a1, %a1, -20
bgti_cont.44989:
	j	bgti_cont.44985
bgti_else.44986:
	addi	%a1, %a1, -10
bgti_cont.44987:
	j	bgti_cont.44985
bgti_else.44984:
bgti_cont.44985:
	blt	%zero, %a2, bgt_else.45008
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45009
bgt_else.45008:
	blti	%a2, 10, bgti_else.45010
	blti	%a2, 20, bgti_else.45012
	blti	%a2, 30, bgti_else.45014
	blti	%a2, 40, bgti_else.45016
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45018
	blti	%a0, 20, bgti_else.45020
	blti	%a0, 30, bgti_else.45022
	blti	%a0, 40, bgti_else.45024
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45026
	blti	%a0, 20, bgti_else.45028
	blti	%a0, 30, bgti_else.45030
	blti	%a0, 40, bgti_else.45032
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45011
bgti_else.45032:
	addi	%a0, %zero, 11
bgti_cont.45033:
	j	bgti_cont.45011
bgti_else.45030:
	addi	%a0, %zero, 10
bgti_cont.45031:
	j	bgti_cont.45011
bgti_else.45028:
	addi	%a0, %zero, 9
bgti_cont.45029:
	j	bgti_cont.45011
bgti_else.45026:
	addi	%a0, %zero, 8
bgti_cont.45027:
	j	bgti_cont.45011
bgti_else.45024:
	addi	%a0, %zero, 7
bgti_cont.45025:
	j	bgti_cont.45011
bgti_else.45022:
	addi	%a0, %zero, 6
bgti_cont.45023:
	j	bgti_cont.45011
bgti_else.45020:
	addi	%a0, %zero, 5
bgti_cont.45021:
	j	bgti_cont.45011
bgti_else.45018:
	addi	%a0, %zero, 4
bgti_cont.45019:
	j	bgti_cont.45011
bgti_else.45016:
	addi	%a0, %zero, 3
bgti_cont.45017:
	j	bgti_cont.45011
bgti_else.45014:
	addi	%a0, %zero, 2
bgti_cont.45015:
	j	bgti_cont.45011
bgti_else.45012:
	add	%a0, %zero, %k1
bgti_cont.45013:
	j	bgti_cont.45011
bgti_else.45010:
	add	%a0, %zero, %zero
bgti_cont.45011:
	blti	%a2, 10, bgti_else.45034
	blti	%a2, 20, bgti_else.45036
	blti	%a2, 30, bgti_else.45038
	blti	%a2, 40, bgti_else.45040
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45035
	blti	%a2, 20, bgti_else.45044
	blti	%a2, 30, bgti_else.45046
	blti	%a2, 40, bgti_else.45048
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45035
	blti	%a2, 20, bgti_else.45052
	blti	%a2, 30, bgti_else.45054
	blti	%a2, 40, bgti_else.45056
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.45035
bgti_else.45056:
	addi	%a2, %a2, -30
bgti_cont.45057:
	j	bgti_cont.45035
bgti_else.45054:
	addi	%a2, %a2, -20
bgti_cont.45055:
	j	bgti_cont.45035
bgti_else.45052:
	addi	%a2, %a2, -10
bgti_cont.45053:
	j	bgti_cont.45035
bgti_else.45050:
bgti_cont.45051:
	j	bgti_cont.45035
bgti_else.45048:
	addi	%a2, %a2, -30
bgti_cont.45049:
	j	bgti_cont.45035
bgti_else.45046:
	addi	%a2, %a2, -20
bgti_cont.45047:
	j	bgti_cont.45035
bgti_else.45044:
	addi	%a2, %a2, -10
bgti_cont.45045:
	j	bgti_cont.45035
bgti_else.45042:
bgti_cont.45043:
	j	bgti_cont.45035
bgti_else.45040:
	addi	%a2, %a2, -30
bgti_cont.45041:
	j	bgti_cont.45035
bgti_else.45038:
	addi	%a2, %a2, -20
bgti_cont.45039:
	j	bgti_cont.45035
bgti_else.45036:
	addi	%a2, %a2, -10
bgti_cont.45037:
	j	bgti_cont.45035
bgti_else.45034:
bgti_cont.45035:
	blt	%zero, %a0, bgt_else.45058
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.45059
bgt_else.45058:
	blti	%a0, 10, bgti_else.45060
	blti	%a0, 20, bgti_else.45062
	blti	%a0, 30, bgti_else.45064
	blti	%a0, 40, bgti_else.45066
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45061
	blti	%a0, 20, bgti_else.45070
	blti	%a0, 30, bgti_else.45072
	blti	%a0, 40, bgti_else.45074
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45061
	blti	%a0, 20, bgti_else.45078
	blti	%a0, 30, bgti_else.45080
	blti	%a0, 40, bgti_else.45082
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.45061
bgti_else.45082:
	addi	%a0, %a0, -30
bgti_cont.45083:
	j	bgti_cont.45061
bgti_else.45080:
	addi	%a0, %a0, -20
bgti_cont.45081:
	j	bgti_cont.45061
bgti_else.45078:
	addi	%a0, %a0, -10
bgti_cont.45079:
	j	bgti_cont.45061
bgti_else.45076:
bgti_cont.45077:
	j	bgti_cont.45061
bgti_else.45074:
	addi	%a0, %a0, -30
bgti_cont.45075:
	j	bgti_cont.45061
bgti_else.45072:
	addi	%a0, %a0, -20
bgti_cont.45073:
	j	bgti_cont.45061
bgti_else.45070:
	addi	%a0, %a0, -10
bgti_cont.45071:
	j	bgti_cont.45061
bgti_else.45068:
bgti_cont.45069:
	j	bgti_cont.45061
bgti_else.45066:
	addi	%a0, %a0, -30
bgti_cont.45067:
	j	bgti_cont.45061
bgti_else.45064:
	addi	%a0, %a0, -20
bgti_cont.45065:
	j	bgti_cont.45061
bgti_else.45062:
	addi	%a0, %a0, -10
bgti_cont.45063:
	j	bgti_cont.45061
bgti_else.45060:
bgti_cont.45061:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.45059:
bgt_cont.45009:
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
	blt	%a3, %t0, bgt_else.46365
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.46365:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.46367
	j	bgt_cont.46368
bgt_else.46367:
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
bgt_cont.46368:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.46369
	j	bgt_cont.46370
bgt_else.46369:
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
	blt	%a0, %t0, bgt_else.46371
	j	bgt_cont.46372
bgt_else.46371:
	blt	%zero, %a1, bgt_else.46373
	j	bgt_cont.46374
bgt_else.46373:
	blt	%k1, %t1, bgt_else.46375
	j	bgt_cont.46376
bgt_else.46375:
bgt_cont.46376:
	blt	%at, %t1, bgt_else.46377
	j	bgt_cont.46378
bgt_else.46377:
bgt_cont.46378:
bgt_cont.46374:
bgt_cont.46372:
	beqi	%zero, 0, bnei_else.46379
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	j	bnei_cont.46380
bnei_else.46379:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
bnei_cont.46380:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.46381
	blti	%a1, 0, bgti_else.46383
	j	bgt_cont.46382
bgti_else.46383:
	add	%a1, %zero, %zero
bgti_cont.46384:
	j	bgt_cont.46382
bgt_else.46381:
	addi	%a1, %zero, 255
bgt_cont.46382:
	addi	%a3, %zero, 10
	blti	%a1, 10, bgti_else.46385
	blti	%a1, 20, bgti_else.46387
	blti	%a1, 30, bgti_else.46389
	blti	%a1, 40, bgti_else.46391
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.46393
	blti	%a0, 20, bgti_else.46395
	blti	%a0, 30, bgti_else.46397
	blti	%a0, 40, bgti_else.46399
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46401
	blti	%a0, 20, bgti_else.46403
	blti	%a0, 30, bgti_else.46405
	blti	%a0, 40, bgti_else.46407
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46386
bgti_else.46407:
	addi	%a2, %zero, 11
bgti_cont.46408:
	j	bgti_cont.46386
bgti_else.46405:
	addi	%a2, %zero, 10
bgti_cont.46406:
	j	bgti_cont.46386
bgti_else.46403:
	addi	%a2, %zero, 9
bgti_cont.46404:
	j	bgti_cont.46386
bgti_else.46401:
	addi	%a2, %zero, 8
bgti_cont.46402:
	j	bgti_cont.46386
bgti_else.46399:
	addi	%a2, %zero, 7
bgti_cont.46400:
	j	bgti_cont.46386
bgti_else.46397:
	addi	%a2, %zero, 6
bgti_cont.46398:
	j	bgti_cont.46386
bgti_else.46395:
	addi	%a2, %zero, 5
bgti_cont.46396:
	j	bgti_cont.46386
bgti_else.46393:
	addi	%a2, %zero, 4
bgti_cont.46394:
	j	bgti_cont.46386
bgti_else.46391:
	addi	%a2, %zero, 3
bgti_cont.46392:
	j	bgti_cont.46386
bgti_else.46389:
	addi	%a2, %zero, 2
bgti_cont.46390:
	j	bgti_cont.46386
bgti_else.46387:
	add	%a2, %zero, %k1
bgti_cont.46388:
	j	bgti_cont.46386
bgti_else.46385:
	add	%a2, %zero, %zero
bgti_cont.46386:
	blti	%a1, 10, bgti_else.46409
	blti	%a1, 20, bgti_else.46411
	blti	%a1, 30, bgti_else.46413
	blti	%a1, 40, bgti_else.46415
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46410
	blti	%a1, 20, bgti_else.46419
	blti	%a1, 30, bgti_else.46421
	blti	%a1, 40, bgti_else.46423
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46410
	blti	%a1, 20, bgti_else.46427
	blti	%a1, 30, bgti_else.46429
	blti	%a1, 40, bgti_else.46431
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.46410
bgti_else.46431:
	addi	%a1, %a1, -30
bgti_cont.46432:
	j	bgti_cont.46410
bgti_else.46429:
	addi	%a1, %a1, -20
bgti_cont.46430:
	j	bgti_cont.46410
bgti_else.46427:
	addi	%a1, %a1, -10
bgti_cont.46428:
	j	bgti_cont.46410
bgti_else.46425:
bgti_cont.46426:
	j	bgti_cont.46410
bgti_else.46423:
	addi	%a1, %a1, -30
bgti_cont.46424:
	j	bgti_cont.46410
bgti_else.46421:
	addi	%a1, %a1, -20
bgti_cont.46422:
	j	bgti_cont.46410
bgti_else.46419:
	addi	%a1, %a1, -10
bgti_cont.46420:
	j	bgti_cont.46410
bgti_else.46417:
bgti_cont.46418:
	j	bgti_cont.46410
bgti_else.46415:
	addi	%a1, %a1, -30
bgti_cont.46416:
	j	bgti_cont.46410
bgti_else.46413:
	addi	%a1, %a1, -20
bgti_cont.46414:
	j	bgti_cont.46410
bgti_else.46411:
	addi	%a1, %a1, -10
bgti_cont.46412:
	j	bgti_cont.46410
bgti_else.46409:
bgti_cont.46410:
	blt	%zero, %a2, bgt_else.46433
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46434
bgt_else.46433:
	blti	%a2, 10, bgti_else.46435
	blti	%a2, 20, bgti_else.46437
	blti	%a2, 30, bgti_else.46439
	blti	%a2, 40, bgti_else.46441
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46443
	blti	%a0, 20, bgti_else.46445
	blti	%a0, 30, bgti_else.46447
	blti	%a0, 40, bgti_else.46449
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46451
	blti	%a0, 20, bgti_else.46453
	blti	%a0, 30, bgti_else.46455
	blti	%a0, 40, bgti_else.46457
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46436
bgti_else.46457:
	addi	%a0, %zero, 11
bgti_cont.46458:
	j	bgti_cont.46436
bgti_else.46455:
	addi	%a0, %zero, 10
bgti_cont.46456:
	j	bgti_cont.46436
bgti_else.46453:
	addi	%a0, %zero, 9
bgti_cont.46454:
	j	bgti_cont.46436
bgti_else.46451:
	addi	%a0, %zero, 8
bgti_cont.46452:
	j	bgti_cont.46436
bgti_else.46449:
	addi	%a0, %zero, 7
bgti_cont.46450:
	j	bgti_cont.46436
bgti_else.46447:
	addi	%a0, %zero, 6
bgti_cont.46448:
	j	bgti_cont.46436
bgti_else.46445:
	addi	%a0, %zero, 5
bgti_cont.46446:
	j	bgti_cont.46436
bgti_else.46443:
	addi	%a0, %zero, 4
bgti_cont.46444:
	j	bgti_cont.46436
bgti_else.46441:
	addi	%a0, %zero, 3
bgti_cont.46442:
	j	bgti_cont.46436
bgti_else.46439:
	addi	%a0, %zero, 2
bgti_cont.46440:
	j	bgti_cont.46436
bgti_else.46437:
	add	%a0, %zero, %k1
bgti_cont.46438:
	j	bgti_cont.46436
bgti_else.46435:
	add	%a0, %zero, %zero
bgti_cont.46436:
	blti	%a2, 10, bgti_else.46459
	blti	%a2, 20, bgti_else.46461
	blti	%a2, 30, bgti_else.46463
	blti	%a2, 40, bgti_else.46465
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46460
	blti	%a2, 20, bgti_else.46469
	blti	%a2, 30, bgti_else.46471
	blti	%a2, 40, bgti_else.46473
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46460
	blti	%a2, 20, bgti_else.46477
	blti	%a2, 30, bgti_else.46479
	blti	%a2, 40, bgti_else.46481
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46460
bgti_else.46481:
	addi	%a2, %a2, -30
bgti_cont.46482:
	j	bgti_cont.46460
bgti_else.46479:
	addi	%a2, %a2, -20
bgti_cont.46480:
	j	bgti_cont.46460
bgti_else.46477:
	addi	%a2, %a2, -10
bgti_cont.46478:
	j	bgti_cont.46460
bgti_else.46475:
bgti_cont.46476:
	j	bgti_cont.46460
bgti_else.46473:
	addi	%a2, %a2, -30
bgti_cont.46474:
	j	bgti_cont.46460
bgti_else.46471:
	addi	%a2, %a2, -20
bgti_cont.46472:
	j	bgti_cont.46460
bgti_else.46469:
	addi	%a2, %a2, -10
bgti_cont.46470:
	j	bgti_cont.46460
bgti_else.46467:
bgti_cont.46468:
	j	bgti_cont.46460
bgti_else.46465:
	addi	%a2, %a2, -30
bgti_cont.46466:
	j	bgti_cont.46460
bgti_else.46463:
	addi	%a2, %a2, -20
bgti_cont.46464:
	j	bgti_cont.46460
bgti_else.46461:
	addi	%a2, %a2, -10
bgti_cont.46462:
	j	bgti_cont.46460
bgti_else.46459:
bgti_cont.46460:
	blt	%zero, %a0, bgt_else.46483
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46484
bgt_else.46483:
	blti	%a0, 10, bgti_else.46485
	blti	%a0, 20, bgti_else.46487
	blti	%a0, 30, bgti_else.46489
	blti	%a0, 40, bgti_else.46491
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46486
	blti	%a0, 20, bgti_else.46495
	blti	%a0, 30, bgti_else.46497
	blti	%a0, 40, bgti_else.46499
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46486
	blti	%a0, 20, bgti_else.46503
	blti	%a0, 30, bgti_else.46505
	blti	%a0, 40, bgti_else.46507
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46486
bgti_else.46507:
	addi	%a0, %a0, -30
bgti_cont.46508:
	j	bgti_cont.46486
bgti_else.46505:
	addi	%a0, %a0, -20
bgti_cont.46506:
	j	bgti_cont.46486
bgti_else.46503:
	addi	%a0, %a0, -10
bgti_cont.46504:
	j	bgti_cont.46486
bgti_else.46501:
bgti_cont.46502:
	j	bgti_cont.46486
bgti_else.46499:
	addi	%a0, %a0, -30
bgti_cont.46500:
	j	bgti_cont.46486
bgti_else.46497:
	addi	%a0, %a0, -20
bgti_cont.46498:
	j	bgti_cont.46486
bgti_else.46495:
	addi	%a0, %a0, -10
bgti_cont.46496:
	j	bgti_cont.46486
bgti_else.46493:
bgti_cont.46494:
	j	bgti_cont.46486
bgti_else.46491:
	addi	%a0, %a0, -30
bgti_cont.46492:
	j	bgti_cont.46486
bgti_else.46489:
	addi	%a0, %a0, -20
bgti_cont.46490:
	j	bgti_cont.46486
bgti_else.46487:
	addi	%a0, %a0, -10
bgti_cont.46488:
	j	bgti_cont.46486
bgti_else.46485:
bgti_cont.46486:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.46484:
bgt_cont.46434:
	addi	%a1, %zero, 32
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%a2, %f0
	addi	%at, %zero, 255
	blt	%at, %a2, bgt_else.46509
	blti	%a2, 0, bgti_else.46511
	j	bgt_cont.46510
bgti_else.46511:
	add	%a2, %zero, %zero
bgti_cont.46512:
	j	bgt_cont.46510
bgt_else.46509:
	addi	%a2, %zero, 255
bgt_cont.46510:
	blti	%a2, 10, bgti_else.46513
	blti	%a2, 20, bgti_else.46515
	blti	%a2, 30, bgti_else.46517
	blti	%a2, 40, bgti_else.46519
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46521
	blti	%a0, 20, bgti_else.46523
	blti	%a0, 30, bgti_else.46525
	blti	%a0, 40, bgti_else.46527
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46529
	blti	%a0, 20, bgti_else.46531
	blti	%a0, 30, bgti_else.46533
	blti	%a0, 40, bgti_else.46535
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0
	j	bgti_cont.46514
bgti_else.46535:
	addi	%k0, %zero, 11
bgti_cont.46536:
	j	bgti_cont.46514
bgti_else.46533:
	addi	%k0, %zero, 10
bgti_cont.46534:
	j	bgti_cont.46514
bgti_else.46531:
	addi	%k0, %zero, 9
bgti_cont.46532:
	j	bgti_cont.46514
bgti_else.46529:
	addi	%k0, %zero, 8
bgti_cont.46530:
	j	bgti_cont.46514
bgti_else.46527:
	addi	%k0, %zero, 7
bgti_cont.46528:
	j	bgti_cont.46514
bgti_else.46525:
	addi	%k0, %zero, 6
bgti_cont.46526:
	j	bgti_cont.46514
bgti_else.46523:
	addi	%k0, %zero, 5
bgti_cont.46524:
	j	bgti_cont.46514
bgti_else.46521:
	addi	%k0, %zero, 4
bgti_cont.46522:
	j	bgti_cont.46514
bgti_else.46519:
	addi	%k0, %zero, 3
bgti_cont.46520:
	j	bgti_cont.46514
bgti_else.46517:
	addi	%k0, %zero, 2
bgti_cont.46518:
	j	bgti_cont.46514
bgti_else.46515:
	add	%k0, %zero, %k1
bgti_cont.46516:
	j	bgti_cont.46514
bgti_else.46513:
	add	%k0, %zero, %zero
bgti_cont.46514:
	blti	%a2, 10, bgti_else.46537
	blti	%a2, 20, bgti_else.46539
	blti	%a2, 30, bgti_else.46541
	blti	%a2, 40, bgti_else.46543
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46538
	blti	%a2, 20, bgti_else.46547
	blti	%a2, 30, bgti_else.46549
	blti	%a2, 40, bgti_else.46551
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46538
	blti	%a2, 20, bgti_else.46555
	blti	%a2, 30, bgti_else.46557
	blti	%a2, 40, bgti_else.46559
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46538
bgti_else.46559:
	addi	%a2, %a2, -30
bgti_cont.46560:
	j	bgti_cont.46538
bgti_else.46557:
	addi	%a2, %a2, -20
bgti_cont.46558:
	j	bgti_cont.46538
bgti_else.46555:
	addi	%a2, %a2, -10
bgti_cont.46556:
	j	bgti_cont.46538
bgti_else.46553:
bgti_cont.46554:
	j	bgti_cont.46538
bgti_else.46551:
	addi	%a2, %a2, -30
bgti_cont.46552:
	j	bgti_cont.46538
bgti_else.46549:
	addi	%a2, %a2, -20
bgti_cont.46550:
	j	bgti_cont.46538
bgti_else.46547:
	addi	%a2, %a2, -10
bgti_cont.46548:
	j	bgti_cont.46538
bgti_else.46545:
bgti_cont.46546:
	j	bgti_cont.46538
bgti_else.46543:
	addi	%a2, %a2, -30
bgti_cont.46544:
	j	bgti_cont.46538
bgti_else.46541:
	addi	%a2, %a2, -20
bgti_cont.46542:
	j	bgti_cont.46538
bgti_else.46539:
	addi	%a2, %a2, -10
bgti_cont.46540:
	j	bgti_cont.46538
bgti_else.46537:
bgti_cont.46538:
	blt	%zero, %k0, bgt_else.46561
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46562
bgt_else.46561:
	blti	%k0, 10, bgti_else.46563
	blti	%k0, 20, bgti_else.46565
	blti	%k0, 30, bgti_else.46567
	blti	%k0, 40, bgti_else.46569
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.46571
	blti	%a0, 20, bgti_else.46573
	blti	%a0, 30, bgti_else.46575
	blti	%a0, 40, bgti_else.46577
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46579
	blti	%a0, 20, bgti_else.46581
	blti	%a0, 30, bgti_else.46583
	blti	%a0, 40, bgti_else.46585
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46564
bgti_else.46585:
	addi	%a0, %zero, 11
bgti_cont.46586:
	j	bgti_cont.46564
bgti_else.46583:
	addi	%a0, %zero, 10
bgti_cont.46584:
	j	bgti_cont.46564
bgti_else.46581:
	addi	%a0, %zero, 9
bgti_cont.46582:
	j	bgti_cont.46564
bgti_else.46579:
	addi	%a0, %zero, 8
bgti_cont.46580:
	j	bgti_cont.46564
bgti_else.46577:
	addi	%a0, %zero, 7
bgti_cont.46578:
	j	bgti_cont.46564
bgti_else.46575:
	addi	%a0, %zero, 6
bgti_cont.46576:
	j	bgti_cont.46564
bgti_else.46573:
	addi	%a0, %zero, 5
bgti_cont.46574:
	j	bgti_cont.46564
bgti_else.46571:
	addi	%a0, %zero, 4
bgti_cont.46572:
	j	bgti_cont.46564
bgti_else.46569:
	addi	%a0, %zero, 3
bgti_cont.46570:
	j	bgti_cont.46564
bgti_else.46567:
	addi	%a0, %zero, 2
bgti_cont.46568:
	j	bgti_cont.46564
bgti_else.46565:
	add	%a0, %zero, %k1
bgti_cont.46566:
	j	bgti_cont.46564
bgti_else.46563:
	add	%a0, %zero, %zero
bgti_cont.46564:
	blti	%k0, 10, bgti_else.46587
	blti	%k0, 20, bgti_else.46589
	blti	%k0, 30, bgti_else.46591
	blti	%k0, 40, bgti_else.46593
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.46588
	blti	%k0, 20, bgti_else.46597
	blti	%k0, 30, bgti_else.46599
	blti	%k0, 40, bgti_else.46601
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.46588
	blti	%k0, 20, bgti_else.46605
	blti	%k0, 30, bgti_else.46607
	blti	%k0, 40, bgti_else.46609
	addi	%v0, %k0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0
	j	bgti_cont.46588
bgti_else.46609:
	addi	%k0, %k0, -30
bgti_cont.46610:
	j	bgti_cont.46588
bgti_else.46607:
	addi	%k0, %k0, -20
bgti_cont.46608:
	j	bgti_cont.46588
bgti_else.46605:
	addi	%k0, %k0, -10
bgti_cont.46606:
	j	bgti_cont.46588
bgti_else.46603:
bgti_cont.46604:
	j	bgti_cont.46588
bgti_else.46601:
	addi	%k0, %k0, -30
bgti_cont.46602:
	j	bgti_cont.46588
bgti_else.46599:
	addi	%k0, %k0, -20
bgti_cont.46600:
	j	bgti_cont.46588
bgti_else.46597:
	addi	%k0, %k0, -10
bgti_cont.46598:
	j	bgti_cont.46588
bgti_else.46595:
bgti_cont.46596:
	j	bgti_cont.46588
bgti_else.46593:
	addi	%k0, %k0, -30
bgti_cont.46594:
	j	bgti_cont.46588
bgti_else.46591:
	addi	%k0, %k0, -20
bgti_cont.46592:
	j	bgti_cont.46588
bgti_else.46589:
	addi	%k0, %k0, -10
bgti_cont.46590:
	j	bgti_cont.46588
bgti_else.46587:
bgti_cont.46588:
	blt	%zero, %a0, bgt_else.46611
	addi	%v0, %k0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46612
bgt_else.46611:
	blti	%a0, 10, bgti_else.46613
	blti	%a0, 20, bgti_else.46615
	blti	%a0, 30, bgti_else.46617
	blti	%a0, 40, bgti_else.46619
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46614
	blti	%a0, 20, bgti_else.46623
	blti	%a0, 30, bgti_else.46625
	blti	%a0, 40, bgti_else.46627
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46614
	blti	%a0, 20, bgti_else.46631
	blti	%a0, 30, bgti_else.46633
	blti	%a0, 40, bgti_else.46635
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46614
bgti_else.46635:
	addi	%a0, %a0, -30
bgti_cont.46636:
	j	bgti_cont.46614
bgti_else.46633:
	addi	%a0, %a0, -20
bgti_cont.46634:
	j	bgti_cont.46614
bgti_else.46631:
	addi	%a0, %a0, -10
bgti_cont.46632:
	j	bgti_cont.46614
bgti_else.46629:
bgti_cont.46630:
	j	bgti_cont.46614
bgti_else.46627:
	addi	%a0, %a0, -30
bgti_cont.46628:
	j	bgti_cont.46614
bgti_else.46625:
	addi	%a0, %a0, -20
bgti_cont.46626:
	j	bgti_cont.46614
bgti_else.46623:
	addi	%a0, %a0, -10
bgti_cont.46624:
	j	bgti_cont.46614
bgti_else.46621:
bgti_cont.46622:
	j	bgti_cont.46614
bgti_else.46619:
	addi	%a0, %a0, -30
bgti_cont.46620:
	j	bgti_cont.46614
bgti_else.46617:
	addi	%a0, %a0, -20
bgti_cont.46618:
	j	bgti_cont.46614
bgti_else.46615:
	addi	%a0, %a0, -10
bgti_cont.46616:
	j	bgti_cont.46614
bgti_else.46613:
bgti_cont.46614:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %k0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.46612:
bgt_cont.46562:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.46637
	blti	%a1, 0, bgti_else.46639
	j	bgt_cont.46638
bgti_else.46639:
	add	%a1, %zero, %zero
bgti_cont.46640:
	j	bgt_cont.46638
bgt_else.46637:
	addi	%a1, %zero, 255
bgt_cont.46638:
	blti	%a1, 10, bgti_else.46641
	blti	%a1, 20, bgti_else.46643
	blti	%a1, 30, bgti_else.46645
	blti	%a1, 40, bgti_else.46647
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.46649
	blti	%a0, 20, bgti_else.46651
	blti	%a0, 30, bgti_else.46653
	blti	%a0, 40, bgti_else.46655
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46657
	blti	%a0, 20, bgti_else.46659
	blti	%a0, 30, bgti_else.46661
	blti	%a0, 40, bgti_else.46663
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46642
bgti_else.46663:
	addi	%a2, %zero, 11
bgti_cont.46664:
	j	bgti_cont.46642
bgti_else.46661:
	addi	%a2, %zero, 10
bgti_cont.46662:
	j	bgti_cont.46642
bgti_else.46659:
	addi	%a2, %zero, 9
bgti_cont.46660:
	j	bgti_cont.46642
bgti_else.46657:
	addi	%a2, %zero, 8
bgti_cont.46658:
	j	bgti_cont.46642
bgti_else.46655:
	addi	%a2, %zero, 7
bgti_cont.46656:
	j	bgti_cont.46642
bgti_else.46653:
	addi	%a2, %zero, 6
bgti_cont.46654:
	j	bgti_cont.46642
bgti_else.46651:
	addi	%a2, %zero, 5
bgti_cont.46652:
	j	bgti_cont.46642
bgti_else.46649:
	addi	%a2, %zero, 4
bgti_cont.46650:
	j	bgti_cont.46642
bgti_else.46647:
	addi	%a2, %zero, 3
bgti_cont.46648:
	j	bgti_cont.46642
bgti_else.46645:
	addi	%a2, %zero, 2
bgti_cont.46646:
	j	bgti_cont.46642
bgti_else.46643:
	add	%a2, %zero, %k1
bgti_cont.46644:
	j	bgti_cont.46642
bgti_else.46641:
	add	%a2, %zero, %zero
bgti_cont.46642:
	blti	%a1, 10, bgti_else.46665
	blti	%a1, 20, bgti_else.46667
	blti	%a1, 30, bgti_else.46669
	blti	%a1, 40, bgti_else.46671
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46666
	blti	%a1, 20, bgti_else.46675
	blti	%a1, 30, bgti_else.46677
	blti	%a1, 40, bgti_else.46679
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.46666
	blti	%a1, 20, bgti_else.46683
	blti	%a1, 30, bgti_else.46685
	blti	%a1, 40, bgti_else.46687
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.46666
bgti_else.46687:
	addi	%a1, %a1, -30
bgti_cont.46688:
	j	bgti_cont.46666
bgti_else.46685:
	addi	%a1, %a1, -20
bgti_cont.46686:
	j	bgti_cont.46666
bgti_else.46683:
	addi	%a1, %a1, -10
bgti_cont.46684:
	j	bgti_cont.46666
bgti_else.46681:
bgti_cont.46682:
	j	bgti_cont.46666
bgti_else.46679:
	addi	%a1, %a1, -30
bgti_cont.46680:
	j	bgti_cont.46666
bgti_else.46677:
	addi	%a1, %a1, -20
bgti_cont.46678:
	j	bgti_cont.46666
bgti_else.46675:
	addi	%a1, %a1, -10
bgti_cont.46676:
	j	bgti_cont.46666
bgti_else.46673:
bgti_cont.46674:
	j	bgti_cont.46666
bgti_else.46671:
	addi	%a1, %a1, -30
bgti_cont.46672:
	j	bgti_cont.46666
bgti_else.46669:
	addi	%a1, %a1, -20
bgti_cont.46670:
	j	bgti_cont.46666
bgti_else.46667:
	addi	%a1, %a1, -10
bgti_cont.46668:
	j	bgti_cont.46666
bgti_else.46665:
bgti_cont.46666:
	blt	%zero, %a2, bgt_else.46689
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46690
bgt_else.46689:
	blti	%a2, 10, bgti_else.46691
	blti	%a2, 20, bgti_else.46693
	blti	%a2, 30, bgti_else.46695
	blti	%a2, 40, bgti_else.46697
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.46699
	blti	%a0, 20, bgti_else.46701
	blti	%a0, 30, bgti_else.46703
	blti	%a0, 40, bgti_else.46705
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.46707
	blti	%a0, 20, bgti_else.46709
	blti	%a0, 30, bgti_else.46711
	blti	%a0, 40, bgti_else.46713
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46692
bgti_else.46713:
	addi	%a0, %zero, 11
bgti_cont.46714:
	j	bgti_cont.46692
bgti_else.46711:
	addi	%a0, %zero, 10
bgti_cont.46712:
	j	bgti_cont.46692
bgti_else.46709:
	addi	%a0, %zero, 9
bgti_cont.46710:
	j	bgti_cont.46692
bgti_else.46707:
	addi	%a0, %zero, 8
bgti_cont.46708:
	j	bgti_cont.46692
bgti_else.46705:
	addi	%a0, %zero, 7
bgti_cont.46706:
	j	bgti_cont.46692
bgti_else.46703:
	addi	%a0, %zero, 6
bgti_cont.46704:
	j	bgti_cont.46692
bgti_else.46701:
	addi	%a0, %zero, 5
bgti_cont.46702:
	j	bgti_cont.46692
bgti_else.46699:
	addi	%a0, %zero, 4
bgti_cont.46700:
	j	bgti_cont.46692
bgti_else.46697:
	addi	%a0, %zero, 3
bgti_cont.46698:
	j	bgti_cont.46692
bgti_else.46695:
	addi	%a0, %zero, 2
bgti_cont.46696:
	j	bgti_cont.46692
bgti_else.46693:
	add	%a0, %zero, %k1
bgti_cont.46694:
	j	bgti_cont.46692
bgti_else.46691:
	add	%a0, %zero, %zero
bgti_cont.46692:
	blti	%a2, 10, bgti_else.46715
	blti	%a2, 20, bgti_else.46717
	blti	%a2, 30, bgti_else.46719
	blti	%a2, 40, bgti_else.46721
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46716
	blti	%a2, 20, bgti_else.46725
	blti	%a2, 30, bgti_else.46727
	blti	%a2, 40, bgti_else.46729
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.46716
	blti	%a2, 20, bgti_else.46733
	blti	%a2, 30, bgti_else.46735
	blti	%a2, 40, bgti_else.46737
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.46716
bgti_else.46737:
	addi	%a2, %a2, -30
bgti_cont.46738:
	j	bgti_cont.46716
bgti_else.46735:
	addi	%a2, %a2, -20
bgti_cont.46736:
	j	bgti_cont.46716
bgti_else.46733:
	addi	%a2, %a2, -10
bgti_cont.46734:
	j	bgti_cont.46716
bgti_else.46731:
bgti_cont.46732:
	j	bgti_cont.46716
bgti_else.46729:
	addi	%a2, %a2, -30
bgti_cont.46730:
	j	bgti_cont.46716
bgti_else.46727:
	addi	%a2, %a2, -20
bgti_cont.46728:
	j	bgti_cont.46716
bgti_else.46725:
	addi	%a2, %a2, -10
bgti_cont.46726:
	j	bgti_cont.46716
bgti_else.46723:
bgti_cont.46724:
	j	bgti_cont.46716
bgti_else.46721:
	addi	%a2, %a2, -30
bgti_cont.46722:
	j	bgti_cont.46716
bgti_else.46719:
	addi	%a2, %a2, -20
bgti_cont.46720:
	j	bgti_cont.46716
bgti_else.46717:
	addi	%a2, %a2, -10
bgti_cont.46718:
	j	bgti_cont.46716
bgti_else.46715:
bgti_cont.46716:
	blt	%zero, %a0, bgt_else.46739
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.46740
bgt_else.46739:
	blti	%a0, 10, bgti_else.46741
	blti	%a0, 20, bgti_else.46743
	blti	%a0, 30, bgti_else.46745
	blti	%a0, 40, bgti_else.46747
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46742
	blti	%a0, 20, bgti_else.46751
	blti	%a0, 30, bgti_else.46753
	blti	%a0, 40, bgti_else.46755
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.46742
	blti	%a0, 20, bgti_else.46759
	blti	%a0, 30, bgti_else.46761
	blti	%a0, 40, bgti_else.46763
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.46742
bgti_else.46763:
	addi	%a0, %a0, -30
bgti_cont.46764:
	j	bgti_cont.46742
bgti_else.46761:
	addi	%a0, %a0, -20
bgti_cont.46762:
	j	bgti_cont.46742
bgti_else.46759:
	addi	%a0, %a0, -10
bgti_cont.46760:
	j	bgti_cont.46742
bgti_else.46757:
bgti_cont.46758:
	j	bgti_cont.46742
bgti_else.46755:
	addi	%a0, %a0, -30
bgti_cont.46756:
	j	bgti_cont.46742
bgti_else.46753:
	addi	%a0, %a0, -20
bgti_cont.46754:
	j	bgti_cont.46742
bgti_else.46751:
	addi	%a0, %a0, -10
bgti_cont.46752:
	j	bgti_cont.46742
bgti_else.46749:
bgti_cont.46750:
	j	bgti_cont.46742
bgti_else.46747:
	addi	%a0, %a0, -30
bgti_cont.46748:
	j	bgti_cont.46742
bgti_else.46745:
	addi	%a0, %a0, -20
bgti_cont.46746:
	j	bgti_cont.46742
bgti_else.46743:
	addi	%a0, %a0, -10
bgti_cont.46744:
	j	bgti_cont.46742
bgti_else.46741:
bgti_cont.46742:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.46740:
bgt_cont.46690:
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
bgt_cont.46370:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.46765
	addi	%t3, %t3, -5
	j	bgti_cont.46766
bgti_else.46765:
bgti_cont.46766:
	blt	%t2, %t0, bgt_else.46767
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.46767:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.46769
	j	bgt_cont.46770
bgt_else.46769:
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
bgt_cont.46770:
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
	blti	%a2, 5, bgti_else.46771
	addi	%a2, %a2, -5
	j	bgti_cont.46772
bgti_else.46771:
bgti_cont.46772:
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
	blti	%a2, 0, bgti_else.46803
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
	blti	%s4, 0, bgti_else.46804
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
	blti	%s4, 0, bgti_else.46805
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
	blti	%s4, 0, bgti_else.46806
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
bgti_else.46806:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.46805:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.46804:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.46803:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3083:
	fmov	%f17, %f2
	add	%a1, %zero, %ra
	blti	%v0, 5, bgti_else.47237
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1
	fadd	%f16, %f17, %f16
	fadd	%f16, %f16, %f30
	fsqrt	%f16, %f16
	fdiv	%f19, %f0, %f16
	fdiv	%f17, %f1, %f16
	fdiv	%f18, %f30, %f16
	lw	%a3, 179(%v1)
	add	%at, %a3, %a0
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fsw	%f19, 0(%a2)
	fsw	%f17, 1(%a2)
	fsw	%f18, 2(%a2)
	addi	%a2, %a0, 40
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f0, %f17
	fsw	%f19, 0(%a2)
	fsw	%f18, 1(%a2)
	fsw	%f0, 2(%a2)
	addi	%a2, %a0, 80
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f1, %f19
	fneg	%f0, %f17
	fsw	%f18, 0(%a2)
	fsw	%f1, 1(%a2)
	fsw	%f0, 2(%a2)
	addi	%a2, %a0, 1
	add	%at, %a3, %a2
	lw	%a2, 0(%at)
	lw	%a2, 0(%a2)
	fneg	%f16, %f19
	fneg	%f1, %f17
	fneg	%f0, %f18
	fsw	%f16, 0(%a2)
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
	fsw	%f17, 2(%a2)
	addi	%a0, %a0, 81
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f18
	fsw	%f0, 0(%a0)
	fsw	%f19, 1(%a0)
	add	%ra, %zero, %a1
	fsw	%f17, 2(%a0)
	jr	%ra
bgti_else.47237:
	fmul	%f0, %f1, %f1
	flw	%f20, 441(%zero)
	fadd	%f0, %f0, %f20
	fsqrt	%f19, %f0
	fdiv	%f2, %f30, %f19
	fblt	%f2, %fzero, fbgt_else.47239
	add	%a2, %zero, %k1
	j	fbgt_cont.47240
fbgt_else.47239:
	add	%a2, %zero, %zero
fbgt_cont.47240:
	fabs	%f18, %f2
	flw	%f21, 462(%zero)
	fblt	%f18, %f21, fbgt_else.47241
	flw	%f0, 455(%zero)
	fblt	%f18, %f0, fbgt_else.47243
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
	j	fbgt_cont.47244
fbgt_else.47243:
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
fbgt_cont.47244:
	beqi	%a2, 0, bnei_else.47245
	j	fbgt_cont.47242
bnei_else.47245:
	fneg	%f0, %f0
bnei_cont.47246:
	j	fbgt_cont.47242
fbgt_else.47241:
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
fbgt_cont.47242:
	fmul	%f23, %f0, %f17
	flw	%f22, 494(%zero)
	fblt	%f23, %fzero, fbgt_else.47247
	add	%a2, %zero, %k1
	j	fbgt_cont.47248
fbgt_else.47247:
	add	%a2, %zero, %zero
fbgt_cont.47248:
	fabs	%f18, %f23
	flw	%f2, 493(%zero)
	fblt	%f18, %f2, fbgt_else.47249
	flw	%f0, 492(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 491(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 490(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 489(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 488(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 487(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 486(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 485(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 484(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f0, 483(%zero)
	fblt	%f18, %f0, fbgt_cont.47250
	flw	%f1, 482(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47250
fbgt_else.47269:
fbgt_cont.47270:
	j	fbgt_cont.47250
fbgt_else.47267:
fbgt_cont.47268:
	j	fbgt_cont.47250
fbgt_else.47265:
fbgt_cont.47266:
	j	fbgt_cont.47250
fbgt_else.47263:
fbgt_cont.47264:
	j	fbgt_cont.47250
fbgt_else.47261:
fbgt_cont.47262:
	j	fbgt_cont.47250
fbgt_else.47259:
fbgt_cont.47260:
	j	fbgt_cont.47250
fbgt_else.47257:
fbgt_cont.47258:
	j	fbgt_cont.47250
fbgt_else.47255:
fbgt_cont.47256:
	j	fbgt_cont.47250
fbgt_else.47253:
fbgt_cont.47254:
	j	fbgt_cont.47250
fbgt_else.47251:
fbgt_cont.47252:
	j	fbgt_cont.47250
fbgt_else.47249:
	fmov	%f0, %f2
fbgt_cont.47250:
	fblt	%f18, %f2, fbgt_else.47271
	fblt	%f18, %f0, fbgt_else.47273
	fsub	%f18, %f18, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f0, fbgt_else.47277
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f1, fbgt_else.47281
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47272
fbgt_else.47281:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47282:
	j	fbgt_cont.47272
fbgt_else.47279:
fbgt_cont.47280:
	j	fbgt_cont.47272
fbgt_else.47277:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f1, fbgt_else.47285
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47272
fbgt_else.47285:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47286:
	j	fbgt_cont.47272
fbgt_else.47283:
fbgt_cont.47284:
fbgt_cont.47278:
	j	fbgt_cont.47272
fbgt_else.47275:
fbgt_cont.47276:
	j	fbgt_cont.47272
fbgt_else.47273:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f0, fbgt_else.47289
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f1, fbgt_else.47293
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47272
fbgt_else.47293:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47294:
	j	fbgt_cont.47272
fbgt_else.47291:
fbgt_cont.47292:
	j	fbgt_cont.47272
fbgt_else.47289:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47272
	fblt	%f18, %f1, fbgt_else.47297
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47272
fbgt_else.47297:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47298:
	j	fbgt_cont.47272
fbgt_else.47295:
fbgt_cont.47296:
fbgt_cont.47290:
	j	fbgt_cont.47272
fbgt_else.47287:
fbgt_cont.47288:
fbgt_cont.47274:
	j	fbgt_cont.47272
fbgt_else.47271:
fbgt_cont.47272:
	fblt	%f18, %f22, fbgt_else.47299
	beqi	%a2, 0, bnei_else.47301
	add	%a2, %zero, %zero
	j	fbgt_cont.47300
bnei_else.47301:
	add	%a2, %zero, %k1
bnei_cont.47302:
	j	fbgt_cont.47300
fbgt_else.47299:
fbgt_cont.47300:
	fblt	%f18, %f22, fbgt_else.47303
	fsub	%f18, %f18, %f22
	j	fbgt_cont.47304
fbgt_else.47303:
fbgt_cont.47304:
	flw	%f24, 479(%zero)
	fblt	%f18, %f24, fbgt_else.47305
	fsub	%f18, %f22, %f18
	j	fbgt_cont.47306
fbgt_else.47305:
fbgt_cont.47306:
	flw	%f25, 478(%zero)
	fblt	%f25, %f18, fbgt_else.47307
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
	j	fbgt_cont.47308
fbgt_else.47307:
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
fbgt_cont.47308:
	beqi	%a2, 0, bnei_else.47309
	j	bnei_cont.47310
bnei_else.47309:
	fneg	%f18, %f18
bnei_cont.47310:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.47311
	flw	%f0, 492(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 491(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 490(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 489(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 488(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 487(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 486(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 485(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 484(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f0, 483(%zero)
	fblt	%f23, %f0, fbgt_cont.47312
	flw	%f1, 482(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47312
fbgt_else.47331:
fbgt_cont.47332:
	j	fbgt_cont.47312
fbgt_else.47329:
fbgt_cont.47330:
	j	fbgt_cont.47312
fbgt_else.47327:
fbgt_cont.47328:
	j	fbgt_cont.47312
fbgt_else.47325:
fbgt_cont.47326:
	j	fbgt_cont.47312
fbgt_else.47323:
fbgt_cont.47324:
	j	fbgt_cont.47312
fbgt_else.47321:
fbgt_cont.47322:
	j	fbgt_cont.47312
fbgt_else.47319:
fbgt_cont.47320:
	j	fbgt_cont.47312
fbgt_else.47317:
fbgt_cont.47318:
	j	fbgt_cont.47312
fbgt_else.47315:
fbgt_cont.47316:
	j	fbgt_cont.47312
fbgt_else.47313:
fbgt_cont.47314:
	j	fbgt_cont.47312
fbgt_else.47311:
	fmov	%f0, %f2
fbgt_cont.47312:
	fblt	%f23, %f2, fbgt_else.47333
	fblt	%f23, %f0, fbgt_else.47335
	fsub	%f23, %f23, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f0, fbgt_else.47339
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f1, fbgt_else.47343
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47334
fbgt_else.47343:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47344:
	j	fbgt_cont.47334
fbgt_else.47341:
fbgt_cont.47342:
	j	fbgt_cont.47334
fbgt_else.47339:
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f1, fbgt_else.47347
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47334
fbgt_else.47347:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47348:
	j	fbgt_cont.47334
fbgt_else.47345:
fbgt_cont.47346:
fbgt_cont.47340:
	j	fbgt_cont.47334
fbgt_else.47337:
fbgt_cont.47338:
	j	fbgt_cont.47334
fbgt_else.47335:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f0, fbgt_else.47351
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f1, fbgt_else.47355
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47334
fbgt_else.47355:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47356:
	j	fbgt_cont.47334
fbgt_else.47353:
fbgt_cont.47354:
	j	fbgt_cont.47334
fbgt_else.47351:
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.47334
	fblt	%f23, %f1, fbgt_else.47359
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.47334
fbgt_else.47359:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.47360:
	j	fbgt_cont.47334
fbgt_else.47357:
fbgt_cont.47358:
fbgt_cont.47352:
	j	fbgt_cont.47334
fbgt_else.47349:
fbgt_cont.47350:
fbgt_cont.47336:
	j	fbgt_cont.47334
fbgt_else.47333:
fbgt_cont.47334:
	fblt	%f23, %f22, fbgt_else.47361
	add	%a2, %zero, %zero
	j	fbgt_cont.47362
fbgt_else.47361:
	add	%a2, %zero, %k1
fbgt_cont.47362:
	fblt	%f23, %f22, fbgt_else.47363
	fsub	%f23, %f23, %f22
	j	fbgt_cont.47364
fbgt_else.47363:
fbgt_cont.47364:
	fblt	%f23, %f24, fbgt_else.47365
	beqi	%a2, 0, bnei_else.47367
	add	%a2, %zero, %zero
	j	fbgt_cont.47366
bnei_else.47367:
	add	%a2, %zero, %k1
bnei_cont.47368:
	j	fbgt_cont.47366
fbgt_else.47365:
fbgt_cont.47366:
	fblt	%f23, %f24, fbgt_else.47369
	fsub	%f23, %f22, %f23
	j	fbgt_cont.47370
fbgt_else.47369:
fbgt_cont.47370:
	fblt	%f25, %f23, fbgt_else.47371
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
	j	fbgt_cont.47372
fbgt_else.47371:
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
fbgt_cont.47372:
	beqi	%a2, 0, bnei_else.47373
	j	bnei_cont.47374
bnei_else.47373:
	fneg	%f0, %f0
bnei_cont.47374:
	fdiv	%f0, %f18, %f0
	fmul	%f18, %f0, %f19
	addi	%v0, %v0, 1
	fmul	%f0, %f18, %f18
	fadd	%f0, %f0, %f20
	fsqrt	%f20, %f0
	fdiv	%f16, %f30, %f20
	fblt	%f16, %fzero, fbgt_else.47375
	add	%a2, %zero, %k1
	j	fbgt_cont.47376
fbgt_else.47375:
	add	%a2, %zero, %zero
fbgt_cont.47376:
	fabs	%f19, %f16
	fblt	%f19, %f21, fbgt_else.47377
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.47379
	fdiv	%f21, %f30, %f19
	fmul	%f23, %f21, %f21
	fmul	%f19, %f23, %f23
	fmul	%f16, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fsub	%f1, %f21, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsub	%f0, %f24, %f0
	j	fbgt_cont.47380
fbgt_else.47379:
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30
	fdiv	%f21, %f1, %f0
	fmul	%f23, %f21, %f21
	fmul	%f19, %f23, %f23
	fmul	%f16, %f19, %f19
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fsub	%f1, %f21, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fadd	%f0, %f25, %f0
fbgt_cont.47380:
	beqi	%a2, 0, bnei_else.47381
	j	fbgt_cont.47378
bnei_else.47381:
	fneg	%f0, %f0
bnei_cont.47382:
	j	fbgt_cont.47378
fbgt_else.47377:
	fmul	%f23, %f16, %f16
	fmul	%f21, %f23, %f23
	fmul	%f19, %f21, %f21
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fsub	%f1, %f16, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f21
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
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
fbgt_cont.47378:
	fmul	%f21, %f0, %f3
	fblt	%f21, %fzero, fbgt_else.47383
	add	%a2, %zero, %k1
	j	fbgt_cont.47384
fbgt_else.47383:
	add	%a2, %zero, %zero
fbgt_cont.47384:
	fabs	%f19, %f21
	fblt	%f19, %f2, fbgt_else.47385
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f0, 483(%zero)
	fblt	%f19, %f0, fbgt_cont.47386
	flw	%f1, 482(%zero)
	fmov	%f0, %f19
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47386
fbgt_else.47405:
fbgt_cont.47406:
	j	fbgt_cont.47386
fbgt_else.47403:
fbgt_cont.47404:
	j	fbgt_cont.47386
fbgt_else.47401:
fbgt_cont.47402:
	j	fbgt_cont.47386
fbgt_else.47399:
fbgt_cont.47400:
	j	fbgt_cont.47386
fbgt_else.47397:
fbgt_cont.47398:
	j	fbgt_cont.47386
fbgt_else.47395:
fbgt_cont.47396:
	j	fbgt_cont.47386
fbgt_else.47393:
fbgt_cont.47394:
	j	fbgt_cont.47386
fbgt_else.47391:
fbgt_cont.47392:
	j	fbgt_cont.47386
fbgt_else.47389:
fbgt_cont.47390:
	j	fbgt_cont.47386
fbgt_else.47387:
fbgt_cont.47388:
	j	fbgt_cont.47386
fbgt_else.47385:
	fmov	%f0, %f2
fbgt_cont.47386:
	fblt	%f19, %f2, fbgt_else.47407
	fblt	%f19, %f0, fbgt_else.47409
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f0, fbgt_else.47413
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f1, fbgt_else.47417
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47408
fbgt_else.47417:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47418:
	j	fbgt_cont.47408
fbgt_else.47415:
fbgt_cont.47416:
	j	fbgt_cont.47408
fbgt_else.47413:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f1, fbgt_else.47421
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47408
fbgt_else.47421:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47422:
	j	fbgt_cont.47408
fbgt_else.47419:
fbgt_cont.47420:
fbgt_cont.47414:
	j	fbgt_cont.47408
fbgt_else.47411:
fbgt_cont.47412:
	j	fbgt_cont.47408
fbgt_else.47409:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f0, fbgt_else.47425
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f1, fbgt_else.47429
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47408
fbgt_else.47429:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47430:
	j	fbgt_cont.47408
fbgt_else.47427:
fbgt_cont.47428:
	j	fbgt_cont.47408
fbgt_else.47425:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.47408
	fblt	%f19, %f1, fbgt_else.47433
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.47408
fbgt_else.47433:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.47434:
	j	fbgt_cont.47408
fbgt_else.47431:
fbgt_cont.47432:
fbgt_cont.47426:
	j	fbgt_cont.47408
fbgt_else.47423:
fbgt_cont.47424:
fbgt_cont.47410:
	j	fbgt_cont.47408
fbgt_else.47407:
fbgt_cont.47408:
	fblt	%f19, %f22, fbgt_else.47435
	beqi	%a2, 0, bnei_else.47437
	add	%a2, %zero, %zero
	j	fbgt_cont.47436
bnei_else.47437:
	add	%a2, %zero, %k1
bnei_cont.47438:
	j	fbgt_cont.47436
fbgt_else.47435:
fbgt_cont.47436:
	fblt	%f19, %f22, fbgt_else.47439
	fsub	%f19, %f19, %f22
	j	fbgt_cont.47440
fbgt_else.47439:
fbgt_cont.47440:
	fblt	%f19, %f24, fbgt_else.47441
	fsub	%f19, %f22, %f19
	j	fbgt_cont.47442
fbgt_else.47441:
fbgt_cont.47442:
	fblt	%f25, %f19, fbgt_else.47443
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
	j	fbgt_cont.47444
fbgt_else.47443:
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
fbgt_cont.47444:
	beqi	%a2, 0, bnei_else.47445
	j	bnei_cont.47446
bnei_else.47445:
	fneg	%f19, %f19
bnei_cont.47446:
	fabs	%f21, %f21
	fblt	%f21, %f2, fbgt_else.47447
	flw	%f0, 492(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 491(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 490(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 489(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 488(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 487(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 486(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 485(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 484(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f0, 483(%zero)
	fblt	%f21, %f0, fbgt_cont.47448
	flw	%f1, 482(%zero)
	fmov	%f0, %f21
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47448
fbgt_else.47467:
fbgt_cont.47468:
	j	fbgt_cont.47448
fbgt_else.47465:
fbgt_cont.47466:
	j	fbgt_cont.47448
fbgt_else.47463:
fbgt_cont.47464:
	j	fbgt_cont.47448
fbgt_else.47461:
fbgt_cont.47462:
	j	fbgt_cont.47448
fbgt_else.47459:
fbgt_cont.47460:
	j	fbgt_cont.47448
fbgt_else.47457:
fbgt_cont.47458:
	j	fbgt_cont.47448
fbgt_else.47455:
fbgt_cont.47456:
	j	fbgt_cont.47448
fbgt_else.47453:
fbgt_cont.47454:
	j	fbgt_cont.47448
fbgt_else.47451:
fbgt_cont.47452:
	j	fbgt_cont.47448
fbgt_else.47449:
fbgt_cont.47450:
	j	fbgt_cont.47448
fbgt_else.47447:
	fmov	%f0, %f2
fbgt_cont.47448:
	fblt	%f21, %f2, fbgt_else.47469
	fblt	%f21, %f0, fbgt_else.47471
	fsub	%f21, %f21, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f0, fbgt_else.47475
	fsub	%f21, %f21, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f1, fbgt_else.47479
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
	j	fbgt_cont.47470
fbgt_else.47479:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f21
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
fbgt_cont.47480:
	j	fbgt_cont.47470
fbgt_else.47477:
fbgt_cont.47478:
	j	fbgt_cont.47470
fbgt_else.47475:
	fdiv	%f1, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f1, fbgt_else.47483
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
	j	fbgt_cont.47470
fbgt_else.47483:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f21
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
fbgt_cont.47484:
	j	fbgt_cont.47470
fbgt_else.47481:
fbgt_cont.47482:
fbgt_cont.47476:
	j	fbgt_cont.47470
fbgt_else.47473:
fbgt_cont.47474:
	j	fbgt_cont.47470
fbgt_else.47471:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f0, fbgt_else.47487
	fsub	%f21, %f21, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f1, fbgt_else.47491
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
	j	fbgt_cont.47470
fbgt_else.47491:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f21
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
fbgt_cont.47492:
	j	fbgt_cont.47470
fbgt_else.47489:
fbgt_cont.47490:
	j	fbgt_cont.47470
fbgt_else.47487:
	fdiv	%f1, %f0, %f16
	fblt	%f21, %f2, fbgt_cont.47470
	fblt	%f21, %f1, fbgt_else.47495
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
	j	fbgt_cont.47470
fbgt_else.47495:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f21
	jal	reduction_2pi_sub2.2629
	fmov	%f21, %f0
fbgt_cont.47496:
	j	fbgt_cont.47470
fbgt_else.47493:
fbgt_cont.47494:
fbgt_cont.47488:
	j	fbgt_cont.47470
fbgt_else.47485:
fbgt_cont.47486:
fbgt_cont.47472:
	j	fbgt_cont.47470
fbgt_else.47469:
fbgt_cont.47470:
	fblt	%f21, %f22, fbgt_else.47497
	add	%a2, %zero, %zero
	j	fbgt_cont.47498
fbgt_else.47497:
	add	%a2, %zero, %k1
fbgt_cont.47498:
	fblt	%f21, %f22, fbgt_else.47499
	fsub	%f21, %f21, %f22
	j	fbgt_cont.47500
fbgt_else.47499:
fbgt_cont.47500:
	fblt	%f21, %f24, fbgt_else.47501
	beqi	%a2, 0, bnei_else.47503
	add	%a2, %zero, %zero
	j	fbgt_cont.47502
bnei_else.47503:
	add	%a2, %zero, %k1
bnei_cont.47504:
	j	fbgt_cont.47502
fbgt_else.47501:
fbgt_cont.47502:
	fblt	%f21, %f24, fbgt_else.47505
	fsub	%f21, %f22, %f21
	j	fbgt_cont.47506
fbgt_else.47505:
fbgt_cont.47506:
	fblt	%f25, %f21, fbgt_else.47507
	fmul	%f2, %f21, %f21
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
	j	fbgt_cont.47508
fbgt_else.47507:
	fsub	%f21, %f24, %f21
	fmul	%f2, %f21, %f21
	fmul	%f16, %f2, %f2
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fsub	%f1, %f21, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.47508:
	beqi	%a2, 0, bnei_else.47509
	j	bnei_cont.47510
bnei_else.47509:
	fneg	%f0, %f0
bnei_cont.47510:
	fdiv	%f0, %f19, %f0
	fmul	%f1, %f0, %f20
	add	%ra, %zero, %a1
	fmov	%f2, %f17
	fmov	%f0, %f18
	j	calc_dirvec.3083
calc_dirvecs.3091:
	fmov	%f3, %f0
	add	%k0, %zero, %v0
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	blti	%k0, 0, bgti_else.47543
	itof	%f0, %k0
	flw	%f28, 460(%zero)
	fmul	%f0, %f0, %f28
	flw	%f27, 438(%zero)
	fsub	%f2, %f0, %f27
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f28
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
	blti	%v1, 5, bgti_else.47544
	addi	%v1, %v1, -5
	j	bgti_cont.47545
bgti_else.47544:
bgti_cont.47545:
	blti	%k0, 0, bgti_else.47546
	itof	%f0, %k0
	fmul	%f0, %f0, %f28
	fsub	%f2, %f0, %f27
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f28
	fadd	%f2, %f0, %f29
	addi	%a0, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%v0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.47547
	addi	%v1, %v1, -5
	j	bgti_cont.47548
bgti_else.47547:
bgti_cont.47548:
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3091
bgti_else.47546:
	add	%ra, %zero, %s1
	jr	%ra
bgti_else.47543:
	add	%ra, %zero, %s1
	jr	%ra
calc_dirvec_rows.3096:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra
	blti	%s3, 0, bgti_else.47586
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
	addi	%v0, %zero, 3
	addi	%v1, %s4, 1
	blti	%v1, 5, bgti_else.47587
	addi	%v1, %v1, -5
	j	bgti_cont.47588
bgti_else.47587:
bgti_cont.47588:
	addi	%a0, %s5, 0
	fmov	%f0, %f3
	jal	calc_dirvecs.3091
	addi	%t7, %s3, -1
	addi	%s3, %s4, 2
	blti	%s3, 5, bgti_else.47589
	addi	%s3, %s3, -5
	j	bgti_cont.47590
bgti_else.47589:
bgti_cont.47590:
	addi	%s4, %s5, 4
	blti	%t7, 0, bgti_else.47591
	itof	%f0, %t7
	fmul	%f0, %f0, %f4
	fsub	%f0, %f0, %f5
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %s7, 0
	jal	calc_dirvecs.3091
	addi	%v0, %t7, -1
	addi	%v1, %s3, 2
	blti	%v1, 5, bgti_else.47592
	addi	%v1, %v1, -5
	j	bgti_cont.47593
bgti_else.47592:
bgti_cont.47593:
	addi	%a0, %s4, 4
	add	%ra, %zero, %s6
	j	calc_dirvec_rows.3096
bgti_else.47591:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.47586:
	add	%ra, %zero, %s6
	jr	%ra
create_dirvec_elements.3102:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.47630
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
	blti	%s0, 0, bgti_else.47631
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
	blti	%s0, 0, bgti_else.47632
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
	blti	%s0, 0, bgti_else.47633
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
bgti_else.47633:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47632:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47631:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.47630:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3105:
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra
	blti	%s2, 0, bgti_else.47664
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
	blti	%s2, 0, bgti_else.47665
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
bgti_else.47665:
	add	%ra, %zero, %s3
	jr	%ra
bgti_else.47664:
	add	%ra, %zero, %s3
	jr	%ra
init_dirvec_constants.3107:
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1
	add	%s4, %zero, %ra
	blti	%s3, 0, bgti_else.47783
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s5, %a0, -1
	addi	%v1, %s5, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.47784
	add	%at, %s2, %s3
	lw	%a1, 0(%at)
	blti	%s5, 0, bgti_else.47785
	lw	%a2, 12(%s5)
	lw	%a3, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.47787
	beqi	%a0, 2, bnei_else.47789
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f18, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f21, 2(%k0)
	fmul	%f1, %f18, %f18
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.47791
	fmul	%f16, %f19, %f21
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f18, %f19
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.47792
bnei_else.47791:
bnei_cont.47792:
	lw	%a0, 4(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f18, %f1
	fneg	%f22, %f1
	lw	%a0, 4(%a2)
	flw	%f1, 1(%a0)
	fmul	%f1, %f19, %f1
	fneg	%f20, %f1
	lw	%a0, 4(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.47793
	lw	%a0, 9(%a2)
	flw	%f1, 1(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f16, %f19, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 1(%a0)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.47794
bnei_else.47793:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.47794:
	fbne	%f0, %fzero, fbeq_else.47795
	add	%a0, %zero, %k1
	j	fbeq_cont.47796
fbeq_else.47795:
	add	%a0, %zero, %zero
fbeq_cont.47796:
	beqi	%a0, 0, bnei_else.47797
	j	bnei_cont.47798
bnei_else.47797:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.47798:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
	j	bnei_cont.47788
bnei_else.47789:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.47799
	add	%a0, %zero, %zero
	j	fbgt_cont.47800
fbgt_else.47799:
	add	%a0, %zero, %k1
fbgt_cont.47800:
	beqi	%a0, 0, bnei_else.47801
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.47802
bnei_else.47801:
	fsw	%fzero, 0(%v0)
bnei_cont.47802:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
bnei_cont.47790:
	j	bnei_cont.47788
bnei_else.47787:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.47803
	add	%a0, %zero, %k1
	j	fbeq_cont.47804
fbeq_else.47803:
	add	%a0, %zero, %zero
fbeq_cont.47804:
	beqi	%a0, 0, bnei_else.47805
	fsw	%fzero, 1(%v0)
	j	bnei_cont.47806
bnei_else.47805:
	lw	%ra, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.47807
	add	%a0, %zero, %zero
	j	fbgt_cont.47808
fbgt_else.47807:
	add	%a0, %zero, %k1
fbgt_cont.47808:
	beqi	%ra, 0, bnei_else.47809
	beqi	%a0, 0, bnei_else.47811
	add	%a0, %zero, %zero
	j	bnei_cont.47810
bnei_else.47811:
	add	%a0, %zero, %k1
bnei_cont.47812:
	j	bnei_cont.47810
bnei_else.47809:
bnei_cont.47810:
	lw	%ra, 4(%a2)
	flw	%f0, 0(%ra)
	beqi	%a0, 0, bnei_else.47813
	j	bnei_cont.47814
bnei_else.47813:
	fneg	%f0, %f0
bnei_cont.47814:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.47806:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.47815
	add	%a0, %zero, %k1
	j	fbeq_cont.47816
fbeq_else.47815:
	add	%a0, %zero, %zero
fbeq_cont.47816:
	beqi	%a0, 0, bnei_else.47817
	fsw	%fzero, 3(%v0)
	j	bnei_cont.47818
bnei_else.47817:
	lw	%ra, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.47819
	add	%a0, %zero, %zero
	j	fbgt_cont.47820
fbgt_else.47819:
	add	%a0, %zero, %k1
fbgt_cont.47820:
	beqi	%ra, 0, bnei_else.47821
	beqi	%a0, 0, bnei_else.47823
	add	%a0, %zero, %zero
	j	bnei_cont.47822
bnei_else.47823:
	add	%a0, %zero, %k1
bnei_cont.47824:
	j	bnei_cont.47822
bnei_else.47821:
bnei_cont.47822:
	lw	%ra, 4(%a2)
	flw	%f0, 1(%ra)
	beqi	%a0, 0, bnei_else.47825
	j	bnei_cont.47826
bnei_else.47825:
	fneg	%f0, %f0
bnei_cont.47826:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.47818:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.47827
	add	%a0, %zero, %k1
	j	fbeq_cont.47828
fbeq_else.47827:
	add	%a0, %zero, %zero
fbeq_cont.47828:
	beqi	%a0, 0, bnei_else.47829
	fsw	%fzero, 5(%v0)
	j	bnei_cont.47830
bnei_else.47829:
	lw	%k0, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.47831
	add	%a0, %zero, %zero
	j	fbgt_cont.47832
fbgt_else.47831:
	add	%a0, %zero, %k1
fbgt_cont.47832:
	beqi	%k0, 0, bnei_else.47833
	beqi	%a0, 0, bnei_else.47835
	add	%a0, %zero, %zero
	j	bnei_cont.47834
bnei_else.47835:
	add	%a0, %zero, %k1
bnei_cont.47836:
	j	bnei_cont.47834
bnei_else.47833:
bnei_cont.47834:
	lw	%a2, 4(%a2)
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.47837
	j	bnei_cont.47838
bnei_else.47837:
	fneg	%f0, %f0
bnei_cont.47838:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.47830:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
bnei_cont.47788:
	addi	%v1, %s5, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.47786
bgti_else.47785:
bgti_cont.47786:
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.47839
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	addi	%v1, %s5, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.47840
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2892
	addi	%v1, %s3, -1
	add	%ra, %zero, %s4
	addi	%v0, %s2, 0
	j	init_dirvec_constants.3107
bgti_else.47840:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.47839:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.47784:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.47783:
	add	%ra, %zero, %s4
	jr	%ra
init_vecset_constants.3110:
	add	%s6, %zero, %v0
	add	%s7, %zero, %ra
	blti	%s6, 0, bgti_else.48058
	lw	%s2, 179(%s6)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s2)
	lw	%a0, 0(%zero)
	addi	%t7, %a0, -1
	blti	%t7, 0, bgti_else.48059
	lw	%a2, 12(%t7)
	lw	%a3, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.48061
	beqi	%a0, 2, bnei_else.48063
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f18, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f21, 2(%k0)
	fmul	%f1, %f18, %f18
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48065
	fmul	%f16, %f19, %f21
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f18, %f19
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.48066
bnei_else.48065:
bnei_cont.48066:
	lw	%a0, 4(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f18, %f1
	fneg	%f22, %f1
	lw	%a0, 4(%a2)
	flw	%f1, 1(%a0)
	fmul	%f1, %f19, %f1
	fneg	%f20, %f1
	lw	%a0, 4(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48067
	lw	%a0, 9(%a2)
	flw	%f1, 1(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 2(%a0)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f16, %f19, %f1
	lw	%a0, 9(%a2)
	flw	%f1, 1(%a0)
	fmul	%f1, %f18, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f2
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.48068
bnei_else.48067:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.48068:
	fbne	%f0, %fzero, fbeq_else.48069
	add	%a0, %zero, %k1
	j	fbeq_cont.48070
fbeq_else.48069:
	add	%a0, %zero, %zero
fbeq_cont.48070:
	beqi	%a0, 0, bnei_else.48071
	j	bnei_cont.48072
bnei_else.48071:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.48072:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
	j	bnei_cont.48062
bnei_else.48063:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.48073
	add	%a0, %zero, %zero
	j	fbgt_cont.48074
fbgt_else.48073:
	add	%a0, %zero, %k1
fbgt_cont.48074:
	beqi	%a0, 0, bnei_else.48075
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.48076
bnei_else.48075:
	fsw	%fzero, 0(%v0)
bnei_cont.48076:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48064:
	j	bnei_cont.48062
bnei_else.48061:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.48077
	add	%a0, %zero, %k1
	j	fbeq_cont.48078
fbeq_else.48077:
	add	%a0, %zero, %zero
fbeq_cont.48078:
	beqi	%a0, 0, bnei_else.48079
	fsw	%fzero, 1(%v0)
	j	bnei_cont.48080
bnei_else.48079:
	lw	%ra, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.48081
	add	%a0, %zero, %zero
	j	fbgt_cont.48082
fbgt_else.48081:
	add	%a0, %zero, %k1
fbgt_cont.48082:
	beqi	%ra, 0, bnei_else.48083
	beqi	%a0, 0, bnei_else.48085
	add	%a0, %zero, %zero
	j	bnei_cont.48084
bnei_else.48085:
	add	%a0, %zero, %k1
bnei_cont.48086:
	j	bnei_cont.48084
bnei_else.48083:
bnei_cont.48084:
	lw	%ra, 4(%a2)
	flw	%f0, 0(%ra)
	beqi	%a0, 0, bnei_else.48087
	j	bnei_cont.48088
bnei_else.48087:
	fneg	%f0, %f0
bnei_cont.48088:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.48080:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.48089
	add	%a0, %zero, %k1
	j	fbeq_cont.48090
fbeq_else.48089:
	add	%a0, %zero, %zero
fbeq_cont.48090:
	beqi	%a0, 0, bnei_else.48091
	fsw	%fzero, 3(%v0)
	j	bnei_cont.48092
bnei_else.48091:
	lw	%ra, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.48093
	add	%a0, %zero, %zero
	j	fbgt_cont.48094
fbgt_else.48093:
	add	%a0, %zero, %k1
fbgt_cont.48094:
	beqi	%ra, 0, bnei_else.48095
	beqi	%a0, 0, bnei_else.48097
	add	%a0, %zero, %zero
	j	bnei_cont.48096
bnei_else.48097:
	add	%a0, %zero, %k1
bnei_cont.48098:
	j	bnei_cont.48096
bnei_else.48095:
bnei_cont.48096:
	lw	%ra, 4(%a2)
	flw	%f0, 1(%ra)
	beqi	%a0, 0, bnei_else.48099
	j	bnei_cont.48100
bnei_else.48099:
	fneg	%f0, %f0
bnei_cont.48100:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.48092:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.48101
	add	%a0, %zero, %k1
	j	fbeq_cont.48102
fbeq_else.48101:
	add	%a0, %zero, %zero
fbeq_cont.48102:
	beqi	%a0, 0, bnei_else.48103
	fsw	%fzero, 5(%v0)
	j	bnei_cont.48104
bnei_else.48103:
	lw	%k0, 6(%a2)
	fblt	%f1, %fzero, fbgt_else.48105
	add	%a0, %zero, %zero
	j	fbgt_cont.48106
fbgt_else.48105:
	add	%a0, %zero, %k1
fbgt_cont.48106:
	beqi	%k0, 0, bnei_else.48107
	beqi	%a0, 0, bnei_else.48109
	add	%a0, %zero, %zero
	j	bnei_cont.48108
bnei_else.48109:
	add	%a0, %zero, %k1
bnei_cont.48110:
	j	bnei_cont.48108
bnei_else.48107:
bnei_cont.48108:
	lw	%a2, 4(%a2)
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.48111
	j	bnei_cont.48112
bnei_else.48111:
	fneg	%f0, %f0
bnei_cont.48112:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.48104:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48062:
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.48060
bgti_else.48059:
bgti_cont.48060:
	addi	%t9, %zero, 118
	lw	%v0, 118(%s2)
	addi	%v1, %t7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%t8, %zero, 117
	lw	%v0, 117(%s2)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 116
	addi	%v0, %s2, 0
	jal	init_dirvec_constants.3107
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48113
	lw	%s2, 179(%s6)
	lw	%v0, 119(%s2)
	addi	%v1, %t7, 0
	jal	iter_setup_dirvec_constants.2889
	lw	%v0, 118(%s2)
	jal	setup_dirvec_constants.2892
	addi	%v1, %t8, 0
	addi	%v0, %s2, 0
	jal	init_dirvec_constants.3107
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48114
	lw	%s2, 179(%s6)
	lw	%v0, 119(%s2)
	jal	setup_dirvec_constants.2892
	addi	%v1, %t9, 0
	addi	%v0, %s2, 0
	jal	init_dirvec_constants.3107
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48115
	lw	%v0, 179(%s6)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3107
	addi	%v0, %s6, -1
	add	%ra, %zero, %s7
	j	init_vecset_constants.3110
bgti_else.48115:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48114:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48113:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48058:
	add	%ra, %zero, %s7
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
	addi	%a1, %zero, 2
	sw	%a1, 154(%zero)
	sw	%a1, 155(%zero)
	addi	%a0, %zero, 1
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
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a2)
	addi	%a0, %zero, 4
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
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
	blti	%t7, 0, bgti_else.50473
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
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
	addi	%sp, %sp, 1
	jal	init_line_elements.3073
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	j	bgti_cont.50474
bgti_else.50473:
bgti_cont.50474:
	sw	%a1, 1(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
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
	blti	%t7, 0, bgti_else.50475
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
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
	addi	%sp, %sp, 2
	jal	init_line_elements.3073
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	j	bgti_cont.50476
bgti_else.50475:
bgti_cont.50476:
	sw	%a1, 2(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
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
	blti	%t7, 0, bgti_else.50477
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a3)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a3)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s3, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
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
	addi	%sp, %sp, 3
	jal	init_line_elements.3073
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	j	bgti_cont.50478
bgti_else.50477:
bgti_cont.50478:
	sw	%a1, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fsw	%f0, 72(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fsw	%f0, 73(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fsw	%f0, 74(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	flw	%f19, 469(%zero)
	fmul	%f20, %f0, %f19
	flw	%f18, 494(%zero)
	fabs	%f17, %f20
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.50479
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.50480
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50480
fbgt_else.50497:
fbgt_cont.50498:
	j	fbgt_cont.50480
fbgt_else.50495:
fbgt_cont.50496:
	j	fbgt_cont.50480
fbgt_else.50493:
fbgt_cont.50494:
	j	fbgt_cont.50480
fbgt_else.50491:
fbgt_cont.50492:
	j	fbgt_cont.50480
fbgt_else.50489:
fbgt_cont.50490:
	j	fbgt_cont.50480
fbgt_else.50487:
fbgt_cont.50488:
	j	fbgt_cont.50480
fbgt_else.50485:
fbgt_cont.50486:
	j	fbgt_cont.50480
fbgt_else.50483:
fbgt_cont.50484:
	j	fbgt_cont.50480
fbgt_else.50481:
fbgt_cont.50482:
	j	fbgt_cont.50480
fbgt_else.50479:
	fmov	%f0, %f2
fbgt_cont.50480:
	fblt	%f17, %f2, fbgt_else.50499
	fblt	%f17, %f0, fbgt_else.50501
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50500
	fblt	%f17, %f1, fbgt_else.50505
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
	j	fbgt_cont.50500
fbgt_else.50505:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
fbgt_cont.50506:
	j	fbgt_cont.50500
fbgt_else.50503:
fbgt_cont.50504:
	j	fbgt_cont.50500
fbgt_else.50501:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50500
	fblt	%f17, %f1, fbgt_else.50509
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
	j	fbgt_cont.50500
fbgt_else.50509:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f17, %f0
fbgt_cont.50510:
	j	fbgt_cont.50500
fbgt_else.50507:
fbgt_cont.50508:
fbgt_cont.50502:
	j	fbgt_cont.50500
fbgt_else.50499:
fbgt_cont.50500:
	fblt	%f17, %f18, fbgt_else.50511
	add	%a0, %zero, %zero
	j	fbgt_cont.50512
fbgt_else.50511:
	add	%a0, %zero, %k1
fbgt_cont.50512:
	fblt	%f17, %f18, fbgt_else.50513
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50514
fbgt_else.50513:
fbgt_cont.50514:
	flw	%f21, 479(%zero)
	fblt	%f17, %f21, fbgt_else.50515
	beqi	%a0, 0, bnei_else.50517
	add	%a0, %zero, %zero
	j	fbgt_cont.50516
bnei_else.50517:
	add	%a0, %zero, %k1
bnei_cont.50518:
	j	fbgt_cont.50516
fbgt_else.50515:
fbgt_cont.50516:
	fblt	%f17, %f21, fbgt_else.50519
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50520
fbgt_else.50519:
fbgt_cont.50520:
	flw	%f22, 478(%zero)
	fblt	%f22, %f17, fbgt_else.50521
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
	j	fbgt_cont.50522
fbgt_else.50521:
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
fbgt_cont.50522:
	beqi	%a0, 0, bnei_else.50523
	j	bnei_cont.50524
bnei_else.50523:
	fneg	%f17, %f17
bnei_cont.50524:
	fblt	%f20, %fzero, fbgt_else.50525
	add	%a0, %zero, %k1
	j	fbgt_cont.50526
fbgt_else.50525:
	add	%a0, %zero, %zero
fbgt_cont.50526:
	fabs	%f20, %f20
	fblt	%f20, %f2, fbgt_else.50527
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.50528
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50528
fbgt_else.50545:
fbgt_cont.50546:
	j	fbgt_cont.50528
fbgt_else.50543:
fbgt_cont.50544:
	j	fbgt_cont.50528
fbgt_else.50541:
fbgt_cont.50542:
	j	fbgt_cont.50528
fbgt_else.50539:
fbgt_cont.50540:
	j	fbgt_cont.50528
fbgt_else.50537:
fbgt_cont.50538:
	j	fbgt_cont.50528
fbgt_else.50535:
fbgt_cont.50536:
	j	fbgt_cont.50528
fbgt_else.50533:
fbgt_cont.50534:
	j	fbgt_cont.50528
fbgt_else.50531:
fbgt_cont.50532:
	j	fbgt_cont.50528
fbgt_else.50529:
fbgt_cont.50530:
	j	fbgt_cont.50528
fbgt_else.50527:
	fmov	%f0, %f2
fbgt_cont.50528:
	fblt	%f20, %f2, fbgt_else.50547
	fblt	%f20, %f0, fbgt_else.50549
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50548
	fblt	%f20, %f1, fbgt_else.50553
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
	j	fbgt_cont.50548
fbgt_else.50553:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
fbgt_cont.50554:
	j	fbgt_cont.50548
fbgt_else.50551:
fbgt_cont.50552:
	j	fbgt_cont.50548
fbgt_else.50549:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50548
	fblt	%f20, %f1, fbgt_else.50557
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
	j	fbgt_cont.50548
fbgt_else.50557:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f20, %f0
fbgt_cont.50558:
	j	fbgt_cont.50548
fbgt_else.50555:
fbgt_cont.50556:
fbgt_cont.50550:
	j	fbgt_cont.50548
fbgt_else.50547:
fbgt_cont.50548:
	fblt	%f20, %f18, fbgt_else.50559
	beqi	%a0, 0, bnei_else.50561
	add	%a0, %zero, %zero
	j	fbgt_cont.50560
bnei_else.50561:
	add	%a0, %zero, %k1
bnei_cont.50562:
	j	fbgt_cont.50560
fbgt_else.50559:
fbgt_cont.50560:
	fblt	%f20, %f18, fbgt_else.50563
	fsub	%f20, %f20, %f18
	j	fbgt_cont.50564
fbgt_else.50563:
fbgt_cont.50564:
	fblt	%f20, %f21, fbgt_else.50565
	fsub	%f20, %f18, %f20
	j	fbgt_cont.50566
fbgt_else.50565:
fbgt_cont.50566:
	fblt	%f22, %f20, fbgt_else.50567
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
	j	fbgt_cont.50568
fbgt_else.50567:
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
fbgt_cont.50568:
	beqi	%a0, 0, bnei_else.50569
	j	bnei_cont.50570
bnei_else.50569:
	fneg	%f20, %f20
bnei_cont.50570:
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f24, %f0, %f19
	fabs	%f23, %f24
	fblt	%f23, %f2, fbgt_else.50571
	flw	%f0, 492(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 491(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 490(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 489(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 488(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 487(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 486(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 485(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f0, 484(%zero)
	fblt	%f23, %f0, fbgt_cont.50572
	flw	%f1, 483(%zero)
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50572
fbgt_else.50589:
fbgt_cont.50590:
	j	fbgt_cont.50572
fbgt_else.50587:
fbgt_cont.50588:
	j	fbgt_cont.50572
fbgt_else.50585:
fbgt_cont.50586:
	j	fbgt_cont.50572
fbgt_else.50583:
fbgt_cont.50584:
	j	fbgt_cont.50572
fbgt_else.50581:
fbgt_cont.50582:
	j	fbgt_cont.50572
fbgt_else.50579:
fbgt_cont.50580:
	j	fbgt_cont.50572
fbgt_else.50577:
fbgt_cont.50578:
	j	fbgt_cont.50572
fbgt_else.50575:
fbgt_cont.50576:
	j	fbgt_cont.50572
fbgt_else.50573:
fbgt_cont.50574:
	j	fbgt_cont.50572
fbgt_else.50571:
	fmov	%f0, %f2
fbgt_cont.50572:
	fblt	%f23, %f2, fbgt_else.50591
	fblt	%f23, %f0, fbgt_else.50593
	fsub	%f23, %f23, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.50592
	fblt	%f23, %f1, fbgt_else.50597
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
	j	fbgt_cont.50592
fbgt_else.50597:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
fbgt_cont.50598:
	j	fbgt_cont.50592
fbgt_else.50595:
fbgt_cont.50596:
	j	fbgt_cont.50592
fbgt_else.50593:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.50592
	fblt	%f23, %f1, fbgt_else.50601
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
	j	fbgt_cont.50592
fbgt_else.50601:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f23, %f0
fbgt_cont.50602:
	j	fbgt_cont.50592
fbgt_else.50599:
fbgt_cont.50600:
fbgt_cont.50594:
	j	fbgt_cont.50592
fbgt_else.50591:
fbgt_cont.50592:
	fblt	%f23, %f18, fbgt_else.50603
	add	%a0, %zero, %zero
	j	fbgt_cont.50604
fbgt_else.50603:
	add	%a0, %zero, %k1
fbgt_cont.50604:
	fblt	%f23, %f18, fbgt_else.50605
	fsub	%f23, %f23, %f18
	j	fbgt_cont.50606
fbgt_else.50605:
fbgt_cont.50606:
	fblt	%f23, %f21, fbgt_else.50607
	beqi	%a0, 0, bnei_else.50609
	add	%a0, %zero, %zero
	j	fbgt_cont.50608
bnei_else.50609:
	add	%a0, %zero, %k1
bnei_cont.50610:
	j	fbgt_cont.50608
fbgt_else.50607:
fbgt_cont.50608:
	fblt	%f23, %f21, fbgt_else.50611
	fsub	%f23, %f18, %f23
	j	fbgt_cont.50612
fbgt_else.50611:
fbgt_cont.50612:
	fblt	%f22, %f23, fbgt_else.50613
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
	j	fbgt_cont.50614
fbgt_else.50613:
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
fbgt_cont.50614:
	beqi	%a0, 0, bnei_else.50615
	j	bnei_cont.50616
bnei_else.50615:
	fneg	%f23, %f23
bnei_cont.50616:
	fblt	%f24, %fzero, fbgt_else.50617
	add	%a0, %zero, %k1
	j	fbgt_cont.50618
fbgt_else.50617:
	add	%a0, %zero, %zero
fbgt_cont.50618:
	fabs	%f24, %f24
	fblt	%f24, %f2, fbgt_else.50619
	flw	%f0, 492(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 491(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 490(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 489(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 488(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 487(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 486(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 485(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f0, 484(%zero)
	fblt	%f24, %f0, fbgt_cont.50620
	flw	%f1, 483(%zero)
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	j	fbgt_cont.50620
fbgt_else.50637:
fbgt_cont.50638:
	j	fbgt_cont.50620
fbgt_else.50635:
fbgt_cont.50636:
	j	fbgt_cont.50620
fbgt_else.50633:
fbgt_cont.50634:
	j	fbgt_cont.50620
fbgt_else.50631:
fbgt_cont.50632:
	j	fbgt_cont.50620
fbgt_else.50629:
fbgt_cont.50630:
	j	fbgt_cont.50620
fbgt_else.50627:
fbgt_cont.50628:
	j	fbgt_cont.50620
fbgt_else.50625:
fbgt_cont.50626:
	j	fbgt_cont.50620
fbgt_else.50623:
fbgt_cont.50624:
	j	fbgt_cont.50620
fbgt_else.50621:
fbgt_cont.50622:
	j	fbgt_cont.50620
fbgt_else.50619:
	fmov	%f0, %f2
fbgt_cont.50620:
	fblt	%f24, %f2, fbgt_else.50639
	fblt	%f24, %f0, fbgt_else.50641
	fsub	%f24, %f24, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.50640
	fblt	%f24, %f1, fbgt_else.50645
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
	j	fbgt_cont.50640
fbgt_else.50645:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
fbgt_cont.50646:
	j	fbgt_cont.50640
fbgt_else.50643:
fbgt_cont.50644:
	j	fbgt_cont.50640
fbgt_else.50641:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.50640
	fblt	%f24, %f1, fbgt_else.50649
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
	j	fbgt_cont.50640
fbgt_else.50649:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	fmov	%f24, %f0
fbgt_cont.50650:
	j	fbgt_cont.50640
fbgt_else.50647:
fbgt_cont.50648:
fbgt_cont.50642:
	j	fbgt_cont.50640
fbgt_else.50639:
fbgt_cont.50640:
	fblt	%f24, %f18, fbgt_else.50651
	beqi	%a0, 0, bnei_else.50653
	add	%a0, %zero, %zero
	j	fbgt_cont.50652
bnei_else.50653:
	add	%a0, %zero, %k1
bnei_cont.50654:
	j	fbgt_cont.50652
fbgt_else.50651:
fbgt_cont.50652:
	fblt	%f24, %f18, fbgt_else.50655
	fsub	%f24, %f24, %f18
	j	fbgt_cont.50656
fbgt_else.50655:
fbgt_cont.50656:
	fblt	%f24, %f21, fbgt_else.50657
	fsub	%f24, %f18, %f24
	j	fbgt_cont.50658
fbgt_else.50657:
fbgt_cont.50658:
	fblt	%f22, %f24, fbgt_else.50659
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
	j	fbgt_cont.50660
fbgt_else.50659:
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
fbgt_cont.50660:
	beqi	%a0, 0, bnei_else.50661
	j	bnei_cont.50662
bnei_else.50661:
	fneg	%f0, %f0
bnei_cont.50662:
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
	addi	%sp, %sp, -7
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fmul	%f20, %f0, %f19
	fblt	%f20, %fzero, fbgt_else.50663
	add	%a0, %zero, %k1
	j	fbgt_cont.50664
fbgt_else.50663:
	add	%a0, %zero, %zero
fbgt_cont.50664:
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.50665
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.50666
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.50666
fbgt_else.50683:
fbgt_cont.50684:
	j	fbgt_cont.50666
fbgt_else.50681:
fbgt_cont.50682:
	j	fbgt_cont.50666
fbgt_else.50679:
fbgt_cont.50680:
	j	fbgt_cont.50666
fbgt_else.50677:
fbgt_cont.50678:
	j	fbgt_cont.50666
fbgt_else.50675:
fbgt_cont.50676:
	j	fbgt_cont.50666
fbgt_else.50673:
fbgt_cont.50674:
	j	fbgt_cont.50666
fbgt_else.50671:
fbgt_cont.50672:
	j	fbgt_cont.50666
fbgt_else.50669:
fbgt_cont.50670:
	j	fbgt_cont.50666
fbgt_else.50667:
fbgt_cont.50668:
	j	fbgt_cont.50666
fbgt_else.50665:
	fmov	%f0, %f2
fbgt_cont.50666:
	fblt	%f17, %f2, fbgt_else.50685
	fblt	%f17, %f0, fbgt_else.50687
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50686
	fblt	%f17, %f1, fbgt_else.50691
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.50686
fbgt_else.50691:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.50692:
	j	fbgt_cont.50686
fbgt_else.50689:
fbgt_cont.50690:
	j	fbgt_cont.50686
fbgt_else.50687:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50686
	fblt	%f17, %f1, fbgt_else.50695
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.50686
fbgt_else.50695:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.50696:
	j	fbgt_cont.50686
fbgt_else.50693:
fbgt_cont.50694:
fbgt_cont.50688:
	j	fbgt_cont.50686
fbgt_else.50685:
fbgt_cont.50686:
	fblt	%f17, %f18, fbgt_else.50697
	beqi	%a0, 0, bnei_else.50699
	add	%a0, %zero, %zero
	j	fbgt_cont.50698
bnei_else.50699:
	add	%a0, %zero, %k1
bnei_cont.50700:
	j	fbgt_cont.50698
fbgt_else.50697:
fbgt_cont.50698:
	fblt	%f17, %f18, fbgt_else.50701
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50702
fbgt_else.50701:
fbgt_cont.50702:
	fblt	%f17, %f21, fbgt_else.50703
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50704
fbgt_else.50703:
fbgt_cont.50704:
	fblt	%f22, %f17, fbgt_else.50705
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
	j	fbgt_cont.50706
fbgt_else.50705:
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
fbgt_cont.50706:
	beqi	%a0, 0, bnei_else.50707
	j	bnei_cont.50708
bnei_else.50707:
	fneg	%f0, %f0
bnei_cont.50708:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fmul	%f19, %f0, %f19
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.50709
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.50710
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.50710
fbgt_else.50727:
fbgt_cont.50728:
	j	fbgt_cont.50710
fbgt_else.50725:
fbgt_cont.50726:
	j	fbgt_cont.50710
fbgt_else.50723:
fbgt_cont.50724:
	j	fbgt_cont.50710
fbgt_else.50721:
fbgt_cont.50722:
	j	fbgt_cont.50710
fbgt_else.50719:
fbgt_cont.50720:
	j	fbgt_cont.50710
fbgt_else.50717:
fbgt_cont.50718:
	j	fbgt_cont.50710
fbgt_else.50715:
fbgt_cont.50716:
	j	fbgt_cont.50710
fbgt_else.50713:
fbgt_cont.50714:
	j	fbgt_cont.50710
fbgt_else.50711:
fbgt_cont.50712:
	j	fbgt_cont.50710
fbgt_else.50709:
	fmov	%f0, %f2
fbgt_cont.50710:
	fblt	%f17, %f2, fbgt_else.50729
	fblt	%f17, %f0, fbgt_else.50731
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50730
	fblt	%f17, %f1, fbgt_else.50735
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.50730
fbgt_else.50735:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.50736:
	j	fbgt_cont.50730
fbgt_else.50733:
fbgt_cont.50734:
	j	fbgt_cont.50730
fbgt_else.50731:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.50730
	fblt	%f17, %f1, fbgt_else.50739
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
	j	fbgt_cont.50730
fbgt_else.50739:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f17, %f0
fbgt_cont.50740:
	j	fbgt_cont.50730
fbgt_else.50737:
fbgt_cont.50738:
fbgt_cont.50732:
	j	fbgt_cont.50730
fbgt_else.50729:
fbgt_cont.50730:
	fblt	%f17, %f18, fbgt_else.50741
	add	%a0, %zero, %zero
	j	fbgt_cont.50742
fbgt_else.50741:
	add	%a0, %zero, %k1
fbgt_cont.50742:
	fblt	%f17, %f18, fbgt_else.50743
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50744
fbgt_else.50743:
fbgt_cont.50744:
	fblt	%f17, %f21, fbgt_else.50745
	beqi	%a0, 0, bnei_else.50747
	add	%a0, %zero, %zero
	j	fbgt_cont.50746
bnei_else.50747:
	add	%a0, %zero, %k1
bnei_cont.50748:
	j	fbgt_cont.50746
fbgt_else.50745:
fbgt_cont.50746:
	fblt	%f17, %f21, fbgt_else.50749
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50750
fbgt_else.50749:
fbgt_cont.50750:
	fblt	%f22, %f17, fbgt_else.50751
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
	j	fbgt_cont.50752
fbgt_else.50751:
	fsub	%f20, %f21, %f17
	fmul	%f17, %f20, %f20
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.50752:
	beqi	%a0, 0, bnei_else.50753
	j	bnei_cont.50754
bnei_else.50753:
	fneg	%f17, %f17
bnei_cont.50754:
	fblt	%f19, %fzero, fbgt_else.50755
	add	%a0, %zero, %k1
	j	fbgt_cont.50756
fbgt_else.50755:
	add	%a0, %zero, %zero
fbgt_cont.50756:
	fabs	%f20, %f19
	fblt	%f20, %f2, fbgt_else.50757
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.50758
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.50758
fbgt_else.50775:
fbgt_cont.50776:
	j	fbgt_cont.50758
fbgt_else.50773:
fbgt_cont.50774:
	j	fbgt_cont.50758
fbgt_else.50771:
fbgt_cont.50772:
	j	fbgt_cont.50758
fbgt_else.50769:
fbgt_cont.50770:
	j	fbgt_cont.50758
fbgt_else.50767:
fbgt_cont.50768:
	j	fbgt_cont.50758
fbgt_else.50765:
fbgt_cont.50766:
	j	fbgt_cont.50758
fbgt_else.50763:
fbgt_cont.50764:
	j	fbgt_cont.50758
fbgt_else.50761:
fbgt_cont.50762:
	j	fbgt_cont.50758
fbgt_else.50759:
fbgt_cont.50760:
	j	fbgt_cont.50758
fbgt_else.50757:
	fmov	%f0, %f2
fbgt_cont.50758:
	fblt	%f20, %f2, fbgt_else.50777
	fblt	%f20, %f0, fbgt_else.50779
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50778
	fblt	%f20, %f1, fbgt_else.50783
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
	j	fbgt_cont.50778
fbgt_else.50783:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
fbgt_cont.50784:
	j	fbgt_cont.50778
fbgt_else.50781:
fbgt_cont.50782:
	j	fbgt_cont.50778
fbgt_else.50779:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.50778
	fblt	%f20, %f1, fbgt_else.50787
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
	j	fbgt_cont.50778
fbgt_else.50787:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f20, %f0
fbgt_cont.50788:
	j	fbgt_cont.50778
fbgt_else.50785:
fbgt_cont.50786:
fbgt_cont.50780:
	j	fbgt_cont.50778
fbgt_else.50777:
fbgt_cont.50778:
	fblt	%f20, %f18, fbgt_else.50789
	beqi	%a0, 0, bnei_else.50791
	add	%a0, %zero, %zero
	j	fbgt_cont.50790
bnei_else.50791:
	add	%a0, %zero, %k1
bnei_cont.50792:
	j	fbgt_cont.50790
fbgt_else.50789:
fbgt_cont.50790:
	fblt	%f20, %f18, fbgt_else.50793
	fsub	%f20, %f20, %f18
	j	fbgt_cont.50794
fbgt_else.50793:
fbgt_cont.50794:
	fblt	%f20, %f21, fbgt_else.50795
	fsub	%f20, %f18, %f20
	j	fbgt_cont.50796
fbgt_else.50795:
fbgt_cont.50796:
	fblt	%f22, %f20, fbgt_else.50797
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
	j	fbgt_cont.50798
fbgt_else.50797:
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
fbgt_cont.50798:
	beqi	%a0, 0, bnei_else.50799
	j	bnei_cont.50800
bnei_else.50799:
	fneg	%f0, %f0
bnei_cont.50800:
	fmul	%f0, %f17, %f0
	fsw	%f0, 78(%zero)
	fabs	%f19, %f19
	fblt	%f19, %f2, fbgt_else.50801
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.50802
	flw	%f1, 483(%zero)
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	j	fbgt_cont.50802
fbgt_else.50819:
fbgt_cont.50820:
	j	fbgt_cont.50802
fbgt_else.50817:
fbgt_cont.50818:
	j	fbgt_cont.50802
fbgt_else.50815:
fbgt_cont.50816:
	j	fbgt_cont.50802
fbgt_else.50813:
fbgt_cont.50814:
	j	fbgt_cont.50802
fbgt_else.50811:
fbgt_cont.50812:
	j	fbgt_cont.50802
fbgt_else.50809:
fbgt_cont.50810:
	j	fbgt_cont.50802
fbgt_else.50807:
fbgt_cont.50808:
	j	fbgt_cont.50802
fbgt_else.50805:
fbgt_cont.50806:
	j	fbgt_cont.50802
fbgt_else.50803:
fbgt_cont.50804:
	j	fbgt_cont.50802
fbgt_else.50801:
	fmov	%f0, %f2
fbgt_cont.50802:
	fblt	%f19, %f2, fbgt_else.50821
	fblt	%f19, %f0, fbgt_else.50823
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.50822
	fblt	%f19, %f1, fbgt_else.50827
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
	j	fbgt_cont.50822
fbgt_else.50827:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
fbgt_cont.50828:
	j	fbgt_cont.50822
fbgt_else.50825:
fbgt_cont.50826:
	j	fbgt_cont.50822
fbgt_else.50823:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.50822
	fblt	%f19, %f1, fbgt_else.50831
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
	j	fbgt_cont.50822
fbgt_else.50831:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	fmov	%f19, %f0
fbgt_cont.50832:
	j	fbgt_cont.50822
fbgt_else.50829:
fbgt_cont.50830:
fbgt_cont.50824:
	j	fbgt_cont.50822
fbgt_else.50821:
fbgt_cont.50822:
	fblt	%f19, %f18, fbgt_else.50833
	add	%a0, %zero, %zero
	j	fbgt_cont.50834
fbgt_else.50833:
	add	%a0, %zero, %k1
fbgt_cont.50834:
	fblt	%f19, %f18, fbgt_else.50835
	fsub	%f19, %f19, %f18
	j	fbgt_cont.50836
fbgt_else.50835:
fbgt_cont.50836:
	fblt	%f19, %f21, fbgt_else.50837
	beqi	%a0, 0, bnei_else.50839
	add	%a0, %zero, %zero
	j	fbgt_cont.50838
bnei_else.50839:
	add	%a0, %zero, %k1
bnei_cont.50840:
	j	fbgt_cont.50838
fbgt_else.50837:
fbgt_cont.50838:
	fblt	%f19, %f21, fbgt_else.50841
	fsub	%f19, %f18, %f19
	j	fbgt_cont.50842
fbgt_else.50841:
fbgt_cont.50842:
	fblt	%f22, %f19, fbgt_else.50843
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
	j	fbgt_cont.50844
fbgt_else.50843:
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
fbgt_cont.50844:
	beqi	%a0, 0, bnei_else.50845
	j	bnei_cont.50846
bnei_else.50845:
	fneg	%f0, %f0
bnei_cont.50846:
	fmul	%f0, %f17, %f0
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	read_object.2784
	addi	%sp, %sp, -7
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.50847
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_and_network.2792
	addi	%sp, %sp, -7
	j	bnei_cont.50848
bnei_else.50847:
bnei_cont.50848:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	addi	%s1, %v0, 0
	lw	%a0, 0(%s1)
	beqi	%a0, -1, bnei_else.50849
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_or_network.2790
	addi	%sp, %sp, -7
	sw	%s1, 0(%v0)
	j	bnei_cont.50850
bnei_else.50849:
	addi	%v1, %s1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
bnei_cont.50850:
	sw	%v0, 134(%zero)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %zero, 51
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%a1, %zero, 10
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%v0, 0(%sp)
	addi	%v1, %zero, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%a3, 0(%sp)
	blti	%a3, 10, bgti_else.50851
	blti	%a3, 20, bgti_else.50853
	blti	%a3, 30, bgti_else.50855
	blti	%a3, 40, bgti_else.50857
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50852
	blti	%a3, 20, bgti_else.50861
	blti	%a3, 30, bgti_else.50863
	blti	%a3, 40, bgti_else.50865
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50852
	blti	%a3, 20, bgti_else.50869
	blti	%a3, 30, bgti_else.50871
	blti	%a3, 40, bgti_else.50873
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50852
	blti	%a3, 20, bgti_else.50877
	blti	%a3, 30, bgti_else.50879
	blti	%a3, 40, bgti_else.50881
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.50852
bgti_else.50881:
	addi	%a3, %a3, -30
bgti_cont.50882:
	j	bgti_cont.50852
bgti_else.50879:
	addi	%a3, %a3, -20
bgti_cont.50880:
	j	bgti_cont.50852
bgti_else.50877:
	addi	%a3, %a3, -10
bgti_cont.50878:
	j	bgti_cont.50852
bgti_else.50875:
bgti_cont.50876:
	j	bgti_cont.50852
bgti_else.50873:
	addi	%a3, %a3, -30
bgti_cont.50874:
	j	bgti_cont.50852
bgti_else.50871:
	addi	%a3, %a3, -20
bgti_cont.50872:
	j	bgti_cont.50852
bgti_else.50869:
	addi	%a3, %a3, -10
bgti_cont.50870:
	j	bgti_cont.50852
bgti_else.50867:
bgti_cont.50868:
	j	bgti_cont.50852
bgti_else.50865:
	addi	%a3, %a3, -30
bgti_cont.50866:
	j	bgti_cont.50852
bgti_else.50863:
	addi	%a3, %a3, -20
bgti_cont.50864:
	j	bgti_cont.50852
bgti_else.50861:
	addi	%a3, %a3, -10
bgti_cont.50862:
	j	bgti_cont.50852
bgti_else.50859:
bgti_cont.50860:
	j	bgti_cont.50852
bgti_else.50857:
	addi	%a3, %a3, -30
bgti_cont.50858:
	j	bgti_cont.50852
bgti_else.50855:
	addi	%a3, %a3, -20
bgti_cont.50856:
	j	bgti_cont.50852
bgti_else.50853:
	addi	%a3, %a3, -10
bgti_cont.50854:
	j	bgti_cont.50852
bgti_else.50851:
bgti_cont.50852:
	blt	%zero, %a2, bgt_else.50883
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.50884
bgt_else.50883:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.50885
	blti	%a2, 20, bgti_else.50887
	blti	%a2, 30, bgti_else.50889
	blti	%a2, 40, bgti_else.50891
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.50886
	blti	%a2, 20, bgti_else.50895
	blti	%a2, 30, bgti_else.50897
	blti	%a2, 40, bgti_else.50899
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.50886
	blti	%a2, 20, bgti_else.50903
	blti	%a2, 30, bgti_else.50905
	blti	%a2, 40, bgti_else.50907
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.50886
	blti	%a2, 20, bgti_else.50911
	blti	%a2, 30, bgti_else.50913
	blti	%a2, 40, bgti_else.50915
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.50886
bgti_else.50915:
	addi	%a2, %a2, -30
bgti_cont.50916:
	j	bgti_cont.50886
bgti_else.50913:
	addi	%a2, %a2, -20
bgti_cont.50914:
	j	bgti_cont.50886
bgti_else.50911:
	addi	%a2, %a2, -10
bgti_cont.50912:
	j	bgti_cont.50886
bgti_else.50909:
bgti_cont.50910:
	j	bgti_cont.50886
bgti_else.50907:
	addi	%a2, %a2, -30
bgti_cont.50908:
	j	bgti_cont.50886
bgti_else.50905:
	addi	%a2, %a2, -20
bgti_cont.50906:
	j	bgti_cont.50886
bgti_else.50903:
	addi	%a2, %a2, -10
bgti_cont.50904:
	j	bgti_cont.50886
bgti_else.50901:
bgti_cont.50902:
	j	bgti_cont.50886
bgti_else.50899:
	addi	%a2, %a2, -30
bgti_cont.50900:
	j	bgti_cont.50886
bgti_else.50897:
	addi	%a2, %a2, -20
bgti_cont.50898:
	j	bgti_cont.50886
bgti_else.50895:
	addi	%a2, %a2, -10
bgti_cont.50896:
	j	bgti_cont.50886
bgti_else.50893:
bgti_cont.50894:
	j	bgti_cont.50886
bgti_else.50891:
	addi	%a2, %a2, -30
bgti_cont.50892:
	j	bgti_cont.50886
bgti_else.50889:
	addi	%a2, %a2, -20
bgti_cont.50890:
	j	bgti_cont.50886
bgti_else.50887:
	addi	%a2, %a2, -10
bgti_cont.50888:
	j	bgti_cont.50886
bgti_else.50885:
bgti_cont.50886:
	blt	%zero, %a0, bgt_else.50917
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.50918
bgt_else.50917:
	blti	%a0, 10, bgti_else.50919
	blti	%a0, 20, bgti_else.50921
	blti	%a0, 30, bgti_else.50923
	blti	%a0, 40, bgti_else.50925
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.50920
	blti	%a0, 20, bgti_else.50929
	blti	%a0, 30, bgti_else.50931
	blti	%a0, 40, bgti_else.50933
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.50920
	blti	%a0, 20, bgti_else.50937
	blti	%a0, 30, bgti_else.50939
	blti	%a0, 40, bgti_else.50941
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.50920
	blti	%a0, 20, bgti_else.50945
	blti	%a0, 30, bgti_else.50947
	blti	%a0, 40, bgti_else.50949
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.50920
bgti_else.50949:
	addi	%a0, %a0, -30
bgti_cont.50950:
	j	bgti_cont.50920
bgti_else.50947:
	addi	%a0, %a0, -20
bgti_cont.50948:
	j	bgti_cont.50920
bgti_else.50945:
	addi	%a0, %a0, -10
bgti_cont.50946:
	j	bgti_cont.50920
bgti_else.50943:
bgti_cont.50944:
	j	bgti_cont.50920
bgti_else.50941:
	addi	%a0, %a0, -30
bgti_cont.50942:
	j	bgti_cont.50920
bgti_else.50939:
	addi	%a0, %a0, -20
bgti_cont.50940:
	j	bgti_cont.50920
bgti_else.50937:
	addi	%a0, %a0, -10
bgti_cont.50938:
	j	bgti_cont.50920
bgti_else.50935:
bgti_cont.50936:
	j	bgti_cont.50920
bgti_else.50933:
	addi	%a0, %a0, -30
bgti_cont.50934:
	j	bgti_cont.50920
bgti_else.50931:
	addi	%a0, %a0, -20
bgti_cont.50932:
	j	bgti_cont.50920
bgti_else.50929:
	addi	%a0, %a0, -10
bgti_cont.50930:
	j	bgti_cont.50920
bgti_else.50927:
bgti_cont.50928:
	j	bgti_cont.50920
bgti_else.50925:
	addi	%a0, %a0, -30
bgti_cont.50926:
	j	bgti_cont.50920
bgti_else.50923:
	addi	%a0, %a0, -20
bgti_cont.50924:
	j	bgti_cont.50920
bgti_else.50921:
	addi	%a0, %a0, -10
bgti_cont.50922:
	j	bgti_cont.50920
bgti_else.50919:
bgti_cont.50920:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.50918:
bgt_cont.50884:
	addi	%a2, %zero, 32
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0
	blti	%a3, 10, bgti_else.50951
	blti	%a3, 20, bgti_else.50953
	blti	%a3, 30, bgti_else.50955
	blti	%a3, 40, bgti_else.50957
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50952
	blti	%a3, 20, bgti_else.50961
	blti	%a3, 30, bgti_else.50963
	blti	%a3, 40, bgti_else.50965
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50952
	blti	%a3, 20, bgti_else.50969
	blti	%a3, 30, bgti_else.50971
	blti	%a3, 40, bgti_else.50973
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.50952
	blti	%a3, 20, bgti_else.50977
	blti	%a3, 30, bgti_else.50979
	blti	%a3, 40, bgti_else.50981
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.50952
bgti_else.50981:
	addi	%a3, %a3, -30
bgti_cont.50982:
	j	bgti_cont.50952
bgti_else.50979:
	addi	%a3, %a3, -20
bgti_cont.50980:
	j	bgti_cont.50952
bgti_else.50977:
	addi	%a3, %a3, -10
bgti_cont.50978:
	j	bgti_cont.50952
bgti_else.50975:
bgti_cont.50976:
	j	bgti_cont.50952
bgti_else.50973:
	addi	%a3, %a3, -30
bgti_cont.50974:
	j	bgti_cont.50952
bgti_else.50971:
	addi	%a3, %a3, -20
bgti_cont.50972:
	j	bgti_cont.50952
bgti_else.50969:
	addi	%a3, %a3, -10
bgti_cont.50970:
	j	bgti_cont.50952
bgti_else.50967:
bgti_cont.50968:
	j	bgti_cont.50952
bgti_else.50965:
	addi	%a3, %a3, -30
bgti_cont.50966:
	j	bgti_cont.50952
bgti_else.50963:
	addi	%a3, %a3, -20
bgti_cont.50964:
	j	bgti_cont.50952
bgti_else.50961:
	addi	%a3, %a3, -10
bgti_cont.50962:
	j	bgti_cont.50952
bgti_else.50959:
bgti_cont.50960:
	j	bgti_cont.50952
bgti_else.50957:
	addi	%a3, %a3, -30
bgti_cont.50958:
	j	bgti_cont.50952
bgti_else.50955:
	addi	%a3, %a3, -20
bgti_cont.50956:
	j	bgti_cont.50952
bgti_else.50953:
	addi	%a3, %a3, -10
bgti_cont.50954:
	j	bgti_cont.50952
bgti_else.50951:
bgti_cont.50952:
	blt	%zero, %k0, bgt_else.50983
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.50984
bgt_else.50983:
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%k0, 10, bgti_else.50985
	blti	%k0, 20, bgti_else.50987
	blti	%k0, 30, bgti_else.50989
	blti	%k0, 40, bgti_else.50991
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.50986
	blti	%k0, 20, bgti_else.50995
	blti	%k0, 30, bgti_else.50997
	blti	%k0, 40, bgti_else.50999
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.50986
	blti	%k0, 20, bgti_else.51003
	blti	%k0, 30, bgti_else.51005
	blti	%k0, 40, bgti_else.51007
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.50986
	blti	%k0, 20, bgti_else.51011
	blti	%k0, 30, bgti_else.51013
	blti	%k0, 40, bgti_else.51015
	addi	%v0, %k0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0
	j	bgti_cont.50986
bgti_else.51015:
	addi	%k0, %k0, -30
bgti_cont.51016:
	j	bgti_cont.50986
bgti_else.51013:
	addi	%k0, %k0, -20
bgti_cont.51014:
	j	bgti_cont.50986
bgti_else.51011:
	addi	%k0, %k0, -10
bgti_cont.51012:
	j	bgti_cont.50986
bgti_else.51009:
bgti_cont.51010:
	j	bgti_cont.50986
bgti_else.51007:
	addi	%k0, %k0, -30
bgti_cont.51008:
	j	bgti_cont.50986
bgti_else.51005:
	addi	%k0, %k0, -20
bgti_cont.51006:
	j	bgti_cont.50986
bgti_else.51003:
	addi	%k0, %k0, -10
bgti_cont.51004:
	j	bgti_cont.50986
bgti_else.51001:
bgti_cont.51002:
	j	bgti_cont.50986
bgti_else.50999:
	addi	%k0, %k0, -30
bgti_cont.51000:
	j	bgti_cont.50986
bgti_else.50997:
	addi	%k0, %k0, -20
bgti_cont.50998:
	j	bgti_cont.50986
bgti_else.50995:
	addi	%k0, %k0, -10
bgti_cont.50996:
	j	bgti_cont.50986
bgti_else.50993:
bgti_cont.50994:
	j	bgti_cont.50986
bgti_else.50991:
	addi	%k0, %k0, -30
bgti_cont.50992:
	j	bgti_cont.50986
bgti_else.50989:
	addi	%k0, %k0, -20
bgti_cont.50990:
	j	bgti_cont.50986
bgti_else.50987:
	addi	%k0, %k0, -10
bgti_cont.50988:
	j	bgti_cont.50986
bgti_else.50985:
bgti_cont.50986:
	blt	%zero, %a0, bgt_else.51017
	addi	%v0, %k0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51018
bgt_else.51017:
	blti	%a0, 10, bgti_else.51019
	blti	%a0, 20, bgti_else.51021
	blti	%a0, 30, bgti_else.51023
	blti	%a0, 40, bgti_else.51025
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51020
	blti	%a0, 20, bgti_else.51029
	blti	%a0, 30, bgti_else.51031
	blti	%a0, 40, bgti_else.51033
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51020
	blti	%a0, 20, bgti_else.51037
	blti	%a0, 30, bgti_else.51039
	blti	%a0, 40, bgti_else.51041
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51020
	blti	%a0, 20, bgti_else.51045
	blti	%a0, 30, bgti_else.51047
	blti	%a0, 40, bgti_else.51049
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.51020
bgti_else.51049:
	addi	%a0, %a0, -30
bgti_cont.51050:
	j	bgti_cont.51020
bgti_else.51047:
	addi	%a0, %a0, -20
bgti_cont.51048:
	j	bgti_cont.51020
bgti_else.51045:
	addi	%a0, %a0, -10
bgti_cont.51046:
	j	bgti_cont.51020
bgti_else.51043:
bgti_cont.51044:
	j	bgti_cont.51020
bgti_else.51041:
	addi	%a0, %a0, -30
bgti_cont.51042:
	j	bgti_cont.51020
bgti_else.51039:
	addi	%a0, %a0, -20
bgti_cont.51040:
	j	bgti_cont.51020
bgti_else.51037:
	addi	%a0, %a0, -10
bgti_cont.51038:
	j	bgti_cont.51020
bgti_else.51035:
bgti_cont.51036:
	j	bgti_cont.51020
bgti_else.51033:
	addi	%a0, %a0, -30
bgti_cont.51034:
	j	bgti_cont.51020
bgti_else.51031:
	addi	%a0, %a0, -20
bgti_cont.51032:
	j	bgti_cont.51020
bgti_else.51029:
	addi	%a0, %a0, -10
bgti_cont.51030:
	j	bgti_cont.51020
bgti_else.51027:
bgti_cont.51028:
	j	bgti_cont.51020
bgti_else.51025:
	addi	%a0, %a0, -30
bgti_cont.51026:
	j	bgti_cont.51020
bgti_else.51023:
	addi	%a0, %a0, -20
bgti_cont.51024:
	j	bgti_cont.51020
bgti_else.51021:
	addi	%a0, %a0, -10
bgti_cont.51022:
	j	bgti_cont.51020
bgti_else.51019:
bgti_cont.51020:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %k0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.51018:
bgt_cont.50984:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	blt	%zero, %a2, bgt_else.51051
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51052
bgt_else.51051:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.51053
	blti	%a2, 20, bgti_else.51055
	blti	%a2, 30, bgti_else.51057
	blti	%a2, 40, bgti_else.51059
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51054
	blti	%a2, 20, bgti_else.51063
	blti	%a2, 30, bgti_else.51065
	blti	%a2, 40, bgti_else.51067
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51054
	blti	%a2, 20, bgti_else.51071
	blti	%a2, 30, bgti_else.51073
	blti	%a2, 40, bgti_else.51075
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51054
	blti	%a2, 20, bgti_else.51079
	blti	%a2, 30, bgti_else.51081
	blti	%a2, 40, bgti_else.51083
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.51054
bgti_else.51083:
	addi	%a2, %a2, -30
bgti_cont.51084:
	j	bgti_cont.51054
bgti_else.51081:
	addi	%a2, %a2, -20
bgti_cont.51082:
	j	bgti_cont.51054
bgti_else.51079:
	addi	%a2, %a2, -10
bgti_cont.51080:
	j	bgti_cont.51054
bgti_else.51077:
bgti_cont.51078:
	j	bgti_cont.51054
bgti_else.51075:
	addi	%a2, %a2, -30
bgti_cont.51076:
	j	bgti_cont.51054
bgti_else.51073:
	addi	%a2, %a2, -20
bgti_cont.51074:
	j	bgti_cont.51054
bgti_else.51071:
	addi	%a2, %a2, -10
bgti_cont.51072:
	j	bgti_cont.51054
bgti_else.51069:
bgti_cont.51070:
	j	bgti_cont.51054
bgti_else.51067:
	addi	%a2, %a2, -30
bgti_cont.51068:
	j	bgti_cont.51054
bgti_else.51065:
	addi	%a2, %a2, -20
bgti_cont.51066:
	j	bgti_cont.51054
bgti_else.51063:
	addi	%a2, %a2, -10
bgti_cont.51064:
	j	bgti_cont.51054
bgti_else.51061:
bgti_cont.51062:
	j	bgti_cont.51054
bgti_else.51059:
	addi	%a2, %a2, -30
bgti_cont.51060:
	j	bgti_cont.51054
bgti_else.51057:
	addi	%a2, %a2, -20
bgti_cont.51058:
	j	bgti_cont.51054
bgti_else.51055:
	addi	%a2, %a2, -10
bgti_cont.51056:
	j	bgti_cont.51054
bgti_else.51053:
bgti_cont.51054:
	blt	%zero, %a0, bgt_else.51085
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.51086
bgt_else.51085:
	blti	%a0, 10, bgti_else.51087
	blti	%a0, 20, bgti_else.51089
	blti	%a0, 30, bgti_else.51091
	blti	%a0, 40, bgti_else.51093
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51088
	blti	%a0, 20, bgti_else.51097
	blti	%a0, 30, bgti_else.51099
	blti	%a0, 40, bgti_else.51101
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51088
	blti	%a0, 20, bgti_else.51105
	blti	%a0, 30, bgti_else.51107
	blti	%a0, 40, bgti_else.51109
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51088
	blti	%a0, 20, bgti_else.51113
	blti	%a0, 30, bgti_else.51115
	blti	%a0, 40, bgti_else.51117
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.51088
bgti_else.51117:
	addi	%a0, %a0, -30
bgti_cont.51118:
	j	bgti_cont.51088
bgti_else.51115:
	addi	%a0, %a0, -20
bgti_cont.51116:
	j	bgti_cont.51088
bgti_else.51113:
	addi	%a0, %a0, -10
bgti_cont.51114:
	j	bgti_cont.51088
bgti_else.51111:
bgti_cont.51112:
	j	bgti_cont.51088
bgti_else.51109:
	addi	%a0, %a0, -30
bgti_cont.51110:
	j	bgti_cont.51088
bgti_else.51107:
	addi	%a0, %a0, -20
bgti_cont.51108:
	j	bgti_cont.51088
bgti_else.51105:
	addi	%a0, %a0, -10
bgti_cont.51106:
	j	bgti_cont.51088
bgti_else.51103:
bgti_cont.51104:
	j	bgti_cont.51088
bgti_else.51101:
	addi	%a0, %a0, -30
bgti_cont.51102:
	j	bgti_cont.51088
bgti_else.51099:
	addi	%a0, %a0, -20
bgti_cont.51100:
	j	bgti_cont.51088
bgti_else.51097:
	addi	%a0, %a0, -10
bgti_cont.51098:
	j	bgti_cont.51088
bgti_else.51095:
bgti_cont.51096:
	j	bgti_cont.51088
bgti_else.51093:
	addi	%a0, %a0, -30
bgti_cont.51094:
	j	bgti_cont.51088
bgti_else.51091:
	addi	%a0, %a0, -20
bgti_cont.51092:
	j	bgti_cont.51088
bgti_else.51089:
	addi	%a0, %a0, -10
bgti_cont.51090:
	j	bgti_cont.51088
bgti_else.51087:
bgti_cont.51088:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.51086:
bgt_cont.51052:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	addi	%a1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %a2, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	sw	%v0, 183(%zero)
	lw	%t8, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %t8, 0
	addi	%sp, %sp, 8
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -8
	addi	%v0, %zero, 3
	addi	%sp, %sp, 8
	jal	create_dirvecs.3105
	addi	%sp, %sp, -8
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 460(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 438(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	addi	%sp, %sp, 8
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -8
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	addi	%sp, %sp, 8
	jal	calc_dirvec_rows.3096
	addi	%sp, %sp, -8
	addi	%v1, %zero, 119
	addi	%v0, %t8, 0
	addi	%sp, %sp, 8
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -8
	addi	%v0, %zero, 3
	addi	%sp, %sp, 8
	jal	init_vecset_constants.3110
	addi	%sp, %sp, -8
	flw	%f25, 78(%zero)
	fsw	%f25, 184(%zero)
	flw	%f26, 79(%zero)
	fsw	%f26, 185(%zero)
	flw	%f27, 80(%zero)
	fsw	%f27, 186(%zero)
	lw	%a0, 7(%sp)
	addi	%s2, %a0, -1
	blti	%s2, 0, bgti_else.51119
	lw	%a1, 12(%s2)
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.51121
	beqi	%a0, 2, bnei_else.51123
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f19, 184(%zero)
	flw	%f2, 185(%zero)
	flw	%f21, 186(%zero)
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.51125
	fmul	%f16, %f2, %f21
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f2
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.51126
bnei_else.51125:
bnei_cont.51126:
	lw	%a0, 4(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f19, %f1
	fneg	%f22, %f1
	lw	%a0, 4(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f2, %f1
	fneg	%f20, %f1
	lw	%a0, 4(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.51127
	lw	%a0, 9(%a1)
	flw	%f1, 1(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f16, %f1
	flw	%f18, 473(%zero)
	fmul	%f1, %f1, %f18
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f18
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f16, %f2, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f18
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.51128
bnei_else.51127:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.51128:
	fbne	%f0, %fzero, fbeq_else.51129
	add	%a0, %zero, %k1
	j	fbeq_cont.51130
fbeq_else.51129:
	add	%a0, %zero, %zero
fbeq_cont.51130:
	beqi	%a0, 0, bnei_else.51131
	j	bnei_cont.51132
bnei_else.51131:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.51132:
	sw	%v0, 187(%s2)
	j	bnei_cont.51122
bnei_else.51123:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f1, 184(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 185(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 186(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.51133
	add	%a0, %zero, %zero
	j	fbgt_cont.51134
fbgt_else.51133:
	add	%a0, %zero, %k1
fbgt_cont.51134:
	beqi	%a0, 0, bnei_else.51135
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.51136
bnei_else.51135:
	fsw	%fzero, 0(%v0)
bnei_cont.51136:
	sw	%v0, 187(%s2)
bnei_cont.51124:
	j	bnei_cont.51122
bnei_else.51121:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f1, 184(%zero)
	fbne	%f1, %fzero, fbeq_else.51137
	add	%a0, %zero, %k1
	j	fbeq_cont.51138
fbeq_else.51137:
	add	%a0, %zero, %zero
fbeq_cont.51138:
	beqi	%a0, 0, bnei_else.51139
	fsw	%fzero, 1(%v0)
	j	bnei_cont.51140
bnei_else.51139:
	lw	%a2, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.51141
	add	%a0, %zero, %zero
	j	fbgt_cont.51142
fbgt_else.51141:
	add	%a0, %zero, %k1
fbgt_cont.51142:
	beqi	%a2, 0, bnei_else.51143
	beqi	%a0, 0, bnei_else.51145
	add	%a0, %zero, %zero
	j	bnei_cont.51144
bnei_else.51145:
	add	%a0, %zero, %k1
bnei_cont.51146:
	j	bnei_cont.51144
bnei_else.51143:
bnei_cont.51144:
	lw	%a2, 4(%a1)
	flw	%f0, 0(%a2)
	beqi	%a0, 0, bnei_else.51147
	j	bnei_cont.51148
bnei_else.51147:
	fneg	%f0, %f0
bnei_cont.51148:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.51140:
	flw	%f1, 185(%zero)
	fbne	%f1, %fzero, fbeq_else.51149
	add	%a0, %zero, %k1
	j	fbeq_cont.51150
fbeq_else.51149:
	add	%a0, %zero, %zero
fbeq_cont.51150:
	beqi	%a0, 0, bnei_else.51151
	fsw	%fzero, 3(%v0)
	j	bnei_cont.51152
bnei_else.51151:
	lw	%a2, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.51153
	add	%a0, %zero, %zero
	j	fbgt_cont.51154
fbgt_else.51153:
	add	%a0, %zero, %k1
fbgt_cont.51154:
	beqi	%a2, 0, bnei_else.51155
	beqi	%a0, 0, bnei_else.51157
	add	%a0, %zero, %zero
	j	bnei_cont.51156
bnei_else.51157:
	add	%a0, %zero, %k1
bnei_cont.51158:
	j	bnei_cont.51156
bnei_else.51155:
bnei_cont.51156:
	lw	%a2, 4(%a1)
	flw	%f0, 1(%a2)
	beqi	%a0, 0, bnei_else.51159
	j	bnei_cont.51160
bnei_else.51159:
	fneg	%f0, %f0
bnei_cont.51160:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.51152:
	flw	%f1, 186(%zero)
	fbne	%f1, %fzero, fbeq_else.51161
	add	%a0, %zero, %k1
	j	fbeq_cont.51162
fbeq_else.51161:
	add	%a0, %zero, %zero
fbeq_cont.51162:
	beqi	%a0, 0, bnei_else.51163
	fsw	%fzero, 5(%v0)
	j	bnei_cont.51164
bnei_else.51163:
	lw	%a2, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.51165
	add	%a0, %zero, %zero
	j	fbgt_cont.51166
fbgt_else.51165:
	add	%a0, %zero, %k1
fbgt_cont.51166:
	beqi	%a2, 0, bnei_else.51167
	beqi	%a0, 0, bnei_else.51169
	add	%a0, %zero, %zero
	j	bnei_cont.51168
bnei_else.51169:
	add	%a0, %zero, %k1
bnei_cont.51170:
	j	bnei_cont.51168
bnei_else.51167:
bnei_cont.51168:
	lw	%a1, 4(%a1)
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.51171
	j	bnei_cont.51172
bnei_else.51171:
	fneg	%f0, %f0
bnei_cont.51172:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.51164:
	sw	%v0, 187(%s2)
bnei_cont.51122:
	addi	%v1, %s2, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	j	bgti_cont.51120
bgti_else.51119:
bgti_cont.51120:
	blti	%s2, 0, bgti_else.51173
	lw	%a1, 12(%s2)
	lw	%a0, 2(%a1)
	beqi	%a0, 2, bnei_else.51175
	j	bgti_cont.51174
bnei_else.51175:
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fblt	%f0, %f30, fbgt_else.51177
	add	%a0, %zero, %zero
	j	fbgt_cont.51178
fbgt_else.51177:
	add	%a0, %zero, %k1
fbgt_cont.51178:
	beqi	%a0, 0, bgti_cont.51174
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.51181
	beqi	%a0, 2, bnei_else.51183
	j	bgti_cont.51174
bnei_else.51183:
	sll	%a0, %s2, 2
	addi	%s4, %a0, 1
	lw	%s5, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f28, %f30, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f1, %f25, %f0
	flw	%f0, 1(%a0)
	fmul	%f0, %f26, %f0
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f27, %f0
	fadd	%f18, %f1, %f0
	flw	%f1, 495(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f17, %f0, %f25
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f16, %f0, %f26
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f1, %f0, %f27
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
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f17, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f28, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s4, 0(%a0)
	sw	%a0, 254(%s5)
	addi	%a0, %s5, 1
	sw	%a0, 434(%zero)
bnei_cont.51184:
	j	bgti_cont.51174
bnei_else.51181:
	sll	%s4, %s2, 2
	lw	%s5, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f4, %f30, %f0
	fneg	%f3, %f25
	fneg	%f29, %f26
	fneg	%f28, %f27
	addi	%s6, %s4, 1
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
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f25, 0(%a1)
	fsw	%f29, 1(%a1)
	fsw	%f28, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f4, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%s5)
	addi	%s3, %s5, 1
	addi	%s6, %s4, 2
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
	addi	%sp, %sp, -8
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s7)
	sw	%a1, 0(%s7)
	fsw	%f3, 0(%a1)
	fsw	%f26, 1(%a1)
	fsw	%f28, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s7, 0
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f4, 2(%a0)
	sw	%s7, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%s3)
	addi	%s6, %s5, 2
	addi	%s4, %s4, 3
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
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f3, 0(%a1)
	fsw	%f29, 1(%a1)
	fsw	%f27, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f4, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s4, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%a0, %s5, 3
	sw	%a0, 434(%zero)
bnei_cont.51182:
	j	bgti_cont.51174
bnei_else.51179:
bnei_cont.51180:
bnei_cont.51176:
	j	bgti_cont.51174
bgti_else.51173:
bgti_cont.51174:
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
	addi	%sp, %sp, 8
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -8
	addi	%a2, %zero, 2
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	scan_line.3063
	addi	%sp, %sp, -8
	add	%g0, %zero, %zero
	ret
