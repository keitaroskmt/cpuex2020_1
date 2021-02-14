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
	lui	%f30, 16256
	ori	%f30, %f30, 0
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
	addi	%a1, %zero, 0
	j	fbgt_cont.34009
fbgt_else.34008:
	addi	%a1, %zero, 1
fbgt_cont.34009:
	fblt	%f17, %f19, fbgt_else.34010
	fsub	%f17, %f17, %f19
	j	fbgt_cont.34011
fbgt_else.34010:
fbgt_cont.34011:
	flw	%f20, 479(%zero)
	fblt	%f17, %f20, fbgt_else.34012
	beqi	%a1, 0, bnei_else.34014
	addi	%a1, %zero, 0
	j	fbgt_cont.34013
bnei_else.34014:
	addi	%a1, %zero, 1
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
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
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
	flw	%f22, 470(%zero)
	fblt	%f18, %f22, fbgt_else.34022
	addi	%a1, %zero, 1
	j	fbgt_cont.34023
fbgt_else.34022:
	addi	%a1, %zero, 0
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
	addi	%a1, %zero, 0
	j	fbgt_cont.34055
bnei_else.34056:
	addi	%a1, %zero, 1
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
	fmul	%f23, %f18, %f18
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f23
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.34063
fbgt_else.34062:
	fsub	%f0, %f20, %f18
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
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
	flw	%f24, 1(%v1)
	fabs	%f23, %f24
	fblt	%f23, %f2, fbgt_else.34066
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 481(%zero)
	fblt	%f23, %f1, fbgt_cont.34067
	flw	%f1, 480(%zero)
	fmov	%f0, %f23
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
	fblt	%f23, %f2, fbgt_else.34092
	fblt	%f23, %f1, fbgt_else.34094
	fsub	%f0, %f23, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.34093
fbgt_else.34094:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.34095:
	j	fbgt_cont.34093
fbgt_else.34092:
fbgt_cont.34093:
	fblt	%f23, %f19, fbgt_else.34096
	addi	%a1, %zero, 0
	j	fbgt_cont.34097
fbgt_else.34096:
	addi	%a1, %zero, 1
fbgt_cont.34097:
	fblt	%f23, %f19, fbgt_else.34098
	fsub	%f23, %f23, %f19
	j	fbgt_cont.34099
fbgt_else.34098:
fbgt_cont.34099:
	fblt	%f23, %f20, fbgt_else.34100
	beqi	%a1, 0, bnei_else.34102
	addi	%a1, %zero, 0
	j	fbgt_cont.34101
bnei_else.34102:
	addi	%a1, %zero, 1
bnei_cont.34103:
	j	fbgt_cont.34101
fbgt_else.34100:
fbgt_cont.34101:
	fblt	%f23, %f20, fbgt_else.34104
	fsub	%f23, %f19, %f23
	j	fbgt_cont.34105
fbgt_else.34104:
fbgt_cont.34105:
	fblt	%f21, %f23, fbgt_else.34106
	fmul	%f23, %f23, %f23
	fmul	%f16, %f23, %f23
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.34107
fbgt_else.34106:
	fsub	%f25, %f20, %f23
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
fbgt_cont.34107:
	beqi	%a1, 0, bnei_else.34108
	j	bnei_cont.34109
bnei_else.34108:
	fneg	%f23, %f23
bnei_cont.34109:
	fblt	%f24, %f22, fbgt_else.34110
	addi	%a1, %zero, 1
	j	fbgt_cont.34111
fbgt_else.34110:
	addi	%a1, %zero, 0
fbgt_cont.34111:
	fabs	%f24, %f24
	fblt	%f24, %f2, fbgt_else.34112
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 481(%zero)
	fblt	%f24, %f1, fbgt_cont.34113
	flw	%f1, 480(%zero)
	fmov	%f0, %f24
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
	fblt	%f24, %f2, fbgt_else.34138
	fblt	%f24, %f1, fbgt_else.34140
	fsub	%f0, %f24, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
	j	fbgt_cont.34139
fbgt_else.34140:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
fbgt_cont.34141:
	j	fbgt_cont.34139
fbgt_else.34138:
fbgt_cont.34139:
	fblt	%f24, %f19, fbgt_else.34142
	beqi	%a1, 0, bnei_else.34144
	addi	%a1, %zero, 0
	j	fbgt_cont.34143
bnei_else.34144:
	addi	%a1, %zero, 1
bnei_cont.34145:
	j	fbgt_cont.34143
fbgt_else.34142:
fbgt_cont.34143:
	fblt	%f24, %f19, fbgt_else.34146
	fsub	%f24, %f24, %f19
	j	fbgt_cont.34147
fbgt_else.34146:
fbgt_cont.34147:
	fblt	%f24, %f20, fbgt_else.34148
	fsub	%f24, %f19, %f24
	j	fbgt_cont.34149
fbgt_else.34148:
fbgt_cont.34149:
	fblt	%f21, %f24, fbgt_else.34150
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
	fsub	%f24, %f1, %f0
	j	fbgt_cont.34151
fbgt_else.34150:
	fsub	%f0, %f20, %f24
	fmul	%f24, %f0, %f0
	fmul	%f16, %f24, %f24
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
fbgt_cont.34151:
	beqi	%a1, 0, bnei_else.34152
	j	bnei_cont.34153
bnei_else.34152:
	fneg	%f24, %f24
bnei_cont.34153:
	flw	%f26, 2(%v1)
	fabs	%f25, %f26
	fblt	%f25, %f2, fbgt_else.34154
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 481(%zero)
	fblt	%f25, %f1, fbgt_cont.34155
	flw	%f1, 480(%zero)
	fmov	%f0, %f25
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
	fblt	%f25, %f2, fbgt_else.34180
	fblt	%f25, %f1, fbgt_else.34182
	fsub	%f0, %f25, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.34181
fbgt_else.34182:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.34183:
	j	fbgt_cont.34181
fbgt_else.34180:
fbgt_cont.34181:
	fblt	%f25, %f19, fbgt_else.34184
	addi	%a1, %zero, 0
	j	fbgt_cont.34185
fbgt_else.34184:
	addi	%a1, %zero, 1
fbgt_cont.34185:
	fblt	%f25, %f19, fbgt_else.34186
	fsub	%f25, %f25, %f19
	j	fbgt_cont.34187
fbgt_else.34186:
fbgt_cont.34187:
	fblt	%f25, %f20, fbgt_else.34188
	beqi	%a1, 0, bnei_else.34190
	addi	%a1, %zero, 0
	j	fbgt_cont.34189
bnei_else.34190:
	addi	%a1, %zero, 1
bnei_cont.34191:
	j	fbgt_cont.34189
fbgt_else.34188:
fbgt_cont.34189:
	fblt	%f25, %f20, fbgt_else.34192
	fsub	%f25, %f19, %f25
	j	fbgt_cont.34193
fbgt_else.34192:
fbgt_cont.34193:
	fblt	%f21, %f25, fbgt_else.34194
	fmul	%f25, %f25, %f25
	fmul	%f16, %f25, %f25
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f25
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f25, %f1, %f0
	j	fbgt_cont.34195
fbgt_else.34194:
	fsub	%f27, %f20, %f25
	fmul	%f25, %f27, %f27
	fmul	%f16, %f25, %f25
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f25
	fsub	%f1, %f27, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f25, %f1, %f0
fbgt_cont.34195:
	beqi	%a1, 0, bnei_else.34196
	j	bnei_cont.34197
bnei_else.34196:
	fneg	%f25, %f25
bnei_cont.34197:
	fblt	%f26, %f22, fbgt_else.34198
	addi	%a1, %zero, 1
	j	fbgt_cont.34199
fbgt_else.34198:
	addi	%a1, %zero, 0
fbgt_cont.34199:
	fabs	%f22, %f26
	fblt	%f22, %f2, fbgt_else.34200
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 481(%zero)
	fblt	%f22, %f1, fbgt_cont.34201
	flw	%f1, 480(%zero)
	fmov	%f0, %f22
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
	fblt	%f22, %f2, fbgt_else.34226
	fblt	%f22, %f1, fbgt_else.34228
	fsub	%f0, %f22, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.34227
fbgt_else.34228:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.34229:
	j	fbgt_cont.34227
fbgt_else.34226:
fbgt_cont.34227:
	fblt	%f22, %f19, fbgt_else.34230
	beqi	%a1, 0, bnei_else.34232
	addi	%a1, %zero, 0
	j	fbgt_cont.34231
bnei_else.34232:
	addi	%a1, %zero, 1
bnei_cont.34233:
	j	fbgt_cont.34231
fbgt_else.34230:
fbgt_cont.34231:
	fblt	%f22, %f19, fbgt_else.34234
	fsub	%f22, %f22, %f19
	j	fbgt_cont.34235
fbgt_else.34234:
fbgt_cont.34235:
	fblt	%f22, %f20, fbgt_else.34236
	fsub	%f22, %f19, %f22
	j	fbgt_cont.34237
fbgt_else.34236:
fbgt_cont.34237:
	fblt	%f21, %f22, fbgt_else.34238
	fmul	%f19, %f22, %f22
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f19
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34239
fbgt_else.34238:
	fsub	%f0, %f20, %f22
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
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
	fmul	%f1, %f23, %f25
	fmul	%f2, %f18, %f24
	fmul	%f19, %f2, %f25
	fmul	%f16, %f17, %f0
	fsub	%f20, %f19, %f16
	fmul	%f21, %f17, %f24
	fmul	%f19, %f21, %f25
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f22, %f23, %f0
	fmul	%f2, %f2, %f0
	fmul	%f19, %f17, %f25
	fadd	%f2, %f2, %f19
	fmul	%f19, %f21, %f0
	fmul	%f0, %f18, %f25
	fsub	%f25, %f19, %f0
	fneg	%f24, %f24
	fmul	%f19, %f18, %f23
	fmul	%f23, %f17, %f23
	flw	%f18, 0(%v0)
	flw	%f27, 1(%v0)
	flw	%f26, 2(%v0)
	fmul	%f0, %f1, %f1
	fmul	%f17, %f18, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f24, %f24
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
	fmul	%f0, %f25, %f25
	fmul	%f0, %f27, %f0
	fadd	%f17, %f17, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f17, %f0
	fsw	%f0, 2(%v0)
	flw	%f21, 495(%zero)
	fmul	%f0, %f18, %f20
	fmul	%f17, %f0, %f16
	fmul	%f0, %f27, %f2
	fmul	%f0, %f0, %f25
	fadd	%f17, %f17, %f0
	fmul	%f0, %f26, %f19
	fmul	%f0, %f0, %f23
	fadd	%f0, %f17, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 0(%v1)
	fmul	%f18, %f18, %f1
	fmul	%f1, %f18, %f16
	fmul	%f17, %f27, %f22
	fmul	%f0, %f17, %f25
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f24
	fmul	%f0, %f16, %f23
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
	flw	%f17, 470(%zero)
	addi	%v0, %s1, 0
	fmov	%f0, %f17
	jal	min_caml_create_float_array
	addi	%s2, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s2)
	jal	min_caml_read_float
	fsw	%f0, 1(%s2)
	addi	%s4, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s2)
	addi	%v0, %s1, 0
	fmov	%f0, %f17
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	jal	min_caml_read_float
	fsw	%f0, 2(%s3)
	jal	min_caml_read_float
	fblt	%f0, %f17, fbgt_else.34691
	addi	%s6, %zero, 0
	j	fbgt_cont.34692
fbgt_else.34691:
	addi	%s6, %zero, 1
fbgt_cont.34692:
	addi	%v0, %s4, 0
	fmov	%f0, %f17
	jal	min_caml_create_float_array
	addi	%s4, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s4)
	jal	min_caml_read_float
	fsw	%f0, 1(%s4)
	addi	%v0, %s1, 0
	fmov	%f0, %f17
	jal	min_caml_create_float_array
	addi	%s5, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s5)
	jal	min_caml_read_float
	fsw	%f0, 1(%s5)
	jal	min_caml_read_float
	fsw	%f0, 2(%s5)
	addi	%v0, %s1, 0
	fmov	%f0, %f17
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
	add	%s7, %zero, %s6
	j	bnei_cont.34696
bnei_else.34695:
	addi	%s7, %zero, 1
bnei_cont.34696:
	addi	%v0, %zero, 4
	fmov	%f0, %f17
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%s1, 9(%ra)
	sw	%s5, 8(%ra)
	sw	%s4, 7(%ra)
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
	beqi	%s6, 0, bnei_else.34701
	addi	%a2, %zero, 0
	j	bnei_cont.34702
bnei_else.34701:
	addi	%a2, %zero, 1
bnei_cont.34702:
	flw	%f19, 0(%s2)
	fmul	%f1, %f19, %f19
	flw	%f18, 1(%s2)
	fmul	%f0, %f18, %f18
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s2)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f17, fbeq_else.34703
	addi	%a0, %zero, 1
	j	fbeq_cont.34704
fbeq_else.34703:
	addi	%a0, %zero, 0
fbeq_cont.34704:
	beqi	%a0, 0, bnei_else.34705
	flw	%f1, 474(%zero)
	j	bnei_cont.34706
bnei_else.34705:
	beqi	%a2, 0, bnei_else.34707
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.34708
bnei_else.34707:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.34708:
bnei_cont.34706:
	fmul	%f0, %f19, %f1
	fsw	%f0, 0(%s2)
	fmul	%f0, %f18, %f1
	fsw	%f0, 1(%s2)
	fmul	%f0, %f16, %f1
	fsw	%f0, 2(%s2)
bnei_cont.34700:
	j	bnei_cont.34698
bnei_else.34697:
	flw	%f1, 0(%s2)
	fbne	%f1, %f17, fbeq_else.34709
	addi	%a0, %zero, 1
	j	fbeq_cont.34710
fbeq_else.34709:
	addi	%a0, %zero, 0
fbeq_cont.34710:
	beqi	%a0, 0, bnei_else.34711
	fmov	%f0, %f17
	j	bnei_cont.34712
bnei_else.34711:
	fbne	%f1, %f17, fbeq_else.34713
	addi	%a0, %zero, 1
	j	fbeq_cont.34714
fbeq_else.34713:
	addi	%a0, %zero, 0
fbeq_cont.34714:
	beqi	%a0, 0, bnei_else.34715
	fmov	%f0, %f17
	j	bnei_cont.34716
bnei_else.34715:
	fblt	%f17, %f1, fbgt_else.34717
	addi	%a0, %zero, 0
	j	fbgt_cont.34718
fbgt_else.34717:
	addi	%a0, %zero, 1
fbgt_cont.34718:
	beqi	%a0, 0, bnei_else.34719
	flw	%f0, 474(%zero)
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
	fbne	%f1, %f17, fbeq_else.34721
	addi	%a0, %zero, 1
	j	fbeq_cont.34722
fbeq_else.34721:
	addi	%a0, %zero, 0
fbeq_cont.34722:
	beqi	%a0, 0, bnei_else.34723
	fmov	%f0, %f17
	j	bnei_cont.34724
bnei_else.34723:
	fbne	%f1, %f17, fbeq_else.34725
	addi	%a0, %zero, 1
	j	fbeq_cont.34726
fbeq_else.34725:
	addi	%a0, %zero, 0
fbeq_cont.34726:
	beqi	%a0, 0, bnei_else.34727
	fmov	%f0, %f17
	j	bnei_cont.34728
bnei_else.34727:
	fblt	%f17, %f1, fbgt_else.34729
	addi	%a0, %zero, 0
	j	fbgt_cont.34730
fbgt_else.34729:
	addi	%a0, %zero, 1
fbgt_cont.34730:
	beqi	%a0, 0, bnei_else.34731
	flw	%f0, 474(%zero)
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
	fbne	%f1, %f17, fbeq_else.34733
	addi	%a0, %zero, 1
	j	fbeq_cont.34734
fbeq_else.34733:
	addi	%a0, %zero, 0
fbeq_cont.34734:
	beqi	%a0, 0, bnei_else.34735
	fmov	%f0, %f17
	j	bnei_cont.34736
bnei_else.34735:
	fbne	%f1, %f17, fbeq_else.34737
	addi	%a0, %zero, 1
	j	fbeq_cont.34738
fbeq_else.34737:
	addi	%a0, %zero, 0
fbeq_cont.34738:
	beqi	%a0, 0, bnei_else.34739
	fmov	%f0, %f17
	j	bnei_cont.34740
bnei_else.34739:
	fblt	%f17, %f1, fbgt_else.34741
	addi	%a0, %zero, 0
	j	fbgt_cont.34742
fbgt_else.34741:
	addi	%a0, %zero, 1
fbgt_cont.34742:
	beqi	%a0, 0, bnei_else.34743
	flw	%f0, 474(%zero)
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
	flw	%f19, 0(%s1)
	flw	%f20, 494(%zero)
	fabs	%f18, %f19
	flw	%f2, 493(%zero)
	fblt	%f18, %f2, fbgt_else.34747
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.34748
	flw	%f1, 481(%zero)
	fmov	%f0, %f18
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
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34771
	addi	%a0, %zero, 0
	j	fbgt_cont.34772
fbgt_else.34771:
	addi	%a0, %zero, 1
fbgt_cont.34772:
	fblt	%f0, %f20, fbgt_else.34773
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34774
fbgt_else.34773:
fbgt_cont.34774:
	flw	%f21, 479(%zero)
	fblt	%f0, %f21, fbgt_else.34775
	beqi	%a0, 0, bnei_else.34777
	addi	%a0, %zero, 0
	j	fbgt_cont.34776
bnei_else.34777:
	addi	%a0, %zero, 1
bnei_cont.34778:
	j	fbgt_cont.34776
fbgt_else.34775:
fbgt_cont.34776:
	fblt	%f0, %f21, fbgt_else.34779
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34780
fbgt_else.34779:
fbgt_cont.34780:
	flw	%f22, 478(%zero)
	fblt	%f22, %f0, fbgt_else.34781
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.34782
fbgt_else.34781:
	fsub	%f23, %f21, %f0
	fmul	%f18, %f23, %f23
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.34782:
	beqi	%a0, 0, bnei_else.34783
	j	bnei_cont.34784
bnei_else.34783:
	fneg	%f18, %f18
bnei_cont.34784:
	fblt	%f19, %f17, fbgt_else.34785
	addi	%a0, %zero, 1
	j	fbgt_cont.34786
fbgt_else.34785:
	addi	%a0, %zero, 0
fbgt_cont.34786:
	fabs	%f19, %f19
	fblt	%f19, %f2, fbgt_else.34787
	flw	%f1, 492(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 491(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 490(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 489(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 488(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 487(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 486(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 485(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 484(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 483(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 482(%zero)
	fblt	%f19, %f1, fbgt_cont.34788
	flw	%f1, 481(%zero)
	fmov	%f0, %f19
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
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34811
	beqi	%a0, 0, bnei_else.34813
	addi	%a0, %zero, 0
	j	fbgt_cont.34812
bnei_else.34813:
	addi	%a0, %zero, 1
bnei_cont.34814:
	j	fbgt_cont.34812
fbgt_else.34811:
fbgt_cont.34812:
	fblt	%f0, %f20, fbgt_else.34815
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34816
fbgt_else.34815:
fbgt_cont.34816:
	fblt	%f0, %f21, fbgt_else.34817
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34818
fbgt_else.34817:
fbgt_cont.34818:
	fblt	%f22, %f0, fbgt_else.34819
	fmul	%f23, %f0, %f0
	fmul	%f19, %f23, %f23
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f23
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f19
	fsub	%f19, %f16, %f0
	j	fbgt_cont.34820
fbgt_else.34819:
	fsub	%f0, %f21, %f0
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
fbgt_cont.34820:
	beqi	%a0, 0, bnei_else.34821
	j	bnei_cont.34822
bnei_else.34821:
	fneg	%f19, %f19
bnei_cont.34822:
	flw	%f24, 1(%s1)
	fabs	%f23, %f24
	fblt	%f23, %f2, fbgt_else.34823
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.34824
	flw	%f1, 481(%zero)
	fmov	%f0, %f23
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
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34847
	addi	%a0, %zero, 0
	j	fbgt_cont.34848
fbgt_else.34847:
	addi	%a0, %zero, 1
fbgt_cont.34848:
	fblt	%f0, %f20, fbgt_else.34849
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34850
fbgt_else.34849:
fbgt_cont.34850:
	fblt	%f0, %f21, fbgt_else.34851
	beqi	%a0, 0, bnei_else.34853
	addi	%a0, %zero, 0
	j	fbgt_cont.34852
bnei_else.34853:
	addi	%a0, %zero, 1
bnei_cont.34854:
	j	fbgt_cont.34852
fbgt_else.34851:
fbgt_cont.34852:
	fblt	%f0, %f21, fbgt_else.34855
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34856
fbgt_else.34855:
fbgt_cont.34856:
	fblt	%f22, %f0, fbgt_else.34857
	fmul	%f23, %f0, %f0
	fmul	%f16, %f23, %f23
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.34858
fbgt_else.34857:
	fsub	%f25, %f21, %f0
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
fbgt_cont.34858:
	beqi	%a0, 0, bnei_else.34859
	j	bnei_cont.34860
bnei_else.34859:
	fneg	%f23, %f23
bnei_cont.34860:
	fblt	%f24, %f17, fbgt_else.34861
	addi	%a0, %zero, 1
	j	fbgt_cont.34862
fbgt_else.34861:
	addi	%a0, %zero, 0
fbgt_cont.34862:
	fabs	%f24, %f24
	fblt	%f24, %f2, fbgt_else.34863
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.34864
	flw	%f1, 481(%zero)
	fmov	%f0, %f24
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
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34887
	beqi	%a0, 0, bnei_else.34889
	addi	%a0, %zero, 0
	j	fbgt_cont.34888
bnei_else.34889:
	addi	%a0, %zero, 1
bnei_cont.34890:
	j	fbgt_cont.34888
fbgt_else.34887:
fbgt_cont.34888:
	fblt	%f0, %f20, fbgt_else.34891
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34892
fbgt_else.34891:
fbgt_cont.34892:
	fblt	%f0, %f21, fbgt_else.34893
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34894
fbgt_else.34893:
fbgt_cont.34894:
	fblt	%f22, %f0, fbgt_else.34895
	fmul	%f25, %f0, %f0
	fmul	%f24, %f25, %f25
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f25
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f24
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f24
	fsub	%f24, %f16, %f0
	j	fbgt_cont.34896
fbgt_else.34895:
	fsub	%f0, %f21, %f0
	fmul	%f24, %f0, %f0
	fmul	%f16, %f24, %f24
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
fbgt_cont.34896:
	beqi	%a0, 0, bnei_else.34897
	j	bnei_cont.34898
bnei_else.34897:
	fneg	%f24, %f24
bnei_cont.34898:
	flw	%f26, 2(%s1)
	fabs	%f25, %f26
	fblt	%f25, %f2, fbgt_else.34899
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.34900
	flw	%f1, 481(%zero)
	fmov	%f0, %f25
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
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34923
	addi	%a0, %zero, 0
	j	fbgt_cont.34924
fbgt_else.34923:
	addi	%a0, %zero, 1
fbgt_cont.34924:
	fblt	%f0, %f20, fbgt_else.34925
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34926
fbgt_else.34925:
fbgt_cont.34926:
	fblt	%f0, %f21, fbgt_else.34927
	beqi	%a0, 0, bnei_else.34929
	addi	%a0, %zero, 0
	j	fbgt_cont.34928
bnei_else.34929:
	addi	%a0, %zero, 1
bnei_cont.34930:
	j	fbgt_cont.34928
fbgt_else.34927:
fbgt_cont.34928:
	fblt	%f0, %f21, fbgt_else.34931
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34932
fbgt_else.34931:
fbgt_cont.34932:
	fblt	%f22, %f0, fbgt_else.34933
	fmul	%f25, %f0, %f0
	fmul	%f16, %f25, %f25
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f25
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f25, %f1, %f0
	j	fbgt_cont.34934
fbgt_else.34933:
	fsub	%f27, %f21, %f0
	fmul	%f25, %f27, %f27
	fmul	%f16, %f25, %f25
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f25
	fsub	%f1, %f27, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f27
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f25, %f1, %f0
fbgt_cont.34934:
	beqi	%a0, 0, bnei_else.34935
	j	bnei_cont.34936
bnei_else.34935:
	fneg	%f25, %f25
bnei_cont.34936:
	fblt	%f26, %f17, fbgt_else.34937
	addi	%a0, %zero, 1
	j	fbgt_cont.34938
fbgt_else.34937:
	addi	%a0, %zero, 0
fbgt_cont.34938:
	fabs	%f17, %f26
	fblt	%f17, %f2, fbgt_else.34939
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.34940
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
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
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fblt	%f0, %f20, fbgt_else.34963
	beqi	%a0, 0, bnei_else.34965
	addi	%a0, %zero, 0
	j	fbgt_cont.34964
bnei_else.34965:
	addi	%a0, %zero, 1
bnei_cont.34966:
	j	fbgt_cont.34964
fbgt_else.34963:
fbgt_cont.34964:
	fblt	%f0, %f20, fbgt_else.34967
	fsub	%f0, %f0, %f20
	j	fbgt_cont.34968
fbgt_else.34967:
fbgt_cont.34968:
	fblt	%f0, %f21, fbgt_else.34969
	fsub	%f0, %f20, %f0
	j	fbgt_cont.34970
fbgt_else.34969:
fbgt_cont.34970:
	fblt	%f22, %f0, fbgt_else.34971
	fmul	%f2, %f0, %f0
	fmul	%f17, %f2, %f2
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f2
	fsub	%f16, %f0, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fsub	%f0, %f16, %f0
	j	fbgt_cont.34972
fbgt_else.34971:
	fsub	%f0, %f21, %f0
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.34972:
	beqi	%a0, 0, bnei_else.34973
	j	bnei_cont.34974
bnei_else.34973:
	fneg	%f0, %f0
bnei_cont.34974:
	fmul	%f1, %f23, %f25
	fmul	%f2, %f19, %f24
	fmul	%f17, %f2, %f25
	fmul	%f16, %f18, %f0
	fsub	%f20, %f17, %f16
	fmul	%f22, %f18, %f24
	fmul	%f17, %f22, %f25
	fmul	%f16, %f19, %f0
	fadd	%f16, %f17, %f16
	fmul	%f17, %f23, %f0
	fmul	%f21, %f2, %f0
	fmul	%f2, %f18, %f25
	fadd	%f2, %f21, %f2
	fmul	%f21, %f22, %f0
	fmul	%f0, %f19, %f25
	fsub	%f25, %f21, %f0
	fneg	%f22, %f24
	fmul	%f19, %f19, %f23
	fmul	%f23, %f18, %f23
	flw	%f27, 0(%s2)
	flw	%f26, 1(%s2)
	flw	%f24, 2(%s2)
	fmul	%f0, %f1, %f1
	fmul	%f18, %f27, %f0
	fmul	%f0, %f17, %f17
	fmul	%f0, %f26, %f0
	fadd	%f18, %f18, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f24, %f0
	fadd	%f0, %f18, %f0
	fsw	%f0, 0(%s2)
	fmul	%f0, %f20, %f20
	fmul	%f18, %f27, %f0
	fmul	%f0, %f2, %f2
	fmul	%f0, %f26, %f0
	fadd	%f18, %f18, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f24, %f0
	fadd	%f0, %f18, %f0
	fsw	%f0, 1(%s2)
	fmul	%f0, %f16, %f16
	fmul	%f18, %f27, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f26, %f0
	fadd	%f18, %f18, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f24, %f0
	fadd	%f0, %f18, %f0
	fsw	%f0, 2(%s2)
	flw	%f21, 495(%zero)
	fmul	%f0, %f27, %f20
	fmul	%f18, %f0, %f16
	fmul	%f0, %f26, %f2
	fmul	%f0, %f0, %f25
	fadd	%f18, %f18, %f0
	fmul	%f0, %f24, %f19
	fmul	%f0, %f0, %f23
	fadd	%f0, %f18, %f0
	fmul	%f0, %f21, %f0
	fsw	%f0, 0(%s1)
	fmul	%f18, %f27, %f1
	fmul	%f1, %f18, %f16
	fmul	%f17, %f26, %f17
	fmul	%f0, %f17, %f25
	fadd	%f1, %f1, %f0
	fmul	%f16, %f24, %f22
	fmul	%f0, %f16, %f23
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
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.34690:
	add	%ra, %zero, %a1
	addi	%v0, %zero, 0
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
	flw	%f1, 470(%zero)
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	fsw	%f0, 1(%s1)
	addi	%s3, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s1)
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s2, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s2)
	jal	min_caml_read_float
	fsw	%f0, 1(%s2)
	jal	min_caml_read_float
	fsw	%f0, 2(%s2)
	jal	min_caml_read_float
	fblt	%f0, %f1, fbgt_else.35100
	addi	%s5, %zero, 0
	j	fbgt_cont.35101
fbgt_else.35100:
	addi	%s5, %zero, 1
fbgt_cont.35101:
	addi	%v0, %s3, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s4, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s4)
	jal	min_caml_read_float
	fsw	%f0, 1(%s4)
	jal	min_caml_read_float
	fsw	%f0, 2(%s4)
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	beqi	%k0, 0, bnei_else.35102
	jal	min_caml_read_float
	flw	%f16, 469(%zero)
	fmul	%f0, %f0, %f16
	fsw	%f0, 0(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f16
	fsw	%f0, 1(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f16
	fsw	%f0, 2(%s0)
	j	bnei_cont.35103
bnei_else.35102:
bnei_cont.35103:
	beqi	%a1, 2, bnei_else.35104
	add	%s6, %zero, %s5
	j	bnei_cont.35105
bnei_else.35104:
	addi	%s6, %zero, 1
bnei_cont.35105:
	addi	%v0, %zero, 4
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%s0, 9(%ra)
	sw	%s4, 8(%ra)
	sw	%s3, 7(%ra)
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
	beqi	%s5, 0, bnei_else.35110
	addi	%a1, %zero, 0
	j	bnei_cont.35111
bnei_else.35110:
	addi	%a1, %zero, 1
bnei_cont.35111:
	flw	%f19, 0(%s1)
	fmul	%f16, %f19, %f19
	flw	%f18, 1(%s1)
	fmul	%f0, %f18, %f18
	fadd	%f16, %f16, %f0
	flw	%f17, 2(%s1)
	fmul	%f0, %f17, %f17
	fadd	%f0, %f16, %f0
	fsqrt	%f16, %f0
	fbne	%f16, %f1, fbeq_else.35112
	addi	%a0, %zero, 1
	j	fbeq_cont.35113
fbeq_else.35112:
	addi	%a0, %zero, 0
fbeq_cont.35113:
	beqi	%a0, 0, bnei_else.35114
	flw	%f1, 474(%zero)
	j	bnei_cont.35115
bnei_else.35114:
	beqi	%a1, 0, bnei_else.35116
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f16
	j	bnei_cont.35117
bnei_else.35116:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f16
bnei_cont.35117:
bnei_cont.35115:
	fmul	%f0, %f19, %f1
	fsw	%f0, 0(%s1)
	fmul	%f0, %f18, %f1
	fsw	%f0, 1(%s1)
	fmul	%f0, %f17, %f1
	fsw	%f0, 2(%s1)
bnei_cont.35109:
	j	bnei_cont.35107
bnei_else.35106:
	flw	%f16, 0(%s1)
	fbne	%f16, %f1, fbeq_else.35118
	addi	%a0, %zero, 1
	j	fbeq_cont.35119
fbeq_else.35118:
	addi	%a0, %zero, 0
fbeq_cont.35119:
	beqi	%a0, 0, bnei_else.35120
	fmov	%f0, %f1
	j	bnei_cont.35121
bnei_else.35120:
	fbne	%f16, %f1, fbeq_else.35122
	addi	%a0, %zero, 1
	j	fbeq_cont.35123
fbeq_else.35122:
	addi	%a0, %zero, 0
fbeq_cont.35123:
	beqi	%a0, 0, bnei_else.35124
	fmov	%f0, %f1
	j	bnei_cont.35125
bnei_else.35124:
	fblt	%f1, %f16, fbgt_else.35126
	addi	%a0, %zero, 0
	j	fbgt_cont.35127
fbgt_else.35126:
	addi	%a0, %zero, 1
fbgt_cont.35127:
	beqi	%a0, 0, bnei_else.35128
	flw	%f0, 474(%zero)
	j	bnei_cont.35129
bnei_else.35128:
	flw	%f0, 468(%zero)
bnei_cont.35129:
bnei_cont.35125:
	fmul	%f16, %f16, %f16
	fdiv	%f0, %f0, %f16
bnei_cont.35121:
	fsw	%f0, 0(%s1)
	flw	%f16, 1(%s1)
	fbne	%f16, %f1, fbeq_else.35130
	addi	%a0, %zero, 1
	j	fbeq_cont.35131
fbeq_else.35130:
	addi	%a0, %zero, 0
fbeq_cont.35131:
	beqi	%a0, 0, bnei_else.35132
	fmov	%f0, %f1
	j	bnei_cont.35133
bnei_else.35132:
	fbne	%f16, %f1, fbeq_else.35134
	addi	%a0, %zero, 1
	j	fbeq_cont.35135
fbeq_else.35134:
	addi	%a0, %zero, 0
fbeq_cont.35135:
	beqi	%a0, 0, bnei_else.35136
	fmov	%f0, %f1
	j	bnei_cont.35137
bnei_else.35136:
	fblt	%f1, %f16, fbgt_else.35138
	addi	%a0, %zero, 0
	j	fbgt_cont.35139
fbgt_else.35138:
	addi	%a0, %zero, 1
fbgt_cont.35139:
	beqi	%a0, 0, bnei_else.35140
	flw	%f0, 474(%zero)
	j	bnei_cont.35141
bnei_else.35140:
	flw	%f0, 468(%zero)
bnei_cont.35141:
bnei_cont.35137:
	fmul	%f16, %f16, %f16
	fdiv	%f0, %f0, %f16
bnei_cont.35133:
	fsw	%f0, 1(%s1)
	flw	%f0, 2(%s1)
	fbne	%f0, %f1, fbeq_else.35142
	addi	%a0, %zero, 1
	j	fbeq_cont.35143
fbeq_else.35142:
	addi	%a0, %zero, 0
fbeq_cont.35143:
	beqi	%a0, 0, bnei_else.35144
	j	bnei_cont.35145
bnei_else.35144:
	fbne	%f0, %f1, fbeq_else.35146
	addi	%a0, %zero, 1
	j	fbeq_cont.35147
fbeq_else.35146:
	addi	%a0, %zero, 0
fbeq_cont.35147:
	beqi	%a0, 0, bnei_else.35148
	j	bnei_cont.35149
bnei_else.35148:
	fblt	%f1, %f0, fbgt_else.35150
	addi	%a0, %zero, 0
	j	fbgt_cont.35151
fbgt_else.35150:
	addi	%a0, %zero, 1
fbgt_cont.35151:
	beqi	%a0, 0, bnei_else.35152
	flw	%f1, 474(%zero)
	j	bnei_cont.35153
bnei_else.35152:
	flw	%f1, 468(%zero)
bnei_cont.35153:
bnei_cont.35149:
	fmul	%f0, %f0, %f0
	fdiv	%f1, %f1, %f0
bnei_cont.35145:
	fsw	%f1, 2(%s1)
bnei_cont.35107:
	beqi	%k0, 0, bnei_else.35154
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	rotate_quadratic_matrix.2779
	j	bnei_cont.35155
bnei_else.35154:
bnei_cont.35155:
	addi	%a0, %zero, 1
	j	bnei_cont.35099
bnei_else.35098:
	addi	%a0, %zero, 0
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
	addi	%v0, %zero, 1
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.35315:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.35320
	addi	%a0, %zero, 1
	lw	%a1, 0(%sp)
	addi	%t0, %a1, 1
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
	addi	%v0, %a0, 0
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
	addi	%s3, %zero, 0
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
	addi	%v0, %zero, 1
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.35380:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35385
	sw	%v0, 83(%a2)
	addi	%k0, %zero, 1
	addi	%s2, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.35386
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.35388
	addi	%v0, %zero, 2
	jal	read_net_item.2788
	sw	%s1, 1(%v0)
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
	addi	%v0, %k0, 0
	jal	min_caml_create_array
bnei_cont.35387:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35390
	sw	%v0, 83(%s2)
	addi	%s1, %s2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.35391
	addi	%v0, %k0, 0
	jal	read_net_item.2788
	sw	%a2, 0(%v0)
	j	bnei_cont.35392
bnei_else.35391:
	addi	%v1, %s0, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
bnei_cont.35392:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.35393
	sw	%v0, 83(%s1)
	addi	%a2, %s1, 1
	addi	%v0, %s3, 0
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
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f21, 0(%s1)
	flw	%f22, 1(%s1)
	flw	%f25, 2(%s1)
	fmul	%f16, %f21, %f21
	lw	%a3, 4(%k0)
	flw	%f0, 0(%a3)
	fmul	%f17, %f16, %f0
	fmul	%f16, %f22, %f22
	lw	%a3, 4(%k0)
	flw	%f0, 1(%a3)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f25, %f25
	lw	%a3, 4(%k0)
	flw	%f0, 2(%a3)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	lw	%a3, 3(%k0)
	beqi	%a3, 0, bnei_else.35586
	fmul	%f17, %f22, %f25
	lw	%a3, 9(%k0)
	flw	%f16, 0(%a3)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f0, %f16
	fmul	%f16, %f25, %f21
	lw	%a3, 9(%k0)
	flw	%f0, 1(%a3)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f21, %f22
	lw	%a3, 9(%k0)
	flw	%f0, 2(%a3)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.35587
bnei_else.35586:
bnei_cont.35587:
	lw	%a3, 4(%k0)
	flw	%f16, 0(%a3)
	fmul	%f16, %f21, %f16
	fneg	%f18, %f16
	lw	%a3, 4(%k0)
	flw	%f16, 1(%a3)
	fmul	%f16, %f22, %f16
	fneg	%f24, %f16
	lw	%a3, 4(%k0)
	flw	%f16, 2(%a3)
	fmul	%f16, %f25, %f16
	fneg	%f20, %f16
	fsw	%f0, 0(%v0)
	lw	%a3, 3(%k0)
	beqi	%a3, 0, bnei_else.35588
	lw	%a3, 9(%k0)
	flw	%f2, 1(%a3)
	fmul	%f17, %f25, %f2
	lw	%a3, 9(%k0)
	flw	%f19, 2(%a3)
	fmul	%f16, %f22, %f19
	fadd	%f16, %f17, %f16
	flw	%f23, 473(%zero)
	fmul	%f16, %f16, %f23
	fsub	%f16, %f18, %f16
	fsw	%f16, 1(%v0)
	lw	%a3, 9(%k0)
	flw	%f18, 0(%a3)
	fmul	%f17, %f25, %f18
	fmul	%f16, %f21, %f19
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f23
	fsub	%f16, %f24, %f16
	fsw	%f16, 2(%v0)
	fmul	%f17, %f22, %f18
	fmul	%f16, %f21, %f2
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f23
	fsub	%f16, %f20, %f16
	fsw	%f16, 3(%v0)
	j	bnei_cont.35589
bnei_else.35588:
	fsw	%f18, 1(%v0)
	fsw	%f24, 2(%v0)
	fsw	%f20, 3(%v0)
bnei_cont.35589:
	fbne	%f0, %f1, fbeq_else.35590
	addi	%a3, %zero, 1
	j	fbeq_cont.35591
fbeq_else.35590:
	addi	%a3, %zero, 0
fbeq_cont.35591:
	beqi	%a3, 0, bnei_else.35592
	j	bnei_cont.35593
bnei_else.35592:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35593:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.35583
bnei_else.35584:
	addi	%v0, %zero, 4
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f0, 0(%s1)
	lw	%a3, 4(%k0)
	flw	%f19, 0(%a3)
	fmul	%f16, %f0, %f19
	flw	%f0, 1(%s1)
	lw	%a3, 4(%k0)
	flw	%f18, 1(%a3)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f16, %f0
	flw	%f0, 2(%s1)
	lw	%a3, 4(%k0)
	flw	%f17, 2(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f16, %f0
	fblt	%f1, %f16, fbgt_else.35594
	addi	%a3, %zero, 0
	j	fbgt_cont.35595
fbgt_else.35594:
	addi	%a3, %zero, 1
fbgt_cont.35595:
	beqi	%a3, 0, bnei_else.35596
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f19, %f16
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f18, %f16
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f17, %f16
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.35597
bnei_else.35596:
	fsw	%f1, 0(%v0)
bnei_cont.35597:
	add	%at, %s0, %a1
	sw	%v0, 0(%at)
bnei_cont.35585:
	j	bnei_cont.35583
bnei_else.35582:
	addi	%v0, %zero, 6
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%s1)
	fbne	%f16, %f1, fbeq_else.35598
	addi	%a3, %zero, 1
	j	fbeq_cont.35599
fbeq_else.35598:
	addi	%a3, %zero, 0
fbeq_cont.35599:
	beqi	%a3, 0, bnei_else.35600
	fsw	%f1, 1(%v0)
	j	bnei_cont.35601
bnei_else.35600:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35602
	addi	%a3, %zero, 0
	j	fbgt_cont.35603
fbgt_else.35602:
	addi	%a3, %zero, 1
fbgt_cont.35603:
	beqi	%ra, 0, bnei_else.35604
	beqi	%a3, 0, bnei_else.35606
	addi	%a3, %zero, 0
	j	bnei_cont.35605
bnei_else.35606:
	addi	%a3, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 1(%v0)
bnei_cont.35601:
	flw	%f16, 1(%s1)
	fbne	%f16, %f1, fbeq_else.35610
	addi	%a3, %zero, 1
	j	fbeq_cont.35611
fbeq_else.35610:
	addi	%a3, %zero, 0
fbeq_cont.35611:
	beqi	%a3, 0, bnei_else.35612
	fsw	%f1, 3(%v0)
	j	bnei_cont.35613
bnei_else.35612:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35614
	addi	%a3, %zero, 0
	j	fbgt_cont.35615
fbgt_else.35614:
	addi	%a3, %zero, 1
fbgt_cont.35615:
	beqi	%ra, 0, bnei_else.35616
	beqi	%a3, 0, bnei_else.35618
	addi	%a3, %zero, 0
	j	bnei_cont.35617
bnei_else.35618:
	addi	%a3, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 3(%v0)
bnei_cont.35613:
	flw	%f16, 2(%s1)
	fbne	%f16, %f1, fbeq_else.35622
	addi	%a3, %zero, 1
	j	fbeq_cont.35623
fbeq_else.35622:
	addi	%a3, %zero, 0
fbeq_cont.35623:
	beqi	%a3, 0, bnei_else.35624
	fsw	%f1, 5(%v0)
	j	bnei_cont.35625
bnei_else.35624:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35626
	addi	%a3, %zero, 0
	j	fbgt_cont.35627
fbgt_else.35626:
	addi	%a3, %zero, 1
fbgt_cont.35627:
	beqi	%ra, 0, bnei_else.35628
	beqi	%a3, 0, bnei_else.35630
	addi	%a3, %zero, 0
	j	bnei_cont.35629
bnei_else.35630:
	addi	%a3, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
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
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f19, 0(%s1)
	flw	%f20, 1(%s1)
	flw	%f22, 2(%s1)
	fmul	%f16, %f19, %f19
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fmul	%f17, %f16, %f0
	fmul	%f16, %f20, %f20
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f22, %f22
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	lw	%a1, 3(%k0)
	beqi	%a1, 0, bnei_else.35639
	fmul	%f17, %f20, %f22
	lw	%a1, 9(%k0)
	flw	%f16, 0(%a1)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f0, %f16
	fmul	%f16, %f22, %f19
	lw	%a1, 9(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f19, %f20
	lw	%a1, 9(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.35640
bnei_else.35639:
bnei_cont.35640:
	lw	%a1, 4(%k0)
	flw	%f16, 0(%a1)
	fmul	%f16, %f19, %f16
	fneg	%f23, %f16
	lw	%a1, 4(%k0)
	flw	%f16, 1(%a1)
	fmul	%f16, %f20, %f16
	fneg	%f21, %f16
	lw	%a1, 4(%k0)
	flw	%f16, 2(%a1)
	fmul	%f16, %f22, %f16
	fneg	%f18, %f16
	fsw	%f0, 0(%v0)
	lw	%a1, 3(%k0)
	beqi	%a1, 0, bnei_else.35641
	lw	%a1, 9(%k0)
	flw	%f16, 1(%a1)
	fmul	%f17, %f22, %f16
	lw	%a1, 9(%k0)
	flw	%f16, 2(%a1)
	fmul	%f16, %f20, %f16
	fadd	%f16, %f17, %f16
	flw	%f2, 473(%zero)
	fmul	%f16, %f16, %f2
	fsub	%f16, %f23, %f16
	fsw	%f16, 1(%v0)
	lw	%a1, 9(%k0)
	flw	%f16, 0(%a1)
	fmul	%f17, %f22, %f16
	lw	%a1, 9(%k0)
	flw	%f16, 2(%a1)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f21, %f16
	fsw	%f16, 2(%v0)
	lw	%a1, 9(%k0)
	flw	%f16, 0(%a1)
	fmul	%f17, %f20, %f16
	lw	%a1, 9(%k0)
	flw	%f16, 1(%a1)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f18, %f16
	fsw	%f16, 3(%v0)
	j	bnei_cont.35642
bnei_else.35641:
	fsw	%f23, 1(%v0)
	fsw	%f21, 2(%v0)
	fsw	%f18, 3(%v0)
bnei_cont.35642:
	fbne	%f0, %f1, fbeq_else.35643
	addi	%a1, %zero, 1
	j	fbeq_cont.35644
fbeq_else.35643:
	addi	%a1, %zero, 0
fbeq_cont.35644:
	beqi	%a1, 0, bnei_else.35645
	j	bnei_cont.35646
bnei_else.35645:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35646:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.35636
bnei_else.35637:
	addi	%v0, %zero, 4
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fmul	%f17, %f16, %f0
	flw	%f16, 1(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	flw	%f16, 2(%s1)
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f16, %f17, %f0
	fblt	%f1, %f16, fbgt_else.35647
	addi	%a1, %zero, 0
	j	fbgt_cont.35648
fbgt_else.35647:
	addi	%a1, %zero, 1
fbgt_cont.35648:
	beqi	%a1, 0, bnei_else.35649
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a1, 4(%k0)
	flw	%f0, 2(%a1)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.35650
bnei_else.35649:
	fsw	%f1, 0(%v0)
bnei_cont.35650:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35638:
	j	bnei_cont.35636
bnei_else.35635:
	addi	%v0, %zero, 6
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%s1)
	fbne	%f16, %f1, fbeq_else.35651
	addi	%a1, %zero, 1
	j	fbeq_cont.35652
fbeq_else.35651:
	addi	%a1, %zero, 0
fbeq_cont.35652:
	beqi	%a1, 0, bnei_else.35653
	fsw	%f1, 1(%v0)
	j	bnei_cont.35654
bnei_else.35653:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35655
	addi	%a1, %zero, 0
	j	fbgt_cont.35656
fbgt_else.35655:
	addi	%a1, %zero, 1
fbgt_cont.35656:
	beqi	%ra, 0, bnei_else.35657
	beqi	%a1, 0, bnei_else.35659
	addi	%a1, %zero, 0
	j	bnei_cont.35658
bnei_else.35659:
	addi	%a1, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 1(%v0)
bnei_cont.35654:
	flw	%f16, 1(%s1)
	fbne	%f16, %f1, fbeq_else.35663
	addi	%a1, %zero, 1
	j	fbeq_cont.35664
fbeq_else.35663:
	addi	%a1, %zero, 0
fbeq_cont.35664:
	beqi	%a1, 0, bnei_else.35665
	fsw	%f1, 3(%v0)
	j	bnei_cont.35666
bnei_else.35665:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35667
	addi	%a1, %zero, 0
	j	fbgt_cont.35668
fbgt_else.35667:
	addi	%a1, %zero, 1
fbgt_cont.35668:
	beqi	%ra, 0, bnei_else.35669
	beqi	%a1, 0, bnei_else.35671
	addi	%a1, %zero, 0
	j	bnei_cont.35670
bnei_else.35671:
	addi	%a1, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 3(%v0)
bnei_cont.35666:
	flw	%f16, 2(%s1)
	fbne	%f16, %f1, fbeq_else.35675
	addi	%a1, %zero, 1
	j	fbeq_cont.35676
fbeq_else.35675:
	addi	%a1, %zero, 0
fbeq_cont.35676:
	beqi	%a1, 0, bnei_else.35677
	fsw	%f1, 5(%v0)
	j	bnei_cont.35678
bnei_else.35677:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35679
	addi	%a1, %zero, 0
	j	fbgt_cont.35680
fbgt_else.35679:
	addi	%a1, %zero, 1
fbgt_cont.35680:
	beqi	%ra, 0, bnei_else.35681
	beqi	%a1, 0, bnei_else.35683
	addi	%a1, %zero, 0
	j	bnei_cont.35682
bnei_else.35683:
	addi	%a1, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
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
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f19, 0(%s1)
	flw	%f20, 1(%s1)
	flw	%f22, 2(%s1)
	fmul	%f16, %f19, %f19
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fmul	%f17, %f16, %f0
	fmul	%f16, %f20, %f20
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f22, %f22
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	lw	%a2, 3(%k0)
	beqi	%a2, 0, bnei_else.35794
	fmul	%f17, %f20, %f22
	lw	%a2, 9(%k0)
	flw	%f16, 0(%a2)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f0, %f16
	fmul	%f16, %f22, %f19
	lw	%a2, 9(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f19, %f20
	lw	%a2, 9(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.35795
bnei_else.35794:
bnei_cont.35795:
	lw	%a2, 4(%k0)
	flw	%f16, 0(%a2)
	fmul	%f16, %f19, %f16
	fneg	%f23, %f16
	lw	%a2, 4(%k0)
	flw	%f16, 1(%a2)
	fmul	%f16, %f20, %f16
	fneg	%f21, %f16
	lw	%a2, 4(%k0)
	flw	%f16, 2(%a2)
	fmul	%f16, %f22, %f16
	fneg	%f18, %f16
	fsw	%f0, 0(%v0)
	lw	%a2, 3(%k0)
	beqi	%a2, 0, bnei_else.35796
	lw	%a2, 9(%k0)
	flw	%f16, 1(%a2)
	fmul	%f17, %f22, %f16
	lw	%a2, 9(%k0)
	flw	%f16, 2(%a2)
	fmul	%f16, %f20, %f16
	fadd	%f16, %f17, %f16
	flw	%f2, 473(%zero)
	fmul	%f16, %f16, %f2
	fsub	%f16, %f23, %f16
	fsw	%f16, 1(%v0)
	lw	%a2, 9(%k0)
	flw	%f16, 0(%a2)
	fmul	%f17, %f22, %f16
	lw	%a2, 9(%k0)
	flw	%f16, 2(%a2)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f21, %f16
	fsw	%f16, 2(%v0)
	lw	%a2, 9(%k0)
	flw	%f16, 0(%a2)
	fmul	%f17, %f20, %f16
	lw	%a2, 9(%k0)
	flw	%f16, 1(%a2)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f18, %f16
	fsw	%f16, 3(%v0)
	j	bnei_cont.35797
bnei_else.35796:
	fsw	%f23, 1(%v0)
	fsw	%f21, 2(%v0)
	fsw	%f18, 3(%v0)
bnei_cont.35797:
	fbne	%f0, %f1, fbeq_else.35798
	addi	%a2, %zero, 1
	j	fbeq_cont.35799
fbeq_else.35798:
	addi	%a2, %zero, 0
fbeq_cont.35799:
	beqi	%a2, 0, bnei_else.35800
	j	bnei_cont.35801
bnei_else.35800:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.35801:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.35791
bnei_else.35792:
	addi	%v0, %zero, 4
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fmul	%f17, %f16, %f0
	flw	%f16, 1(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	flw	%f16, 2(%s1)
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fmul	%f0, %f16, %f0
	fadd	%f16, %f17, %f0
	fblt	%f1, %f16, fbgt_else.35802
	addi	%a2, %zero, 0
	j	fbgt_cont.35803
fbgt_else.35802:
	addi	%a2, %zero, 1
fbgt_cont.35803:
	beqi	%a2, 0, bnei_else.35804
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 0(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 0(%a2)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 1(%a2)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a2, 4(%k0)
	flw	%f0, 2(%a2)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.35805
bnei_else.35804:
	fsw	%f1, 0(%v0)
bnei_cont.35805:
	add	%at, %s0, %a3
	sw	%v0, 0(%at)
bnei_cont.35793:
	j	bnei_cont.35791
bnei_else.35790:
	addi	%v0, %zero, 6
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%s1)
	fbne	%f16, %f1, fbeq_else.35806
	addi	%a2, %zero, 1
	j	fbeq_cont.35807
fbeq_else.35806:
	addi	%a2, %zero, 0
fbeq_cont.35807:
	beqi	%a2, 0, bnei_else.35808
	fsw	%f1, 1(%v0)
	j	bnei_cont.35809
bnei_else.35808:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35810
	addi	%a2, %zero, 0
	j	fbgt_cont.35811
fbgt_else.35810:
	addi	%a2, %zero, 1
fbgt_cont.35811:
	beqi	%ra, 0, bnei_else.35812
	beqi	%a2, 0, bnei_else.35814
	addi	%a2, %zero, 0
	j	bnei_cont.35813
bnei_else.35814:
	addi	%a2, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 1(%v0)
bnei_cont.35809:
	flw	%f16, 1(%s1)
	fbne	%f16, %f1, fbeq_else.35818
	addi	%a2, %zero, 1
	j	fbeq_cont.35819
fbeq_else.35818:
	addi	%a2, %zero, 0
fbeq_cont.35819:
	beqi	%a2, 0, bnei_else.35820
	fsw	%f1, 3(%v0)
	j	bnei_cont.35821
bnei_else.35820:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35822
	addi	%a2, %zero, 0
	j	fbgt_cont.35823
fbgt_else.35822:
	addi	%a2, %zero, 1
fbgt_cont.35823:
	beqi	%ra, 0, bnei_else.35824
	beqi	%a2, 0, bnei_else.35826
	addi	%a2, %zero, 0
	j	bnei_cont.35825
bnei_else.35826:
	addi	%a2, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 3(%v0)
bnei_cont.35821:
	flw	%f16, 2(%s1)
	fbne	%f16, %f1, fbeq_else.35830
	addi	%a2, %zero, 1
	j	fbeq_cont.35831
fbeq_else.35830:
	addi	%a2, %zero, 0
fbeq_cont.35831:
	beqi	%a2, 0, bnei_else.35832
	fsw	%f1, 5(%v0)
	j	bnei_cont.35833
bnei_else.35832:
	lw	%ra, 6(%k0)
	fblt	%f16, %f1, fbgt_else.35834
	addi	%a2, %zero, 0
	j	fbgt_cont.35835
fbgt_else.35834:
	addi	%a2, %zero, 1
fbgt_cont.35835:
	beqi	%ra, 0, bnei_else.35836
	beqi	%a2, 0, bnei_else.35838
	addi	%a2, %zero, 0
	j	bnei_cont.35837
bnei_else.35838:
	addi	%a2, %zero, 1
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
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
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
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
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
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.36039:
	lw	%a1, 6(%a1)
	flw	%f17, 470(%zero)
	fblt	%f16, %f17, fbgt_else.36040
	addi	%a0, %zero, 0
	j	fbgt_cont.36041
fbgt_else.36040:
	addi	%a0, %zero, 1
fbgt_cont.36041:
	beqi	%a1, 0, bnei_else.36042
	beqi	%a0, 0, bnei_else.36044
	addi	%a0, %zero, 0
	j	bnei_cont.36043
bnei_else.36044:
	addi	%a0, %zero, 1
bnei_cont.36045:
	j	bnei_cont.36043
bnei_else.36042:
bnei_cont.36043:
	beqi	%a0, 0, bnei_else.36046
	addi	%a0, %zero, 0
	j	bnei_cont.36033
bnei_else.36046:
	addi	%a0, %zero, 1
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
	fadd	%f17, %f17, %f16
	lw	%a1, 6(%a1)
	flw	%f16, 470(%zero)
	fblt	%f17, %f16, fbgt_else.36048
	addi	%a0, %zero, 0
	j	fbgt_cont.36049
fbgt_else.36048:
	addi	%a0, %zero, 1
fbgt_cont.36049:
	beqi	%a1, 0, bnei_else.36050
	beqi	%a0, 0, bnei_else.36052
	addi	%a0, %zero, 0
	j	bnei_cont.36051
bnei_else.36052:
	addi	%a0, %zero, 1
bnei_cont.36053:
	j	bnei_cont.36051
bnei_else.36050:
bnei_cont.36051:
	beqi	%a0, 0, bnei_else.36054
	addi	%a0, %zero, 0
	j	bnei_cont.36033
bnei_else.36054:
	addi	%a0, %zero, 1
bnei_cont.36055:
bnei_cont.36035:
	j	bnei_cont.36033
bnei_else.36032:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36056
	addi	%a0, %zero, 0
	j	fbgt_cont.36057
fbgt_else.36056:
	addi	%a0, %zero, 1
fbgt_cont.36057:
	beqi	%a0, 0, bnei_else.36058
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36060
	addi	%a0, %zero, 0
	j	fbgt_cont.36061
fbgt_else.36060:
	addi	%a0, %zero, 1
fbgt_cont.36061:
	beqi	%a0, 0, bnei_else.36062
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36064
	addi	%a0, %zero, 0
	j	bnei_cont.36059
fbgt_else.36064:
	addi	%a0, %zero, 1
fbgt_cont.36065:
	j	bnei_cont.36059
bnei_else.36062:
	addi	%a0, %zero, 0
bnei_cont.36063:
	j	bnei_cont.36059
bnei_else.36058:
	addi	%a0, %zero, 0
bnei_cont.36059:
	beqi	%a0, 0, bnei_else.36066
	lw	%a0, 6(%a1)
	j	bnei_cont.36067
bnei_else.36066:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36068
	addi	%a0, %zero, 0
	j	bnei_cont.36069
bnei_else.36068:
	addi	%a0, %zero, 1
bnei_cont.36069:
bnei_cont.36067:
bnei_cont.36033:
	beqi	%a0, 0, bnei_else.36070
	addi	%v0, %zero, 0
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
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.36079:
	lw	%a2, 6(%a2)
	flw	%f17, 470(%zero)
	fblt	%f16, %f17, fbgt_else.36080
	addi	%a0, %zero, 0
	j	fbgt_cont.36081
fbgt_else.36080:
	addi	%a0, %zero, 1
fbgt_cont.36081:
	beqi	%a2, 0, bnei_else.36082
	beqi	%a0, 0, bnei_else.36084
	addi	%a0, %zero, 0
	j	bnei_cont.36083
bnei_else.36084:
	addi	%a0, %zero, 1
bnei_cont.36085:
	j	bnei_cont.36083
bnei_else.36082:
bnei_cont.36083:
	beqi	%a0, 0, bnei_else.36086
	addi	%a0, %zero, 0
	j	bnei_cont.36073
bnei_else.36086:
	addi	%a0, %zero, 1
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
	fadd	%f17, %f17, %f16
	lw	%a2, 6(%a2)
	flw	%f16, 470(%zero)
	fblt	%f17, %f16, fbgt_else.36088
	addi	%a0, %zero, 0
	j	fbgt_cont.36089
fbgt_else.36088:
	addi	%a0, %zero, 1
fbgt_cont.36089:
	beqi	%a2, 0, bnei_else.36090
	beqi	%a0, 0, bnei_else.36092
	addi	%a0, %zero, 0
	j	bnei_cont.36091
bnei_else.36092:
	addi	%a0, %zero, 1
bnei_cont.36093:
	j	bnei_cont.36091
bnei_else.36090:
bnei_cont.36091:
	beqi	%a0, 0, bnei_else.36094
	addi	%a0, %zero, 0
	j	bnei_cont.36073
bnei_else.36094:
	addi	%a0, %zero, 1
bnei_cont.36095:
bnei_cont.36075:
	j	bnei_cont.36073
bnei_else.36072:
	fabs	%f17, %f19
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36096
	addi	%a0, %zero, 0
	j	fbgt_cont.36097
fbgt_else.36096:
	addi	%a0, %zero, 1
fbgt_cont.36097:
	beqi	%a0, 0, bnei_else.36098
	fabs	%f17, %f20
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36100
	addi	%a0, %zero, 0
	j	fbgt_cont.36101
fbgt_else.36100:
	addi	%a0, %zero, 1
fbgt_cont.36101:
	beqi	%a0, 0, bnei_else.36102
	fabs	%f17, %f21
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36104
	addi	%a0, %zero, 0
	j	bnei_cont.36099
fbgt_else.36104:
	addi	%a0, %zero, 1
fbgt_cont.36105:
	j	bnei_cont.36099
bnei_else.36102:
	addi	%a0, %zero, 0
bnei_cont.36103:
	j	bnei_cont.36099
bnei_else.36098:
	addi	%a0, %zero, 0
bnei_cont.36099:
	beqi	%a0, 0, bnei_else.36106
	lw	%a0, 6(%a2)
	j	bnei_cont.36107
bnei_else.36106:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.36108
	addi	%a0, %zero, 0
	j	bnei_cont.36109
bnei_else.36108:
	addi	%a0, %zero, 1
bnei_cont.36109:
bnei_cont.36107:
bnei_cont.36073:
	beqi	%a0, 0, bnei_else.36110
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36110:
	addi	%v0, %a1, 1
	j	check_all_inside.2919
bnei_else.36071:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36031:
	addi	%v0, %zero, 1
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
	fsub	%f22, %f19, %f0
	addi	%v0, %zero, 1
	flw	%f16, 139(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f23, %f16, %f0
	flw	%f18, 140(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f24, %f18, %f0
	lw	%a2, 187(%a2)
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36307
	beqi	%a0, 2, bnei_else.36309
	flw	%f21, 0(%a2)
	flw	%f20, 470(%zero)
	fbne	%f21, %f20, fbeq_else.36311
	addi	%a0, %zero, 1
	j	fbeq_cont.36312
fbeq_else.36311:
	addi	%a0, %zero, 0
fbeq_cont.36312:
	beqi	%a0, 0, bnei_else.36313
	addi	%a0, %zero, 0
	j	bnei_cont.36308
bnei_else.36313:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f22
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f24
	fadd	%f2, %f1, %f0
	fmul	%f1, %f22, %f22
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f17, %f1, %f0
	fmul	%f1, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f24, %f24
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.36315
	fmul	%f17, %f23, %f24
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f17, %f1
	fadd	%f17, %f0, %f1
	fmul	%f1, %f24, %f22
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f22, %f23
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
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36318:
	fmul	%f1, %f2, %f2
	fmul	%f0, %f21, %f0
	fsub	%f0, %f1, %f0
	fblt	%f20, %f0, fbgt_else.36319
	addi	%a0, %zero, 0
	j	fbgt_cont.36320
fbgt_else.36319:
	addi	%a0, %zero, 1
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
	addi	%a0, %zero, 1
	j	bnei_cont.36308
bnei_else.36321:
	addi	%a0, %zero, 0
bnei_cont.36322:
bnei_cont.36314:
	j	bnei_cont.36308
bnei_else.36309:
	flw	%f1, 0(%a2)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.36325
	addi	%a0, %zero, 0
	j	fbgt_cont.36326
fbgt_else.36325:
	addi	%a0, %zero, 1
fbgt_cont.36326:
	beqi	%a0, 0, bnei_else.36327
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f22
	flw	%f0, 2(%a2)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f0, %f0, %f24
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36308
bnei_else.36327:
	addi	%a0, %zero, 0
bnei_cont.36328:
bnei_cont.36310:
	j	bnei_cont.36308
bnei_else.36307:
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f22
	flw	%f20, 1(%a2)
	fmul	%f2, %f0, %f20
	flw	%f17, 185(%zero)
	fmul	%f0, %f2, %f17
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36329
	addi	%a0, %zero, 0
	j	fbgt_cont.36330
fbgt_else.36329:
	addi	%a0, %zero, 1
fbgt_cont.36330:
	beqi	%a0, 0, bnei_else.36331
	flw	%f0, 186(%zero)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f24
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36333
	addi	%a0, %zero, 0
	j	fbgt_cont.36334
fbgt_else.36333:
	addi	%a0, %zero, 1
fbgt_cont.36334:
	beqi	%a0, 0, bnei_else.36335
	flw	%f0, 470(%zero)
	fbne	%f20, %f0, fbeq_else.36337
	addi	%a0, %zero, 1
	j	fbeq_cont.36338
fbeq_else.36337:
	addi	%a0, %zero, 0
fbeq_cont.36338:
	beqi	%a0, 0, bnei_else.36339
	addi	%a0, %zero, 0
	j	bnei_cont.36332
bnei_else.36339:
	addi	%a0, %zero, 1
bnei_cont.36340:
	j	bnei_cont.36332
bnei_else.36335:
	addi	%a0, %zero, 0
bnei_cont.36336:
	j	bnei_cont.36332
bnei_else.36331:
	addi	%a0, %zero, 0
bnei_cont.36332:
	beqi	%a0, 0, bnei_else.36341
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36342
bnei_else.36341:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f23
	flw	%f20, 3(%a2)
	fmul	%f21, %f0, %f20
	flw	%f2, 184(%zero)
	fmul	%f0, %f21, %f2
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36343
	addi	%a0, %zero, 0
	j	fbgt_cont.36344
fbgt_else.36343:
	addi	%a0, %zero, 1
fbgt_cont.36344:
	beqi	%a0, 0, bnei_else.36345
	flw	%f0, 186(%zero)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f24
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36347
	addi	%a0, %zero, 0
	j	fbgt_cont.36348
fbgt_else.36347:
	addi	%a0, %zero, 1
fbgt_cont.36348:
	beqi	%a0, 0, bnei_else.36349
	flw	%f0, 470(%zero)
	fbne	%f20, %f0, fbeq_else.36351
	addi	%a0, %zero, 1
	j	fbeq_cont.36352
fbeq_else.36351:
	addi	%a0, %zero, 0
fbeq_cont.36352:
	beqi	%a0, 0, bnei_else.36353
	addi	%a0, %zero, 0
	j	bnei_cont.36346
bnei_else.36353:
	addi	%a0, %zero, 1
bnei_cont.36354:
	j	bnei_cont.36346
bnei_else.36349:
	addi	%a0, %zero, 0
bnei_cont.36350:
	j	bnei_cont.36346
bnei_else.36345:
	addi	%a0, %zero, 0
bnei_cont.36346:
	beqi	%a0, 0, bnei_else.36355
	fsw	%f21, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36356
bnei_else.36355:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f24
	flw	%f21, 5(%a2)
	fmul	%f20, %f0, %f21
	fmul	%f0, %f20, %f2
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36357
	addi	%a0, %zero, 0
	j	fbgt_cont.36358
fbgt_else.36357:
	addi	%a0, %zero, 1
fbgt_cont.36358:
	beqi	%a0, 0, bnei_else.36359
	fmul	%f0, %f20, %f17
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36361
	addi	%a0, %zero, 0
	j	fbgt_cont.36362
fbgt_else.36361:
	addi	%a0, %zero, 1
fbgt_cont.36362:
	beqi	%a0, 0, bnei_else.36363
	flw	%f0, 470(%zero)
	fbne	%f21, %f0, fbeq_else.36365
	addi	%a0, %zero, 1
	j	fbeq_cont.36366
fbeq_else.36365:
	addi	%a0, %zero, 0
fbeq_cont.36366:
	beqi	%a0, 0, bnei_else.36367
	addi	%a0, %zero, 0
	j	bnei_cont.36360
bnei_else.36367:
	addi	%a0, %zero, 1
bnei_cont.36368:
	j	bnei_cont.36360
bnei_else.36363:
	addi	%a0, %zero, 0
bnei_cont.36364:
	j	bnei_cont.36360
bnei_else.36359:
	addi	%a0, %zero, 0
bnei_cont.36360:
	beqi	%a0, 0, bnei_else.36369
	fsw	%f20, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36370
bnei_else.36369:
	addi	%a0, %zero, 0
bnei_cont.36370:
bnei_cont.36356:
bnei_cont.36342:
bnei_cont.36308:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.36371
	flw	%f0, 467(%zero)
	fblt	%f1, %f0, fbgt_else.36373
	addi	%a0, %zero, 0
	j	bnei_cont.36372
fbgt_else.36373:
	addi	%a0, %zero, 1
fbgt_cont.36374:
	j	bnei_cont.36372
bnei_else.36371:
	addi	%a0, %zero, 0
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
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.36385:
	lw	%a1, 6(%a1)
	flw	%f17, 470(%zero)
	fblt	%f16, %f17, fbgt_else.36386
	addi	%a0, %zero, 0
	j	fbgt_cont.36387
fbgt_else.36386:
	addi	%a0, %zero, 1
fbgt_cont.36387:
	beqi	%a1, 0, bnei_else.36388
	beqi	%a0, 0, bnei_else.36390
	addi	%a0, %zero, 0
	j	bnei_cont.36389
bnei_else.36390:
	addi	%a0, %zero, 1
bnei_cont.36391:
	j	bnei_cont.36389
bnei_else.36388:
bnei_cont.36389:
	beqi	%a0, 0, bnei_else.36392
	addi	%a0, %zero, 0
	j	bnei_cont.36379
bnei_else.36392:
	addi	%a0, %zero, 1
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
	fadd	%f17, %f17, %f16
	lw	%a1, 6(%a1)
	flw	%f16, 470(%zero)
	fblt	%f17, %f16, fbgt_else.36394
	addi	%a0, %zero, 0
	j	fbgt_cont.36395
fbgt_else.36394:
	addi	%a0, %zero, 1
fbgt_cont.36395:
	beqi	%a1, 0, bnei_else.36396
	beqi	%a0, 0, bnei_else.36398
	addi	%a0, %zero, 0
	j	bnei_cont.36397
bnei_else.36398:
	addi	%a0, %zero, 1
bnei_cont.36399:
	j	bnei_cont.36397
bnei_else.36396:
bnei_cont.36397:
	beqi	%a0, 0, bnei_else.36400
	addi	%a0, %zero, 0
	j	bnei_cont.36379
bnei_else.36400:
	addi	%a0, %zero, 1
bnei_cont.36401:
bnei_cont.36381:
	j	bnei_cont.36379
bnei_else.36378:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.36402
	addi	%a0, %zero, 0
	j	fbgt_cont.36403
fbgt_else.36402:
	addi	%a0, %zero, 1
fbgt_cont.36403:
	beqi	%a0, 0, bnei_else.36404
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.36406
	addi	%a0, %zero, 0
	j	fbgt_cont.36407
fbgt_else.36406:
	addi	%a0, %zero, 1
fbgt_cont.36407:
	beqi	%a0, 0, bnei_else.36408
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.36410
	addi	%a0, %zero, 0
	j	bnei_cont.36405
fbgt_else.36410:
	addi	%a0, %zero, 1
fbgt_cont.36411:
	j	bnei_cont.36405
bnei_else.36408:
	addi	%a0, %zero, 0
bnei_cont.36409:
	j	bnei_cont.36405
bnei_else.36404:
	addi	%a0, %zero, 0
bnei_cont.36405:
	beqi	%a0, 0, bnei_else.36412
	lw	%a0, 6(%a1)
	j	bnei_cont.36413
bnei_else.36412:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36414
	addi	%a0, %zero, 0
	j	bnei_cont.36415
bnei_else.36414:
	addi	%a0, %zero, 1
bnei_cont.36415:
bnei_cont.36413:
bnei_cont.36379:
	beqi	%a0, 0, bnei_else.36416
	addi	%v0, %zero, 0
	j	bnei_cont.36377
bnei_else.36416:
	jal	check_all_inside.2919
bnei_cont.36417:
	j	bnei_cont.36377
bnei_else.36376:
	addi	%v0, %zero, 1
bnei_cont.36377:
	beqi	%v0, 0, bnei_else.36418
	add	%ra, %zero, %k0
	addi	%v0, %zero, 1
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
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36306:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2928:
	add	%s0, %zero, %v0
	add	%s1, %zero, %v1
	add	%s2, %zero, %ra
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36462
	lw	%v1, 83(%a0)
	addi	%s3, %zero, 0
	addi	%v0, %s3, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36463
	add	%ra, %zero, %s2
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36463:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36464
	lw	%v1, 83(%a0)
	addi	%v0, %s3, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36465
	add	%ra, %zero, %s2
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36465:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36466
	lw	%v1, 83(%a0)
	addi	%v0, %s3, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36467
	add	%ra, %zero, %s2
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36467:
	addi	%s0, %s0, 1
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36468
	lw	%v1, 83(%a0)
	addi	%v0, %s3, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36469
	add	%ra, %zero, %s2
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36469:
	addi	%v0, %s0, 1
	add	%ra, %zero, %s2
	addi	%v1, %s1, 0
	j	shadow_check_one_or_group.2928
bnei_else.36468:
	add	%ra, %zero, %s2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36466:
	add	%ra, %zero, %s2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36464:
	add	%ra, %zero, %s2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36462:
	add	%ra, %zero, %s2
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	add	%at, %s5, %s4
	lw	%t7, 0(%at)
	addi	%s7, %zero, 0
	lw	%a1, 0(%t7)
	beqi	%a1, -1, bnei_else.36644
	beqi	%a1, 99, bnei_else.36645
	lw	%a2, 12(%a1)
	flw	%f1, 138(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 0(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 1(%a0)
	fsub	%f20, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 2(%a0)
	fsub	%f21, %f1, %f0
	lw	%a1, 187(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.36647
	beqi	%a0, 2, bnei_else.36649
	flw	%f19, 0(%a1)
	flw	%f18, 470(%zero)
	fbne	%f19, %f18, fbeq_else.36651
	addi	%a0, %zero, 1
	j	fbeq_cont.36652
fbeq_else.36651:
	addi	%a0, %zero, 0
fbeq_cont.36652:
	beqi	%a0, 0, bnei_else.36653
	addi	%a0, %zero, 0
	j	bnei_cont.36648
bnei_else.36653:
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f21
	fadd	%f17, %f1, %f0
	fmul	%f1, %f2, %f2
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f20, %f20
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
	beqi	%a0, 0, bnei_else.36655
	fmul	%f16, %f20, %f21
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f2
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f2, %f20
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
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36658:
	fmul	%f1, %f17, %f17
	fmul	%f0, %f19, %f0
	fsub	%f0, %f1, %f0
	fblt	%f18, %f0, fbgt_else.36659
	addi	%a0, %zero, 0
	j	fbgt_cont.36660
fbgt_else.36659:
	addi	%a0, %zero, 1
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
	addi	%a0, %zero, 1
	j	bnei_cont.36648
bnei_else.36661:
	addi	%a0, %zero, 0
bnei_cont.36662:
bnei_cont.36654:
	j	bnei_cont.36648
bnei_else.36649:
	flw	%f1, 0(%a1)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.36665
	addi	%a0, %zero, 0
	j	fbgt_cont.36666
fbgt_else.36665:
	addi	%a0, %zero, 1
fbgt_cont.36666:
	beqi	%a0, 0, bnei_else.36667
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%a1)
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f0, %f0, %f21
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36648
bnei_else.36667:
	addi	%a0, %zero, 0
bnei_cont.36668:
bnei_cont.36650:
	j	bnei_cont.36648
bnei_else.36647:
	flw	%f0, 0(%a1)
	fsub	%f0, %f0, %f2
	flw	%f18, 1(%a1)
	fmul	%f17, %f0, %f18
	flw	%f16, 185(%zero)
	fmul	%f0, %f17, %f16
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36669
	addi	%a0, %zero, 0
	j	fbgt_cont.36670
fbgt_else.36669:
	addi	%a0, %zero, 1
fbgt_cont.36670:
	beqi	%a0, 0, bnei_else.36671
	flw	%f0, 186(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36673
	addi	%a0, %zero, 0
	j	fbgt_cont.36674
fbgt_else.36673:
	addi	%a0, %zero, 1
fbgt_cont.36674:
	beqi	%a0, 0, bnei_else.36675
	flw	%f0, 470(%zero)
	fbne	%f18, %f0, fbeq_else.36677
	addi	%a0, %zero, 1
	j	fbeq_cont.36678
fbeq_else.36677:
	addi	%a0, %zero, 0
fbeq_cont.36678:
	beqi	%a0, 0, bnei_else.36679
	addi	%a0, %zero, 0
	j	bnei_cont.36672
bnei_else.36679:
	addi	%a0, %zero, 1
bnei_cont.36680:
	j	bnei_cont.36672
bnei_else.36675:
	addi	%a0, %zero, 0
bnei_cont.36676:
	j	bnei_cont.36672
bnei_else.36671:
	addi	%a0, %zero, 0
bnei_cont.36672:
	beqi	%a0, 0, bnei_else.36681
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36682
bnei_else.36681:
	flw	%f0, 2(%a1)
	fsub	%f0, %f0, %f20
	flw	%f18, 3(%a1)
	fmul	%f17, %f0, %f18
	flw	%f19, 184(%zero)
	fmul	%f0, %f17, %f19
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36683
	addi	%a0, %zero, 0
	j	fbgt_cont.36684
fbgt_else.36683:
	addi	%a0, %zero, 1
fbgt_cont.36684:
	beqi	%a0, 0, bnei_else.36685
	flw	%f0, 186(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.36687
	addi	%a0, %zero, 0
	j	fbgt_cont.36688
fbgt_else.36687:
	addi	%a0, %zero, 1
fbgt_cont.36688:
	beqi	%a0, 0, bnei_else.36689
	flw	%f0, 470(%zero)
	fbne	%f18, %f0, fbeq_else.36691
	addi	%a0, %zero, 1
	j	fbeq_cont.36692
fbeq_else.36691:
	addi	%a0, %zero, 0
fbeq_cont.36692:
	beqi	%a0, 0, bnei_else.36693
	addi	%a0, %zero, 0
	j	bnei_cont.36686
bnei_else.36693:
	addi	%a0, %zero, 1
bnei_cont.36694:
	j	bnei_cont.36686
bnei_else.36689:
	addi	%a0, %zero, 0
bnei_cont.36690:
	j	bnei_cont.36686
bnei_else.36685:
	addi	%a0, %zero, 0
bnei_cont.36686:
	beqi	%a0, 0, bnei_else.36695
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36696
bnei_else.36695:
	flw	%f0, 4(%a1)
	fsub	%f0, %f0, %f21
	flw	%f18, 5(%a1)
	fmul	%f17, %f0, %f18
	fmul	%f0, %f17, %f19
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.36697
	addi	%a0, %zero, 0
	j	fbgt_cont.36698
fbgt_else.36697:
	addi	%a0, %zero, 1
fbgt_cont.36698:
	beqi	%a0, 0, bnei_else.36699
	fmul	%f0, %f17, %f16
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.36701
	addi	%a0, %zero, 0
	j	fbgt_cont.36702
fbgt_else.36701:
	addi	%a0, %zero, 1
fbgt_cont.36702:
	beqi	%a0, 0, bnei_else.36703
	flw	%f0, 470(%zero)
	fbne	%f18, %f0, fbeq_else.36705
	addi	%a0, %zero, 1
	j	fbeq_cont.36706
fbeq_else.36705:
	addi	%a0, %zero, 0
fbeq_cont.36706:
	beqi	%a0, 0, bnei_else.36707
	addi	%a0, %zero, 0
	j	bnei_cont.36700
bnei_else.36707:
	addi	%a0, %zero, 1
bnei_cont.36708:
	j	bnei_cont.36700
bnei_else.36703:
	addi	%a0, %zero, 0
bnei_cont.36704:
	j	bnei_cont.36700
bnei_else.36699:
	addi	%a0, %zero, 0
bnei_cont.36700:
	beqi	%a0, 0, bnei_else.36709
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36710
bnei_else.36709:
	addi	%a0, %zero, 0
bnei_cont.36710:
bnei_cont.36696:
bnei_cont.36682:
bnei_cont.36648:
	beqi	%a0, 0, bnei_else.36711
	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	fblt	%f1, %f0, fbgt_else.36713
	addi	%a0, %zero, 0
	j	fbgt_cont.36714
fbgt_else.36713:
	addi	%a0, %zero, 1
fbgt_cont.36714:
	beqi	%a0, 0, bnei_else.36715
	lw	%a0, 1(%t7)
	beqi	%a0, -1, bnei_else.36717
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36719
	addi	%v0, %zero, 1
	j	bnei_cont.36718
bnei_else.36719:
	lw	%a0, 2(%t7)
	beqi	%a0, -1, bnei_else.36721
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36723
	addi	%v0, %zero, 1
	j	bnei_cont.36718
bnei_else.36723:
	lw	%a0, 3(%t7)
	beqi	%a0, -1, bnei_else.36725
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36727
	addi	%v0, %zero, 1
	j	bnei_cont.36718
bnei_else.36727:
	addi	%v0, %zero, 4
	addi	%v1, %t7, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.36728:
	j	bnei_cont.36718
bnei_else.36725:
	addi	%v0, %zero, 0
bnei_cont.36726:
bnei_cont.36724:
	j	bnei_cont.36718
bnei_else.36721:
	addi	%v0, %zero, 0
bnei_cont.36722:
bnei_cont.36720:
	j	bnei_cont.36718
bnei_else.36717:
	addi	%v0, %zero, 0
bnei_cont.36718:
	beqi	%v0, 0, bnei_else.36729
	addi	%a0, %zero, 1
	j	bnei_cont.36646
bnei_else.36729:
	addi	%a0, %zero, 0
bnei_cont.36730:
	j	bnei_cont.36646
bnei_else.36715:
	addi	%a0, %zero, 0
bnei_cont.36716:
	j	bnei_cont.36646
bnei_else.36711:
	addi	%a0, %zero, 0
bnei_cont.36712:
	j	bnei_cont.36646
bnei_else.36645:
	addi	%a0, %zero, 1
bnei_cont.36646:
	beqi	%a0, 0, bnei_else.36731
	lw	%a0, 1(%t7)
	beqi	%a0, -1, bnei_else.36732
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36734
	addi	%v0, %zero, 1
	j	bnei_cont.36733
bnei_else.36734:
	lw	%a0, 2(%t7)
	beqi	%a0, -1, bnei_else.36736
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36738
	addi	%v0, %zero, 1
	j	bnei_cont.36733
bnei_else.36738:
	lw	%a0, 3(%t7)
	beqi	%a0, -1, bnei_else.36740
	lw	%v1, 83(%a0)
	addi	%v0, %s7, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.36742
	addi	%v0, %zero, 1
	j	bnei_cont.36733
bnei_else.36742:
	addi	%v0, %zero, 4
	addi	%v1, %t7, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.36743:
	j	bnei_cont.36733
bnei_else.36740:
	addi	%v0, %zero, 0
bnei_cont.36741:
bnei_cont.36739:
	j	bnei_cont.36733
bnei_else.36736:
	addi	%v0, %zero, 0
bnei_cont.36737:
bnei_cont.36735:
	j	bnei_cont.36733
bnei_else.36732:
	addi	%v0, %zero, 0
bnei_cont.36733:
	beqi	%v0, 0, bnei_else.36744
	add	%ra, %zero, %s6
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36744:
	addi	%v0, %s4, 1
	add	%ra, %zero, %s6
	addi	%v1, %s5, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.36731:
	addi	%v0, %s4, 1
	add	%ra, %zero, %s6
	addi	%v1, %s5, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.36644:
	add	%ra, %zero, %s6
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2934:
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra
	add	%at, %v1, %a3
	lw	%s1, 0(%at)
	beqi	%s1, -1, bnei_else.36990
	lw	%a1, 12(%s1)
	flw	%f2, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f2, %f0
	addi	%v0, %zero, 1
	flw	%f18, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f22, %f18, %f0
	flw	%f17, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f24, %f17, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.36991
	beqi	%a0, 2, bnei_else.36993
	flw	%f29, 0(%k0)
	flw	%f28, 1(%k0)
	flw	%f3, 2(%k0)
	fmul	%f0, %f29, %f29
	lw	%a0, 4(%a1)
	flw	%f26, 0(%a0)
	fmul	%f1, %f0, %f26
	fmul	%f0, %f28, %f28
	lw	%a0, 4(%a1)
	flw	%f25, 1(%a0)
	fmul	%f0, %f0, %f25
	fadd	%f1, %f1, %f0
	fmul	%f0, %f3, %f3
	lw	%a0, 4(%a1)
	flw	%f23, 2(%a0)
	fmul	%f0, %f0, %f23
	fadd	%f0, %f1, %f0
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.36995
	fmul	%f16, %f28, %f3
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f3, %f29
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f29, %f28
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.36996
bnei_else.36995:
bnei_cont.36996:
	flw	%f21, 470(%zero)
	fbne	%f0, %f21, fbeq_else.36997
	addi	%a0, %zero, 1
	j	fbeq_cont.36998
fbeq_else.36997:
	addi	%a0, %zero, 0
fbeq_cont.36998:
	beqi	%a0, 0, bnei_else.36999
	addi	%s2, %zero, 0
	j	bnei_cont.36992
bnei_else.36999:
	fmul	%f1, %f29, %f19
	fmul	%f16, %f1, %f26
	fmul	%f1, %f28, %f22
	fmul	%f1, %f1, %f25
	fadd	%f16, %f16, %f1
	fmul	%f1, %f3, %f24
	fmul	%f1, %f1, %f23
	fadd	%f1, %f16, %f1
	beqi	%a2, 0, bnei_else.37001
	fmul	%f20, %f3, %f22
	fmul	%f16, %f28, %f24
	fadd	%f20, %f20, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f27, %f20, %f16
	fmul	%f20, %f29, %f24
	fmul	%f16, %f3, %f19
	fadd	%f20, %f20, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f20, %f16
	fadd	%f27, %f27, %f16
	fmul	%f20, %f29, %f22
	fmul	%f16, %f28, %f19
	fadd	%f20, %f20, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f20, %f16
	fadd	%f20, %f27, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f20, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.37002
bnei_else.37001:
bnei_cont.37002:
	fmul	%f16, %f19, %f19
	fmul	%f20, %f16, %f26
	fmul	%f16, %f22, %f22
	fmul	%f16, %f16, %f25
	fadd	%f20, %f20, %f16
	fmul	%f16, %f24, %f24
	fmul	%f16, %f16, %f23
	fadd	%f16, %f20, %f16
	beqi	%a2, 0, bnei_else.37003
	fmul	%f23, %f22, %f24
	lw	%a0, 9(%a1)
	flw	%f20, 0(%a0)
	fmul	%f20, %f23, %f20
	fadd	%f23, %f16, %f20
	fmul	%f20, %f24, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f20, %f16
	fadd	%f20, %f23, %f16
	fmul	%f19, %f19, %f22
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f20, %f16
	j	bnei_cont.37004
bnei_else.37003:
bnei_cont.37004:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.37005
	j	bnei_cont.37006
bnei_else.37005:
	flw	%f19, 474(%zero)
	fsub	%f16, %f16, %f19
bnei_cont.37006:
	fmul	%f19, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f19, %f16
	fblt	%f21, %f16, fbgt_else.37007
	addi	%a0, %zero, 0
	j	fbgt_cont.37008
fbgt_else.37007:
	addi	%a0, %zero, 1
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
	addi	%s2, %zero, 1
	j	bnei_cont.36992
bnei_else.37009:
	addi	%s2, %zero, 0
bnei_cont.37010:
bnei_cont.37000:
	j	bnei_cont.36992
bnei_else.36993:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%k0)
	flw	%f23, 0(%a0)
	fmul	%f1, %f0, %f23
	flw	%f0, 1(%k0)
	flw	%f21, 1(%a0)
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f20, 2(%a0)
	fmul	%f0, %f0, %f20
	fadd	%f16, %f1, %f0
	flw	%f0, 470(%zero)
	fblt	%f0, %f16, fbgt_else.37013
	addi	%a0, %zero, 0
	j	fbgt_cont.37014
fbgt_else.37013:
	addi	%a0, %zero, 1
fbgt_cont.37014:
	beqi	%a0, 0, bnei_else.37015
	fmul	%f1, %f23, %f19
	fmul	%f0, %f21, %f22
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f24
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	addi	%s2, %zero, 1
	j	bnei_cont.36992
bnei_else.37015:
	addi	%s2, %zero, 0
bnei_cont.37016:
bnei_cont.36994:
	j	bnei_cont.36992
bnei_else.36991:
	flw	%f20, 0(%k0)
	flw	%f21, 470(%zero)
	fbne	%f20, %f21, fbeq_else.37017
	addi	%a0, %zero, 1
	j	fbeq_cont.37018
fbeq_else.37017:
	addi	%a0, %zero, 0
fbeq_cont.37018:
	beqi	%a0, 0, bnei_else.37019
	addi	%a0, %zero, 0
	j	bnei_cont.37020
bnei_else.37019:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f20, %f21, fbgt_else.37021
	addi	%a0, %zero, 0
	j	fbgt_cont.37022
fbgt_else.37021:
	addi	%a0, %zero, 1
fbgt_cont.37022:
	beqi	%a2, 0, bnei_else.37023
	beqi	%a0, 0, bnei_else.37025
	addi	%a0, %zero, 0
	j	bnei_cont.37024
bnei_else.37025:
	addi	%a0, %zero, 1
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
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f20
	flw	%f0, 1(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	flw	%f0, 1(%ra)
	fblt	%f1, %f0, fbgt_else.37029
	addi	%a0, %zero, 0
	j	fbgt_cont.37030
fbgt_else.37029:
	addi	%a0, %zero, 1
fbgt_cont.37030:
	beqi	%a0, 0, bnei_else.37031
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f24
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37033
	addi	%a0, %zero, 0
	j	fbgt_cont.37034
fbgt_else.37033:
	addi	%a0, %zero, 1
fbgt_cont.37034:
	beqi	%a0, 0, bnei_else.37035
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.37032
bnei_else.37035:
	addi	%a0, %zero, 0
bnei_cont.37036:
	j	bnei_cont.37032
bnei_else.37031:
	addi	%a0, %zero, 0
bnei_cont.37032:
bnei_cont.37020:
	beqi	%a0, 0, bnei_else.37037
	addi	%s2, %zero, 1
	j	bnei_cont.37038
bnei_else.37037:
	flw	%f16, 1(%k0)
	fbne	%f16, %f21, fbeq_else.37039
	addi	%a0, %zero, 1
	j	fbeq_cont.37040
fbeq_else.37039:
	addi	%a0, %zero, 0
fbeq_cont.37040:
	beqi	%a0, 0, bnei_else.37041
	addi	%a0, %zero, 0
	j	bnei_cont.37042
bnei_else.37041:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %f21, fbgt_else.37043
	addi	%a0, %zero, 0
	j	fbgt_cont.37044
fbgt_else.37043:
	addi	%a0, %zero, 1
fbgt_cont.37044:
	beqi	%a2, 0, bnei_else.37045
	beqi	%a0, 0, bnei_else.37047
	addi	%a0, %zero, 0
	j	bnei_cont.37046
bnei_else.37047:
	addi	%a0, %zero, 1
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
	fdiv	%f23, %f0, %f16
	flw	%f0, 2(%k0)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f24
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.37051
	addi	%a0, %zero, 0
	j	fbgt_cont.37052
fbgt_else.37051:
	addi	%a0, %zero, 1
fbgt_cont.37052:
	beqi	%a0, 0, bnei_else.37053
	fmul	%f0, %f23, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%ra)
	fblt	%f1, %f0, fbgt_else.37055
	addi	%a0, %zero, 0
	j	fbgt_cont.37056
fbgt_else.37055:
	addi	%a0, %zero, 1
fbgt_cont.37056:
	beqi	%a0, 0, bnei_else.37057
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.37054
bnei_else.37057:
	addi	%a0, %zero, 0
bnei_cont.37058:
	j	bnei_cont.37054
bnei_else.37053:
	addi	%a0, %zero, 0
bnei_cont.37054:
bnei_cont.37042:
	beqi	%a0, 0, bnei_else.37059
	addi	%s2, %zero, 2
	j	bnei_cont.37060
bnei_else.37059:
	flw	%f1, 2(%k0)
	fbne	%f1, %f21, fbeq_else.37061
	addi	%a0, %zero, 1
	j	fbeq_cont.37062
fbeq_else.37061:
	addi	%a0, %zero, 0
fbeq_cont.37062:
	beqi	%a0, 0, bnei_else.37063
	addi	%a0, %zero, 0
	j	bnei_cont.37064
bnei_else.37063:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f1, %f21, fbgt_else.37065
	addi	%a0, %zero, 0
	j	fbgt_cont.37066
fbgt_else.37065:
	addi	%a0, %zero, 1
fbgt_cont.37066:
	beqi	%a2, 0, bnei_else.37067
	beqi	%a0, 0, bnei_else.37069
	addi	%a0, %zero, 0
	j	bnei_cont.37068
bnei_else.37069:
	addi	%a0, %zero, 1
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
	fsub	%f0, %f0, %f24
	fdiv	%f21, %f0, %f1
	fmul	%f0, %f21, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%ra)
	fblt	%f1, %f0, fbgt_else.37073
	addi	%a0, %zero, 0
	j	fbgt_cont.37074
fbgt_else.37073:
	addi	%a0, %zero, 1
fbgt_cont.37074:
	beqi	%a0, 0, bnei_else.37075
	fmul	%f0, %f21, %f16
	fadd	%f0, %f0, %f22
	fabs	%f1, %f0
	flw	%f0, 1(%ra)
	fblt	%f1, %f0, fbgt_else.37077
	addi	%a0, %zero, 0
	j	fbgt_cont.37078
fbgt_else.37077:
	addi	%a0, %zero, 1
fbgt_cont.37078:
	beqi	%a0, 0, bnei_else.37079
	fsw	%f21, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.37076
bnei_else.37079:
	addi	%a0, %zero, 0
bnei_cont.37080:
	j	bnei_cont.37076
bnei_else.37075:
	addi	%a0, %zero, 0
bnei_cont.37076:
bnei_cont.37064:
	beqi	%a0, 0, bnei_else.37081
	addi	%s2, %zero, 3
	j	bnei_cont.37082
bnei_else.37081:
	addi	%s2, %zero, 0
bnei_cont.37082:
bnei_cont.37060:
bnei_cont.37038:
bnei_cont.36992:
	beqi	%s2, 0, bnei_else.37083
	flw	%f1, 135(%zero)
	flw	%f19, 470(%zero)
	fblt	%f19, %f1, fbgt_else.37084
	addi	%a0, %zero, 0
	j	fbgt_cont.37085
fbgt_else.37084:
	addi	%a0, %zero, 1
fbgt_cont.37085:
	beqi	%a0, 0, bnei_else.37086
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.37088
	addi	%a0, %zero, 0
	j	fbgt_cont.37089
fbgt_else.37088:
	addi	%a0, %zero, 1
fbgt_cont.37089:
	beqi	%a0, 0, bnei_cont.37087
	flw	%f0, 466(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%k0)
	fmul	%f0, %f0, %f22
	fadd	%f0, %f0, %f2
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
	fsub	%f20, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f21, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f23, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.37094
	beqi	%a0, 2, bnei_else.37096
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.37098
	fmul	%f18, %f21, %f23
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f23, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f20, %f21
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
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.37101:
	lw	%a1, 6(%a1)
	fblt	%f16, %f19, fbgt_else.37102
	addi	%a0, %zero, 0
	j	fbgt_cont.37103
fbgt_else.37102:
	addi	%a0, %zero, 1
fbgt_cont.37103:
	beqi	%a1, 0, bnei_else.37104
	beqi	%a0, 0, bnei_else.37106
	addi	%a0, %zero, 0
	j	bnei_cont.37105
bnei_else.37106:
	addi	%a0, %zero, 1
bnei_cont.37107:
	j	bnei_cont.37105
bnei_else.37104:
bnei_cont.37105:
	beqi	%a0, 0, bnei_else.37108
	addi	%a0, %zero, 0
	j	bnei_cont.37095
bnei_else.37108:
	addi	%a0, %zero, 1
bnei_cont.37109:
	j	bnei_cont.37095
bnei_else.37096:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f20
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f23
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %f19, fbgt_else.37110
	addi	%a0, %zero, 0
	j	fbgt_cont.37111
fbgt_else.37110:
	addi	%a0, %zero, 1
fbgt_cont.37111:
	beqi	%a1, 0, bnei_else.37112
	beqi	%a0, 0, bnei_else.37114
	addi	%a0, %zero, 0
	j	bnei_cont.37113
bnei_else.37114:
	addi	%a0, %zero, 1
bnei_cont.37115:
	j	bnei_cont.37113
bnei_else.37112:
bnei_cont.37113:
	beqi	%a0, 0, bnei_else.37116
	addi	%a0, %zero, 0
	j	bnei_cont.37095
bnei_else.37116:
	addi	%a0, %zero, 1
bnei_cont.37117:
bnei_cont.37097:
	j	bnei_cont.37095
bnei_else.37094:
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.37118
	addi	%a0, %zero, 0
	j	fbgt_cont.37119
fbgt_else.37118:
	addi	%a0, %zero, 1
fbgt_cont.37119:
	beqi	%a0, 0, bnei_else.37120
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.37122
	addi	%a0, %zero, 0
	j	fbgt_cont.37123
fbgt_else.37122:
	addi	%a0, %zero, 1
fbgt_cont.37123:
	beqi	%a0, 0, bnei_else.37124
	fabs	%f17, %f23
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.37126
	addi	%a0, %zero, 0
	j	bnei_cont.37121
fbgt_else.37126:
	addi	%a0, %zero, 1
fbgt_cont.37127:
	j	bnei_cont.37121
bnei_else.37124:
	addi	%a0, %zero, 0
bnei_cont.37125:
	j	bnei_cont.37121
bnei_else.37120:
	addi	%a0, %zero, 0
bnei_cont.37121:
	beqi	%a0, 0, bnei_else.37128
	lw	%a0, 6(%a1)
	j	bnei_cont.37129
bnei_else.37128:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.37130
	addi	%a0, %zero, 0
	j	bnei_cont.37131
bnei_else.37130:
	addi	%a0, %zero, 1
bnei_cont.37131:
bnei_cont.37129:
bnei_cont.37095:
	beqi	%a0, 0, bnei_else.37132
	addi	%v0, %zero, 0
	j	bnei_cont.37093
bnei_else.37132:
	jal	check_all_inside.2919
bnei_cont.37133:
	j	bnei_cont.37093
bnei_else.37092:
	addi	%v0, %zero, 1
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
	addi	%s7, %zero, 0
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37190
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37191
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37192
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37193
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37194
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37195
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element.2934
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37196
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
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
	sw	%v0, 0(%sp)
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	sw	%ra, 1(%sp)
	add	%at, %t7, %v0
	lw	%s3, 0(%at)
	addi	%t9, %zero, 0
	lw	%a0, 0(%s3)
	beqi	%a0, -1, bnei_else.38002
	beqi	%a0, 99, bnei_else.38003
	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f20, %f1, %f0
	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f21, %f1, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.38005
	beqi	%a0, 2, bnei_else.38007
	flw	%f26, 0(%t8)
	flw	%f25, 1(%t8)
	flw	%f27, 2(%t8)
	fmul	%f0, %f26, %f26
	lw	%a0, 4(%a1)
	flw	%f23, 0(%a0)
	fmul	%f1, %f0, %f23
	fmul	%f0, %f25, %f25
	lw	%a0, 4(%a1)
	flw	%f22, 1(%a0)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	fmul	%f0, %f27, %f27
	lw	%a0, 4(%a1)
	flw	%f18, 2(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.38009
	fmul	%f16, %f25, %f27
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f27, %f26
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f26, %f25
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.38010
bnei_else.38009:
bnei_cont.38010:
	flw	%f2, 470(%zero)
	fbne	%f0, %f2, fbeq_else.38011
	addi	%a0, %zero, 1
	j	fbeq_cont.38012
fbeq_else.38011:
	addi	%a0, %zero, 0
fbeq_cont.38012:
	beqi	%a0, 0, bnei_else.38013
	addi	%a0, %zero, 0
	j	bnei_cont.38006
bnei_else.38013:
	fmul	%f1, %f26, %f19
	fmul	%f16, %f1, %f23
	fmul	%f1, %f25, %f20
	fmul	%f1, %f1, %f22
	fadd	%f16, %f16, %f1
	fmul	%f1, %f27, %f21
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%a2, 0, bnei_else.38015
	fmul	%f17, %f27, %f20
	fmul	%f16, %f25, %f21
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f24, %f17, %f16
	fmul	%f17, %f26, %f21
	fmul	%f16, %f27, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f24, %f24, %f16
	fmul	%f17, %f26, %f20
	fmul	%f16, %f25, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f24, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.38016
bnei_else.38015:
bnei_cont.38016:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f23
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f22
	fadd	%f17, %f17, %f16
	fmul	%f16, %f21, %f21
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%a2, 0, bnei_else.38017
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
	j	bnei_cont.38018
bnei_else.38017:
bnei_cont.38018:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.38019
	j	bnei_cont.38020
bnei_else.38019:
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.38020:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%f2, %f16, fbgt_else.38021
	addi	%a0, %zero, 0
	j	fbgt_cont.38022
fbgt_else.38021:
	addi	%a0, %zero, 1
fbgt_cont.38022:
	beqi	%a0, 0, bnei_else.38023
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.38025
	j	bnei_cont.38026
bnei_else.38025:
	fneg	%f16, %f16
bnei_cont.38026:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38006
bnei_else.38023:
	addi	%a0, %zero, 0
bnei_cont.38024:
bnei_cont.38014:
	j	bnei_cont.38006
bnei_else.38007:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%t8)
	flw	%f2, 0(%a0)
	fmul	%f1, %f0, %f2
	flw	%f0, 1(%t8)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t8)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 470(%zero)
	fblt	%f0, %f16, fbgt_else.38027
	addi	%a0, %zero, 0
	j	fbgt_cont.38028
fbgt_else.38027:
	addi	%a0, %zero, 1
fbgt_cont.38028:
	beqi	%a0, 0, bnei_else.38029
	fmul	%f1, %f2, %f19
	fmul	%f0, %f18, %f20
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f21
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38006
bnei_else.38029:
	addi	%a0, %zero, 0
bnei_cont.38030:
bnei_cont.38008:
	j	bnei_cont.38006
bnei_else.38005:
	flw	%f17, 0(%t8)
	flw	%f18, 470(%zero)
	fbne	%f17, %f18, fbeq_else.38031
	addi	%a0, %zero, 1
	j	fbeq_cont.38032
fbeq_else.38031:
	addi	%a0, %zero, 0
fbeq_cont.38032:
	beqi	%a0, 0, bnei_else.38033
	addi	%a0, %zero, 0
	j	bnei_cont.38034
bnei_else.38033:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f17, %f18, fbgt_else.38035
	addi	%a0, %zero, 0
	j	fbgt_cont.38036
fbgt_else.38035:
	addi	%a0, %zero, 1
fbgt_cont.38036:
	beqi	%a2, 0, bnei_else.38037
	beqi	%a0, 0, bnei_else.38039
	addi	%a0, %zero, 0
	j	bnei_cont.38038
bnei_else.38039:
	addi	%a0, %zero, 1
bnei_cont.38040:
	j	bnei_cont.38038
bnei_else.38037:
bnei_cont.38038:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.38041
	j	bnei_cont.38042
bnei_else.38041:
	fneg	%f0, %f0
bnei_cont.38042:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 1(%a3)
	fblt	%f1, %f0, fbgt_else.38043
	addi	%a0, %zero, 0
	j	fbgt_cont.38044
fbgt_else.38043:
	addi	%a0, %zero, 1
fbgt_cont.38044:
	beqi	%a0, 0, bnei_else.38045
	flw	%f0, 2(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38047
	addi	%a0, %zero, 0
	j	fbgt_cont.38048
fbgt_else.38047:
	addi	%a0, %zero, 1
fbgt_cont.38048:
	beqi	%a0, 0, bnei_else.38049
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38046
bnei_else.38049:
	addi	%a0, %zero, 0
bnei_cont.38050:
	j	bnei_cont.38046
bnei_else.38045:
	addi	%a0, %zero, 0
bnei_cont.38046:
bnei_cont.38034:
	beqi	%a0, 0, bnei_else.38051
	addi	%a0, %zero, 1
	j	bnei_cont.38052
bnei_else.38051:
	flw	%f16, 1(%t8)
	fbne	%f16, %f18, fbeq_else.38053
	addi	%a0, %zero, 1
	j	fbeq_cont.38054
fbeq_else.38053:
	addi	%a0, %zero, 0
fbeq_cont.38054:
	beqi	%a0, 0, bnei_else.38055
	addi	%a0, %zero, 0
	j	bnei_cont.38056
bnei_else.38055:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %f18, fbgt_else.38057
	addi	%a0, %zero, 0
	j	fbgt_cont.38058
fbgt_else.38057:
	addi	%a0, %zero, 1
fbgt_cont.38058:
	beqi	%a2, 0, bnei_else.38059
	beqi	%a0, 0, bnei_else.38061
	addi	%a0, %zero, 0
	j	bnei_cont.38060
bnei_else.38061:
	addi	%a0, %zero, 1
bnei_cont.38062:
	j	bnei_cont.38060
bnei_else.38059:
bnei_cont.38060:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.38063
	j	bnei_cont.38064
bnei_else.38063:
	fneg	%f0, %f0
bnei_cont.38064:
	fsub	%f0, %f0, %f20
	fdiv	%f2, %f0, %f16
	flw	%f0, 2(%t8)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38065
	addi	%a0, %zero, 0
	j	fbgt_cont.38066
fbgt_else.38065:
	addi	%a0, %zero, 1
fbgt_cont.38066:
	beqi	%a0, 0, bnei_else.38067
	fmul	%f0, %f2, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a3)
	fblt	%f1, %f0, fbgt_else.38069
	addi	%a0, %zero, 0
	j	fbgt_cont.38070
fbgt_else.38069:
	addi	%a0, %zero, 1
fbgt_cont.38070:
	beqi	%a0, 0, bnei_else.38071
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38068
bnei_else.38071:
	addi	%a0, %zero, 0
bnei_cont.38072:
	j	bnei_cont.38068
bnei_else.38067:
	addi	%a0, %zero, 0
bnei_cont.38068:
bnei_cont.38056:
	beqi	%a0, 0, bnei_else.38073
	addi	%a0, %zero, 2
	j	bnei_cont.38074
bnei_else.38073:
	flw	%f1, 2(%t8)
	fbne	%f1, %f18, fbeq_else.38075
	addi	%a0, %zero, 1
	j	fbeq_cont.38076
fbeq_else.38075:
	addi	%a0, %zero, 0
fbeq_cont.38076:
	beqi	%a0, 0, bnei_else.38077
	addi	%a0, %zero, 0
	j	bnei_cont.38078
bnei_else.38077:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f1, %f18, fbgt_else.38079
	addi	%a0, %zero, 0
	j	fbgt_cont.38080
fbgt_else.38079:
	addi	%a0, %zero, 1
fbgt_cont.38080:
	beqi	%a1, 0, bnei_else.38081
	beqi	%a0, 0, bnei_else.38083
	addi	%a0, %zero, 0
	j	bnei_cont.38082
bnei_else.38083:
	addi	%a0, %zero, 1
bnei_cont.38084:
	j	bnei_cont.38082
bnei_else.38081:
bnei_cont.38082:
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.38085
	j	bnei_cont.38086
bnei_else.38085:
	fneg	%f0, %f0
bnei_cont.38086:
	fsub	%f0, %f0, %f21
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a2)
	fblt	%f1, %f0, fbgt_else.38087
	addi	%a0, %zero, 0
	j	fbgt_cont.38088
fbgt_else.38087:
	addi	%a0, %zero, 1
fbgt_cont.38088:
	beqi	%a0, 0, bnei_else.38089
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.38091
	addi	%a0, %zero, 0
	j	fbgt_cont.38092
fbgt_else.38091:
	addi	%a0, %zero, 1
fbgt_cont.38092:
	beqi	%a0, 0, bnei_else.38093
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38090
bnei_else.38093:
	addi	%a0, %zero, 0
bnei_cont.38094:
	j	bnei_cont.38090
bnei_else.38089:
	addi	%a0, %zero, 0
bnei_cont.38090:
bnei_cont.38078:
	beqi	%a0, 0, bnei_else.38095
	addi	%a0, %zero, 3
	j	bnei_cont.38096
bnei_else.38095:
	addi	%a0, %zero, 0
bnei_cont.38096:
bnei_cont.38074:
bnei_cont.38052:
bnei_cont.38006:
	beqi	%a0, 0, bnei_cont.38004
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38099
	addi	%a0, %zero, 0
	j	fbgt_cont.38100
fbgt_else.38099:
	addi	%a0, %zero, 1
fbgt_cont.38100:
	beqi	%a0, 0, bnei_cont.38004
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.38004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -2
	j	bnei_cont.38004
bnei_else.38115:
bnei_cont.38116:
	j	bnei_cont.38004
bnei_else.38113:
bnei_cont.38114:
	j	bnei_cont.38004
bnei_else.38111:
bnei_cont.38112:
	j	bnei_cont.38004
bnei_else.38109:
bnei_cont.38110:
	j	bnei_cont.38004
bnei_else.38107:
bnei_cont.38108:
	j	bnei_cont.38004
bnei_else.38105:
bnei_cont.38106:
	j	bnei_cont.38004
bnei_else.38103:
bnei_cont.38104:
	j	bnei_cont.38004
bnei_else.38101:
bnei_cont.38102:
	j	bnei_cont.38004
bnei_else.38097:
bnei_cont.38098:
	j	bnei_cont.38004
bnei_else.38003:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.38117
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.38118
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -2
	j	bnei_cont.38118
bnei_else.38129:
bnei_cont.38130:
	j	bnei_cont.38118
bnei_else.38127:
bnei_cont.38128:
	j	bnei_cont.38118
bnei_else.38125:
bnei_cont.38126:
	j	bnei_cont.38118
bnei_else.38123:
bnei_cont.38124:
	j	bnei_cont.38118
bnei_else.38121:
bnei_cont.38122:
	j	bnei_cont.38118
bnei_else.38119:
bnei_cont.38120:
	j	bnei_cont.38118
bnei_else.38117:
bnei_cont.38118:
bnei_cont.38004:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 2(%sp)
	add	%at, %t7, %a0
	lw	%s3, 0(%at)
	lw	%a0, 0(%s3)
	beqi	%a0, -1, bnei_else.38131
	beqi	%a0, 99, bnei_else.38132
	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 1(%a0)
	fsub	%f20, %f1, %f0
	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f21, %f1, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.38134
	beqi	%a0, 2, bnei_else.38136
	flw	%f23, 0(%t8)
	flw	%f22, 1(%t8)
	flw	%f24, 2(%t8)
	fmul	%f1, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f22, %f22
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f24, %f24
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.38138
	fmul	%f16, %f22, %f24
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f23
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f23, %f22
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.38139
bnei_else.38138:
bnei_cont.38139:
	flw	%f2, 470(%zero)
	fbne	%f0, %f2, fbeq_else.38140
	addi	%a0, %zero, 1
	j	fbeq_cont.38141
fbeq_else.38140:
	addi	%a0, %zero, 0
fbeq_cont.38141:
	beqi	%a0, 0, bnei_else.38142
	addi	%a0, %zero, 0
	j	bnei_cont.38135
bnei_else.38142:
	fmul	%f16, %f23, %f19
	lw	%a0, 4(%a1)
	flw	%f1, 0(%a0)
	fmul	%f17, %f16, %f1
	fmul	%f16, %f22, %f20
	lw	%a0, 4(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f17, %f17, %f1
	fmul	%f16, %f24, %f21
	lw	%a0, 4(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f1, %f17, %f1
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.38144
	fmul	%f17, %f24, %f20
	fmul	%f16, %f22, %f21
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f23, %f21
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f23, %f20
	fmul	%f16, %f22, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f18, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.38145
bnei_else.38144:
bnei_cont.38145:
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
	beqi	%a0, 0, bnei_else.38146
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
	j	bnei_cont.38147
bnei_else.38146:
bnei_cont.38147:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.38148
	j	bnei_cont.38149
bnei_else.38148:
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.38149:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%f2, %f16, fbgt_else.38150
	addi	%a0, %zero, 0
	j	fbgt_cont.38151
fbgt_else.38150:
	addi	%a0, %zero, 1
fbgt_cont.38151:
	beqi	%a0, 0, bnei_else.38152
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.38154
	j	bnei_cont.38155
bnei_else.38154:
	fneg	%f16, %f16
bnei_cont.38155:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38135
bnei_else.38152:
	addi	%a0, %zero, 0
bnei_cont.38153:
bnei_cont.38143:
	j	bnei_cont.38135
bnei_else.38136:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%t8)
	flw	%f2, 0(%a0)
	fmul	%f1, %f0, %f2
	flw	%f0, 1(%t8)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t8)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 470(%zero)
	fblt	%f0, %f16, fbgt_else.38156
	addi	%a0, %zero, 0
	j	fbgt_cont.38157
fbgt_else.38156:
	addi	%a0, %zero, 1
fbgt_cont.38157:
	beqi	%a0, 0, bnei_else.38158
	fmul	%f1, %f2, %f19
	fmul	%f0, %f18, %f20
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f21
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38135
bnei_else.38158:
	addi	%a0, %zero, 0
bnei_cont.38159:
bnei_cont.38137:
	j	bnei_cont.38135
bnei_else.38134:
	flw	%f17, 0(%t8)
	flw	%f18, 470(%zero)
	fbne	%f17, %f18, fbeq_else.38160
	addi	%a0, %zero, 1
	j	fbeq_cont.38161
fbeq_else.38160:
	addi	%a0, %zero, 0
fbeq_cont.38161:
	beqi	%a0, 0, bnei_else.38162
	addi	%a0, %zero, 0
	j	bnei_cont.38163
bnei_else.38162:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f17, %f18, fbgt_else.38164
	addi	%a0, %zero, 0
	j	fbgt_cont.38165
fbgt_else.38164:
	addi	%a0, %zero, 1
fbgt_cont.38165:
	beqi	%a2, 0, bnei_else.38166
	beqi	%a0, 0, bnei_else.38168
	addi	%a0, %zero, 0
	j	bnei_cont.38167
bnei_else.38168:
	addi	%a0, %zero, 1
bnei_cont.38169:
	j	bnei_cont.38167
bnei_else.38166:
bnei_cont.38167:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.38170
	j	bnei_cont.38171
bnei_else.38170:
	fneg	%f0, %f0
bnei_cont.38171:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 1(%a3)
	fblt	%f1, %f0, fbgt_else.38172
	addi	%a0, %zero, 0
	j	fbgt_cont.38173
fbgt_else.38172:
	addi	%a0, %zero, 1
fbgt_cont.38173:
	beqi	%a0, 0, bnei_else.38174
	flw	%f0, 2(%t8)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38176
	addi	%a0, %zero, 0
	j	fbgt_cont.38177
fbgt_else.38176:
	addi	%a0, %zero, 1
fbgt_cont.38177:
	beqi	%a0, 0, bnei_else.38178
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38175
bnei_else.38178:
	addi	%a0, %zero, 0
bnei_cont.38179:
	j	bnei_cont.38175
bnei_else.38174:
	addi	%a0, %zero, 0
bnei_cont.38175:
bnei_cont.38163:
	beqi	%a0, 0, bnei_else.38180
	addi	%a0, %zero, 1
	j	bnei_cont.38181
bnei_else.38180:
	flw	%f16, 1(%t8)
	fbne	%f16, %f18, fbeq_else.38182
	addi	%a0, %zero, 1
	j	fbeq_cont.38183
fbeq_else.38182:
	addi	%a0, %zero, 0
fbeq_cont.38183:
	beqi	%a0, 0, bnei_else.38184
	addi	%a0, %zero, 0
	j	bnei_cont.38185
bnei_else.38184:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %f18, fbgt_else.38186
	addi	%a0, %zero, 0
	j	fbgt_cont.38187
fbgt_else.38186:
	addi	%a0, %zero, 1
fbgt_cont.38187:
	beqi	%a2, 0, bnei_else.38188
	beqi	%a0, 0, bnei_else.38190
	addi	%a0, %zero, 0
	j	bnei_cont.38189
bnei_else.38190:
	addi	%a0, %zero, 1
bnei_cont.38191:
	j	bnei_cont.38189
bnei_else.38188:
bnei_cont.38189:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.38192
	j	bnei_cont.38193
bnei_else.38192:
	fneg	%f0, %f0
bnei_cont.38193:
	fsub	%f0, %f0, %f20
	fdiv	%f2, %f0, %f16
	flw	%f0, 2(%t8)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38194
	addi	%a0, %zero, 0
	j	fbgt_cont.38195
fbgt_else.38194:
	addi	%a0, %zero, 1
fbgt_cont.38195:
	beqi	%a0, 0, bnei_else.38196
	fmul	%f0, %f2, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a3)
	fblt	%f1, %f0, fbgt_else.38198
	addi	%a0, %zero, 0
	j	fbgt_cont.38199
fbgt_else.38198:
	addi	%a0, %zero, 1
fbgt_cont.38199:
	beqi	%a0, 0, bnei_else.38200
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38197
bnei_else.38200:
	addi	%a0, %zero, 0
bnei_cont.38201:
	j	bnei_cont.38197
bnei_else.38196:
	addi	%a0, %zero, 0
bnei_cont.38197:
bnei_cont.38185:
	beqi	%a0, 0, bnei_else.38202
	addi	%a0, %zero, 2
	j	bnei_cont.38203
bnei_else.38202:
	flw	%f1, 2(%t8)
	fbne	%f1, %f18, fbeq_else.38204
	addi	%a0, %zero, 1
	j	fbeq_cont.38205
fbeq_else.38204:
	addi	%a0, %zero, 0
fbeq_cont.38205:
	beqi	%a0, 0, bnei_else.38206
	addi	%a0, %zero, 0
	j	bnei_cont.38207
bnei_else.38206:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f1, %f18, fbgt_else.38208
	addi	%a0, %zero, 0
	j	fbgt_cont.38209
fbgt_else.38208:
	addi	%a0, %zero, 1
fbgt_cont.38209:
	beqi	%a1, 0, bnei_else.38210
	beqi	%a0, 0, bnei_else.38212
	addi	%a0, %zero, 0
	j	bnei_cont.38211
bnei_else.38212:
	addi	%a0, %zero, 1
bnei_cont.38213:
	j	bnei_cont.38211
bnei_else.38210:
bnei_cont.38211:
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.38214
	j	bnei_cont.38215
bnei_else.38214:
	fneg	%f0, %f0
bnei_cont.38215:
	fsub	%f0, %f0, %f21
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a2)
	fblt	%f1, %f0, fbgt_else.38216
	addi	%a0, %zero, 0
	j	fbgt_cont.38217
fbgt_else.38216:
	addi	%a0, %zero, 1
fbgt_cont.38217:
	beqi	%a0, 0, bnei_else.38218
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.38220
	addi	%a0, %zero, 0
	j	fbgt_cont.38221
fbgt_else.38220:
	addi	%a0, %zero, 1
fbgt_cont.38221:
	beqi	%a0, 0, bnei_else.38222
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.38219
bnei_else.38222:
	addi	%a0, %zero, 0
bnei_cont.38223:
	j	bnei_cont.38219
bnei_else.38218:
	addi	%a0, %zero, 0
bnei_cont.38219:
bnei_cont.38207:
	beqi	%a0, 0, bnei_else.38224
	addi	%a0, %zero, 3
	j	bnei_cont.38225
bnei_else.38224:
	addi	%a0, %zero, 0
bnei_cont.38225:
bnei_cont.38203:
bnei_cont.38181:
bnei_cont.38135:
	beqi	%a0, 0, bnei_cont.38133
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38228
	addi	%a0, %zero, 0
	j	fbgt_cont.38229
fbgt_else.38228:
	addi	%a0, %zero, 1
fbgt_cont.38229:
	beqi	%a0, 0, bnei_cont.38133
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38133
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -3
	j	bnei_cont.38133
bnei_else.38242:
bnei_cont.38243:
	j	bnei_cont.38133
bnei_else.38240:
bnei_cont.38241:
	j	bnei_cont.38133
bnei_else.38238:
bnei_cont.38239:
	j	bnei_cont.38133
bnei_else.38236:
bnei_cont.38237:
	j	bnei_cont.38133
bnei_else.38234:
bnei_cont.38235:
	j	bnei_cont.38133
bnei_else.38232:
bnei_cont.38233:
	j	bnei_cont.38133
bnei_else.38230:
bnei_cont.38231:
	j	bnei_cont.38133
bnei_else.38226:
bnei_cont.38227:
	j	bnei_cont.38133
bnei_else.38132:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.38244
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.38245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.38245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.38245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.38245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.38245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -3
	j	bnei_cont.38245
bnei_else.38254:
bnei_cont.38255:
	j	bnei_cont.38245
bnei_else.38252:
bnei_cont.38253:
	j	bnei_cont.38245
bnei_else.38250:
bnei_cont.38251:
	j	bnei_cont.38245
bnei_else.38248:
bnei_cont.38249:
	j	bnei_cont.38245
bnei_else.38246:
bnei_cont.38247:
	j	bnei_cont.38245
bnei_else.38244:
bnei_cont.38245:
bnei_cont.38133:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	trace_or_matrix.2942
bnei_else.38131:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.38002:
	jr	%ra
solve_each_element_fast.2948:
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra
	lw	%a1, 0(%k0)
	add	%at, %v1, %a3
	lw	%s1, 0(%at)
	beqi	%s1, -1, bnei_else.38455
	lw	%a2, 12(%s1)
	lw	%ra, 10(%a2)
	flw	%f19, 0(%ra)
	addi	%v0, %zero, 1
	flw	%f16, 1(%ra)
	flw	%f17, 2(%ra)
	lw	%a0, 1(%k0)
	add	%at, %a0, %s1
	lw	%s2, 0(%at)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.38456
	beqi	%a0, 2, bnei_else.38458
	flw	%f18, 0(%s2)
	flw	%f2, 470(%zero)
	fbne	%f18, %f2, fbeq_else.38460
	addi	%a0, %zero, 1
	j	fbeq_cont.38461
fbeq_else.38460:
	addi	%a0, %zero, 0
fbeq_cont.38461:
	beqi	%a0, 0, bnei_else.38462
	addi	%s2, %zero, 0
	j	bnei_cont.38457
bnei_else.38462:
	flw	%f0, 1(%s2)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%s2)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%s2)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%f2, %f0, fbgt_else.38464
	addi	%a0, %zero, 0
	j	fbgt_cont.38465
fbgt_else.38464:
	addi	%a0, %zero, 1
fbgt_cont.38465:
	beqi	%a0, 0, bnei_else.38466
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.38468
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%s2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38469
bnei_else.38468:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%s2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38469:
	addi	%s2, %zero, 1
	j	bnei_cont.38457
bnei_else.38466:
	addi	%s2, %zero, 0
bnei_cont.38467:
bnei_cont.38463:
	j	bnei_cont.38457
bnei_else.38458:
	flw	%f1, 0(%s2)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.38470
	addi	%a0, %zero, 0
	j	fbgt_cont.38471
fbgt_else.38470:
	addi	%a0, %zero, 1
fbgt_cont.38471:
	beqi	%a0, 0, bnei_else.38472
	flw	%f0, 3(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%s2, %zero, 1
	j	bnei_cont.38457
bnei_else.38472:
	addi	%s2, %zero, 0
bnei_cont.38473:
bnei_cont.38459:
	j	bnei_cont.38457
bnei_else.38456:
	lw	%ra, 0(%k0)
	flw	%f0, 0(%s2)
	fsub	%f0, %f0, %f19
	flw	%f20, 1(%s2)
	fmul	%f2, %f0, %f20
	flw	%f18, 1(%ra)
	fmul	%f0, %f2, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38474
	addi	%a0, %zero, 0
	j	fbgt_cont.38475
fbgt_else.38474:
	addi	%a0, %zero, 1
fbgt_cont.38475:
	beqi	%a0, 0, bnei_else.38476
	flw	%f0, 2(%ra)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38478
	addi	%a0, %zero, 0
	j	fbgt_cont.38479
fbgt_else.38478:
	addi	%a0, %zero, 1
fbgt_cont.38479:
	beqi	%a0, 0, bnei_else.38480
	flw	%f0, 470(%zero)
	fbne	%f20, %f0, fbeq_else.38482
	addi	%a0, %zero, 1
	j	fbeq_cont.38483
fbeq_else.38482:
	addi	%a0, %zero, 0
fbeq_cont.38483:
	beqi	%a0, 0, bnei_else.38484
	addi	%a0, %zero, 0
	j	bnei_cont.38477
bnei_else.38484:
	addi	%a0, %zero, 1
bnei_cont.38485:
	j	bnei_cont.38477
bnei_else.38480:
	addi	%a0, %zero, 0
bnei_cont.38481:
	j	bnei_cont.38477
bnei_else.38476:
	addi	%a0, %zero, 0
bnei_cont.38477:
	beqi	%a0, 0, bnei_else.38486
	fsw	%f2, 135(%zero)
	addi	%s2, %zero, 1
	j	bnei_cont.38487
bnei_else.38486:
	flw	%f0, 2(%s2)
	fsub	%f0, %f0, %f16
	flw	%f21, 3(%s2)
	fmul	%f2, %f0, %f21
	flw	%f20, 0(%ra)
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38488
	addi	%a0, %zero, 0
	j	fbgt_cont.38489
fbgt_else.38488:
	addi	%a0, %zero, 1
fbgt_cont.38489:
	beqi	%a0, 0, bnei_else.38490
	flw	%f0, 2(%ra)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.38492
	addi	%a0, %zero, 0
	j	fbgt_cont.38493
fbgt_else.38492:
	addi	%a0, %zero, 1
fbgt_cont.38493:
	beqi	%a0, 0, bnei_else.38494
	flw	%f0, 470(%zero)
	fbne	%f21, %f0, fbeq_else.38496
	addi	%a0, %zero, 1
	j	fbeq_cont.38497
fbeq_else.38496:
	addi	%a0, %zero, 0
fbeq_cont.38497:
	beqi	%a0, 0, bnei_else.38498
	addi	%a0, %zero, 0
	j	bnei_cont.38491
bnei_else.38498:
	addi	%a0, %zero, 1
bnei_cont.38499:
	j	bnei_cont.38491
bnei_else.38494:
	addi	%a0, %zero, 0
bnei_cont.38495:
	j	bnei_cont.38491
bnei_else.38490:
	addi	%a0, %zero, 0
bnei_cont.38491:
	beqi	%a0, 0, bnei_else.38500
	fsw	%f2, 135(%zero)
	addi	%s2, %zero, 2
	j	bnei_cont.38501
bnei_else.38500:
	flw	%f0, 4(%s2)
	fsub	%f0, %f0, %f17
	flw	%f2, 5(%s2)
	fmul	%f17, %f0, %f2
	fmul	%f0, %f17, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.38502
	addi	%a0, %zero, 0
	j	fbgt_cont.38503
fbgt_else.38502:
	addi	%a0, %zero, 1
fbgt_cont.38503:
	beqi	%a0, 0, bnei_else.38504
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.38506
	addi	%a0, %zero, 0
	j	fbgt_cont.38507
fbgt_else.38506:
	addi	%a0, %zero, 1
fbgt_cont.38507:
	beqi	%a0, 0, bnei_else.38508
	flw	%f0, 470(%zero)
	fbne	%f2, %f0, fbeq_else.38510
	addi	%a0, %zero, 1
	j	fbeq_cont.38511
fbeq_else.38510:
	addi	%a0, %zero, 0
fbeq_cont.38511:
	beqi	%a0, 0, bnei_else.38512
	addi	%a0, %zero, 0
	j	bnei_cont.38505
bnei_else.38512:
	addi	%a0, %zero, 1
bnei_cont.38513:
	j	bnei_cont.38505
bnei_else.38508:
	addi	%a0, %zero, 0
bnei_cont.38509:
	j	bnei_cont.38505
bnei_else.38504:
	addi	%a0, %zero, 0
bnei_cont.38505:
	beqi	%a0, 0, bnei_else.38514
	fsw	%f17, 135(%zero)
	addi	%s2, %zero, 3
	j	bnei_cont.38515
bnei_else.38514:
	addi	%s2, %zero, 0
bnei_cont.38515:
bnei_cont.38501:
bnei_cont.38487:
bnei_cont.38457:
	beqi	%s2, 0, bnei_else.38516
	flw	%f1, 135(%zero)
	flw	%f19, 470(%zero)
	fblt	%f19, %f1, fbgt_else.38517
	addi	%a0, %zero, 0
	j	fbgt_cont.38518
fbgt_else.38517:
	addi	%a0, %zero, 1
fbgt_cont.38518:
	beqi	%a0, 0, bnei_else.38519
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38521
	addi	%a0, %zero, 0
	j	fbgt_cont.38522
fbgt_else.38521:
	addi	%a0, %zero, 1
fbgt_cont.38522:
	beqi	%a0, 0, bnei_cont.38520
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
	beqi	%a0, -1, bnei_else.38525
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f20, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f21, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f23, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.38527
	beqi	%a0, 2, bnei_else.38529
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.38531
	fmul	%f18, %f21, %f23
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f23, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.38532
bnei_else.38531:
bnei_cont.38532:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.38533
	j	bnei_cont.38534
bnei_else.38533:
	flw	%f17, 474(%zero)
	fsub	%f16, %f16, %f17
bnei_cont.38534:
	lw	%a1, 6(%a1)
	fblt	%f16, %f19, fbgt_else.38535
	addi	%a0, %zero, 0
	j	fbgt_cont.38536
fbgt_else.38535:
	addi	%a0, %zero, 1
fbgt_cont.38536:
	beqi	%a1, 0, bnei_else.38537
	beqi	%a0, 0, bnei_else.38539
	addi	%a0, %zero, 0
	j	bnei_cont.38538
bnei_else.38539:
	addi	%a0, %zero, 1
bnei_cont.38540:
	j	bnei_cont.38538
bnei_else.38537:
bnei_cont.38538:
	beqi	%a0, 0, bnei_else.38541
	addi	%a0, %zero, 0
	j	bnei_cont.38528
bnei_else.38541:
	addi	%a0, %zero, 1
bnei_cont.38542:
	j	bnei_cont.38528
bnei_else.38529:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f20
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f23
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %f19, fbgt_else.38543
	addi	%a0, %zero, 0
	j	fbgt_cont.38544
fbgt_else.38543:
	addi	%a0, %zero, 1
fbgt_cont.38544:
	beqi	%a1, 0, bnei_else.38545
	beqi	%a0, 0, bnei_else.38547
	addi	%a0, %zero, 0
	j	bnei_cont.38546
bnei_else.38547:
	addi	%a0, %zero, 1
bnei_cont.38548:
	j	bnei_cont.38546
bnei_else.38545:
bnei_cont.38546:
	beqi	%a0, 0, bnei_else.38549
	addi	%a0, %zero, 0
	j	bnei_cont.38528
bnei_else.38549:
	addi	%a0, %zero, 1
bnei_cont.38550:
bnei_cont.38530:
	j	bnei_cont.38528
bnei_else.38527:
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.38551
	addi	%a0, %zero, 0
	j	fbgt_cont.38552
fbgt_else.38551:
	addi	%a0, %zero, 1
fbgt_cont.38552:
	beqi	%a0, 0, bnei_else.38553
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.38555
	addi	%a0, %zero, 0
	j	fbgt_cont.38556
fbgt_else.38555:
	addi	%a0, %zero, 1
fbgt_cont.38556:
	beqi	%a0, 0, bnei_else.38557
	fabs	%f17, %f23
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.38559
	addi	%a0, %zero, 0
	j	bnei_cont.38554
fbgt_else.38559:
	addi	%a0, %zero, 1
fbgt_cont.38560:
	j	bnei_cont.38554
bnei_else.38557:
	addi	%a0, %zero, 0
bnei_cont.38558:
	j	bnei_cont.38554
bnei_else.38553:
	addi	%a0, %zero, 0
bnei_cont.38554:
	beqi	%a0, 0, bnei_else.38561
	lw	%a0, 6(%a1)
	j	bnei_cont.38562
bnei_else.38561:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.38563
	addi	%a0, %zero, 0
	j	bnei_cont.38564
bnei_else.38563:
	addi	%a0, %zero, 1
bnei_cont.38564:
bnei_cont.38562:
bnei_cont.38528:
	beqi	%a0, 0, bnei_else.38565
	addi	%v0, %zero, 0
	j	bnei_cont.38526
bnei_else.38565:
	jal	check_all_inside.2919
bnei_cont.38566:
	j	bnei_cont.38526
bnei_else.38525:
	addi	%v0, %zero, 1
bnei_cont.38526:
	beqi	%v0, 0, bnei_cont.38520
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s1, 141(%zero)
	sw	%s2, 136(%zero)
	j	bnei_cont.38520
bnei_else.38567:
bnei_cont.38568:
	j	bnei_cont.38520
bnei_else.38523:
bnei_cont.38524:
	j	bnei_cont.38520
bnei_else.38519:
bnei_cont.38520:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.38516:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.38569
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.38569:
	add	%ra, %zero, %s0
	jr	%ra
bnei_else.38455:
	add	%ra, %zero, %s0
	jr	%ra
solve_one_or_network_fast.2952:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38622
	lw	%v1, 83(%a0)
	addi	%s7, %zero, 0
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38623
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38624
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38625
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38626
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38627
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38628
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.38629
	lw	%v1, 83(%a0)
	addi	%a0, %s5, 0
	addi	%v0, %s7, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	j	solve_one_or_network_fast.2952
bnei_else.38629:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38628:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38627:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38626:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38625:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38624:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38623:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.38622:
	add	%ra, %zero, %s6
	jr	%ra
trace_or_matrix_fast.2956:
	sw	%v0, 0(%sp)
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	sw	%ra, 1(%sp)
	add	%at, %t7, %v0
	lw	%s3, 0(%at)
	addi	%t9, %zero, 0
	lw	%a3, 0(%s3)
	beqi	%a3, -1, bnei_else.39243
	beqi	%a3, 99, bnei_else.39244
	lw	%a2, 12(%a3)
	lw	%a1, 10(%a2)
	flw	%f19, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f17, 2(%a1)
	lw	%a0, 1(%t8)
	add	%at, %a0, %a3
	lw	%a3, 0(%at)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.39246
	beqi	%a0, 2, bnei_else.39248
	flw	%f18, 0(%a3)
	flw	%f2, 470(%zero)
	fbne	%f18, %f2, fbeq_else.39250
	addi	%a0, %zero, 1
	j	fbeq_cont.39251
fbeq_else.39250:
	addi	%a0, %zero, 0
fbeq_cont.39251:
	beqi	%a0, 0, bnei_else.39252
	addi	%a0, %zero, 0
	j	bnei_cont.39247
bnei_else.39252:
	flw	%f0, 1(%a3)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a1)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%f2, %f0, fbgt_else.39254
	addi	%a0, %zero, 0
	j	fbgt_cont.39255
fbgt_else.39254:
	addi	%a0, %zero, 1
fbgt_cont.39255:
	beqi	%a0, 0, bnei_else.39256
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.39258
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.39259
bnei_else.39258:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.39259:
	addi	%a0, %zero, 1
	j	bnei_cont.39247
bnei_else.39256:
	addi	%a0, %zero, 0
bnei_cont.39257:
bnei_cont.39253:
	j	bnei_cont.39247
bnei_else.39248:
	flw	%f1, 0(%a3)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.39260
	addi	%a0, %zero, 0
	j	fbgt_cont.39261
fbgt_else.39260:
	addi	%a0, %zero, 1
fbgt_cont.39261:
	beqi	%a0, 0, bnei_else.39262
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.39247
bnei_else.39262:
	addi	%a0, %zero, 0
bnei_cont.39263:
bnei_cont.39249:
	j	bnei_cont.39247
bnei_else.39246:
	lw	%a1, 0(%t8)
	flw	%f0, 0(%a3)
	fsub	%f0, %f0, %f19
	flw	%f20, 1(%a3)
	fmul	%f2, %f0, %f20
	flw	%f18, 1(%a1)
	fmul	%f0, %f2, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.39264
	addi	%a0, %zero, 0
	j	fbgt_cont.39265
fbgt_else.39264:
	addi	%a0, %zero, 1
fbgt_cont.39265:
	beqi	%a0, 0, bnei_else.39266
	flw	%f0, 2(%a1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.39268
	addi	%a0, %zero, 0
	j	fbgt_cont.39269
fbgt_else.39268:
	addi	%a0, %zero, 1
fbgt_cont.39269:
	beqi	%a0, 0, bnei_else.39270
	flw	%f0, 470(%zero)
	fbne	%f20, %f0, fbeq_else.39272
	addi	%a0, %zero, 1
	j	fbeq_cont.39273
fbeq_else.39272:
	addi	%a0, %zero, 0
fbeq_cont.39273:
	beqi	%a0, 0, bnei_else.39274
	addi	%a0, %zero, 0
	j	bnei_cont.39267
bnei_else.39274:
	addi	%a0, %zero, 1
bnei_cont.39275:
	j	bnei_cont.39267
bnei_else.39270:
	addi	%a0, %zero, 0
bnei_cont.39271:
	j	bnei_cont.39267
bnei_else.39266:
	addi	%a0, %zero, 0
bnei_cont.39267:
	beqi	%a0, 0, bnei_else.39276
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.39277
bnei_else.39276:
	flw	%f0, 2(%a3)
	fsub	%f0, %f0, %f16
	flw	%f21, 3(%a3)
	fmul	%f2, %f0, %f21
	flw	%f20, 0(%a1)
	fmul	%f0, %f2, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.39278
	addi	%a0, %zero, 0
	j	fbgt_cont.39279
fbgt_else.39278:
	addi	%a0, %zero, 1
fbgt_cont.39279:
	beqi	%a0, 0, bnei_else.39280
	flw	%f0, 2(%a1)
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.39282
	addi	%a0, %zero, 0
	j	fbgt_cont.39283
fbgt_else.39282:
	addi	%a0, %zero, 1
fbgt_cont.39283:
	beqi	%a0, 0, bnei_else.39284
	flw	%f0, 470(%zero)
	fbne	%f21, %f0, fbeq_else.39286
	addi	%a0, %zero, 1
	j	fbeq_cont.39287
fbeq_else.39286:
	addi	%a0, %zero, 0
fbeq_cont.39287:
	beqi	%a0, 0, bnei_else.39288
	addi	%a0, %zero, 0
	j	bnei_cont.39281
bnei_else.39288:
	addi	%a0, %zero, 1
bnei_cont.39289:
	j	bnei_cont.39281
bnei_else.39284:
	addi	%a0, %zero, 0
bnei_cont.39285:
	j	bnei_cont.39281
bnei_else.39280:
	addi	%a0, %zero, 0
bnei_cont.39281:
	beqi	%a0, 0, bnei_else.39290
	fsw	%f2, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.39291
bnei_else.39290:
	flw	%f0, 4(%a3)
	fsub	%f0, %f0, %f17
	flw	%f2, 5(%a3)
	fmul	%f17, %f0, %f2
	fmul	%f0, %f17, %f20
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fblt	%f1, %f0, fbgt_else.39292
	addi	%a0, %zero, 0
	j	fbgt_cont.39293
fbgt_else.39292:
	addi	%a0, %zero, 1
fbgt_cont.39293:
	beqi	%a0, 0, bnei_else.39294
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.39296
	addi	%a0, %zero, 0
	j	fbgt_cont.39297
fbgt_else.39296:
	addi	%a0, %zero, 1
fbgt_cont.39297:
	beqi	%a0, 0, bnei_else.39298
	flw	%f0, 470(%zero)
	fbne	%f2, %f0, fbeq_else.39300
	addi	%a0, %zero, 1
	j	fbeq_cont.39301
fbeq_else.39300:
	addi	%a0, %zero, 0
fbeq_cont.39301:
	beqi	%a0, 0, bnei_else.39302
	addi	%a0, %zero, 0
	j	bnei_cont.39295
bnei_else.39302:
	addi	%a0, %zero, 1
bnei_cont.39303:
	j	bnei_cont.39295
bnei_else.39298:
	addi	%a0, %zero, 0
bnei_cont.39299:
	j	bnei_cont.39295
bnei_else.39294:
	addi	%a0, %zero, 0
bnei_cont.39295:
	beqi	%a0, 0, bnei_else.39304
	fsw	%f17, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.39305
bnei_else.39304:
	addi	%a0, %zero, 0
bnei_cont.39305:
bnei_cont.39291:
bnei_cont.39277:
bnei_cont.39247:
	beqi	%a0, 0, bnei_cont.39245
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.39308
	addi	%a0, %zero, 0
	j	fbgt_cont.39309
fbgt_else.39308:
	addi	%a0, %zero, 1
fbgt_cont.39309:
	beqi	%a0, 0, bnei_cont.39245
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.39245
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -2
	j	bnei_cont.39245
bnei_else.39324:
bnei_cont.39325:
	j	bnei_cont.39245
bnei_else.39322:
bnei_cont.39323:
	j	bnei_cont.39245
bnei_else.39320:
bnei_cont.39321:
	j	bnei_cont.39245
bnei_else.39318:
bnei_cont.39319:
	j	bnei_cont.39245
bnei_else.39316:
bnei_cont.39317:
	j	bnei_cont.39245
bnei_else.39314:
bnei_cont.39315:
	j	bnei_cont.39245
bnei_else.39312:
bnei_cont.39313:
	j	bnei_cont.39245
bnei_else.39310:
bnei_cont.39311:
	j	bnei_cont.39245
bnei_else.39306:
bnei_cont.39307:
	j	bnei_cont.39245
bnei_else.39244:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.39326
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 7(%s3)
	beqi	%a0, -1, bnei_cont.39327
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -2
	j	bnei_cont.39327
bnei_else.39338:
bnei_cont.39339:
	j	bnei_cont.39327
bnei_else.39336:
bnei_cont.39337:
	j	bnei_cont.39327
bnei_else.39334:
bnei_cont.39335:
	j	bnei_cont.39327
bnei_else.39332:
bnei_cont.39333:
	j	bnei_cont.39327
bnei_else.39330:
bnei_cont.39331:
	j	bnei_cont.39327
bnei_else.39328:
bnei_cont.39329:
	j	bnei_cont.39327
bnei_else.39326:
bnei_cont.39327:
bnei_cont.39245:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 2(%sp)
	add	%at, %t7, %a0
	lw	%s3, 0(%at)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.39340
	beqi	%a2, 99, bnei_else.39341
	lw	%a3, 12(%a2)
	lw	%a1, 10(%a3)
	flw	%f2, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f18, 2(%a1)
	lw	%a0, 1(%t8)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a3)
	beqi	%a0, 1, bnei_else.39343
	beqi	%a0, 2, bnei_else.39345
	flw	%f17, 0(%a2)
	flw	%f19, 470(%zero)
	fbne	%f17, %f19, fbeq_else.39347
	addi	%a0, %zero, 1
	j	fbeq_cont.39348
fbeq_else.39347:
	addi	%a0, %zero, 0
fbeq_cont.39348:
	beqi	%a0, 0, bnei_else.39349
	addi	%a0, %zero, 0
	j	bnei_cont.39344
bnei_else.39349:
	flw	%f0, 1(%a2)
	fmul	%f1, %f0, %f2
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
	fblt	%f19, %f0, fbgt_else.39351
	addi	%a0, %zero, 0
	j	fbgt_cont.39352
fbgt_else.39351:
	addi	%a0, %zero, 1
fbgt_cont.39352:
	beqi	%a0, 0, bnei_else.39353
	lw	%a0, 6(%a3)
	beqi	%a0, 0, bnei_else.39355
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.39356
bnei_else.39355:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.39356:
	addi	%a0, %zero, 1
	j	bnei_cont.39344
bnei_else.39353:
	addi	%a0, %zero, 0
bnei_cont.39354:
bnei_cont.39350:
	j	bnei_cont.39344
bnei_else.39345:
	flw	%f1, 0(%a2)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.39357
	addi	%a0, %zero, 0
	j	fbgt_cont.39358
fbgt_else.39357:
	addi	%a0, %zero, 1
fbgt_cont.39358:
	beqi	%a0, 0, bnei_else.39359
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.39344
bnei_else.39359:
	addi	%a0, %zero, 0
bnei_cont.39360:
bnei_cont.39346:
	j	bnei_cont.39344
bnei_else.39343:
	lw	%a1, 0(%t8)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%a2)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.39361
	addi	%a0, %zero, 0
	j	fbgt_cont.39362
fbgt_else.39361:
	addi	%a0, %zero, 1
fbgt_cont.39362:
	beqi	%a0, 0, bnei_else.39363
	flw	%f0, 2(%a1)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.39365
	addi	%a0, %zero, 0
	j	fbgt_cont.39366
fbgt_else.39365:
	addi	%a0, %zero, 1
fbgt_cont.39366:
	beqi	%a0, 0, bnei_else.39367
	flw	%f0, 470(%zero)
	fbne	%f21, %f0, fbeq_else.39369
	addi	%a0, %zero, 1
	j	fbeq_cont.39370
fbeq_else.39369:
	addi	%a0, %zero, 0
fbeq_cont.39370:
	beqi	%a0, 0, bnei_else.39371
	addi	%a0, %zero, 0
	j	bnei_cont.39364
bnei_else.39371:
	addi	%a0, %zero, 1
bnei_cont.39372:
	j	bnei_cont.39364
bnei_else.39367:
	addi	%a0, %zero, 0
bnei_cont.39368:
	j	bnei_cont.39364
bnei_else.39363:
	addi	%a0, %zero, 0
bnei_cont.39364:
	beqi	%a0, 0, bnei_else.39373
	fsw	%f20, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.39374
bnei_else.39373:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%a2)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%a1)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f20, 0(%a0)
	fblt	%f0, %f20, fbgt_else.39375
	addi	%a0, %zero, 0
	j	fbgt_cont.39376
fbgt_else.39375:
	addi	%a0, %zero, 1
fbgt_cont.39376:
	beqi	%a0, 0, bnei_else.39377
	flw	%f0, 2(%a1)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.39379
	addi	%a0, %zero, 0
	j	fbgt_cont.39380
fbgt_else.39379:
	addi	%a0, %zero, 1
fbgt_cont.39380:
	beqi	%a0, 0, bnei_else.39381
	flw	%f0, 470(%zero)
	fbne	%f23, %f0, fbeq_else.39383
	addi	%a0, %zero, 1
	j	fbeq_cont.39384
fbeq_else.39383:
	addi	%a0, %zero, 0
fbeq_cont.39384:
	beqi	%a0, 0, bnei_else.39385
	addi	%a0, %zero, 0
	j	bnei_cont.39378
bnei_else.39385:
	addi	%a0, %zero, 1
bnei_cont.39386:
	j	bnei_cont.39378
bnei_else.39381:
	addi	%a0, %zero, 0
bnei_cont.39382:
	j	bnei_cont.39378
bnei_else.39377:
	addi	%a0, %zero, 0
bnei_cont.39378:
	beqi	%a0, 0, bnei_else.39387
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.39388
bnei_else.39387:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a2)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.39389
	addi	%a0, %zero, 0
	j	fbgt_cont.39390
fbgt_else.39389:
	addi	%a0, %zero, 1
fbgt_cont.39390:
	beqi	%a0, 0, bnei_else.39391
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.39393
	addi	%a0, %zero, 0
	j	fbgt_cont.39394
fbgt_else.39393:
	addi	%a0, %zero, 1
fbgt_cont.39394:
	beqi	%a0, 0, bnei_else.39395
	flw	%f0, 470(%zero)
	fbne	%f18, %f0, fbeq_else.39397
	addi	%a0, %zero, 1
	j	fbeq_cont.39398
fbeq_else.39397:
	addi	%a0, %zero, 0
fbeq_cont.39398:
	beqi	%a0, 0, bnei_else.39399
	addi	%a0, %zero, 0
	j	bnei_cont.39392
bnei_else.39399:
	addi	%a0, %zero, 1
bnei_cont.39400:
	j	bnei_cont.39392
bnei_else.39395:
	addi	%a0, %zero, 0
bnei_cont.39396:
	j	bnei_cont.39392
bnei_else.39391:
	addi	%a0, %zero, 0
bnei_cont.39392:
	beqi	%a0, 0, bnei_else.39401
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.39402
bnei_else.39401:
	addi	%a0, %zero, 0
bnei_cont.39402:
bnei_cont.39388:
bnei_cont.39374:
bnei_cont.39344:
	beqi	%a0, 0, bnei_cont.39342
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.39405
	addi	%a0, %zero, 0
	j	fbgt_cont.39406
fbgt_else.39405:
	addi	%a0, %zero, 1
fbgt_cont.39406:
	beqi	%a0, 0, bnei_cont.39342
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.39342
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -3
	j	bnei_cont.39342
bnei_else.39419:
bnei_cont.39420:
	j	bnei_cont.39342
bnei_else.39417:
bnei_cont.39418:
	j	bnei_cont.39342
bnei_else.39415:
bnei_cont.39416:
	j	bnei_cont.39342
bnei_else.39413:
bnei_cont.39414:
	j	bnei_cont.39342
bnei_else.39411:
bnei_cont.39412:
	j	bnei_cont.39342
bnei_else.39409:
bnei_cont.39410:
	j	bnei_cont.39342
bnei_else.39407:
bnei_cont.39408:
	j	bnei_cont.39342
bnei_else.39403:
bnei_cont.39404:
	j	bnei_cont.39342
bnei_else.39341:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.39421
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.39422
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.39422
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.39422
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 5(%s3)
	beqi	%a0, -1, bnei_cont.39422
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 6(%s3)
	beqi	%a0, -1, bnei_cont.39422
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -3
	j	bnei_cont.39422
bnei_else.39431:
bnei_cont.39432:
	j	bnei_cont.39422
bnei_else.39429:
bnei_cont.39430:
	j	bnei_cont.39422
bnei_else.39427:
bnei_cont.39428:
	j	bnei_cont.39422
bnei_else.39425:
bnei_cont.39426:
	j	bnei_cont.39422
bnei_else.39423:
bnei_cont.39424:
	j	bnei_cont.39422
bnei_else.39421:
bnei_cont.39422:
bnei_cont.39342:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	trace_or_matrix_fast.2956
bnei_else.39340:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.39243:
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
	beqi	%a2, 1, bnei_else.39659
	beqi	%a2, 2, bnei_else.39660
	beqi	%a2, 3, bnei_else.39661
	beqi	%a2, 4, bnei_else.39662
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.39662:
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
	fblt	%f0, %f16, fbgt_else.39664
	addi	%a1, %zero, 0
	j	fbgt_cont.39665
fbgt_else.39664:
	addi	%a1, %zero, 1
fbgt_cont.39665:
	beqi	%a1, 0, bnei_else.39666
	flw	%f1, 463(%zero)
	j	bnei_cont.39667
bnei_else.39666:
	fdiv	%f0, %f18, %f19
	fabs	%f2, %f0
	flw	%f0, 470(%zero)
	fblt	%f2, %f0, fbgt_else.39668
	addi	%a1, %zero, 1
	j	fbgt_cont.39669
fbgt_else.39668:
	addi	%a1, %zero, 0
fbgt_cont.39669:
	fabs	%f19, %f2
	flw	%f0, 462(%zero)
	fblt	%f19, %f0, fbgt_else.39670
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.39672
	flw	%f18, 479(%zero)
	flw	%f0, 474(%zero)
	fdiv	%f20, %f0, %f19
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
	j	fbgt_cont.39673
fbgt_else.39672:
	flw	%f18, 478(%zero)
	flw	%f0, 474(%zero)
	fsub	%f1, %f19, %f0
	fadd	%f0, %f19, %f0
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
fbgt_cont.39673:
	beqi	%a1, 0, bnei_else.39674
	j	fbgt_cont.39671
bnei_else.39674:
	fneg	%f0, %f0
bnei_cont.39675:
	j	fbgt_cont.39671
fbgt_else.39670:
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
fbgt_cont.39671:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.39667:
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
	fblt	%f0, %f16, fbgt_else.39676
	addi	%a1, %zero, 0
	j	fbgt_cont.39677
fbgt_else.39676:
	addi	%a1, %zero, 1
fbgt_cont.39677:
	beqi	%a1, 0, bnei_else.39678
	flw	%f1, 463(%zero)
	j	bnei_cont.39679
bnei_else.39678:
	fdiv	%f0, %f1, %f17
	fabs	%f19, %f0
	flw	%f0, 470(%zero)
	fblt	%f19, %f0, fbgt_else.39680
	addi	%a1, %zero, 1
	j	fbgt_cont.39681
fbgt_else.39680:
	addi	%a1, %zero, 0
fbgt_cont.39681:
	fabs	%f17, %f19
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.39682
	flw	%f0, 455(%zero)
	fblt	%f17, %f0, fbgt_else.39684
	flw	%f16, 479(%zero)
	flw	%f0, 474(%zero)
	fdiv	%f2, %f0, %f17
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
	j	fbgt_cont.39685
fbgt_else.39684:
	flw	%f16, 478(%zero)
	flw	%f0, 474(%zero)
	fsub	%f1, %f17, %f0
	fadd	%f0, %f17, %f0
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
fbgt_cont.39685:
	beqi	%a1, 0, bnei_else.39686
	j	fbgt_cont.39683
bnei_else.39686:
	fneg	%f0, %f0
bnei_cont.39687:
	j	fbgt_cont.39683
fbgt_else.39682:
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
fbgt_cont.39683:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.39679:
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.39688
	addi	%a1, %zero, 0
	j	fbgt_cont.39689
fbgt_else.39688:
	addi	%a1, %zero, 1
fbgt_cont.39689:
	beqi	%a1, 0, bnei_else.39690
	j	bnei_cont.39691
bnei_else.39690:
	fmov	%f1, %f0
bnei_cont.39691:
	flw	%f0, 451(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.39661:
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
	fblt	%f17, %f2, fbgt_else.39693
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.39694
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.39694
fbgt_else.39717:
fbgt_cont.39718:
	j	fbgt_cont.39694
fbgt_else.39715:
fbgt_cont.39716:
	j	fbgt_cont.39694
fbgt_else.39713:
fbgt_cont.39714:
	j	fbgt_cont.39694
fbgt_else.39711:
fbgt_cont.39712:
	j	fbgt_cont.39694
fbgt_else.39709:
fbgt_cont.39710:
	j	fbgt_cont.39694
fbgt_else.39707:
fbgt_cont.39708:
	j	fbgt_cont.39694
fbgt_else.39705:
fbgt_cont.39706:
	j	fbgt_cont.39694
fbgt_else.39703:
fbgt_cont.39704:
	j	fbgt_cont.39694
fbgt_else.39701:
fbgt_cont.39702:
	j	fbgt_cont.39694
fbgt_else.39699:
fbgt_cont.39700:
	j	fbgt_cont.39694
fbgt_else.39697:
fbgt_cont.39698:
	j	fbgt_cont.39694
fbgt_else.39695:
fbgt_cont.39696:
	j	fbgt_cont.39694
fbgt_else.39693:
	fmov	%f1, %f2
fbgt_cont.39694:
	fblt	%f17, %f2, fbgt_else.39719
	fblt	%f17, %f1, fbgt_else.39721
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.39720
fbgt_else.39721:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.39722:
	j	fbgt_cont.39720
fbgt_else.39719:
fbgt_cont.39720:
	fblt	%f17, %f18, fbgt_else.39723
	addi	%a1, %zero, 0
	j	fbgt_cont.39724
fbgt_else.39723:
	addi	%a1, %zero, 1
fbgt_cont.39724:
	fblt	%f17, %f18, fbgt_else.39725
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39726
fbgt_else.39725:
fbgt_cont.39726:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.39727
	beqi	%a1, 0, bnei_else.39729
	addi	%a1, %zero, 0
	j	fbgt_cont.39728
bnei_else.39729:
	addi	%a1, %zero, 1
bnei_cont.39730:
	j	fbgt_cont.39728
fbgt_else.39727:
fbgt_cont.39728:
	fblt	%f17, %f1, fbgt_else.39731
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39732
fbgt_else.39731:
fbgt_cont.39732:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.39733
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.39734
fbgt_else.39733:
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
fbgt_cont.39734:
	beqi	%a1, 0, bnei_else.39735
	j	bnei_cont.39736
bnei_else.39735:
	fneg	%f0, %f0
bnei_cont.39736:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 146(%zero)
	flw	%f0, 474(%zero)
	fsub	%f0, %f0, %f16
	fmul	%f0, %f0, %f1
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.39660:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f1, %f1, %f0
	flw	%f18, 494(%zero)
	flw	%f0, 470(%zero)
	fblt	%f1, %f0, fbgt_else.39738
	addi	%a1, %zero, 1
	j	fbgt_cont.39739
fbgt_else.39738:
	addi	%a1, %zero, 0
fbgt_cont.39739:
	fabs	%f17, %f1
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.39740
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 481(%zero)
	fblt	%f17, %f1, fbgt_cont.39741
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.39741
fbgt_else.39764:
fbgt_cont.39765:
	j	fbgt_cont.39741
fbgt_else.39762:
fbgt_cont.39763:
	j	fbgt_cont.39741
fbgt_else.39760:
fbgt_cont.39761:
	j	fbgt_cont.39741
fbgt_else.39758:
fbgt_cont.39759:
	j	fbgt_cont.39741
fbgt_else.39756:
fbgt_cont.39757:
	j	fbgt_cont.39741
fbgt_else.39754:
fbgt_cont.39755:
	j	fbgt_cont.39741
fbgt_else.39752:
fbgt_cont.39753:
	j	fbgt_cont.39741
fbgt_else.39750:
fbgt_cont.39751:
	j	fbgt_cont.39741
fbgt_else.39748:
fbgt_cont.39749:
	j	fbgt_cont.39741
fbgt_else.39746:
fbgt_cont.39747:
	j	fbgt_cont.39741
fbgt_else.39744:
fbgt_cont.39745:
	j	fbgt_cont.39741
fbgt_else.39742:
fbgt_cont.39743:
	j	fbgt_cont.39741
fbgt_else.39740:
	fmov	%f1, %f2
fbgt_cont.39741:
	fblt	%f17, %f2, fbgt_else.39766
	fblt	%f17, %f1, fbgt_else.39768
	fsub	%f0, %f17, %f1
	flw	%f16, 495(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.39767
fbgt_else.39768:
	flw	%f0, 495(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.39769:
	j	fbgt_cont.39767
fbgt_else.39766:
fbgt_cont.39767:
	fblt	%f17, %f18, fbgt_else.39770
	beqi	%a1, 0, bnei_else.39772
	addi	%a1, %zero, 0
	j	fbgt_cont.39771
bnei_else.39772:
	addi	%a1, %zero, 1
bnei_cont.39773:
	j	fbgt_cont.39771
fbgt_else.39770:
fbgt_cont.39771:
	fblt	%f17, %f18, fbgt_else.39774
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39775
fbgt_else.39774:
fbgt_cont.39775:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.39776
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39777
fbgt_else.39776:
fbgt_cont.39777:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.39778
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
	j	fbgt_cont.39779
fbgt_else.39778:
	fsub	%f0, %f1, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.39779:
	beqi	%a1, 0, bnei_else.39780
	j	bnei_cont.39781
bnei_else.39780:
	fneg	%f0, %f0
bnei_cont.39781:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f16
	fsw	%f0, 145(%zero)
	flw	%f0, 474(%zero)
	fsub	%f0, %f0, %f16
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.39659:
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
	fblt	%f0, %f16, fbgt_else.39783
	addi	%a2, %zero, 0
	j	fbgt_cont.39784
fbgt_else.39783:
	addi	%a2, %zero, 1
fbgt_cont.39784:
	flw	%f1, 2(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 2(%a1)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	fblt	%f0, %f16, fbgt_else.39785
	addi	%a1, %zero, 0
	j	fbgt_cont.39786
fbgt_else.39785:
	addi	%a1, %zero, 1
fbgt_cont.39786:
	beqi	%a2, 0, bnei_else.39787
	beqi	%a1, 0, bnei_else.39789
	flw	%f0, 451(%zero)
	j	bnei_cont.39788
bnei_else.39789:
	flw	%f0, 470(%zero)
bnei_cont.39790:
	j	bnei_cont.39788
bnei_else.39787:
	beqi	%a1, 0, bnei_else.39791
	flw	%f0, 470(%zero)
	j	bnei_cont.39792
bnei_else.39791:
	flw	%f0, 451(%zero)
bnei_cont.39792:
bnei_cont.39788:
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	fmov	%f25, %f0
	fmov	%f26, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%t0, %zero, 0
	blti	%v0, 0, bgti_else.39895
	lw	%t3, 254(%v0)
	lw	%t1, 1(%t3)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39896
	addi	%a0, %zero, 0
	j	fbgt_cont.39897
fbgt_else.39896:
	addi	%a0, %zero, 1
fbgt_cont.39897:
	beqi	%a0, 0, bnei_else.39898
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39900
	addi	%a0, %zero, 0
	j	bnei_cont.39899
fbgt_else.39900:
	addi	%a0, %zero, 1
fbgt_cont.39901:
	j	bnei_cont.39899
bnei_else.39898:
	addi	%a0, %zero, 0
bnei_cont.39899:
	beqi	%a0, 0, bnei_else.39902
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 0(%t3)
	bne	%a1, %a0, bnei_cont.39903
	addi	%v1, %t2, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.39906
	j	bnei_cont.39903
bnei_else.39906:
	lw	%a0, 0(%t1)
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
	flw	%f18, 2(%t3)
	fmul	%f0, %f18, %f25
	fmul	%f17, %f0, %f1
	lw	%a1, 0(%t1)
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
	flw	%f18, 470(%zero)
	fblt	%f18, %f17, fbgt_else.39908
	addi	%a0, %zero, 0
	j	fbgt_cont.39909
fbgt_else.39908:
	addi	%a0, %zero, 1
fbgt_cont.39909:
	beqi	%a0, 0, bnei_else.39910
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
	j	bnei_cont.39911
bnei_else.39910:
bnei_cont.39911:
	fblt	%f18, %f16, fbgt_else.39912
	addi	%a0, %zero, 0
	j	fbgt_cont.39913
fbgt_else.39912:
	addi	%a0, %zero, 1
fbgt_cont.39913:
	beqi	%a0, 0, bnei_cont.39903
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
	j	bnei_cont.39903
bnei_else.39914:
bnei_cont.39915:
bnei_cont.39907:
	j	bnei_cont.39903
beq_else.39904:
beq_cont.39905:
	j	bnei_cont.39903
bnei_else.39902:
bnei_cont.39903:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f26
	fmov	%f0, %f25
	j	trace_reflections.2978
bgti_else.39895:
	add	%t0, %zero, %a0
	jr	%ra
trace_ray.2983:
	fmov	%f4, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.40171
	lw	%a0, 2(%a0)
	sw	%a0, 6(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 7(%sp)
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	fsw	%f1, 8(%sp)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40172
	addi	%a0, %zero, 0
	j	fbgt_cont.40173
fbgt_else.40172:
	addi	%a0, %zero, 1
fbgt_cont.40173:
	beqi	%a0, 0, bnei_else.40174
	flw	%f1, 444(%zero)
	flw	%f0, 8(%sp)
	fblt	%f0, %f1, fbgt_else.40176
	addi	%a0, %zero, 0
	j	bnei_cont.40175
fbgt_else.40176:
	addi	%a0, %zero, 1
fbgt_cont.40177:
	j	bnei_cont.40175
bnei_else.40174:
	addi	%a0, %zero, 0
bnei_cont.40175:
	beqi	%a0, 0, bnei_else.40178
	lw	%k0, 141(%zero)
	lw	%t0, 12(%k0)
	lw	%a0, 2(%t0)
	sw	%a0, 9(%sp)
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fmul	%f25, %f0, %f4
	lw	%a0, 1(%t0)
	addi	%a3, %zero, 1
	beqi	%a0, 1, bnei_else.40179
	beqi	%a0, 2, bnei_else.40181
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
	beqi	%a0, 0, bnei_else.40183
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
	j	bnei_cont.40184
bnei_else.40183:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.40184:
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
	flw	%f0, 470(%zero)
	fbne	%f1, %f0, fbeq_else.40185
	addi	%a0, %zero, 1
	j	fbeq_cont.40186
fbeq_else.40185:
	addi	%a0, %zero, 0
fbeq_cont.40186:
	beqi	%a0, 0, bnei_else.40187
	flw	%f1, 474(%zero)
	j	bnei_cont.40188
bnei_else.40187:
	beqi	%a1, 0, bnei_else.40189
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.40190
bnei_else.40189:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.40190:
bnei_cont.40188:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.40180
bnei_else.40181:
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
bnei_cont.40182:
	j	bnei_cont.40180
bnei_else.40179:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.40191
	addi	%a0, %zero, 1
	j	fbeq_cont.40192
fbeq_else.40191:
	addi	%a0, %zero, 0
fbeq_cont.40192:
	beqi	%a0, 0, bnei_else.40193
	j	bnei_cont.40194
bnei_else.40193:
	fblt	%f0, %f1, fbgt_else.40195
	addi	%a0, %zero, 0
	j	fbgt_cont.40196
fbgt_else.40195:
	addi	%a0, %zero, 1
fbgt_cont.40196:
	beqi	%a0, 0, bnei_else.40197
	flw	%f0, 474(%zero)
	j	bnei_cont.40198
bnei_else.40197:
	flw	%f0, 468(%zero)
bnei_cont.40198:
bnei_cont.40194:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40180:
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
	sll	%a1, %k0, 2
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
	fblt	%f1, %f0, fbgt_else.40199
	addi	%a0, %zero, 0
	j	fbgt_cont.40200
fbgt_else.40199:
	addi	%a0, %zero, 1
fbgt_cont.40200:
	beqi	%a0, 0, bnei_else.40201
	addi	%a0, %zero, 0
	addi	Tu150.3795, %zero, 0
	j	bnei_cont.40202
bnei_else.40201:
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%a3, 0(%at)
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
bnei_cont.40202:
	flw	%f19, 442(%zero)
	lw	%a0, 2(%sp)
	flw	%f16, 0(%a0)
	flw	%f5, 142(%zero)
	fmul	%f1, %f16, %f5
	flw	%f17, 1(%a0)
	flw	%f3, 143(%zero)
	fmul	%f0, %f17, %f3
	fadd	%f1, %f1, %f0
	flw	%f18, 2(%a0)
	flw	%f29, 144(%zero)
	fmul	%f0, %f18, %f29
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f0
	fmul	%f0, %f1, %f5
	fadd	%f0, %f16, %f0
	fsw	%f0, 0(%a0)
	fmul	%f0, %f1, %f3
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%a0)
	fmul	%f0, %f1, %f29
	fadd	%f0, %f18, %f0
	fsw	%f0, 2(%a0)
	lw	%a0, 7(%t0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f4, %f0
	fsw	%f0, 10(%sp)
	lw	%v1, 7(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.40203
	j	bnei_cont.40204
bnei_else.40203:
	flw	%f19, 78(%zero)
	fmul	%f1, %f5, %f19
	flw	%f18, 79(%zero)
	fmul	%f0, %f3, %f18
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
	flw	%f18, 470(%zero)
	fblt	%f18, %f16, fbgt_else.40205
	addi	%a0, %zero, 0
	j	fbgt_cont.40206
fbgt_else.40205:
	addi	%a0, %zero, 1
fbgt_cont.40206:
	beqi	%a0, 0, bnei_else.40207
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
	j	bnei_cont.40208
bnei_else.40207:
bnei_cont.40208:
	fblt	%f18, %f17, fbgt_else.40209
	addi	%a0, %zero, 0
	j	fbgt_cont.40210
fbgt_else.40209:
	addi	%a0, %zero, 1
fbgt_cont.40210:
	beqi	%a0, 0, bnei_else.40211
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
	j	bnei_cont.40212
bnei_else.40211:
bnei_cont.40212:
bnei_cont.40204:
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
	fblt	%f0, %f4, fbgt_else.40213
	addi	%a0, %zero, 0
	j	fbgt_cont.40214
fbgt_else.40213:
	addi	%a0, %zero, 1
fbgt_cont.40214:
	beqi	%a0, 0, bnei_else.40215
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.40216
	j	bgti_cont.40217
bgti_else.40216:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 6(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.40217:
	lw	%a0, 9(%sp)
	beqi	%a0, 2, bnei_else.40218
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.40218:
	flw	%f1, 474(%zero)
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f4, %f0
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
bnei_else.40215:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.40178:
	addi	%a2, %zero, -1
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.40221
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
	flw	%f0, 470(%zero)
	fblt	%f0, %f1, fbgt_else.40222
	addi	%a0, %zero, 0
	j	fbgt_cont.40223
fbgt_else.40222:
	addi	%a0, %zero, 1
fbgt_cont.40223:
	beqi	%a0, 0, bnei_else.40224
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f1
	fmul	%f1, %f0, %f4
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
bnei_else.40224:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.40221:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.40171:
	jr	%ra
trace_diffuse_ray.2989:
	fmov	%f25, %f0
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 2(%sp)
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -3
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40364
	addi	%a0, %zero, 0
	j	fbgt_cont.40365
fbgt_else.40364:
	addi	%a0, %zero, 1
fbgt_cont.40365:
	beqi	%a0, 0, bnei_else.40366
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40368
	addi	%a0, %zero, 0
	j	bnei_cont.40367
fbgt_else.40368:
	addi	%a0, %zero, 1
fbgt_cont.40369:
	j	bnei_cont.40367
bnei_else.40366:
	addi	%a0, %zero, 0
bnei_cont.40367:
	beqi	%a0, 0, bnei_else.40370
	lw	%a0, 141(%zero)
	lw	%t8, 12(%a0)
	lw	%a0, 0(%sp)
	lw	%a2, 0(%a0)
	lw	%a0, 1(%t8)
	beqi	%a0, 1, bnei_else.40371
	beqi	%a0, 2, bnei_else.40373
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t8)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t8)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t8)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t8)
	flw	%f0, 0(%a0)
	fmul	%f21, %f18, %f0
	lw	%a0, 4(%t8)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t8)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t8)
	beqi	%a0, 0, bnei_else.40375
	lw	%a0, 9(%t8)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t8)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t8)
	flw	%f0, 2(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%t8)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t8)
	flw	%f0, 1(%a0)
	fmul	%f1, %f18, %f0
	lw	%a0, 9(%t8)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40376
bnei_else.40375:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.40376:
	lw	%a1, 6(%t8)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 470(%zero)
	fbne	%f1, %f0, fbeq_else.40377
	addi	%a0, %zero, 1
	j	fbeq_cont.40378
fbeq_else.40377:
	addi	%a0, %zero, 0
fbeq_cont.40378:
	beqi	%a0, 0, bnei_else.40379
	flw	%f1, 474(%zero)
	j	bnei_cont.40380
bnei_else.40379:
	beqi	%a1, 0, bnei_else.40381
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.40382
bnei_else.40381:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.40382:
bnei_cont.40380:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.40372
bnei_else.40373:
	lw	%a0, 4(%t8)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t8)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t8)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40374:
	j	bnei_cont.40372
bnei_else.40371:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.40383
	addi	%a0, %zero, 1
	j	fbeq_cont.40384
fbeq_else.40383:
	addi	%a0, %zero, 0
fbeq_cont.40384:
	beqi	%a0, 0, bnei_else.40385
	j	bnei_cont.40386
bnei_else.40385:
	fblt	%f0, %f1, fbgt_else.40387
	addi	%a0, %zero, 0
	j	fbgt_cont.40388
fbgt_else.40387:
	addi	%a0, %zero, 1
fbgt_cont.40388:
	beqi	%a0, 0, bnei_else.40389
	flw	%f0, 474(%zero)
	j	bnei_cont.40390
bnei_else.40389:
	flw	%f0, 468(%zero)
bnei_cont.40390:
bnei_cont.40386:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40372:
	addi	%v1, %zero, 138
	addi	%v0, %t8, 0
	addi	%sp, %sp, 3
	jal	utexture.2971
	addi	%sp, %sp, -3
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.40391
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.40391:
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
	fneg	%f1, %f0
	flw	%f0, 470(%zero)
	fblt	%f0, %f1, fbgt_else.40393
	addi	%a0, %zero, 0
	j	fbgt_cont.40394
fbgt_else.40393:
	addi	%a0, %zero, 1
fbgt_cont.40394:
	beqi	%a0, 0, bnei_else.40395
	j	bnei_cont.40396
bnei_else.40395:
	fmov	%f1, %f0
bnei_cont.40396:
	fmul	%f1, %f25, %f1
	lw	%a0, 7(%t8)
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
bnei_else.40370:
	lw	%ra, 1(%sp)
	jr	%ra
iter_trace_diffuse_rays.2992:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%t3, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t1, 6(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%t0, %zero, 0
	blti	%a1, 0, bgti_else.41412
	add	%at, %v0, %a1
	lw	%t1, 0(%at)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	flw	%f26, 0(%v1)
	fmul	%f1, %f0, %f26
	addi	%t3, %zero, 1
	flw	%f0, 1(%a0)
	flw	%f27, 1(%v1)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f28, 2(%v1)
	fmul	%f0, %f0, %f28
	fadd	%f1, %f1, %f0
	flw	%f25, 470(%zero)
	fblt	%f1, %f25, fbgt_else.41413
	addi	%a0, %zero, 0
	j	fbgt_cont.41414
fbgt_else.41413:
	addi	%a0, %zero, 1
fbgt_cont.41414:
	beqi	%a0, 0, bnei_else.41415
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t1, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f29, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s3, 0(%t2)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.41417
	beqi	%a2, 99, bnei_else.41419
	lw	%a3, 12(%a2)
	lw	%a1, 10(%a3)
	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f18, 2(%a1)
	lw	%a0, 1(%t1)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a3)
	beqi	%a0, 1, bnei_else.41421
	beqi	%a0, 2, bnei_else.41423
	flw	%f17, 0(%a2)
	fbne	%f17, %f25, fbeq_else.41425
	addi	%a0, %zero, 1
	j	fbeq_cont.41426
fbeq_else.41425:
	addi	%a0, %zero, 0
fbeq_cont.41426:
	beqi	%a0, 0, bnei_else.41427
	addi	%a0, %zero, 0
	j	bnei_cont.41422
bnei_else.41427:
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
	fblt	%f25, %f0, fbgt_else.41429
	addi	%a0, %zero, 0
	j	fbgt_cont.41430
fbgt_else.41429:
	addi	%a0, %zero, 1
fbgt_cont.41430:
	beqi	%a0, 0, bnei_else.41431
	lw	%a0, 6(%a3)
	beqi	%a0, 0, bnei_else.41433
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.41434
bnei_else.41433:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.41434:
	addi	%a0, %zero, 1
	j	bnei_cont.41422
bnei_else.41431:
	addi	%a0, %zero, 0
bnei_cont.41432:
bnei_cont.41428:
	j	bnei_cont.41422
bnei_else.41423:
	flw	%f1, 0(%a2)
	fblt	%f1, %f25, fbgt_else.41435
	addi	%a0, %zero, 0
	j	fbgt_cont.41436
fbgt_else.41435:
	addi	%a0, %zero, 1
fbgt_cont.41436:
	beqi	%a0, 0, bnei_else.41437
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.41422
bnei_else.41437:
	addi	%a0, %zero, 0
bnei_cont.41438:
bnei_cont.41424:
	j	bnei_cont.41422
bnei_else.41421:
	lw	%a1, 0(%t1)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f20
	flw	%f2, 1(%a2)
	fmul	%f21, %f0, %f2
	flw	%f19, 1(%a1)
	fmul	%f0, %f21, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.41439
	addi	%a0, %zero, 0
	j	fbgt_cont.41440
fbgt_else.41439:
	addi	%a0, %zero, 1
fbgt_cont.41440:
	beqi	%a0, 0, bnei_else.41441
	flw	%f0, 2(%a1)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.41443
	addi	%a0, %zero, 0
	j	fbgt_cont.41444
fbgt_else.41443:
	addi	%a0, %zero, 1
fbgt_cont.41444:
	beqi	%a0, 0, bnei_else.41445
	fbne	%f2, %f25, fbeq_else.41447
	addi	%a0, %zero, 1
	j	fbeq_cont.41448
fbeq_else.41447:
	addi	%a0, %zero, 0
fbeq_cont.41448:
	beqi	%a0, 0, bnei_else.41449
	addi	%a0, %zero, 0
	j	bnei_cont.41442
bnei_else.41449:
	addi	%a0, %zero, 1
bnei_cont.41450:
	j	bnei_cont.41442
bnei_else.41445:
	addi	%a0, %zero, 0
bnei_cont.41446:
	j	bnei_cont.41442
bnei_else.41441:
	addi	%a0, %zero, 0
bnei_cont.41442:
	beqi	%a0, 0, bnei_else.41451
	fsw	%f21, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.41452
bnei_else.41451:
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
	fblt	%f0, %f2, fbgt_else.41453
	addi	%a0, %zero, 0
	j	fbgt_cont.41454
fbgt_else.41453:
	addi	%a0, %zero, 1
fbgt_cont.41454:
	beqi	%a0, 0, bnei_else.41455
	flw	%f0, 2(%a1)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.41457
	addi	%a0, %zero, 0
	j	fbgt_cont.41458
fbgt_else.41457:
	addi	%a0, %zero, 1
fbgt_cont.41458:
	beqi	%a0, 0, bnei_else.41459
	fbne	%f22, %f25, fbeq_else.41461
	addi	%a0, %zero, 1
	j	fbeq_cont.41462
fbeq_else.41461:
	addi	%a0, %zero, 0
fbeq_cont.41462:
	beqi	%a0, 0, bnei_else.41463
	addi	%a0, %zero, 0
	j	bnei_cont.41456
bnei_else.41463:
	addi	%a0, %zero, 1
bnei_cont.41464:
	j	bnei_cont.41456
bnei_else.41459:
	addi	%a0, %zero, 0
bnei_cont.41460:
	j	bnei_cont.41456
bnei_else.41455:
	addi	%a0, %zero, 0
bnei_cont.41456:
	beqi	%a0, 0, bnei_else.41465
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.41466
bnei_else.41465:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a2)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.41467
	addi	%a0, %zero, 0
	j	fbgt_cont.41468
fbgt_else.41467:
	addi	%a0, %zero, 1
fbgt_cont.41468:
	beqi	%a0, 0, bnei_else.41469
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.41471
	addi	%a0, %zero, 0
	j	fbgt_cont.41472
fbgt_else.41471:
	addi	%a0, %zero, 1
fbgt_cont.41472:
	beqi	%a0, 0, bnei_else.41473
	fbne	%f18, %f25, fbeq_else.41475
	addi	%a0, %zero, 1
	j	fbeq_cont.41476
fbeq_else.41475:
	addi	%a0, %zero, 0
fbeq_cont.41476:
	beqi	%a0, 0, bnei_else.41477
	addi	%a0, %zero, 0
	j	bnei_cont.41470
bnei_else.41477:
	addi	%a0, %zero, 1
bnei_cont.41478:
	j	bnei_cont.41470
bnei_else.41473:
	addi	%a0, %zero, 0
bnei_cont.41474:
	j	bnei_cont.41470
bnei_else.41469:
	addi	%a0, %zero, 0
bnei_cont.41470:
	beqi	%a0, 0, bnei_else.41479
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.41480
bnei_else.41479:
	addi	%a0, %zero, 0
bnei_cont.41480:
bnei_cont.41466:
bnei_cont.41452:
bnei_cont.41422:
	beqi	%a0, 0, bnei_cont.41420
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.41483
	addi	%a0, %zero, 0
	j	fbgt_cont.41484
fbgt_else.41483:
	addi	%a0, %zero, 1
fbgt_cont.41484:
	beqi	%a0, 0, bnei_cont.41420
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.41420
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.41420
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.41420
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.41420
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 9
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -9
	j	bnei_cont.41420
bnei_else.41493:
bnei_cont.41494:
	j	bnei_cont.41420
bnei_else.41491:
bnei_cont.41492:
	j	bnei_cont.41420
bnei_else.41489:
bnei_cont.41490:
	j	bnei_cont.41420
bnei_else.41487:
bnei_cont.41488:
	j	bnei_cont.41420
bnei_else.41485:
bnei_cont.41486:
	j	bnei_cont.41420
bnei_else.41481:
bnei_cont.41482:
	j	bnei_cont.41420
bnei_else.41419:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.41495
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.41496
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.41496
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.41496
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 9
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -9
	j	bnei_cont.41496
bnei_else.41501:
bnei_cont.41502:
	j	bnei_cont.41496
bnei_else.41499:
bnei_cont.41500:
	j	bnei_cont.41496
bnei_else.41497:
bnei_cont.41498:
	j	bnei_cont.41496
bnei_else.41495:
bnei_cont.41496:
bnei_cont.41420:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	j	bnei_cont.41418
bnei_else.41417:
bnei_cont.41418:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41503
	addi	%a0, %zero, 0
	j	fbgt_cont.41504
fbgt_else.41503:
	addi	%a0, %zero, 1
fbgt_cont.41504:
	beqi	%a0, 0, bnei_else.41505
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41507
	addi	%a0, %zero, 0
	j	bnei_cont.41506
fbgt_else.41507:
	addi	%a0, %zero, 1
fbgt_cont.41508:
	j	bnei_cont.41506
bnei_else.41505:
	addi	%a0, %zero, 0
bnei_cont.41506:
	beqi	%a0, 0, bnei_cont.41416
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.41511
	beqi	%a0, 2, bnei_else.41513
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f23, %f18, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f21, %f2, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f17, %f22, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.41515
	lw	%a0, 9(%t3)
	flw	%f16, 2(%a0)
	fmul	%f1, %f2, %f16
	lw	%a0, 9(%t3)
	flw	%f20, 1(%a0)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	lw	%a0, 9(%t3)
	flw	%f16, 0(%a0)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f2, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41516
bnei_else.41515:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.41516:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.41517
	addi	%a0, %zero, 1
	j	fbeq_cont.41518
fbeq_else.41517:
	addi	%a0, %zero, 0
fbeq_cont.41518:
	beqi	%a0, 0, bnei_else.41519
	flw	%f1, 474(%zero)
	j	bnei_cont.41520
bnei_else.41519:
	beqi	%a1, 0, bnei_else.41521
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.41522
bnei_else.41521:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.41522:
bnei_cont.41520:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.41512
bnei_else.41513:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41514:
	j	bnei_cont.41512
bnei_else.41511:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.41523
	addi	%a0, %zero, 1
	j	fbeq_cont.41524
fbeq_else.41523:
	addi	%a0, %zero, 0
fbeq_cont.41524:
	beqi	%a0, 0, bnei_else.41525
	fmov	%f0, %f25
	j	bnei_cont.41526
bnei_else.41525:
	fblt	%f25, %f0, fbgt_else.41527
	addi	%a0, %zero, 0
	j	fbgt_cont.41528
fbgt_else.41527:
	addi	%a0, %zero, 1
fbgt_cont.41528:
	beqi	%a0, 0, bnei_else.41529
	flw	%f0, 474(%zero)
	j	bnei_cont.41530
bnei_else.41529:
	flw	%f0, 468(%zero)
bnei_cont.41530:
bnei_cont.41526:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41512:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 9
	jal	utexture.2971
	addi	%sp, %sp, -9
	addi	%v1, %t2, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.41531
	j	bnei_cont.41416
bnei_else.41531:
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
	fblt	%f25, %f0, fbgt_else.41533
	addi	%a0, %zero, 0
	j	fbgt_cont.41534
fbgt_else.41533:
	addi	%a0, %zero, 1
fbgt_cont.41534:
	beqi	%a0, 0, bnei_else.41535
	j	bnei_cont.41536
bnei_else.41535:
	fmov	%f0, %f25
bnei_cont.41536:
	fmul	%f1, %f29, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.41532:
	j	bnei_cont.41416
bnei_else.41509:
bnei_cont.41510:
	j	bnei_cont.41416
bnei_else.41415:
	flw	%f0, 439(%zero)
	fdiv	%f29, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s3, 0(%t2)
	lw	%a2, 0(%s3)
	beqi	%a2, -1, bnei_else.41537
	beqi	%a2, 99, bnei_else.41539
	lw	%a3, 12(%a2)
	lw	%a1, 10(%a3)
	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	flw	%f18, 2(%a1)
	lw	%a0, 1(%t1)
	add	%at, %a0, %a2
	lw	%a2, 0(%at)
	lw	%a0, 1(%a3)
	beqi	%a0, 1, bnei_else.41541
	beqi	%a0, 2, bnei_else.41543
	flw	%f17, 0(%a2)
	fbne	%f17, %f25, fbeq_else.41545
	addi	%a0, %zero, 1
	j	fbeq_cont.41546
fbeq_else.41545:
	addi	%a0, %zero, 0
fbeq_cont.41546:
	beqi	%a0, 0, bnei_else.41547
	addi	%a0, %zero, 0
	j	bnei_cont.41542
bnei_else.41547:
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
	fblt	%f25, %f0, fbgt_else.41549
	addi	%a0, %zero, 0
	j	fbgt_cont.41550
fbgt_else.41549:
	addi	%a0, %zero, 1
fbgt_cont.41550:
	beqi	%a0, 0, bnei_else.41551
	lw	%a0, 6(%a3)
	beqi	%a0, 0, bnei_else.41553
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.41554
bnei_else.41553:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.41554:
	addi	%a0, %zero, 1
	j	bnei_cont.41542
bnei_else.41551:
	addi	%a0, %zero, 0
bnei_cont.41552:
bnei_cont.41548:
	j	bnei_cont.41542
bnei_else.41543:
	flw	%f1, 0(%a2)
	fblt	%f1, %f25, fbgt_else.41555
	addi	%a0, %zero, 0
	j	fbgt_cont.41556
fbgt_else.41555:
	addi	%a0, %zero, 1
fbgt_cont.41556:
	beqi	%a0, 0, bnei_else.41557
	flw	%f0, 3(%a1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.41542
bnei_else.41557:
	addi	%a0, %zero, 0
bnei_cont.41558:
bnei_cont.41544:
	j	bnei_cont.41542
bnei_else.41541:
	lw	%a1, 0(%t1)
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f20
	flw	%f2, 1(%a2)
	fmul	%f21, %f0, %f2
	flw	%f19, 1(%a1)
	fmul	%f0, %f21, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	lw	%a0, 4(%a3)
	flw	%f17, 1(%a0)
	fblt	%f0, %f17, fbgt_else.41559
	addi	%a0, %zero, 0
	j	fbgt_cont.41560
fbgt_else.41559:
	addi	%a0, %zero, 1
fbgt_cont.41560:
	beqi	%a0, 0, bnei_else.41561
	flw	%f0, 2(%a1)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.41563
	addi	%a0, %zero, 0
	j	fbgt_cont.41564
fbgt_else.41563:
	addi	%a0, %zero, 1
fbgt_cont.41564:
	beqi	%a0, 0, bnei_else.41565
	fbne	%f2, %f25, fbeq_else.41567
	addi	%a0, %zero, 1
	j	fbeq_cont.41568
fbeq_else.41567:
	addi	%a0, %zero, 0
fbeq_cont.41568:
	beqi	%a0, 0, bnei_else.41569
	addi	%a0, %zero, 0
	j	bnei_cont.41562
bnei_else.41569:
	addi	%a0, %zero, 1
bnei_cont.41570:
	j	bnei_cont.41562
bnei_else.41565:
	addi	%a0, %zero, 0
bnei_cont.41566:
	j	bnei_cont.41562
bnei_else.41561:
	addi	%a0, %zero, 0
bnei_cont.41562:
	beqi	%a0, 0, bnei_else.41571
	fsw	%f21, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.41572
bnei_else.41571:
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
	fblt	%f0, %f2, fbgt_else.41573
	addi	%a0, %zero, 0
	j	fbgt_cont.41574
fbgt_else.41573:
	addi	%a0, %zero, 1
fbgt_cont.41574:
	beqi	%a0, 0, bnei_else.41575
	flw	%f0, 2(%a1)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	lw	%a0, 4(%a3)
	flw	%f0, 2(%a0)
	fblt	%f1, %f0, fbgt_else.41577
	addi	%a0, %zero, 0
	j	fbgt_cont.41578
fbgt_else.41577:
	addi	%a0, %zero, 1
fbgt_cont.41578:
	beqi	%a0, 0, bnei_else.41579
	fbne	%f22, %f25, fbeq_else.41581
	addi	%a0, %zero, 1
	j	fbeq_cont.41582
fbeq_else.41581:
	addi	%a0, %zero, 0
fbeq_cont.41582:
	beqi	%a0, 0, bnei_else.41583
	addi	%a0, %zero, 0
	j	bnei_cont.41576
bnei_else.41583:
	addi	%a0, %zero, 1
bnei_cont.41584:
	j	bnei_cont.41576
bnei_else.41579:
	addi	%a0, %zero, 0
bnei_cont.41580:
	j	bnei_cont.41576
bnei_else.41575:
	addi	%a0, %zero, 0
bnei_cont.41576:
	beqi	%a0, 0, bnei_else.41585
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.41586
bnei_else.41585:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%a2)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.41587
	addi	%a0, %zero, 0
	j	fbgt_cont.41588
fbgt_else.41587:
	addi	%a0, %zero, 1
fbgt_cont.41588:
	beqi	%a0, 0, bnei_else.41589
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.41591
	addi	%a0, %zero, 0
	j	fbgt_cont.41592
fbgt_else.41591:
	addi	%a0, %zero, 1
fbgt_cont.41592:
	beqi	%a0, 0, bnei_else.41593
	fbne	%f18, %f25, fbeq_else.41595
	addi	%a0, %zero, 1
	j	fbeq_cont.41596
fbeq_else.41595:
	addi	%a0, %zero, 0
fbeq_cont.41596:
	beqi	%a0, 0, bnei_else.41597
	addi	%a0, %zero, 0
	j	bnei_cont.41590
bnei_else.41597:
	addi	%a0, %zero, 1
bnei_cont.41598:
	j	bnei_cont.41590
bnei_else.41593:
	addi	%a0, %zero, 0
bnei_cont.41594:
	j	bnei_cont.41590
bnei_else.41589:
	addi	%a0, %zero, 0
bnei_cont.41590:
	beqi	%a0, 0, bnei_else.41599
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.41600
bnei_else.41599:
	addi	%a0, %zero, 0
bnei_cont.41600:
bnei_cont.41586:
bnei_cont.41572:
bnei_cont.41542:
	beqi	%a0, 0, bnei_cont.41540
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.41603
	addi	%a0, %zero, 0
	j	fbgt_cont.41604
fbgt_else.41603:
	addi	%a0, %zero, 1
fbgt_cont.41604:
	beqi	%a0, 0, bnei_cont.41540
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_cont.41540
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.41540
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.41540
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.41540
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 9
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -9
	j	bnei_cont.41540
bnei_else.41613:
bnei_cont.41614:
	j	bnei_cont.41540
bnei_else.41611:
bnei_cont.41612:
	j	bnei_cont.41540
bnei_else.41609:
bnei_cont.41610:
	j	bnei_cont.41540
bnei_else.41607:
bnei_cont.41608:
	j	bnei_cont.41540
bnei_else.41605:
bnei_cont.41606:
	j	bnei_cont.41540
bnei_else.41601:
bnei_cont.41602:
	j	bnei_cont.41540
bnei_else.41539:
	lw	%a0, 1(%s3)
	beqi	%a0, -1, bnei_else.41615
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 2(%s3)
	beqi	%a0, -1, bnei_cont.41616
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 3(%s3)
	beqi	%a0, -1, bnei_cont.41616
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%a0, 4(%s3)
	beqi	%a0, -1, bnei_cont.41616
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s3, 0
	addi	%sp, %sp, 9
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -9
	j	bnei_cont.41616
bnei_else.41621:
bnei_cont.41622:
	j	bnei_cont.41616
bnei_else.41619:
bnei_cont.41620:
	j	bnei_cont.41616
bnei_else.41617:
bnei_cont.41618:
	j	bnei_cont.41616
bnei_else.41615:
bnei_cont.41616:
bnei_cont.41540:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	j	bnei_cont.41538
bnei_else.41537:
bnei_cont.41538:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41623
	addi	%a0, %zero, 0
	j	fbgt_cont.41624
fbgt_else.41623:
	addi	%a0, %zero, 1
fbgt_cont.41624:
	beqi	%a0, 0, bnei_else.41625
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41627
	addi	%a0, %zero, 0
	j	bnei_cont.41626
fbgt_else.41627:
	addi	%a0, %zero, 1
fbgt_cont.41628:
	j	bnei_cont.41626
bnei_else.41625:
	addi	%a0, %zero, 0
bnei_cont.41626:
	beqi	%a0, 0, bnei_else.41629
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.41631
	beqi	%a0, 2, bnei_else.41633
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f23, %f18, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f21, %f2, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f17, %f22, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.41635
	lw	%a0, 9(%t3)
	flw	%f16, 2(%a0)
	fmul	%f1, %f2, %f16
	lw	%a0, 9(%t3)
	flw	%f20, 1(%a0)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f19, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f23, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	lw	%a0, 9(%t3)
	flw	%f16, 0(%a0)
	fmul	%f0, %f22, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f20
	fmul	%f0, %f2, %f16
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41636
bnei_else.41635:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.41636:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.41637
	addi	%a0, %zero, 1
	j	fbeq_cont.41638
fbeq_else.41637:
	addi	%a0, %zero, 0
fbeq_cont.41638:
	beqi	%a0, 0, bnei_else.41639
	flw	%f1, 474(%zero)
	j	bnei_cont.41640
bnei_else.41639:
	beqi	%a1, 0, bnei_else.41641
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.41642
bnei_else.41641:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.41642:
bnei_cont.41640:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.41632
bnei_else.41633:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41634:
	j	bnei_cont.41632
bnei_else.41631:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.41643
	addi	%a0, %zero, 1
	j	fbeq_cont.41644
fbeq_else.41643:
	addi	%a0, %zero, 0
fbeq_cont.41644:
	beqi	%a0, 0, bnei_else.41645
	fmov	%f0, %f25
	j	bnei_cont.41646
bnei_else.41645:
	fblt	%f25, %f0, fbgt_else.41647
	addi	%a0, %zero, 0
	j	fbgt_cont.41648
fbgt_else.41647:
	addi	%a0, %zero, 1
fbgt_cont.41648:
	beqi	%a0, 0, bnei_else.41649
	flw	%f0, 474(%zero)
	j	bnei_cont.41650
bnei_else.41649:
	flw	%f0, 468(%zero)
bnei_cont.41650:
bnei_cont.41646:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41632:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 9
	jal	utexture.2971
	addi	%sp, %sp, -9
	addi	%v1, %t2, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.41651
	j	bnei_cont.41630
bnei_else.41651:
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
	fblt	%f25, %f0, fbgt_else.41653
	addi	%a0, %zero, 0
	j	fbgt_cont.41654
fbgt_else.41653:
	addi	%a0, %zero, 1
fbgt_cont.41654:
	beqi	%a0, 0, bnei_else.41655
	j	bnei_cont.41656
bnei_else.41655:
	fmov	%f0, %f25
bnei_cont.41656:
	fmul	%f1, %f29, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.41652:
	j	bnei_cont.41630
bnei_else.41629:
bnei_cont.41630:
bnei_cont.41416:
	lw	%a0, 3(%sp)
	addi	%t2, %a0, -2
	blti	%t2, 0, bgti_else.41657
	lw	%a0, 0(%sp)
	add	%at, %a0, %t2
	lw	%t1, 0(%at)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f26
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f28
	fadd	%f1, %f1, %f0
	fblt	%f1, %f25, fbgt_else.41658
	addi	%a0, %zero, 0
	j	fbgt_cont.41659
fbgt_else.41658:
	addi	%a0, %zero, 1
fbgt_cont.41659:
	beqi	%a0, 0, bnei_else.41660
	addi	%a1, %t2, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t1, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f26, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 9(%sp)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -10
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41662
	addi	%a0, %zero, 0
	j	fbgt_cont.41663
fbgt_else.41662:
	addi	%a0, %zero, 1
fbgt_cont.41663:
	beqi	%a0, 0, bnei_else.41664
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41666
	addi	%a0, %zero, 0
	j	bnei_cont.41665
fbgt_else.41666:
	addi	%a0, %zero, 1
fbgt_cont.41667:
	j	bnei_cont.41665
bnei_else.41664:
	addi	%a0, %zero, 0
bnei_cont.41665:
	beqi	%a0, 0, bnei_cont.41661
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.41670
	beqi	%a0, 2, bnei_else.41672
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.41674
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41675
bnei_else.41674:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.41675:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.41676
	addi	%a0, %zero, 1
	j	fbeq_cont.41677
fbeq_else.41676:
	addi	%a0, %zero, 0
fbeq_cont.41677:
	beqi	%a0, 0, bnei_else.41678
	flw	%f1, 474(%zero)
	j	bnei_cont.41679
bnei_else.41678:
	beqi	%a1, 0, bnei_else.41680
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.41681
bnei_else.41680:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.41681:
bnei_cont.41679:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.41671
bnei_else.41672:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41673:
	j	bnei_cont.41671
bnei_else.41670:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.41682
	addi	%a0, %zero, 1
	j	fbeq_cont.41683
fbeq_else.41682:
	addi	%a0, %zero, 0
fbeq_cont.41683:
	beqi	%a0, 0, bnei_else.41684
	fmov	%f0, %f25
	j	bnei_cont.41685
bnei_else.41684:
	fblt	%f25, %f0, fbgt_else.41686
	addi	%a0, %zero, 0
	j	fbgt_cont.41687
fbgt_else.41686:
	addi	%a0, %zero, 1
fbgt_cont.41687:
	beqi	%a0, 0, bnei_else.41688
	flw	%f0, 474(%zero)
	j	bnei_cont.41689
bnei_else.41688:
	flw	%f0, 468(%zero)
bnei_cont.41689:
bnei_cont.41685:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41671:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 10
	jal	utexture.2971
	addi	%sp, %sp, -10
	lw	%v1, 9(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.41690
	j	bnei_cont.41661
bnei_else.41690:
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
	fblt	%f25, %f0, fbgt_else.41692
	addi	%a0, %zero, 0
	j	fbgt_cont.41693
fbgt_else.41692:
	addi	%a0, %zero, 1
fbgt_cont.41693:
	beqi	%a0, 0, bnei_else.41694
	j	bnei_cont.41695
bnei_else.41694:
	fmov	%f0, %f25
bnei_cont.41695:
	fmul	%f1, %f26, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.41691:
	j	bnei_cont.41661
bnei_else.41668:
bnei_cont.41669:
	j	bnei_cont.41661
bnei_else.41660:
	flw	%f0, 439(%zero)
	fdiv	%f26, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 10(%sp)
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -11
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41696
	addi	%a0, %zero, 0
	j	fbgt_cont.41697
fbgt_else.41696:
	addi	%a0, %zero, 1
fbgt_cont.41697:
	beqi	%a0, 0, bnei_else.41698
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41700
	addi	%a0, %zero, 0
	j	bnei_cont.41699
fbgt_else.41700:
	addi	%a0, %zero, 1
fbgt_cont.41701:
	j	bnei_cont.41699
bnei_else.41698:
	addi	%a0, %zero, 0
bnei_cont.41699:
	beqi	%a0, 0, bnei_else.41702
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t1)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.41704
	beqi	%a0, 2, bnei_else.41706
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.41708
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.41709
bnei_else.41708:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.41709:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.41710
	addi	%a0, %zero, 1
	j	fbeq_cont.41711
fbeq_else.41710:
	addi	%a0, %zero, 0
fbeq_cont.41711:
	beqi	%a0, 0, bnei_else.41712
	flw	%f1, 474(%zero)
	j	bnei_cont.41713
bnei_else.41712:
	beqi	%a1, 0, bnei_else.41714
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.41715
bnei_else.41714:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.41715:
bnei_cont.41713:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.41705
bnei_else.41706:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.41707:
	j	bnei_cont.41705
bnei_else.41704:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.41716
	addi	%a0, %zero, 1
	j	fbeq_cont.41717
fbeq_else.41716:
	addi	%a0, %zero, 0
fbeq_cont.41717:
	beqi	%a0, 0, bnei_else.41718
	fmov	%f0, %f25
	j	bnei_cont.41719
bnei_else.41718:
	fblt	%f25, %f0, fbgt_else.41720
	addi	%a0, %zero, 0
	j	fbgt_cont.41721
fbgt_else.41720:
	addi	%a0, %zero, 1
fbgt_cont.41721:
	beqi	%a0, 0, bnei_else.41722
	flw	%f0, 474(%zero)
	j	bnei_cont.41723
bnei_else.41722:
	flw	%f0, 468(%zero)
bnei_cont.41723:
bnei_cont.41719:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41705:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 11
	jal	utexture.2971
	addi	%sp, %sp, -11
	lw	%v1, 10(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.41724
	j	bnei_cont.41703
bnei_else.41724:
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
	fblt	%f25, %f0, fbgt_else.41726
	addi	%a0, %zero, 0
	j	fbgt_cont.41727
fbgt_else.41726:
	addi	%a0, %zero, 1
fbgt_cont.41727:
	beqi	%a0, 0, bnei_else.41728
	j	bnei_cont.41729
bnei_else.41728:
	fmov	%f0, %f25
bnei_cont.41729:
	fmul	%f1, %f26, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.41725:
	j	bnei_cont.41703
bnei_else.41702:
bnei_cont.41703:
bnei_cont.41661:
	addi	%a1, %t2, -2
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.41657:
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
bgti_else.41412:
	add	%t0, %zero, %a0
	jr	%ra
trace_diffuse_rays.2997:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%t3, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%t1, %zero, 0
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -8
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
	flw	%f25, 470(%zero)
	fblt	%f1, %f25, fbgt_else.41985
	addi	%a0, %zero, 0
	j	fbgt_cont.41986
fbgt_else.41985:
	addi	%a0, %zero, 1
fbgt_cont.41986:
	beqi	%a0, 0, bnei_else.41987
	lw	%a0, 0(%sp)
	lw	%t0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f26, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.41989
	addi	%a0, %zero, 0
	j	fbgt_cont.41990
fbgt_else.41989:
	addi	%a0, %zero, 1
fbgt_cont.41990:
	beqi	%a0, 0, bnei_else.41991
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.41993
	addi	%a0, %zero, 0
	j	bnei_cont.41992
fbgt_else.41993:
	addi	%a0, %zero, 1
fbgt_cont.41994:
	j	bnei_cont.41992
bnei_else.41991:
	addi	%a0, %zero, 0
bnei_cont.41992:
	beqi	%a0, 0, bnei_cont.41988
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.41997
	beqi	%a0, 2, bnei_else.41999
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.42001
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42002
bnei_else.42001:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.42002:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.42003
	addi	%a0, %zero, 1
	j	fbeq_cont.42004
fbeq_else.42003:
	addi	%a0, %zero, 0
fbeq_cont.42004:
	beqi	%a0, 0, bnei_else.42005
	flw	%f1, 474(%zero)
	j	bnei_cont.42006
bnei_else.42005:
	beqi	%a1, 0, bnei_else.42007
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.42008
bnei_else.42007:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.42008:
bnei_cont.42006:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.41998
bnei_else.41999:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.42000:
	j	bnei_cont.41998
bnei_else.41997:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.42009
	addi	%a0, %zero, 1
	j	fbeq_cont.42010
fbeq_else.42009:
	addi	%a0, %zero, 0
fbeq_cont.42010:
	beqi	%a0, 0, bnei_else.42011
	fmov	%f0, %f25
	j	bnei_cont.42012
bnei_else.42011:
	fblt	%f25, %f0, fbgt_else.42013
	addi	%a0, %zero, 0
	j	fbgt_cont.42014
fbgt_else.42013:
	addi	%a0, %zero, 1
fbgt_cont.42014:
	beqi	%a0, 0, bnei_else.42015
	flw	%f0, 474(%zero)
	j	bnei_cont.42016
bnei_else.42015:
	flw	%f0, 468(%zero)
bnei_cont.42016:
bnei_cont.42012:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.41998:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%sp, %sp, -8
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.42017
	j	bnei_cont.41988
bnei_else.42017:
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
	fblt	%f25, %f0, fbgt_else.42019
	addi	%a0, %zero, 0
	j	fbgt_cont.42020
fbgt_else.42019:
	addi	%a0, %zero, 1
fbgt_cont.42020:
	beqi	%a0, 0, bnei_else.42021
	j	bnei_cont.42022
bnei_else.42021:
	fmov	%f0, %f25
bnei_cont.42022:
	fmul	%f1, %f26, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.42018:
	j	bnei_cont.41988
bnei_else.41995:
bnei_cont.41996:
	j	bnei_cont.41988
bnei_else.41987:
	flw	%f0, 439(%zero)
	fdiv	%f26, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.42023
	addi	%a0, %zero, 0
	j	fbgt_cont.42024
fbgt_else.42023:
	addi	%a0, %zero, 1
fbgt_cont.42024:
	beqi	%a0, 0, bnei_else.42025
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.42027
	addi	%a0, %zero, 0
	j	bnei_cont.42026
fbgt_else.42027:
	addi	%a0, %zero, 1
fbgt_cont.42028:
	j	bnei_cont.42026
bnei_else.42025:
	addi	%a0, %zero, 0
bnei_cont.42026:
	beqi	%a0, 0, bnei_else.42029
	lw	%a0, 141(%zero)
	lw	%t3, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%t3)
	beqi	%a0, 1, bnei_else.42031
	beqi	%a0, 2, bnei_else.42033
	flw	%f1, 138(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%t3)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%t3)
	beqi	%a0, 0, bnei_else.42035
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%t3)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%t3)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.42036
bnei_else.42035:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.42036:
	lw	%a1, 6(%t3)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %f25, fbeq_else.42037
	addi	%a0, %zero, 1
	j	fbeq_cont.42038
fbeq_else.42037:
	addi	%a0, %zero, 0
fbeq_cont.42038:
	beqi	%a0, 0, bnei_else.42039
	flw	%f1, 474(%zero)
	j	bnei_cont.42040
bnei_else.42039:
	beqi	%a1, 0, bnei_else.42041
	flw	%f0, 468(%zero)
	fdiv	%f1, %f0, %f1
	j	bnei_cont.42042
bnei_else.42041:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.42042:
bnei_cont.42040:
	fmul	%f0, %f18, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.42032
bnei_else.42033:
	lw	%a0, 4(%t3)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t3)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.42034:
	j	bnei_cont.42032
bnei_else.42031:
	lw	%a0, 136(%zero)
	fsw	%f25, 142(%zero)
	fsw	%f25, 143(%zero)
	fsw	%f25, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %f25, fbeq_else.42043
	addi	%a0, %zero, 1
	j	fbeq_cont.42044
fbeq_else.42043:
	addi	%a0, %zero, 0
fbeq_cont.42044:
	beqi	%a0, 0, bnei_else.42045
	fmov	%f0, %f25
	j	bnei_cont.42046
bnei_else.42045:
	fblt	%f25, %f0, fbgt_else.42047
	addi	%a0, %zero, 0
	j	fbgt_cont.42048
fbgt_else.42047:
	addi	%a0, %zero, 1
fbgt_cont.42048:
	beqi	%a0, 0, bnei_else.42049
	flw	%f0, 474(%zero)
	j	bnei_cont.42050
bnei_else.42049:
	flw	%f0, 468(%zero)
bnei_cont.42050:
bnei_cont.42046:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.42032:
	addi	%v1, %zero, 138
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%sp, %sp, -8
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.42051
	j	bnei_cont.42030
bnei_else.42051:
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
	fblt	%f25, %f0, fbgt_else.42053
	addi	%a0, %zero, 0
	j	fbgt_cont.42054
fbgt_else.42053:
	addi	%a0, %zero, 1
fbgt_cont.42054:
	beqi	%a0, 0, bnei_else.42055
	j	bnei_cont.42056
bnei_else.42055:
	fmov	%f0, %f25
bnei_cont.42056:
	fmul	%f1, %f26, %f0
	lw	%a0, 7(%t3)
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
bnei_cont.42052:
	j	bnei_cont.42030
bnei_else.42029:
bnei_cont.42030:
bnei_cont.41988:
	addi	%a1, %zero, 116
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
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
	blt	%at, %v1, bgt_else.42207
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.42208
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.42209
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
	beqi	%t2, 0, bnei_else.42211
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
	j	bnei_cont.42212
bnei_else.42211:
bnei_cont.42212:
	beqi	%t2, 1, bnei_else.42213
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
	j	bnei_cont.42214
bnei_else.42213:
bnei_cont.42214:
	beqi	%t2, 2, bnei_else.42215
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
	j	bnei_cont.42216
bnei_else.42215:
bnei_cont.42216:
	beqi	%t2, 3, bnei_else.42217
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
	j	bnei_cont.42218
bnei_else.42217:
bnei_cont.42218:
	beqi	%t2, 4, bnei_else.42219
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
	j	bnei_cont.42220
bnei_else.42219:
bnei_cont.42220:
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
	j	bnei_cont.42210
bnei_else.42209:
bnei_cont.42210:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.42221
	lw	%k0, 0(%sp)
	lw	%a0, 2(%k0)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.42222
	lw	%a0, 3(%k0)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.42223
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
	beqi	%t3, 0, bnei_else.42225
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.42226
bnei_else.42225:
bnei_cont.42226:
	beqi	%t3, 1, bnei_else.42227
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.42228
bnei_else.42227:
bnei_cont.42228:
	beqi	%t3, 2, bnei_else.42229
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.42230
bnei_else.42229:
bnei_cont.42230:
	beqi	%t3, 3, bnei_else.42231
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.42232
bnei_else.42231:
bnei_cont.42232:
	beqi	%t3, 4, bnei_else.42233
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -8
	j	bnei_cont.42234
bnei_else.42233:
bnei_cont.42234:
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
	j	bnei_cont.42224
bnei_else.42223:
bnei_cont.42224:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.42222:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.42221:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.42208:
	jr	%ra
bgt_else.42207:
	jr	%ra
try_exploit_neighbors.3030:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s0, 0(%at)
	sw	%s0, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.42451
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	blti	%k0, 0, bgti_else.42452
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%s0, 0(%at)
	add	%at, %a0, %v0
	lw	%ra, 0(%at)
	lw	%k0, 2(%ra)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42453
	add	%at, %a2, %v0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42455
	addi	%k0, %v0, -1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42457
	addi	%k0, %v0, 1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s0, beq_else.42459
	addi	%a3, %zero, 1
	j	beq_cont.42454
beq_else.42459:
	addi	%a3, %zero, 0
beq_cont.42460:
	j	beq_cont.42454
beq_else.42457:
	addi	%a3, %zero, 0
beq_cont.42458:
	j	beq_cont.42454
beq_else.42455:
	addi	%a3, %zero, 0
beq_cont.42456:
	j	beq_cont.42454
beq_else.42453:
	addi	%a3, %zero, 0
beq_cont.42454:
	beqi	%a3, 0, bnei_else.42461
	lw	%s3, 2(%sp)
	lw	%a3, 3(%s3)
	lw	%s2, 0(%sp)
	add	%at, %a3, %s2
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.42462
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
	j	bnei_cont.42463
bnei_else.42462:
bnei_cont.42463:
	lw	%a3, 0(%sp)
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.42464
	lw	%s0, 2(%sp)
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	blti	%k0, 0, bgti_else.42465
	lw	%k0, 2(%s0)
	add	%at, %k0, %a3
	lw	%s0, 0(%at)
	lw	%k0, 2(%ra)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42466
	add	%at, %a2, %v0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42468
	addi	%k0, %v0, -1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42470
	addi	%k0, %v0, 1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%k0, 2(%k0)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	bne	%k0, %s0, beq_else.42472
	addi	%k0, %zero, 1
	j	beq_cont.42467
beq_else.42472:
	addi	%k0, %zero, 0
beq_cont.42473:
	j	beq_cont.42467
beq_else.42470:
	addi	%k0, %zero, 0
beq_cont.42471:
	j	beq_cont.42467
beq_else.42468:
	addi	%k0, %zero, 0
beq_cont.42469:
	j	beq_cont.42467
beq_else.42466:
	addi	%k0, %zero, 0
beq_cont.42467:
	beqi	%k0, 0, bnei_else.42474
	lw	%s3, 2(%sp)
	lw	%k0, 3(%s3)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	beqi	%k0, 0, bnei_else.42475
	lw	%s4, 5(%ra)
	addi	%k0, %v0, -1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%s2, 5(%k0)
	lw	%s1, 5(%s3)
	addi	%k0, %v0, 1
	add	%at, %a1, %k0
	lw	%k0, 0(%at)
	lw	%s0, 5(%k0)
	add	%at, %a2, %v0
	lw	%k0, 0(%at)
	lw	%ra, 5(%k0)
	add	%at, %s4, %a3
	lw	%k0, 0(%at)
	flw	%f0, 0(%k0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%k0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%k0)
	fsw	%f0, 150(%zero)
	add	%at, %s2, %a3
	lw	%k0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s1, %a3
	lw	%k0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %s0, %a3
	lw	%k0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %ra, %a3
	lw	%k0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%k0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%k0, 4(%s3)
	add	%at, %k0, %a3
	lw	%k0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%k0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%k0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%k0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.42476
bnei_else.42475:
bnei_cont.42476:
	addi	%a3, %a3, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3030
bnei_else.42474:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %a3, 0
	j	do_without_neighbors.3014
bgti_else.42465:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.42464:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.42461:
	lw	%ra, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %ra, bgt_else.42479
	lw	%k0, 2(%sp)
	lw	%a0, 2(%k0)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.42480
	lw	%a0, 3(%k0)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.42481
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
	beqi	%a1, 0, bnei_else.42483
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.42484
bnei_else.42483:
bnei_cont.42484:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.42485
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.42486
bnei_else.42485:
bnei_cont.42486:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.42487
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.42488
bnei_else.42487:
bnei_cont.42488:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.42489
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.42490
bnei_else.42489:
bnei_cont.42490:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.42491
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	j	bnei_cont.42492
bnei_else.42491:
bnei_cont.42492:
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
	j	bnei_cont.42482
bnei_else.42481:
bnei_cont.42482:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3014
bgti_else.42480:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.42479:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.42452:
	jr	%ra
bgt_else.42451:
	jr	%ra
pretrace_diffuse_rays.3043:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.42598
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.42599
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.42600
	lw	%a0, 6(%v0)
	lw	%a2, 0(%a0)
	flw	%f0, 470(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
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
	j	bnei_cont.42601
bnei_else.42600:
bnei_cont.42601:
	lw	%a0, 1(%sp)
	addi	%t0, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t0, bgt_else.42602
	lw	%a1, 0(%sp)
	lw	%a0, 2(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.42603
	lw	%a0, 3(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.42604
	lw	%a0, 6(%a1)
	lw	%a0, 0(%a0)
	flw	%f2, 470(%zero)
	fsw	%f2, 148(%zero)
	fsw	%f2, 149(%zero)
	fsw	%f2, 150(%zero)
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
	fblt	%f1, %f2, fbgt_else.42606
	addi	%a0, %zero, 0
	j	fbgt_cont.42607
fbgt_else.42606:
	addi	%a0, %zero, 1
fbgt_cont.42607:
	beqi	%a0, 0, bnei_else.42608
	lw	%a0, 5(%sp)
	lw	%v0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.42609
bnei_else.42608:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.42609:
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
	j	bnei_cont.42605
bnei_else.42604:
bnei_cont.42605:
	addi	%v1, %t0, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3043
bgti_else.42603:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.42602:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.42599:
	jr	%ra
bgt_else.42598:
	jr	%ra
pretrace_pixels.3046:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	fsw	%f6, 6(%sp)
	sw	%t3, 7(%sp)
	sw	%t2, 8(%sp)
	sw	%t1, 9(%sp)
	sw	%t0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%v0, %zero, 0
	blti	%v1, 0, bgti_else.42710
	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	sub	%a0, %v1, %a0
	itof	%f16, %a0
	fmul	%f17, %f17, %f16
	flw	%f16, 165(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f0, %f16, %f0
	fsw	%f0, 174(%zero)
	addi	%a0, %zero, 1
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
	fsqrt	%f1, %f0
	flw	%f6, 470(%zero)
	fbne	%f1, %f6, fbeq_else.42711
	addi	%a0, %zero, 1
	j	fbeq_cont.42712
fbeq_else.42711:
	addi	%a0, %zero, 0
fbeq_cont.42712:
	beqi	%a0, 0, bnei_else.42713
	flw	%f1, 474(%zero)
	j	bnei_cont.42714
bnei_else.42713:
	flw	%f0, 474(%zero)
	fdiv	%f1, %f0, %f1
bnei_cont.42714:
	fmul	%f0, %f18, %f1
	fsw	%f0, 174(%zero)
	fmul	%f0, %f17, %f1
	fsw	%f0, 175(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 176(%zero)
	fsw	%f6, 151(%zero)
	fsw	%f6, 152(%zero)
	fsw	%f6, 153(%zero)
	flw	%f0, 75(%zero)
	fsw	%f0, 159(%zero)
	flw	%f0, 76(%zero)
	fsw	%f0, 160(%zero)
	flw	%f0, 77(%zero)
	fsw	%f0, 161(%zero)
	flw	%f0, 474(%zero)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%t0, 0(%at)
	addi	%v1, %zero, 174
	addi	%a0, %t0, 0
	fmov	%f1, %f6
	addi	%sp, %sp, 12
	jal	trace_ray.2983
	addi	%sp, %sp, -12
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
	blti	%a0, 0, bgti_else.42715
	lw	%a0, 3(%t0)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.42717
	lw	%a0, 6(%t0)
	lw	%a2, 0(%a0)
	fsw	%f6, 148(%zero)
	fsw	%f6, 149(%zero)
	fsw	%f6, 150(%zero)
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
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -12
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
	fblt	%f1, %f6, fbgt_else.42719
	addi	%a0, %zero, 0
	j	fbgt_cont.42720
fbgt_else.42719:
	addi	%a0, %zero, 1
fbgt_cont.42720:
	beqi	%a0, 0, bnei_else.42721
	lw	%v0, 119(%t1)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -12
	j	bnei_cont.42722
bnei_else.42721:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -12
bnei_cont.42722:
	addi	%a1, %zero, 116
	addi	%a0, %t3, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -12
	lw	%a0, 5(%t0)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.42718
bnei_else.42717:
bnei_cont.42718:
	addi	%v1, %zero, 1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -12
	j	bgti_cont.42716
bgti_else.42715:
bgti_cont.42716:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.42723
	addi	%a0, %a0, -5
	j	bgti_cont.42724
bgti_else.42723:
bgti_cont.42724:
	flw	%f6, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%t2, 8(%sp)
	lw	%t1, 9(%sp)
	lw	%t0, 10(%sp)
	lw	%ra, 11(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.42710:
	jr	%ra
scan_pixel.3057:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%t5, 5(%sp)
	sw	%t4, 6(%sp)
	sw	%t3, 7(%sp)
	sw	%t2, 8(%sp)
	add	%a0, %zero, %t1
	sw	%a0, 9(%sp)
	add	%a2, %zero, %t0
	sw	%a2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%t0, %zero, 0
	lw	%t1, 154(%zero)
	blt	%v0, %t1, bgt_else.45049
	add	%t1, %zero, %a0
	add	%t0, %zero, %a2
	jr	%ra
bgt_else.45049:
	add	%at, %a1, %v0
	lw	%t3, 0(%at)
	lw	%a1, 0(%t3)
	flw	%f0, 0(%a1)
	fsw	%f0, 151(%zero)
	addi	%a0, %zero, 1
	flw	%f0, 1(%a1)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a1)
	fsw	%f0, 153(%zero)
	lw	%a1, 155(%zero)
	sw	%a1, 12(%sp)
	addi	%a0, %v1, 1
	sw	%a0, 13(%sp)
	blt	%a0, %a1, bgt_else.45051
	addi	%a0, %zero, 0
	j	bgt_cont.45052
bgt_else.45051:
	blt	%zero, %v1, bgt_else.45053
	addi	%a0, %zero, 0
	j	bgt_cont.45054
bgt_else.45053:
	addi	%a0, %v0, 1
	blt	%a0, %t1, bgt_else.45055
	addi	%a0, %zero, 0
	j	bgt_cont.45056
bgt_else.45055:
	blt	%zero, %v0, bgt_else.45057
	addi	%a0, %zero, 0
	j	bgt_cont.45058
bgt_else.45057:
	addi	%a0, %zero, 1
bgt_cont.45058:
bgt_cont.45056:
bgt_cont.45054:
bgt_cont.45052:
	beqi	%a0, 0, bnei_else.45059
	lw	%a0, 2(%t3)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bnei_cont.45060
	lw	%a0, 2(%t3)
	lw	%a2, 0(%a0)
	lw	%a0, 2(%sp)
	lw	%k0, 0(%sp)
	add	%at, %a0, %k0
	lw	%a3, 0(%at)
	lw	%a0, 2(%a3)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.45063
	lw	%a0, 4(%sp)
	add	%at, %a0, %k0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.45065
	addi	%a0, %k0, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.45067
	addi	%a0, %k0, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.45069
	addi	%a0, %zero, 1
	j	beq_cont.45064
beq_else.45069:
	addi	%a0, %zero, 0
beq_cont.45070:
	j	beq_cont.45064
beq_else.45067:
	addi	%a0, %zero, 0
beq_cont.45068:
	j	beq_cont.45064
beq_else.45065:
	addi	%a0, %zero, 0
beq_cont.45066:
	j	beq_cont.45064
beq_else.45063:
	addi	%a0, %zero, 0
beq_cont.45064:
	beqi	%a0, 0, bnei_else.45071
	lw	%a0, 3(%t3)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.45073
	lw	%s0, 5(%a3)
	lw	%ra, 0(%sp)
	addi	%a0, %ra, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%k0, 5(%a0)
	lw	%a3, 5(%t3)
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
	lw	%a0, 4(%t3)
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
	j	bnei_cont.45074
bnei_else.45073:
bnei_cont.45074:
	addi	%a3, %zero, 1
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -14
	j	bnei_cont.45060
bnei_else.45071:
	addi	%v1, %t0, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -14
bnei_cont.45072:
	j	bnei_cont.45060
bgti_else.45061:
bgti_cont.45062:
	j	bnei_cont.45060
bnei_else.45059:
	lw	%a0, 2(%t3)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bgti_else.45075
	lw	%a0, 3(%t3)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.45077
	lw	%a3, 5(%t3)
	lw	%a2, 7(%t3)
	lw	%a1, 1(%t3)
	lw	%a0, 4(%t3)
	sw	%a0, 14(%sp)
	lw	%a0, 0(%a3)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%t3)
	lw	%t5, 0(%a0)
	lw	%t4, 0(%a2)
	lw	%t2, 0(%a1)
	beqi	%t5, 0, bnei_else.45079
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t4, 0
	addi	%sp, %sp, 15
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -15
	j	bnei_cont.45080
bnei_else.45079:
bnei_cont.45080:
	beqi	%t5, 1, bnei_else.45081
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t4, 0
	addi	%sp, %sp, 15
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -15
	j	bnei_cont.45082
bnei_else.45081:
bnei_cont.45082:
	beqi	%t5, 2, bnei_else.45083
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t4, 0
	addi	%sp, %sp, 15
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -15
	j	bnei_cont.45084
bnei_else.45083:
bnei_cont.45084:
	beqi	%t5, 3, bnei_else.45085
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t4, 0
	addi	%sp, %sp, 15
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -15
	j	bnei_cont.45086
bnei_else.45085:
bnei_cont.45086:
	beqi	%t5, 4, bnei_else.45087
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t4, 0
	addi	%sp, %sp, 15
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -15
	j	bnei_cont.45088
bnei_else.45087:
bnei_cont.45088:
	lw	%a0, 14(%sp)
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
	j	bnei_cont.45078
bnei_else.45077:
bnei_cont.45078:
	addi	%v1, %zero, 1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -15
	j	bgti_cont.45076
bgti_else.45075:
bgti_cont.45076:
bnei_cont.45060:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45089
	blti	%a1, 0, bgti_else.45091
	j	bgt_cont.45090
bgti_else.45091:
	addi	%a1, %zero, 0
bgti_cont.45092:
	j	bgt_cont.45090
bgt_else.45089:
	addi	%a1, %zero, 255
bgt_cont.45090:
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	addi	%t2, %zero, 10
	blti	%a1, 10, bgti_else.45093
	blti	%a1, 20, bgti_else.45095
	blti	%a1, 30, bgti_else.45097
	blti	%a1, 40, bgti_else.45099
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45094
	blti	%a1, 20, bgti_else.45103
	blti	%a1, 30, bgti_else.45105
	blti	%a1, 40, bgti_else.45107
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45094
	blti	%a1, 20, bgti_else.45111
	blti	%a1, 30, bgti_else.45113
	blti	%a1, 40, bgti_else.45115
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45094
	blti	%a1, 20, bgti_else.45119
	blti	%a1, 30, bgti_else.45121
	blti	%a1, 40, bgti_else.45123
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45094
bgti_else.45123:
	addi	%a1, %a1, -30
bgti_cont.45124:
	j	bgti_cont.45094
bgti_else.45121:
	addi	%a1, %a1, -20
bgti_cont.45122:
	j	bgti_cont.45094
bgti_else.45119:
	addi	%a1, %a1, -10
bgti_cont.45120:
	j	bgti_cont.45094
bgti_else.45117:
bgti_cont.45118:
	j	bgti_cont.45094
bgti_else.45115:
	addi	%a1, %a1, -30
bgti_cont.45116:
	j	bgti_cont.45094
bgti_else.45113:
	addi	%a1, %a1, -20
bgti_cont.45114:
	j	bgti_cont.45094
bgti_else.45111:
	addi	%a1, %a1, -10
bgti_cont.45112:
	j	bgti_cont.45094
bgti_else.45109:
bgti_cont.45110:
	j	bgti_cont.45094
bgti_else.45107:
	addi	%a1, %a1, -30
bgti_cont.45108:
	j	bgti_cont.45094
bgti_else.45105:
	addi	%a1, %a1, -20
bgti_cont.45106:
	j	bgti_cont.45094
bgti_else.45103:
	addi	%a1, %a1, -10
bgti_cont.45104:
	j	bgti_cont.45094
bgti_else.45101:
bgti_cont.45102:
	j	bgti_cont.45094
bgti_else.45099:
	addi	%a1, %a1, -30
bgti_cont.45100:
	j	bgti_cont.45094
bgti_else.45097:
	addi	%a1, %a1, -20
bgti_cont.45098:
	j	bgti_cont.45094
bgti_else.45095:
	addi	%a1, %a1, -10
bgti_cont.45096:
	j	bgti_cont.45094
bgti_else.45093:
bgti_cont.45094:
	blt	%zero, %a2, bgt_else.45125
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45126
bgt_else.45125:
	addi	%v1, %t0, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.45127
	blti	%a2, 20, bgti_else.45129
	blti	%a2, 30, bgti_else.45131
	blti	%a2, 40, bgti_else.45133
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45128
	blti	%a2, 20, bgti_else.45137
	blti	%a2, 30, bgti_else.45139
	blti	%a2, 40, bgti_else.45141
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45128
	blti	%a2, 20, bgti_else.45145
	blti	%a2, 30, bgti_else.45147
	blti	%a2, 40, bgti_else.45149
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45128
	blti	%a2, 20, bgti_else.45153
	blti	%a2, 30, bgti_else.45155
	blti	%a2, 40, bgti_else.45157
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45128
bgti_else.45157:
	addi	%a2, %a2, -30
bgti_cont.45158:
	j	bgti_cont.45128
bgti_else.45155:
	addi	%a2, %a2, -20
bgti_cont.45156:
	j	bgti_cont.45128
bgti_else.45153:
	addi	%a2, %a2, -10
bgti_cont.45154:
	j	bgti_cont.45128
bgti_else.45151:
bgti_cont.45152:
	j	bgti_cont.45128
bgti_else.45149:
	addi	%a2, %a2, -30
bgti_cont.45150:
	j	bgti_cont.45128
bgti_else.45147:
	addi	%a2, %a2, -20
bgti_cont.45148:
	j	bgti_cont.45128
bgti_else.45145:
	addi	%a2, %a2, -10
bgti_cont.45146:
	j	bgti_cont.45128
bgti_else.45143:
bgti_cont.45144:
	j	bgti_cont.45128
bgti_else.45141:
	addi	%a2, %a2, -30
bgti_cont.45142:
	j	bgti_cont.45128
bgti_else.45139:
	addi	%a2, %a2, -20
bgti_cont.45140:
	j	bgti_cont.45128
bgti_else.45137:
	addi	%a2, %a2, -10
bgti_cont.45138:
	j	bgti_cont.45128
bgti_else.45135:
bgti_cont.45136:
	j	bgti_cont.45128
bgti_else.45133:
	addi	%a2, %a2, -30
bgti_cont.45134:
	j	bgti_cont.45128
bgti_else.45131:
	addi	%a2, %a2, -20
bgti_cont.45132:
	j	bgti_cont.45128
bgti_else.45129:
	addi	%a2, %a2, -10
bgti_cont.45130:
	j	bgti_cont.45128
bgti_else.45127:
bgti_cont.45128:
	blt	%zero, %a0, bgt_else.45159
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45160
bgt_else.45159:
	blti	%a0, 10, bgti_else.45161
	blti	%a0, 20, bgti_else.45163
	blti	%a0, 30, bgti_else.45165
	blti	%a0, 40, bgti_else.45167
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45162
	blti	%a0, 20, bgti_else.45171
	blti	%a0, 30, bgti_else.45173
	blti	%a0, 40, bgti_else.45175
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45162
	blti	%a0, 20, bgti_else.45179
	blti	%a0, 30, bgti_else.45181
	blti	%a0, 40, bgti_else.45183
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45162
	blti	%a0, 20, bgti_else.45187
	blti	%a0, 30, bgti_else.45189
	blti	%a0, 40, bgti_else.45191
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45162
bgti_else.45191:
	addi	%a0, %a0, -30
bgti_cont.45192:
	j	bgti_cont.45162
bgti_else.45189:
	addi	%a0, %a0, -20
bgti_cont.45190:
	j	bgti_cont.45162
bgti_else.45187:
	addi	%a0, %a0, -10
bgti_cont.45188:
	j	bgti_cont.45162
bgti_else.45185:
bgti_cont.45186:
	j	bgti_cont.45162
bgti_else.45183:
	addi	%a0, %a0, -30
bgti_cont.45184:
	j	bgti_cont.45162
bgti_else.45181:
	addi	%a0, %a0, -20
bgti_cont.45182:
	j	bgti_cont.45162
bgti_else.45179:
	addi	%a0, %a0, -10
bgti_cont.45180:
	j	bgti_cont.45162
bgti_else.45177:
bgti_cont.45178:
	j	bgti_cont.45162
bgti_else.45175:
	addi	%a0, %a0, -30
bgti_cont.45176:
	j	bgti_cont.45162
bgti_else.45173:
	addi	%a0, %a0, -20
bgti_cont.45174:
	j	bgti_cont.45162
bgti_else.45171:
	addi	%a0, %a0, -10
bgti_cont.45172:
	j	bgti_cont.45162
bgti_else.45169:
bgti_cont.45170:
	j	bgti_cont.45162
bgti_else.45167:
	addi	%a0, %a0, -30
bgti_cont.45168:
	j	bgti_cont.45162
bgti_else.45165:
	addi	%a0, %a0, -20
bgti_cont.45166:
	j	bgti_cont.45162
bgti_else.45163:
	addi	%a0, %a0, -10
bgti_cont.45164:
	j	bgti_cont.45162
bgti_else.45161:
bgti_cont.45162:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45160:
bgt_cont.45126:
	addi	%t3, %zero, 32
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45193
	blti	%a1, 0, bgti_else.45195
	j	bgt_cont.45194
bgti_else.45195:
	addi	%a1, %zero, 0
bgti_cont.45196:
	j	bgt_cont.45194
bgt_else.45193:
	addi	%a1, %zero, 255
bgt_cont.45194:
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.45197
	blti	%a1, 20, bgti_else.45199
	blti	%a1, 30, bgti_else.45201
	blti	%a1, 40, bgti_else.45203
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45198
	blti	%a1, 20, bgti_else.45207
	blti	%a1, 30, bgti_else.45209
	blti	%a1, 40, bgti_else.45211
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45198
	blti	%a1, 20, bgti_else.45215
	blti	%a1, 30, bgti_else.45217
	blti	%a1, 40, bgti_else.45219
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45198
	blti	%a1, 20, bgti_else.45223
	blti	%a1, 30, bgti_else.45225
	blti	%a1, 40, bgti_else.45227
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45198
bgti_else.45227:
	addi	%a1, %a1, -30
bgti_cont.45228:
	j	bgti_cont.45198
bgti_else.45225:
	addi	%a1, %a1, -20
bgti_cont.45226:
	j	bgti_cont.45198
bgti_else.45223:
	addi	%a1, %a1, -10
bgti_cont.45224:
	j	bgti_cont.45198
bgti_else.45221:
bgti_cont.45222:
	j	bgti_cont.45198
bgti_else.45219:
	addi	%a1, %a1, -30
bgti_cont.45220:
	j	bgti_cont.45198
bgti_else.45217:
	addi	%a1, %a1, -20
bgti_cont.45218:
	j	bgti_cont.45198
bgti_else.45215:
	addi	%a1, %a1, -10
bgti_cont.45216:
	j	bgti_cont.45198
bgti_else.45213:
bgti_cont.45214:
	j	bgti_cont.45198
bgti_else.45211:
	addi	%a1, %a1, -30
bgti_cont.45212:
	j	bgti_cont.45198
bgti_else.45209:
	addi	%a1, %a1, -20
bgti_cont.45210:
	j	bgti_cont.45198
bgti_else.45207:
	addi	%a1, %a1, -10
bgti_cont.45208:
	j	bgti_cont.45198
bgti_else.45205:
bgti_cont.45206:
	j	bgti_cont.45198
bgti_else.45203:
	addi	%a1, %a1, -30
bgti_cont.45204:
	j	bgti_cont.45198
bgti_else.45201:
	addi	%a1, %a1, -20
bgti_cont.45202:
	j	bgti_cont.45198
bgti_else.45199:
	addi	%a1, %a1, -10
bgti_cont.45200:
	j	bgti_cont.45198
bgti_else.45197:
bgti_cont.45198:
	blt	%zero, %a2, bgt_else.45229
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45230
bgt_else.45229:
	addi	%v1, %t0, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.45231
	blti	%a2, 20, bgti_else.45233
	blti	%a2, 30, bgti_else.45235
	blti	%a2, 40, bgti_else.45237
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45232
	blti	%a2, 20, bgti_else.45241
	blti	%a2, 30, bgti_else.45243
	blti	%a2, 40, bgti_else.45245
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45232
	blti	%a2, 20, bgti_else.45249
	blti	%a2, 30, bgti_else.45251
	blti	%a2, 40, bgti_else.45253
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45232
	blti	%a2, 20, bgti_else.45257
	blti	%a2, 30, bgti_else.45259
	blti	%a2, 40, bgti_else.45261
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45232
bgti_else.45261:
	addi	%a2, %a2, -30
bgti_cont.45262:
	j	bgti_cont.45232
bgti_else.45259:
	addi	%a2, %a2, -20
bgti_cont.45260:
	j	bgti_cont.45232
bgti_else.45257:
	addi	%a2, %a2, -10
bgti_cont.45258:
	j	bgti_cont.45232
bgti_else.45255:
bgti_cont.45256:
	j	bgti_cont.45232
bgti_else.45253:
	addi	%a2, %a2, -30
bgti_cont.45254:
	j	bgti_cont.45232
bgti_else.45251:
	addi	%a2, %a2, -20
bgti_cont.45252:
	j	bgti_cont.45232
bgti_else.45249:
	addi	%a2, %a2, -10
bgti_cont.45250:
	j	bgti_cont.45232
bgti_else.45247:
bgti_cont.45248:
	j	bgti_cont.45232
bgti_else.45245:
	addi	%a2, %a2, -30
bgti_cont.45246:
	j	bgti_cont.45232
bgti_else.45243:
	addi	%a2, %a2, -20
bgti_cont.45244:
	j	bgti_cont.45232
bgti_else.45241:
	addi	%a2, %a2, -10
bgti_cont.45242:
	j	bgti_cont.45232
bgti_else.45239:
bgti_cont.45240:
	j	bgti_cont.45232
bgti_else.45237:
	addi	%a2, %a2, -30
bgti_cont.45238:
	j	bgti_cont.45232
bgti_else.45235:
	addi	%a2, %a2, -20
bgti_cont.45236:
	j	bgti_cont.45232
bgti_else.45233:
	addi	%a2, %a2, -10
bgti_cont.45234:
	j	bgti_cont.45232
bgti_else.45231:
bgti_cont.45232:
	blt	%zero, %a0, bgt_else.45263
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45264
bgt_else.45263:
	blti	%a0, 10, bgti_else.45265
	blti	%a0, 20, bgti_else.45267
	blti	%a0, 30, bgti_else.45269
	blti	%a0, 40, bgti_else.45271
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45266
	blti	%a0, 20, bgti_else.45275
	blti	%a0, 30, bgti_else.45277
	blti	%a0, 40, bgti_else.45279
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45266
	blti	%a0, 20, bgti_else.45283
	blti	%a0, 30, bgti_else.45285
	blti	%a0, 40, bgti_else.45287
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45266
	blti	%a0, 20, bgti_else.45291
	blti	%a0, 30, bgti_else.45293
	blti	%a0, 40, bgti_else.45295
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45266
bgti_else.45295:
	addi	%a0, %a0, -30
bgti_cont.45296:
	j	bgti_cont.45266
bgti_else.45293:
	addi	%a0, %a0, -20
bgti_cont.45294:
	j	bgti_cont.45266
bgti_else.45291:
	addi	%a0, %a0, -10
bgti_cont.45292:
	j	bgti_cont.45266
bgti_else.45289:
bgti_cont.45290:
	j	bgti_cont.45266
bgti_else.45287:
	addi	%a0, %a0, -30
bgti_cont.45288:
	j	bgti_cont.45266
bgti_else.45285:
	addi	%a0, %a0, -20
bgti_cont.45286:
	j	bgti_cont.45266
bgti_else.45283:
	addi	%a0, %a0, -10
bgti_cont.45284:
	j	bgti_cont.45266
bgti_else.45281:
bgti_cont.45282:
	j	bgti_cont.45266
bgti_else.45279:
	addi	%a0, %a0, -30
bgti_cont.45280:
	j	bgti_cont.45266
bgti_else.45277:
	addi	%a0, %a0, -20
bgti_cont.45278:
	j	bgti_cont.45266
bgti_else.45275:
	addi	%a0, %a0, -10
bgti_cont.45276:
	j	bgti_cont.45266
bgti_else.45273:
bgti_cont.45274:
	j	bgti_cont.45266
bgti_else.45271:
	addi	%a0, %a0, -30
bgti_cont.45272:
	j	bgti_cont.45266
bgti_else.45269:
	addi	%a0, %a0, -20
bgti_cont.45270:
	j	bgti_cont.45266
bgti_else.45267:
	addi	%a0, %a0, -10
bgti_cont.45268:
	j	bgti_cont.45266
bgti_else.45265:
bgti_cont.45266:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45264:
bgt_cont.45230:
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45297
	blti	%a1, 0, bgti_else.45299
	j	bgt_cont.45298
bgti_else.45299:
	addi	%a1, %zero, 0
bgti_cont.45300:
	j	bgt_cont.45298
bgt_else.45297:
	addi	%a1, %zero, 255
bgt_cont.45298:
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.45301
	blti	%a1, 20, bgti_else.45303
	blti	%a1, 30, bgti_else.45305
	blti	%a1, 40, bgti_else.45307
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45302
	blti	%a1, 20, bgti_else.45311
	blti	%a1, 30, bgti_else.45313
	blti	%a1, 40, bgti_else.45315
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45302
	blti	%a1, 20, bgti_else.45319
	blti	%a1, 30, bgti_else.45321
	blti	%a1, 40, bgti_else.45323
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45302
	blti	%a1, 20, bgti_else.45327
	blti	%a1, 30, bgti_else.45329
	blti	%a1, 40, bgti_else.45331
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45302
bgti_else.45331:
	addi	%a1, %a1, -30
bgti_cont.45332:
	j	bgti_cont.45302
bgti_else.45329:
	addi	%a1, %a1, -20
bgti_cont.45330:
	j	bgti_cont.45302
bgti_else.45327:
	addi	%a1, %a1, -10
bgti_cont.45328:
	j	bgti_cont.45302
bgti_else.45325:
bgti_cont.45326:
	j	bgti_cont.45302
bgti_else.45323:
	addi	%a1, %a1, -30
bgti_cont.45324:
	j	bgti_cont.45302
bgti_else.45321:
	addi	%a1, %a1, -20
bgti_cont.45322:
	j	bgti_cont.45302
bgti_else.45319:
	addi	%a1, %a1, -10
bgti_cont.45320:
	j	bgti_cont.45302
bgti_else.45317:
bgti_cont.45318:
	j	bgti_cont.45302
bgti_else.45315:
	addi	%a1, %a1, -30
bgti_cont.45316:
	j	bgti_cont.45302
bgti_else.45313:
	addi	%a1, %a1, -20
bgti_cont.45314:
	j	bgti_cont.45302
bgti_else.45311:
	addi	%a1, %a1, -10
bgti_cont.45312:
	j	bgti_cont.45302
bgti_else.45309:
bgti_cont.45310:
	j	bgti_cont.45302
bgti_else.45307:
	addi	%a1, %a1, -30
bgti_cont.45308:
	j	bgti_cont.45302
bgti_else.45305:
	addi	%a1, %a1, -20
bgti_cont.45306:
	j	bgti_cont.45302
bgti_else.45303:
	addi	%a1, %a1, -10
bgti_cont.45304:
	j	bgti_cont.45302
bgti_else.45301:
bgti_cont.45302:
	blt	%zero, %a2, bgt_else.45333
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45334
bgt_else.45333:
	addi	%v1, %t0, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.45335
	blti	%a2, 20, bgti_else.45337
	blti	%a2, 30, bgti_else.45339
	blti	%a2, 40, bgti_else.45341
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45336
	blti	%a2, 20, bgti_else.45345
	blti	%a2, 30, bgti_else.45347
	blti	%a2, 40, bgti_else.45349
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45336
	blti	%a2, 20, bgti_else.45353
	blti	%a2, 30, bgti_else.45355
	blti	%a2, 40, bgti_else.45357
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45336
	blti	%a2, 20, bgti_else.45361
	blti	%a2, 30, bgti_else.45363
	blti	%a2, 40, bgti_else.45365
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45336
bgti_else.45365:
	addi	%a2, %a2, -30
bgti_cont.45366:
	j	bgti_cont.45336
bgti_else.45363:
	addi	%a2, %a2, -20
bgti_cont.45364:
	j	bgti_cont.45336
bgti_else.45361:
	addi	%a2, %a2, -10
bgti_cont.45362:
	j	bgti_cont.45336
bgti_else.45359:
bgti_cont.45360:
	j	bgti_cont.45336
bgti_else.45357:
	addi	%a2, %a2, -30
bgti_cont.45358:
	j	bgti_cont.45336
bgti_else.45355:
	addi	%a2, %a2, -20
bgti_cont.45356:
	j	bgti_cont.45336
bgti_else.45353:
	addi	%a2, %a2, -10
bgti_cont.45354:
	j	bgti_cont.45336
bgti_else.45351:
bgti_cont.45352:
	j	bgti_cont.45336
bgti_else.45349:
	addi	%a2, %a2, -30
bgti_cont.45350:
	j	bgti_cont.45336
bgti_else.45347:
	addi	%a2, %a2, -20
bgti_cont.45348:
	j	bgti_cont.45336
bgti_else.45345:
	addi	%a2, %a2, -10
bgti_cont.45346:
	j	bgti_cont.45336
bgti_else.45343:
bgti_cont.45344:
	j	bgti_cont.45336
bgti_else.45341:
	addi	%a2, %a2, -30
bgti_cont.45342:
	j	bgti_cont.45336
bgti_else.45339:
	addi	%a2, %a2, -20
bgti_cont.45340:
	j	bgti_cont.45336
bgti_else.45337:
	addi	%a2, %a2, -10
bgti_cont.45338:
	j	bgti_cont.45336
bgti_else.45335:
bgti_cont.45336:
	blt	%zero, %a0, bgt_else.45367
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45368
bgt_else.45367:
	blti	%a0, 10, bgti_else.45369
	blti	%a0, 20, bgti_else.45371
	blti	%a0, 30, bgti_else.45373
	blti	%a0, 40, bgti_else.45375
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45370
	blti	%a0, 20, bgti_else.45379
	blti	%a0, 30, bgti_else.45381
	blti	%a0, 40, bgti_else.45383
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45370
	blti	%a0, 20, bgti_else.45387
	blti	%a0, 30, bgti_else.45389
	blti	%a0, 40, bgti_else.45391
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45370
	blti	%a0, 20, bgti_else.45395
	blti	%a0, 30, bgti_else.45397
	blti	%a0, 40, bgti_else.45399
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45370
bgti_else.45399:
	addi	%a0, %a0, -30
bgti_cont.45400:
	j	bgti_cont.45370
bgti_else.45397:
	addi	%a0, %a0, -20
bgti_cont.45398:
	j	bgti_cont.45370
bgti_else.45395:
	addi	%a0, %a0, -10
bgti_cont.45396:
	j	bgti_cont.45370
bgti_else.45393:
bgti_cont.45394:
	j	bgti_cont.45370
bgti_else.45391:
	addi	%a0, %a0, -30
bgti_cont.45392:
	j	bgti_cont.45370
bgti_else.45389:
	addi	%a0, %a0, -20
bgti_cont.45390:
	j	bgti_cont.45370
bgti_else.45387:
	addi	%a0, %a0, -10
bgti_cont.45388:
	j	bgti_cont.45370
bgti_else.45385:
bgti_cont.45386:
	j	bgti_cont.45370
bgti_else.45383:
	addi	%a0, %a0, -30
bgti_cont.45384:
	j	bgti_cont.45370
bgti_else.45381:
	addi	%a0, %a0, -20
bgti_cont.45382:
	j	bgti_cont.45370
bgti_else.45379:
	addi	%a0, %a0, -10
bgti_cont.45380:
	j	bgti_cont.45370
bgti_else.45377:
bgti_cont.45378:
	j	bgti_cont.45370
bgti_else.45375:
	addi	%a0, %a0, -30
bgti_cont.45376:
	j	bgti_cont.45370
bgti_else.45373:
	addi	%a0, %a0, -20
bgti_cont.45374:
	j	bgti_cont.45370
bgti_else.45371:
	addi	%a0, %a0, -10
bgti_cont.45372:
	j	bgti_cont.45370
bgti_else.45369:
bgti_cont.45370:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45368:
bgt_cont.45334:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	lw	%a0, 0(%sp)
	addi	%t4, %a0, 1
	blt	%t4, %t1, bgt_else.45401
	lw	%t5, 5(%sp)
	lw	%t4, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%t2, 8(%sp)
	lw	%t1, 9(%sp)
	lw	%t0, 10(%sp)
	lw	%ra, 11(%sp)
	jr	%ra
bgt_else.45401:
	lw	%a0, 3(%sp)
	add	%at, %a0, %t4
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
	blt	%a0, %a1, bgt_else.45403
	addi	%a0, %zero, 0
	j	bgt_cont.45404
bgt_else.45403:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.45405
	addi	%a0, %zero, 0
	j	bgt_cont.45406
bgt_else.45405:
	addi	%a0, %t4, 1
	blt	%a0, %t1, bgt_else.45407
	addi	%a0, %zero, 0
	j	bgt_cont.45408
bgt_else.45407:
	blt	%zero, %t4, bgt_else.45409
	addi	%a0, %zero, 0
	j	bgt_cont.45410
bgt_else.45409:
	addi	%a0, %zero, 1
bgt_cont.45410:
bgt_cont.45408:
bgt_cont.45406:
bgt_cont.45404:
	beqi	%a0, 0, bnei_else.45411
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %t0, 0
	addi	%v0, %t4, 0
	addi	%sp, %sp, 15
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -15
	j	bnei_cont.45412
bnei_else.45411:
	addi	%v1, %t0, 0
	addi	%sp, %sp, 15
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -15
bnei_cont.45412:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45413
	blti	%a1, 0, bgti_else.45415
	j	bgt_cont.45414
bgti_else.45415:
	addi	%a1, %zero, 0
bgti_cont.45416:
	j	bgt_cont.45414
bgt_else.45413:
	addi	%a1, %zero, 255
bgt_cont.45414:
	blti	%a1, 10, bgti_else.45417
	blti	%a1, 20, bgti_else.45419
	blti	%a1, 30, bgti_else.45421
	blti	%a1, 40, bgti_else.45423
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.45425
	blti	%a0, 20, bgti_else.45427
	blti	%a0, 30, bgti_else.45429
	blti	%a0, 40, bgti_else.45431
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45433
	blti	%a0, 20, bgti_else.45435
	blti	%a0, 30, bgti_else.45437
	blti	%a0, 40, bgti_else.45439
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45418
bgti_else.45439:
	addi	%a2, %zero, 11
bgti_cont.45440:
	j	bgti_cont.45418
bgti_else.45437:
	addi	%a2, %zero, 10
bgti_cont.45438:
	j	bgti_cont.45418
bgti_else.45435:
	addi	%a2, %zero, 9
bgti_cont.45436:
	j	bgti_cont.45418
bgti_else.45433:
	addi	%a2, %zero, 8
bgti_cont.45434:
	j	bgti_cont.45418
bgti_else.45431:
	addi	%a2, %zero, 7
bgti_cont.45432:
	j	bgti_cont.45418
bgti_else.45429:
	addi	%a2, %zero, 6
bgti_cont.45430:
	j	bgti_cont.45418
bgti_else.45427:
	addi	%a2, %zero, 5
bgti_cont.45428:
	j	bgti_cont.45418
bgti_else.45425:
	addi	%a2, %zero, 4
bgti_cont.45426:
	j	bgti_cont.45418
bgti_else.45423:
	addi	%a2, %zero, 3
bgti_cont.45424:
	j	bgti_cont.45418
bgti_else.45421:
	addi	%a2, %zero, 2
bgti_cont.45422:
	j	bgti_cont.45418
bgti_else.45419:
	addi	%a2, %zero, 1
bgti_cont.45420:
	j	bgti_cont.45418
bgti_else.45417:
	addi	%a2, %zero, 0
bgti_cont.45418:
	blti	%a1, 10, bgti_else.45441
	blti	%a1, 20, bgti_else.45443
	blti	%a1, 30, bgti_else.45445
	blti	%a1, 40, bgti_else.45447
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45442
	blti	%a1, 20, bgti_else.45451
	blti	%a1, 30, bgti_else.45453
	blti	%a1, 40, bgti_else.45455
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45442
	blti	%a1, 20, bgti_else.45459
	blti	%a1, 30, bgti_else.45461
	blti	%a1, 40, bgti_else.45463
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45442
bgti_else.45463:
	addi	%a1, %a1, -30
bgti_cont.45464:
	j	bgti_cont.45442
bgti_else.45461:
	addi	%a1, %a1, -20
bgti_cont.45462:
	j	bgti_cont.45442
bgti_else.45459:
	addi	%a1, %a1, -10
bgti_cont.45460:
	j	bgti_cont.45442
bgti_else.45457:
bgti_cont.45458:
	j	bgti_cont.45442
bgti_else.45455:
	addi	%a1, %a1, -30
bgti_cont.45456:
	j	bgti_cont.45442
bgti_else.45453:
	addi	%a1, %a1, -20
bgti_cont.45454:
	j	bgti_cont.45442
bgti_else.45451:
	addi	%a1, %a1, -10
bgti_cont.45452:
	j	bgti_cont.45442
bgti_else.45449:
bgti_cont.45450:
	j	bgti_cont.45442
bgti_else.45447:
	addi	%a1, %a1, -30
bgti_cont.45448:
	j	bgti_cont.45442
bgti_else.45445:
	addi	%a1, %a1, -20
bgti_cont.45446:
	j	bgti_cont.45442
bgti_else.45443:
	addi	%a1, %a1, -10
bgti_cont.45444:
	j	bgti_cont.45442
bgti_else.45441:
bgti_cont.45442:
	blt	%zero, %a2, bgt_else.45465
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45466
bgt_else.45465:
	blti	%a2, 10, bgti_else.45467
	blti	%a2, 20, bgti_else.45469
	blti	%a2, 30, bgti_else.45471
	blti	%a2, 40, bgti_else.45473
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45475
	blti	%a0, 20, bgti_else.45477
	blti	%a0, 30, bgti_else.45479
	blti	%a0, 40, bgti_else.45481
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45483
	blti	%a0, 20, bgti_else.45485
	blti	%a0, 30, bgti_else.45487
	blti	%a0, 40, bgti_else.45489
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45468
bgti_else.45489:
	addi	%a0, %zero, 11
bgti_cont.45490:
	j	bgti_cont.45468
bgti_else.45487:
	addi	%a0, %zero, 10
bgti_cont.45488:
	j	bgti_cont.45468
bgti_else.45485:
	addi	%a0, %zero, 9
bgti_cont.45486:
	j	bgti_cont.45468
bgti_else.45483:
	addi	%a0, %zero, 8
bgti_cont.45484:
	j	bgti_cont.45468
bgti_else.45481:
	addi	%a0, %zero, 7
bgti_cont.45482:
	j	bgti_cont.45468
bgti_else.45479:
	addi	%a0, %zero, 6
bgti_cont.45480:
	j	bgti_cont.45468
bgti_else.45477:
	addi	%a0, %zero, 5
bgti_cont.45478:
	j	bgti_cont.45468
bgti_else.45475:
	addi	%a0, %zero, 4
bgti_cont.45476:
	j	bgti_cont.45468
bgti_else.45473:
	addi	%a0, %zero, 3
bgti_cont.45474:
	j	bgti_cont.45468
bgti_else.45471:
	addi	%a0, %zero, 2
bgti_cont.45472:
	j	bgti_cont.45468
bgti_else.45469:
	addi	%a0, %zero, 1
bgti_cont.45470:
	j	bgti_cont.45468
bgti_else.45467:
	addi	%a0, %zero, 0
bgti_cont.45468:
	blti	%a2, 10, bgti_else.45491
	blti	%a2, 20, bgti_else.45493
	blti	%a2, 30, bgti_else.45495
	blti	%a2, 40, bgti_else.45497
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45492
	blti	%a2, 20, bgti_else.45501
	blti	%a2, 30, bgti_else.45503
	blti	%a2, 40, bgti_else.45505
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45492
	blti	%a2, 20, bgti_else.45509
	blti	%a2, 30, bgti_else.45511
	blti	%a2, 40, bgti_else.45513
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45492
bgti_else.45513:
	addi	%a2, %a2, -30
bgti_cont.45514:
	j	bgti_cont.45492
bgti_else.45511:
	addi	%a2, %a2, -20
bgti_cont.45512:
	j	bgti_cont.45492
bgti_else.45509:
	addi	%a2, %a2, -10
bgti_cont.45510:
	j	bgti_cont.45492
bgti_else.45507:
bgti_cont.45508:
	j	bgti_cont.45492
bgti_else.45505:
	addi	%a2, %a2, -30
bgti_cont.45506:
	j	bgti_cont.45492
bgti_else.45503:
	addi	%a2, %a2, -20
bgti_cont.45504:
	j	bgti_cont.45492
bgti_else.45501:
	addi	%a2, %a2, -10
bgti_cont.45502:
	j	bgti_cont.45492
bgti_else.45499:
bgti_cont.45500:
	j	bgti_cont.45492
bgti_else.45497:
	addi	%a2, %a2, -30
bgti_cont.45498:
	j	bgti_cont.45492
bgti_else.45495:
	addi	%a2, %a2, -20
bgti_cont.45496:
	j	bgti_cont.45492
bgti_else.45493:
	addi	%a2, %a2, -10
bgti_cont.45494:
	j	bgti_cont.45492
bgti_else.45491:
bgti_cont.45492:
	blt	%zero, %a0, bgt_else.45515
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45516
bgt_else.45515:
	blti	%a0, 10, bgti_else.45517
	blti	%a0, 20, bgti_else.45519
	blti	%a0, 30, bgti_else.45521
	blti	%a0, 40, bgti_else.45523
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45518
	blti	%a0, 20, bgti_else.45527
	blti	%a0, 30, bgti_else.45529
	blti	%a0, 40, bgti_else.45531
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45518
	blti	%a0, 20, bgti_else.45535
	blti	%a0, 30, bgti_else.45537
	blti	%a0, 40, bgti_else.45539
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45518
bgti_else.45539:
	addi	%a0, %a0, -30
bgti_cont.45540:
	j	bgti_cont.45518
bgti_else.45537:
	addi	%a0, %a0, -20
bgti_cont.45538:
	j	bgti_cont.45518
bgti_else.45535:
	addi	%a0, %a0, -10
bgti_cont.45536:
	j	bgti_cont.45518
bgti_else.45533:
bgti_cont.45534:
	j	bgti_cont.45518
bgti_else.45531:
	addi	%a0, %a0, -30
bgti_cont.45532:
	j	bgti_cont.45518
bgti_else.45529:
	addi	%a0, %a0, -20
bgti_cont.45530:
	j	bgti_cont.45518
bgti_else.45527:
	addi	%a0, %a0, -10
bgti_cont.45528:
	j	bgti_cont.45518
bgti_else.45525:
bgti_cont.45526:
	j	bgti_cont.45518
bgti_else.45523:
	addi	%a0, %a0, -30
bgti_cont.45524:
	j	bgti_cont.45518
bgti_else.45521:
	addi	%a0, %a0, -20
bgti_cont.45522:
	j	bgti_cont.45518
bgti_else.45519:
	addi	%a0, %a0, -10
bgti_cont.45520:
	j	bgti_cont.45518
bgti_else.45517:
bgti_cont.45518:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45516:
bgt_cont.45466:
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45541
	blti	%a1, 0, bgti_else.45543
	j	bgt_cont.45542
bgti_else.45543:
	addi	%a1, %zero, 0
bgti_cont.45544:
	j	bgt_cont.45542
bgt_else.45541:
	addi	%a1, %zero, 255
bgt_cont.45542:
	blti	%a1, 10, bgti_else.45545
	blti	%a1, 20, bgti_else.45547
	blti	%a1, 30, bgti_else.45549
	blti	%a1, 40, bgti_else.45551
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.45553
	blti	%a0, 20, bgti_else.45555
	blti	%a0, 30, bgti_else.45557
	blti	%a0, 40, bgti_else.45559
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45561
	blti	%a0, 20, bgti_else.45563
	blti	%a0, 30, bgti_else.45565
	blti	%a0, 40, bgti_else.45567
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45546
bgti_else.45567:
	addi	%a2, %zero, 11
bgti_cont.45568:
	j	bgti_cont.45546
bgti_else.45565:
	addi	%a2, %zero, 10
bgti_cont.45566:
	j	bgti_cont.45546
bgti_else.45563:
	addi	%a2, %zero, 9
bgti_cont.45564:
	j	bgti_cont.45546
bgti_else.45561:
	addi	%a2, %zero, 8
bgti_cont.45562:
	j	bgti_cont.45546
bgti_else.45559:
	addi	%a2, %zero, 7
bgti_cont.45560:
	j	bgti_cont.45546
bgti_else.45557:
	addi	%a2, %zero, 6
bgti_cont.45558:
	j	bgti_cont.45546
bgti_else.45555:
	addi	%a2, %zero, 5
bgti_cont.45556:
	j	bgti_cont.45546
bgti_else.45553:
	addi	%a2, %zero, 4
bgti_cont.45554:
	j	bgti_cont.45546
bgti_else.45551:
	addi	%a2, %zero, 3
bgti_cont.45552:
	j	bgti_cont.45546
bgti_else.45549:
	addi	%a2, %zero, 2
bgti_cont.45550:
	j	bgti_cont.45546
bgti_else.45547:
	addi	%a2, %zero, 1
bgti_cont.45548:
	j	bgti_cont.45546
bgti_else.45545:
	addi	%a2, %zero, 0
bgti_cont.45546:
	blti	%a1, 10, bgti_else.45569
	blti	%a1, 20, bgti_else.45571
	blti	%a1, 30, bgti_else.45573
	blti	%a1, 40, bgti_else.45575
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45570
	blti	%a1, 20, bgti_else.45579
	blti	%a1, 30, bgti_else.45581
	blti	%a1, 40, bgti_else.45583
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45570
	blti	%a1, 20, bgti_else.45587
	blti	%a1, 30, bgti_else.45589
	blti	%a1, 40, bgti_else.45591
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45570
bgti_else.45591:
	addi	%a1, %a1, -30
bgti_cont.45592:
	j	bgti_cont.45570
bgti_else.45589:
	addi	%a1, %a1, -20
bgti_cont.45590:
	j	bgti_cont.45570
bgti_else.45587:
	addi	%a1, %a1, -10
bgti_cont.45588:
	j	bgti_cont.45570
bgti_else.45585:
bgti_cont.45586:
	j	bgti_cont.45570
bgti_else.45583:
	addi	%a1, %a1, -30
bgti_cont.45584:
	j	bgti_cont.45570
bgti_else.45581:
	addi	%a1, %a1, -20
bgti_cont.45582:
	j	bgti_cont.45570
bgti_else.45579:
	addi	%a1, %a1, -10
bgti_cont.45580:
	j	bgti_cont.45570
bgti_else.45577:
bgti_cont.45578:
	j	bgti_cont.45570
bgti_else.45575:
	addi	%a1, %a1, -30
bgti_cont.45576:
	j	bgti_cont.45570
bgti_else.45573:
	addi	%a1, %a1, -20
bgti_cont.45574:
	j	bgti_cont.45570
bgti_else.45571:
	addi	%a1, %a1, -10
bgti_cont.45572:
	j	bgti_cont.45570
bgti_else.45569:
bgti_cont.45570:
	blt	%zero, %a2, bgt_else.45593
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45594
bgt_else.45593:
	blti	%a2, 10, bgti_else.45595
	blti	%a2, 20, bgti_else.45597
	blti	%a2, 30, bgti_else.45599
	blti	%a2, 40, bgti_else.45601
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45603
	blti	%a0, 20, bgti_else.45605
	blti	%a0, 30, bgti_else.45607
	blti	%a0, 40, bgti_else.45609
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45611
	blti	%a0, 20, bgti_else.45613
	blti	%a0, 30, bgti_else.45615
	blti	%a0, 40, bgti_else.45617
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45596
bgti_else.45617:
	addi	%a0, %zero, 11
bgti_cont.45618:
	j	bgti_cont.45596
bgti_else.45615:
	addi	%a0, %zero, 10
bgti_cont.45616:
	j	bgti_cont.45596
bgti_else.45613:
	addi	%a0, %zero, 9
bgti_cont.45614:
	j	bgti_cont.45596
bgti_else.45611:
	addi	%a0, %zero, 8
bgti_cont.45612:
	j	bgti_cont.45596
bgti_else.45609:
	addi	%a0, %zero, 7
bgti_cont.45610:
	j	bgti_cont.45596
bgti_else.45607:
	addi	%a0, %zero, 6
bgti_cont.45608:
	j	bgti_cont.45596
bgti_else.45605:
	addi	%a0, %zero, 5
bgti_cont.45606:
	j	bgti_cont.45596
bgti_else.45603:
	addi	%a0, %zero, 4
bgti_cont.45604:
	j	bgti_cont.45596
bgti_else.45601:
	addi	%a0, %zero, 3
bgti_cont.45602:
	j	bgti_cont.45596
bgti_else.45599:
	addi	%a0, %zero, 2
bgti_cont.45600:
	j	bgti_cont.45596
bgti_else.45597:
	addi	%a0, %zero, 1
bgti_cont.45598:
	j	bgti_cont.45596
bgti_else.45595:
	addi	%a0, %zero, 0
bgti_cont.45596:
	blti	%a2, 10, bgti_else.45619
	blti	%a2, 20, bgti_else.45621
	blti	%a2, 30, bgti_else.45623
	blti	%a2, 40, bgti_else.45625
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45620
	blti	%a2, 20, bgti_else.45629
	blti	%a2, 30, bgti_else.45631
	blti	%a2, 40, bgti_else.45633
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45620
	blti	%a2, 20, bgti_else.45637
	blti	%a2, 30, bgti_else.45639
	blti	%a2, 40, bgti_else.45641
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45620
bgti_else.45641:
	addi	%a2, %a2, -30
bgti_cont.45642:
	j	bgti_cont.45620
bgti_else.45639:
	addi	%a2, %a2, -20
bgti_cont.45640:
	j	bgti_cont.45620
bgti_else.45637:
	addi	%a2, %a2, -10
bgti_cont.45638:
	j	bgti_cont.45620
bgti_else.45635:
bgti_cont.45636:
	j	bgti_cont.45620
bgti_else.45633:
	addi	%a2, %a2, -30
bgti_cont.45634:
	j	bgti_cont.45620
bgti_else.45631:
	addi	%a2, %a2, -20
bgti_cont.45632:
	j	bgti_cont.45620
bgti_else.45629:
	addi	%a2, %a2, -10
bgti_cont.45630:
	j	bgti_cont.45620
bgti_else.45627:
bgti_cont.45628:
	j	bgti_cont.45620
bgti_else.45625:
	addi	%a2, %a2, -30
bgti_cont.45626:
	j	bgti_cont.45620
bgti_else.45623:
	addi	%a2, %a2, -20
bgti_cont.45624:
	j	bgti_cont.45620
bgti_else.45621:
	addi	%a2, %a2, -10
bgti_cont.45622:
	j	bgti_cont.45620
bgti_else.45619:
bgti_cont.45620:
	blt	%zero, %a0, bgt_else.45643
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45644
bgt_else.45643:
	blti	%a0, 10, bgti_else.45645
	blti	%a0, 20, bgti_else.45647
	blti	%a0, 30, bgti_else.45649
	blti	%a0, 40, bgti_else.45651
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45646
	blti	%a0, 20, bgti_else.45655
	blti	%a0, 30, bgti_else.45657
	blti	%a0, 40, bgti_else.45659
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45646
	blti	%a0, 20, bgti_else.45663
	blti	%a0, 30, bgti_else.45665
	blti	%a0, 40, bgti_else.45667
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45646
bgti_else.45667:
	addi	%a0, %a0, -30
bgti_cont.45668:
	j	bgti_cont.45646
bgti_else.45665:
	addi	%a0, %a0, -20
bgti_cont.45666:
	j	bgti_cont.45646
bgti_else.45663:
	addi	%a0, %a0, -10
bgti_cont.45664:
	j	bgti_cont.45646
bgti_else.45661:
bgti_cont.45662:
	j	bgti_cont.45646
bgti_else.45659:
	addi	%a0, %a0, -30
bgti_cont.45660:
	j	bgti_cont.45646
bgti_else.45657:
	addi	%a0, %a0, -20
bgti_cont.45658:
	j	bgti_cont.45646
bgti_else.45655:
	addi	%a0, %a0, -10
bgti_cont.45656:
	j	bgti_cont.45646
bgti_else.45653:
bgti_cont.45654:
	j	bgti_cont.45646
bgti_else.45651:
	addi	%a0, %a0, -30
bgti_cont.45652:
	j	bgti_cont.45646
bgti_else.45649:
	addi	%a0, %a0, -20
bgti_cont.45650:
	j	bgti_cont.45646
bgti_else.45647:
	addi	%a0, %a0, -10
bgti_cont.45648:
	j	bgti_cont.45646
bgti_else.45645:
bgti_cont.45646:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45644:
bgt_cont.45594:
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.45669
	blti	%a1, 0, bgti_else.45671
	j	bgt_cont.45670
bgti_else.45671:
	addi	%a1, %zero, 0
bgti_cont.45672:
	j	bgt_cont.45670
bgt_else.45669:
	addi	%a1, %zero, 255
bgt_cont.45670:
	blti	%a1, 10, bgti_else.45673
	blti	%a1, 20, bgti_else.45675
	blti	%a1, 30, bgti_else.45677
	blti	%a1, 40, bgti_else.45679
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.45681
	blti	%a0, 20, bgti_else.45683
	blti	%a0, 30, bgti_else.45685
	blti	%a0, 40, bgti_else.45687
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45689
	blti	%a0, 20, bgti_else.45691
	blti	%a0, 30, bgti_else.45693
	blti	%a0, 40, bgti_else.45695
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45674
bgti_else.45695:
	addi	%a2, %zero, 11
bgti_cont.45696:
	j	bgti_cont.45674
bgti_else.45693:
	addi	%a2, %zero, 10
bgti_cont.45694:
	j	bgti_cont.45674
bgti_else.45691:
	addi	%a2, %zero, 9
bgti_cont.45692:
	j	bgti_cont.45674
bgti_else.45689:
	addi	%a2, %zero, 8
bgti_cont.45690:
	j	bgti_cont.45674
bgti_else.45687:
	addi	%a2, %zero, 7
bgti_cont.45688:
	j	bgti_cont.45674
bgti_else.45685:
	addi	%a2, %zero, 6
bgti_cont.45686:
	j	bgti_cont.45674
bgti_else.45683:
	addi	%a2, %zero, 5
bgti_cont.45684:
	j	bgti_cont.45674
bgti_else.45681:
	addi	%a2, %zero, 4
bgti_cont.45682:
	j	bgti_cont.45674
bgti_else.45679:
	addi	%a2, %zero, 3
bgti_cont.45680:
	j	bgti_cont.45674
bgti_else.45677:
	addi	%a2, %zero, 2
bgti_cont.45678:
	j	bgti_cont.45674
bgti_else.45675:
	addi	%a2, %zero, 1
bgti_cont.45676:
	j	bgti_cont.45674
bgti_else.45673:
	addi	%a2, %zero, 0
bgti_cont.45674:
	blti	%a1, 10, bgti_else.45697
	blti	%a1, 20, bgti_else.45699
	blti	%a1, 30, bgti_else.45701
	blti	%a1, 40, bgti_else.45703
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45698
	blti	%a1, 20, bgti_else.45707
	blti	%a1, 30, bgti_else.45709
	blti	%a1, 40, bgti_else.45711
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45698
	blti	%a1, 20, bgti_else.45715
	blti	%a1, 30, bgti_else.45717
	blti	%a1, 40, bgti_else.45719
	addi	%v0, %a1, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a1, %v0, 0
	j	bgti_cont.45698
bgti_else.45719:
	addi	%a1, %a1, -30
bgti_cont.45720:
	j	bgti_cont.45698
bgti_else.45717:
	addi	%a1, %a1, -20
bgti_cont.45718:
	j	bgti_cont.45698
bgti_else.45715:
	addi	%a1, %a1, -10
bgti_cont.45716:
	j	bgti_cont.45698
bgti_else.45713:
bgti_cont.45714:
	j	bgti_cont.45698
bgti_else.45711:
	addi	%a1, %a1, -30
bgti_cont.45712:
	j	bgti_cont.45698
bgti_else.45709:
	addi	%a1, %a1, -20
bgti_cont.45710:
	j	bgti_cont.45698
bgti_else.45707:
	addi	%a1, %a1, -10
bgti_cont.45708:
	j	bgti_cont.45698
bgti_else.45705:
bgti_cont.45706:
	j	bgti_cont.45698
bgti_else.45703:
	addi	%a1, %a1, -30
bgti_cont.45704:
	j	bgti_cont.45698
bgti_else.45701:
	addi	%a1, %a1, -20
bgti_cont.45702:
	j	bgti_cont.45698
bgti_else.45699:
	addi	%a1, %a1, -10
bgti_cont.45700:
	j	bgti_cont.45698
bgti_else.45697:
bgti_cont.45698:
	blt	%zero, %a2, bgt_else.45721
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45722
bgt_else.45721:
	blti	%a2, 10, bgti_else.45723
	blti	%a2, 20, bgti_else.45725
	blti	%a2, 30, bgti_else.45727
	blti	%a2, 40, bgti_else.45729
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45731
	blti	%a0, 20, bgti_else.45733
	blti	%a0, 30, bgti_else.45735
	blti	%a0, 40, bgti_else.45737
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45739
	blti	%a0, 20, bgti_else.45741
	blti	%a0, 30, bgti_else.45743
	blti	%a0, 40, bgti_else.45745
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45724
bgti_else.45745:
	addi	%a0, %zero, 11
bgti_cont.45746:
	j	bgti_cont.45724
bgti_else.45743:
	addi	%a0, %zero, 10
bgti_cont.45744:
	j	bgti_cont.45724
bgti_else.45741:
	addi	%a0, %zero, 9
bgti_cont.45742:
	j	bgti_cont.45724
bgti_else.45739:
	addi	%a0, %zero, 8
bgti_cont.45740:
	j	bgti_cont.45724
bgti_else.45737:
	addi	%a0, %zero, 7
bgti_cont.45738:
	j	bgti_cont.45724
bgti_else.45735:
	addi	%a0, %zero, 6
bgti_cont.45736:
	j	bgti_cont.45724
bgti_else.45733:
	addi	%a0, %zero, 5
bgti_cont.45734:
	j	bgti_cont.45724
bgti_else.45731:
	addi	%a0, %zero, 4
bgti_cont.45732:
	j	bgti_cont.45724
bgti_else.45729:
	addi	%a0, %zero, 3
bgti_cont.45730:
	j	bgti_cont.45724
bgti_else.45727:
	addi	%a0, %zero, 2
bgti_cont.45728:
	j	bgti_cont.45724
bgti_else.45725:
	addi	%a0, %zero, 1
bgti_cont.45726:
	j	bgti_cont.45724
bgti_else.45723:
	addi	%a0, %zero, 0
bgti_cont.45724:
	blti	%a2, 10, bgti_else.45747
	blti	%a2, 20, bgti_else.45749
	blti	%a2, 30, bgti_else.45751
	blti	%a2, 40, bgti_else.45753
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45748
	blti	%a2, 20, bgti_else.45757
	blti	%a2, 30, bgti_else.45759
	blti	%a2, 40, bgti_else.45761
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45748
	blti	%a2, 20, bgti_else.45765
	blti	%a2, 30, bgti_else.45767
	blti	%a2, 40, bgti_else.45769
	addi	%v0, %a2, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a2, %v0, 0
	j	bgti_cont.45748
bgti_else.45769:
	addi	%a2, %a2, -30
bgti_cont.45770:
	j	bgti_cont.45748
bgti_else.45767:
	addi	%a2, %a2, -20
bgti_cont.45768:
	j	bgti_cont.45748
bgti_else.45765:
	addi	%a2, %a2, -10
bgti_cont.45766:
	j	bgti_cont.45748
bgti_else.45763:
bgti_cont.45764:
	j	bgti_cont.45748
bgti_else.45761:
	addi	%a2, %a2, -30
bgti_cont.45762:
	j	bgti_cont.45748
bgti_else.45759:
	addi	%a2, %a2, -20
bgti_cont.45760:
	j	bgti_cont.45748
bgti_else.45757:
	addi	%a2, %a2, -10
bgti_cont.45758:
	j	bgti_cont.45748
bgti_else.45755:
bgti_cont.45756:
	j	bgti_cont.45748
bgti_else.45753:
	addi	%a2, %a2, -30
bgti_cont.45754:
	j	bgti_cont.45748
bgti_else.45751:
	addi	%a2, %a2, -20
bgti_cont.45752:
	j	bgti_cont.45748
bgti_else.45749:
	addi	%a2, %a2, -10
bgti_cont.45750:
	j	bgti_cont.45748
bgti_else.45747:
bgti_cont.45748:
	blt	%zero, %a0, bgt_else.45771
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	j	bgt_cont.45772
bgt_else.45771:
	blti	%a0, 10, bgti_else.45773
	blti	%a0, 20, bgti_else.45775
	blti	%a0, 30, bgti_else.45777
	blti	%a0, 40, bgti_else.45779
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45774
	blti	%a0, 20, bgti_else.45783
	blti	%a0, 30, bgti_else.45785
	blti	%a0, 40, bgti_else.45787
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45774
	blti	%a0, 20, bgti_else.45791
	blti	%a0, 30, bgti_else.45793
	blti	%a0, 40, bgti_else.45795
	addi	%v0, %a0, -40
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	j	bgti_cont.45774
bgti_else.45795:
	addi	%a0, %a0, -30
bgti_cont.45796:
	j	bgti_cont.45774
bgti_else.45793:
	addi	%a0, %a0, -20
bgti_cont.45794:
	j	bgti_cont.45774
bgti_else.45791:
	addi	%a0, %a0, -10
bgti_cont.45792:
	j	bgti_cont.45774
bgti_else.45789:
bgti_cont.45790:
	j	bgti_cont.45774
bgti_else.45787:
	addi	%a0, %a0, -30
bgti_cont.45788:
	j	bgti_cont.45774
bgti_else.45785:
	addi	%a0, %a0, -20
bgti_cont.45786:
	j	bgti_cont.45774
bgti_else.45783:
	addi	%a0, %a0, -10
bgti_cont.45784:
	j	bgti_cont.45774
bgti_else.45781:
bgti_cont.45782:
	j	bgti_cont.45774
bgti_else.45779:
	addi	%a0, %a0, -30
bgti_cont.45780:
	j	bgti_cont.45774
bgti_else.45777:
	addi	%a0, %a0, -20
bgti_cont.45778:
	j	bgti_cont.45774
bgti_else.45775:
	addi	%a0, %a0, -10
bgti_cont.45776:
	j	bgti_cont.45774
bgti_else.45773:
bgti_cont.45774:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a2, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %a1, 48
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
bgt_cont.45772:
bgt_cont.45722:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	addi	%v0, %t4, 1
	lw	%t5, 5(%sp)
	lw	%t4, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%t2, 8(%sp)
	lw	%t1, 9(%sp)
	lw	%t0, 10(%sp)
	lw	%ra, 11(%sp)
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
	sw	%t4, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	add	%a1, %zero, %t1
	sw	%a1, 8(%sp)
	add	%a2, %zero, %t0
	sw	%a2, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%t0, %zero, 1
	lw	%t1, 155(%zero)
	blt	%a3, %t1, bgt_else.47081
	add	%t1, %zero, %a1
	add	%t0, %zero, %a2
	jr	%ra
bgt_else.47081:
	addi	%a1, %t1, -1
	sw	%a1, 11(%sp)
	blt	%a3, %a1, bgt_else.47083
	j	bgt_cont.47084
bgt_else.47083:
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
	addi	%sp, %sp, 12
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -12
bgt_cont.47084:
	addi	%t2, %zero, 0
	lw	%t3, 154(%zero)
	blt	%zero, %t3, bgt_else.47085
	j	bgt_cont.47086
bgt_else.47085:
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
	blt	%a0, %t1, bgt_else.47087
	addi	%a0, %zero, 0
	j	bgt_cont.47088
bgt_else.47087:
	blt	%zero, %a1, bgt_else.47089
	addi	%a0, %zero, 0
	j	bgt_cont.47090
bgt_else.47089:
	blt	%k1, %t3, bgt_else.47091
	addi	%a0, %zero, 0
	j	bgt_cont.47092
bgt_else.47091:
	addi	%a0, %zero, 0
bgt_cont.47092:
	blt	%at, %t3, bgt_else.47093
	addi	%a0, %zero, 0
	j	bgt_cont.47094
bgt_else.47093:
	addi	%a0, %zero, 0
bgt_cont.47094:
bgt_cont.47090:
bgt_cont.47088:
	beqi	%a0, 0, bnei_else.47095
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %t2, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 12
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -12
	j	bnei_cont.47096
bnei_else.47095:
	addi	%v1, %t2, 0
	addi	%sp, %sp, 12
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -12
bnei_cont.47096:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.47097
	blti	%a1, 0, bgti_else.47099
	j	bgt_cont.47098
bgti_else.47099:
	addi	%a1, %zero, 0
bgti_cont.47100:
	j	bgt_cont.47098
bgt_else.47097:
	addi	%a1, %zero, 255
bgt_cont.47098:
	addi	%a3, %zero, 10
	blti	%a1, 10, bgti_else.47101
	blti	%a1, 20, bgti_else.47103
	blti	%a1, 30, bgti_else.47105
	blti	%a1, 40, bgti_else.47107
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.47109
	blti	%a0, 20, bgti_else.47111
	blti	%a0, 30, bgti_else.47113
	blti	%a0, 40, bgti_else.47115
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47117
	blti	%a0, 20, bgti_else.47119
	blti	%a0, 30, bgti_else.47121
	blti	%a0, 40, bgti_else.47123
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%a2, %v0, 0
	j	bgti_cont.47102
bgti_else.47123:
	addi	%a2, %zero, 11
bgti_cont.47124:
	j	bgti_cont.47102
bgti_else.47121:
	addi	%a2, %zero, 10
bgti_cont.47122:
	j	bgti_cont.47102
bgti_else.47119:
	addi	%a2, %zero, 9
bgti_cont.47120:
	j	bgti_cont.47102
bgti_else.47117:
	addi	%a2, %zero, 8
bgti_cont.47118:
	j	bgti_cont.47102
bgti_else.47115:
	addi	%a2, %zero, 7
bgti_cont.47116:
	j	bgti_cont.47102
bgti_else.47113:
	addi	%a2, %zero, 6
bgti_cont.47114:
	j	bgti_cont.47102
bgti_else.47111:
	addi	%a2, %zero, 5
bgti_cont.47112:
	j	bgti_cont.47102
bgti_else.47109:
	addi	%a2, %zero, 4
bgti_cont.47110:
	j	bgti_cont.47102
bgti_else.47107:
	addi	%a2, %zero, 3
bgti_cont.47108:
	j	bgti_cont.47102
bgti_else.47105:
	addi	%a2, %zero, 2
bgti_cont.47106:
	j	bgti_cont.47102
bgti_else.47103:
	addi	%a2, %zero, 1
bgti_cont.47104:
	j	bgti_cont.47102
bgti_else.47101:
	addi	%a2, %zero, 0
bgti_cont.47102:
	blti	%a1, 10, bgti_else.47125
	blti	%a1, 20, bgti_else.47127
	blti	%a1, 30, bgti_else.47129
	blti	%a1, 40, bgti_else.47131
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.47126
	blti	%a1, 20, bgti_else.47135
	blti	%a1, 30, bgti_else.47137
	blti	%a1, 40, bgti_else.47139
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.47126
	blti	%a1, 20, bgti_else.47143
	blti	%a1, 30, bgti_else.47145
	blti	%a1, 40, bgti_else.47147
	addi	%v0, %a1, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a1, %v0, 0
	j	bgti_cont.47126
bgti_else.47147:
	addi	%a1, %a1, -30
bgti_cont.47148:
	j	bgti_cont.47126
bgti_else.47145:
	addi	%a1, %a1, -20
bgti_cont.47146:
	j	bgti_cont.47126
bgti_else.47143:
	addi	%a1, %a1, -10
bgti_cont.47144:
	j	bgti_cont.47126
bgti_else.47141:
bgti_cont.47142:
	j	bgti_cont.47126
bgti_else.47139:
	addi	%a1, %a1, -30
bgti_cont.47140:
	j	bgti_cont.47126
bgti_else.47137:
	addi	%a1, %a1, -20
bgti_cont.47138:
	j	bgti_cont.47126
bgti_else.47135:
	addi	%a1, %a1, -10
bgti_cont.47136:
	j	bgti_cont.47126
bgti_else.47133:
bgti_cont.47134:
	j	bgti_cont.47126
bgti_else.47131:
	addi	%a1, %a1, -30
bgti_cont.47132:
	j	bgti_cont.47126
bgti_else.47129:
	addi	%a1, %a1, -20
bgti_cont.47130:
	j	bgti_cont.47126
bgti_else.47127:
	addi	%a1, %a1, -10
bgti_cont.47128:
	j	bgti_cont.47126
bgti_else.47125:
bgti_cont.47126:
	blt	%zero, %a2, bgt_else.47149
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47150
bgt_else.47149:
	blti	%a2, 10, bgti_else.47151
	blti	%a2, 20, bgti_else.47153
	blti	%a2, 30, bgti_else.47155
	blti	%a2, 40, bgti_else.47157
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.47159
	blti	%a0, 20, bgti_else.47161
	blti	%a0, 30, bgti_else.47163
	blti	%a0, 40, bgti_else.47165
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47167
	blti	%a0, 20, bgti_else.47169
	blti	%a0, 30, bgti_else.47171
	blti	%a0, 40, bgti_else.47173
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47152
bgti_else.47173:
	addi	%a0, %zero, 11
bgti_cont.47174:
	j	bgti_cont.47152
bgti_else.47171:
	addi	%a0, %zero, 10
bgti_cont.47172:
	j	bgti_cont.47152
bgti_else.47169:
	addi	%a0, %zero, 9
bgti_cont.47170:
	j	bgti_cont.47152
bgti_else.47167:
	addi	%a0, %zero, 8
bgti_cont.47168:
	j	bgti_cont.47152
bgti_else.47165:
	addi	%a0, %zero, 7
bgti_cont.47166:
	j	bgti_cont.47152
bgti_else.47163:
	addi	%a0, %zero, 6
bgti_cont.47164:
	j	bgti_cont.47152
bgti_else.47161:
	addi	%a0, %zero, 5
bgti_cont.47162:
	j	bgti_cont.47152
bgti_else.47159:
	addi	%a0, %zero, 4
bgti_cont.47160:
	j	bgti_cont.47152
bgti_else.47157:
	addi	%a0, %zero, 3
bgti_cont.47158:
	j	bgti_cont.47152
bgti_else.47155:
	addi	%a0, %zero, 2
bgti_cont.47156:
	j	bgti_cont.47152
bgti_else.47153:
	addi	%a0, %zero, 1
bgti_cont.47154:
	j	bgti_cont.47152
bgti_else.47151:
	addi	%a0, %zero, 0
bgti_cont.47152:
	blti	%a2, 10, bgti_else.47175
	blti	%a2, 20, bgti_else.47177
	blti	%a2, 30, bgti_else.47179
	blti	%a2, 40, bgti_else.47181
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47176
	blti	%a2, 20, bgti_else.47185
	blti	%a2, 30, bgti_else.47187
	blti	%a2, 40, bgti_else.47189
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47176
	blti	%a2, 20, bgti_else.47193
	blti	%a2, 30, bgti_else.47195
	blti	%a2, 40, bgti_else.47197
	addi	%v0, %a2, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a2, %v0, 0
	j	bgti_cont.47176
bgti_else.47197:
	addi	%a2, %a2, -30
bgti_cont.47198:
	j	bgti_cont.47176
bgti_else.47195:
	addi	%a2, %a2, -20
bgti_cont.47196:
	j	bgti_cont.47176
bgti_else.47193:
	addi	%a2, %a2, -10
bgti_cont.47194:
	j	bgti_cont.47176
bgti_else.47191:
bgti_cont.47192:
	j	bgti_cont.47176
bgti_else.47189:
	addi	%a2, %a2, -30
bgti_cont.47190:
	j	bgti_cont.47176
bgti_else.47187:
	addi	%a2, %a2, -20
bgti_cont.47188:
	j	bgti_cont.47176
bgti_else.47185:
	addi	%a2, %a2, -10
bgti_cont.47186:
	j	bgti_cont.47176
bgti_else.47183:
bgti_cont.47184:
	j	bgti_cont.47176
bgti_else.47181:
	addi	%a2, %a2, -30
bgti_cont.47182:
	j	bgti_cont.47176
bgti_else.47179:
	addi	%a2, %a2, -20
bgti_cont.47180:
	j	bgti_cont.47176
bgti_else.47177:
	addi	%a2, %a2, -10
bgti_cont.47178:
	j	bgti_cont.47176
bgti_else.47175:
bgti_cont.47176:
	blt	%zero, %a0, bgt_else.47199
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47200
bgt_else.47199:
	blti	%a0, 10, bgti_else.47201
	blti	%a0, 20, bgti_else.47203
	blti	%a0, 30, bgti_else.47205
	blti	%a0, 40, bgti_else.47207
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47202
	blti	%a0, 20, bgti_else.47211
	blti	%a0, 30, bgti_else.47213
	blti	%a0, 40, bgti_else.47215
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47202
	blti	%a0, 20, bgti_else.47219
	blti	%a0, 30, bgti_else.47221
	blti	%a0, 40, bgti_else.47223
	addi	%v0, %a0, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47202
bgti_else.47223:
	addi	%a0, %a0, -30
bgti_cont.47224:
	j	bgti_cont.47202
bgti_else.47221:
	addi	%a0, %a0, -20
bgti_cont.47222:
	j	bgti_cont.47202
bgti_else.47219:
	addi	%a0, %a0, -10
bgti_cont.47220:
	j	bgti_cont.47202
bgti_else.47217:
bgti_cont.47218:
	j	bgti_cont.47202
bgti_else.47215:
	addi	%a0, %a0, -30
bgti_cont.47216:
	j	bgti_cont.47202
bgti_else.47213:
	addi	%a0, %a0, -20
bgti_cont.47214:
	j	bgti_cont.47202
bgti_else.47211:
	addi	%a0, %a0, -10
bgti_cont.47212:
	j	bgti_cont.47202
bgti_else.47209:
bgti_cont.47210:
	j	bgti_cont.47202
bgti_else.47207:
	addi	%a0, %a0, -30
bgti_cont.47208:
	j	bgti_cont.47202
bgti_else.47205:
	addi	%a0, %a0, -20
bgti_cont.47206:
	j	bgti_cont.47202
bgti_else.47203:
	addi	%a0, %a0, -10
bgti_cont.47204:
	j	bgti_cont.47202
bgti_else.47201:
bgti_cont.47202:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
bgt_cont.47200:
bgt_cont.47150:
	addi	%a1, %zero, 32
	addi	%v0, %a1, 0
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	flw	%f0, 152(%zero)
	ftoi	%a2, %f0
	addi	%at, %zero, 255
	blt	%at, %a2, bgt_else.47225
	blti	%a2, 0, bgti_else.47227
	j	bgt_cont.47226
bgti_else.47227:
	addi	%a2, %zero, 0
bgti_cont.47228:
	j	bgt_cont.47226
bgt_else.47225:
	addi	%a2, %zero, 255
bgt_cont.47226:
	blti	%a2, 10, bgti_else.47229
	blti	%a2, 20, bgti_else.47231
	blti	%a2, 30, bgti_else.47233
	blti	%a2, 40, bgti_else.47235
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.47237
	blti	%a0, 20, bgti_else.47239
	blti	%a0, 30, bgti_else.47241
	blti	%a0, 40, bgti_else.47243
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47245
	blti	%a0, 20, bgti_else.47247
	blti	%a0, 30, bgti_else.47249
	blti	%a0, 40, bgti_else.47251
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%k0, %v0, 0
	j	bgti_cont.47230
bgti_else.47251:
	addi	%k0, %zero, 11
bgti_cont.47252:
	j	bgti_cont.47230
bgti_else.47249:
	addi	%k0, %zero, 10
bgti_cont.47250:
	j	bgti_cont.47230
bgti_else.47247:
	addi	%k0, %zero, 9
bgti_cont.47248:
	j	bgti_cont.47230
bgti_else.47245:
	addi	%k0, %zero, 8
bgti_cont.47246:
	j	bgti_cont.47230
bgti_else.47243:
	addi	%k0, %zero, 7
bgti_cont.47244:
	j	bgti_cont.47230
bgti_else.47241:
	addi	%k0, %zero, 6
bgti_cont.47242:
	j	bgti_cont.47230
bgti_else.47239:
	addi	%k0, %zero, 5
bgti_cont.47240:
	j	bgti_cont.47230
bgti_else.47237:
	addi	%k0, %zero, 4
bgti_cont.47238:
	j	bgti_cont.47230
bgti_else.47235:
	addi	%k0, %zero, 3
bgti_cont.47236:
	j	bgti_cont.47230
bgti_else.47233:
	addi	%k0, %zero, 2
bgti_cont.47234:
	j	bgti_cont.47230
bgti_else.47231:
	addi	%k0, %zero, 1
bgti_cont.47232:
	j	bgti_cont.47230
bgti_else.47229:
	addi	%k0, %zero, 0
bgti_cont.47230:
	blti	%a2, 10, bgti_else.47253
	blti	%a2, 20, bgti_else.47255
	blti	%a2, 30, bgti_else.47257
	blti	%a2, 40, bgti_else.47259
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47254
	blti	%a2, 20, bgti_else.47263
	blti	%a2, 30, bgti_else.47265
	blti	%a2, 40, bgti_else.47267
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47254
	blti	%a2, 20, bgti_else.47271
	blti	%a2, 30, bgti_else.47273
	blti	%a2, 40, bgti_else.47275
	addi	%v0, %a2, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a2, %v0, 0
	j	bgti_cont.47254
bgti_else.47275:
	addi	%a2, %a2, -30
bgti_cont.47276:
	j	bgti_cont.47254
bgti_else.47273:
	addi	%a2, %a2, -20
bgti_cont.47274:
	j	bgti_cont.47254
bgti_else.47271:
	addi	%a2, %a2, -10
bgti_cont.47272:
	j	bgti_cont.47254
bgti_else.47269:
bgti_cont.47270:
	j	bgti_cont.47254
bgti_else.47267:
	addi	%a2, %a2, -30
bgti_cont.47268:
	j	bgti_cont.47254
bgti_else.47265:
	addi	%a2, %a2, -20
bgti_cont.47266:
	j	bgti_cont.47254
bgti_else.47263:
	addi	%a2, %a2, -10
bgti_cont.47264:
	j	bgti_cont.47254
bgti_else.47261:
bgti_cont.47262:
	j	bgti_cont.47254
bgti_else.47259:
	addi	%a2, %a2, -30
bgti_cont.47260:
	j	bgti_cont.47254
bgti_else.47257:
	addi	%a2, %a2, -20
bgti_cont.47258:
	j	bgti_cont.47254
bgti_else.47255:
	addi	%a2, %a2, -10
bgti_cont.47256:
	j	bgti_cont.47254
bgti_else.47253:
bgti_cont.47254:
	blt	%zero, %k0, bgt_else.47277
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47278
bgt_else.47277:
	blti	%k0, 10, bgti_else.47279
	blti	%k0, 20, bgti_else.47281
	blti	%k0, 30, bgti_else.47283
	blti	%k0, 40, bgti_else.47285
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.47287
	blti	%a0, 20, bgti_else.47289
	blti	%a0, 30, bgti_else.47291
	blti	%a0, 40, bgti_else.47293
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47295
	blti	%a0, 20, bgti_else.47297
	blti	%a0, 30, bgti_else.47299
	blti	%a0, 40, bgti_else.47301
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47280
bgti_else.47301:
	addi	%a0, %zero, 11
bgti_cont.47302:
	j	bgti_cont.47280
bgti_else.47299:
	addi	%a0, %zero, 10
bgti_cont.47300:
	j	bgti_cont.47280
bgti_else.47297:
	addi	%a0, %zero, 9
bgti_cont.47298:
	j	bgti_cont.47280
bgti_else.47295:
	addi	%a0, %zero, 8
bgti_cont.47296:
	j	bgti_cont.47280
bgti_else.47293:
	addi	%a0, %zero, 7
bgti_cont.47294:
	j	bgti_cont.47280
bgti_else.47291:
	addi	%a0, %zero, 6
bgti_cont.47292:
	j	bgti_cont.47280
bgti_else.47289:
	addi	%a0, %zero, 5
bgti_cont.47290:
	j	bgti_cont.47280
bgti_else.47287:
	addi	%a0, %zero, 4
bgti_cont.47288:
	j	bgti_cont.47280
bgti_else.47285:
	addi	%a0, %zero, 3
bgti_cont.47286:
	j	bgti_cont.47280
bgti_else.47283:
	addi	%a0, %zero, 2
bgti_cont.47284:
	j	bgti_cont.47280
bgti_else.47281:
	addi	%a0, %zero, 1
bgti_cont.47282:
	j	bgti_cont.47280
bgti_else.47279:
	addi	%a0, %zero, 0
bgti_cont.47280:
	blti	%k0, 10, bgti_else.47303
	blti	%k0, 20, bgti_else.47305
	blti	%k0, 30, bgti_else.47307
	blti	%k0, 40, bgti_else.47309
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.47304
	blti	%k0, 20, bgti_else.47313
	blti	%k0, 30, bgti_else.47315
	blti	%k0, 40, bgti_else.47317
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.47304
	blti	%k0, 20, bgti_else.47321
	blti	%k0, 30, bgti_else.47323
	blti	%k0, 40, bgti_else.47325
	addi	%v0, %k0, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%k0, %v0, 0
	j	bgti_cont.47304
bgti_else.47325:
	addi	%k0, %k0, -30
bgti_cont.47326:
	j	bgti_cont.47304
bgti_else.47323:
	addi	%k0, %k0, -20
bgti_cont.47324:
	j	bgti_cont.47304
bgti_else.47321:
	addi	%k0, %k0, -10
bgti_cont.47322:
	j	bgti_cont.47304
bgti_else.47319:
bgti_cont.47320:
	j	bgti_cont.47304
bgti_else.47317:
	addi	%k0, %k0, -30
bgti_cont.47318:
	j	bgti_cont.47304
bgti_else.47315:
	addi	%k0, %k0, -20
bgti_cont.47316:
	j	bgti_cont.47304
bgti_else.47313:
	addi	%k0, %k0, -10
bgti_cont.47314:
	j	bgti_cont.47304
bgti_else.47311:
bgti_cont.47312:
	j	bgti_cont.47304
bgti_else.47309:
	addi	%k0, %k0, -30
bgti_cont.47310:
	j	bgti_cont.47304
bgti_else.47307:
	addi	%k0, %k0, -20
bgti_cont.47308:
	j	bgti_cont.47304
bgti_else.47305:
	addi	%k0, %k0, -10
bgti_cont.47306:
	j	bgti_cont.47304
bgti_else.47303:
bgti_cont.47304:
	blt	%zero, %a0, bgt_else.47327
	addi	%v0, %k0, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47328
bgt_else.47327:
	blti	%a0, 10, bgti_else.47329
	blti	%a0, 20, bgti_else.47331
	blti	%a0, 30, bgti_else.47333
	blti	%a0, 40, bgti_else.47335
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47330
	blti	%a0, 20, bgti_else.47339
	blti	%a0, 30, bgti_else.47341
	blti	%a0, 40, bgti_else.47343
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47330
	blti	%a0, 20, bgti_else.47347
	blti	%a0, 30, bgti_else.47349
	blti	%a0, 40, bgti_else.47351
	addi	%v0, %a0, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47330
bgti_else.47351:
	addi	%a0, %a0, -30
bgti_cont.47352:
	j	bgti_cont.47330
bgti_else.47349:
	addi	%a0, %a0, -20
bgti_cont.47350:
	j	bgti_cont.47330
bgti_else.47347:
	addi	%a0, %a0, -10
bgti_cont.47348:
	j	bgti_cont.47330
bgti_else.47345:
bgti_cont.47346:
	j	bgti_cont.47330
bgti_else.47343:
	addi	%a0, %a0, -30
bgti_cont.47344:
	j	bgti_cont.47330
bgti_else.47341:
	addi	%a0, %a0, -20
bgti_cont.47342:
	j	bgti_cont.47330
bgti_else.47339:
	addi	%a0, %a0, -10
bgti_cont.47340:
	j	bgti_cont.47330
bgti_else.47337:
bgti_cont.47338:
	j	bgti_cont.47330
bgti_else.47335:
	addi	%a0, %a0, -30
bgti_cont.47336:
	j	bgti_cont.47330
bgti_else.47333:
	addi	%a0, %a0, -20
bgti_cont.47334:
	j	bgti_cont.47330
bgti_else.47331:
	addi	%a0, %a0, -10
bgti_cont.47332:
	j	bgti_cont.47330
bgti_else.47329:
bgti_cont.47330:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %k0, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
bgt_cont.47328:
bgt_cont.47278:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.47353
	blti	%a1, 0, bgti_else.47355
	j	bgt_cont.47354
bgti_else.47355:
	addi	%a1, %zero, 0
bgti_cont.47356:
	j	bgt_cont.47354
bgt_else.47353:
	addi	%a1, %zero, 255
bgt_cont.47354:
	blti	%a1, 10, bgti_else.47357
	blti	%a1, 20, bgti_else.47359
	blti	%a1, 30, bgti_else.47361
	blti	%a1, 40, bgti_else.47363
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.47365
	blti	%a0, 20, bgti_else.47367
	blti	%a0, 30, bgti_else.47369
	blti	%a0, 40, bgti_else.47371
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47373
	blti	%a0, 20, bgti_else.47375
	blti	%a0, 30, bgti_else.47377
	blti	%a0, 40, bgti_else.47379
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%a2, %v0, 0
	j	bgti_cont.47358
bgti_else.47379:
	addi	%a2, %zero, 11
bgti_cont.47380:
	j	bgti_cont.47358
bgti_else.47377:
	addi	%a2, %zero, 10
bgti_cont.47378:
	j	bgti_cont.47358
bgti_else.47375:
	addi	%a2, %zero, 9
bgti_cont.47376:
	j	bgti_cont.47358
bgti_else.47373:
	addi	%a2, %zero, 8
bgti_cont.47374:
	j	bgti_cont.47358
bgti_else.47371:
	addi	%a2, %zero, 7
bgti_cont.47372:
	j	bgti_cont.47358
bgti_else.47369:
	addi	%a2, %zero, 6
bgti_cont.47370:
	j	bgti_cont.47358
bgti_else.47367:
	addi	%a2, %zero, 5
bgti_cont.47368:
	j	bgti_cont.47358
bgti_else.47365:
	addi	%a2, %zero, 4
bgti_cont.47366:
	j	bgti_cont.47358
bgti_else.47363:
	addi	%a2, %zero, 3
bgti_cont.47364:
	j	bgti_cont.47358
bgti_else.47361:
	addi	%a2, %zero, 2
bgti_cont.47362:
	j	bgti_cont.47358
bgti_else.47359:
	addi	%a2, %zero, 1
bgti_cont.47360:
	j	bgti_cont.47358
bgti_else.47357:
	addi	%a2, %zero, 0
bgti_cont.47358:
	blti	%a1, 10, bgti_else.47381
	blti	%a1, 20, bgti_else.47383
	blti	%a1, 30, bgti_else.47385
	blti	%a1, 40, bgti_else.47387
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.47382
	blti	%a1, 20, bgti_else.47391
	blti	%a1, 30, bgti_else.47393
	blti	%a1, 40, bgti_else.47395
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.47382
	blti	%a1, 20, bgti_else.47399
	blti	%a1, 30, bgti_else.47401
	blti	%a1, 40, bgti_else.47403
	addi	%v0, %a1, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a1, %v0, 0
	j	bgti_cont.47382
bgti_else.47403:
	addi	%a1, %a1, -30
bgti_cont.47404:
	j	bgti_cont.47382
bgti_else.47401:
	addi	%a1, %a1, -20
bgti_cont.47402:
	j	bgti_cont.47382
bgti_else.47399:
	addi	%a1, %a1, -10
bgti_cont.47400:
	j	bgti_cont.47382
bgti_else.47397:
bgti_cont.47398:
	j	bgti_cont.47382
bgti_else.47395:
	addi	%a1, %a1, -30
bgti_cont.47396:
	j	bgti_cont.47382
bgti_else.47393:
	addi	%a1, %a1, -20
bgti_cont.47394:
	j	bgti_cont.47382
bgti_else.47391:
	addi	%a1, %a1, -10
bgti_cont.47392:
	j	bgti_cont.47382
bgti_else.47389:
bgti_cont.47390:
	j	bgti_cont.47382
bgti_else.47387:
	addi	%a1, %a1, -30
bgti_cont.47388:
	j	bgti_cont.47382
bgti_else.47385:
	addi	%a1, %a1, -20
bgti_cont.47386:
	j	bgti_cont.47382
bgti_else.47383:
	addi	%a1, %a1, -10
bgti_cont.47384:
	j	bgti_cont.47382
bgti_else.47381:
bgti_cont.47382:
	blt	%zero, %a2, bgt_else.47405
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47406
bgt_else.47405:
	blti	%a2, 10, bgti_else.47407
	blti	%a2, 20, bgti_else.47409
	blti	%a2, 30, bgti_else.47411
	blti	%a2, 40, bgti_else.47413
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.47415
	blti	%a0, 20, bgti_else.47417
	blti	%a0, 30, bgti_else.47419
	blti	%a0, 40, bgti_else.47421
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.47423
	blti	%a0, 20, bgti_else.47425
	blti	%a0, 30, bgti_else.47427
	blti	%a0, 40, bgti_else.47429
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 12
	jal	print_int_sub1.2641
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47408
bgti_else.47429:
	addi	%a0, %zero, 11
bgti_cont.47430:
	j	bgti_cont.47408
bgti_else.47427:
	addi	%a0, %zero, 10
bgti_cont.47428:
	j	bgti_cont.47408
bgti_else.47425:
	addi	%a0, %zero, 9
bgti_cont.47426:
	j	bgti_cont.47408
bgti_else.47423:
	addi	%a0, %zero, 8
bgti_cont.47424:
	j	bgti_cont.47408
bgti_else.47421:
	addi	%a0, %zero, 7
bgti_cont.47422:
	j	bgti_cont.47408
bgti_else.47419:
	addi	%a0, %zero, 6
bgti_cont.47420:
	j	bgti_cont.47408
bgti_else.47417:
	addi	%a0, %zero, 5
bgti_cont.47418:
	j	bgti_cont.47408
bgti_else.47415:
	addi	%a0, %zero, 4
bgti_cont.47416:
	j	bgti_cont.47408
bgti_else.47413:
	addi	%a0, %zero, 3
bgti_cont.47414:
	j	bgti_cont.47408
bgti_else.47411:
	addi	%a0, %zero, 2
bgti_cont.47412:
	j	bgti_cont.47408
bgti_else.47409:
	addi	%a0, %zero, 1
bgti_cont.47410:
	j	bgti_cont.47408
bgti_else.47407:
	addi	%a0, %zero, 0
bgti_cont.47408:
	blti	%a2, 10, bgti_else.47431
	blti	%a2, 20, bgti_else.47433
	blti	%a2, 30, bgti_else.47435
	blti	%a2, 40, bgti_else.47437
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47432
	blti	%a2, 20, bgti_else.47441
	blti	%a2, 30, bgti_else.47443
	blti	%a2, 40, bgti_else.47445
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47432
	blti	%a2, 20, bgti_else.47449
	blti	%a2, 30, bgti_else.47451
	blti	%a2, 40, bgti_else.47453
	addi	%v0, %a2, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a2, %v0, 0
	j	bgti_cont.47432
bgti_else.47453:
	addi	%a2, %a2, -30
bgti_cont.47454:
	j	bgti_cont.47432
bgti_else.47451:
	addi	%a2, %a2, -20
bgti_cont.47452:
	j	bgti_cont.47432
bgti_else.47449:
	addi	%a2, %a2, -10
bgti_cont.47450:
	j	bgti_cont.47432
bgti_else.47447:
bgti_cont.47448:
	j	bgti_cont.47432
bgti_else.47445:
	addi	%a2, %a2, -30
bgti_cont.47446:
	j	bgti_cont.47432
bgti_else.47443:
	addi	%a2, %a2, -20
bgti_cont.47444:
	j	bgti_cont.47432
bgti_else.47441:
	addi	%a2, %a2, -10
bgti_cont.47442:
	j	bgti_cont.47432
bgti_else.47439:
bgti_cont.47440:
	j	bgti_cont.47432
bgti_else.47437:
	addi	%a2, %a2, -30
bgti_cont.47438:
	j	bgti_cont.47432
bgti_else.47435:
	addi	%a2, %a2, -20
bgti_cont.47436:
	j	bgti_cont.47432
bgti_else.47433:
	addi	%a2, %a2, -10
bgti_cont.47434:
	j	bgti_cont.47432
bgti_else.47431:
bgti_cont.47432:
	blt	%zero, %a0, bgt_else.47455
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	j	bgt_cont.47456
bgt_else.47455:
	blti	%a0, 10, bgti_else.47457
	blti	%a0, 20, bgti_else.47459
	blti	%a0, 30, bgti_else.47461
	blti	%a0, 40, bgti_else.47463
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47458
	blti	%a0, 20, bgti_else.47467
	blti	%a0, 30, bgti_else.47469
	blti	%a0, 40, bgti_else.47471
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47458
	blti	%a0, 20, bgti_else.47475
	blti	%a0, 30, bgti_else.47477
	blti	%a0, 40, bgti_else.47479
	addi	%v0, %a0, -40
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	j	bgti_cont.47458
bgti_else.47479:
	addi	%a0, %a0, -30
bgti_cont.47480:
	j	bgti_cont.47458
bgti_else.47477:
	addi	%a0, %a0, -20
bgti_cont.47478:
	j	bgti_cont.47458
bgti_else.47475:
	addi	%a0, %a0, -10
bgti_cont.47476:
	j	bgti_cont.47458
bgti_else.47473:
bgti_cont.47474:
	j	bgti_cont.47458
bgti_else.47471:
	addi	%a0, %a0, -30
bgti_cont.47472:
	j	bgti_cont.47458
bgti_else.47469:
	addi	%a0, %a0, -20
bgti_cont.47470:
	j	bgti_cont.47458
bgti_else.47467:
	addi	%a0, %a0, -10
bgti_cont.47468:
	j	bgti_cont.47458
bgti_else.47465:
bgti_cont.47466:
	j	bgti_cont.47458
bgti_else.47463:
	addi	%a0, %a0, -30
bgti_cont.47464:
	j	bgti_cont.47458
bgti_else.47461:
	addi	%a0, %a0, -20
bgti_cont.47462:
	j	bgti_cont.47458
bgti_else.47459:
	addi	%a0, %a0, -10
bgti_cont.47460:
	j	bgti_cont.47458
bgti_else.47457:
bgti_cont.47458:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a2, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	addi	%v0, %a1, 48
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
bgt_cont.47456:
bgt_cont.47406:
	addi	%v0, %a3, 0
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	scan_pixel.3057
	addi	%sp, %sp, -12
bgt_cont.47086:
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t4, %a0, 2
	blti	%t4, 5, bgti_else.47481
	addi	%t4, %t4, -5
	j	bgti_cont.47482
bgti_else.47481:
bgti_cont.47482:
	blt	%t0, %t1, bgt_else.47483
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.47483:
	lw	%a0, 11(%sp)
	blt	%t0, %a0, bgt_else.47485
	j	bgt_cont.47486
bgt_else.47485:
	addi	%a1, %t0, 1
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
	addi	%v1, %t3, -1
	lw	%v0, 1(%sp)
	addi	%a0, %t4, 0
	addi	%sp, %sp, 12
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -12
bgt_cont.47486:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 12
	jal	scan_pixel.3057
	addi	%sp, %sp, -12
	addi	%v0, %t0, 1
	addi	%a2, %t4, 2
	blti	%a2, 5, bgti_else.47487
	addi	%a2, %a2, -5
	j	bgti_cont.47488
bgti_else.47487:
bgti_cont.47488:
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	j	scan_line.3063
init_line_elements.3073:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	addi	%s3, %zero, 0
	blti	%a2, 0, bgti_else.47519
	addi	%k0, %zero, 3
	flw	%f1, 470(%zero)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%s1, %zero, 5
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%s6, %zero, 1
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s4, %v0, 0
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%t7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%t7)
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	addi	%t8, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%t8, 6(%ra)
	sw	%t7, 5(%ra)
	sw	%s7, 4(%ra)
	sw	%s5, 3(%ra)
	sw	%s4, 2(%ra)
	sw	%s2, 1(%ra)
	sw	%s0, 0(%ra)
	add	%at, %a1, %a2
	sw	%ra, 0(%at)
	addi	%s4, %a2, -1
	blti	%s4, 0, bgti_else.47520
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%t7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%t7)
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	addi	%t8, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%t8, 6(%ra)
	sw	%t7, 5(%ra)
	sw	%s7, 4(%ra)
	sw	%s5, 3(%ra)
	sw	%s2, 2(%ra)
	sw	%s0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.47521
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%t7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%t7)
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	addi	%t8, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%t8, 6(%ra)
	sw	%t7, 5(%ra)
	sw	%s7, 4(%ra)
	sw	%s5, 3(%ra)
	sw	%s2, 2(%ra)
	sw	%s0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.47522
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %s3, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%s7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%t7, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%t7)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%t7)
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%k0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%k0)
	sw	%s3, 6(%k0)
	sw	%t7, 5(%k0)
	sw	%s7, 4(%k0)
	sw	%s5, 3(%k0)
	sw	%s2, 2(%k0)
	sw	%s0, 1(%k0)
	sw	%a2, 0(%k0)
	add	%at, %a1, %s4
	sw	%k0, 0(%at)
	addi	%v1, %s4, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	init_line_elements.3073
bgti_else.47522:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47521:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47520:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.47519:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3083:
	fmov	%f17, %f2
	add	%a1, %zero, %ra
	blti	%v0, 5, bgti_else.47953
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1
	fadd	%f16, %f17, %f16
	flw	%f18, 474(%zero)
	fadd	%f16, %f16, %f18
	fsqrt	%f16, %f16
	fdiv	%f19, %f0, %f16
	fdiv	%f17, %f1, %f16
	fdiv	%f18, %f18, %f16
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
bgti_else.47953:
	fmul	%f0, %f1, %f1
	flw	%f20, 441(%zero)
	fadd	%f0, %f0, %f20
	fsqrt	%f23, %f0
	flw	%f21, 474(%zero)
	fdiv	%f2, %f21, %f23
	flw	%f19, 470(%zero)
	fblt	%f2, %f19, fbgt_else.47955
	addi	%a2, %zero, 1
	j	fbgt_cont.47956
fbgt_else.47955:
	addi	%a2, %zero, 0
fbgt_cont.47956:
	fabs	%f18, %f2
	flw	%f22, 462(%zero)
	fblt	%f18, %f22, fbgt_else.47957
	flw	%f0, 455(%zero)
	fblt	%f18, %f0, fbgt_else.47959
	flw	%f16, 479(%zero)
	fdiv	%f24, %f21, %f18
	fmul	%f25, %f24, %f24
	fmul	%f2, %f25, %f25
	fmul	%f18, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fsub	%f1, %f24, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.47960
fbgt_else.47959:
	flw	%f16, 478(%zero)
	fsub	%f1, %f18, %f21
	fadd	%f0, %f18, %f21
	fdiv	%f24, %f1, %f0
	fmul	%f25, %f24, %f24
	fmul	%f2, %f25, %f25
	fmul	%f18, %f2, %f2
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fsub	%f1, %f24, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.47960:
	beqi	%a2, 0, bnei_else.47961
	j	fbgt_cont.47958
bnei_else.47961:
	fneg	%f0, %f0
bnei_cont.47962:
	j	fbgt_cont.47958
fbgt_else.47957:
	fmul	%f24, %f2, %f2
	fmul	%f18, %f24, %f24
	fmul	%f16, %f18, %f18
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f24
	fsub	%f1, %f2, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
fbgt_cont.47958:
	fmul	%f25, %f0, %f17
	flw	%f24, 494(%zero)
	fblt	%f25, %f19, fbgt_else.47963
	addi	%a2, %zero, 1
	j	fbgt_cont.47964
fbgt_else.47963:
	addi	%a2, %zero, 0
fbgt_cont.47964:
	fabs	%f18, %f25
	flw	%f2, 493(%zero)
	fblt	%f18, %f2, fbgt_else.47965
	flw	%f0, 492(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 491(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 490(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 489(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 488(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 487(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 486(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 485(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 484(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f0, 483(%zero)
	fblt	%f18, %f0, fbgt_cont.47966
	flw	%f1, 482(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.47966
fbgt_else.47985:
fbgt_cont.47986:
	j	fbgt_cont.47966
fbgt_else.47983:
fbgt_cont.47984:
	j	fbgt_cont.47966
fbgt_else.47981:
fbgt_cont.47982:
	j	fbgt_cont.47966
fbgt_else.47979:
fbgt_cont.47980:
	j	fbgt_cont.47966
fbgt_else.47977:
fbgt_cont.47978:
	j	fbgt_cont.47966
fbgt_else.47975:
fbgt_cont.47976:
	j	fbgt_cont.47966
fbgt_else.47973:
fbgt_cont.47974:
	j	fbgt_cont.47966
fbgt_else.47971:
fbgt_cont.47972:
	j	fbgt_cont.47966
fbgt_else.47969:
fbgt_cont.47970:
	j	fbgt_cont.47966
fbgt_else.47967:
fbgt_cont.47968:
	j	fbgt_cont.47966
fbgt_else.47965:
	fmov	%f0, %f2
fbgt_cont.47966:
	fblt	%f18, %f2, fbgt_else.47987
	fblt	%f18, %f0, fbgt_else.47989
	fsub	%f18, %f18, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f0, fbgt_else.47993
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f1, fbgt_else.47997
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47988
fbgt_else.47997:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.47998:
	j	fbgt_cont.47988
fbgt_else.47995:
fbgt_cont.47996:
	j	fbgt_cont.47988
fbgt_else.47993:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f1, fbgt_else.48001
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47988
fbgt_else.48001:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.48002:
	j	fbgt_cont.47988
fbgt_else.47999:
fbgt_cont.48000:
fbgt_cont.47994:
	j	fbgt_cont.47988
fbgt_else.47991:
fbgt_cont.47992:
	j	fbgt_cont.47988
fbgt_else.47989:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f0, fbgt_else.48005
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f1, fbgt_else.48009
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47988
fbgt_else.48009:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.48010:
	j	fbgt_cont.47988
fbgt_else.48007:
fbgt_cont.48008:
	j	fbgt_cont.47988
fbgt_else.48005:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f2, fbgt_cont.47988
	fblt	%f18, %f1, fbgt_else.48013
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.47988
fbgt_else.48013:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.48014:
	j	fbgt_cont.47988
fbgt_else.48011:
fbgt_cont.48012:
fbgt_cont.48006:
	j	fbgt_cont.47988
fbgt_else.48003:
fbgt_cont.48004:
fbgt_cont.47990:
	j	fbgt_cont.47988
fbgt_else.47987:
fbgt_cont.47988:
	fblt	%f18, %f24, fbgt_else.48015
	beqi	%a2, 0, bnei_else.48017
	addi	%a2, %zero, 0
	j	fbgt_cont.48016
bnei_else.48017:
	addi	%a2, %zero, 1
bnei_cont.48018:
	j	fbgt_cont.48016
fbgt_else.48015:
fbgt_cont.48016:
	fblt	%f18, %f24, fbgt_else.48019
	fsub	%f18, %f18, %f24
	j	fbgt_cont.48020
fbgt_else.48019:
fbgt_cont.48020:
	flw	%f26, 479(%zero)
	fblt	%f18, %f26, fbgt_else.48021
	fsub	%f18, %f24, %f18
	j	fbgt_cont.48022
fbgt_else.48021:
fbgt_cont.48022:
	flw	%f27, 478(%zero)
	fblt	%f27, %f18, fbgt_else.48023
	fmul	%f28, %f18, %f18
	fmul	%f16, %f28, %f28
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f28
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f28
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.48024
fbgt_else.48023:
	fsub	%f0, %f26, %f18
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f21, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.48024:
	beqi	%a2, 0, bnei_else.48025
	j	bnei_cont.48026
bnei_else.48025:
	fneg	%f18, %f18
bnei_cont.48026:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.48027
	flw	%f0, 492(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 491(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 490(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 489(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 488(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 487(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 486(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 485(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 484(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f0, 483(%zero)
	fblt	%f25, %f0, fbgt_cont.48028
	flw	%f1, 482(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.48028
fbgt_else.48047:
fbgt_cont.48048:
	j	fbgt_cont.48028
fbgt_else.48045:
fbgt_cont.48046:
	j	fbgt_cont.48028
fbgt_else.48043:
fbgt_cont.48044:
	j	fbgt_cont.48028
fbgt_else.48041:
fbgt_cont.48042:
	j	fbgt_cont.48028
fbgt_else.48039:
fbgt_cont.48040:
	j	fbgt_cont.48028
fbgt_else.48037:
fbgt_cont.48038:
	j	fbgt_cont.48028
fbgt_else.48035:
fbgt_cont.48036:
	j	fbgt_cont.48028
fbgt_else.48033:
fbgt_cont.48034:
	j	fbgt_cont.48028
fbgt_else.48031:
fbgt_cont.48032:
	j	fbgt_cont.48028
fbgt_else.48029:
fbgt_cont.48030:
	j	fbgt_cont.48028
fbgt_else.48027:
	fmov	%f0, %f2
fbgt_cont.48028:
	fblt	%f25, %f2, fbgt_else.48049
	fblt	%f25, %f0, fbgt_else.48051
	fsub	%f25, %f25, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f0, fbgt_else.48055
	fsub	%f25, %f25, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f1, fbgt_else.48059
	fsub	%f0, %f25, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.48050
fbgt_else.48059:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.48060:
	j	fbgt_cont.48050
fbgt_else.48057:
fbgt_cont.48058:
	j	fbgt_cont.48050
fbgt_else.48055:
	fdiv	%f1, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f1, fbgt_else.48063
	fsub	%f0, %f25, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.48050
fbgt_else.48063:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.48064:
	j	fbgt_cont.48050
fbgt_else.48061:
fbgt_cont.48062:
fbgt_cont.48056:
	j	fbgt_cont.48050
fbgt_else.48053:
fbgt_cont.48054:
	j	fbgt_cont.48050
fbgt_else.48051:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f0, fbgt_else.48067
	fsub	%f25, %f25, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f1, fbgt_else.48071
	fsub	%f0, %f25, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.48050
fbgt_else.48071:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.48072:
	j	fbgt_cont.48050
fbgt_else.48069:
fbgt_cont.48070:
	j	fbgt_cont.48050
fbgt_else.48067:
	fdiv	%f1, %f0, %f16
	fblt	%f25, %f2, fbgt_cont.48050
	fblt	%f25, %f1, fbgt_else.48075
	fsub	%f0, %f25, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.48050
fbgt_else.48075:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.48076:
	j	fbgt_cont.48050
fbgt_else.48073:
fbgt_cont.48074:
fbgt_cont.48068:
	j	fbgt_cont.48050
fbgt_else.48065:
fbgt_cont.48066:
fbgt_cont.48052:
	j	fbgt_cont.48050
fbgt_else.48049:
fbgt_cont.48050:
	fblt	%f25, %f24, fbgt_else.48077
	addi	%a2, %zero, 0
	j	fbgt_cont.48078
fbgt_else.48077:
	addi	%a2, %zero, 1
fbgt_cont.48078:
	fblt	%f25, %f24, fbgt_else.48079
	fsub	%f25, %f25, %f24
	j	fbgt_cont.48080
fbgt_else.48079:
fbgt_cont.48080:
	fblt	%f25, %f26, fbgt_else.48081
	beqi	%a2, 0, bnei_else.48083
	addi	%a2, %zero, 0
	j	fbgt_cont.48082
bnei_else.48083:
	addi	%a2, %zero, 1
bnei_cont.48084:
	j	fbgt_cont.48082
fbgt_else.48081:
fbgt_cont.48082:
	fblt	%f25, %f26, fbgt_else.48085
	fsub	%f25, %f24, %f25
	j	fbgt_cont.48086
fbgt_else.48085:
fbgt_cont.48086:
	fblt	%f27, %f25, fbgt_else.48087
	fmul	%f25, %f25, %f25
	fmul	%f16, %f25, %f25
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f25
	fsub	%f1, %f21, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.48088
fbgt_else.48087:
	fsub	%f28, %f26, %f25
	fmul	%f25, %f28, %f28
	fmul	%f16, %f25, %f25
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f28
	fmul	%f0, %f0, %f25
	fsub	%f1, %f28, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f28
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f28
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.48088:
	beqi	%a2, 0, bnei_else.48089
	j	bnei_cont.48090
bnei_else.48089:
	fneg	%f0, %f0
bnei_cont.48090:
	fdiv	%f0, %f18, %f0
	fmul	%f18, %f0, %f23
	addi	%v0, %v0, 1
	fmul	%f0, %f18, %f18
	fadd	%f0, %f0, %f20
	fsqrt	%f20, %f0
	fdiv	%f16, %f21, %f20
	fblt	%f16, %f19, fbgt_else.48091
	addi	%a2, %zero, 1
	j	fbgt_cont.48092
fbgt_else.48091:
	addi	%a2, %zero, 0
fbgt_cont.48092:
	fabs	%f23, %f16
	fblt	%f23, %f22, fbgt_else.48093
	flw	%f0, 455(%zero)
	fblt	%f23, %f0, fbgt_else.48095
	fdiv	%f23, %f21, %f23
	fmul	%f25, %f23, %f23
	fmul	%f22, %f25, %f25
	fmul	%f16, %f22, %f22
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fsub	%f1, %f23, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f22
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsub	%f0, %f26, %f0
	j	fbgt_cont.48096
fbgt_else.48095:
	fsub	%f1, %f23, %f21
	fadd	%f0, %f23, %f21
	fdiv	%f23, %f1, %f0
	fmul	%f25, %f23, %f23
	fmul	%f22, %f25, %f25
	fmul	%f16, %f22, %f22
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fsub	%f1, %f23, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f22
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fadd	%f0, %f27, %f0
fbgt_cont.48096:
	beqi	%a2, 0, bnei_else.48097
	j	fbgt_cont.48094
bnei_else.48097:
	fneg	%f0, %f0
bnei_cont.48098:
	j	fbgt_cont.48094
fbgt_else.48093:
	fmul	%f25, %f16, %f16
	fmul	%f23, %f25, %f25
	fmul	%f22, %f23, %f23
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f25
	fsub	%f1, %f16, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f23
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f22
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fadd	%f0, %f1, %f0
fbgt_cont.48094:
	fmul	%f22, %f0, %f3
	fblt	%f22, %f19, fbgt_else.48099
	addi	%a2, %zero, 1
	j	fbgt_cont.48100
fbgt_else.48099:
	addi	%a2, %zero, 0
fbgt_cont.48100:
	fabs	%f19, %f22
	fblt	%f19, %f2, fbgt_else.48101
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f0, 483(%zero)
	fblt	%f19, %f0, fbgt_cont.48102
	flw	%f1, 482(%zero)
	fmov	%f0, %f19
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.48102
fbgt_else.48121:
fbgt_cont.48122:
	j	fbgt_cont.48102
fbgt_else.48119:
fbgt_cont.48120:
	j	fbgt_cont.48102
fbgt_else.48117:
fbgt_cont.48118:
	j	fbgt_cont.48102
fbgt_else.48115:
fbgt_cont.48116:
	j	fbgt_cont.48102
fbgt_else.48113:
fbgt_cont.48114:
	j	fbgt_cont.48102
fbgt_else.48111:
fbgt_cont.48112:
	j	fbgt_cont.48102
fbgt_else.48109:
fbgt_cont.48110:
	j	fbgt_cont.48102
fbgt_else.48107:
fbgt_cont.48108:
	j	fbgt_cont.48102
fbgt_else.48105:
fbgt_cont.48106:
	j	fbgt_cont.48102
fbgt_else.48103:
fbgt_cont.48104:
	j	fbgt_cont.48102
fbgt_else.48101:
	fmov	%f0, %f2
fbgt_cont.48102:
	fblt	%f19, %f2, fbgt_else.48123
	fblt	%f19, %f0, fbgt_else.48125
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f0, fbgt_else.48129
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f1, fbgt_else.48133
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.48124
fbgt_else.48133:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.48134:
	j	fbgt_cont.48124
fbgt_else.48131:
fbgt_cont.48132:
	j	fbgt_cont.48124
fbgt_else.48129:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f1, fbgt_else.48137
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.48124
fbgt_else.48137:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.48138:
	j	fbgt_cont.48124
fbgt_else.48135:
fbgt_cont.48136:
fbgt_cont.48130:
	j	fbgt_cont.48124
fbgt_else.48127:
fbgt_cont.48128:
	j	fbgt_cont.48124
fbgt_else.48125:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f0, fbgt_else.48141
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f1, fbgt_else.48145
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.48124
fbgt_else.48145:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.48146:
	j	fbgt_cont.48124
fbgt_else.48143:
fbgt_cont.48144:
	j	fbgt_cont.48124
fbgt_else.48141:
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.48124
	fblt	%f19, %f1, fbgt_else.48149
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.48124
fbgt_else.48149:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.48150:
	j	fbgt_cont.48124
fbgt_else.48147:
fbgt_cont.48148:
fbgt_cont.48142:
	j	fbgt_cont.48124
fbgt_else.48139:
fbgt_cont.48140:
fbgt_cont.48126:
	j	fbgt_cont.48124
fbgt_else.48123:
fbgt_cont.48124:
	fblt	%f19, %f24, fbgt_else.48151
	beqi	%a2, 0, bnei_else.48153
	addi	%a2, %zero, 0
	j	fbgt_cont.48152
bnei_else.48153:
	addi	%a2, %zero, 1
bnei_cont.48154:
	j	fbgt_cont.48152
fbgt_else.48151:
fbgt_cont.48152:
	fblt	%f19, %f24, fbgt_else.48155
	fsub	%f19, %f19, %f24
	j	fbgt_cont.48156
fbgt_else.48155:
fbgt_cont.48156:
	fblt	%f19, %f26, fbgt_else.48157
	fsub	%f19, %f24, %f19
	j	fbgt_cont.48158
fbgt_else.48157:
fbgt_cont.48158:
	fblt	%f27, %f19, fbgt_else.48159
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
	j	fbgt_cont.48160
fbgt_else.48159:
	fsub	%f0, %f26, %f19
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f21, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
fbgt_cont.48160:
	beqi	%a2, 0, bnei_else.48161
	j	bnei_cont.48162
bnei_else.48161:
	fneg	%f19, %f19
bnei_cont.48162:
	fabs	%f22, %f22
	fblt	%f22, %f2, fbgt_else.48163
	flw	%f0, 492(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 491(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 490(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 489(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 488(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 487(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 486(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 485(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 484(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f0, 483(%zero)
	fblt	%f22, %f0, fbgt_cont.48164
	flw	%f1, 482(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.48164
fbgt_else.48183:
fbgt_cont.48184:
	j	fbgt_cont.48164
fbgt_else.48181:
fbgt_cont.48182:
	j	fbgt_cont.48164
fbgt_else.48179:
fbgt_cont.48180:
	j	fbgt_cont.48164
fbgt_else.48177:
fbgt_cont.48178:
	j	fbgt_cont.48164
fbgt_else.48175:
fbgt_cont.48176:
	j	fbgt_cont.48164
fbgt_else.48173:
fbgt_cont.48174:
	j	fbgt_cont.48164
fbgt_else.48171:
fbgt_cont.48172:
	j	fbgt_cont.48164
fbgt_else.48169:
fbgt_cont.48170:
	j	fbgt_cont.48164
fbgt_else.48167:
fbgt_cont.48168:
	j	fbgt_cont.48164
fbgt_else.48165:
fbgt_cont.48166:
	j	fbgt_cont.48164
fbgt_else.48163:
	fmov	%f0, %f2
fbgt_cont.48164:
	fblt	%f22, %f2, fbgt_else.48185
	fblt	%f22, %f0, fbgt_else.48187
	fsub	%f22, %f22, %f0
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f0, fbgt_else.48191
	fsub	%f22, %f22, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f1, fbgt_else.48195
	fsub	%f0, %f22, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.48186
fbgt_else.48195:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.48196:
	j	fbgt_cont.48186
fbgt_else.48193:
fbgt_cont.48194:
	j	fbgt_cont.48186
fbgt_else.48191:
	fdiv	%f1, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f1, fbgt_else.48199
	fsub	%f0, %f22, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.48186
fbgt_else.48199:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.48200:
	j	fbgt_cont.48186
fbgt_else.48197:
fbgt_cont.48198:
fbgt_cont.48192:
	j	fbgt_cont.48186
fbgt_else.48189:
fbgt_cont.48190:
	j	fbgt_cont.48186
fbgt_else.48187:
	flw	%f16, 495(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f0, fbgt_else.48203
	fsub	%f22, %f22, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f1, fbgt_else.48207
	fsub	%f0, %f22, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.48186
fbgt_else.48207:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.48208:
	j	fbgt_cont.48186
fbgt_else.48205:
fbgt_cont.48206:
	j	fbgt_cont.48186
fbgt_else.48203:
	fdiv	%f1, %f0, %f16
	fblt	%f22, %f2, fbgt_cont.48186
	fblt	%f22, %f1, fbgt_else.48211
	fsub	%f0, %f22, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.48186
fbgt_else.48211:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.48212:
	j	fbgt_cont.48186
fbgt_else.48209:
fbgt_cont.48210:
fbgt_cont.48204:
	j	fbgt_cont.48186
fbgt_else.48201:
fbgt_cont.48202:
fbgt_cont.48188:
	j	fbgt_cont.48186
fbgt_else.48185:
fbgt_cont.48186:
	fblt	%f22, %f24, fbgt_else.48213
	addi	%a2, %zero, 0
	j	fbgt_cont.48214
fbgt_else.48213:
	addi	%a2, %zero, 1
fbgt_cont.48214:
	fblt	%f22, %f24, fbgt_else.48215
	fsub	%f22, %f22, %f24
	j	fbgt_cont.48216
fbgt_else.48215:
fbgt_cont.48216:
	fblt	%f22, %f26, fbgt_else.48217
	beqi	%a2, 0, bnei_else.48219
	addi	%a2, %zero, 0
	j	fbgt_cont.48218
bnei_else.48219:
	addi	%a2, %zero, 1
bnei_cont.48220:
	j	fbgt_cont.48218
fbgt_else.48217:
fbgt_cont.48218:
	fblt	%f22, %f26, fbgt_else.48221
	fsub	%f22, %f24, %f22
	j	fbgt_cont.48222
fbgt_else.48221:
fbgt_cont.48222:
	fblt	%f27, %f22, fbgt_else.48223
	fmul	%f2, %f22, %f22
	fmul	%f16, %f2, %f2
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f2
	fsub	%f1, %f21, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.48224
fbgt_else.48223:
	fsub	%f21, %f26, %f22
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
fbgt_cont.48224:
	beqi	%a2, 0, bnei_else.48225
	j	bnei_cont.48226
bnei_else.48225:
	fneg	%f0, %f0
bnei_cont.48226:
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
	addi	%s2, %zero, 0
	blti	%k0, 0, bgti_else.48274
	itof	%f0, %k0
	flw	%f4, 460(%zero)
	fmul	%f1, %f0, %f4
	flw	%f0, 438(%zero)
	fsub	%f2, %f1, %f0
	flw	%f29, 470(%zero)
	addi	%a0, %s0, 0
	addi	%v0, %s2, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f4
	flw	%f5, 441(%zero)
	fadd	%f2, %f0, %f5
	addi	%s3, %s0, 2
	addi	%a0, %s3, 0
	addi	%v0, %s2, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	jal	calc_dirvec.3083
	addi	%k0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.48275
	addi	%v1, %v1, -5
	j	bgti_cont.48276
bgti_else.48275:
bgti_cont.48276:
	blti	%k0, 0, bgti_else.48277
	itof	%f0, %k0
	fmul	%f0, %f0, %f4
	flw	%f0, 438(%zero)
	flw	%f2, 438(%zero)
	addi	%a0, %s0, 0
	addi	%v0, %s2, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f4
	fadd	%f2, %f0, %f5
	addi	%a0, %s3, 0
	addi	%v0, %s2, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	jal	calc_dirvec.3083
	addi	%v0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.48278
	addi	%v1, %v1, -5
	j	bgti_cont.48279
bgti_else.48278:
bgti_cont.48279:
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3091
bgti_else.48277:
	add	%ra, %zero, %s1
	jr	%ra
bgti_else.48274:
	add	%ra, %zero, %s1
	jr	%ra
calc_dirvec_rows.3096:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %a0
	fsw	%f7, 0(%sp)
	fsw	%f6, 1(%sp)
	add	%s7, %zero, %ra
	addi	%k0, %zero, 0
	blti	%s4, 0, bgti_else.48340
	itof	%f0, %s4
	flw	%f6, 460(%zero)
	fmul	%f0, %f0, %f6
	flw	%f7, 438(%zero)
	fsub	%f3, %f0, %f7
	addi	%t7, %zero, 4
	itof	%f0, %t7
	fmul	%f0, %f0, %f6
	fsub	%f2, %f0, %f7
	flw	%f29, 470(%zero)
	addi	%a0, %s6, 0
	addi	%v1, %s5, 0
	addi	%v0, %k0, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	addi	%sp, %sp, 2
	jal	calc_dirvec.3083
	addi	%sp, %sp, -2
	itof	%f0, %t7
	fmul	%f1, %f0, %f6
	flw	%f0, 441(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s6, 2
	addi	%v1, %s5, 0
	addi	%v0, %k0, 0
	fmov	%f1, %f29
	fmov	%f0, %f29
	addi	%sp, %sp, 2
	jal	calc_dirvec.3083
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3
	addi	%v1, %s5, 1
	blti	%v1, 5, bgti_else.48341
	addi	%v1, %v1, -5
	j	bgti_cont.48342
bgti_else.48341:
bgti_cont.48342:
	addi	%a0, %s6, 0
	fmov	%f0, %f3
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%t8, %s4, -1
	addi	%s4, %s5, 2
	blti	%s4, 5, bgti_else.48343
	addi	%s4, %s4, -5
	j	bgti_cont.48344
bgti_else.48343:
bgti_cont.48344:
	addi	%s5, %s6, 4
	blti	%t8, 0, bgti_else.48345
	itof	%f0, %t8
	fmul	%f0, %f0, %f6
	fsub	%f0, %f0, %f7
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	addi	%v0, %t7, 0
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%v0, %t8, -1
	addi	%v1, %s4, 2
	blti	%v1, 5, bgti_else.48346
	addi	%v1, %v1, -5
	j	bgti_cont.48347
bgti_else.48346:
bgti_cont.48347:
	addi	%a0, %s5, 4
	flw	%f7, 0(%sp)
	flw	%f6, 1(%sp)
	add	%ra, %zero, %s7
	j	calc_dirvec_rows.3096
bgti_else.48345:
	flw	%f7, 0(%sp)
	flw	%f6, 1(%sp)
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48340:
	add	%ra, %zero, %s7
	jr	%ra
create_dirvec_elements.3102:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.48384
	addi	%k0, %zero, 3
	flw	%f1, 470(%zero)
	addi	%v0, %k0, 0
	fmov	%f0, %f1
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
	blti	%s0, 0, bgti_else.48385
	addi	%v0, %k0, 0
	fmov	%f0, %f1
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
	blti	%s0, 0, bgti_else.48386
	addi	%v0, %k0, 0
	fmov	%f0, %f1
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
	blti	%s0, 0, bgti_else.48387
	addi	%v0, %k0, 0
	fmov	%f0, %f1
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
bgti_else.48387:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.48386:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.48385:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.48384:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3105:
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra
	blti	%s2, 0, bgti_else.48418
	addi	%s6, %zero, 120
	addi	%s4, %zero, 3
	flw	%f16, 470(%zero)
	addi	%v0, %s4, 0
	fmov	%f0, %f16
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
	fmov	%f0, %f16
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
	fmov	%f0, %f16
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
	fmov	%f0, %f16
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
	blti	%s2, 0, bgti_else.48419
	addi	%v0, %s4, 0
	fmov	%f0, %f16
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
	fmov	%f0, %f16
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
	fmov	%f0, %f16
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
bgti_else.48419:
	add	%ra, %zero, %s3
	jr	%ra
bgti_else.48418:
	add	%ra, %zero, %s3
	jr	%ra
init_dirvec_constants.3107:
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1
	add	%s4, %zero, %ra
	blti	%s3, 0, bgti_else.48537
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s5, %a0, -1
	addi	%v1, %s5, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.48538
	add	%at, %s2, %s3
	lw	%a1, 0(%at)
	blti	%s5, 0, bgti_else.48539
	lw	%a2, 12(%s5)
	lw	%a3, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.48541
	beqi	%a0, 2, bnei_else.48543
	addi	%v0, %zero, 5
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f19, 0(%k0)
	flw	%f20, 1(%k0)
	flw	%f22, 2(%k0)
	fmul	%f16, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f17, %f16, %f0
	fmul	%f16, %f20, %f20
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f22, %f22
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48545
	fmul	%f17, %f20, %f22
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f0, %f16
	fmul	%f16, %f22, %f19
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f19, %f20
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.48546
bnei_else.48545:
bnei_cont.48546:
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f16, %f19, %f16
	fneg	%f23, %f16
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f20, %f16
	fneg	%f21, %f16
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f22, %f16
	fneg	%f18, %f16
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48547
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f17, %f22, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f20, %f16
	fadd	%f16, %f17, %f16
	flw	%f2, 473(%zero)
	fmul	%f16, %f16, %f2
	fsub	%f16, %f23, %f16
	fsw	%f16, 1(%v0)
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f22, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f21, %f16
	fsw	%f16, 2(%v0)
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f20, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f18, %f16
	fsw	%f16, 3(%v0)
	j	bnei_cont.48548
bnei_else.48547:
	fsw	%f23, 1(%v0)
	fsw	%f21, 2(%v0)
	fsw	%f18, 3(%v0)
bnei_cont.48548:
	fbne	%f0, %f1, fbeq_else.48549
	addi	%a0, %zero, 1
	j	fbeq_cont.48550
fbeq_else.48549:
	addi	%a0, %zero, 0
fbeq_cont.48550:
	beqi	%a0, 0, bnei_else.48551
	j	bnei_cont.48552
bnei_else.48551:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.48552:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
	j	bnei_cont.48542
bnei_else.48543:
	addi	%v0, %zero, 4
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f17, %f16, %f0
	flw	%f16, 1(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	flw	%f16, 2(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f16, %f17, %f0
	fblt	%f1, %f16, fbgt_else.48553
	addi	%a0, %zero, 0
	j	fbgt_cont.48554
fbgt_else.48553:
	addi	%a0, %zero, 1
fbgt_cont.48554:
	beqi	%a0, 0, bnei_else.48555
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 0(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.48556
bnei_else.48555:
	fsw	%f1, 0(%v0)
bnei_cont.48556:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
bnei_cont.48544:
	j	bnei_cont.48542
bnei_else.48541:
	addi	%v0, %zero, 6
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	fbne	%f16, %f1, fbeq_else.48557
	addi	%a0, %zero, 1
	j	fbeq_cont.48558
fbeq_else.48557:
	addi	%a0, %zero, 0
fbeq_cont.48558:
	beqi	%a0, 0, bnei_else.48559
	fsw	%f1, 1(%v0)
	j	bnei_cont.48560
bnei_else.48559:
	lw	%ra, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48561
	addi	%a0, %zero, 0
	j	fbgt_cont.48562
fbgt_else.48561:
	addi	%a0, %zero, 1
fbgt_cont.48562:
	beqi	%ra, 0, bnei_else.48563
	beqi	%a0, 0, bnei_else.48565
	addi	%a0, %zero, 0
	j	bnei_cont.48564
bnei_else.48565:
	addi	%a0, %zero, 1
bnei_cont.48566:
	j	bnei_cont.48564
bnei_else.48563:
bnei_cont.48564:
	lw	%ra, 4(%a2)
	flw	%f0, 0(%ra)
	beqi	%a0, 0, bnei_else.48567
	j	bnei_cont.48568
bnei_else.48567:
	fneg	%f0, %f0
bnei_cont.48568:
	fsw	%f0, 0(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 1(%v0)
bnei_cont.48560:
	flw	%f16, 1(%k0)
	fbne	%f16, %f1, fbeq_else.48569
	addi	%a0, %zero, 1
	j	fbeq_cont.48570
fbeq_else.48569:
	addi	%a0, %zero, 0
fbeq_cont.48570:
	beqi	%a0, 0, bnei_else.48571
	fsw	%f1, 3(%v0)
	j	bnei_cont.48572
bnei_else.48571:
	lw	%ra, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48573
	addi	%a0, %zero, 0
	j	fbgt_cont.48574
fbgt_else.48573:
	addi	%a0, %zero, 1
fbgt_cont.48574:
	beqi	%ra, 0, bnei_else.48575
	beqi	%a0, 0, bnei_else.48577
	addi	%a0, %zero, 0
	j	bnei_cont.48576
bnei_else.48577:
	addi	%a0, %zero, 1
bnei_cont.48578:
	j	bnei_cont.48576
bnei_else.48575:
bnei_cont.48576:
	lw	%ra, 4(%a2)
	flw	%f0, 1(%ra)
	beqi	%a0, 0, bnei_else.48579
	j	bnei_cont.48580
bnei_else.48579:
	fneg	%f0, %f0
bnei_cont.48580:
	fsw	%f0, 2(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 3(%v0)
bnei_cont.48572:
	flw	%f16, 2(%k0)
	fbne	%f16, %f1, fbeq_else.48581
	addi	%a0, %zero, 1
	j	fbeq_cont.48582
fbeq_else.48581:
	addi	%a0, %zero, 0
fbeq_cont.48582:
	beqi	%a0, 0, bnei_else.48583
	fsw	%f1, 5(%v0)
	j	bnei_cont.48584
bnei_else.48583:
	lw	%k0, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48585
	addi	%a0, %zero, 0
	j	fbgt_cont.48586
fbgt_else.48585:
	addi	%a0, %zero, 1
fbgt_cont.48586:
	beqi	%k0, 0, bnei_else.48587
	beqi	%a0, 0, bnei_else.48589
	addi	%a0, %zero, 0
	j	bnei_cont.48588
bnei_else.48589:
	addi	%a0, %zero, 1
bnei_cont.48590:
	j	bnei_cont.48588
bnei_else.48587:
bnei_cont.48588:
	lw	%a2, 4(%a2)
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.48591
	j	bnei_cont.48592
bnei_else.48591:
	fneg	%f0, %f0
bnei_cont.48592:
	fsw	%f0, 4(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 5(%v0)
bnei_cont.48584:
	add	%at, %a3, %s5
	sw	%v0, 0(%at)
bnei_cont.48542:
	addi	%v1, %s5, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.48540
bgti_else.48539:
bgti_cont.48540:
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.48593
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	addi	%v1, %s5, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s3, %s3, -1
	blti	%s3, 0, bgti_else.48594
	add	%at, %s2, %s3
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2892
	addi	%v1, %s3, -1
	add	%ra, %zero, %s4
	addi	%v0, %s2, 0
	j	init_dirvec_constants.3107
bgti_else.48594:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.48593:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.48538:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.48537:
	add	%ra, %zero, %s4
	jr	%ra
init_vecset_constants.3110:
	add	%s6, %zero, %v0
	add	%s7, %zero, %ra
	blti	%s6, 0, bgti_else.48812
	lw	%s2, 179(%s6)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s2)
	lw	%a0, 0(%zero)
	addi	%t7, %a0, -1
	blti	%t7, 0, bgti_else.48813
	lw	%a2, 12(%t7)
	lw	%a3, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.48815
	beqi	%a0, 2, bnei_else.48817
	addi	%v0, %zero, 5
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f19, 0(%k0)
	flw	%f20, 1(%k0)
	flw	%f22, 2(%k0)
	fmul	%f16, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f17, %f16, %f0
	fmul	%f16, %f20, %f20
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f22, %f22
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48819
	fmul	%f17, %f20, %f22
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f0, %f16
	fmul	%f16, %f22, %f19
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	fmul	%f16, %f19, %f20
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f17, %f0
	j	bnei_cont.48820
bnei_else.48819:
bnei_cont.48820:
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f16, %f19, %f16
	fneg	%f23, %f16
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f20, %f16
	fneg	%f21, %f16
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f22, %f16
	fneg	%f18, %f16
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.48821
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f17, %f22, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f20, %f16
	fadd	%f16, %f17, %f16
	flw	%f2, 473(%zero)
	fmul	%f16, %f16, %f2
	fsub	%f16, %f23, %f16
	fsw	%f16, 1(%v0)
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f22, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f21, %f16
	fsw	%f16, 2(%v0)
	lw	%a0, 9(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f20, %f16
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f17, %f16
	fmul	%f16, %f16, %f2
	fsub	%f16, %f18, %f16
	fsw	%f16, 3(%v0)
	j	bnei_cont.48822
bnei_else.48821:
	fsw	%f23, 1(%v0)
	fsw	%f21, 2(%v0)
	fsw	%f18, 3(%v0)
bnei_cont.48822:
	fbne	%f0, %f1, fbeq_else.48823
	addi	%a0, %zero, 1
	j	fbeq_cont.48824
fbeq_else.48823:
	addi	%a0, %zero, 0
fbeq_cont.48824:
	beqi	%a0, 0, bnei_else.48825
	j	bnei_cont.48826
bnei_else.48825:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.48826:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
	j	bnei_cont.48816
bnei_else.48817:
	addi	%v0, %zero, 4
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f17, %f16, %f0
	flw	%f16, 1(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f17, %f17, %f0
	flw	%f16, 2(%k0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f16, %f17, %f0
	fblt	%f1, %f16, fbgt_else.48827
	addi	%a0, %zero, 0
	j	fbgt_cont.48828
fbgt_else.48827:
	addi	%a0, %zero, 1
fbgt_cont.48828:
	beqi	%a0, 0, bnei_else.48829
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 0(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f16
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.48830
bnei_else.48829:
	fsw	%f1, 0(%v0)
bnei_cont.48830:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48818:
	j	bnei_cont.48816
bnei_else.48815:
	addi	%v0, %zero, 6
	flw	%f1, 470(%zero)
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	fbne	%f16, %f1, fbeq_else.48831
	addi	%a0, %zero, 1
	j	fbeq_cont.48832
fbeq_else.48831:
	addi	%a0, %zero, 0
fbeq_cont.48832:
	beqi	%a0, 0, bnei_else.48833
	fsw	%f1, 1(%v0)
	j	bnei_cont.48834
bnei_else.48833:
	lw	%ra, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48835
	addi	%a0, %zero, 0
	j	fbgt_cont.48836
fbgt_else.48835:
	addi	%a0, %zero, 1
fbgt_cont.48836:
	beqi	%ra, 0, bnei_else.48837
	beqi	%a0, 0, bnei_else.48839
	addi	%a0, %zero, 0
	j	bnei_cont.48838
bnei_else.48839:
	addi	%a0, %zero, 1
bnei_cont.48840:
	j	bnei_cont.48838
bnei_else.48837:
bnei_cont.48838:
	lw	%ra, 4(%a2)
	flw	%f0, 0(%ra)
	beqi	%a0, 0, bnei_else.48841
	j	bnei_cont.48842
bnei_else.48841:
	fneg	%f0, %f0
bnei_cont.48842:
	fsw	%f0, 0(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 1(%v0)
bnei_cont.48834:
	flw	%f16, 1(%k0)
	fbne	%f16, %f1, fbeq_else.48843
	addi	%a0, %zero, 1
	j	fbeq_cont.48844
fbeq_else.48843:
	addi	%a0, %zero, 0
fbeq_cont.48844:
	beqi	%a0, 0, bnei_else.48845
	fsw	%f1, 3(%v0)
	j	bnei_cont.48846
bnei_else.48845:
	lw	%ra, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48847
	addi	%a0, %zero, 0
	j	fbgt_cont.48848
fbgt_else.48847:
	addi	%a0, %zero, 1
fbgt_cont.48848:
	beqi	%ra, 0, bnei_else.48849
	beqi	%a0, 0, bnei_else.48851
	addi	%a0, %zero, 0
	j	bnei_cont.48850
bnei_else.48851:
	addi	%a0, %zero, 1
bnei_cont.48852:
	j	bnei_cont.48850
bnei_else.48849:
bnei_cont.48850:
	lw	%ra, 4(%a2)
	flw	%f0, 1(%ra)
	beqi	%a0, 0, bnei_else.48853
	j	bnei_cont.48854
bnei_else.48853:
	fneg	%f0, %f0
bnei_cont.48854:
	fsw	%f0, 2(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 3(%v0)
bnei_cont.48846:
	flw	%f16, 2(%k0)
	fbne	%f16, %f1, fbeq_else.48855
	addi	%a0, %zero, 1
	j	fbeq_cont.48856
fbeq_else.48855:
	addi	%a0, %zero, 0
fbeq_cont.48856:
	beqi	%a0, 0, bnei_else.48857
	fsw	%f1, 5(%v0)
	j	bnei_cont.48858
bnei_else.48857:
	lw	%k0, 6(%a2)
	fblt	%f16, %f1, fbgt_else.48859
	addi	%a0, %zero, 0
	j	fbgt_cont.48860
fbgt_else.48859:
	addi	%a0, %zero, 1
fbgt_cont.48860:
	beqi	%k0, 0, bnei_else.48861
	beqi	%a0, 0, bnei_else.48863
	addi	%a0, %zero, 0
	j	bnei_cont.48862
bnei_else.48863:
	addi	%a0, %zero, 1
bnei_cont.48864:
	j	bnei_cont.48862
bnei_else.48861:
bnei_cont.48862:
	lw	%a2, 4(%a2)
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.48865
	j	bnei_cont.48866
bnei_else.48865:
	fneg	%f0, %f0
bnei_cont.48866:
	fsw	%f0, 4(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 5(%v0)
bnei_cont.48858:
	add	%at, %a3, %t7
	sw	%v0, 0(%at)
bnei_cont.48816:
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.48814
bgti_else.48813:
bgti_cont.48814:
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
	blti	%s6, 0, bgti_else.48867
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
	blti	%s6, 0, bgti_else.48868
	lw	%s2, 179(%s6)
	lw	%v0, 119(%s2)
	jal	setup_dirvec_constants.2892
	addi	%v1, %t9, 0
	addi	%v0, %s2, 0
	jal	init_dirvec_constants.3107
	addi	%s6, %s6, -1
	blti	%s6, 0, bgti_else.48869
	lw	%v0, 179(%s6)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3107
	addi	%v0, %s6, -1
	add	%ra, %zero, %s7
	j	init_vecset_constants.3110
bgti_else.48869:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48868:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48867:
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.48812:
	add	%ra, %zero, %s7
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%t9, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	flw	%f0, 470(%zero)
	addi	%v1, %zero, 1
	addi	%v0, %zero, 0
	jal	min_caml_create_float_extarray
	addi	%a3, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	addi	%a1, %zero, 0
	addi	Tu32928, %zero, 0
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a1, 4(%zero)
	sw	%a1, 3(%zero)
	sw	%a1, 2(%zero)
	sw	%a1, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72
	flw	%f0, 470(%zero)
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 75
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 78
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	flw	%f0, 451(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %t9, 0
	jal	min_caml_create_float_extarray
	addi	%a2, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 135
	flw	%f0, 470(%zero)
	addi	%v0, %t9, 0
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	flw	%f0, 445(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %t9, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 138
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 142
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 145
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 148
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 151
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 156
	addi	%v1, %zero, 0
	addi	%v0, %zero, 2
	jal	min_caml_create_extarray
	addi	%v1, %zero, 158
	flw	%f0, 470(%zero)
	addi	%v0, %t9, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 159
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 162
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 165
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 168
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 171
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 174
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 177
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 0
	jal	min_caml_create_float_extarray
	addi	%a2, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	sw	%v0, 178(%zero)
	sw	%a2, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray
	addi	%v1, %zero, 184
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 184
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	jal	min_caml_create_float_extarray
	addi	%a2, %v0, 0
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	sw	%v0, 248(%zero)
	sw	%a2, 247(%zero)
	addi	%v1, %zero, 249
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 0
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
	flw	%f0, 470(%zero)
	flw	Tu32954, 470(%zero)
	sw	%a0, 252(%zero)
	addi	%a0, %zero, 0
	addi	Tu32952, %zero, 0
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	jal	min_caml_create_extarray
	addi	%a0, %zero, 434
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
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
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a2)
	addi	%a0, %zero, 4
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
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
	addi	%a0, %a0, -2
	sw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.51414
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%s3, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%k0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s2, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a2, 1(%ra)
	sw	%s3, 0(%ra)
	add	%a0, %zero, %ra
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%v1, %a2, -1
	addi	%v0, %a1, 0
	addi	%sp, %sp, 2
	jal	init_line_elements.3073
	addi	%sp, %sp, -2
	j	bgti_cont.51415
bgti_else.51414:
	add	%v0, %zero, %a1
bgti_cont.51415:
	sw	%v0, 2(%sp)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
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
	lw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.51416
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%s3, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s2, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a2, 1(%ra)
	sw	%s3, 0(%ra)
	add	%a0, %zero, %ra
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%v1, %a2, -1
	addi	%v0, %a1, 0
	addi	%sp, %sp, 3
	jal	init_line_elements.3073
	addi	%sp, %sp, -3
	j	bgti_cont.51417
bgti_else.51416:
	add	%v0, %zero, %a1
bgti_cont.51417:
	sw	%v0, 3(%sp)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
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
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0
	lw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.51418
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a3)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a3)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a3)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%a3)
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s1, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s1)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s2, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s2)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s3, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a0)
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
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
	add	%a0, %zero, %ra
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%v1, %a2, -1
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4
	jal	init_line_elements.3073
	addi	%sp, %sp, -4
	j	bgti_cont.51419
bgti_else.51418:
	add	%v0, %zero, %a1
bgti_cont.51419:
	sw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 72(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 73(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 74(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	flw	%f19, 469(%zero)
	fmul	%f20, %f0, %f19
	flw	%f18, 494(%zero)
	fabs	%f17, %f20
	flw	%f2, 493(%zero)
	fblt	%f17, %f2, fbgt_else.51420
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.51421
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	j	fbgt_cont.51421
fbgt_else.51438:
fbgt_cont.51439:
	j	fbgt_cont.51421
fbgt_else.51436:
fbgt_cont.51437:
	j	fbgt_cont.51421
fbgt_else.51434:
fbgt_cont.51435:
	j	fbgt_cont.51421
fbgt_else.51432:
fbgt_cont.51433:
	j	fbgt_cont.51421
fbgt_else.51430:
fbgt_cont.51431:
	j	fbgt_cont.51421
fbgt_else.51428:
fbgt_cont.51429:
	j	fbgt_cont.51421
fbgt_else.51426:
fbgt_cont.51427:
	j	fbgt_cont.51421
fbgt_else.51424:
fbgt_cont.51425:
	j	fbgt_cont.51421
fbgt_else.51422:
fbgt_cont.51423:
	j	fbgt_cont.51421
fbgt_else.51420:
	fmov	%f0, %f2
fbgt_cont.51421:
	fblt	%f17, %f2, fbgt_else.51440
	fblt	%f17, %f0, fbgt_else.51442
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51441
	fblt	%f17, %f1, fbgt_else.51446
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f17, %f0
	j	fbgt_cont.51441
fbgt_else.51446:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f17, %f0
fbgt_cont.51447:
	j	fbgt_cont.51441
fbgt_else.51444:
fbgt_cont.51445:
	j	fbgt_cont.51441
fbgt_else.51442:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51441
	fblt	%f17, %f1, fbgt_else.51450
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f17, %f0
	j	fbgt_cont.51441
fbgt_else.51450:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f17, %f0
fbgt_cont.51451:
	j	fbgt_cont.51441
fbgt_else.51448:
fbgt_cont.51449:
fbgt_cont.51443:
	j	fbgt_cont.51441
fbgt_else.51440:
fbgt_cont.51441:
	fblt	%f17, %f18, fbgt_else.51452
	addi	%a0, %zero, 0
	j	fbgt_cont.51453
fbgt_else.51452:
	addi	%a0, %zero, 1
fbgt_cont.51453:
	fblt	%f17, %f18, fbgt_else.51454
	fsub	%f17, %f17, %f18
	j	fbgt_cont.51455
fbgt_else.51454:
fbgt_cont.51455:
	flw	%f21, 479(%zero)
	fblt	%f17, %f21, fbgt_else.51456
	beqi	%a0, 0, bnei_else.51458
	addi	%a0, %zero, 0
	j	fbgt_cont.51457
bnei_else.51458:
	addi	%a0, %zero, 1
bnei_cont.51459:
	j	fbgt_cont.51457
fbgt_else.51456:
fbgt_cont.51457:
	fblt	%f17, %f21, fbgt_else.51460
	fsub	%f17, %f18, %f17
	j	fbgt_cont.51461
fbgt_else.51460:
fbgt_cont.51461:
	flw	%f22, 478(%zero)
	fblt	%f22, %f17, fbgt_else.51462
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.51463
fbgt_else.51462:
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
fbgt_cont.51463:
	beqi	%a0, 0, bnei_else.51464
	j	bnei_cont.51465
bnei_else.51464:
	fneg	%f17, %f17
bnei_cont.51465:
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	fabs	%f20, %f20
	fblt	%f20, %f2, fbgt_else.51466
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.51467
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	j	fbgt_cont.51467
fbgt_else.51484:
fbgt_cont.51485:
	j	fbgt_cont.51467
fbgt_else.51482:
fbgt_cont.51483:
	j	fbgt_cont.51467
fbgt_else.51480:
fbgt_cont.51481:
	j	fbgt_cont.51467
fbgt_else.51478:
fbgt_cont.51479:
	j	fbgt_cont.51467
fbgt_else.51476:
fbgt_cont.51477:
	j	fbgt_cont.51467
fbgt_else.51474:
fbgt_cont.51475:
	j	fbgt_cont.51467
fbgt_else.51472:
fbgt_cont.51473:
	j	fbgt_cont.51467
fbgt_else.51470:
fbgt_cont.51471:
	j	fbgt_cont.51467
fbgt_else.51468:
fbgt_cont.51469:
	j	fbgt_cont.51467
fbgt_else.51466:
	fmov	%f0, %f2
fbgt_cont.51467:
	fblt	%f20, %f2, fbgt_else.51486
	fblt	%f20, %f0, fbgt_else.51488
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51487
	fblt	%f20, %f1, fbgt_else.51492
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f20, %f0
	j	fbgt_cont.51487
fbgt_else.51492:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f20, %f0
fbgt_cont.51493:
	j	fbgt_cont.51487
fbgt_else.51490:
fbgt_cont.51491:
	j	fbgt_cont.51487
fbgt_else.51488:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51487
	fblt	%f20, %f1, fbgt_else.51496
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f20, %f0
	j	fbgt_cont.51487
fbgt_else.51496:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f20, %f0
fbgt_cont.51497:
	j	fbgt_cont.51487
fbgt_else.51494:
fbgt_cont.51495:
fbgt_cont.51489:
	j	fbgt_cont.51487
fbgt_else.51486:
fbgt_cont.51487:
	fblt	%f20, %f18, fbgt_else.51498
	beqi	%at, 0, bnei_else.51500
	addi	%a0, %zero, 0
	j	fbgt_cont.51499
bnei_else.51500:
	addi	%a0, %zero, 1
bnei_cont.51501:
	j	fbgt_cont.51499
fbgt_else.51498:
	add	%a0, %zero, %at
fbgt_cont.51499:
	fblt	%f20, %f18, fbgt_else.51502
	fsub	%f20, %f20, %f18
	j	fbgt_cont.51503
fbgt_else.51502:
fbgt_cont.51503:
	fblt	%f20, %f21, fbgt_else.51504
	fsub	%f20, %f18, %f20
	j	fbgt_cont.51505
fbgt_else.51504:
fbgt_cont.51505:
	fblt	%f22, %f20, fbgt_else.51506
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
	j	fbgt_cont.51507
fbgt_else.51506:
	fsub	%f0, %f21, %f20
	fmul	%f20, %f0, %f0
	fmul	%f16, %f20, %f20
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f20, %f1, %f0
fbgt_cont.51507:
	beqi	%a0, 0, bnei_else.51508
	j	bnei_cont.51509
bnei_else.51508:
	fneg	%f20, %f20
bnei_cont.51509:
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fmul	%f24, %f0, %f19
	fabs	%f23, %f24
	fblt	%f23, %f2, fbgt_else.51510
	flw	%f0, 492(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 491(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 490(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 489(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 488(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 487(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 486(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 485(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f0, 484(%zero)
	fblt	%f23, %f0, fbgt_cont.51511
	flw	%f1, 483(%zero)
	fmov	%f0, %f23
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	j	fbgt_cont.51511
fbgt_else.51528:
fbgt_cont.51529:
	j	fbgt_cont.51511
fbgt_else.51526:
fbgt_cont.51527:
	j	fbgt_cont.51511
fbgt_else.51524:
fbgt_cont.51525:
	j	fbgt_cont.51511
fbgt_else.51522:
fbgt_cont.51523:
	j	fbgt_cont.51511
fbgt_else.51520:
fbgt_cont.51521:
	j	fbgt_cont.51511
fbgt_else.51518:
fbgt_cont.51519:
	j	fbgt_cont.51511
fbgt_else.51516:
fbgt_cont.51517:
	j	fbgt_cont.51511
fbgt_else.51514:
fbgt_cont.51515:
	j	fbgt_cont.51511
fbgt_else.51512:
fbgt_cont.51513:
	j	fbgt_cont.51511
fbgt_else.51510:
	fmov	%f0, %f2
fbgt_cont.51511:
	fblt	%f23, %f2, fbgt_else.51530
	fblt	%f23, %f0, fbgt_else.51532
	fsub	%f23, %f23, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.51531
	fblt	%f23, %f1, fbgt_else.51536
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f23, %f0
	j	fbgt_cont.51531
fbgt_else.51536:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f23, %f0
fbgt_cont.51537:
	j	fbgt_cont.51531
fbgt_else.51534:
fbgt_cont.51535:
	j	fbgt_cont.51531
fbgt_else.51532:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f23, %f2, fbgt_cont.51531
	fblt	%f23, %f1, fbgt_else.51540
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f23, %f0
	j	fbgt_cont.51531
fbgt_else.51540:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f23
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f23, %f0
fbgt_cont.51541:
	j	fbgt_cont.51531
fbgt_else.51538:
fbgt_cont.51539:
fbgt_cont.51533:
	j	fbgt_cont.51531
fbgt_else.51530:
fbgt_cont.51531:
	fblt	%f23, %f18, fbgt_else.51542
	addi	%a0, %zero, 0
	j	fbgt_cont.51543
fbgt_else.51542:
	addi	%a0, %zero, 1
fbgt_cont.51543:
	fblt	%f23, %f18, fbgt_else.51544
	fsub	%f23, %f23, %f18
	j	fbgt_cont.51545
fbgt_else.51544:
fbgt_cont.51545:
	fblt	%f23, %f21, fbgt_else.51546
	beqi	%a0, 0, bnei_else.51548
	addi	%a0, %zero, 0
	j	fbgt_cont.51547
bnei_else.51548:
	addi	%a0, %zero, 1
bnei_cont.51549:
	j	fbgt_cont.51547
fbgt_else.51546:
fbgt_cont.51547:
	fblt	%f23, %f21, fbgt_else.51550
	fsub	%f23, %f18, %f23
	j	fbgt_cont.51551
fbgt_else.51550:
fbgt_cont.51551:
	fblt	%f22, %f23, fbgt_else.51552
	fmul	%f23, %f23, %f23
	fmul	%f16, %f23, %f23
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.51553
fbgt_else.51552:
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
fbgt_cont.51553:
	beqi	%a0, 0, bnei_else.51554
	j	bnei_cont.51555
bnei_else.51554:
	fneg	%f23, %f23
bnei_cont.51555:
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	fabs	%f24, %f24
	fblt	%f24, %f2, fbgt_else.51556
	flw	%f0, 492(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 491(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 490(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 489(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 488(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 487(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 486(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 485(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f0, 484(%zero)
	fblt	%f24, %f0, fbgt_cont.51557
	flw	%f1, 483(%zero)
	fmov	%f0, %f24
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	j	fbgt_cont.51557
fbgt_else.51574:
fbgt_cont.51575:
	j	fbgt_cont.51557
fbgt_else.51572:
fbgt_cont.51573:
	j	fbgt_cont.51557
fbgt_else.51570:
fbgt_cont.51571:
	j	fbgt_cont.51557
fbgt_else.51568:
fbgt_cont.51569:
	j	fbgt_cont.51557
fbgt_else.51566:
fbgt_cont.51567:
	j	fbgt_cont.51557
fbgt_else.51564:
fbgt_cont.51565:
	j	fbgt_cont.51557
fbgt_else.51562:
fbgt_cont.51563:
	j	fbgt_cont.51557
fbgt_else.51560:
fbgt_cont.51561:
	j	fbgt_cont.51557
fbgt_else.51558:
fbgt_cont.51559:
	j	fbgt_cont.51557
fbgt_else.51556:
	fmov	%f0, %f2
fbgt_cont.51557:
	fblt	%f24, %f2, fbgt_else.51576
	fblt	%f24, %f0, fbgt_else.51578
	fsub	%f24, %f24, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.51577
	fblt	%f24, %f1, fbgt_else.51582
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f24, %f0
	j	fbgt_cont.51577
fbgt_else.51582:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f24, %f0
fbgt_cont.51583:
	j	fbgt_cont.51577
fbgt_else.51580:
fbgt_cont.51581:
	j	fbgt_cont.51577
fbgt_else.51578:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f24, %f2, fbgt_cont.51577
	fblt	%f24, %f1, fbgt_else.51586
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f24, %f0
	j	fbgt_cont.51577
fbgt_else.51586:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f24
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	fmov	%f24, %f0
fbgt_cont.51587:
	j	fbgt_cont.51577
fbgt_else.51584:
fbgt_cont.51585:
fbgt_cont.51579:
	j	fbgt_cont.51577
fbgt_else.51576:
fbgt_cont.51577:
	fblt	%f24, %f18, fbgt_else.51588
	beqi	%at, 0, bnei_else.51590
	addi	%a0, %zero, 0
	j	fbgt_cont.51589
bnei_else.51590:
	addi	%a0, %zero, 1
bnei_cont.51591:
	j	fbgt_cont.51589
fbgt_else.51588:
	add	%a0, %zero, %at
fbgt_cont.51589:
	fblt	%f24, %f18, fbgt_else.51592
	fsub	%f24, %f24, %f18
	j	fbgt_cont.51593
fbgt_else.51592:
fbgt_cont.51593:
	fblt	%f24, %f21, fbgt_else.51594
	fsub	%f24, %f18, %f24
	j	fbgt_cont.51595
fbgt_else.51594:
fbgt_cont.51595:
	fblt	%f22, %f24, fbgt_else.51596
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
	j	fbgt_cont.51597
fbgt_else.51596:
	fsub	%f0, %f21, %f24
	fmul	%f24, %f0, %f0
	fmul	%f16, %f24, %f24
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51597:
	beqi	%a0, 0, bnei_else.51598
	j	bnei_cont.51599
bnei_else.51598:
	fneg	%f0, %f0
bnei_cont.51599:
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
	flw	%f1, 470(%zero)
	flw	Tu31.5444.11195.12335, 470(%zero)
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
	fsw	%f0, 5(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 75(%zero)
	flw	%f1, 73(%zero)
	flw	%f0, 172(%zero)
	fsw	%f0, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 76(%zero)
	flw	%f1, 74(%zero)
	flw	%f0, 173(%zero)
	fsw	%f0, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 77(%zero)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	fmul	%f20, %f0, %f19
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.51600
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.51601
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	j	fbgt_cont.51601
fbgt_else.51618:
fbgt_cont.51619:
	j	fbgt_cont.51601
fbgt_else.51616:
fbgt_cont.51617:
	j	fbgt_cont.51601
fbgt_else.51614:
fbgt_cont.51615:
	j	fbgt_cont.51601
fbgt_else.51612:
fbgt_cont.51613:
	j	fbgt_cont.51601
fbgt_else.51610:
fbgt_cont.51611:
	j	fbgt_cont.51601
fbgt_else.51608:
fbgt_cont.51609:
	j	fbgt_cont.51601
fbgt_else.51606:
fbgt_cont.51607:
	j	fbgt_cont.51601
fbgt_else.51604:
fbgt_cont.51605:
	j	fbgt_cont.51601
fbgt_else.51602:
fbgt_cont.51603:
	j	fbgt_cont.51601
fbgt_else.51600:
	fmov	%f0, %f2
fbgt_cont.51601:
	fblt	%f17, %f2, fbgt_else.51620
	fblt	%f17, %f0, fbgt_else.51622
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51621
	fblt	%f17, %f1, fbgt_else.51626
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
	j	fbgt_cont.51621
fbgt_else.51626:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
fbgt_cont.51627:
	j	fbgt_cont.51621
fbgt_else.51624:
fbgt_cont.51625:
	j	fbgt_cont.51621
fbgt_else.51622:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51621
	fblt	%f17, %f1, fbgt_else.51630
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
	j	fbgt_cont.51621
fbgt_else.51630:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
fbgt_cont.51631:
	j	fbgt_cont.51621
fbgt_else.51628:
fbgt_cont.51629:
fbgt_cont.51623:
	j	fbgt_cont.51621
fbgt_else.51620:
fbgt_cont.51621:
	fblt	%f17, %f18, fbgt_else.51632
	beqi	%at, 0, bnei_else.51634
	addi	%a0, %zero, 0
	j	fbgt_cont.51633
bnei_else.51634:
	addi	%a0, %zero, 1
bnei_cont.51635:
	j	fbgt_cont.51633
fbgt_else.51632:
	add	%a0, %zero, %at
fbgt_cont.51633:
	fblt	%f17, %f18, fbgt_else.51636
	fsub	%f17, %f17, %f18
	j	fbgt_cont.51637
fbgt_else.51636:
fbgt_cont.51637:
	fblt	%f17, %f21, fbgt_else.51638
	fsub	%f17, %f18, %f17
	j	fbgt_cont.51639
fbgt_else.51638:
fbgt_cont.51639:
	fblt	%f22, %f17, fbgt_else.51640
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
	j	fbgt_cont.51641
fbgt_else.51640:
	fsub	%f0, %f21, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51641:
	beqi	%a0, 0, bnei_else.51642
	j	bnei_cont.51643
bnei_else.51642:
	fneg	%f0, %f0
bnei_cont.51643:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	fmul	%f19, %f0, %f19
	fabs	%f17, %f20
	fblt	%f17, %f2, fbgt_else.51644
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.51645
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	j	fbgt_cont.51645
fbgt_else.51662:
fbgt_cont.51663:
	j	fbgt_cont.51645
fbgt_else.51660:
fbgt_cont.51661:
	j	fbgt_cont.51645
fbgt_else.51658:
fbgt_cont.51659:
	j	fbgt_cont.51645
fbgt_else.51656:
fbgt_cont.51657:
	j	fbgt_cont.51645
fbgt_else.51654:
fbgt_cont.51655:
	j	fbgt_cont.51645
fbgt_else.51652:
fbgt_cont.51653:
	j	fbgt_cont.51645
fbgt_else.51650:
fbgt_cont.51651:
	j	fbgt_cont.51645
fbgt_else.51648:
fbgt_cont.51649:
	j	fbgt_cont.51645
fbgt_else.51646:
fbgt_cont.51647:
	j	fbgt_cont.51645
fbgt_else.51644:
	fmov	%f0, %f2
fbgt_cont.51645:
	fblt	%f17, %f2, fbgt_else.51664
	fblt	%f17, %f0, fbgt_else.51666
	fsub	%f17, %f17, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51665
	fblt	%f17, %f1, fbgt_else.51670
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
	j	fbgt_cont.51665
fbgt_else.51670:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
fbgt_cont.51671:
	j	fbgt_cont.51665
fbgt_else.51668:
fbgt_cont.51669:
	j	fbgt_cont.51665
fbgt_else.51666:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.51665
	fblt	%f17, %f1, fbgt_else.51674
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
	j	fbgt_cont.51665
fbgt_else.51674:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f17, %f0
fbgt_cont.51675:
	j	fbgt_cont.51665
fbgt_else.51672:
fbgt_cont.51673:
fbgt_cont.51667:
	j	fbgt_cont.51665
fbgt_else.51664:
fbgt_cont.51665:
	fblt	%f17, %f18, fbgt_else.51676
	addi	%a0, %zero, 0
	j	fbgt_cont.51677
fbgt_else.51676:
	addi	%a0, %zero, 1
fbgt_cont.51677:
	fblt	%f17, %f18, fbgt_else.51678
	fsub	%f17, %f17, %f18
	j	fbgt_cont.51679
fbgt_else.51678:
fbgt_cont.51679:
	fblt	%f17, %f21, fbgt_else.51680
	beqi	%a0, 0, bnei_else.51682
	addi	%a0, %zero, 0
	j	fbgt_cont.51681
bnei_else.51682:
	addi	%a0, %zero, 1
bnei_cont.51683:
	j	fbgt_cont.51681
fbgt_else.51680:
fbgt_cont.51681:
	fblt	%f17, %f21, fbgt_else.51684
	fsub	%f17, %f18, %f17
	j	fbgt_cont.51685
fbgt_else.51684:
fbgt_cont.51685:
	fblt	%f22, %f17, fbgt_else.51686
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.51687
fbgt_else.51686:
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
fbgt_cont.51687:
	beqi	%a0, 0, bnei_else.51688
	j	bnei_cont.51689
bnei_else.51688:
	fneg	%f17, %f17
bnei_cont.51689:
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	fabs	%f20, %f19
	fblt	%f20, %f2, fbgt_else.51690
	flw	%f0, 492(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 491(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 490(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 489(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 488(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 487(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 486(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 485(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f0, 484(%zero)
	fblt	%f20, %f0, fbgt_cont.51691
	flw	%f1, 483(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	j	fbgt_cont.51691
fbgt_else.51708:
fbgt_cont.51709:
	j	fbgt_cont.51691
fbgt_else.51706:
fbgt_cont.51707:
	j	fbgt_cont.51691
fbgt_else.51704:
fbgt_cont.51705:
	j	fbgt_cont.51691
fbgt_else.51702:
fbgt_cont.51703:
	j	fbgt_cont.51691
fbgt_else.51700:
fbgt_cont.51701:
	j	fbgt_cont.51691
fbgt_else.51698:
fbgt_cont.51699:
	j	fbgt_cont.51691
fbgt_else.51696:
fbgt_cont.51697:
	j	fbgt_cont.51691
fbgt_else.51694:
fbgt_cont.51695:
	j	fbgt_cont.51691
fbgt_else.51692:
fbgt_cont.51693:
	j	fbgt_cont.51691
fbgt_else.51690:
	fmov	%f0, %f2
fbgt_cont.51691:
	fblt	%f20, %f2, fbgt_else.51710
	fblt	%f20, %f0, fbgt_else.51712
	fsub	%f20, %f20, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51711
	fblt	%f20, %f1, fbgt_else.51716
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f20, %f0
	j	fbgt_cont.51711
fbgt_else.51716:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f20, %f0
fbgt_cont.51717:
	j	fbgt_cont.51711
fbgt_else.51714:
fbgt_cont.51715:
	j	fbgt_cont.51711
fbgt_else.51712:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f20, %f2, fbgt_cont.51711
	fblt	%f20, %f1, fbgt_else.51720
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f20, %f0
	j	fbgt_cont.51711
fbgt_else.51720:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f20
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f20, %f0
fbgt_cont.51721:
	j	fbgt_cont.51711
fbgt_else.51718:
fbgt_cont.51719:
fbgt_cont.51713:
	j	fbgt_cont.51711
fbgt_else.51710:
fbgt_cont.51711:
	fblt	%f20, %f18, fbgt_else.51722
	beqi	%at, 0, bnei_else.51724
	addi	%a0, %zero, 0
	j	fbgt_cont.51723
bnei_else.51724:
	addi	%a0, %zero, 1
bnei_cont.51725:
	j	fbgt_cont.51723
fbgt_else.51722:
	add	%a0, %zero, %at
fbgt_cont.51723:
	fblt	%f20, %f18, fbgt_else.51726
	fsub	%f20, %f20, %f18
	j	fbgt_cont.51727
fbgt_else.51726:
fbgt_cont.51727:
	fblt	%f20, %f21, fbgt_else.51728
	fsub	%f20, %f18, %f20
	j	fbgt_cont.51729
fbgt_else.51728:
fbgt_cont.51729:
	fblt	%f22, %f20, fbgt_else.51730
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
	j	fbgt_cont.51731
fbgt_else.51730:
	fsub	%f0, %f21, %f20
	fmul	%f20, %f0, %f0
	fmul	%f16, %f20, %f20
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.51731:
	beqi	%a0, 0, bnei_else.51732
	j	bnei_cont.51733
bnei_else.51732:
	fneg	%f0, %f0
bnei_cont.51733:
	fmul	%f0, %f17, %f0
	fsw	%f0, 78(%zero)
	fabs	%f19, %f19
	fblt	%f19, %f2, fbgt_else.51734
	flw	%f0, 492(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 491(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 490(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 489(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 488(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 487(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 486(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 485(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f0, 484(%zero)
	fblt	%f19, %f0, fbgt_cont.51735
	flw	%f1, 483(%zero)
	fmov	%f0, %f19
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	j	fbgt_cont.51735
fbgt_else.51752:
fbgt_cont.51753:
	j	fbgt_cont.51735
fbgt_else.51750:
fbgt_cont.51751:
	j	fbgt_cont.51735
fbgt_else.51748:
fbgt_cont.51749:
	j	fbgt_cont.51735
fbgt_else.51746:
fbgt_cont.51747:
	j	fbgt_cont.51735
fbgt_else.51744:
fbgt_cont.51745:
	j	fbgt_cont.51735
fbgt_else.51742:
fbgt_cont.51743:
	j	fbgt_cont.51735
fbgt_else.51740:
fbgt_cont.51741:
	j	fbgt_cont.51735
fbgt_else.51738:
fbgt_cont.51739:
	j	fbgt_cont.51735
fbgt_else.51736:
fbgt_cont.51737:
	j	fbgt_cont.51735
fbgt_else.51734:
	fmov	%f0, %f2
fbgt_cont.51735:
	fblt	%f19, %f2, fbgt_else.51754
	fblt	%f19, %f0, fbgt_else.51756
	fsub	%f19, %f19, %f0
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.51755
	fblt	%f19, %f1, fbgt_else.51760
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f19, %f0
	j	fbgt_cont.51755
fbgt_else.51760:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f19, %f0
fbgt_cont.51761:
	j	fbgt_cont.51755
fbgt_else.51758:
fbgt_cont.51759:
	j	fbgt_cont.51755
fbgt_else.51756:
	flw	%f16, 495(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f19, %f2, fbgt_cont.51755
	fblt	%f19, %f1, fbgt_else.51764
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f19, %f0
	j	fbgt_cont.51755
fbgt_else.51764:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f19
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	fmov	%f19, %f0
fbgt_cont.51765:
	j	fbgt_cont.51755
fbgt_else.51762:
fbgt_cont.51763:
fbgt_cont.51757:
	j	fbgt_cont.51755
fbgt_else.51754:
fbgt_cont.51755:
	fblt	%f19, %f18, fbgt_else.51766
	addi	%a0, %zero, 0
	j	fbgt_cont.51767
fbgt_else.51766:
	addi	%a0, %zero, 1
fbgt_cont.51767:
	fblt	%f19, %f18, fbgt_else.51768
	fsub	%f19, %f19, %f18
	j	fbgt_cont.51769
fbgt_else.51768:
fbgt_cont.51769:
	fblt	%f19, %f21, fbgt_else.51770
	beqi	%a0, 0, bnei_else.51772
	addi	%a0, %zero, 0
	j	fbgt_cont.51771
bnei_else.51772:
	addi	%a0, %zero, 1
bnei_cont.51773:
	j	fbgt_cont.51771
fbgt_else.51770:
fbgt_cont.51771:
	fblt	%f19, %f21, fbgt_else.51774
	fsub	%f19, %f18, %f19
	j	fbgt_cont.51775
fbgt_else.51774:
fbgt_cont.51775:
	fblt	%f22, %f19, fbgt_else.51776
	fmul	%f18, %f19, %f19
	fmul	%f16, %f18, %f18
	flw	%f1, 474(%zero)
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51777
fbgt_else.51776:
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
fbgt_cont.51777:
	beqi	%a0, 0, bnei_else.51778
	j	bnei_cont.51779
bnei_else.51778:
	fneg	%f0, %f0
bnei_cont.51779:
	fmul	%f0, %f17, %f0
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	read_object.2784
	addi	%sp, %sp, -8
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	read_net_item.2788
	addi	%sp, %sp, -8
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.51780
	sw	%v0, 83(%zero)
	addi	%v0, %t9, 0
	addi	%sp, %sp, 8
	jal	read_and_network.2792
	addi	%sp, %sp, -8
	j	bnei_cont.51781
bnei_else.51780:
bnei_cont.51781:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	read_net_item.2788
	addi	%sp, %sp, -8
	addi	%s1, %v0, 0
	lw	%a0, 0(%s1)
	beqi	%a0, -1, bnei_else.51782
	addi	%v0, %t9, 0
	addi	%sp, %sp, 8
	jal	read_or_network.2790
	addi	%sp, %sp, -8
	sw	%s1, 0(%v0)
	j	bnei_cont.51783
bnei_else.51782:
	addi	%v1, %s1, 0
	addi	%v0, %t9, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
bnei_cont.51783:
	sw	%v0, 134(%zero)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %zero, 51
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%a1, %zero, 10
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v1, %zero, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%a2, %v0, 0
	lw	%a3, 0(%sp)
	blti	%a3, 10, bgti_else.51784
	blti	%a3, 20, bgti_else.51786
	blti	%a3, 30, bgti_else.51788
	blti	%a3, 40, bgti_else.51790
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51785
	blti	%a3, 20, bgti_else.51794
	blti	%a3, 30, bgti_else.51796
	blti	%a3, 40, bgti_else.51798
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51785
	blti	%a3, 20, bgti_else.51802
	blti	%a3, 30, bgti_else.51804
	blti	%a3, 40, bgti_else.51806
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51785
	blti	%a3, 20, bgti_else.51810
	blti	%a3, 30, bgti_else.51812
	blti	%a3, 40, bgti_else.51814
	addi	%v0, %a3, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a3, %v0, 0
	j	bgti_cont.51785
bgti_else.51814:
	addi	%a3, %a3, -30
bgti_cont.51815:
	j	bgti_cont.51785
bgti_else.51812:
	addi	%a3, %a3, -20
bgti_cont.51813:
	j	bgti_cont.51785
bgti_else.51810:
	addi	%a3, %a3, -10
bgti_cont.51811:
	j	bgti_cont.51785
bgti_else.51808:
bgti_cont.51809:
	j	bgti_cont.51785
bgti_else.51806:
	addi	%a3, %a3, -30
bgti_cont.51807:
	j	bgti_cont.51785
bgti_else.51804:
	addi	%a3, %a3, -20
bgti_cont.51805:
	j	bgti_cont.51785
bgti_else.51802:
	addi	%a3, %a3, -10
bgti_cont.51803:
	j	bgti_cont.51785
bgti_else.51800:
bgti_cont.51801:
	j	bgti_cont.51785
bgti_else.51798:
	addi	%a3, %a3, -30
bgti_cont.51799:
	j	bgti_cont.51785
bgti_else.51796:
	addi	%a3, %a3, -20
bgti_cont.51797:
	j	bgti_cont.51785
bgti_else.51794:
	addi	%a3, %a3, -10
bgti_cont.51795:
	j	bgti_cont.51785
bgti_else.51792:
bgti_cont.51793:
	j	bgti_cont.51785
bgti_else.51790:
	addi	%a3, %a3, -30
bgti_cont.51791:
	j	bgti_cont.51785
bgti_else.51788:
	addi	%a3, %a3, -20
bgti_cont.51789:
	j	bgti_cont.51785
bgti_else.51786:
	addi	%a3, %a3, -10
bgti_cont.51787:
	j	bgti_cont.51785
bgti_else.51784:
bgti_cont.51785:
	blt	%zero, %a2, bgt_else.51816
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.51817
bgt_else.51816:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.51818
	blti	%a2, 20, bgti_else.51820
	blti	%a2, 30, bgti_else.51822
	blti	%a2, 40, bgti_else.51824
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51819
	blti	%a2, 20, bgti_else.51828
	blti	%a2, 30, bgti_else.51830
	blti	%a2, 40, bgti_else.51832
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51819
	blti	%a2, 20, bgti_else.51836
	blti	%a2, 30, bgti_else.51838
	blti	%a2, 40, bgti_else.51840
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51819
	blti	%a2, 20, bgti_else.51844
	blti	%a2, 30, bgti_else.51846
	blti	%a2, 40, bgti_else.51848
	addi	%v0, %a2, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a2, %v0, 0
	j	bgti_cont.51819
bgti_else.51848:
	addi	%a2, %a2, -30
bgti_cont.51849:
	j	bgti_cont.51819
bgti_else.51846:
	addi	%a2, %a2, -20
bgti_cont.51847:
	j	bgti_cont.51819
bgti_else.51844:
	addi	%a2, %a2, -10
bgti_cont.51845:
	j	bgti_cont.51819
bgti_else.51842:
bgti_cont.51843:
	j	bgti_cont.51819
bgti_else.51840:
	addi	%a2, %a2, -30
bgti_cont.51841:
	j	bgti_cont.51819
bgti_else.51838:
	addi	%a2, %a2, -20
bgti_cont.51839:
	j	bgti_cont.51819
bgti_else.51836:
	addi	%a2, %a2, -10
bgti_cont.51837:
	j	bgti_cont.51819
bgti_else.51834:
bgti_cont.51835:
	j	bgti_cont.51819
bgti_else.51832:
	addi	%a2, %a2, -30
bgti_cont.51833:
	j	bgti_cont.51819
bgti_else.51830:
	addi	%a2, %a2, -20
bgti_cont.51831:
	j	bgti_cont.51819
bgti_else.51828:
	addi	%a2, %a2, -10
bgti_cont.51829:
	j	bgti_cont.51819
bgti_else.51826:
bgti_cont.51827:
	j	bgti_cont.51819
bgti_else.51824:
	addi	%a2, %a2, -30
bgti_cont.51825:
	j	bgti_cont.51819
bgti_else.51822:
	addi	%a2, %a2, -20
bgti_cont.51823:
	j	bgti_cont.51819
bgti_else.51820:
	addi	%a2, %a2, -10
bgti_cont.51821:
	j	bgti_cont.51819
bgti_else.51818:
bgti_cont.51819:
	blt	%zero, %a0, bgt_else.51850
	addi	%v0, %a2, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.51851
bgt_else.51850:
	blti	%a0, 10, bgti_else.51852
	blti	%a0, 20, bgti_else.51854
	blti	%a0, 30, bgti_else.51856
	blti	%a0, 40, bgti_else.51858
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51853
	blti	%a0, 20, bgti_else.51862
	blti	%a0, 30, bgti_else.51864
	blti	%a0, 40, bgti_else.51866
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51853
	blti	%a0, 20, bgti_else.51870
	blti	%a0, 30, bgti_else.51872
	blti	%a0, 40, bgti_else.51874
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51853
	blti	%a0, 20, bgti_else.51878
	blti	%a0, 30, bgti_else.51880
	blti	%a0, 40, bgti_else.51882
	addi	%v0, %a0, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	j	bgti_cont.51853
bgti_else.51882:
	addi	%a0, %a0, -30
bgti_cont.51883:
	j	bgti_cont.51853
bgti_else.51880:
	addi	%a0, %a0, -20
bgti_cont.51881:
	j	bgti_cont.51853
bgti_else.51878:
	addi	%a0, %a0, -10
bgti_cont.51879:
	j	bgti_cont.51853
bgti_else.51876:
bgti_cont.51877:
	j	bgti_cont.51853
bgti_else.51874:
	addi	%a0, %a0, -30
bgti_cont.51875:
	j	bgti_cont.51853
bgti_else.51872:
	addi	%a0, %a0, -20
bgti_cont.51873:
	j	bgti_cont.51853
bgti_else.51870:
	addi	%a0, %a0, -10
bgti_cont.51871:
	j	bgti_cont.51853
bgti_else.51868:
bgti_cont.51869:
	j	bgti_cont.51853
bgti_else.51866:
	addi	%a0, %a0, -30
bgti_cont.51867:
	j	bgti_cont.51853
bgti_else.51864:
	addi	%a0, %a0, -20
bgti_cont.51865:
	j	bgti_cont.51853
bgti_else.51862:
	addi	%a0, %a0, -10
bgti_cont.51863:
	j	bgti_cont.51853
bgti_else.51860:
bgti_cont.51861:
	j	bgti_cont.51853
bgti_else.51858:
	addi	%a0, %a0, -30
bgti_cont.51859:
	j	bgti_cont.51853
bgti_else.51856:
	addi	%a0, %a0, -20
bgti_cont.51857:
	j	bgti_cont.51853
bgti_else.51854:
	addi	%a0, %a0, -10
bgti_cont.51855:
	j	bgti_cont.51853
bgti_else.51852:
bgti_cont.51853:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a2, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
bgt_cont.51851:
bgt_cont.51817:
	addi	%a2, %zero, 32
	addi	%v0, %a2, 0
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%k0, %v0, 0
	blti	%a3, 10, bgti_else.51884
	blti	%a3, 20, bgti_else.51886
	blti	%a3, 30, bgti_else.51888
	blti	%a3, 40, bgti_else.51890
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51885
	blti	%a3, 20, bgti_else.51894
	blti	%a3, 30, bgti_else.51896
	blti	%a3, 40, bgti_else.51898
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51885
	blti	%a3, 20, bgti_else.51902
	blti	%a3, 30, bgti_else.51904
	blti	%a3, 40, bgti_else.51906
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.51885
	blti	%a3, 20, bgti_else.51910
	blti	%a3, 30, bgti_else.51912
	blti	%a3, 40, bgti_else.51914
	addi	%v0, %a3, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a3, %v0, 0
	j	bgti_cont.51885
bgti_else.51914:
	addi	%a3, %a3, -30
bgti_cont.51915:
	j	bgti_cont.51885
bgti_else.51912:
	addi	%a3, %a3, -20
bgti_cont.51913:
	j	bgti_cont.51885
bgti_else.51910:
	addi	%a3, %a3, -10
bgti_cont.51911:
	j	bgti_cont.51885
bgti_else.51908:
bgti_cont.51909:
	j	bgti_cont.51885
bgti_else.51906:
	addi	%a3, %a3, -30
bgti_cont.51907:
	j	bgti_cont.51885
bgti_else.51904:
	addi	%a3, %a3, -20
bgti_cont.51905:
	j	bgti_cont.51885
bgti_else.51902:
	addi	%a3, %a3, -10
bgti_cont.51903:
	j	bgti_cont.51885
bgti_else.51900:
bgti_cont.51901:
	j	bgti_cont.51885
bgti_else.51898:
	addi	%a3, %a3, -30
bgti_cont.51899:
	j	bgti_cont.51885
bgti_else.51896:
	addi	%a3, %a3, -20
bgti_cont.51897:
	j	bgti_cont.51885
bgti_else.51894:
	addi	%a3, %a3, -10
bgti_cont.51895:
	j	bgti_cont.51885
bgti_else.51892:
bgti_cont.51893:
	j	bgti_cont.51885
bgti_else.51890:
	addi	%a3, %a3, -30
bgti_cont.51891:
	j	bgti_cont.51885
bgti_else.51888:
	addi	%a3, %a3, -20
bgti_cont.51889:
	j	bgti_cont.51885
bgti_else.51886:
	addi	%a3, %a3, -10
bgti_cont.51887:
	j	bgti_cont.51885
bgti_else.51884:
bgti_cont.51885:
	blt	%zero, %k0, bgt_else.51916
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.51917
bgt_else.51916:
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	blti	%k0, 10, bgti_else.51918
	blti	%k0, 20, bgti_else.51920
	blti	%k0, 30, bgti_else.51922
	blti	%k0, 40, bgti_else.51924
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51919
	blti	%k0, 20, bgti_else.51928
	blti	%k0, 30, bgti_else.51930
	blti	%k0, 40, bgti_else.51932
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51919
	blti	%k0, 20, bgti_else.51936
	blti	%k0, 30, bgti_else.51938
	blti	%k0, 40, bgti_else.51940
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.51919
	blti	%k0, 20, bgti_else.51944
	blti	%k0, 30, bgti_else.51946
	blti	%k0, 40, bgti_else.51948
	addi	%v0, %k0, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%k0, %v0, 0
	j	bgti_cont.51919
bgti_else.51948:
	addi	%k0, %k0, -30
bgti_cont.51949:
	j	bgti_cont.51919
bgti_else.51946:
	addi	%k0, %k0, -20
bgti_cont.51947:
	j	bgti_cont.51919
bgti_else.51944:
	addi	%k0, %k0, -10
bgti_cont.51945:
	j	bgti_cont.51919
bgti_else.51942:
bgti_cont.51943:
	j	bgti_cont.51919
bgti_else.51940:
	addi	%k0, %k0, -30
bgti_cont.51941:
	j	bgti_cont.51919
bgti_else.51938:
	addi	%k0, %k0, -20
bgti_cont.51939:
	j	bgti_cont.51919
bgti_else.51936:
	addi	%k0, %k0, -10
bgti_cont.51937:
	j	bgti_cont.51919
bgti_else.51934:
bgti_cont.51935:
	j	bgti_cont.51919
bgti_else.51932:
	addi	%k0, %k0, -30
bgti_cont.51933:
	j	bgti_cont.51919
bgti_else.51930:
	addi	%k0, %k0, -20
bgti_cont.51931:
	j	bgti_cont.51919
bgti_else.51928:
	addi	%k0, %k0, -10
bgti_cont.51929:
	j	bgti_cont.51919
bgti_else.51926:
bgti_cont.51927:
	j	bgti_cont.51919
bgti_else.51924:
	addi	%k0, %k0, -30
bgti_cont.51925:
	j	bgti_cont.51919
bgti_else.51922:
	addi	%k0, %k0, -20
bgti_cont.51923:
	j	bgti_cont.51919
bgti_else.51920:
	addi	%k0, %k0, -10
bgti_cont.51921:
	j	bgti_cont.51919
bgti_else.51918:
bgti_cont.51919:
	blt	%zero, %a0, bgt_else.51950
	addi	%v0, %k0, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.51951
bgt_else.51950:
	blti	%a0, 10, bgti_else.51952
	blti	%a0, 20, bgti_else.51954
	blti	%a0, 30, bgti_else.51956
	blti	%a0, 40, bgti_else.51958
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51953
	blti	%a0, 20, bgti_else.51962
	blti	%a0, 30, bgti_else.51964
	blti	%a0, 40, bgti_else.51966
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51953
	blti	%a0, 20, bgti_else.51970
	blti	%a0, 30, bgti_else.51972
	blti	%a0, 40, bgti_else.51974
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.51953
	blti	%a0, 20, bgti_else.51978
	blti	%a0, 30, bgti_else.51980
	blti	%a0, 40, bgti_else.51982
	addi	%v0, %a0, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	j	bgti_cont.51953
bgti_else.51982:
	addi	%a0, %a0, -30
bgti_cont.51983:
	j	bgti_cont.51953
bgti_else.51980:
	addi	%a0, %a0, -20
bgti_cont.51981:
	j	bgti_cont.51953
bgti_else.51978:
	addi	%a0, %a0, -10
bgti_cont.51979:
	j	bgti_cont.51953
bgti_else.51976:
bgti_cont.51977:
	j	bgti_cont.51953
bgti_else.51974:
	addi	%a0, %a0, -30
bgti_cont.51975:
	j	bgti_cont.51953
bgti_else.51972:
	addi	%a0, %a0, -20
bgti_cont.51973:
	j	bgti_cont.51953
bgti_else.51970:
	addi	%a0, %a0, -10
bgti_cont.51971:
	j	bgti_cont.51953
bgti_else.51968:
bgti_cont.51969:
	j	bgti_cont.51953
bgti_else.51966:
	addi	%a0, %a0, -30
bgti_cont.51967:
	j	bgti_cont.51953
bgti_else.51964:
	addi	%a0, %a0, -20
bgti_cont.51965:
	j	bgti_cont.51953
bgti_else.51962:
	addi	%a0, %a0, -10
bgti_cont.51963:
	j	bgti_cont.51953
bgti_else.51960:
bgti_cont.51961:
	j	bgti_cont.51953
bgti_else.51958:
	addi	%a0, %a0, -30
bgti_cont.51959:
	j	bgti_cont.51953
bgti_else.51956:
	addi	%a0, %a0, -20
bgti_cont.51957:
	j	bgti_cont.51953
bgti_else.51954:
	addi	%a0, %a0, -10
bgti_cont.51955:
	j	bgti_cont.51953
bgti_else.51952:
bgti_cont.51953:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %k0, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
bgt_cont.51951:
bgt_cont.51917:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a3, %v0, 0
	blt	%zero, %a2, bgt_else.51984
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.51985
bgt_else.51984:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 8
	jal	print_int_sub1.2641
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.51986
	blti	%a2, 20, bgti_else.51988
	blti	%a2, 30, bgti_else.51990
	blti	%a2, 40, bgti_else.51992
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51987
	blti	%a2, 20, bgti_else.51996
	blti	%a2, 30, bgti_else.51998
	blti	%a2, 40, bgti_else.52000
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51987
	blti	%a2, 20, bgti_else.52004
	blti	%a2, 30, bgti_else.52006
	blti	%a2, 40, bgti_else.52008
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.51987
	blti	%a2, 20, bgti_else.52012
	blti	%a2, 30, bgti_else.52014
	blti	%a2, 40, bgti_else.52016
	addi	%v0, %a2, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a2, %v0, 0
	j	bgti_cont.51987
bgti_else.52016:
	addi	%a2, %a2, -30
bgti_cont.52017:
	j	bgti_cont.51987
bgti_else.52014:
	addi	%a2, %a2, -20
bgti_cont.52015:
	j	bgti_cont.51987
bgti_else.52012:
	addi	%a2, %a2, -10
bgti_cont.52013:
	j	bgti_cont.51987
bgti_else.52010:
bgti_cont.52011:
	j	bgti_cont.51987
bgti_else.52008:
	addi	%a2, %a2, -30
bgti_cont.52009:
	j	bgti_cont.51987
bgti_else.52006:
	addi	%a2, %a2, -20
bgti_cont.52007:
	j	bgti_cont.51987
bgti_else.52004:
	addi	%a2, %a2, -10
bgti_cont.52005:
	j	bgti_cont.51987
bgti_else.52002:
bgti_cont.52003:
	j	bgti_cont.51987
bgti_else.52000:
	addi	%a2, %a2, -30
bgti_cont.52001:
	j	bgti_cont.51987
bgti_else.51998:
	addi	%a2, %a2, -20
bgti_cont.51999:
	j	bgti_cont.51987
bgti_else.51996:
	addi	%a2, %a2, -10
bgti_cont.51997:
	j	bgti_cont.51987
bgti_else.51994:
bgti_cont.51995:
	j	bgti_cont.51987
bgti_else.51992:
	addi	%a2, %a2, -30
bgti_cont.51993:
	j	bgti_cont.51987
bgti_else.51990:
	addi	%a2, %a2, -20
bgti_cont.51991:
	j	bgti_cont.51987
bgti_else.51988:
	addi	%a2, %a2, -10
bgti_cont.51989:
	j	bgti_cont.51987
bgti_else.51986:
bgti_cont.51987:
	blt	%zero, %a0, bgt_else.52018
	addi	%v0, %a2, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	j	bgt_cont.52019
bgt_else.52018:
	blti	%a0, 10, bgti_else.52020
	blti	%a0, 20, bgti_else.52022
	blti	%a0, 30, bgti_else.52024
	blti	%a0, 40, bgti_else.52026
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.52021
	blti	%a0, 20, bgti_else.52030
	blti	%a0, 30, bgti_else.52032
	blti	%a0, 40, bgti_else.52034
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.52021
	blti	%a0, 20, bgti_else.52038
	blti	%a0, 30, bgti_else.52040
	blti	%a0, 40, bgti_else.52042
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.52021
	blti	%a0, 20, bgti_else.52046
	blti	%a0, 30, bgti_else.52048
	blti	%a0, 40, bgti_else.52050
	addi	%v0, %a0, -40
	addi	%sp, %sp, 8
	jal	print_int_sub2.2644
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	j	bgti_cont.52021
bgti_else.52050:
	addi	%a0, %a0, -30
bgti_cont.52051:
	j	bgti_cont.52021
bgti_else.52048:
	addi	%a0, %a0, -20
bgti_cont.52049:
	j	bgti_cont.52021
bgti_else.52046:
	addi	%a0, %a0, -10
bgti_cont.52047:
	j	bgti_cont.52021
bgti_else.52044:
bgti_cont.52045:
	j	bgti_cont.52021
bgti_else.52042:
	addi	%a0, %a0, -30
bgti_cont.52043:
	j	bgti_cont.52021
bgti_else.52040:
	addi	%a0, %a0, -20
bgti_cont.52041:
	j	bgti_cont.52021
bgti_else.52038:
	addi	%a0, %a0, -10
bgti_cont.52039:
	j	bgti_cont.52021
bgti_else.52036:
bgti_cont.52037:
	j	bgti_cont.52021
bgti_else.52034:
	addi	%a0, %a0, -30
bgti_cont.52035:
	j	bgti_cont.52021
bgti_else.52032:
	addi	%a0, %a0, -20
bgti_cont.52033:
	j	bgti_cont.52021
bgti_else.52030:
	addi	%a0, %a0, -10
bgti_cont.52031:
	j	bgti_cont.52021
bgti_else.52028:
bgti_cont.52029:
	j	bgti_cont.52021
bgti_else.52026:
	addi	%a0, %a0, -30
bgti_cont.52027:
	j	bgti_cont.52021
bgti_else.52024:
	addi	%a0, %a0, -20
bgti_cont.52025:
	j	bgti_cont.52021
bgti_else.52022:
	addi	%a0, %a0, -10
bgti_cont.52023:
	j	bgti_cont.52021
bgti_else.52020:
bgti_cont.52021:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a2, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%v0, %a3, 48
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
bgt_cont.52019:
bgt_cont.51985:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	addi	%a2, %zero, 120
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %a2, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	sw	%v0, 183(%zero)
	lw	%t9, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %t9, 0
	addi	%sp, %sp, 9
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -9
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	create_dirvecs.3105
	addi	%sp, %sp, -9
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 460(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 438(%zero)
	fsub	%f0, %f1, %f0
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	addi	%v0, %zero, 4
	addi	%a0, %v1, 0
	addi	%sp, %sp, 9
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -9
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	addi	%sp, %sp, 9
	jal	calc_dirvec_rows.3096
	addi	%sp, %sp, -9
	addi	%v1, %zero, 119
	addi	%v0, %t9, 0
	addi	%sp, %sp, 9
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -9
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	init_vecset_constants.3110
	addi	%sp, %sp, -9
	flw	%f26, 78(%zero)
	fsw	%f26, 184(%zero)
	flw	%f27, 79(%zero)
	fsw	%f27, 185(%zero)
	flw	%f28, 80(%zero)
	fsw	%f28, 186(%zero)
	lw	%a0, 8(%sp)
	addi	%s2, %a0, -1
	blti	%s2, 0, bgti_else.52052
	lw	%a1, 12(%s2)
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.52054
	beqi	%a0, 2, bnei_else.52056
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 5
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
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
	beqi	%a0, 0, bnei_else.52058
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
	j	bnei_cont.52059
bnei_else.52058:
bnei_cont.52059:
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
	beqi	%a0, 0, bnei_else.52060
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
	j	bnei_cont.52061
bnei_else.52060:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.52061:
	flw	%f1, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%at, 0, bnei_else.52062
	j	bnei_cont.52063
bnei_else.52062:
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v0)
bnei_cont.52063:
	sw	%v0, 187(%s2)
	j	bnei_cont.52055
bnei_else.52056:
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 4
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
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
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%at, 0, bnei_else.52064
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
	j	bnei_cont.52065
bnei_else.52064:
	flw	%f0, 470(%zero)
	flw	Tu95.4628.23930, 470(%zero)
bnei_cont.52065:
	sw	%v0, 187(%s2)
bnei_cont.52057:
	j	bnei_cont.52055
bnei_else.52054:
	addi	%v0, %zero, 6
	flw	%f0, 470(%zero)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	flw	%f1, 184(%zero)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%at, 0, bnei_else.52066
	flw	%f0, 470(%zero)
	flw	Tu91.4667.23985, 470(%zero)
	j	bnei_cont.52067
bnei_else.52066:
	lw	%a0, 6(%a1)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%a0, 0, bnei_else.52068
	beqi	%at, 0, bnei_else.52070
	addi	%a0, %zero, 0
	j	bnei_cont.52069
bnei_else.52070:
	addi	%a0, %zero, 1
bnei_cont.52071:
	j	bnei_cont.52069
bnei_else.52068:
	add	%a0, %zero, %at
bnei_cont.52069:
	lw	%a2, 4(%a1)
	flw	%f0, 0(%a2)
	beqi	%a0, 0, bnei_else.52072
	j	bnei_cont.52073
bnei_else.52072:
	fneg	%f0, %f0
bnei_cont.52073:
	fsw	%f0, 0(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
bnei_cont.52067:
	flw	%f1, 185(%zero)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%at, 0, bnei_else.52074
	flw	%f0, 470(%zero)
	flw	Tu90.4668.23989, 470(%zero)
	j	bnei_cont.52075
bnei_else.52074:
	lw	%a0, 6(%a1)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%a0, 0, bnei_else.52076
	beqi	%at, 0, bnei_else.52078
	addi	%a0, %zero, 0
	j	bnei_cont.52077
bnei_else.52078:
	addi	%a0, %zero, 1
bnei_cont.52079:
	j	bnei_cont.52077
bnei_else.52076:
	add	%a0, %zero, %at
bnei_cont.52077:
	lw	%a2, 4(%a1)
	flw	%f0, 1(%a2)
	beqi	%a0, 0, bnei_else.52080
	j	bnei_cont.52081
bnei_else.52080:
	fneg	%f0, %f0
bnei_cont.52081:
	fsw	%f0, 2(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
bnei_cont.52075:
	flw	%f1, 186(%zero)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%at, 0, bnei_else.52082
	flw	%f0, 470(%zero)
	flw	Tu89.4669.23993, 470(%zero)
	j	bnei_cont.52083
bnei_else.52082:
	lw	%a0, 6(%a1)
	flw	%f0, 470(%zero)
	flw	%at, 470(%zero)
	beqi	%a0, 0, bnei_else.52084
	beqi	%at, 0, bnei_else.52086
	addi	%a0, %zero, 0
	j	bnei_cont.52085
bnei_else.52086:
	addi	%a0, %zero, 1
bnei_cont.52087:
	j	bnei_cont.52085
bnei_else.52084:
	add	%a0, %zero, %at
bnei_cont.52085:
	lw	%a1, 4(%a1)
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.52088
	j	bnei_cont.52089
bnei_else.52088:
	fneg	%f0, %f0
bnei_cont.52089:
	fsw	%f0, 4(%v0)
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
bnei_cont.52083:
	sw	%v0, 187(%s2)
bnei_cont.52055:
	addi	%v1, %s2, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -9
	j	bgti_cont.52053
bgti_else.52052:
bgti_cont.52053:
	blti	%s2, 0, bgti_else.52090
	lw	%a1, 12(%s2)
	lw	%a0, 2(%a1)
	beqi	%a0, 2, bnei_else.52092
	j	bgti_cont.52091
bnei_else.52092:
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	flw	%f1, 474(%zero)
	fblt	%f0, %f1, fbgt_else.52094
	addi	%a0, %zero, 0
	j	fbgt_cont.52095
fbgt_else.52094:
	addi	%a0, %zero, 1
fbgt_cont.52095:
	beqi	%a0, 0, bgti_cont.52091
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.52098
	beqi	%a0, 2, bnei_else.52100
	j	bgti_cont.52091
bnei_else.52100:
	sll	%a0, %s2, 2
	addi	%s4, %a0, 1
	lw	%s5, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f29, %f1, %f0
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f1, %f26, %f0
	flw	%f0, 1(%a0)
	fmul	%f0, %f27, %f0
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f28, %f0
	fadd	%f18, %f1, %f0
	flw	%f1, 495(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f17, %f0, %f26
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f16, %f0, %f27
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f1, %f0, %f28
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	addi	%a1, %v0, 0
	lw	%v0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f17, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -9
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s4, 0(%a0)
	sw	%a0, 254(%s5)
	addi	%a0, %s5, 1
	sw	%a0, 434(%zero)
bnei_cont.52101:
	j	bgti_cont.52091
bnei_else.52098:
	sll	%s4, %s2, 2
	lw	%s5, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f29, %f1, %f0
	fneg	%f3, %f26
	fneg	%f4, %f27
	fneg	%f5, %f28
	addi	%s6, %s4, 1
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	addi	%a1, %v0, 0
	lw	%v0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f26, 0(%a1)
	fsw	%f4, 1(%a1)
	fsw	%f5, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -9
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%s5)
	addi	%s3, %s5, 1
	addi	%s6, %s4, 2
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	addi	%a1, %v0, 0
	lw	%v0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s7)
	sw	%a1, 0(%s7)
	fsw	%f3, 0(%a1)
	fsw	%f27, 1(%a1)
	fsw	%f5, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s7, 0
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -9
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%s7, 1(%a0)
	sw	%s6, 0(%a0)
	sw	%a0, 254(%s3)
	addi	%s6, %s5, 2
	addi	%s4, %s4, 3
	flw	%f0, 470(%zero)
	addi	%v0, %zero, 3
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	addi	%a1, %v0, 0
	lw	%v0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	add	%s3, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s3)
	sw	%a1, 0(%s3)
	fsw	%f3, 0(%a1)
	fsw	%f4, 1(%a1)
	fsw	%f28, 2(%a1)
	addi	%v1, %s2, 0
	addi	%v0, %s3, 0
	addi	%sp, %sp, 9
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -9
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%s3, 1(%a0)
	sw	%s4, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%a0, %s5, 3
	sw	%a0, 434(%zero)
bnei_cont.52099:
	j	bgti_cont.52091
bnei_else.52096:
bnei_cont.52097:
bnei_cont.52093:
	j	bgti_cont.52091
bgti_else.52090:
bgti_cont.52091:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	addi	%a0, %zero, 0
	addi	%a1, %zero, 0
	itof	%f0, %a1
	fmul	%f17, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f17, %f0
	flw	%f0, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f16, %f17, %f1
	flw	%f1, 6(%sp)
	fadd	%f1, %f16, %f1
	flw	%f16, 170(%zero)
	fmul	%f17, %f17, %f16
	flw	%f16, 7(%sp)
	fadd	%f2, %f17, %f16
	lw	%a1, 0(%sp)
	addi	%v1, %a1, -1
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -9
	addi	%a2, %zero, 2
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 9
	jal	scan_line.3063
	addi	%sp, %sp, -9
	addi	%g0, %zero, 0
	ret
