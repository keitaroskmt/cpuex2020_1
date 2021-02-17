.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 483
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
atan.2627:
	fblt	%f0, %fzero, fbgt_else.28395
	add	%a0, %zero, %k1
	j	fbgt_cont.28396
fbgt_else.28395:
	add	%a0, %zero, %zero
fbgt_cont.28396:
	fabs	%f12, %f0
	flw	%f1, 481(%zero)
	fblt	%f12, %f1, fbgt_else.28397
	flw	%f0, 474(%zero)
	fblt	%f12, %f0, fbgt_else.28398
	flw	%f11, 471(%zero)
	fdiv	%f14, %f30, %f12
	fmul	%f15, %f14, %f14
	fmul	%f13, %f15, %f15
	fmul	%f12, %f13, %f13
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fsub	%f1, %f14, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fsub	%f0, %f11, %f0
	j	fbgt_cont.28399
fbgt_else.28398:
	flw	%f11, 473(%zero)
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30
	fdiv	%f14, %f1, %f0
	fmul	%f15, %f14, %f14
	fmul	%f13, %f15, %f15
	fmul	%f12, %f13, %f13
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fsub	%f1, %f14, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
fbgt_cont.28399:
	beqi	%a0, 0, bnei_else.28400
	jr	%ra
bnei_else.28400:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.28397:
	fmul	%f14, %f0, %f0
	fmul	%f13, %f14, %f14
	fmul	%f12, %f13, %f13
	flw	%f1, 480(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f14
	fsub	%f11, %f0, %f1
	flw	%f1, 479(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f13
	fadd	%f11, %f11, %f1
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fsub	%f11, %f11, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f12
	fsub	%f11, %f11, %f1
	flw	%f1, 475(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f0, %f11, %f0
	jr	%ra
print_int_sub1.2629:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.28462
	blti	%a0, 20, bgti_else.28463
	blti	%a0, 30, bgti_else.28464
	blti	%a0, 40, bgti_else.28465
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.28466
	blti	%a0, 20, bgti_else.28467
	blti	%a0, 30, bgti_else.28468
	blti	%a0, 40, bgti_else.28469
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.28470
	blti	%a0, 20, bgti_else.28471
	blti	%a0, 30, bgti_else.28472
	blti	%a0, 40, bgti_else.28473
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.28474
	blti	%a0, 20, bgti_else.28475
	blti	%a0, 30, bgti_else.28476
	blti	%a0, 40, bgti_else.28477
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2629
bgti_else.28477:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.28476:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.28475:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.28474:
	jr	%ra
bgti_else.28473:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.28472:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.28471:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.28470:
	jr	%ra
bgti_else.28469:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.28468:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.28467:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.28466:
	jr	%ra
bgti_else.28465:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.28464:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.28463:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.28462:
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.28587
	blti	%v0, 20, bgti_else.28588
	blti	%v0, 30, bgti_else.28589
	blti	%v0, 40, bgti_else.28590
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28591
	blti	%v0, 20, bgti_else.28592
	blti	%v0, 30, bgti_else.28593
	blti	%v0, 40, bgti_else.28594
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28595
	blti	%v0, 20, bgti_else.28596
	blti	%v0, 30, bgti_else.28597
	blti	%v0, 40, bgti_else.28598
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28599
	blti	%v0, 20, bgti_else.28600
	blti	%v0, 30, bgti_else.28601
	blti	%v0, 40, bgti_else.28602
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28603
	blti	%v0, 20, bgti_else.28604
	blti	%v0, 30, bgti_else.28605
	blti	%v0, 40, bgti_else.28606
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28607
	blti	%v0, 20, bgti_else.28608
	blti	%v0, 30, bgti_else.28609
	blti	%v0, 40, bgti_else.28610
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28611
	blti	%v0, 20, bgti_else.28612
	blti	%v0, 30, bgti_else.28613
	blti	%v0, 40, bgti_else.28614
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.28615
	blti	%v0, 20, bgti_else.28616
	blti	%v0, 30, bgti_else.28617
	blti	%v0, 40, bgti_else.28618
	addi	%v0, %v0, -40
	j	print_int_sub2.2632
bgti_else.28618:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28617:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28616:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28615:
	jr	%ra
bgti_else.28614:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28613:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28612:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28611:
	jr	%ra
bgti_else.28610:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28609:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28608:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28607:
	jr	%ra
bgti_else.28606:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28605:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28604:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28603:
	jr	%ra
bgti_else.28602:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28601:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28600:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28599:
	jr	%ra
bgti_else.28598:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28597:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28596:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28595:
	jr	%ra
bgti_else.28594:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28593:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28592:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28591:
	jr	%ra
bgti_else.28590:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.28589:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.28588:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.28587:
	jr	%ra
print_int.2634:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	blti	%a1, 10, bgti_else.28962
	blti	%a1, 20, bgti_else.28964
	blti	%a1, 30, bgti_else.28966
	blti	%a1, 40, bgti_else.28968
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.28970
	blti	%a0, 20, bgti_else.28972
	blti	%a0, 30, bgti_else.28974
	blti	%a0, 40, bgti_else.28976
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.28978
	blti	%a0, 20, bgti_else.28980
	blti	%a0, 30, bgti_else.28982
	blti	%a0, 40, bgti_else.28984
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	jal	print_int_sub1.2629
	addi	%a3, %v0, 0
	j	bgti_cont.28963
bgti_else.28984:
	addi	%a3, %zero, 11
bgti_cont.28985:
	j	bgti_cont.28963
bgti_else.28982:
	addi	%a3, %zero, 10
bgti_cont.28983:
	j	bgti_cont.28963
bgti_else.28980:
	addi	%a3, %zero, 9
bgti_cont.28981:
	j	bgti_cont.28963
bgti_else.28978:
	addi	%a3, %zero, 8
bgti_cont.28979:
	j	bgti_cont.28963
bgti_else.28976:
	addi	%a3, %zero, 7
bgti_cont.28977:
	j	bgti_cont.28963
bgti_else.28974:
	addi	%a3, %zero, 6
bgti_cont.28975:
	j	bgti_cont.28963
bgti_else.28972:
	addi	%a3, %zero, 5
bgti_cont.28973:
	j	bgti_cont.28963
bgti_else.28970:
	addi	%a3, %zero, 4
bgti_cont.28971:
	j	bgti_cont.28963
bgti_else.28968:
	addi	%a3, %zero, 3
bgti_cont.28969:
	j	bgti_cont.28963
bgti_else.28966:
	addi	%a3, %zero, 2
bgti_cont.28967:
	j	bgti_cont.28963
bgti_else.28964:
	add	%a3, %zero, %k1
bgti_cont.28965:
	j	bgti_cont.28963
bgti_else.28962:
	add	%a3, %zero, %zero
bgti_cont.28963:
	blti	%a1, 10, bgti_else.28986
	blti	%a1, 20, bgti_else.28988
	blti	%a1, 30, bgti_else.28990
	blti	%a1, 40, bgti_else.28992
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.28996
	blti	%a1, 30, bgti_else.28998
	blti	%a1, 40, bgti_else.29000
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.29004
	blti	%a1, 30, bgti_else.29006
	blti	%a1, 40, bgti_else.29008
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.29012
	blti	%a1, 30, bgti_else.29014
	blti	%a1, 40, bgti_else.29016
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.29020
	blti	%a1, 30, bgti_else.29022
	blti	%a1, 40, bgti_else.29024
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.29028
	blti	%a1, 30, bgti_else.29030
	blti	%a1, 40, bgti_else.29032
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.28987
	blti	%a1, 20, bgti_else.29036
	blti	%a1, 30, bgti_else.29038
	blti	%a1, 40, bgti_else.29040
	addi	%v0, %a1, -40
	jal	print_int_sub2.2632
	addi	%a1, %v0, 0
	j	bgti_cont.28987
bgti_else.29040:
	addi	%a1, %a1, -30
bgti_cont.29041:
	j	bgti_cont.28987
bgti_else.29038:
	addi	%a1, %a1, -20
bgti_cont.29039:
	j	bgti_cont.28987
bgti_else.29036:
	addi	%a1, %a1, -10
bgti_cont.29037:
	j	bgti_cont.28987
bgti_else.29034:
bgti_cont.29035:
	j	bgti_cont.28987
bgti_else.29032:
	addi	%a1, %a1, -30
bgti_cont.29033:
	j	bgti_cont.28987
bgti_else.29030:
	addi	%a1, %a1, -20
bgti_cont.29031:
	j	bgti_cont.28987
bgti_else.29028:
	addi	%a1, %a1, -10
bgti_cont.29029:
	j	bgti_cont.28987
bgti_else.29026:
bgti_cont.29027:
	j	bgti_cont.28987
bgti_else.29024:
	addi	%a1, %a1, -30
bgti_cont.29025:
	j	bgti_cont.28987
bgti_else.29022:
	addi	%a1, %a1, -20
bgti_cont.29023:
	j	bgti_cont.28987
bgti_else.29020:
	addi	%a1, %a1, -10
bgti_cont.29021:
	j	bgti_cont.28987
bgti_else.29018:
bgti_cont.29019:
	j	bgti_cont.28987
bgti_else.29016:
	addi	%a1, %a1, -30
bgti_cont.29017:
	j	bgti_cont.28987
bgti_else.29014:
	addi	%a1, %a1, -20
bgti_cont.29015:
	j	bgti_cont.28987
bgti_else.29012:
	addi	%a1, %a1, -10
bgti_cont.29013:
	j	bgti_cont.28987
bgti_else.29010:
bgti_cont.29011:
	j	bgti_cont.28987
bgti_else.29008:
	addi	%a1, %a1, -30
bgti_cont.29009:
	j	bgti_cont.28987
bgti_else.29006:
	addi	%a1, %a1, -20
bgti_cont.29007:
	j	bgti_cont.28987
bgti_else.29004:
	addi	%a1, %a1, -10
bgti_cont.29005:
	j	bgti_cont.28987
bgti_else.29002:
bgti_cont.29003:
	j	bgti_cont.28987
bgti_else.29000:
	addi	%a1, %a1, -30
bgti_cont.29001:
	j	bgti_cont.28987
bgti_else.28998:
	addi	%a1, %a1, -20
bgti_cont.28999:
	j	bgti_cont.28987
bgti_else.28996:
	addi	%a1, %a1, -10
bgti_cont.28997:
	j	bgti_cont.28987
bgti_else.28994:
bgti_cont.28995:
	j	bgti_cont.28987
bgti_else.28992:
	addi	%a1, %a1, -30
bgti_cont.28993:
	j	bgti_cont.28987
bgti_else.28990:
	addi	%a1, %a1, -20
bgti_cont.28991:
	j	bgti_cont.28987
bgti_else.28988:
	addi	%a1, %a1, -10
bgti_cont.28989:
	j	bgti_cont.28987
bgti_else.28986:
bgti_cont.28987:
	blt	%zero, %a3, bgt_else.29042
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.29042:
	blti	%a3, 10, bgti_else.29043
	blti	%a3, 20, bgti_else.29045
	blti	%a3, 30, bgti_else.29047
	blti	%a3, 40, bgti_else.29049
	addi	%a0, %a3, -40
	blti	%a0, 10, bgti_else.29051
	blti	%a0, 20, bgti_else.29053
	blti	%a0, 30, bgti_else.29055
	blti	%a0, 40, bgti_else.29057
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.29059
	blti	%a0, 20, bgti_else.29061
	blti	%a0, 30, bgti_else.29063
	blti	%a0, 40, bgti_else.29065
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	jal	print_int_sub1.2629
	addi	%a0, %v0, 0
	j	bgti_cont.29044
bgti_else.29065:
	addi	%a0, %zero, 11
bgti_cont.29066:
	j	bgti_cont.29044
bgti_else.29063:
	addi	%a0, %zero, 10
bgti_cont.29064:
	j	bgti_cont.29044
bgti_else.29061:
	addi	%a0, %zero, 9
bgti_cont.29062:
	j	bgti_cont.29044
bgti_else.29059:
	addi	%a0, %zero, 8
bgti_cont.29060:
	j	bgti_cont.29044
bgti_else.29057:
	addi	%a0, %zero, 7
bgti_cont.29058:
	j	bgti_cont.29044
bgti_else.29055:
	addi	%a0, %zero, 6
bgti_cont.29056:
	j	bgti_cont.29044
bgti_else.29053:
	addi	%a0, %zero, 5
bgti_cont.29054:
	j	bgti_cont.29044
bgti_else.29051:
	addi	%a0, %zero, 4
bgti_cont.29052:
	j	bgti_cont.29044
bgti_else.29049:
	addi	%a0, %zero, 3
bgti_cont.29050:
	j	bgti_cont.29044
bgti_else.29047:
	addi	%a0, %zero, 2
bgti_cont.29048:
	j	bgti_cont.29044
bgti_else.29045:
	add	%a0, %zero, %k1
bgti_cont.29046:
	j	bgti_cont.29044
bgti_else.29043:
	add	%a0, %zero, %zero
bgti_cont.29044:
	blti	%a3, 10, bgti_else.29067
	blti	%a3, 20, bgti_else.29069
	blti	%a3, 30, bgti_else.29071
	blti	%a3, 40, bgti_else.29073
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29077
	blti	%a3, 30, bgti_else.29079
	blti	%a3, 40, bgti_else.29081
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29085
	blti	%a3, 30, bgti_else.29087
	blti	%a3, 40, bgti_else.29089
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29093
	blti	%a3, 30, bgti_else.29095
	blti	%a3, 40, bgti_else.29097
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29101
	blti	%a3, 30, bgti_else.29103
	blti	%a3, 40, bgti_else.29105
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29109
	blti	%a3, 30, bgti_else.29111
	blti	%a3, 40, bgti_else.29113
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.29068
	blti	%a3, 20, bgti_else.29117
	blti	%a3, 30, bgti_else.29119
	blti	%a3, 40, bgti_else.29121
	addi	%v0, %a3, -40
	jal	print_int_sub2.2632
	addi	%a3, %v0, 0
	j	bgti_cont.29068
bgti_else.29121:
	addi	%a3, %a3, -30
bgti_cont.29122:
	j	bgti_cont.29068
bgti_else.29119:
	addi	%a3, %a3, -20
bgti_cont.29120:
	j	bgti_cont.29068
bgti_else.29117:
	addi	%a3, %a3, -10
bgti_cont.29118:
	j	bgti_cont.29068
bgti_else.29115:
bgti_cont.29116:
	j	bgti_cont.29068
bgti_else.29113:
	addi	%a3, %a3, -30
bgti_cont.29114:
	j	bgti_cont.29068
bgti_else.29111:
	addi	%a3, %a3, -20
bgti_cont.29112:
	j	bgti_cont.29068
bgti_else.29109:
	addi	%a3, %a3, -10
bgti_cont.29110:
	j	bgti_cont.29068
bgti_else.29107:
bgti_cont.29108:
	j	bgti_cont.29068
bgti_else.29105:
	addi	%a3, %a3, -30
bgti_cont.29106:
	j	bgti_cont.29068
bgti_else.29103:
	addi	%a3, %a3, -20
bgti_cont.29104:
	j	bgti_cont.29068
bgti_else.29101:
	addi	%a3, %a3, -10
bgti_cont.29102:
	j	bgti_cont.29068
bgti_else.29099:
bgti_cont.29100:
	j	bgti_cont.29068
bgti_else.29097:
	addi	%a3, %a3, -30
bgti_cont.29098:
	j	bgti_cont.29068
bgti_else.29095:
	addi	%a3, %a3, -20
bgti_cont.29096:
	j	bgti_cont.29068
bgti_else.29093:
	addi	%a3, %a3, -10
bgti_cont.29094:
	j	bgti_cont.29068
bgti_else.29091:
bgti_cont.29092:
	j	bgti_cont.29068
bgti_else.29089:
	addi	%a3, %a3, -30
bgti_cont.29090:
	j	bgti_cont.29068
bgti_else.29087:
	addi	%a3, %a3, -20
bgti_cont.29088:
	j	bgti_cont.29068
bgti_else.29085:
	addi	%a3, %a3, -10
bgti_cont.29086:
	j	bgti_cont.29068
bgti_else.29083:
bgti_cont.29084:
	j	bgti_cont.29068
bgti_else.29081:
	addi	%a3, %a3, -30
bgti_cont.29082:
	j	bgti_cont.29068
bgti_else.29079:
	addi	%a3, %a3, -20
bgti_cont.29080:
	j	bgti_cont.29068
bgti_else.29077:
	addi	%a3, %a3, -10
bgti_cont.29078:
	j	bgti_cont.29068
bgti_else.29075:
bgti_cont.29076:
	j	bgti_cont.29068
bgti_else.29073:
	addi	%a3, %a3, -30
bgti_cont.29074:
	j	bgti_cont.29068
bgti_else.29071:
	addi	%a3, %a3, -20
bgti_cont.29072:
	j	bgti_cont.29068
bgti_else.29069:
	addi	%a3, %a3, -10
bgti_cont.29070:
	j	bgti_cont.29068
bgti_else.29067:
bgti_cont.29068:
	blt	%zero, %a0, bgt_else.29123
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.29123:
	blti	%a0, 10, bgti_else.29124
	blti	%a0, 20, bgti_else.29126
	blti	%a0, 30, bgti_else.29128
	blti	%a0, 40, bgti_else.29130
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29134
	blti	%a0, 30, bgti_else.29136
	blti	%a0, 40, bgti_else.29138
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29142
	blti	%a0, 30, bgti_else.29144
	blti	%a0, 40, bgti_else.29146
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29150
	blti	%a0, 30, bgti_else.29152
	blti	%a0, 40, bgti_else.29154
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29158
	blti	%a0, 30, bgti_else.29160
	blti	%a0, 40, bgti_else.29162
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29166
	blti	%a0, 30, bgti_else.29168
	blti	%a0, 40, bgti_else.29170
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.29125
	blti	%a0, 20, bgti_else.29174
	blti	%a0, 30, bgti_else.29176
	blti	%a0, 40, bgti_else.29178
	addi	%v0, %a0, -40
	jal	print_int_sub2.2632
	addi	%a0, %v0, 0
	j	bgti_cont.29125
bgti_else.29178:
	addi	%a0, %a0, -30
bgti_cont.29179:
	j	bgti_cont.29125
bgti_else.29176:
	addi	%a0, %a0, -20
bgti_cont.29177:
	j	bgti_cont.29125
bgti_else.29174:
	addi	%a0, %a0, -10
bgti_cont.29175:
	j	bgti_cont.29125
bgti_else.29172:
bgti_cont.29173:
	j	bgti_cont.29125
bgti_else.29170:
	addi	%a0, %a0, -30
bgti_cont.29171:
	j	bgti_cont.29125
bgti_else.29168:
	addi	%a0, %a0, -20
bgti_cont.29169:
	j	bgti_cont.29125
bgti_else.29166:
	addi	%a0, %a0, -10
bgti_cont.29167:
	j	bgti_cont.29125
bgti_else.29164:
bgti_cont.29165:
	j	bgti_cont.29125
bgti_else.29162:
	addi	%a0, %a0, -30
bgti_cont.29163:
	j	bgti_cont.29125
bgti_else.29160:
	addi	%a0, %a0, -20
bgti_cont.29161:
	j	bgti_cont.29125
bgti_else.29158:
	addi	%a0, %a0, -10
bgti_cont.29159:
	j	bgti_cont.29125
bgti_else.29156:
bgti_cont.29157:
	j	bgti_cont.29125
bgti_else.29154:
	addi	%a0, %a0, -30
bgti_cont.29155:
	j	bgti_cont.29125
bgti_else.29152:
	addi	%a0, %a0, -20
bgti_cont.29153:
	j	bgti_cont.29125
bgti_else.29150:
	addi	%a0, %a0, -10
bgti_cont.29151:
	j	bgti_cont.29125
bgti_else.29148:
bgti_cont.29149:
	j	bgti_cont.29125
bgti_else.29146:
	addi	%a0, %a0, -30
bgti_cont.29147:
	j	bgti_cont.29125
bgti_else.29144:
	addi	%a0, %a0, -20
bgti_cont.29145:
	j	bgti_cont.29125
bgti_else.29142:
	addi	%a0, %a0, -10
bgti_cont.29143:
	j	bgti_cont.29125
bgti_else.29140:
bgti_cont.29141:
	j	bgti_cont.29125
bgti_else.29138:
	addi	%a0, %a0, -30
bgti_cont.29139:
	j	bgti_cont.29125
bgti_else.29136:
	addi	%a0, %a0, -20
bgti_cont.29137:
	j	bgti_cont.29125
bgti_else.29134:
	addi	%a0, %a0, -10
bgti_cont.29135:
	j	bgti_cont.29125
bgti_else.29132:
bgti_cont.29133:
	j	bgti_cont.29125
bgti_else.29130:
	addi	%a0, %a0, -30
bgti_cont.29131:
	j	bgti_cont.29125
bgti_else.29128:
	addi	%a0, %a0, -20
bgti_cont.29129:
	j	bgti_cont.29125
bgti_else.29126:
	addi	%a0, %a0, -10
bgti_cont.29127:
	j	bgti_cont.29125
bgti_else.29124:
bgti_cont.29125:
	addi	%v0, %a0, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
rotate_quadratic_matrix.2767:
	flw	%f12, 0(%v1)
	flw	%f14, 470(%zero)
	fabs	%f1, %f12
	flw	%f15, 469(%zero)
	fdiv	%f0, %f1, %f15
	floor	%f0, %f0
	fmul	%f0, %f0, %f15
	fsub	%f0, %f1, %f0
	fblt	%f0, %f14, fbgt_else.29320
	add	%a0, %zero, %zero
	j	fbgt_cont.29321
fbgt_else.29320:
	add	%a0, %zero, %k1
fbgt_cont.29321:
	fblt	%f0, %f14, fbgt_else.29322
	fsub	%f0, %f0, %f14
	j	fbgt_cont.29323
fbgt_else.29322:
fbgt_cont.29323:
	flw	%f16, 471(%zero)
	fblt	%f0, %f16, fbgt_else.29324
	beqi	%a0, 0, bnei_else.29326
	add	%a0, %zero, %zero
	j	fbgt_cont.29325
bnei_else.29326:
	add	%a0, %zero, %k1
bnei_cont.29327:
	j	fbgt_cont.29325
fbgt_else.29324:
fbgt_cont.29325:
	fblt	%f0, %f16, fbgt_else.29328
	fsub	%f0, %f14, %f0
	j	fbgt_cont.29329
fbgt_else.29328:
fbgt_cont.29329:
	flw	%f13, 473(%zero)
	fblt	%f13, %f0, fbgt_else.29330
	fmul	%f17, %f0, %f0
	fmul	%f11, %f17, %f17
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.29331
fbgt_else.29330:
	fsub	%f18, %f16, %f0
	fmul	%f17, %f18, %f18
	fmul	%f11, %f17, %f17
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.29331:
	beqi	%a0, 0, bnei_else.29332
	j	bnei_cont.29333
bnei_else.29332:
	fneg	%f0, %f0
bnei_cont.29333:
	fblt	%f12, %fzero, fbgt_else.29334
	add	%a0, %zero, %k1
	j	fbgt_cont.29335
fbgt_else.29334:
	add	%a0, %zero, %zero
fbgt_cont.29335:
	fabs	%f11, %f12
	fdiv	%f1, %f11, %f15
	floor	%f1, %f1
	fmul	%f1, %f1, %f15
	fsub	%f1, %f11, %f1
	fblt	%f1, %f14, fbgt_else.29336
	beqi	%a0, 0, bnei_else.29338
	add	%a0, %zero, %zero
	j	fbgt_cont.29337
bnei_else.29338:
	add	%a0, %zero, %k1
bnei_cont.29339:
	j	fbgt_cont.29337
fbgt_else.29336:
fbgt_cont.29337:
	fblt	%f1, %f14, fbgt_else.29340
	fsub	%f1, %f1, %f14
	j	fbgt_cont.29341
fbgt_else.29340:
fbgt_cont.29341:
	fblt	%f1, %f16, fbgt_else.29342
	fsub	%f1, %f14, %f1
	j	fbgt_cont.29343
fbgt_else.29342:
fbgt_cont.29343:
	fblt	%f13, %f1, fbgt_else.29344
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f11, 468(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f18
	fsub	%f12, %f1, %f11
	flw	%f11, 467(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f17
	fadd	%f12, %f12, %f11
	flw	%f11, 466(%zero)
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f12, %f1
	j	fbgt_cont.29345
fbgt_else.29344:
	fsub	%f1, %f16, %f1
	fmul	%f17, %f1, %f1
	fmul	%f12, %f17, %f17
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f17
	fsub	%f11, %f30, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 463(%zero)
	fmul	%f1, %f1, %f17
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.29345:
	beqi	%a0, 0, bnei_else.29346
	j	bnei_cont.29347
bnei_else.29346:
	fneg	%f1, %f1
bnei_cont.29347:
	flw	%f17, 1(%v1)
	fabs	%f12, %f17
	fdiv	%f11, %f12, %f15
	floor	%f11, %f11
	fmul	%f11, %f11, %f15
	fsub	%f11, %f12, %f11
	fblt	%f11, %f14, fbgt_else.29348
	add	%a0, %zero, %zero
	j	fbgt_cont.29349
fbgt_else.29348:
	add	%a0, %zero, %k1
fbgt_cont.29349:
	fblt	%f11, %f14, fbgt_else.29350
	fsub	%f11, %f11, %f14
	j	fbgt_cont.29351
fbgt_else.29350:
fbgt_cont.29351:
	fblt	%f11, %f16, fbgt_else.29352
	beqi	%a0, 0, bnei_else.29354
	add	%a0, %zero, %zero
	j	fbgt_cont.29353
bnei_else.29354:
	add	%a0, %zero, %k1
bnei_cont.29355:
	j	fbgt_cont.29353
fbgt_else.29352:
fbgt_cont.29353:
	fblt	%f11, %f16, fbgt_else.29356
	fsub	%f11, %f14, %f11
	j	fbgt_cont.29357
fbgt_else.29356:
fbgt_cont.29357:
	fblt	%f13, %f11, fbgt_else.29358
	fmul	%f19, %f11, %f11
	fmul	%f18, %f19, %f19
	flw	%f11, 465(%zero)
	fmul	%f11, %f11, %f19
	fsub	%f12, %f30, %f11
	flw	%f11, 464(%zero)
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 463(%zero)
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
	j	fbgt_cont.29359
fbgt_else.29358:
	fsub	%f2, %f16, %f11
	fmul	%f19, %f2, %f2
	fmul	%f18, %f19, %f19
	flw	%f11, 468(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fsub	%f12, %f2, %f11
	flw	%f11, 467(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 466(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
fbgt_cont.29359:
	beqi	%a0, 0, bnei_else.29360
	j	bnei_cont.29361
bnei_else.29360:
	fneg	%f11, %f11
bnei_cont.29361:
	fblt	%f17, %fzero, fbgt_else.29362
	add	%a0, %zero, %k1
	j	fbgt_cont.29363
fbgt_else.29362:
	add	%a0, %zero, %zero
fbgt_cont.29363:
	fabs	%f17, %f17
	fdiv	%f12, %f17, %f15
	floor	%f12, %f12
	fmul	%f12, %f12, %f15
	fsub	%f12, %f17, %f12
	fblt	%f12, %f14, fbgt_else.29364
	beqi	%a0, 0, bnei_else.29366
	add	%a0, %zero, %zero
	j	fbgt_cont.29365
bnei_else.29366:
	add	%a0, %zero, %k1
bnei_cont.29367:
	j	fbgt_cont.29365
fbgt_else.29364:
fbgt_cont.29365:
	fblt	%f12, %f14, fbgt_else.29368
	fsub	%f12, %f12, %f14
	j	fbgt_cont.29369
fbgt_else.29368:
fbgt_cont.29369:
	fblt	%f12, %f16, fbgt_else.29370
	fsub	%f12, %f14, %f12
	j	fbgt_cont.29371
fbgt_else.29370:
fbgt_cont.29371:
	fblt	%f13, %f12, fbgt_else.29372
	fmul	%f2, %f12, %f12
	fmul	%f19, %f2, %f2
	flw	%f17, 468(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f2
	fsub	%f18, %f12, %f17
	flw	%f17, 467(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f19
	fadd	%f18, %f18, %f17
	flw	%f17, 466(%zero)
	fmul	%f12, %f17, %f12
	fmul	%f12, %f12, %f2
	fmul	%f12, %f12, %f19
	fsub	%f12, %f18, %f12
	j	fbgt_cont.29373
fbgt_else.29372:
	fsub	%f12, %f16, %f12
	fmul	%f19, %f12, %f12
	fmul	%f18, %f19, %f19
	flw	%f12, 465(%zero)
	fmul	%f12, %f12, %f19
	fsub	%f17, %f30, %f12
	flw	%f12, 464(%zero)
	fmul	%f12, %f12, %f18
	fadd	%f17, %f17, %f12
	flw	%f12, 463(%zero)
	fmul	%f12, %f12, %f19
	fmul	%f12, %f12, %f18
	fsub	%f12, %f17, %f12
fbgt_cont.29373:
	beqi	%a0, 0, bnei_else.29374
	j	bnei_cont.29375
bnei_else.29374:
	fneg	%f12, %f12
bnei_cont.29375:
	flw	%f19, 2(%v1)
	fabs	%f18, %f19
	fdiv	%f17, %f18, %f15
	floor	%f17, %f17
	fmul	%f17, %f17, %f15
	fsub	%f17, %f18, %f17
	fblt	%f17, %f14, fbgt_else.29376
	add	%a0, %zero, %zero
	j	fbgt_cont.29377
fbgt_else.29376:
	add	%a0, %zero, %k1
fbgt_cont.29377:
	fblt	%f17, %f14, fbgt_else.29378
	fsub	%f17, %f17, %f14
	j	fbgt_cont.29379
fbgt_else.29378:
fbgt_cont.29379:
	fblt	%f17, %f16, fbgt_else.29380
	beqi	%a0, 0, bnei_else.29382
	add	%a0, %zero, %zero
	j	fbgt_cont.29381
bnei_else.29382:
	add	%a0, %zero, %k1
bnei_cont.29383:
	j	fbgt_cont.29381
fbgt_else.29380:
fbgt_cont.29381:
	fblt	%f17, %f16, fbgt_else.29384
	fsub	%f17, %f14, %f17
	j	fbgt_cont.29385
fbgt_else.29384:
fbgt_cont.29385:
	fblt	%f13, %f17, fbgt_else.29386
	fmul	%f20, %f17, %f17
	fmul	%f2, %f20, %f20
	flw	%f17, 465(%zero)
	fmul	%f17, %f17, %f20
	fsub	%f18, %f30, %f17
	flw	%f17, 464(%zero)
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 463(%zero)
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
	j	fbgt_cont.29387
fbgt_else.29386:
	fsub	%f21, %f16, %f17
	fmul	%f20, %f21, %f21
	fmul	%f2, %f20, %f20
	flw	%f17, 468(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fsub	%f18, %f21, %f17
	flw	%f17, 467(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 466(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
fbgt_cont.29387:
	beqi	%a0, 0, bnei_else.29388
	j	bnei_cont.29389
bnei_else.29388:
	fneg	%f17, %f17
bnei_cont.29389:
	fblt	%f19, %fzero, fbgt_else.29390
	add	%a0, %zero, %k1
	j	fbgt_cont.29391
fbgt_else.29390:
	add	%a0, %zero, %zero
fbgt_cont.29391:
	fabs	%f19, %f19
	fdiv	%f18, %f19, %f15
	floor	%f18, %f18
	fmul	%f15, %f18, %f15
	fsub	%f15, %f19, %f15
	fblt	%f15, %f14, fbgt_else.29392
	beqi	%a0, 0, bnei_else.29394
	add	%a0, %zero, %zero
	j	fbgt_cont.29393
bnei_else.29394:
	add	%a0, %zero, %k1
bnei_cont.29395:
	j	fbgt_cont.29393
fbgt_else.29392:
fbgt_cont.29393:
	fblt	%f15, %f14, fbgt_else.29396
	fsub	%f15, %f15, %f14
	j	fbgt_cont.29397
fbgt_else.29396:
fbgt_cont.29397:
	fblt	%f15, %f16, fbgt_else.29398
	fsub	%f15, %f14, %f15
	j	fbgt_cont.29399
fbgt_else.29398:
fbgt_cont.29399:
	fblt	%f13, %f15, fbgt_else.29400
	fmul	%f18, %f15, %f15
	fmul	%f16, %f18, %f18
	flw	%f13, 468(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fsub	%f14, %f15, %f13
	flw	%f13, 467(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f16
	fadd	%f14, %f14, %f13
	flw	%f13, 466(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fmul	%f13, %f13, %f16
	fsub	%f13, %f14, %f13
	j	fbgt_cont.29401
fbgt_else.29400:
	fsub	%f13, %f16, %f15
	fmul	%f16, %f13, %f13
	fmul	%f15, %f16, %f16
	flw	%f13, 465(%zero)
	fmul	%f13, %f13, %f16
	fsub	%f14, %f30, %f13
	flw	%f13, 464(%zero)
	fmul	%f13, %f13, %f15
	fadd	%f14, %f14, %f13
	flw	%f13, 463(%zero)
	fmul	%f13, %f13, %f16
	fmul	%f13, %f13, %f15
	fsub	%f13, %f14, %f13
fbgt_cont.29401:
	beqi	%a0, 0, bnei_else.29402
	j	bnei_cont.29403
bnei_else.29402:
	fneg	%f13, %f13
bnei_cont.29403:
	fmul	%f18, %f11, %f17
	fmul	%f21, %f1, %f12
	fmul	%f15, %f21, %f17
	fmul	%f14, %f0, %f13
	fsub	%f16, %f15, %f14
	fmul	%f20, %f0, %f12
	fmul	%f15, %f20, %f17
	fmul	%f14, %f1, %f13
	fadd	%f19, %f15, %f14
	fmul	%f2, %f11, %f13
	fmul	%f15, %f21, %f13
	fmul	%f14, %f0, %f17
	fadd	%f15, %f15, %f14
	fmul	%f14, %f20, %f13
	fmul	%f13, %f1, %f17
	fsub	%f21, %f14, %f13
	fneg	%f20, %f12
	fmul	%f14, %f1, %f11
	fmul	%f22, %f0, %f11
	flw	%f13, 0(%v0)
	flw	%f12, 1(%v0)
	flw	%f11, 2(%v0)
	fmul	%f0, %f18, %f18
	fmul	%f1, %f13, %f0
	fmul	%f0, %f2, %f2
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f20
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 0(%v0)
	fmul	%f0, %f16, %f16
	fmul	%f1, %f13, %f0
	fmul	%f0, %f15, %f15
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f14, %f14
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f19, %f19
	fmul	%f1, %f13, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	flw	%f17, 462(%zero)
	fmul	%f0, %f13, %f16
	fmul	%f1, %f0, %f19
	fmul	%f0, %f12, %f15
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14
	fmul	%f0, %f0, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 0(%v1)
	fmul	%f13, %f13, %f18
	fmul	%f1, %f13, %f19
	fmul	%f12, %f12, %f2
	fmul	%f0, %f12, %f21
	fadd	%f1, %f1, %f0
	fmul	%f11, %f11, %f20
	fmul	%f0, %f11, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 1(%v1)
	fmul	%f1, %f13, %f16
	fmul	%f0, %f12, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2770:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.29505
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%fp, %v0, 0
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
	fblt	%f0, %fzero, fbgt_else.29506
	add	%s3, %zero, %zero
	j	fbgt_cont.29507
fbgt_else.29506:
	add	%s3, %zero, %k1
fbgt_cont.29507:
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
	beqi	%k0, 0, bnei_else.29508
	jal	min_caml_read_float
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%s0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%s0)
	j	bnei_cont.29509
bnei_else.29508:
bnei_cont.29509:
	beqi	%a3, 2, bnei_else.29510
	add	%s6, %zero, %s3
	j	bnei_cont.29511
bnei_else.29510:
	add	%s6, %zero, %k1
bnei_cont.29511:
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
	sw	%fp, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	sw	%ra, 12(%a0)
	beqi	%a3, 3, bnei_else.29512
	beqi	%a3, 2, bnei_else.29514
	j	bnei_cont.29513
bnei_else.29514:
	beqi	%s3, 0, bnei_else.29516
	add	%a0, %zero, %zero
	j	bnei_cont.29517
bnei_else.29516:
	add	%a0, %zero, %k1
bnei_cont.29517:
	flw	%f13, 0(%s1)
	fmul	%f1, %f13, %f13
	flw	%f12, 1(%s1)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 2(%s1)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.29518
	add	%a2, %zero, %k1
	j	fbeq_cont.29519
fbeq_else.29518:
	add	%a2, %zero, %zero
fbeq_cont.29519:
	beqi	%a2, 0, bnei_else.29520
	fmov	%f0, %f30
	j	bnei_cont.29521
bnei_else.29520:
	beqi	%a0, 0, bnei_else.29522
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.29523
bnei_else.29522:
	fdiv	%f0, %f30, %f1
bnei_cont.29523:
bnei_cont.29521:
	fmul	%f1, %f13, %f0
	fsw	%f1, 0(%s1)
	fmul	%f1, %f12, %f0
	fsw	%f1, 1(%s1)
	fmul	%f0, %f11, %f0
	fsw	%f0, 2(%s1)
bnei_cont.29515:
	j	bnei_cont.29513
bnei_else.29512:
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.29524
	add	%a0, %zero, %k1
	j	fbeq_cont.29525
fbeq_else.29524:
	add	%a0, %zero, %zero
fbeq_cont.29525:
	beqi	%a0, 0, bnei_else.29526
	fmov	%f0, %fzero
	j	bnei_cont.29527
bnei_else.29526:
	fbne	%f1, %fzero, fbeq_else.29528
	add	%a0, %zero, %k1
	j	fbeq_cont.29529
fbeq_else.29528:
	add	%a0, %zero, %zero
fbeq_cont.29529:
	beqi	%a0, 0, bnei_else.29530
	fmov	%f0, %fzero
	j	bnei_cont.29531
bnei_else.29530:
	fblt	%fzero, %f1, fbgt_else.29532
	add	%a0, %zero, %zero
	j	fbgt_cont.29533
fbgt_else.29532:
	add	%a0, %zero, %k1
fbgt_cont.29533:
	beqi	%a0, 0, bnei_else.29534
	fmov	%f0, %f30
	j	bnei_cont.29535
bnei_else.29534:
	flw	%f0, 460(%zero)
bnei_cont.29535:
bnei_cont.29531:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.29527:
	fsw	%f0, 0(%s1)
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.29536
	add	%a0, %zero, %k1
	j	fbeq_cont.29537
fbeq_else.29536:
	add	%a0, %zero, %zero
fbeq_cont.29537:
	beqi	%a0, 0, bnei_else.29538
	fmov	%f0, %fzero
	j	bnei_cont.29539
bnei_else.29538:
	fbne	%f1, %fzero, fbeq_else.29540
	add	%a0, %zero, %k1
	j	fbeq_cont.29541
fbeq_else.29540:
	add	%a0, %zero, %zero
fbeq_cont.29541:
	beqi	%a0, 0, bnei_else.29542
	fmov	%f0, %fzero
	j	bnei_cont.29543
bnei_else.29542:
	fblt	%fzero, %f1, fbgt_else.29544
	add	%a0, %zero, %zero
	j	fbgt_cont.29545
fbgt_else.29544:
	add	%a0, %zero, %k1
fbgt_cont.29545:
	beqi	%a0, 0, bnei_else.29546
	fmov	%f0, %f30
	j	bnei_cont.29547
bnei_else.29546:
	flw	%f0, 460(%zero)
bnei_cont.29547:
bnei_cont.29543:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.29539:
	fsw	%f0, 1(%s1)
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.29548
	add	%a0, %zero, %k1
	j	fbeq_cont.29549
fbeq_else.29548:
	add	%a0, %zero, %zero
fbeq_cont.29549:
	beqi	%a0, 0, bnei_else.29550
	fmov	%f0, %fzero
	j	bnei_cont.29551
bnei_else.29550:
	fbne	%f1, %fzero, fbeq_else.29552
	add	%a0, %zero, %k1
	j	fbeq_cont.29553
fbeq_else.29552:
	add	%a0, %zero, %zero
fbeq_cont.29553:
	beqi	%a0, 0, bnei_else.29554
	fmov	%f0, %fzero
	j	bnei_cont.29555
bnei_else.29554:
	fblt	%fzero, %f1, fbgt_else.29556
	add	%a0, %zero, %zero
	j	fbgt_cont.29557
fbgt_else.29556:
	add	%a0, %zero, %k1
fbgt_cont.29557:
	beqi	%a0, 0, bnei_else.29558
	fmov	%f0, %f30
	j	bnei_cont.29559
bnei_else.29558:
	flw	%f0, 460(%zero)
bnei_cont.29559:
bnei_cont.29555:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.29551:
	fsw	%f0, 2(%s1)
bnei_cont.29513:
	beqi	%k0, 0, bnei_else.29560
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	rotate_quadratic_matrix.2767
	j	bnei_cont.29561
bnei_else.29560:
bnei_cont.29561:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.29505:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	jr	%ra
read_object.2772:
	add	%s7, %zero, %v0
	add	%t7, %zero, %ra
	blti	%s7, 60, bgti_else.29639
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29639:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29641
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29642
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29642:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29644
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29645
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29645:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29647
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29648
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29648:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29650
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29651
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29651:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29653
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29654
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29654:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29656
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29657
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29657:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29659
	addi	%s7, %s7, 1
	blti	%s7, 60, bgti_else.29660
	add	%ra, %zero, %t7
	jr	%ra
bgti_else.29660:
	addi	%v0, %s7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.29662
	addi	%v0, %s7, 1
	add	%ra, %zero, %t7
	j	read_object.2772
bnei_else.29662:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29659:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29656:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29653:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29650:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29647:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29644:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
bnei_else.29641:
	add	%ra, %zero, %t7
	sw	%s7, 0(%zero)
	jr	%ra
read_net_item.2776:
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
	beqi	%t0, -1, bnei_else.29736
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.29737
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.29739
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.29741
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2776
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.29742
bnei_else.29741:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.29742:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.29740
bnei_else.29739:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.29740:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.29738
bnei_else.29737:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.29738:
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
bnei_else.29736:
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
read_or_network.2778:
	sw	%v0, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	addi	%a3, %zero, -1
	beqi	%a2, -1, bnei_else.29813
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.29815
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.29817
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%k0, 2(%v1)
	j	bnei_cont.29818
bnei_else.29817:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.29818:
	sw	%fp, 1(%v1)
	j	bnei_cont.29816
bnei_else.29815:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.29816:
	sw	%a2, 0(%v1)
	j	bnei_cont.29814
bnei_else.29813:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.29814:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.29819
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.29820
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.29822
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2776
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%fp, 1(%t1)
	j	bnei_cont.29823
bnei_else.29822:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.29823:
	sw	%a2, 0(%t1)
	j	bnei_cont.29821
bnei_else.29820:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.29821:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.29824
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2778
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.29825
bnei_else.29824:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.29825:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.29819:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_create_array
read_and_network.2780:
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra
	jal	min_caml_read_int
	addi	%fp, %v0, 0
	addi	%k0, %zero, -1
	beqi	%fp, -1, bnei_else.29873
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.29875
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.29877
	addi	%v0, %zero, 3
	jal	read_net_item.2776
	sw	%s1, 2(%v0)
	j	bnei_cont.29878
bnei_else.29877:
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.29878:
	sw	%s0, 1(%v0)
	j	bnei_cont.29876
bnei_else.29875:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.29876:
	sw	%fp, 0(%v0)
	j	bnei_cont.29874
bnei_else.29873:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.29874:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.29879
	sw	%v0, 83(%a2)
	addi	%s0, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.29880
	jal	min_caml_read_int
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.29882
	addi	%v0, %zero, 2
	jal	read_net_item.2776
	sw	%fp, 1(%v0)
	j	bnei_cont.29883
bnei_else.29882:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.29883:
	sw	%a2, 0(%v0)
	j	bnei_cont.29881
bnei_else.29880:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.29881:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.29884
	sw	%v0, 83(%s0)
	addi	%fp, %s0, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.29885
	addi	%v0, %k1, 0
	jal	read_net_item.2776
	sw	%a2, 0(%v0)
	j	bnei_cont.29886
bnei_else.29885:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.29886:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.29887
	sw	%v0, 83(%fp)
	addi	%a2, %fp, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.29888
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2780
bnei_else.29888:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.29887:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.29884:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.29879:
	add	%ra, %zero, %a3
	jr	%ra
solver_second.2818:
	flw	%f20, 0(%v1)
	flw	%f19, 1(%v1)
	flw	%f21, 2(%v1)
	fmul	%f11, %f20, %f20
	lw	%a2, 9(%v0)
	lw	%fp, 6(%v0)
	lw	%a0, 4(%v0)
	lw	%a3, 3(%v0)
	lw	%a1, 1(%v0)
	flw	%f18, 0(%a0)
	fmul	%f12, %f11, %f18
	fmul	%f11, %f19, %f19
	flw	%f17, 1(%a0)
	fmul	%f11, %f11, %f17
	fadd	%f12, %f12, %f11
	fmul	%f11, %f21, %f21
	flw	%f16, 2(%a0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	beqi	%a3, 0, bnei_else.29933
	fmul	%f13, %f19, %f21
	flw	%f12, 0(%a2)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f21, %f20
	flw	%f11, 1(%a2)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f20, %f19
	flw	%f11, 2(%a2)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.29934
bnei_else.29933:
bnei_cont.29934:
	fbne	%f11, %fzero, fbeq_else.29935
	add	%a0, %zero, %k1
	j	fbeq_cont.29936
fbeq_else.29935:
	add	%a0, %zero, %zero
fbeq_cont.29936:
	beqi	%a0, 0, bnei_else.29937
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.29937:
	fmul	%f12, %f20, %f0
	fmul	%f13, %f12, %f18
	fmul	%f12, %f19, %f1
	fmul	%f12, %f12, %f17
	fadd	%f13, %f13, %f12
	fmul	%f12, %f21, %f2
	fmul	%f12, %f12, %f16
	fadd	%f12, %f13, %f12
	beqi	%a3, 0, bnei_else.29938
	fmul	%f14, %f21, %f1
	fmul	%f13, %f19, %f2
	fadd	%f14, %f14, %f13
	flw	%f13, 0(%a2)
	fmul	%f15, %f14, %f13
	fmul	%f14, %f20, %f2
	fmul	%f13, %f21, %f0
	fadd	%f14, %f14, %f13
	flw	%f13, 1(%a2)
	fmul	%f13, %f14, %f13
	fadd	%f15, %f15, %f13
	fmul	%f14, %f20, %f1
	fmul	%f13, %f19, %f0
	fadd	%f14, %f14, %f13
	flw	%f13, 2(%a2)
	fmul	%f13, %f14, %f13
	fadd	%f14, %f15, %f13
	flw	%f13, 465(%zero)
	fmul	%f13, %f14, %f13
	fadd	%f12, %f12, %f13
	j	bnei_cont.29939
bnei_else.29938:
bnei_cont.29939:
	fmul	%f13, %f0, %f0
	fmul	%f14, %f13, %f18
	fmul	%f13, %f1, %f1
	fmul	%f13, %f13, %f17
	fadd	%f14, %f14, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f13, %f16
	fadd	%f13, %f14, %f13
	beqi	%a3, 0, bnei_else.29940
	fmul	%f15, %f1, %f2
	flw	%f14, 0(%a2)
	fmul	%f14, %f15, %f14
	fadd	%f15, %f13, %f14
	fmul	%f14, %f2, %f0
	flw	%f13, 1(%a2)
	fmul	%f13, %f14, %f13
	fadd	%f13, %f15, %f13
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f13, %f13, %f0
	j	bnei_cont.29941
bnei_else.29940:
bnei_cont.29941:
	beqi	%a1, 3, bnei_else.29942
	j	bnei_cont.29943
bnei_else.29942:
	fsub	%f13, %f13, %f30
bnei_cont.29943:
	fmul	%f1, %f12, %f12
	fmul	%f0, %f11, %f13
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.29944
	add	%a0, %zero, %zero
	j	fbgt_cont.29945
fbgt_else.29944:
	add	%a0, %zero, %k1
fbgt_cont.29945:
	beqi	%a0, 0, bnei_else.29946
	fsqrt	%f0, %f0
	beqi	%fp, 0, bnei_else.29947
	j	bnei_cont.29948
bnei_else.29947:
	fneg	%f0, %f0
bnei_cont.29948:
	fsub	%f0, %f0, %f12
	fdiv	%f0, %f0, %f11
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.29946:
	add	%v0, %zero, %zero
	jr	%ra
solver_fast2.2865:
	lw	%a0, 12(%v0)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	flw	%f13, 2(%a3)
	lw	%a0, 1(%v1)
	lw	%k0, 0(%v1)
	add	%at, %a0, %v0
	lw	%s0, 0(%at)
	beqi	%a1, 1, bnei_else.30052
	beqi	%a1, 2, bnei_else.30053
	flw	%f12, 0(%s0)
	fbne	%f12, %fzero, fbeq_else.30054
	add	%a0, %zero, %k1
	j	fbeq_cont.30055
fbeq_else.30054:
	add	%a0, %zero, %zero
fbeq_cont.30055:
	beqi	%a0, 0, bnei_else.30056
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30056:
	flw	%f0, 1(%s0)
	fmul	%f1, %f0, %f15
	flw	%f0, 2(%s0)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%s0)
	fmul	%f0, %f0, %f13
	fadd	%f11, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.30057
	add	%a0, %zero, %zero
	j	fbgt_cont.30058
fbgt_else.30057:
	add	%a0, %zero, %k1
fbgt_cont.30058:
	beqi	%a0, 0, bnei_else.30059
	beqi	%a2, 0, bnei_else.30060
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.30061
bnei_else.30060:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%s0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.30061:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.30059:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30053:
	flw	%f1, 0(%s0)
	fblt	%f1, %fzero, fbgt_else.30062
	add	%a0, %zero, %zero
	j	fbgt_cont.30063
fbgt_else.30062:
	add	%a0, %zero, %k1
fbgt_cont.30063:
	beqi	%a0, 0, bnei_else.30064
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.30064:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30052:
	flw	%f0, 0(%s0)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%s0)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%k0)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%fp)
	fblt	%f0, %f12, fbgt_else.30065
	add	%a0, %zero, %zero
	j	fbgt_cont.30066
fbgt_else.30065:
	add	%a0, %zero, %k1
fbgt_cont.30066:
	beqi	%a0, 0, bnei_else.30067
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.30069
	add	%a0, %zero, %zero
	j	fbgt_cont.30070
fbgt_else.30069:
	add	%a0, %zero, %k1
fbgt_cont.30070:
	beqi	%a0, 0, bnei_else.30071
	fbne	%f17, %fzero, fbeq_else.30073
	add	%a0, %zero, %k1
	j	fbeq_cont.30074
fbeq_else.30073:
	add	%a0, %zero, %zero
fbeq_cont.30074:
	beqi	%a0, 0, bnei_else.30075
	add	%a0, %zero, %zero
	j	bnei_cont.30068
bnei_else.30075:
	add	%a0, %zero, %k1
bnei_cont.30076:
	j	bnei_cont.30068
bnei_else.30071:
	add	%a0, %zero, %zero
bnei_cont.30072:
	j	bnei_cont.30068
bnei_else.30067:
	add	%a0, %zero, %zero
bnei_cont.30068:
	beqi	%a0, 0, bnei_else.30077
	fsw	%f16, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.30077:
	flw	%f0, 2(%s0)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%s0)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%k0)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%fp)
	fblt	%f0, %f17, fbgt_else.30078
	add	%a0, %zero, %zero
	j	fbgt_cont.30079
fbgt_else.30078:
	add	%a0, %zero, %k1
fbgt_cont.30079:
	beqi	%a0, 0, bnei_else.30080
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.30082
	add	%a0, %zero, %zero
	j	fbgt_cont.30083
fbgt_else.30082:
	add	%a0, %zero, %k1
fbgt_cont.30083:
	beqi	%a0, 0, bnei_else.30084
	fbne	%f19, %fzero, fbeq_else.30086
	add	%a0, %zero, %k1
	j	fbeq_cont.30087
fbeq_else.30086:
	add	%a0, %zero, %zero
fbeq_cont.30087:
	beqi	%a0, 0, bnei_else.30088
	add	%a0, %zero, %zero
	j	bnei_cont.30081
bnei_else.30088:
	add	%a0, %zero, %k1
bnei_cont.30089:
	j	bnei_cont.30081
bnei_else.30084:
	add	%a0, %zero, %zero
bnei_cont.30085:
	j	bnei_cont.30081
bnei_else.30080:
	add	%a0, %zero, %zero
bnei_cont.30081:
	beqi	%a0, 0, bnei_else.30090
	fsw	%f16, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.30090:
	flw	%f0, 4(%s0)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%s0)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.30091
	add	%a0, %zero, %zero
	j	fbgt_cont.30092
fbgt_else.30091:
	add	%a0, %zero, %k1
fbgt_cont.30092:
	beqi	%a0, 0, bnei_else.30093
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.30095
	add	%a0, %zero, %zero
	j	fbgt_cont.30096
fbgt_else.30095:
	add	%a0, %zero, %k1
fbgt_cont.30096:
	beqi	%a0, 0, bnei_else.30097
	fbne	%f13, %fzero, fbeq_else.30099
	add	%a0, %zero, %k1
	j	fbeq_cont.30100
fbeq_else.30099:
	add	%a0, %zero, %zero
fbeq_cont.30100:
	beqi	%a0, 0, bnei_else.30101
	add	%a0, %zero, %zero
	j	bnei_cont.30094
bnei_else.30101:
	add	%a0, %zero, %k1
bnei_cont.30102:
	j	bnei_cont.30094
bnei_else.30097:
	add	%a0, %zero, %zero
bnei_cont.30098:
	j	bnei_cont.30094
bnei_else.30093:
	add	%a0, %zero, %zero
bnei_cont.30094:
	beqi	%a0, 0, bnei_else.30103
	fsw	%f1, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.30103:
	add	%v0, %zero, %zero
	jr	%ra
iter_setup_dirvec_constants.2877:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.30281
	lw	%a3, 12(%a1)
	lw	%k0, 1(%a0)
	lw	%fp, 0(%a0)
	lw	%s2, 9(%a3)
	lw	%s1, 6(%a3)
	lw	%s0, 4(%a3)
	lw	%s3, 3(%a3)
	lw	%a3, 1(%a3)
	beqi	%a3, 1, bnei_else.30282
	beqi	%a3, 2, bnei_else.30284
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	flw	%f18, 2(%fp)
	fmul	%f0, %f16, %f16
	flw	%f14, 0(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17
	flw	%f12, 1(%s0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	flw	%f13, 2(%s0)
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
	beqi	%s3, 0, bnei_else.30286
	fmul	%f11, %f17, %f18
	flw	%f1, 0(%s2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f17
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.30287
bnei_else.30286:
bnei_cont.30287:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.30288
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f12
	fmul	%f1, %f16, %f14
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f17, %f12
	fmul	%f1, %f16, %f15
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.30289
bnei_else.30288:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.30289:
	fbne	%f0, %fzero, fbeq_else.30290
	add	%a3, %zero, %k1
	j	fbeq_cont.30291
fbeq_else.30290:
	add	%a3, %zero, %zero
fbeq_cont.30291:
	beqi	%a3, 0, bnei_else.30292
	j	bnei_cont.30293
bnei_else.30292:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.30293:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.30283
bnei_else.30284:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	fmul	%f1, %f0, %f13
	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	flw	%f11, 2(%s0)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.30294
	add	%a3, %zero, %zero
	j	fbgt_cont.30295
fbgt_else.30294:
	add	%a3, %zero, %k1
fbgt_cont.30295:
	beqi	%a3, 0, bnei_else.30296
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.30297
bnei_else.30296:
	fsw	%fzero, 0(%v0)
bnei_cont.30297:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.30285:
	j	bnei_cont.30283
bnei_else.30282:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.30298
	add	%a3, %zero, %k1
	j	fbeq_cont.30299
fbeq_else.30298:
	add	%a3, %zero, %zero
fbeq_cont.30299:
	beqi	%a3, 0, bnei_else.30300
	fsw	%fzero, 1(%v0)
	j	bnei_cont.30301
bnei_else.30300:
	fblt	%f1, %fzero, fbgt_else.30302
	add	%a3, %zero, %zero
	j	fbgt_cont.30303
fbgt_else.30302:
	add	%a3, %zero, %k1
fbgt_cont.30303:
	beqi	%s1, 0, bnei_else.30304
	beqi	%a3, 0, bnei_else.30306
	add	%a3, %zero, %zero
	j	bnei_cont.30305
bnei_else.30306:
	add	%a3, %zero, %k1
bnei_cont.30307:
	j	bnei_cont.30305
bnei_else.30304:
bnei_cont.30305:
	flw	%f0, 0(%s0)
	beqi	%a3, 0, bnei_else.30308
	j	bnei_cont.30309
bnei_else.30308:
	fneg	%f0, %f0
bnei_cont.30309:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.30301:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.30310
	add	%a3, %zero, %k1
	j	fbeq_cont.30311
fbeq_else.30310:
	add	%a3, %zero, %zero
fbeq_cont.30311:
	beqi	%a3, 0, bnei_else.30312
	fsw	%fzero, 3(%v0)
	j	bnei_cont.30313
bnei_else.30312:
	fblt	%f1, %fzero, fbgt_else.30314
	add	%a3, %zero, %zero
	j	fbgt_cont.30315
fbgt_else.30314:
	add	%a3, %zero, %k1
fbgt_cont.30315:
	beqi	%s1, 0, bnei_else.30316
	beqi	%a3, 0, bnei_else.30318
	add	%a3, %zero, %zero
	j	bnei_cont.30317
bnei_else.30318:
	add	%a3, %zero, %k1
bnei_cont.30319:
	j	bnei_cont.30317
bnei_else.30316:
bnei_cont.30317:
	flw	%f0, 1(%s0)
	beqi	%a3, 0, bnei_else.30320
	j	bnei_cont.30321
bnei_else.30320:
	fneg	%f0, %f0
bnei_cont.30321:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.30313:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.30322
	add	%a3, %zero, %k1
	j	fbeq_cont.30323
fbeq_else.30322:
	add	%a3, %zero, %zero
fbeq_cont.30323:
	beqi	%a3, 0, bnei_else.30324
	fsw	%fzero, 5(%v0)
	j	bnei_cont.30325
bnei_else.30324:
	fblt	%f1, %fzero, fbgt_else.30326
	add	%a3, %zero, %zero
	j	fbgt_cont.30327
fbgt_else.30326:
	add	%a3, %zero, %k1
fbgt_cont.30327:
	beqi	%s1, 0, bnei_else.30328
	beqi	%a3, 0, bnei_else.30330
	add	%a3, %zero, %zero
	j	bnei_cont.30329
bnei_else.30330:
	add	%a3, %zero, %k1
bnei_cont.30331:
	j	bnei_cont.30329
bnei_else.30328:
bnei_cont.30329:
	flw	%f0, 2(%s0)
	beqi	%a3, 0, bnei_else.30332
	j	bnei_cont.30333
bnei_else.30332:
	fneg	%f0, %f0
bnei_cont.30333:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.30325:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.30283:
	addi	%a3, %a1, -1
	blti	%a3, 0, bgti_else.30334
	lw	%a1, 12(%a3)
	lw	%s2, 9(%a1)
	lw	%s1, 6(%a1)
	lw	%s0, 4(%a1)
	lw	%s3, 3(%a1)
	lw	%a1, 1(%a1)
	beqi	%a1, 1, bnei_else.30335
	beqi	%a1, 2, bnei_else.30337
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	flw	%f18, 2(%fp)
	fmul	%f0, %f16, %f16
	flw	%f14, 0(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17
	flw	%f12, 1(%s0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	flw	%f13, 2(%s0)
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
	beqi	%s3, 0, bnei_else.30339
	fmul	%f11, %f17, %f18
	flw	%f1, 0(%s2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f17
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.30340
bnei_else.30339:
bnei_cont.30340:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.30341
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f12
	fmul	%f1, %f16, %f14
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f17, %f12
	fmul	%f1, %f16, %f15
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.30342
bnei_else.30341:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.30342:
	fbne	%f0, %fzero, fbeq_else.30343
	add	%a1, %zero, %k1
	j	fbeq_cont.30344
fbeq_else.30343:
	add	%a1, %zero, %zero
fbeq_cont.30344:
	beqi	%a1, 0, bnei_else.30345
	j	bnei_cont.30346
bnei_else.30345:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.30346:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.30336
bnei_else.30337:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	fmul	%f1, %f0, %f13
	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	flw	%f11, 2(%s0)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.30347
	add	%a1, %zero, %zero
	j	fbgt_cont.30348
fbgt_else.30347:
	add	%a1, %zero, %k1
fbgt_cont.30348:
	beqi	%a1, 0, bnei_else.30349
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.30350
bnei_else.30349:
	fsw	%fzero, 0(%v0)
bnei_cont.30350:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.30338:
	j	bnei_cont.30336
bnei_else.30335:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.30351
	add	%a1, %zero, %k1
	j	fbeq_cont.30352
fbeq_else.30351:
	add	%a1, %zero, %zero
fbeq_cont.30352:
	beqi	%a1, 0, bnei_else.30353
	fsw	%fzero, 1(%v0)
	j	bnei_cont.30354
bnei_else.30353:
	fblt	%f1, %fzero, fbgt_else.30355
	add	%a1, %zero, %zero
	j	fbgt_cont.30356
fbgt_else.30355:
	add	%a1, %zero, %k1
fbgt_cont.30356:
	beqi	%s1, 0, bnei_else.30357
	beqi	%a1, 0, bnei_else.30359
	add	%a1, %zero, %zero
	j	bnei_cont.30358
bnei_else.30359:
	add	%a1, %zero, %k1
bnei_cont.30360:
	j	bnei_cont.30358
bnei_else.30357:
bnei_cont.30358:
	flw	%f0, 0(%s0)
	beqi	%a1, 0, bnei_else.30361
	j	bnei_cont.30362
bnei_else.30361:
	fneg	%f0, %f0
bnei_cont.30362:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.30354:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.30363
	add	%a1, %zero, %k1
	j	fbeq_cont.30364
fbeq_else.30363:
	add	%a1, %zero, %zero
fbeq_cont.30364:
	beqi	%a1, 0, bnei_else.30365
	fsw	%fzero, 3(%v0)
	j	bnei_cont.30366
bnei_else.30365:
	fblt	%f1, %fzero, fbgt_else.30367
	add	%a1, %zero, %zero
	j	fbgt_cont.30368
fbgt_else.30367:
	add	%a1, %zero, %k1
fbgt_cont.30368:
	beqi	%s1, 0, bnei_else.30369
	beqi	%a1, 0, bnei_else.30371
	add	%a1, %zero, %zero
	j	bnei_cont.30370
bnei_else.30371:
	add	%a1, %zero, %k1
bnei_cont.30372:
	j	bnei_cont.30370
bnei_else.30369:
bnei_cont.30370:
	flw	%f0, 1(%s0)
	beqi	%a1, 0, bnei_else.30373
	j	bnei_cont.30374
bnei_else.30373:
	fneg	%f0, %f0
bnei_cont.30374:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.30366:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.30375
	add	%a1, %zero, %k1
	j	fbeq_cont.30376
fbeq_else.30375:
	add	%a1, %zero, %zero
fbeq_cont.30376:
	beqi	%a1, 0, bnei_else.30377
	fsw	%fzero, 5(%v0)
	j	bnei_cont.30378
bnei_else.30377:
	fblt	%f1, %fzero, fbgt_else.30379
	add	%a1, %zero, %zero
	j	fbgt_cont.30380
fbgt_else.30379:
	add	%a1, %zero, %k1
fbgt_cont.30380:
	beqi	%s1, 0, bnei_else.30381
	beqi	%a1, 0, bnei_else.30383
	add	%a1, %zero, %zero
	j	bnei_cont.30382
bnei_else.30383:
	add	%a1, %zero, %k1
bnei_cont.30384:
	j	bnei_cont.30382
bnei_else.30381:
bnei_cont.30382:
	flw	%f0, 2(%s0)
	beqi	%a1, 0, bnei_else.30385
	j	bnei_cont.30386
bnei_else.30385:
	fneg	%f0, %f0
bnei_cont.30386:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.30378:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.30336:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.30334:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.30281:
	add	%ra, %zero, %a2
	jr	%ra
setup_dirvec_constants.2880:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 0(%zero)
	addi	%a3, %a2, -1
	blti	%a3, 0, bgti_else.30484
	lw	%a2, 12(%a3)
	lw	%fp, 1(%a0)
	lw	%s0, 0(%a0)
	lw	%s2, 9(%a2)
	lw	%s1, 6(%a2)
	lw	%k0, 4(%a2)
	lw	%s3, 3(%a2)
	lw	%a2, 1(%a2)
	beqi	%a2, 1, bnei_else.30485
	beqi	%a2, 2, bnei_else.30487
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f16, 0(%s0)
	flw	%f17, 1(%s0)
	flw	%f18, 2(%s0)
	fmul	%f0, %f16, %f16
	flw	%f14, 0(%k0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17
	flw	%f12, 1(%k0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	flw	%f13, 2(%k0)
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
	beqi	%s3, 0, bnei_else.30489
	fmul	%f11, %f17, %f18
	flw	%f1, 0(%s2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f17
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.30490
bnei_else.30489:
bnei_cont.30490:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.30491
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f12
	fmul	%f1, %f16, %f14
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f17, %f12
	fmul	%f1, %f16, %f15
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.30492
bnei_else.30491:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.30492:
	fbne	%f0, %fzero, fbeq_else.30493
	add	%a2, %zero, %k1
	j	fbeq_cont.30494
fbeq_else.30493:
	add	%a2, %zero, %zero
fbeq_cont.30494:
	beqi	%a2, 0, bnei_else.30495
	j	bnei_cont.30496
bnei_else.30495:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.30496:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.30486
bnei_else.30487:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%s0)
	flw	%f13, 0(%k0)
	fmul	%f1, %f0, %f13
	flw	%f0, 1(%s0)
	flw	%f12, 1(%k0)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s0)
	flw	%f11, 2(%k0)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.30497
	add	%a2, %zero, %zero
	j	fbgt_cont.30498
fbgt_else.30497:
	add	%a2, %zero, %k1
fbgt_cont.30498:
	beqi	%a2, 0, bnei_else.30499
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.30500
bnei_else.30499:
	fsw	%fzero, 0(%v0)
bnei_cont.30500:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.30488:
	j	bnei_cont.30486
bnei_else.30485:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.30501
	add	%a2, %zero, %k1
	j	fbeq_cont.30502
fbeq_else.30501:
	add	%a2, %zero, %zero
fbeq_cont.30502:
	beqi	%a2, 0, bnei_else.30503
	fsw	%fzero, 1(%v0)
	j	bnei_cont.30504
bnei_else.30503:
	fblt	%f1, %fzero, fbgt_else.30505
	add	%a2, %zero, %zero
	j	fbgt_cont.30506
fbgt_else.30505:
	add	%a2, %zero, %k1
fbgt_cont.30506:
	beqi	%s1, 0, bnei_else.30507
	beqi	%a2, 0, bnei_else.30509
	add	%a2, %zero, %zero
	j	bnei_cont.30508
bnei_else.30509:
	add	%a2, %zero, %k1
bnei_cont.30510:
	j	bnei_cont.30508
bnei_else.30507:
bnei_cont.30508:
	flw	%f0, 0(%k0)
	beqi	%a2, 0, bnei_else.30511
	j	bnei_cont.30512
bnei_else.30511:
	fneg	%f0, %f0
bnei_cont.30512:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.30504:
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.30513
	add	%a2, %zero, %k1
	j	fbeq_cont.30514
fbeq_else.30513:
	add	%a2, %zero, %zero
fbeq_cont.30514:
	beqi	%a2, 0, bnei_else.30515
	fsw	%fzero, 3(%v0)
	j	bnei_cont.30516
bnei_else.30515:
	fblt	%f1, %fzero, fbgt_else.30517
	add	%a2, %zero, %zero
	j	fbgt_cont.30518
fbgt_else.30517:
	add	%a2, %zero, %k1
fbgt_cont.30518:
	beqi	%s1, 0, bnei_else.30519
	beqi	%a2, 0, bnei_else.30521
	add	%a2, %zero, %zero
	j	bnei_cont.30520
bnei_else.30521:
	add	%a2, %zero, %k1
bnei_cont.30522:
	j	bnei_cont.30520
bnei_else.30519:
bnei_cont.30520:
	flw	%f0, 1(%k0)
	beqi	%a2, 0, bnei_else.30523
	j	bnei_cont.30524
bnei_else.30523:
	fneg	%f0, %f0
bnei_cont.30524:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.30516:
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.30525
	add	%a2, %zero, %k1
	j	fbeq_cont.30526
fbeq_else.30525:
	add	%a2, %zero, %zero
fbeq_cont.30526:
	beqi	%a2, 0, bnei_else.30527
	fsw	%fzero, 5(%v0)
	j	bnei_cont.30528
bnei_else.30527:
	fblt	%f1, %fzero, fbgt_else.30529
	add	%a2, %zero, %zero
	j	fbgt_cont.30530
fbgt_else.30529:
	add	%a2, %zero, %k1
fbgt_cont.30530:
	beqi	%s1, 0, bnei_else.30531
	beqi	%a2, 0, bnei_else.30533
	add	%a2, %zero, %zero
	j	bnei_cont.30532
bnei_else.30533:
	add	%a2, %zero, %k1
bnei_cont.30534:
	j	bnei_cont.30532
bnei_else.30531:
bnei_cont.30532:
	flw	%f0, 2(%k0)
	beqi	%a2, 0, bnei_else.30535
	j	bnei_cont.30536
bnei_else.30535:
	fneg	%f0, %f0
bnei_cont.30536:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.30528:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.30486:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.30484:
	add	%ra, %zero, %a1
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.30567
	lw	%a1, 12(%v1)
	lw	%k0, 10(%a1)
	lw	%a2, 9(%a1)
	lw	%a0, 5(%a1)
	lw	%fp, 4(%a1)
	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	flw	%f1, 0(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%k0)
	flw	%f1, 1(%v0)
	flw	%f0, 1(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%k0)
	flw	%f1, 2(%v0)
	flw	%f0, 2(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%k0)
	beqi	%a1, 2, bnei_else.30568
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.30570
	j	bnei_cont.30569
bgt_else.30570:
	flw	%f14, 0(%k0)
	flw	%f13, 1(%k0)
	flw	%f12, 2(%k0)
	fmul	%f1, %f14, %f14
	flw	%f0, 0(%fp)
	fmul	%f11, %f1, %f0
	fmul	%f1, %f13, %f13
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f12, %f12
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	beqi	%a3, 0, bnei_else.30572
	fmul	%f11, %f13, %f12
	flw	%f1, 0(%a2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f12, %f14
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f14, %f13
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.30573
bnei_else.30572:
bnei_cont.30573:
	beqi	%a1, 3, bnei_else.30574
	j	bnei_cont.30575
bnei_else.30574:
	fsub	%f0, %f0, %f30
bnei_cont.30575:
	fsw	%f0, 3(%k0)
bgt_cont.30571:
	j	bnei_cont.30569
bnei_else.30568:
	flw	%f1, 0(%k0)
	flw	%f12, 1(%k0)
	flw	%f11, 2(%k0)
	flw	%f0, 0(%fp)
	fmul	%f1, %f0, %f1
	flw	%f0, 1(%fp)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f11
	fadd	%f0, %f1, %f0
	fsw	%f0, 3(%k0)
bnei_cont.30569:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.30567:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.30716
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f11, 0(%a0)
	fsub	%f14, %f0, %f11
	flw	%f11, 1(%a0)
	fsub	%f15, %f1, %f11
	flw	%f11, 2(%a0)
	fsub	%f16, %f2, %f11
	beqi	%a2, 1, bnei_else.30717
	beqi	%a2, 2, bnei_else.30719
	fmul	%f12, %f14, %f14
	flw	%f11, 0(%k0)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15
	flw	%f11, 1(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f16, %f16
	flw	%f11, 2(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	beqi	%fp, 0, bnei_else.30721
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%a3)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.30722
bnei_else.30721:
bnei_cont.30722:
	beqi	%a2, 3, bnei_else.30723
	j	bnei_cont.30724
bnei_else.30723:
	fsub	%f11, %f11, %f30
bnei_cont.30724:
	fblt	%f11, %fzero, fbgt_else.30725
	add	%a0, %zero, %zero
	j	fbgt_cont.30726
fbgt_else.30725:
	add	%a0, %zero, %k1
fbgt_cont.30726:
	beqi	%a1, 0, bnei_else.30727
	beqi	%a0, 0, bnei_else.30729
	add	%a0, %zero, %zero
	j	bnei_cont.30728
bnei_else.30729:
	add	%a0, %zero, %k1
bnei_cont.30730:
	j	bnei_cont.30728
bnei_else.30727:
bnei_cont.30728:
	beqi	%a0, 0, bnei_else.30731
	add	%a1, %zero, %zero
	j	bnei_cont.30718
bnei_else.30731:
	add	%a1, %zero, %k1
bnei_cont.30732:
	j	bnei_cont.30718
bnei_else.30719:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.30733
	add	%a0, %zero, %zero
	j	fbgt_cont.30734
fbgt_else.30733:
	add	%a0, %zero, %k1
fbgt_cont.30734:
	beqi	%a1, 0, bnei_else.30735
	beqi	%a0, 0, bnei_else.30737
	add	%a0, %zero, %zero
	j	bnei_cont.30736
bnei_else.30737:
	add	%a0, %zero, %k1
bnei_cont.30738:
	j	bnei_cont.30736
bnei_else.30735:
bnei_cont.30736:
	beqi	%a0, 0, bnei_else.30739
	add	%a1, %zero, %zero
	j	bnei_cont.30718
bnei_else.30739:
	add	%a1, %zero, %k1
bnei_cont.30740:
bnei_cont.30720:
	j	bnei_cont.30718
bnei_else.30717:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.30741
	add	%a0, %zero, %zero
	j	fbgt_cont.30742
fbgt_else.30741:
	add	%a0, %zero, %k1
fbgt_cont.30742:
	beqi	%a0, 0, bnei_else.30743
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.30745
	add	%a0, %zero, %zero
	j	fbgt_cont.30746
fbgt_else.30745:
	add	%a0, %zero, %k1
fbgt_cont.30746:
	beqi	%a0, 0, bnei_else.30747
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.30749
	add	%a0, %zero, %zero
	j	bnei_cont.30744
fbgt_else.30749:
	add	%a0, %zero, %k1
fbgt_cont.30750:
	j	bnei_cont.30744
bnei_else.30747:
	add	%a0, %zero, %zero
bnei_cont.30748:
	j	bnei_cont.30744
bnei_else.30743:
	add	%a0, %zero, %zero
bnei_cont.30744:
	beqi	%a0, 0, bnei_else.30751
	j	bnei_cont.30752
bnei_else.30751:
	beqi	%a1, 0, bnei_else.30753
	add	%a1, %zero, %zero
	j	bnei_cont.30754
bnei_else.30753:
	add	%a1, %zero, %k1
bnei_cont.30754:
bnei_cont.30752:
bnei_cont.30718:
	beqi	%a1, 0, bnei_else.30755
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30755:
	addi	%s0, %v0, 1
	add	%at, %v1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.30756
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f11, 0(%a0)
	fsub	%f14, %f0, %f11
	flw	%f11, 1(%a0)
	fsub	%f15, %f1, %f11
	flw	%f11, 2(%a0)
	fsub	%f16, %f2, %f11
	beqi	%a2, 1, bnei_else.30757
	beqi	%a2, 2, bnei_else.30759
	fmul	%f12, %f14, %f14
	flw	%f11, 0(%k0)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15
	flw	%f11, 1(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f16, %f16
	flw	%f11, 2(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	beqi	%fp, 0, bnei_else.30761
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%a3)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.30762
bnei_else.30761:
bnei_cont.30762:
	beqi	%a2, 3, bnei_else.30763
	j	bnei_cont.30764
bnei_else.30763:
	fsub	%f11, %f11, %f30
bnei_cont.30764:
	fblt	%f11, %fzero, fbgt_else.30765
	add	%a0, %zero, %zero
	j	fbgt_cont.30766
fbgt_else.30765:
	add	%a0, %zero, %k1
fbgt_cont.30766:
	beqi	%a1, 0, bnei_else.30767
	beqi	%a0, 0, bnei_else.30769
	add	%a0, %zero, %zero
	j	bnei_cont.30768
bnei_else.30769:
	add	%a0, %zero, %k1
bnei_cont.30770:
	j	bnei_cont.30768
bnei_else.30767:
bnei_cont.30768:
	beqi	%a0, 0, bnei_else.30771
	add	%a1, %zero, %zero
	j	bnei_cont.30758
bnei_else.30771:
	add	%a1, %zero, %k1
bnei_cont.30772:
	j	bnei_cont.30758
bnei_else.30759:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.30773
	add	%a0, %zero, %zero
	j	fbgt_cont.30774
fbgt_else.30773:
	add	%a0, %zero, %k1
fbgt_cont.30774:
	beqi	%a1, 0, bnei_else.30775
	beqi	%a0, 0, bnei_else.30777
	add	%a0, %zero, %zero
	j	bnei_cont.30776
bnei_else.30777:
	add	%a0, %zero, %k1
bnei_cont.30778:
	j	bnei_cont.30776
bnei_else.30775:
bnei_cont.30776:
	beqi	%a0, 0, bnei_else.30779
	add	%a1, %zero, %zero
	j	bnei_cont.30758
bnei_else.30779:
	add	%a1, %zero, %k1
bnei_cont.30780:
bnei_cont.30760:
	j	bnei_cont.30758
bnei_else.30757:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.30781
	add	%a0, %zero, %zero
	j	fbgt_cont.30782
fbgt_else.30781:
	add	%a0, %zero, %k1
fbgt_cont.30782:
	beqi	%a0, 0, bnei_else.30783
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.30785
	add	%a0, %zero, %zero
	j	fbgt_cont.30786
fbgt_else.30785:
	add	%a0, %zero, %k1
fbgt_cont.30786:
	beqi	%a0, 0, bnei_else.30787
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.30789
	add	%a0, %zero, %zero
	j	bnei_cont.30784
fbgt_else.30789:
	add	%a0, %zero, %k1
fbgt_cont.30790:
	j	bnei_cont.30784
bnei_else.30787:
	add	%a0, %zero, %zero
bnei_cont.30788:
	j	bnei_cont.30784
bnei_else.30783:
	add	%a0, %zero, %zero
bnei_cont.30784:
	beqi	%a0, 0, bnei_else.30791
	j	bnei_cont.30792
bnei_else.30791:
	beqi	%a1, 0, bnei_else.30793
	add	%a1, %zero, %zero
	j	bnei_cont.30794
bnei_else.30793:
	add	%a1, %zero, %k1
bnei_cont.30794:
bnei_cont.30792:
bnei_cont.30758:
	beqi	%a1, 0, bnei_else.30795
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30795:
	addi	%a0, %s0, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2907
bnei_else.30756:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.30716:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2913:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	add	%at, %v1, %s1
	lw	%ra, 0(%at)
	beqi	%ra, -1, bnei_else.30986
	lw	%a2, 12(%ra)
	flw	%f14, 138(%zero)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f0, 0(%a0)
	fsub	%f17, %f14, %f0
	flw	%f11, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f11, %f0
	flw	%f13, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f13, %f0
	lw	%ra, 187(%ra)
	beqi	%a2, 1, bnei_else.30987
	beqi	%a2, 2, bnei_else.30989
	flw	%f16, 0(%ra)
	fbne	%f16, %fzero, fbeq_else.30991
	add	%a0, %zero, %k1
	j	fbeq_cont.30992
fbeq_else.30991:
	add	%a0, %zero, %zero
fbeq_cont.30992:
	beqi	%a0, 0, bnei_else.30993
	add	%a0, %zero, %zero
	j	bnei_cont.30988
bnei_else.30993:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f17
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f19
	fadd	%f15, %f1, %f0
	fmul	%f1, %f17, %f17
	flw	%f0, 0(%k0)
	fmul	%f12, %f1, %f0
	fmul	%f1, %f18, %f18
	flw	%f0, 1(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f12, %f12, %f0
	fmul	%f1, %f19, %f19
	flw	%f0, 2(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f12, %f0
	beqi	%fp, 0, bnei_else.30995
	fmul	%f12, %f18, %f19
	flw	%f1, 0(%a3)
	fmul	%f1, %f12, %f1
	fadd	%f12, %f0, %f1
	fmul	%f1, %f19, %f17
	flw	%f0, 1(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f12, %f12, %f0
	fmul	%f1, %f17, %f18
	flw	%f0, 2(%a3)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f12, %f0
	j	bnei_cont.30996
bnei_else.30995:
bnei_cont.30996:
	beqi	%a2, 3, bnei_else.30997
	j	bnei_cont.30998
bnei_else.30997:
	fsub	%f0, %f0, %f30
bnei_cont.30998:
	fmul	%f1, %f15, %f15
	fmul	%f0, %f16, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.30999
	add	%a0, %zero, %zero
	j	fbgt_cont.31000
fbgt_else.30999:
	add	%a0, %zero, %k1
fbgt_cont.31000:
	beqi	%a0, 0, bnei_else.31001
	beqi	%a1, 0, bnei_else.31003
	fsqrt	%f0, %f0
	fadd	%f1, %f15, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.31004
bnei_else.31003:
	fsqrt	%f0, %f0
	fsub	%f1, %f15, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.31004:
	add	%a0, %zero, %k1
	j	bnei_cont.30988
bnei_else.31001:
	add	%a0, %zero, %zero
bnei_cont.31002:
bnei_cont.30994:
	j	bnei_cont.30988
bnei_else.30989:
	flw	%f0, 0(%ra)
	fblt	%f0, %fzero, fbgt_else.31005
	add	%a0, %zero, %zero
	j	fbgt_cont.31006
fbgt_else.31005:
	add	%a0, %zero, %k1
fbgt_cont.31006:
	beqi	%a0, 0, bnei_else.31007
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f17
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.30988
bnei_else.31007:
	add	%a0, %zero, %zero
bnei_cont.31008:
bnei_cont.30990:
	j	bnei_cont.30988
bnei_else.30987:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f17
	flw	%f2, 1(%ra)
	fmul	%f16, %f0, %f2
	flw	%f15, 185(%zero)
	fmul	%f0, %f16, %f15
	fadd	%f0, %f0, %f18
	fabs	%f0, %f0
	flw	%f12, 1(%k0)
	fblt	%f0, %f12, fbgt_else.31009
	add	%a0, %zero, %zero
	j	fbgt_cont.31010
fbgt_else.31009:
	add	%a0, %zero, %k1
fbgt_cont.31010:
	beqi	%a0, 0, bnei_else.31011
	flw	%f0, 186(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.31013
	add	%a0, %zero, %zero
	j	fbgt_cont.31014
fbgt_else.31013:
	add	%a0, %zero, %k1
fbgt_cont.31014:
	beqi	%a0, 0, bnei_else.31015
	fbne	%f2, %fzero, fbeq_else.31017
	add	%a0, %zero, %k1
	j	fbeq_cont.31018
fbeq_else.31017:
	add	%a0, %zero, %zero
fbeq_cont.31018:
	beqi	%a0, 0, bnei_else.31019
	add	%a0, %zero, %zero
	j	bnei_cont.31012
bnei_else.31019:
	add	%a0, %zero, %k1
bnei_cont.31020:
	j	bnei_cont.31012
bnei_else.31015:
	add	%a0, %zero, %zero
bnei_cont.31016:
	j	bnei_cont.31012
bnei_else.31011:
	add	%a0, %zero, %zero
bnei_cont.31012:
	beqi	%a0, 0, bnei_else.31021
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31022
bnei_else.31021:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f18
	flw	%f21, 3(%ra)
	fmul	%f16, %f0, %f21
	flw	%f20, 184(%zero)
	fmul	%f0, %f16, %f20
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	flw	%f2, 0(%k0)
	fblt	%f0, %f2, fbgt_else.31023
	add	%a0, %zero, %zero
	j	fbgt_cont.31024
fbgt_else.31023:
	add	%a0, %zero, %k1
fbgt_cont.31024:
	beqi	%a0, 0, bnei_else.31025
	flw	%f0, 186(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.31027
	add	%a0, %zero, %zero
	j	fbgt_cont.31028
fbgt_else.31027:
	add	%a0, %zero, %k1
fbgt_cont.31028:
	beqi	%a0, 0, bnei_else.31029
	fbne	%f21, %fzero, fbeq_else.31031
	add	%a0, %zero, %k1
	j	fbeq_cont.31032
fbeq_else.31031:
	add	%a0, %zero, %zero
fbeq_cont.31032:
	beqi	%a0, 0, bnei_else.31033
	add	%a0, %zero, %zero
	j	bnei_cont.31026
bnei_else.31033:
	add	%a0, %zero, %k1
bnei_cont.31034:
	j	bnei_cont.31026
bnei_else.31029:
	add	%a0, %zero, %zero
bnei_cont.31030:
	j	bnei_cont.31026
bnei_else.31025:
	add	%a0, %zero, %zero
bnei_cont.31026:
	beqi	%a0, 0, bnei_else.31035
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.31036
bnei_else.31035:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f19
	flw	%f16, 5(%ra)
	fmul	%f1, %f0, %f16
	fmul	%f0, %f1, %f20
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.31037
	add	%a0, %zero, %zero
	j	fbgt_cont.31038
fbgt_else.31037:
	add	%a0, %zero, %k1
fbgt_cont.31038:
	beqi	%a0, 0, bnei_else.31039
	fmul	%f0, %f1, %f15
	fadd	%f0, %f0, %f18
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.31041
	add	%a0, %zero, %zero
	j	fbgt_cont.31042
fbgt_else.31041:
	add	%a0, %zero, %k1
fbgt_cont.31042:
	beqi	%a0, 0, bnei_else.31043
	fbne	%f16, %fzero, fbeq_else.31045
	add	%a0, %zero, %k1
	j	fbeq_cont.31046
fbeq_else.31045:
	add	%a0, %zero, %zero
fbeq_cont.31046:
	beqi	%a0, 0, bnei_else.31047
	add	%a0, %zero, %zero
	j	bnei_cont.31040
bnei_else.31047:
	add	%a0, %zero, %k1
bnei_cont.31048:
	j	bnei_cont.31040
bnei_else.31043:
	add	%a0, %zero, %zero
bnei_cont.31044:
	j	bnei_cont.31040
bnei_else.31039:
	add	%a0, %zero, %zero
bnei_cont.31040:
	beqi	%a0, 0, bnei_else.31049
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.31050
bnei_else.31049:
	add	%a0, %zero, %zero
bnei_cont.31050:
bnei_cont.31036:
bnei_cont.31022:
bnei_cont.30988:
	flw	%f0, 135(%zero)
	beqi	%a0, 0, bnei_else.31051
	fblt	%f0, %f10, fbgt_else.31053
	add	%a0, %zero, %zero
	j	bnei_cont.31052
fbgt_else.31053:
	add	%a0, %zero, %k1
fbgt_cont.31054:
	j	bnei_cont.31052
bnei_else.31051:
	add	%a0, %zero, %zero
bnei_cont.31052:
	beqi	%a0, 0, bnei_else.31055
	fadd	%f12, %f0, %f9
	flw	%f0, 78(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f0, %f14
	flw	%f1, 79(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f1, %f1, %f11
	flw	%f11, 80(%zero)
	fmul	%f11, %f11, %f12
	fadd	%f2, %f11, %f13
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.31056
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f11, 0(%a0)
	fsub	%f14, %f0, %f11
	flw	%f11, 1(%a0)
	fsub	%f15, %f1, %f11
	flw	%f11, 2(%a0)
	fsub	%f16, %f2, %f11
	beqi	%a2, 1, bnei_else.31058
	beqi	%a2, 2, bnei_else.31060
	fmul	%f12, %f14, %f14
	flw	%f11, 0(%k0)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15
	flw	%f11, 1(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f16, %f16
	flw	%f11, 2(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	beqi	%fp, 0, bnei_else.31062
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%a3)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.31063
bnei_else.31062:
bnei_cont.31063:
	beqi	%a2, 3, bnei_else.31064
	j	bnei_cont.31065
bnei_else.31064:
	fsub	%f11, %f11, %f30
bnei_cont.31065:
	fblt	%f11, %fzero, fbgt_else.31066
	add	%a0, %zero, %zero
	j	fbgt_cont.31067
fbgt_else.31066:
	add	%a0, %zero, %k1
fbgt_cont.31067:
	beqi	%a1, 0, bnei_else.31068
	beqi	%a0, 0, bnei_else.31070
	add	%a0, %zero, %zero
	j	bnei_cont.31069
bnei_else.31070:
	add	%a0, %zero, %k1
bnei_cont.31071:
	j	bnei_cont.31069
bnei_else.31068:
bnei_cont.31069:
	beqi	%a0, 0, bnei_else.31072
	add	%a1, %zero, %zero
	j	bnei_cont.31059
bnei_else.31072:
	add	%a1, %zero, %k1
bnei_cont.31073:
	j	bnei_cont.31059
bnei_else.31060:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.31074
	add	%a0, %zero, %zero
	j	fbgt_cont.31075
fbgt_else.31074:
	add	%a0, %zero, %k1
fbgt_cont.31075:
	beqi	%a1, 0, bnei_else.31076
	beqi	%a0, 0, bnei_else.31078
	add	%a0, %zero, %zero
	j	bnei_cont.31077
bnei_else.31078:
	add	%a0, %zero, %k1
bnei_cont.31079:
	j	bnei_cont.31077
bnei_else.31076:
bnei_cont.31077:
	beqi	%a0, 0, bnei_else.31080
	add	%a1, %zero, %zero
	j	bnei_cont.31059
bnei_else.31080:
	add	%a1, %zero, %k1
bnei_cont.31081:
bnei_cont.31061:
	j	bnei_cont.31059
bnei_else.31058:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.31082
	add	%a0, %zero, %zero
	j	fbgt_cont.31083
fbgt_else.31082:
	add	%a0, %zero, %k1
fbgt_cont.31083:
	beqi	%a0, 0, bnei_else.31084
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.31086
	add	%a0, %zero, %zero
	j	fbgt_cont.31087
fbgt_else.31086:
	add	%a0, %zero, %k1
fbgt_cont.31087:
	beqi	%a0, 0, bnei_else.31088
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.31090
	add	%a0, %zero, %zero
	j	bnei_cont.31085
fbgt_else.31090:
	add	%a0, %zero, %k1
fbgt_cont.31091:
	j	bnei_cont.31085
bnei_else.31088:
	add	%a0, %zero, %zero
bnei_cont.31089:
	j	bnei_cont.31085
bnei_else.31084:
	add	%a0, %zero, %zero
bnei_cont.31085:
	beqi	%a0, 0, bnei_else.31092
	j	bnei_cont.31093
bnei_else.31092:
	beqi	%a1, 0, bnei_else.31094
	add	%a1, %zero, %zero
	j	bnei_cont.31095
bnei_else.31094:
	add	%a1, %zero, %k1
bnei_cont.31095:
bnei_cont.31093:
bnei_cont.31059:
	beqi	%a1, 0, bnei_else.31096
	add	%v0, %zero, %zero
	j	bnei_cont.31057
bnei_else.31096:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.31097:
	j	bnei_cont.31057
bnei_else.31056:
	add	%v0, %zero, %k1
bnei_cont.31057:
	beqi	%v0, 0, bnei_else.31098
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31098:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.31055:
	beqi	%a1, 0, bnei_else.31099
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.31099:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.30986:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2916:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31137
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31138
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31138:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31139
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31140
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31140:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31141
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31142
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31142:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31143
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31144
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31144:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916
bnei_else.31143:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.31141:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.31139:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.31137:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %ra
	add	%at, %s7, %s6
	lw	%t8, 0(%at)
	lw	%k0, 0(%t8)
	beqi	%k0, -1, bnei_else.31314
	beqi	%k0, 99, bnei_else.31315
	lw	%a1, 12(%k0)
	flw	%f1, 138(%zero)
	lw	%a2, 9(%a1)
	lw	%fp, 6(%a1)
	lw	%a0, 5(%a1)
	lw	%ra, 4(%a1)
	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	lw	%k0, 187(%k0)
	beqi	%a1, 1, bnei_else.31317
	beqi	%a1, 2, bnei_else.31319
	flw	%f13, 0(%k0)
	fbne	%f13, %fzero, fbeq_else.31321
	add	%a0, %zero, %k1
	j	fbeq_cont.31322
fbeq_else.31321:
	add	%a0, %zero, %zero
fbeq_cont.31322:
	beqi	%a0, 0, bnei_else.31323
	add	%a0, %zero, %zero
	j	bnei_cont.31318
bnei_else.31323:
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f14
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f12, %f1, %f0
	fmul	%f1, %f14, %f14
	flw	%f0, 0(%ra)
	fmul	%f11, %f1, %f0
	fmul	%f1, %f15, %f15
	flw	%f0, 1(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f16
	flw	%f0, 2(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	beqi	%a3, 0, bnei_else.31325
	fmul	%f11, %f15, %f16
	flw	%f1, 0(%a2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f16, %f14
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f14, %f15
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.31326
bnei_else.31325:
bnei_cont.31326:
	beqi	%a1, 3, bnei_else.31327
	j	bnei_cont.31328
bnei_else.31327:
	fsub	%f0, %f0, %f30
bnei_cont.31328:
	fmul	%f1, %f12, %f12
	fmul	%f0, %f13, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.31329
	add	%a0, %zero, %zero
	j	fbgt_cont.31330
fbgt_else.31329:
	add	%a0, %zero, %k1
fbgt_cont.31330:
	beqi	%a0, 0, bnei_else.31331
	beqi	%fp, 0, bnei_else.31333
	fsqrt	%f0, %f0
	fadd	%f1, %f12, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.31334
bnei_else.31333:
	fsqrt	%f0, %f0
	fsub	%f1, %f12, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.31334:
	add	%a0, %zero, %k1
	j	bnei_cont.31318
bnei_else.31331:
	add	%a0, %zero, %zero
bnei_cont.31332:
bnei_cont.31324:
	j	bnei_cont.31318
bnei_else.31319:
	flw	%f0, 0(%k0)
	fblt	%f0, %fzero, fbgt_else.31335
	add	%a0, %zero, %zero
	j	fbgt_cont.31336
fbgt_else.31335:
	add	%a0, %zero, %k1
fbgt_cont.31336:
	beqi	%a0, 0, bnei_else.31337
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f14
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31318
bnei_else.31337:
	add	%a0, %zero, %zero
bnei_cont.31338:
bnei_cont.31320:
	j	bnei_cont.31318
bnei_else.31317:
	flw	%f0, 0(%k0)
	fsub	%f0, %f0, %f14
	flw	%f17, 1(%k0)
	fmul	%f13, %f0, %f17
	flw	%f12, 185(%zero)
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f11, 1(%ra)
	fblt	%f0, %f11, fbgt_else.31339
	add	%a0, %zero, %zero
	j	fbgt_cont.31340
fbgt_else.31339:
	add	%a0, %zero, %k1
fbgt_cont.31340:
	beqi	%a0, 0, bnei_else.31341
	flw	%f0, 186(%zero)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.31343
	add	%a0, %zero, %zero
	j	fbgt_cont.31344
fbgt_else.31343:
	add	%a0, %zero, %k1
fbgt_cont.31344:
	beqi	%a0, 0, bnei_else.31345
	fbne	%f17, %fzero, fbeq_else.31347
	add	%a0, %zero, %k1
	j	fbeq_cont.31348
fbeq_else.31347:
	add	%a0, %zero, %zero
fbeq_cont.31348:
	beqi	%a0, 0, bnei_else.31349
	add	%a0, %zero, %zero
	j	bnei_cont.31342
bnei_else.31349:
	add	%a0, %zero, %k1
bnei_cont.31350:
	j	bnei_cont.31342
bnei_else.31345:
	add	%a0, %zero, %zero
bnei_cont.31346:
	j	bnei_cont.31342
bnei_else.31341:
	add	%a0, %zero, %zero
bnei_cont.31342:
	beqi	%a0, 0, bnei_else.31351
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31352
bnei_else.31351:
	flw	%f0, 2(%k0)
	fsub	%f0, %f0, %f15
	flw	%f19, 3(%k0)
	fmul	%f13, %f0, %f19
	flw	%f18, 184(%zero)
	fmul	%f0, %f13, %f18
	fadd	%f0, %f0, %f14
	fabs	%f0, %f0
	flw	%f17, 0(%ra)
	fblt	%f0, %f17, fbgt_else.31353
	add	%a0, %zero, %zero
	j	fbgt_cont.31354
fbgt_else.31353:
	add	%a0, %zero, %k1
fbgt_cont.31354:
	beqi	%a0, 0, bnei_else.31355
	flw	%f0, 186(%zero)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.31357
	add	%a0, %zero, %zero
	j	fbgt_cont.31358
fbgt_else.31357:
	add	%a0, %zero, %k1
fbgt_cont.31358:
	beqi	%a0, 0, bnei_else.31359
	fbne	%f19, %fzero, fbeq_else.31361
	add	%a0, %zero, %k1
	j	fbeq_cont.31362
fbeq_else.31361:
	add	%a0, %zero, %zero
fbeq_cont.31362:
	beqi	%a0, 0, bnei_else.31363
	add	%a0, %zero, %zero
	j	bnei_cont.31356
bnei_else.31363:
	add	%a0, %zero, %k1
bnei_cont.31364:
	j	bnei_cont.31356
bnei_else.31359:
	add	%a0, %zero, %zero
bnei_cont.31360:
	j	bnei_cont.31356
bnei_else.31355:
	add	%a0, %zero, %zero
bnei_cont.31356:
	beqi	%a0, 0, bnei_else.31365
	fsw	%f13, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.31366
bnei_else.31365:
	flw	%f0, 4(%k0)
	fsub	%f0, %f0, %f16
	flw	%f13, 5(%k0)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f14
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.31367
	add	%a0, %zero, %zero
	j	fbgt_cont.31368
fbgt_else.31367:
	add	%a0, %zero, %k1
fbgt_cont.31368:
	beqi	%a0, 0, bnei_else.31369
	fmul	%f0, %f1, %f12
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f11, fbgt_else.31371
	add	%a0, %zero, %zero
	j	fbgt_cont.31372
fbgt_else.31371:
	add	%a0, %zero, %k1
fbgt_cont.31372:
	beqi	%a0, 0, bnei_else.31373
	fbne	%f13, %fzero, fbeq_else.31375
	add	%a0, %zero, %k1
	j	fbeq_cont.31376
fbeq_else.31375:
	add	%a0, %zero, %zero
fbeq_cont.31376:
	beqi	%a0, 0, bnei_else.31377
	add	%a0, %zero, %zero
	j	bnei_cont.31370
bnei_else.31377:
	add	%a0, %zero, %k1
bnei_cont.31378:
	j	bnei_cont.31370
bnei_else.31373:
	add	%a0, %zero, %zero
bnei_cont.31374:
	j	bnei_cont.31370
bnei_else.31369:
	add	%a0, %zero, %zero
bnei_cont.31370:
	beqi	%a0, 0, bnei_else.31379
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.31380
bnei_else.31379:
	add	%a0, %zero, %zero
bnei_cont.31380:
bnei_cont.31366:
bnei_cont.31352:
bnei_cont.31318:
	beqi	%a0, 0, bnei_else.31381
	flw	%f1, 135(%zero)
	flw	%f0, 457(%zero)
	fblt	%f1, %f0, fbgt_else.31383
	add	%a0, %zero, %zero
	j	fbgt_cont.31384
fbgt_else.31383:
	add	%a0, %zero, %k1
fbgt_cont.31384:
	beqi	%a0, 0, bnei_else.31385
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.31387
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31389
	add	%v0, %zero, %k1
	j	bnei_cont.31388
bnei_else.31389:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.31391
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31393
	add	%v0, %zero, %k1
	j	bnei_cont.31388
bnei_else.31393:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.31395
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31397
	add	%v0, %zero, %k1
	j	bnei_cont.31388
bnei_else.31397:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.31398:
	j	bnei_cont.31388
bnei_else.31395:
	add	%v0, %zero, %zero
bnei_cont.31396:
bnei_cont.31394:
	j	bnei_cont.31388
bnei_else.31391:
	add	%v0, %zero, %zero
bnei_cont.31392:
bnei_cont.31390:
	j	bnei_cont.31388
bnei_else.31387:
	add	%v0, %zero, %zero
bnei_cont.31388:
	beqi	%v0, 0, bnei_else.31399
	add	%a0, %zero, %k1
	j	bnei_cont.31316
bnei_else.31399:
	add	%a0, %zero, %zero
bnei_cont.31400:
	j	bnei_cont.31316
bnei_else.31385:
	add	%a0, %zero, %zero
bnei_cont.31386:
	j	bnei_cont.31316
bnei_else.31381:
	add	%a0, %zero, %zero
bnei_cont.31382:
	j	bnei_cont.31316
bnei_else.31315:
	add	%a0, %zero, %k1
bnei_cont.31316:
	beqi	%a0, 0, bnei_else.31401
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.31402
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31404
	add	%v0, %zero, %k1
	j	bnei_cont.31403
bnei_else.31404:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.31406
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31408
	add	%v0, %zero, %k1
	j	bnei_cont.31403
bnei_else.31408:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.31410
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.31412
	add	%v0, %zero, %k1
	j	bnei_cont.31403
bnei_else.31412:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.31413:
	j	bnei_cont.31403
bnei_else.31410:
	add	%v0, %zero, %zero
bnei_cont.31411:
bnei_cont.31409:
	j	bnei_cont.31403
bnei_else.31406:
	add	%v0, %zero, %zero
bnei_cont.31407:
bnei_cont.31405:
	j	bnei_cont.31403
bnei_else.31402:
	add	%v0, %zero, %zero
bnei_cont.31403:
	beqi	%v0, 0, bnei_else.31414
	add	%ra, %zero, %t7
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.31414:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.31401:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.31314:
	add	%ra, %zero, %t7
	add	%v0, %zero, %zero
	jr	%ra
solve_each_element.2922:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra
	add	%at, %s2, %s1
	lw	%s5, 0(%at)
	beqi	%s5, -1, bnei_else.31628
	lw	%v0, 12(%s5)
	flw	%f22, 159(%zero)
	lw	%k0, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%a1, 4(%v0)
	lw	%a2, 1(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f22, %f0
	flw	%f23, 160(%zero)
	flw	%f1, 1(%a0)
	fsub	%f1, %f23, %f1
	flw	%f24, 161(%zero)
	flw	%f11, 2(%a0)
	fsub	%f2, %f24, %f11
	beqi	%a2, 1, bnei_else.31629
	beqi	%a2, 2, bnei_else.31631
	addi	%v1, %s3, 0
	jal	solver_second.2818
	addi	%s6, %v0, 0
	j	bnei_cont.31630
bnei_else.31631:
	flw	%f11, 0(%s3)
	flw	%f15, 0(%a1)
	fmul	%f12, %f11, %f15
	flw	%f11, 1(%s3)
	flw	%f14, 1(%a1)
	fmul	%f11, %f11, %f14
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%s3)
	flw	%f13, 2(%a1)
	fmul	%f11, %f11, %f13
	fadd	%f12, %f12, %f11
	fblt	%fzero, %f12, fbgt_else.31633
	add	%a0, %zero, %zero
	j	fbgt_cont.31634
fbgt_else.31633:
	add	%a0, %zero, %k1
fbgt_cont.31634:
	beqi	%a0, 0, bnei_else.31635
	fmul	%f11, %f15, %f0
	fmul	%f0, %f14, %f1
	fadd	%f1, %f11, %f0
	fmul	%f0, %f13, %f2
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f12
	fsw	%f0, 135(%zero)
	add	%s6, %zero, %k1
	j	bnei_cont.31630
bnei_else.31635:
	add	%s6, %zero, %zero
bnei_cont.31636:
bnei_cont.31632:
	j	bnei_cont.31630
bnei_else.31629:
	flw	%f14, 0(%s3)
	fbne	%f14, %fzero, fbeq_else.31637
	add	%a0, %zero, %k1
	j	fbeq_cont.31638
fbeq_else.31637:
	add	%a0, %zero, %zero
fbeq_cont.31638:
	beqi	%a0, 0, bnei_else.31639
	add	%a0, %zero, %zero
	j	bnei_cont.31640
bnei_else.31639:
	fblt	%f14, %fzero, fbgt_else.31641
	add	%a0, %zero, %zero
	j	fbgt_cont.31642
fbgt_else.31641:
	add	%a0, %zero, %k1
fbgt_cont.31642:
	beqi	%k0, 0, bnei_else.31643
	beqi	%a0, 0, bnei_else.31645
	add	%a0, %zero, %zero
	j	bnei_cont.31644
bnei_else.31645:
	add	%a0, %zero, %k1
bnei_cont.31646:
	j	bnei_cont.31644
bnei_else.31643:
bnei_cont.31644:
	flw	%f11, 0(%a1)
	beqi	%a0, 0, bnei_else.31647
	j	bnei_cont.31648
bnei_else.31647:
	fneg	%f11, %f11
bnei_cont.31648:
	fsub	%f11, %f11, %f0
	fdiv	%f13, %f11, %f14
	flw	%f11, 1(%s3)
	fmul	%f11, %f13, %f11
	fadd	%f11, %f11, %f1
	fabs	%f12, %f11
	flw	%f11, 1(%a1)
	fblt	%f12, %f11, fbgt_else.31649
	add	%a0, %zero, %zero
	j	fbgt_cont.31650
fbgt_else.31649:
	add	%a0, %zero, %k1
fbgt_cont.31650:
	beqi	%a0, 0, bnei_else.31651
	flw	%f11, 2(%s3)
	fmul	%f11, %f13, %f11
	fadd	%f11, %f11, %f2
	fabs	%f12, %f11
	flw	%f11, 2(%a1)
	fblt	%f12, %f11, fbgt_else.31653
	add	%a0, %zero, %zero
	j	fbgt_cont.31654
fbgt_else.31653:
	add	%a0, %zero, %k1
fbgt_cont.31654:
	beqi	%a0, 0, bnei_else.31655
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31652
bnei_else.31655:
	add	%a0, %zero, %zero
bnei_cont.31656:
	j	bnei_cont.31652
bnei_else.31651:
	add	%a0, %zero, %zero
bnei_cont.31652:
bnei_cont.31640:
	beqi	%a0, 0, bnei_else.31657
	add	%s6, %zero, %k1
	j	bnei_cont.31658
bnei_else.31657:
	flw	%f13, 1(%s3)
	fbne	%f13, %fzero, fbeq_else.31659
	add	%a0, %zero, %k1
	j	fbeq_cont.31660
fbeq_else.31659:
	add	%a0, %zero, %zero
fbeq_cont.31660:
	beqi	%a0, 0, bnei_else.31661
	add	%a0, %zero, %zero
	j	bnei_cont.31662
bnei_else.31661:
	fblt	%f13, %fzero, fbgt_else.31663
	add	%a0, %zero, %zero
	j	fbgt_cont.31664
fbgt_else.31663:
	add	%a0, %zero, %k1
fbgt_cont.31664:
	beqi	%k0, 0, bnei_else.31665
	beqi	%a0, 0, bnei_else.31667
	add	%a0, %zero, %zero
	j	bnei_cont.31666
bnei_else.31667:
	add	%a0, %zero, %k1
bnei_cont.31668:
	j	bnei_cont.31666
bnei_else.31665:
bnei_cont.31666:
	flw	%f11, 1(%a1)
	beqi	%a0, 0, bnei_else.31669
	j	bnei_cont.31670
bnei_else.31669:
	fneg	%f11, %f11
bnei_cont.31670:
	fsub	%f11, %f11, %f1
	fdiv	%f15, %f11, %f13
	flw	%f11, 2(%s3)
	fmul	%f11, %f15, %f11
	fadd	%f11, %f11, %f2
	fabs	%f12, %f11
	flw	%f11, 2(%a1)
	fblt	%f12, %f11, fbgt_else.31671
	add	%a0, %zero, %zero
	j	fbgt_cont.31672
fbgt_else.31671:
	add	%a0, %zero, %k1
fbgt_cont.31672:
	beqi	%a0, 0, bnei_else.31673
	fmul	%f11, %f15, %f14
	fadd	%f11, %f11, %f0
	fabs	%f12, %f11
	flw	%f11, 0(%a1)
	fblt	%f12, %f11, fbgt_else.31675
	add	%a0, %zero, %zero
	j	fbgt_cont.31676
fbgt_else.31675:
	add	%a0, %zero, %k1
fbgt_cont.31676:
	beqi	%a0, 0, bnei_else.31677
	fsw	%f15, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31674
bnei_else.31677:
	add	%a0, %zero, %zero
bnei_cont.31678:
	j	bnei_cont.31674
bnei_else.31673:
	add	%a0, %zero, %zero
bnei_cont.31674:
bnei_cont.31662:
	beqi	%a0, 0, bnei_else.31679
	addi	%s6, %zero, 2
	j	bnei_cont.31680
bnei_else.31679:
	flw	%f12, 2(%s3)
	fbne	%f12, %fzero, fbeq_else.31681
	add	%a0, %zero, %k1
	j	fbeq_cont.31682
fbeq_else.31681:
	add	%a0, %zero, %zero
fbeq_cont.31682:
	beqi	%a0, 0, bnei_else.31683
	add	%a0, %zero, %zero
	j	bnei_cont.31684
bnei_else.31683:
	fblt	%f12, %fzero, fbgt_else.31685
	add	%a0, %zero, %zero
	j	fbgt_cont.31686
fbgt_else.31685:
	add	%a0, %zero, %k1
fbgt_cont.31686:
	beqi	%k0, 0, bnei_else.31687
	beqi	%a0, 0, bnei_else.31689
	add	%a0, %zero, %zero
	j	bnei_cont.31688
bnei_else.31689:
	add	%a0, %zero, %k1
bnei_cont.31690:
	j	bnei_cont.31688
bnei_else.31687:
bnei_cont.31688:
	flw	%f11, 2(%a1)
	beqi	%a0, 0, bnei_else.31691
	j	bnei_cont.31692
bnei_else.31691:
	fneg	%f11, %f11
bnei_cont.31692:
	fsub	%f11, %f11, %f2
	fdiv	%f12, %f11, %f12
	fmul	%f11, %f12, %f14
	fadd	%f0, %f11, %f0
	fabs	%f11, %f0
	flw	%f0, 0(%a1)
	fblt	%f11, %f0, fbgt_else.31693
	add	%a0, %zero, %zero
	j	fbgt_cont.31694
fbgt_else.31693:
	add	%a0, %zero, %k1
fbgt_cont.31694:
	beqi	%a0, 0, bnei_else.31695
	fmul	%f0, %f12, %f13
	fadd	%f0, %f0, %f1
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.31697
	add	%a0, %zero, %zero
	j	fbgt_cont.31698
fbgt_else.31697:
	add	%a0, %zero, %k1
fbgt_cont.31698:
	beqi	%a0, 0, bnei_else.31699
	fsw	%f12, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.31696
bnei_else.31699:
	add	%a0, %zero, %zero
bnei_cont.31700:
	j	bnei_cont.31696
bnei_else.31695:
	add	%a0, %zero, %zero
bnei_cont.31696:
bnei_cont.31684:
	beqi	%a0, 0, bnei_else.31701
	addi	%s6, %zero, 3
	j	bnei_cont.31702
bnei_else.31701:
	add	%s6, %zero, %zero
bnei_cont.31702:
bnei_cont.31680:
bnei_cont.31658:
bnei_cont.31630:
	beqi	%s6, 0, bnei_else.31703
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.31704
	add	%a0, %zero, %zero
	j	fbgt_cont.31705
fbgt_else.31704:
	add	%a0, %zero, %k1
fbgt_cont.31705:
	beqi	%a0, 0, bnei_else.31706
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.31708
	add	%a0, %zero, %zero
	j	fbgt_cont.31709
fbgt_else.31708:
	add	%a0, %zero, %k1
fbgt_cont.31709:
	beqi	%a0, 0, bnei_cont.31707
	fadd	%f17, %f1, %f9
	flw	%f0, 0(%s3)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f0, %f22
	flw	%f1, 1(%s3)
	fmul	%f1, %f1, %f17
	fadd	%f1, %f1, %f23
	flw	%f11, 2(%s3)
	fmul	%f11, %f11, %f17
	fadd	%f2, %f11, %f24
	lw	%a0, 0(%s2)
	beqi	%a0, -1, bnei_else.31712
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f11, 0(%a0)
	fsub	%f14, %f0, %f11
	flw	%f11, 1(%a0)
	fsub	%f15, %f1, %f11
	flw	%f11, 2(%a0)
	fsub	%f16, %f2, %f11
	beqi	%a2, 1, bnei_else.31714
	beqi	%a2, 2, bnei_else.31716
	fmul	%f12, %f14, %f14
	flw	%f11, 0(%k0)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15
	flw	%f11, 1(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f16, %f16
	flw	%f11, 2(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	beqi	%fp, 0, bnei_else.31718
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%a3)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.31719
bnei_else.31718:
bnei_cont.31719:
	beqi	%a2, 3, bnei_else.31720
	j	bnei_cont.31721
bnei_else.31720:
	fsub	%f11, %f11, %f30
bnei_cont.31721:
	fblt	%f11, %fzero, fbgt_else.31722
	add	%a0, %zero, %zero
	j	fbgt_cont.31723
fbgt_else.31722:
	add	%a0, %zero, %k1
fbgt_cont.31723:
	beqi	%a1, 0, bnei_else.31724
	beqi	%a0, 0, bnei_else.31726
	add	%a0, %zero, %zero
	j	bnei_cont.31725
bnei_else.31726:
	add	%a0, %zero, %k1
bnei_cont.31727:
	j	bnei_cont.31725
bnei_else.31724:
bnei_cont.31725:
	beqi	%a0, 0, bnei_else.31728
	add	%a1, %zero, %zero
	j	bnei_cont.31715
bnei_else.31728:
	add	%a1, %zero, %k1
bnei_cont.31729:
	j	bnei_cont.31715
bnei_else.31716:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.31730
	add	%a0, %zero, %zero
	j	fbgt_cont.31731
fbgt_else.31730:
	add	%a0, %zero, %k1
fbgt_cont.31731:
	beqi	%a1, 0, bnei_else.31732
	beqi	%a0, 0, bnei_else.31734
	add	%a0, %zero, %zero
	j	bnei_cont.31733
bnei_else.31734:
	add	%a0, %zero, %k1
bnei_cont.31735:
	j	bnei_cont.31733
bnei_else.31732:
bnei_cont.31733:
	beqi	%a0, 0, bnei_else.31736
	add	%a1, %zero, %zero
	j	bnei_cont.31715
bnei_else.31736:
	add	%a1, %zero, %k1
bnei_cont.31737:
bnei_cont.31717:
	j	bnei_cont.31715
bnei_else.31714:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.31738
	add	%a0, %zero, %zero
	j	fbgt_cont.31739
fbgt_else.31738:
	add	%a0, %zero, %k1
fbgt_cont.31739:
	beqi	%a0, 0, bnei_else.31740
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.31742
	add	%a0, %zero, %zero
	j	fbgt_cont.31743
fbgt_else.31742:
	add	%a0, %zero, %k1
fbgt_cont.31743:
	beqi	%a0, 0, bnei_else.31744
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.31746
	add	%a0, %zero, %zero
	j	bnei_cont.31741
fbgt_else.31746:
	add	%a0, %zero, %k1
fbgt_cont.31747:
	j	bnei_cont.31741
bnei_else.31744:
	add	%a0, %zero, %zero
bnei_cont.31745:
	j	bnei_cont.31741
bnei_else.31740:
	add	%a0, %zero, %zero
bnei_cont.31741:
	beqi	%a0, 0, bnei_else.31748
	j	bnei_cont.31749
bnei_else.31748:
	beqi	%a1, 0, bnei_else.31750
	add	%a1, %zero, %zero
	j	bnei_cont.31751
bnei_else.31750:
	add	%a1, %zero, %k1
bnei_cont.31751:
bnei_cont.31749:
bnei_cont.31715:
	beqi	%a1, 0, bnei_else.31752
	add	%v0, %zero, %zero
	j	bnei_cont.31713
bnei_else.31752:
	addi	%v1, %s2, 0
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.31753:
	j	bnei_cont.31713
bnei_else.31712:
	add	%v0, %zero, %k1
bnei_cont.31713:
	beqi	%v0, 0, bnei_cont.31707
	fsw	%f17, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s5, 141(%zero)
	sw	%s6, 136(%zero)
	j	bnei_cont.31707
bnei_else.31754:
bnei_cont.31755:
	j	bnei_cont.31707
bnei_else.31710:
bnei_cont.31711:
	j	bnei_cont.31707
bnei_else.31706:
bnei_cont.31707:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	j	solve_each_element.2922
bnei_else.31703:
	beqi	%k0, 0, bnei_else.31756
	addi	%v0, %s1, 1
	add	%ra, %zero, %s4
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	j	solve_each_element.2922
bnei_else.31756:
	add	%ra, %zero, %s4
	jr	%ra
bnei_else.31628:
	add	%ra, %zero, %s4
	jr	%ra
solve_one_or_network.2926:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31804
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31805
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31806
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31807
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31808
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31809
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31810
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s7, %s7, 1
	add	%at, %t7, %s7
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.31811
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	j	solve_one_or_network.2926
bnei_else.31811:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31810:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31809:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31808:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31807:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31806:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31805:
	add	%ra, %zero, %t9
	jr	%ra
bnei_else.31804:
	add	%ra, %zero, %t9
	jr	%ra
trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%s7, 0(%at)
	lw	%a0, 0(%s7)
	beqi	%a0, -1, bnei_else.32605
	beqi	%a0, 99, bnei_else.32606
	lw	%v0, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a2, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%a1, 4(%v0)
	lw	%a3, 1(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	flw	%f11, 160(%zero)
	flw	%f1, 1(%a0)
	fsub	%f1, %f11, %f1
	flw	%f12, 161(%zero)
	flw	%f11, 2(%a0)
	fsub	%f2, %f12, %f11
	beqi	%a3, 1, bnei_else.32608
	beqi	%a3, 2, bnei_else.32610
	addi	%sp, %sp, 4
	jal	solver_second.2818
	addi	%sp, %sp, -4
	j	bnei_cont.32609
bnei_else.32610:
	flw	%f11, 0(%v1)
	flw	%f15, 0(%a1)
	fmul	%f12, %f11, %f15
	flw	%f11, 1(%v1)
	flw	%f14, 1(%a1)
	fmul	%f11, %f11, %f14
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%v1)
	flw	%f13, 2(%a1)
	fmul	%f11, %f11, %f13
	fadd	%f12, %f12, %f11
	fblt	%fzero, %f12, fbgt_else.32612
	add	%a0, %zero, %zero
	j	fbgt_cont.32613
fbgt_else.32612:
	add	%a0, %zero, %k1
fbgt_cont.32613:
	beqi	%a0, 0, bnei_else.32614
	fmul	%f11, %f15, %f0
	fmul	%f0, %f14, %f1
	fadd	%f1, %f11, %f0
	fmul	%f0, %f13, %f2
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f12
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	j	bnei_cont.32609
bnei_else.32614:
	add	%v0, %zero, %zero
bnei_cont.32615:
bnei_cont.32611:
	j	bnei_cont.32609
bnei_else.32608:
	flw	%f14, 0(%v1)
	fbne	%f14, %fzero, fbeq_else.32616
	add	%a0, %zero, %k1
	j	fbeq_cont.32617
fbeq_else.32616:
	add	%a0, %zero, %zero
fbeq_cont.32617:
	beqi	%a0, 0, bnei_else.32618
	add	%a0, %zero, %zero
	j	bnei_cont.32619
bnei_else.32618:
	fblt	%f14, %fzero, fbgt_else.32620
	add	%a0, %zero, %zero
	j	fbgt_cont.32621
fbgt_else.32620:
	add	%a0, %zero, %k1
fbgt_cont.32621:
	beqi	%a2, 0, bnei_else.32622
	beqi	%a0, 0, bnei_else.32624
	add	%a0, %zero, %zero
	j	bnei_cont.32623
bnei_else.32624:
	add	%a0, %zero, %k1
bnei_cont.32625:
	j	bnei_cont.32623
bnei_else.32622:
bnei_cont.32623:
	flw	%f11, 0(%a1)
	beqi	%a0, 0, bnei_else.32626
	j	bnei_cont.32627
bnei_else.32626:
	fneg	%f11, %f11
bnei_cont.32627:
	fsub	%f11, %f11, %f0
	fdiv	%f13, %f11, %f14
	lw	%a0, 2(%sp)
	flw	%f11, 1(%a0)
	fmul	%f11, %f13, %f11
	fadd	%f11, %f11, %f1
	fabs	%f12, %f11
	flw	%f11, 1(%a1)
	fblt	%f12, %f11, fbgt_else.32628
	add	%a0, %zero, %zero
	j	fbgt_cont.32629
fbgt_else.32628:
	add	%a0, %zero, %k1
fbgt_cont.32629:
	beqi	%a0, 0, bnei_else.32630
	lw	%a0, 2(%sp)
	flw	%f11, 2(%a0)
	fmul	%f11, %f13, %f11
	fadd	%f11, %f11, %f2
	fabs	%f12, %f11
	flw	%f11, 2(%a1)
	fblt	%f12, %f11, fbgt_else.32632
	add	%a0, %zero, %zero
	j	fbgt_cont.32633
fbgt_else.32632:
	add	%a0, %zero, %k1
fbgt_cont.32633:
	beqi	%a0, 0, bnei_else.32634
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32631
bnei_else.32634:
	add	%a0, %zero, %zero
bnei_cont.32635:
	j	bnei_cont.32631
bnei_else.32630:
	add	%a0, %zero, %zero
bnei_cont.32631:
bnei_cont.32619:
	beqi	%a0, 0, bnei_else.32636
	add	%v0, %zero, %k1
	j	bnei_cont.32637
bnei_else.32636:
	lw	%a0, 2(%sp)
	flw	%f13, 1(%a0)
	fbne	%f13, %fzero, fbeq_else.32638
	add	%a0, %zero, %k1
	j	fbeq_cont.32639
fbeq_else.32638:
	add	%a0, %zero, %zero
fbeq_cont.32639:
	beqi	%a0, 0, bnei_else.32640
	add	%a0, %zero, %zero
	j	bnei_cont.32641
bnei_else.32640:
	fblt	%f13, %fzero, fbgt_else.32642
	add	%a0, %zero, %zero
	j	fbgt_cont.32643
fbgt_else.32642:
	add	%a0, %zero, %k1
fbgt_cont.32643:
	beqi	%a2, 0, bnei_else.32644
	beqi	%a0, 0, bnei_else.32646
	add	%a0, %zero, %zero
	j	bnei_cont.32645
bnei_else.32646:
	add	%a0, %zero, %k1
bnei_cont.32647:
	j	bnei_cont.32645
bnei_else.32644:
bnei_cont.32645:
	flw	%f11, 1(%a1)
	beqi	%a0, 0, bnei_else.32648
	j	bnei_cont.32649
bnei_else.32648:
	fneg	%f11, %f11
bnei_cont.32649:
	fsub	%f11, %f11, %f1
	fdiv	%f15, %f11, %f13
	lw	%a0, 2(%sp)
	flw	%f11, 2(%a0)
	fmul	%f11, %f15, %f11
	fadd	%f11, %f11, %f2
	fabs	%f12, %f11
	flw	%f11, 2(%a1)
	fblt	%f12, %f11, fbgt_else.32650
	add	%a0, %zero, %zero
	j	fbgt_cont.32651
fbgt_else.32650:
	add	%a0, %zero, %k1
fbgt_cont.32651:
	beqi	%a0, 0, bnei_else.32652
	fmul	%f11, %f15, %f14
	fadd	%f11, %f11, %f0
	fabs	%f12, %f11
	flw	%f11, 0(%a1)
	fblt	%f12, %f11, fbgt_else.32654
	add	%a0, %zero, %zero
	j	fbgt_cont.32655
fbgt_else.32654:
	add	%a0, %zero, %k1
fbgt_cont.32655:
	beqi	%a0, 0, bnei_else.32656
	fsw	%f15, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32653
bnei_else.32656:
	add	%a0, %zero, %zero
bnei_cont.32657:
	j	bnei_cont.32653
bnei_else.32652:
	add	%a0, %zero, %zero
bnei_cont.32653:
bnei_cont.32641:
	beqi	%a0, 0, bnei_else.32658
	addi	%v0, %zero, 2
	j	bnei_cont.32659
bnei_else.32658:
	lw	%a0, 2(%sp)
	flw	%f12, 2(%a0)
	fbne	%f12, %fzero, fbeq_else.32660
	add	%a0, %zero, %k1
	j	fbeq_cont.32661
fbeq_else.32660:
	add	%a0, %zero, %zero
fbeq_cont.32661:
	beqi	%a0, 0, bnei_else.32662
	add	%a0, %zero, %zero
	j	bnei_cont.32663
bnei_else.32662:
	fblt	%f12, %fzero, fbgt_else.32664
	add	%a0, %zero, %zero
	j	fbgt_cont.32665
fbgt_else.32664:
	add	%a0, %zero, %k1
fbgt_cont.32665:
	beqi	%a2, 0, bnei_else.32666
	beqi	%a0, 0, bnei_else.32668
	add	%a0, %zero, %zero
	j	bnei_cont.32667
bnei_else.32668:
	add	%a0, %zero, %k1
bnei_cont.32669:
	j	bnei_cont.32667
bnei_else.32666:
bnei_cont.32667:
	flw	%f11, 2(%a1)
	beqi	%a0, 0, bnei_else.32670
	j	bnei_cont.32671
bnei_else.32670:
	fneg	%f11, %f11
bnei_cont.32671:
	fsub	%f11, %f11, %f2
	fdiv	%f12, %f11, %f12
	fmul	%f11, %f12, %f14
	fadd	%f0, %f11, %f0
	fabs	%f11, %f0
	flw	%f0, 0(%a1)
	fblt	%f11, %f0, fbgt_else.32672
	add	%a0, %zero, %zero
	j	fbgt_cont.32673
fbgt_else.32672:
	add	%a0, %zero, %k1
fbgt_cont.32673:
	beqi	%a0, 0, bnei_else.32674
	fmul	%f0, %f12, %f13
	fadd	%f0, %f0, %f1
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.32676
	add	%a0, %zero, %zero
	j	fbgt_cont.32677
fbgt_else.32676:
	add	%a0, %zero, %k1
fbgt_cont.32677:
	beqi	%a0, 0, bnei_else.32678
	fsw	%f12, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32675
bnei_else.32678:
	add	%a0, %zero, %zero
bnei_cont.32679:
	j	bnei_cont.32675
bnei_else.32674:
	add	%a0, %zero, %zero
bnei_cont.32675:
bnei_cont.32663:
	beqi	%a0, 0, bnei_else.32680
	addi	%v0, %zero, 3
	j	bnei_cont.32681
bnei_else.32680:
	add	%v0, %zero, %zero
bnei_cont.32681:
bnei_cont.32659:
bnei_cont.32637:
bnei_cont.32609:
	beqi	%v0, 0, bnei_cont.32607
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.32684
	add	%a0, %zero, %zero
	j	fbgt_cont.32685
fbgt_else.32684:
	add	%a0, %zero, %k1
fbgt_cont.32685:
	beqi	%a0, 0, bnei_cont.32607
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.32607
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -4
	j	bnei_cont.32607
bnei_else.32700:
bnei_cont.32701:
	j	bnei_cont.32607
bnei_else.32698:
bnei_cont.32699:
	j	bnei_cont.32607
bnei_else.32696:
bnei_cont.32697:
	j	bnei_cont.32607
bnei_else.32694:
bnei_cont.32695:
	j	bnei_cont.32607
bnei_else.32692:
bnei_cont.32693:
	j	bnei_cont.32607
bnei_else.32690:
bnei_cont.32691:
	j	bnei_cont.32607
bnei_else.32688:
bnei_cont.32689:
	j	bnei_cont.32607
bnei_else.32686:
bnei_cont.32687:
	j	bnei_cont.32607
bnei_else.32682:
bnei_cont.32683:
	j	bnei_cont.32607
bnei_else.32606:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.32702
	lw	%a1, 83(%a0)
	addi	%a0, %v1, 0
	addi	%v0, %zero, 0
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 7(%s7)
	beqi	%a0, -1, bnei_cont.32703
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -4
	j	bnei_cont.32703
bnei_else.32714:
bnei_cont.32715:
	j	bnei_cont.32703
bnei_else.32712:
bnei_cont.32713:
	j	bnei_cont.32703
bnei_else.32710:
bnei_cont.32711:
	j	bnei_cont.32703
bnei_else.32708:
bnei_cont.32709:
	j	bnei_cont.32703
bnei_else.32706:
bnei_cont.32707:
	j	bnei_cont.32703
bnei_else.32704:
bnei_cont.32705:
	j	bnei_cont.32703
bnei_else.32702:
bnei_cont.32703:
bnei_cont.32607:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 4(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s7, 0(%at)
	lw	%a0, 0(%s7)
	beqi	%a0, -1, bnei_else.32716
	beqi	%a0, 99, bnei_else.32717
	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	beqi	%a3, 1, bnei_else.32719
	beqi	%a3, 2, bnei_else.32721
	lw	%a0, 2(%sp)
	flw	%f20, 0(%a0)
	flw	%f2, 1(%a0)
	flw	%f21, 2(%a0)
	fmul	%f0, %f20, %f20
	flw	%f19, 0(%a1)
	fmul	%f1, %f0, %f19
	fmul	%f0, %f2, %f2
	flw	%f18, 1(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21
	flw	%f17, 2(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	beqi	%k0, 0, bnei_else.32723
	fmul	%f11, %f2, %f21
	flw	%f1, 0(%fp)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f21, %f20
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f20, %f2
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.32724
bnei_else.32723:
bnei_cont.32724:
	fbne	%f0, %fzero, fbeq_else.32725
	add	%a0, %zero, %k1
	j	fbeq_cont.32726
fbeq_else.32725:
	add	%a0, %zero, %zero
fbeq_cont.32726:
	beqi	%a0, 0, bnei_else.32727
	add	%a0, %zero, %zero
	j	bnei_cont.32720
bnei_else.32727:
	fmul	%f1, %f20, %f14
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15
	fmul	%f1, %f1, %f18
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16
	fmul	%f1, %f1, %f17
	fadd	%f1, %f11, %f1
	beqi	%k0, 0, bnei_else.32729
	fmul	%f12, %f21, %f15
	fmul	%f11, %f2, %f16
	fadd	%f12, %f12, %f11
	flw	%f11, 0(%fp)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f20, %f16
	fmul	%f11, %f21, %f14
	fadd	%f12, %f12, %f11
	flw	%f11, 1(%fp)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f20, %f15
	fmul	%f11, %f2, %f14
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%fp)
	fmul	%f11, %f12, %f11
	fadd	%f12, %f13, %f11
	flw	%f11, 465(%zero)
	fmul	%f11, %f12, %f11
	fadd	%f1, %f1, %f11
	j	bnei_cont.32730
bnei_else.32729:
bnei_cont.32730:
	fmul	%f11, %f14, %f14
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16
	fmul	%f11, %f11, %f17
	fadd	%f11, %f12, %f11
	beqi	%k0, 0, bnei_else.32731
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%fp)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%fp)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%fp)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.32732
bnei_else.32731:
bnei_cont.32732:
	beqi	%a3, 3, bnei_else.32733
	j	bnei_cont.32734
bnei_else.32733:
	fsub	%f11, %f11, %f30
bnei_cont.32734:
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11
	fsub	%f11, %f12, %f11
	fblt	%fzero, %f11, fbgt_else.32735
	add	%a0, %zero, %zero
	j	fbgt_cont.32736
fbgt_else.32735:
	add	%a0, %zero, %k1
fbgt_cont.32736:
	beqi	%a0, 0, bnei_else.32737
	fsqrt	%f11, %f11
	beqi	%a2, 0, bnei_else.32739
	j	bnei_cont.32740
bnei_else.32739:
	fneg	%f11, %f11
bnei_cont.32740:
	fsub	%f1, %f11, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32720
bnei_else.32737:
	add	%a0, %zero, %zero
bnei_cont.32738:
bnei_cont.32728:
	j	bnei_cont.32720
bnei_else.32721:
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	flw	%f17, 0(%a1)
	fmul	%f1, %f0, %f17
	flw	%f0, 1(%a0)
	flw	%f13, 1(%a1)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f12, 2(%a1)
	fmul	%f0, %f0, %f12
	fadd	%f11, %f1, %f0
	fblt	%fzero, %f11, fbgt_else.32741
	add	%a0, %zero, %zero
	j	fbgt_cont.32742
fbgt_else.32741:
	add	%a0, %zero, %k1
fbgt_cont.32742:
	beqi	%a0, 0, bnei_else.32743
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f11
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32720
bnei_else.32743:
	add	%a0, %zero, %zero
bnei_cont.32744:
bnei_cont.32722:
	j	bnei_cont.32720
bnei_else.32719:
	lw	%a0, 2(%sp)
	flw	%f12, 0(%a0)
	fbne	%f12, %fzero, fbeq_else.32745
	add	%a0, %zero, %k1
	j	fbeq_cont.32746
fbeq_else.32745:
	add	%a0, %zero, %zero
fbeq_cont.32746:
	beqi	%a0, 0, bnei_else.32747
	add	%a0, %zero, %zero
	j	bnei_cont.32748
bnei_else.32747:
	fblt	%f12, %fzero, fbgt_else.32749
	add	%a0, %zero, %zero
	j	fbgt_cont.32750
fbgt_else.32749:
	add	%a0, %zero, %k1
fbgt_cont.32750:
	beqi	%a2, 0, bnei_else.32751
	beqi	%a0, 0, bnei_else.32753
	add	%a0, %zero, %zero
	j	bnei_cont.32752
bnei_else.32753:
	add	%a0, %zero, %k1
bnei_cont.32754:
	j	bnei_cont.32752
bnei_else.32751:
bnei_cont.32752:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.32755
	j	bnei_cont.32756
bnei_else.32755:
	fneg	%f0, %f0
bnei_cont.32756:
	fsub	%f0, %f0, %f14
	fdiv	%f11, %f0, %f12
	lw	%a0, 2(%sp)
	flw	%f0, 1(%a0)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.32757
	add	%a0, %zero, %zero
	j	fbgt_cont.32758
fbgt_else.32757:
	add	%a0, %zero, %k1
fbgt_cont.32758:
	beqi	%a0, 0, bnei_else.32759
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.32761
	add	%a0, %zero, %zero
	j	fbgt_cont.32762
fbgt_else.32761:
	add	%a0, %zero, %k1
fbgt_cont.32762:
	beqi	%a0, 0, bnei_else.32763
	fsw	%f11, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32760
bnei_else.32763:
	add	%a0, %zero, %zero
bnei_cont.32764:
	j	bnei_cont.32760
bnei_else.32759:
	add	%a0, %zero, %zero
bnei_cont.32760:
bnei_cont.32748:
	beqi	%a0, 0, bnei_else.32765
	add	%a0, %zero, %k1
	j	bnei_cont.32766
bnei_else.32765:
	lw	%a0, 2(%sp)
	flw	%f11, 1(%a0)
	fbne	%f11, %fzero, fbeq_else.32767
	add	%a0, %zero, %k1
	j	fbeq_cont.32768
fbeq_else.32767:
	add	%a0, %zero, %zero
fbeq_cont.32768:
	beqi	%a0, 0, bnei_else.32769
	add	%a0, %zero, %zero
	j	bnei_cont.32770
bnei_else.32769:
	fblt	%f11, %fzero, fbgt_else.32771
	add	%a0, %zero, %zero
	j	fbgt_cont.32772
fbgt_else.32771:
	add	%a0, %zero, %k1
fbgt_cont.32772:
	beqi	%a2, 0, bnei_else.32773
	beqi	%a0, 0, bnei_else.32775
	add	%a0, %zero, %zero
	j	bnei_cont.32774
bnei_else.32775:
	add	%a0, %zero, %k1
bnei_cont.32776:
	j	bnei_cont.32774
bnei_else.32773:
bnei_cont.32774:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.32777
	j	bnei_cont.32778
bnei_else.32777:
	fneg	%f0, %f0
bnei_cont.32778:
	fsub	%f0, %f0, %f15
	fdiv	%f13, %f0, %f11
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.32779
	add	%a0, %zero, %zero
	j	fbgt_cont.32780
fbgt_else.32779:
	add	%a0, %zero, %k1
fbgt_cont.32780:
	beqi	%a0, 0, bnei_else.32781
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.32783
	add	%a0, %zero, %zero
	j	fbgt_cont.32784
fbgt_else.32783:
	add	%a0, %zero, %k1
fbgt_cont.32784:
	beqi	%a0, 0, bnei_else.32785
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32782
bnei_else.32785:
	add	%a0, %zero, %zero
bnei_cont.32786:
	j	bnei_cont.32782
bnei_else.32781:
	add	%a0, %zero, %zero
bnei_cont.32782:
bnei_cont.32770:
	beqi	%a0, 0, bnei_else.32787
	addi	%a0, %zero, 2
	j	bnei_cont.32788
bnei_else.32787:
	lw	%a0, 2(%sp)
	flw	%f1, 2(%a0)
	fbne	%f1, %fzero, fbeq_else.32789
	add	%a0, %zero, %k1
	j	fbeq_cont.32790
fbeq_else.32789:
	add	%a0, %zero, %zero
fbeq_cont.32790:
	beqi	%a0, 0, bnei_else.32791
	add	%a0, %zero, %zero
	j	bnei_cont.32792
bnei_else.32791:
	fblt	%f1, %fzero, fbgt_else.32793
	add	%a0, %zero, %zero
	j	fbgt_cont.32794
fbgt_else.32793:
	add	%a0, %zero, %k1
fbgt_cont.32794:
	beqi	%a2, 0, bnei_else.32795
	beqi	%a0, 0, bnei_else.32797
	add	%a0, %zero, %zero
	j	bnei_cont.32796
bnei_else.32797:
	add	%a0, %zero, %k1
bnei_cont.32798:
	j	bnei_cont.32796
bnei_else.32795:
bnei_cont.32796:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.32799
	j	bnei_cont.32800
bnei_else.32799:
	fneg	%f0, %f0
bnei_cont.32800:
	fsub	%f0, %f0, %f16
	fdiv	%f13, %f0, %f1
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.32801
	add	%a0, %zero, %zero
	j	fbgt_cont.32802
fbgt_else.32801:
	add	%a0, %zero, %k1
fbgt_cont.32802:
	beqi	%a0, 0, bnei_else.32803
	fmul	%f0, %f13, %f11
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.32805
	add	%a0, %zero, %zero
	j	fbgt_cont.32806
fbgt_else.32805:
	add	%a0, %zero, %k1
fbgt_cont.32806:
	beqi	%a0, 0, bnei_else.32807
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.32804
bnei_else.32807:
	add	%a0, %zero, %zero
bnei_cont.32808:
	j	bnei_cont.32804
bnei_else.32803:
	add	%a0, %zero, %zero
bnei_cont.32804:
bnei_cont.32792:
	beqi	%a0, 0, bnei_else.32809
	addi	%a0, %zero, 3
	j	bnei_cont.32810
bnei_else.32809:
	add	%a0, %zero, %zero
bnei_cont.32810:
bnei_cont.32788:
bnei_cont.32766:
bnei_cont.32720:
	beqi	%a0, 0, bnei_cont.32718
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.32813
	add	%a0, %zero, %zero
	j	fbgt_cont.32814
fbgt_else.32813:
	add	%a0, %zero, %k1
fbgt_cont.32814:
	beqi	%a0, 0, bnei_cont.32718
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.32718
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
	j	bnei_cont.32718
bnei_else.32827:
bnei_cont.32828:
	j	bnei_cont.32718
bnei_else.32825:
bnei_cont.32826:
	j	bnei_cont.32718
bnei_else.32823:
bnei_cont.32824:
	j	bnei_cont.32718
bnei_else.32821:
bnei_cont.32822:
	j	bnei_cont.32718
bnei_else.32819:
bnei_cont.32820:
	j	bnei_cont.32718
bnei_else.32817:
bnei_cont.32818:
	j	bnei_cont.32718
bnei_else.32815:
bnei_cont.32816:
	j	bnei_cont.32718
bnei_else.32811:
bnei_cont.32812:
	j	bnei_cont.32718
bnei_else.32717:
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.32829
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_cont.32830
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_cont.32830
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 4(%s7)
	beqi	%a0, -1, bnei_cont.32830
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 5(%s7)
	beqi	%a0, -1, bnei_cont.32830
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%a0, 6(%s7)
	beqi	%a0, -1, bnei_cont.32830
	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7
	lw	%a0, 2(%sp)
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
	j	bnei_cont.32830
bnei_else.32839:
bnei_cont.32840:
	j	bnei_cont.32830
bnei_else.32837:
bnei_cont.32838:
	j	bnei_cont.32830
bnei_else.32835:
bnei_cont.32836:
	j	bnei_cont.32830
bnei_else.32833:
bnei_cont.32834:
	j	bnei_cont.32830
bnei_else.32831:
bnei_cont.32832:
	j	bnei_cont.32830
bnei_else.32829:
bnei_cont.32830:
bnei_cont.32718:
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix.2930
bnei_else.32716:
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.32605:
	jr	%ra
solve_each_element_fast.2936:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%at, %v1, %s1
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.33035
	lw	%a0, 12(%s4)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%k0, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	flw	%f13, 2(%a3)
	add	%at, %fp, %s4
	lw	%fp, 0(%at)
	beqi	%a0, 1, bnei_else.33036
	beqi	%a0, 2, bnei_else.33038
	flw	%f12, 0(%fp)
	fbne	%f12, %fzero, fbeq_else.33040
	add	%a0, %zero, %k1
	j	fbeq_cont.33041
fbeq_else.33040:
	add	%a0, %zero, %zero
fbeq_cont.33041:
	beqi	%a0, 0, bnei_else.33042
	add	%s5, %zero, %zero
	j	bnei_cont.33037
bnei_else.33042:
	flw	%f0, 1(%fp)
	fmul	%f1, %f0, %f15
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%fp)
	fmul	%f0, %f0, %f13
	fadd	%f11, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33044
	add	%a0, %zero, %zero
	j	fbgt_cont.33045
fbgt_else.33044:
	add	%a0, %zero, %k1
fbgt_cont.33045:
	beqi	%a0, 0, bnei_else.33046
	beqi	%a2, 0, bnei_else.33048
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.33049
bnei_else.33048:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.33049:
	add	%s5, %zero, %k1
	j	bnei_cont.33037
bnei_else.33046:
	add	%s5, %zero, %zero
bnei_cont.33047:
bnei_cont.33043:
	j	bnei_cont.33037
bnei_else.33038:
	flw	%f1, 0(%fp)
	fblt	%f1, %fzero, fbgt_else.33050
	add	%a0, %zero, %zero
	j	fbgt_cont.33051
fbgt_else.33050:
	add	%a0, %zero, %k1
fbgt_cont.33051:
	beqi	%a0, 0, bnei_else.33052
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.33037
bnei_else.33052:
	add	%s5, %zero, %zero
bnei_cont.33053:
bnei_cont.33039:
	j	bnei_cont.33037
bnei_else.33036:
	flw	%f0, 0(%fp)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%fp)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%a1)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%k0)
	fblt	%f0, %f12, fbgt_else.33054
	add	%a0, %zero, %zero
	j	fbgt_cont.33055
fbgt_else.33054:
	add	%a0, %zero, %k1
fbgt_cont.33055:
	beqi	%a0, 0, bnei_else.33056
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33058
	add	%a0, %zero, %zero
	j	fbgt_cont.33059
fbgt_else.33058:
	add	%a0, %zero, %k1
fbgt_cont.33059:
	beqi	%a0, 0, bnei_else.33060
	fbne	%f17, %fzero, fbeq_else.33062
	add	%a0, %zero, %k1
	j	fbeq_cont.33063
fbeq_else.33062:
	add	%a0, %zero, %zero
fbeq_cont.33063:
	beqi	%a0, 0, bnei_else.33064
	add	%a0, %zero, %zero
	j	bnei_cont.33057
bnei_else.33064:
	add	%a0, %zero, %k1
bnei_cont.33065:
	j	bnei_cont.33057
bnei_else.33060:
	add	%a0, %zero, %zero
bnei_cont.33061:
	j	bnei_cont.33057
bnei_else.33056:
	add	%a0, %zero, %zero
bnei_cont.33057:
	beqi	%a0, 0, bnei_else.33066
	fsw	%f16, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.33067
bnei_else.33066:
	flw	%f0, 2(%fp)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%fp)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%a1)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%k0)
	fblt	%f0, %f17, fbgt_else.33068
	add	%a0, %zero, %zero
	j	fbgt_cont.33069
fbgt_else.33068:
	add	%a0, %zero, %k1
fbgt_cont.33069:
	beqi	%a0, 0, bnei_else.33070
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33072
	add	%a0, %zero, %zero
	j	fbgt_cont.33073
fbgt_else.33072:
	add	%a0, %zero, %k1
fbgt_cont.33073:
	beqi	%a0, 0, bnei_else.33074
	fbne	%f19, %fzero, fbeq_else.33076
	add	%a0, %zero, %k1
	j	fbeq_cont.33077
fbeq_else.33076:
	add	%a0, %zero, %zero
fbeq_cont.33077:
	beqi	%a0, 0, bnei_else.33078
	add	%a0, %zero, %zero
	j	bnei_cont.33071
bnei_else.33078:
	add	%a0, %zero, %k1
bnei_cont.33079:
	j	bnei_cont.33071
bnei_else.33074:
	add	%a0, %zero, %zero
bnei_cont.33075:
	j	bnei_cont.33071
bnei_else.33070:
	add	%a0, %zero, %zero
bnei_cont.33071:
	beqi	%a0, 0, bnei_else.33080
	fsw	%f16, 135(%zero)
	addi	%s5, %zero, 2
	j	bnei_cont.33081
bnei_else.33080:
	flw	%f0, 4(%fp)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%fp)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.33082
	add	%a0, %zero, %zero
	j	fbgt_cont.33083
fbgt_else.33082:
	add	%a0, %zero, %k1
fbgt_cont.33083:
	beqi	%a0, 0, bnei_else.33084
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.33086
	add	%a0, %zero, %zero
	j	fbgt_cont.33087
fbgt_else.33086:
	add	%a0, %zero, %k1
fbgt_cont.33087:
	beqi	%a0, 0, bnei_else.33088
	fbne	%f13, %fzero, fbeq_else.33090
	add	%a0, %zero, %k1
	j	fbeq_cont.33091
fbeq_else.33090:
	add	%a0, %zero, %zero
fbeq_cont.33091:
	beqi	%a0, 0, bnei_else.33092
	add	%a0, %zero, %zero
	j	bnei_cont.33085
bnei_else.33092:
	add	%a0, %zero, %k1
bnei_cont.33093:
	j	bnei_cont.33085
bnei_else.33088:
	add	%a0, %zero, %zero
bnei_cont.33089:
	j	bnei_cont.33085
bnei_else.33084:
	add	%a0, %zero, %zero
bnei_cont.33085:
	beqi	%a0, 0, bnei_else.33094
	fsw	%f1, 135(%zero)
	addi	%s5, %zero, 3
	j	bnei_cont.33095
bnei_else.33094:
	add	%s5, %zero, %zero
bnei_cont.33095:
bnei_cont.33081:
bnei_cont.33067:
bnei_cont.33037:
	beqi	%s5, 0, bnei_else.33096
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.33097
	add	%a0, %zero, %zero
	j	fbgt_cont.33098
fbgt_else.33097:
	add	%a0, %zero, %k1
fbgt_cont.33098:
	beqi	%a0, 0, bnei_else.33099
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.33101
	add	%a0, %zero, %zero
	j	fbgt_cont.33102
fbgt_else.33101:
	add	%a0, %zero, %k1
fbgt_cont.33102:
	beqi	%a0, 0, bnei_cont.33100
	fadd	%f17, %f1, %f9
	flw	%f0, 0(%a1)
	fmul	%f1, %f0, %f17
	flw	%f0, 162(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%a1)
	fmul	%f11, %f1, %f17
	flw	%f1, 163(%zero)
	fadd	%f1, %f11, %f1
	flw	%f11, 2(%a1)
	fmul	%f12, %f11, %f17
	flw	%f11, 164(%zero)
	fadd	%f2, %f12, %f11
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.33105
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f11, 0(%a0)
	fsub	%f14, %f0, %f11
	flw	%f11, 1(%a0)
	fsub	%f15, %f1, %f11
	flw	%f11, 2(%a0)
	fsub	%f16, %f2, %f11
	beqi	%a2, 1, bnei_else.33107
	beqi	%a2, 2, bnei_else.33109
	fmul	%f12, %f14, %f14
	flw	%f11, 0(%k0)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15
	flw	%f11, 1(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f16, %f16
	flw	%f11, 2(%k0)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	beqi	%fp, 0, bnei_else.33111
	fmul	%f13, %f15, %f16
	flw	%f12, 0(%a3)
	fmul	%f12, %f13, %f12
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14
	flw	%f11, 1(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f14, %f15
	flw	%f11, 2(%a3)
	fmul	%f11, %f12, %f11
	fadd	%f11, %f13, %f11
	j	bnei_cont.33112
bnei_else.33111:
bnei_cont.33112:
	beqi	%a2, 3, bnei_else.33113
	j	bnei_cont.33114
bnei_else.33113:
	fsub	%f11, %f11, %f30
bnei_cont.33114:
	fblt	%f11, %fzero, fbgt_else.33115
	add	%a0, %zero, %zero
	j	fbgt_cont.33116
fbgt_else.33115:
	add	%a0, %zero, %k1
fbgt_cont.33116:
	beqi	%a1, 0, bnei_else.33117
	beqi	%a0, 0, bnei_else.33119
	add	%a0, %zero, %zero
	j	bnei_cont.33118
bnei_else.33119:
	add	%a0, %zero, %k1
bnei_cont.33120:
	j	bnei_cont.33118
bnei_else.33117:
bnei_cont.33118:
	beqi	%a0, 0, bnei_else.33121
	add	%a1, %zero, %zero
	j	bnei_cont.33108
bnei_else.33121:
	add	%a1, %zero, %k1
bnei_cont.33122:
	j	bnei_cont.33108
bnei_else.33109:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.33123
	add	%a0, %zero, %zero
	j	fbgt_cont.33124
fbgt_else.33123:
	add	%a0, %zero, %k1
fbgt_cont.33124:
	beqi	%a1, 0, bnei_else.33125
	beqi	%a0, 0, bnei_else.33127
	add	%a0, %zero, %zero
	j	bnei_cont.33126
bnei_else.33127:
	add	%a0, %zero, %k1
bnei_cont.33128:
	j	bnei_cont.33126
bnei_else.33125:
bnei_cont.33126:
	beqi	%a0, 0, bnei_else.33129
	add	%a1, %zero, %zero
	j	bnei_cont.33108
bnei_else.33129:
	add	%a1, %zero, %k1
bnei_cont.33130:
bnei_cont.33110:
	j	bnei_cont.33108
bnei_else.33107:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.33131
	add	%a0, %zero, %zero
	j	fbgt_cont.33132
fbgt_else.33131:
	add	%a0, %zero, %k1
fbgt_cont.33132:
	beqi	%a0, 0, bnei_else.33133
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.33135
	add	%a0, %zero, %zero
	j	fbgt_cont.33136
fbgt_else.33135:
	add	%a0, %zero, %k1
fbgt_cont.33136:
	beqi	%a0, 0, bnei_else.33137
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.33139
	add	%a0, %zero, %zero
	j	bnei_cont.33134
fbgt_else.33139:
	add	%a0, %zero, %k1
fbgt_cont.33140:
	j	bnei_cont.33134
bnei_else.33137:
	add	%a0, %zero, %zero
bnei_cont.33138:
	j	bnei_cont.33134
bnei_else.33133:
	add	%a0, %zero, %zero
bnei_cont.33134:
	beqi	%a0, 0, bnei_else.33141
	j	bnei_cont.33142
bnei_else.33141:
	beqi	%a1, 0, bnei_else.33143
	add	%a1, %zero, %zero
	j	bnei_cont.33144
bnei_else.33143:
	add	%a1, %zero, %k1
bnei_cont.33144:
bnei_cont.33142:
bnei_cont.33108:
	beqi	%a1, 0, bnei_else.33145
	add	%v0, %zero, %zero
	j	bnei_cont.33106
bnei_else.33145:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.33146:
	j	bnei_cont.33106
bnei_else.33105:
	add	%v0, %zero, %k1
bnei_cont.33106:
	beqi	%v0, 0, bnei_cont.33100
	fsw	%f17, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s5, 136(%zero)
	j	bnei_cont.33100
bnei_else.33147:
bnei_cont.33148:
	j	bnei_cont.33100
bnei_else.33103:
bnei_cont.33104:
	j	bnei_cont.33100
bnei_else.33099:
bnei_cont.33100:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.33096:
	beqi	%a2, 0, bnei_else.33149
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.33149:
	add	%ra, %zero, %s3
	jr	%ra
bnei_else.33035:
	add	%ra, %zero, %s3
	jr	%ra
solve_one_or_network_fast.2940:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33197
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33198
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33199
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33200
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33201
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33202
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33203
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33204
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0
	j	solve_one_or_network_fast.2940
bnei_else.33204:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33203:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33202:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33201:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33200:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33199:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33198:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.33197:
	add	%ra, %zero, %t8
	jr	%ra
trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%t9, %zero, %a0
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%s6, 0(%at)
	lw	%s0, 0(%s6)
	beqi	%s0, -1, bnei_else.33636
	beqi	%s0, 99, bnei_else.33637
	lw	%a0, 12(%s0)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	flw	%f13, 2(%a3)
	lw	%a0, 1(%t9)
	lw	%k0, 0(%t9)
	add	%at, %a0, %s0
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.33639
	beqi	%a1, 2, bnei_else.33641
	flw	%f12, 0(%ra)
	fbne	%f12, %fzero, fbeq_else.33643
	add	%a0, %zero, %k1
	j	fbeq_cont.33644
fbeq_else.33643:
	add	%a0, %zero, %zero
fbeq_cont.33644:
	beqi	%a0, 0, bnei_else.33645
	add	%a0, %zero, %zero
	j	bnei_cont.33640
bnei_else.33645:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f15
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f13
	fadd	%f11, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33647
	add	%a0, %zero, %zero
	j	fbgt_cont.33648
fbgt_else.33647:
	add	%a0, %zero, %k1
fbgt_cont.33648:
	beqi	%a0, 0, bnei_else.33649
	beqi	%a2, 0, bnei_else.33651
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.33652
bnei_else.33651:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.33652:
	add	%a0, %zero, %k1
	j	bnei_cont.33640
bnei_else.33649:
	add	%a0, %zero, %zero
bnei_cont.33650:
bnei_cont.33646:
	j	bnei_cont.33640
bnei_else.33641:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.33653
	add	%a0, %zero, %zero
	j	fbgt_cont.33654
fbgt_else.33653:
	add	%a0, %zero, %k1
fbgt_cont.33654:
	beqi	%a0, 0, bnei_else.33655
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.33640
bnei_else.33655:
	add	%a0, %zero, %zero
bnei_cont.33656:
bnei_cont.33642:
	j	bnei_cont.33640
bnei_else.33639:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%ra)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%k0)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%fp)
	fblt	%f0, %f12, fbgt_else.33657
	add	%a0, %zero, %zero
	j	fbgt_cont.33658
fbgt_else.33657:
	add	%a0, %zero, %k1
fbgt_cont.33658:
	beqi	%a0, 0, bnei_else.33659
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.33661
	add	%a0, %zero, %zero
	j	fbgt_cont.33662
fbgt_else.33661:
	add	%a0, %zero, %k1
fbgt_cont.33662:
	beqi	%a0, 0, bnei_else.33663
	fbne	%f17, %fzero, fbeq_else.33665
	add	%a0, %zero, %k1
	j	fbeq_cont.33666
fbeq_else.33665:
	add	%a0, %zero, %zero
fbeq_cont.33666:
	beqi	%a0, 0, bnei_else.33667
	add	%a0, %zero, %zero
	j	bnei_cont.33660
bnei_else.33667:
	add	%a0, %zero, %k1
bnei_cont.33668:
	j	bnei_cont.33660
bnei_else.33663:
	add	%a0, %zero, %zero
bnei_cont.33664:
	j	bnei_cont.33660
bnei_else.33659:
	add	%a0, %zero, %zero
bnei_cont.33660:
	beqi	%a0, 0, bnei_else.33669
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.33670
bnei_else.33669:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%ra)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%k0)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%fp)
	fblt	%f0, %f17, fbgt_else.33671
	add	%a0, %zero, %zero
	j	fbgt_cont.33672
fbgt_else.33671:
	add	%a0, %zero, %k1
fbgt_cont.33672:
	beqi	%a0, 0, bnei_else.33673
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.33675
	add	%a0, %zero, %zero
	j	fbgt_cont.33676
fbgt_else.33675:
	add	%a0, %zero, %k1
fbgt_cont.33676:
	beqi	%a0, 0, bnei_else.33677
	fbne	%f19, %fzero, fbeq_else.33679
	add	%a0, %zero, %k1
	j	fbeq_cont.33680
fbeq_else.33679:
	add	%a0, %zero, %zero
fbeq_cont.33680:
	beqi	%a0, 0, bnei_else.33681
	add	%a0, %zero, %zero
	j	bnei_cont.33674
bnei_else.33681:
	add	%a0, %zero, %k1
bnei_cont.33682:
	j	bnei_cont.33674
bnei_else.33677:
	add	%a0, %zero, %zero
bnei_cont.33678:
	j	bnei_cont.33674
bnei_else.33673:
	add	%a0, %zero, %zero
bnei_cont.33674:
	beqi	%a0, 0, bnei_else.33683
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.33684
bnei_else.33683:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%ra)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.33685
	add	%a0, %zero, %zero
	j	fbgt_cont.33686
fbgt_else.33685:
	add	%a0, %zero, %k1
fbgt_cont.33686:
	beqi	%a0, 0, bnei_else.33687
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.33689
	add	%a0, %zero, %zero
	j	fbgt_cont.33690
fbgt_else.33689:
	add	%a0, %zero, %k1
fbgt_cont.33690:
	beqi	%a0, 0, bnei_else.33691
	fbne	%f13, %fzero, fbeq_else.33693
	add	%a0, %zero, %k1
	j	fbeq_cont.33694
fbeq_else.33693:
	add	%a0, %zero, %zero
fbeq_cont.33694:
	beqi	%a0, 0, bnei_else.33695
	add	%a0, %zero, %zero
	j	bnei_cont.33688
bnei_else.33695:
	add	%a0, %zero, %k1
bnei_cont.33696:
	j	bnei_cont.33688
bnei_else.33691:
	add	%a0, %zero, %zero
bnei_cont.33692:
	j	bnei_cont.33688
bnei_else.33687:
	add	%a0, %zero, %zero
bnei_cont.33688:
	beqi	%a0, 0, bnei_else.33697
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.33698
bnei_else.33697:
	add	%a0, %zero, %zero
bnei_cont.33698:
bnei_cont.33684:
bnei_cont.33670:
bnei_cont.33640:
	beqi	%a0, 0, bnei_cont.33638
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.33701
	add	%a0, %zero, %zero
	j	fbgt_cont.33702
fbgt_else.33701:
	add	%a0, %zero, %k1
fbgt_cont.33702:
	beqi	%a0, 0, bnei_cont.33638
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.33638
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -3
	j	bnei_cont.33638
bnei_else.33717:
bnei_cont.33718:
	j	bnei_cont.33638
bnei_else.33715:
bnei_cont.33716:
	j	bnei_cont.33638
bnei_else.33713:
bnei_cont.33714:
	j	bnei_cont.33638
bnei_else.33711:
bnei_cont.33712:
	j	bnei_cont.33638
bnei_else.33709:
bnei_cont.33710:
	j	bnei_cont.33638
bnei_else.33707:
bnei_cont.33708:
	j	bnei_cont.33638
bnei_else.33705:
bnei_cont.33706:
	j	bnei_cont.33638
bnei_else.33703:
bnei_cont.33704:
	j	bnei_cont.33638
bnei_else.33699:
bnei_cont.33700:
	j	bnei_cont.33638
bnei_else.33637:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.33719
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.33720
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -3
	j	bnei_cont.33720
bnei_else.33731:
bnei_cont.33732:
	j	bnei_cont.33720
bnei_else.33729:
bnei_cont.33730:
	j	bnei_cont.33720
bnei_else.33727:
bnei_cont.33728:
	j	bnei_cont.33720
bnei_else.33725:
bnei_cont.33726:
	j	bnei_cont.33720
bnei_else.33723:
bnei_cont.33724:
	j	bnei_cont.33720
bnei_else.33721:
bnei_cont.33722:
	j	bnei_cont.33720
bnei_else.33719:
bnei_cont.33720:
bnei_cont.33638:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s6, 0(%at)
	lw	%v0, 0(%s6)
	beqi	%v0, -1, bnei_else.33733
	beqi	%v0, 99, bnei_else.33734
	addi	%v1, %t9, 0
	addi	%sp, %sp, 4
	jal	solver_fast2.2865
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_cont.33735
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.33738
	add	%a0, %zero, %zero
	j	fbgt_cont.33739
fbgt_else.33738:
	add	%a0, %zero, %k1
fbgt_cont.33739:
	beqi	%a0, 0, bnei_cont.33735
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.33735
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -4
	j	bnei_cont.33735
bnei_else.33752:
bnei_cont.33753:
	j	bnei_cont.33735
bnei_else.33750:
bnei_cont.33751:
	j	bnei_cont.33735
bnei_else.33748:
bnei_cont.33749:
	j	bnei_cont.33735
bnei_else.33746:
bnei_cont.33747:
	j	bnei_cont.33735
bnei_else.33744:
bnei_cont.33745:
	j	bnei_cont.33735
bnei_else.33742:
bnei_cont.33743:
	j	bnei_cont.33735
bnei_else.33740:
bnei_cont.33741:
	j	bnei_cont.33735
bnei_else.33736:
bnei_cont.33737:
	j	bnei_cont.33735
bnei_else.33734:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.33754
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.33755
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.33755
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.33755
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.33755
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.33755
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -4
	j	bnei_cont.33755
bnei_else.33764:
bnei_cont.33765:
	j	bnei_cont.33755
bnei_else.33762:
bnei_cont.33763:
	j	bnei_cont.33755
bnei_else.33760:
bnei_cont.33761:
	j	bnei_cont.33755
bnei_else.33758:
bnei_cont.33759:
	j	bnei_cont.33755
bnei_else.33756:
bnei_cont.33757:
	j	bnei_cont.33755
bnei_else.33754:
bnei_cont.33755:
bnei_cont.33735:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix_fast.2944
bnei_else.33733:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.33636:
	jr	%ra
utexture.2959:
	lw	%a0, 8(%v0)
	lw	%a3, 5(%v0)
	lw	%a1, 4(%v0)
	lw	%a2, 0(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	beqi	%a2, 1, bnei_else.33897
	beqi	%a2, 2, bnei_else.33898
	beqi	%a2, 3, bnei_else.33899
	beqi	%a2, 4, bnei_else.33900
	jr	%ra
bnei_else.33900:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 0(%a1)
	fsqrt	%f0, %f0
	fmul	%f14, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 2(%a1)
	fsqrt	%f0, %f0
	fmul	%f13, %f1, %f0
	fmul	%f1, %f14, %f14
	fmul	%f0, %f13, %f13
	fadd	%f12, %f1, %f0
	fabs	%f0, %f14
	flw	%f11, 456(%zero)
	fblt	%f0, %f11, fbgt_else.33902
	add	%a0, %zero, %zero
	j	fbgt_cont.33903
fbgt_else.33902:
	add	%a0, %zero, %k1
fbgt_cont.33903:
	beqi	%a0, 0, bnei_else.33904
	flw	%f1, 455(%zero)
	j	bnei_cont.33905
bnei_else.33904:
	fdiv	%f0, %f13, %f14
	fabs	%f15, %f0
	fblt	%f15, %fzero, fbgt_else.33906
	add	%a0, %zero, %k1
	j	fbgt_cont.33907
fbgt_else.33906:
	add	%a0, %zero, %zero
fbgt_cont.33907:
	fabs	%f14, %f15
	flw	%f0, 481(%zero)
	fblt	%f14, %f0, fbgt_else.33908
	flw	%f0, 474(%zero)
	fblt	%f14, %f0, fbgt_else.33910
	flw	%f13, 471(%zero)
	fdiv	%f16, %f30, %f14
	fmul	%f17, %f16, %f16
	fmul	%f15, %f17, %f17
	fmul	%f14, %f15, %f15
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f1, %f16, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f15
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f0, %f1, %f0
	fsub	%f0, %f13, %f0
	j	fbgt_cont.33911
fbgt_else.33910:
	flw	%f13, 473(%zero)
	fsub	%f1, %f14, %f30
	fadd	%f0, %f14, %f30
	fdiv	%f16, %f1, %f0
	fmul	%f17, %f16, %f16
	fmul	%f15, %f17, %f17
	fmul	%f14, %f15, %f15
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f1, %f16, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f15
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f0, %f1, %f0
	fadd	%f0, %f13, %f0
fbgt_cont.33911:
	beqi	%a0, 0, bnei_else.33912
	j	fbgt_cont.33909
bnei_else.33912:
	fneg	%f0, %f0
bnei_cont.33913:
	j	fbgt_cont.33909
fbgt_else.33908:
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f13, %f14, %f14
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
fbgt_cont.33909:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.33905:
	floor	%f0, %f1
	fsub	%f13, %f1, %f0
	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 1(%a1)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f12
	fblt	%f0, %f11, fbgt_else.33914
	add	%a0, %zero, %zero
	j	fbgt_cont.33915
fbgt_else.33914:
	add	%a0, %zero, %k1
fbgt_cont.33915:
	beqi	%a0, 0, bnei_else.33916
	flw	%f1, 455(%zero)
	j	bnei_cont.33917
bnei_else.33916:
	fdiv	%f0, %f1, %f12
	fabs	%f14, %f0
	fblt	%f14, %fzero, fbgt_else.33918
	add	%a0, %zero, %k1
	j	fbgt_cont.33919
fbgt_else.33918:
	add	%a0, %zero, %zero
fbgt_cont.33919:
	fabs	%f12, %f14
	flw	%f0, 481(%zero)
	fblt	%f12, %f0, fbgt_else.33920
	flw	%f0, 474(%zero)
	fblt	%f12, %f0, fbgt_else.33922
	flw	%f11, 471(%zero)
	fdiv	%f15, %f30, %f12
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f12, %f14, %f14
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fsub	%f0, %f11, %f0
	j	fbgt_cont.33923
fbgt_else.33922:
	flw	%f11, 473(%zero)
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30
	fdiv	%f15, %f1, %f0
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f12, %f14, %f14
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
fbgt_cont.33923:
	beqi	%a0, 0, bnei_else.33924
	j	fbgt_cont.33921
bnei_else.33924:
	fneg	%f0, %f0
bnei_cont.33925:
	j	fbgt_cont.33921
fbgt_else.33920:
	fmul	%f15, %f14, %f14
	fmul	%f12, %f15, %f15
	fmul	%f11, %f12, %f12
	flw	%f0, 480(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fsub	%f1, %f14, %f0
	flw	%f0, 479(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f11
	fsub	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fadd	%f0, %f1, %f0
fbgt_cont.33921:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.33917:
	floor	%f0, %f1
	fsub	%f12, %f1, %f0
	flw	%f1, 452(%zero)
	flw	%f11, 465(%zero)
	fsub	%f0, %f11, %f13
	fmul	%f0, %f0, %f0
	fsub	%f1, %f1, %f0
	fsub	%f0, %f11, %f12
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	fblt	%f0, %fzero, fbgt_else.33926
	add	%a0, %zero, %zero
	j	fbgt_cont.33927
fbgt_else.33926:
	add	%a0, %zero, %k1
fbgt_cont.33927:
	beqi	%a0, 0, bnei_else.33928
	fmov	%f0, %fzero
	j	bnei_cont.33929
bnei_else.33928:
bnei_cont.33929:
	flw	%f1, 451(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.33899:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f11, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f11, %f11
	fmul	%f0, %f0, %f0
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 453(%zero)
	fmul	%f0, %f1, %f0
	flw	%f12, 470(%zero)
	fabs	%f11, %f0
	flw	%f1, 469(%zero)
	fdiv	%f0, %f11, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.33931
	add	%a0, %zero, %zero
	j	fbgt_cont.33932
fbgt_else.33931:
	add	%a0, %zero, %k1
fbgt_cont.33932:
	fblt	%f0, %f12, fbgt_else.33933
	fsub	%f0, %f0, %f12
	j	fbgt_cont.33934
fbgt_else.33933:
fbgt_cont.33934:
	flw	%f11, 471(%zero)
	fblt	%f0, %f11, fbgt_else.33935
	beqi	%a0, 0, bnei_else.33937
	add	%a0, %zero, %zero
	j	fbgt_cont.33936
bnei_else.33937:
	add	%a0, %zero, %k1
bnei_cont.33938:
	j	fbgt_cont.33936
fbgt_else.33935:
fbgt_cont.33936:
	fblt	%f0, %f11, fbgt_else.33939
	fsub	%f0, %f12, %f0
	j	fbgt_cont.33940
fbgt_else.33939:
fbgt_cont.33940:
	flw	%f1, 473(%zero)
	fblt	%f1, %f0, fbgt_else.33941
	fmul	%f12, %f0, %f0
	fmul	%f11, %f12, %f12
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f12
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33942
fbgt_else.33941:
	fsub	%f13, %f11, %f0
	fmul	%f12, %f13, %f13
	fmul	%f11, %f12, %f12
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f1, %f13, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.33942:
	beqi	%a0, 0, bnei_else.33943
	j	bnei_cont.33944
bnei_else.33943:
	fneg	%f0, %f0
bnei_cont.33944:
	fmul	%f11, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f11, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f11
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.33898:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f0, %f1, %f0
	flw	%f12, 470(%zero)
	fblt	%f0, %fzero, fbgt_else.33946
	add	%a0, %zero, %k1
	j	fbgt_cont.33947
fbgt_else.33946:
	add	%a0, %zero, %zero
fbgt_cont.33947:
	fabs	%f11, %f0
	flw	%f1, 469(%zero)
	fdiv	%f0, %f11, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.33948
	beqi	%a0, 0, bnei_else.33950
	add	%a0, %zero, %zero
	j	fbgt_cont.33949
bnei_else.33950:
	add	%a0, %zero, %k1
bnei_cont.33951:
	j	fbgt_cont.33949
fbgt_else.33948:
fbgt_cont.33949:
	fblt	%f0, %f12, fbgt_else.33952
	fsub	%f0, %f0, %f12
	j	fbgt_cont.33953
fbgt_else.33952:
fbgt_cont.33953:
	flw	%f11, 471(%zero)
	fblt	%f0, %f11, fbgt_else.33954
	fsub	%f0, %f12, %f0
	j	fbgt_cont.33955
fbgt_else.33954:
fbgt_cont.33955:
	flw	%f1, 473(%zero)
	fblt	%f1, %f0, fbgt_else.33956
	fmul	%f13, %f0, %f0
	fmul	%f12, %f13, %f13
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f13
	fsub	%f11, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 466(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f0, %f11, %f0
	j	fbgt_cont.33957
fbgt_else.33956:
	fsub	%f0, %f11, %f0
	fmul	%f12, %f0, %f0
	fmul	%f11, %f12, %f12
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f12
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.33957:
	beqi	%a0, 0, bnei_else.33958
	j	bnei_cont.33959
bnei_else.33958:
	fneg	%f0, %f0
bnei_cont.33959:
	fmul	%f11, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f11
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f11
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.33897:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f1, %f1, %f0
	flw	%f13, 447(%zero)
	fmul	%f0, %f1, %f13
	floor	%f0, %f0
	flw	%f12, 446(%zero)
	fmul	%f0, %f0, %f12
	fsub	%f0, %f1, %f0
	flw	%f11, 449(%zero)
	fblt	%f0, %f11, fbgt_else.33961
	add	%a0, %zero, %zero
	j	fbgt_cont.33962
fbgt_else.33961:
	add	%a0, %zero, %k1
fbgt_cont.33962:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f13
	floor	%f0, %f0
	fmul	%f0, %f0, %f12
	fsub	%f0, %f1, %f0
	fblt	%f0, %f11, fbgt_else.33963
	add	%a1, %zero, %zero
	j	fbgt_cont.33964
fbgt_else.33963:
	add	%a1, %zero, %k1
fbgt_cont.33964:
	beqi	%a0, 0, bnei_else.33965
	beqi	%a1, 0, bnei_else.33967
	flw	%f0, 451(%zero)
	j	bnei_cont.33966
bnei_else.33967:
	fmov	%f0, %fzero
bnei_cont.33968:
	j	bnei_cont.33966
bnei_else.33965:
	beqi	%a1, 0, bnei_else.33969
	fmov	%f0, %fzero
	j	bnei_cont.33970
bnei_else.33969:
	flw	%f0, 451(%zero)
bnei_cont.33970:
bnei_cont.33966:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2966:
	fmov	%f22, %f0
	fmov	%f23, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%v0, 0, bgti_else.34066
	lw	%a0, 254(%v0)
	flw	%f24, 2(%a0)
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -6
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.34067
	add	%a0, %zero, %zero
	j	fbgt_cont.34068
fbgt_else.34067:
	add	%a0, %zero, %k1
fbgt_cont.34068:
	beqi	%a0, 0, bnei_else.34069
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.34071
	add	%a0, %zero, %zero
	j	bnei_cont.34070
fbgt_else.34071:
	add	%a0, %zero, %k1
fbgt_cont.34072:
	j	bnei_cont.34070
bnei_else.34069:
	add	%a0, %zero, %zero
bnei_cont.34070:
	beqi	%a0, 0, bnei_else.34073
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 5(%sp)
	bne	%a1, %a0, bnei_cont.34074
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.34077
	j	bnei_cont.34074
bnei_else.34077:
	lw	%a0, 0(%t0)
	flw	%f0, 142(%zero)
	flw	%f14, 0(%a0)
	fmul	%f1, %f0, %f14
	flw	%f0, 143(%zero)
	flw	%f13, 1(%a0)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 144(%zero)
	flw	%f11, 2(%a0)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f22
	fmul	%f12, %f0, %f1
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f14
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f11
	fadd	%f0, %f1, %f0
	fmul	%f11, %f24, %f0
	fblt	%fzero, %f12, fbgt_else.34079
	add	%a0, %zero, %zero
	j	fbgt_cont.34080
fbgt_else.34079:
	add	%a0, %zero, %k1
fbgt_cont.34080:
	beqi	%a0, 0, bnei_else.34081
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.34082
bnei_else.34081:
bnei_cont.34082:
	fblt	%fzero, %f11, fbgt_else.34083
	add	%a0, %zero, %zero
	j	fbgt_cont.34084
fbgt_else.34083:
	add	%a0, %zero, %k1
fbgt_cont.34084:
	beqi	%a0, 0, bnei_cont.34074
	fmul	%f0, %f11, %f11
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f23
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.34074
bnei_else.34085:
bnei_cont.34086:
bnei_cont.34078:
	j	bnei_cont.34074
beq_else.34075:
beq_cont.34076:
	j	bnei_cont.34074
bnei_else.34073:
bnei_cont.34074:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f23
	fmov	%f0, %f22
	j	trace_reflections.2966
bgti_else.34066:
	jr	%ra
trace_ray.2971:
	fmov	%f25, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.34335
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
	jal	trace_or_matrix.2930
	addi	%sp, %sp, -11
	flw	%f1, 137(%zero)
	fsw	%f1, 11(%sp)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.34336
	add	%a0, %zero, %zero
	j	fbgt_cont.34337
fbgt_else.34336:
	add	%a0, %zero, %k1
fbgt_cont.34337:
	beqi	%a0, 0, bnei_else.34338
	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	fblt	%f0, %f1, fbgt_else.34340
	add	%a0, %zero, %zero
	j	bnei_cont.34339
fbgt_else.34340:
	add	%a0, %zero, %k1
fbgt_cont.34341:
	j	bnei_cont.34339
bnei_else.34338:
	add	%a0, %zero, %zero
bnei_cont.34339:
	beqi	%a0, 0, bnei_else.34342
	lw	%k0, 141(%zero)
	lw	%v0, 12(%k0)
	lw	%a2, 9(%v0)
	lw	%fp, 7(%v0)
	lw	%ra, 6(%v0)
	lw	%a1, 5(%v0)
	lw	%s0, 4(%v0)
	lw	%a3, 3(%v0)
	lw	%a0, 2(%v0)
	sw	%a0, 12(%sp)
	lw	%a0, 1(%v0)
	flw	%f26, 0(%fp)
	fmul	%f22, %f26, %f25
	beqi	%a0, 1, bnei_else.34343
	beqi	%a0, 2, bnei_else.34345
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f13, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%s0)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%s0)
	fmul	%f17, %f13, %f0
	flw	%f0, 2(%s0)
	fmul	%f15, %f16, %f0
	beqi	%a3, 0, bnei_else.34347
	flw	%f11, 2(%a2)
	fmul	%f1, %f13, %f11
	flw	%f12, 1(%a2)
	fmul	%f0, %f16, %f12
	fadd	%f0, %f1, %f0
	flw	%f18, 465(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a2)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f17, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f12
	fmul	%f0, %f13, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f15, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.34348
bnei_else.34347:
	fsw	%f19, 142(%zero)
	fsw	%f17, 143(%zero)
	fsw	%f15, 144(%zero)
bnei_cont.34348:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.34349
	add	%a0, %zero, %k1
	j	fbeq_cont.34350
fbeq_else.34349:
	add	%a0, %zero, %zero
fbeq_cont.34350:
	beqi	%a0, 0, bnei_else.34351
	fmov	%f0, %f30
	j	bnei_cont.34352
bnei_else.34351:
	beqi	%ra, 0, bnei_else.34353
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34354
bnei_else.34353:
	fdiv	%f0, %f30, %f1
bnei_cont.34354:
bnei_cont.34352:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.34344
bnei_else.34345:
	flw	%f0, 0(%s0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%s0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%s0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.34346:
	j	bnei_cont.34344
bnei_else.34343:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.34355
	add	%a0, %zero, %k1
	j	fbeq_cont.34356
fbeq_else.34355:
	add	%a0, %zero, %zero
fbeq_cont.34356:
	beqi	%a0, 0, bnei_else.34357
	fmov	%f0, %fzero
	j	bnei_cont.34358
bnei_else.34357:
	fblt	%fzero, %f0, fbgt_else.34359
	add	%a0, %zero, %zero
	j	fbgt_cont.34360
fbgt_else.34359:
	add	%a0, %zero, %k1
fbgt_cont.34360:
	beqi	%a0, 0, bnei_else.34361
	fmov	%f0, %f30
	j	bnei_cont.34362
bnei_else.34361:
	flw	%f0, 460(%zero)
bnei_cont.34362:
bnei_cont.34358:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.34344:
	flw	%f23, 138(%zero)
	fsw	%f23, 159(%zero)
	flw	%f24, 139(%zero)
	fsw	%f24, 160(%zero)
	flw	%f27, 140(%zero)
	fsw	%f27, 161(%zero)
	addi	%v1, %zero, 138
	addi	%sp, %sp, 13
	jal	utexture.2959
	addi	%sp, %sp, -13
	sll	%a1, %k0, 2
	lw	%a0, 136(%zero)
	add	%a2, %a1, %a0
	lw	%a0, 8(%sp)
	lw	%a1, 1(%sp)
	add	%at, %a0, %a1
	sw	%a2, 0(%at)
	lw	%a0, 9(%sp)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	fsw	%f23, 0(%a0)
	fsw	%f24, 1(%a0)
	fsw	%f27, 2(%a0)
	flw	%f0, 465(%zero)
	fblt	%f26, %f0, fbgt_else.34363
	add	%a0, %zero, %zero
	j	fbgt_cont.34364
fbgt_else.34363:
	add	%a0, %zero, %k1
fbgt_cont.34364:
	beqi	%a0, 0, bnei_else.34365
	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.34366
bnei_else.34365:
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
	flw	%f0, 443(%zero)
	fmul	%f1, %f0, %f22
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
bnei_cont.34366:
	flw	%f14, 442(%zero)
	lw	%a0, 2(%sp)
	flw	%f13, 0(%a0)
	flw	%f3, 142(%zero)
	fmul	%f1, %f13, %f3
	flw	%f12, 1(%a0)
	flw	%f29, 143(%zero)
	fmul	%f0, %f12, %f29
	fadd	%f1, %f1, %f0
	flw	%f11, 2(%a0)
	flw	%f28, 144(%zero)
	fmul	%f0, %f11, %f28
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f0
	fmul	%f0, %f1, %f3
	fadd	%f0, %f13, %f0
	fsw	%f0, 0(%a0)
	fmul	%f0, %f1, %f29
	fadd	%f0, %f12, %f0
	fsw	%f0, 1(%a0)
	fmul	%f0, %f1, %f28
	fadd	%f0, %f11, %f0
	fsw	%f0, 2(%a0)
	flw	%f0, 1(%fp)
	fmul	%f0, %f25, %f0
	fsw	%f0, 13(%sp)
	lw	%v1, 10(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.34367
	j	bnei_cont.34368
bnei_else.34367:
	flw	%f14, 78(%zero)
	fmul	%f1, %f3, %f14
	flw	%f13, 79(%zero)
	fmul	%f0, %f29, %f13
	fadd	%f1, %f1, %f0
	flw	%f12, 80(%zero)
	fmul	%f0, %f28, %f12
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fmul	%f11, %f0, %f22
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f14
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fneg	%f12, %f0
	fblt	%fzero, %f11, fbgt_else.34369
	add	%a0, %zero, %zero
	j	fbgt_cont.34370
fbgt_else.34369:
	add	%a0, %zero, %k1
fbgt_cont.34370:
	beqi	%a0, 0, bnei_else.34371
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.34372
bnei_else.34371:
bnei_cont.34372:
	fblt	%fzero, %f12, fbgt_else.34373
	add	%a0, %zero, %zero
	j	fbgt_cont.34374
fbgt_else.34373:
	add	%a0, %zero, %k1
fbgt_cont.34374:
	beqi	%a0, 0, bnei_else.34375
	fmul	%f0, %f12, %f12
	fmul	%f1, %f0, %f0
	flw	%f0, 13(%sp)
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
	j	bnei_cont.34376
bnei_else.34375:
bnei_cont.34376:
bnei_cont.34368:
	fsw	%f23, 162(%zero)
	fsw	%f24, 163(%zero)
	fsw	%f27, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %zero, 138
	addi	%sp, %sp, 14
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -14
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 13(%sp)
	lw	%v1, 2(%sp)
	fmov	%f0, %f22
	addi	%sp, %sp, 14
	jal	trace_reflections.2966
	addi	%sp, %sp, -14
	flw	%f0, 441(%zero)
	fblt	%f0, %f25, fbgt_else.34377
	add	%a0, %zero, %zero
	j	fbgt_cont.34378
fbgt_else.34377:
	add	%a0, %zero, %k1
fbgt_cont.34378:
	beqi	%a0, 0, bnei_else.34379
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.34380
	j	bgti_cont.34381
bgti_else.34380:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 8(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.34381:
	lw	%a0, 12(%sp)
	beqi	%a0, 2, bnei_else.34382
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.34382:
	fsub	%f0, %f30, %f26
	fmul	%f0, %f25, %f0
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 1
	flw	%f11, 0(%sp)
	flw	%f1, 11(%sp)
	fadd	%f1, %f11, %f1
	lw	%ra, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	j	trace_ray.2971
bnei_else.34379:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.34342:
	addi	%a2, %zero, -1
	lw	%a1, 8(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.34385
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f1, %f0
	fblt	%fzero, %f1, fbgt_else.34386
	add	%a0, %zero, %zero
	j	fbgt_cont.34387
fbgt_else.34386:
	add	%a0, %zero, %k1
fbgt_cont.34387:
	beqi	%a0, 0, bnei_else.34388
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f1
	fmul	%f1, %f0, %f25
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
bnei_else.34388:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.34385:
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.34335:
	jr	%ra
trace_diffuse_ray.2977:
	fmov	%f22, %f0
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -3
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.34522
	add	%a0, %zero, %zero
	j	fbgt_cont.34523
fbgt_else.34522:
	add	%a0, %zero, %k1
fbgt_cont.34523:
	beqi	%a0, 0, bnei_else.34524
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.34526
	add	%a0, %zero, %zero
	j	bnei_cont.34525
fbgt_else.34526:
	add	%a0, %zero, %k1
fbgt_cont.34527:
	j	bnei_cont.34525
bnei_else.34524:
	add	%a0, %zero, %zero
bnei_cont.34525:
	beqi	%a0, 0, bnei_else.34528
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a0, 0(%sp)
	lw	%ra, 0(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.34529
	beqi	%k0, 2, bnei_else.34531
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%fp)
	fmul	%f18, %f15, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f16, %f0
	beqi	%a2, 0, bnei_else.34533
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 465(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f18, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f13
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.34534
bnei_else.34533:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.34534:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.34535
	add	%a0, %zero, %k1
	j	fbeq_cont.34536
fbeq_else.34535:
	add	%a0, %zero, %zero
fbeq_cont.34536:
	beqi	%a0, 0, bnei_else.34537
	fmov	%f0, %f30
	j	bnei_cont.34538
bnei_else.34537:
	beqi	%a3, 0, bnei_else.34539
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34540
bnei_else.34539:
	fdiv	%f0, %f30, %f1
bnei_cont.34540:
bnei_cont.34538:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.34530
bnei_else.34531:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.34532:
	j	bnei_cont.34530
bnei_else.34529:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.34541
	add	%a0, %zero, %k1
	j	fbeq_cont.34542
fbeq_else.34541:
	add	%a0, %zero, %zero
fbeq_cont.34542:
	beqi	%a0, 0, bnei_else.34543
	fmov	%f0, %fzero
	j	bnei_cont.34544
bnei_else.34543:
	fblt	%fzero, %f0, fbgt_else.34545
	add	%a0, %zero, %zero
	j	fbgt_cont.34546
fbgt_else.34545:
	add	%a0, %zero, %k1
fbgt_cont.34546:
	beqi	%a0, 0, bnei_else.34547
	fmov	%f0, %f30
	j	bnei_cont.34548
bnei_else.34547:
	flw	%f0, 460(%zero)
bnei_cont.34548:
bnei_cont.34544:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.34530:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 3
	jal	utexture.2959
	addi	%sp, %sp, -3
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.34549
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.34549:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.34551
	add	%a0, %zero, %zero
	j	fbgt_cont.34552
fbgt_else.34551:
	add	%a0, %zero, %k1
fbgt_cont.34552:
	beqi	%a0, 0, bnei_else.34553
	j	bnei_cont.34554
bnei_else.34553:
	fmov	%f0, %fzero
bnei_cont.34554:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t9)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	lw	%ra, 1(%sp)
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.34528:
	lw	%ra, 1(%sp)
	jr	%ra
iter_trace_diffuse_rays.2980:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	blti	%a1, 0, bgti_else.35198
	add	%at, %v0, %a1
	lw	%t1, 0(%at)
	lw	%t0, 0(%t1)
	flw	%f0, 0(%t0)
	flw	%f22, 0(%v1)
	fmul	%f1, %f0, %f22
	flw	%f0, 1(%t0)
	flw	%f23, 1(%v1)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t0)
	flw	%f24, 2(%v1)
	fmul	%f0, %f0, %f24
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.35199
	add	%a0, %zero, %zero
	j	fbgt_cont.35200
fbgt_else.35199:
	add	%a0, %zero, %k1
fbgt_cont.35200:
	beqi	%a0, 0, bnei_else.35201
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t0, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f25, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s6, 0(%t1)
	lw	%v0, 0(%s6)
	beqi	%v0, -1, bnei_else.35203
	beqi	%v0, 99, bnei_else.35205
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8
	jal	solver_fast2.2865
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_cont.35206
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35209
	add	%a0, %zero, %zero
	j	fbgt_cont.35210
fbgt_else.35209:
	add	%a0, %zero, %k1
fbgt_cont.35210:
	beqi	%a0, 0, bnei_cont.35206
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35206
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35206
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35206
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35206
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	j	bnei_cont.35206
bnei_else.35219:
bnei_cont.35220:
	j	bnei_cont.35206
bnei_else.35217:
bnei_cont.35218:
	j	bnei_cont.35206
bnei_else.35215:
bnei_cont.35216:
	j	bnei_cont.35206
bnei_else.35213:
bnei_cont.35214:
	j	bnei_cont.35206
bnei_else.35211:
bnei_cont.35212:
	j	bnei_cont.35206
bnei_else.35207:
bnei_cont.35208:
	j	bnei_cont.35206
bnei_else.35205:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35221
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35222
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35222
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35222
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	j	bnei_cont.35222
bnei_else.35227:
bnei_cont.35228:
	j	bnei_cont.35222
bnei_else.35225:
bnei_cont.35226:
	j	bnei_cont.35222
bnei_else.35223:
bnei_cont.35224:
	j	bnei_cont.35222
bnei_else.35221:
bnei_cont.35222:
bnei_cont.35206:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.35204
bnei_else.35203:
bnei_cont.35204:
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35229
	add	%a0, %zero, %zero
	j	fbgt_cont.35230
fbgt_else.35229:
	add	%a0, %zero, %k1
fbgt_cont.35230:
	beqi	%a0, 0, bnei_else.35231
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35233
	add	%a0, %zero, %zero
	j	bnei_cont.35232
fbgt_else.35233:
	add	%a0, %zero, %k1
fbgt_cont.35234:
	j	bnei_cont.35232
bnei_else.35231:
	add	%a0, %zero, %zero
bnei_cont.35232:
	beqi	%a0, 0, bnei_cont.35202
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%ra, 0(%t0)
	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35237
	beqi	%k0, 2, bnei_else.35239
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f13, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f12, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f13, %f0
	flw	%f0, 1(%fp)
	fmul	%f16, %f12, %f0
	flw	%f0, 2(%fp)
	fmul	%f14, %f15, %f0
	beqi	%a2, 0, bnei_else.35241
	flw	%f11, 2(%a1)
	fmul	%f1, %f12, %f11
	flw	%f18, 1(%a1)
	fmul	%f0, %f15, %f18
	fadd	%f0, %f1, %f0
	flw	%f17, 465(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f13, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f17
	fadd	%f0, %f16, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f13, %f18
	fmul	%f0, %f12, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f17
	fadd	%f0, %f14, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35242
bnei_else.35241:
	fsw	%f19, 142(%zero)
	fsw	%f16, 143(%zero)
	fsw	%f14, 144(%zero)
bnei_cont.35242:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35243
	add	%a0, %zero, %k1
	j	fbeq_cont.35244
fbeq_else.35243:
	add	%a0, %zero, %zero
fbeq_cont.35244:
	beqi	%a0, 0, bnei_else.35245
	fmov	%f0, %f30
	j	bnei_cont.35246
bnei_else.35245:
	beqi	%a3, 0, bnei_else.35247
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35248
bnei_else.35247:
	fdiv	%f0, %f30, %f1
bnei_cont.35248:
bnei_cont.35246:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35238
bnei_else.35239:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35240:
	j	bnei_cont.35238
bnei_else.35237:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35249
	add	%a0, %zero, %k1
	j	fbeq_cont.35250
fbeq_else.35249:
	add	%a0, %zero, %zero
fbeq_cont.35250:
	beqi	%a0, 0, bnei_else.35251
	fmov	%f0, %fzero
	j	bnei_cont.35252
bnei_else.35251:
	fblt	%fzero, %f0, fbgt_else.35253
	add	%a0, %zero, %zero
	j	fbgt_cont.35254
fbgt_else.35253:
	add	%a0, %zero, %k1
fbgt_cont.35254:
	beqi	%a0, 0, bnei_else.35255
	fmov	%f0, %f30
	j	bnei_cont.35256
bnei_else.35255:
	flw	%f0, 460(%zero)
bnei_cont.35256:
bnei_cont.35252:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35238:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.35257
	j	bnei_cont.35202
bnei_else.35257:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35259
	add	%a0, %zero, %zero
	j	fbgt_cont.35260
fbgt_else.35259:
	add	%a0, %zero, %k1
fbgt_cont.35260:
	beqi	%a0, 0, bnei_else.35261
	j	bnei_cont.35262
bnei_else.35261:
	fmov	%f0, %fzero
bnei_cont.35262:
	fmul	%f1, %f25, %f0
	flw	%f0, 0(%t0)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35258:
	j	bnei_cont.35202
bnei_else.35235:
bnei_cont.35236:
	j	bnei_cont.35202
bnei_else.35201:
	flw	%f0, 439(%zero)
	fdiv	%f25, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s6, 0(%t2)
	lw	%v0, 0(%s6)
	beqi	%v0, -1, bnei_else.35263
	beqi	%v0, 99, bnei_else.35265
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8
	jal	solver_fast2.2865
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_cont.35266
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35269
	add	%a0, %zero, %zero
	j	fbgt_cont.35270
fbgt_else.35269:
	add	%a0, %zero, %k1
fbgt_cont.35270:
	beqi	%a0, 0, bnei_cont.35266
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35266
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35266
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35266
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35266
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	j	bnei_cont.35266
bnei_else.35279:
bnei_cont.35280:
	j	bnei_cont.35266
bnei_else.35277:
bnei_cont.35278:
	j	bnei_cont.35266
bnei_else.35275:
bnei_cont.35276:
	j	bnei_cont.35266
bnei_else.35273:
bnei_cont.35274:
	j	bnei_cont.35266
bnei_else.35271:
bnei_cont.35272:
	j	bnei_cont.35266
bnei_else.35267:
bnei_cont.35268:
	j	bnei_cont.35266
bnei_else.35265:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35281
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35282
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35282
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35282
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	j	bnei_cont.35282
bnei_else.35287:
bnei_cont.35288:
	j	bnei_cont.35282
bnei_else.35285:
bnei_cont.35286:
	j	bnei_cont.35282
bnei_else.35283:
bnei_cont.35284:
	j	bnei_cont.35282
bnei_else.35281:
bnei_cont.35282:
bnei_cont.35266:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.35264
bnei_else.35263:
bnei_cont.35264:
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35289
	add	%a0, %zero, %zero
	j	fbgt_cont.35290
fbgt_else.35289:
	add	%a0, %zero, %k1
fbgt_cont.35290:
	beqi	%a0, 0, bnei_else.35291
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35293
	add	%a0, %zero, %zero
	j	bnei_cont.35292
fbgt_else.35293:
	add	%a0, %zero, %k1
fbgt_cont.35294:
	j	bnei_cont.35292
bnei_else.35291:
	add	%a0, %zero, %zero
bnei_cont.35292:
	beqi	%a0, 0, bnei_else.35295
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35297
	beqi	%k0, 2, bnei_else.35299
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f13, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f12, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f13, %f0
	flw	%f0, 1(%fp)
	fmul	%f16, %f12, %f0
	flw	%f0, 2(%fp)
	fmul	%f14, %f15, %f0
	beqi	%a2, 0, bnei_else.35301
	flw	%f11, 2(%a1)
	fmul	%f1, %f12, %f11
	flw	%f18, 1(%a1)
	fmul	%f0, %f15, %f18
	fadd	%f0, %f1, %f0
	flw	%f17, 465(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f13, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f17
	fadd	%f0, %f16, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f13, %f18
	fmul	%f0, %f12, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f17
	fadd	%f0, %f14, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35302
bnei_else.35301:
	fsw	%f19, 142(%zero)
	fsw	%f16, 143(%zero)
	fsw	%f14, 144(%zero)
bnei_cont.35302:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35303
	add	%a0, %zero, %k1
	j	fbeq_cont.35304
fbeq_else.35303:
	add	%a0, %zero, %zero
fbeq_cont.35304:
	beqi	%a0, 0, bnei_else.35305
	fmov	%f0, %f30
	j	bnei_cont.35306
bnei_else.35305:
	beqi	%a3, 0, bnei_else.35307
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35308
bnei_else.35307:
	fdiv	%f0, %f30, %f1
bnei_cont.35308:
bnei_cont.35306:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35298
bnei_else.35299:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35300:
	j	bnei_cont.35298
bnei_else.35297:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35309
	add	%a0, %zero, %k1
	j	fbeq_cont.35310
fbeq_else.35309:
	add	%a0, %zero, %zero
fbeq_cont.35310:
	beqi	%a0, 0, bnei_else.35311
	fmov	%f0, %fzero
	j	bnei_cont.35312
bnei_else.35311:
	fblt	%fzero, %f0, fbgt_else.35313
	add	%a0, %zero, %zero
	j	fbgt_cont.35314
fbgt_else.35313:
	add	%a0, %zero, %k1
fbgt_cont.35314:
	beqi	%a0, 0, bnei_else.35315
	fmov	%f0, %f30
	j	bnei_cont.35316
bnei_else.35315:
	flw	%f0, 460(%zero)
bnei_cont.35316:
bnei_cont.35312:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35298:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.35317
	j	bnei_cont.35296
bnei_else.35317:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35319
	add	%a0, %zero, %zero
	j	fbgt_cont.35320
fbgt_else.35319:
	add	%a0, %zero, %k1
fbgt_cont.35320:
	beqi	%a0, 0, bnei_else.35321
	j	bnei_cont.35322
bnei_else.35321:
	fmov	%f0, %fzero
bnei_cont.35322:
	fmul	%f1, %f25, %f0
	flw	%f0, 0(%t1)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35318:
	j	bnei_cont.35296
bnei_else.35295:
bnei_cont.35296:
bnei_cont.35202:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.35323
	lw	%a0, 0(%sp)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	lw	%t1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f1, %f0, %f22
	flw	%f0, 1(%t1)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t1)
	fmul	%f0, %f0, %f24
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.35324
	add	%a1, %zero, %zero
	j	fbgt_cont.35325
fbgt_else.35324:
	add	%a1, %zero, %k1
fbgt_cont.35325:
	beqi	%a1, 0, bnei_else.35326
	addi	%a1, %t0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t1, 0(%at)
	flw	%f0, 440(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35328
	add	%a0, %zero, %zero
	j	fbgt_cont.35329
fbgt_else.35328:
	add	%a0, %zero, %k1
fbgt_cont.35329:
	beqi	%a0, 0, bnei_else.35330
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35332
	add	%a0, %zero, %zero
	j	bnei_cont.35331
fbgt_else.35332:
	add	%a0, %zero, %k1
fbgt_cont.35333:
	j	bnei_cont.35331
bnei_else.35330:
	add	%a0, %zero, %zero
bnei_cont.35331:
	beqi	%a0, 0, bnei_cont.35327
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%ra, 0(%t1)
	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35336
	beqi	%k0, 2, bnei_else.35338
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%fp)
	fmul	%f18, %f15, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f16, %f0
	beqi	%a2, 0, bnei_else.35340
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 465(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f18, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f13
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35341
bnei_else.35340:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.35341:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35342
	add	%a0, %zero, %k1
	j	fbeq_cont.35343
fbeq_else.35342:
	add	%a0, %zero, %zero
fbeq_cont.35343:
	beqi	%a0, 0, bnei_else.35344
	fmov	%f0, %f30
	j	bnei_cont.35345
bnei_else.35344:
	beqi	%a3, 0, bnei_else.35346
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35347
bnei_else.35346:
	fdiv	%f0, %f30, %f1
bnei_cont.35347:
bnei_cont.35345:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35337
bnei_else.35338:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35339:
	j	bnei_cont.35337
bnei_else.35336:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35348
	add	%a0, %zero, %k1
	j	fbeq_cont.35349
fbeq_else.35348:
	add	%a0, %zero, %zero
fbeq_cont.35349:
	beqi	%a0, 0, bnei_else.35350
	fmov	%f0, %fzero
	j	bnei_cont.35351
bnei_else.35350:
	fblt	%fzero, %f0, fbgt_else.35352
	add	%a0, %zero, %zero
	j	fbgt_cont.35353
fbgt_else.35352:
	add	%a0, %zero, %k1
fbgt_cont.35353:
	beqi	%a0, 0, bnei_else.35354
	fmov	%f0, %f30
	j	bnei_cont.35355
bnei_else.35354:
	flw	%f0, 460(%zero)
bnei_cont.35355:
bnei_cont.35351:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35337:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.35356
	j	bnei_cont.35327
bnei_else.35356:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35358
	add	%a0, %zero, %zero
	j	fbgt_cont.35359
fbgt_else.35358:
	add	%a0, %zero, %k1
fbgt_cont.35359:
	beqi	%a0, 0, bnei_else.35360
	j	bnei_cont.35361
bnei_else.35360:
	fmov	%f0, %fzero
bnei_cont.35361:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t1)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35357:
	j	bnei_cont.35327
bnei_else.35334:
bnei_cont.35335:
	j	bnei_cont.35327
bnei_else.35326:
	flw	%f0, 439(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35362
	add	%a0, %zero, %zero
	j	fbgt_cont.35363
fbgt_else.35362:
	add	%a0, %zero, %k1
fbgt_cont.35363:
	beqi	%a0, 0, bnei_else.35364
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35366
	add	%a0, %zero, %zero
	j	bnei_cont.35365
fbgt_else.35366:
	add	%a0, %zero, %k1
fbgt_cont.35367:
	j	bnei_cont.35365
bnei_else.35364:
	add	%a0, %zero, %zero
bnei_cont.35365:
	beqi	%a0, 0, bnei_else.35368
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35370
	beqi	%k0, 2, bnei_else.35372
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%fp)
	fmul	%f18, %f15, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f16, %f0
	beqi	%a2, 0, bnei_else.35374
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 465(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f18, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f13
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35375
bnei_else.35374:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.35375:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35376
	add	%a0, %zero, %k1
	j	fbeq_cont.35377
fbeq_else.35376:
	add	%a0, %zero, %zero
fbeq_cont.35377:
	beqi	%a0, 0, bnei_else.35378
	fmov	%f0, %f30
	j	bnei_cont.35379
bnei_else.35378:
	beqi	%a3, 0, bnei_else.35380
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35381
bnei_else.35380:
	fdiv	%f0, %f30, %f1
bnei_cont.35381:
bnei_cont.35379:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35371
bnei_else.35372:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35373:
	j	bnei_cont.35371
bnei_else.35370:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t1, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35382
	add	%a0, %zero, %k1
	j	fbeq_cont.35383
fbeq_else.35382:
	add	%a0, %zero, %zero
fbeq_cont.35383:
	beqi	%a0, 0, bnei_else.35384
	fmov	%f0, %fzero
	j	bnei_cont.35385
bnei_else.35384:
	fblt	%fzero, %f0, fbgt_else.35386
	add	%a0, %zero, %zero
	j	fbgt_cont.35387
fbgt_else.35386:
	add	%a0, %zero, %k1
fbgt_cont.35387:
	beqi	%a0, 0, bnei_else.35388
	fmov	%f0, %f30
	j	bnei_cont.35389
bnei_else.35388:
	flw	%f0, 460(%zero)
bnei_cont.35389:
bnei_cont.35385:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35371:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.35390
	j	bnei_cont.35369
bnei_else.35390:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35392
	add	%a0, %zero, %zero
	j	fbgt_cont.35393
fbgt_else.35392:
	add	%a0, %zero, %k1
fbgt_cont.35393:
	beqi	%a0, 0, bnei_else.35394
	j	bnei_cont.35395
bnei_else.35394:
	fmov	%f0, %fzero
bnei_cont.35395:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t9)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35391:
	j	bnei_cont.35369
bnei_else.35368:
bnei_cont.35369:
bnei_cont.35327:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.35323:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgti_else.35198:
	jr	%ra
trace_diffuse_rays.2985:
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
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	lw	%a0, 118(%a0)
	lw	%t0, 0(%a0)
	flw	%f1, 0(%t0)
	lw	%a1, 1(%sp)
	flw	%f0, 0(%a1)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%t0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%t0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f11, %f0
	fblt	%f1, %fzero, fbgt_else.35644
	add	%a1, %zero, %zero
	j	fbgt_cont.35645
fbgt_else.35644:
	add	%a1, %zero, %k1
fbgt_cont.35645:
	beqi	%a1, 0, bnei_else.35646
	lw	%a0, 0(%sp)
	lw	%t0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35648
	add	%a0, %zero, %zero
	j	fbgt_cont.35649
fbgt_else.35648:
	add	%a0, %zero, %k1
fbgt_cont.35649:
	beqi	%a0, 0, bnei_else.35650
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35652
	add	%a0, %zero, %zero
	j	bnei_cont.35651
fbgt_else.35652:
	add	%a0, %zero, %k1
fbgt_cont.35653:
	j	bnei_cont.35651
bnei_else.35650:
	add	%a0, %zero, %zero
bnei_cont.35651:
	beqi	%a0, 0, bnei_cont.35647
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%ra, 0(%t0)
	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35656
	beqi	%k0, 2, bnei_else.35658
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%fp)
	fmul	%f18, %f15, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f16, %f0
	beqi	%a2, 0, bnei_else.35660
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 465(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f18, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f13
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35661
bnei_else.35660:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.35661:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35662
	add	%a0, %zero, %k1
	j	fbeq_cont.35663
fbeq_else.35662:
	add	%a0, %zero, %zero
fbeq_cont.35663:
	beqi	%a0, 0, bnei_else.35664
	fmov	%f0, %f30
	j	bnei_cont.35665
bnei_else.35664:
	beqi	%a3, 0, bnei_else.35666
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35667
bnei_else.35666:
	fdiv	%f0, %f30, %f1
bnei_cont.35667:
bnei_cont.35665:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35657
bnei_else.35658:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35659:
	j	bnei_cont.35657
bnei_else.35656:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35668
	add	%a0, %zero, %k1
	j	fbeq_cont.35669
fbeq_else.35668:
	add	%a0, %zero, %zero
fbeq_cont.35669:
	beqi	%a0, 0, bnei_else.35670
	fmov	%f0, %fzero
	j	bnei_cont.35671
bnei_else.35670:
	fblt	%fzero, %f0, fbgt_else.35672
	add	%a0, %zero, %zero
	j	fbgt_cont.35673
fbgt_else.35672:
	add	%a0, %zero, %k1
fbgt_cont.35673:
	beqi	%a0, 0, bnei_else.35674
	fmov	%f0, %f30
	j	bnei_cont.35675
bnei_else.35674:
	flw	%f0, 460(%zero)
bnei_cont.35675:
bnei_cont.35671:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35657:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.35676
	j	bnei_cont.35647
bnei_else.35676:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35678
	add	%a0, %zero, %zero
	j	fbgt_cont.35679
fbgt_else.35678:
	add	%a0, %zero, %k1
fbgt_cont.35679:
	beqi	%a0, 0, bnei_else.35680
	j	bnei_cont.35681
bnei_else.35680:
	fmov	%f0, %fzero
bnei_cont.35681:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t0)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35677:
	j	bnei_cont.35647
bnei_else.35654:
bnei_cont.35655:
	j	bnei_cont.35647
bnei_else.35646:
	flw	%f0, 439(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	fblt	%f0, %f1, fbgt_else.35682
	add	%a0, %zero, %zero
	j	fbgt_cont.35683
fbgt_else.35682:
	add	%a0, %zero, %k1
fbgt_cont.35683:
	beqi	%a0, 0, bnei_else.35684
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.35686
	add	%a0, %zero, %zero
	j	bnei_cont.35685
fbgt_else.35686:
	add	%a0, %zero, %k1
fbgt_cont.35687:
	j	bnei_cont.35685
bnei_else.35684:
	add	%a0, %zero, %zero
bnei_cont.35685:
	beqi	%a0, 0, bnei_else.35688
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.35690
	beqi	%k0, 2, bnei_else.35692
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f16, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f19, %f14, %f0
	flw	%f0, 1(%fp)
	fmul	%f18, %f15, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f16, %f0
	beqi	%a2, 0, bnei_else.35694
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 465(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f19, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f14, %f11
	flw	%f11, 0(%a1)
	fmul	%f0, %f16, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f18, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f14, %f13
	fmul	%f0, %f15, %f11
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f12
	fadd	%f0, %f17, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35695
bnei_else.35694:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.35695:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.35696
	add	%a0, %zero, %k1
	j	fbeq_cont.35697
fbeq_else.35696:
	add	%a0, %zero, %zero
fbeq_cont.35697:
	beqi	%a0, 0, bnei_else.35698
	fmov	%f0, %f30
	j	bnei_cont.35699
bnei_else.35698:
	beqi	%a3, 0, bnei_else.35700
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35701
bnei_else.35700:
	fdiv	%f0, %f30, %f1
bnei_cont.35701:
bnei_cont.35699:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35691
bnei_else.35692:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35693:
	j	bnei_cont.35691
bnei_else.35690:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.35702
	add	%a0, %zero, %k1
	j	fbeq_cont.35703
fbeq_else.35702:
	add	%a0, %zero, %zero
fbeq_cont.35703:
	beqi	%a0, 0, bnei_else.35704
	fmov	%f0, %fzero
	j	bnei_cont.35705
bnei_else.35704:
	fblt	%fzero, %f0, fbgt_else.35706
	add	%a0, %zero, %zero
	j	fbgt_cont.35707
fbgt_else.35706:
	add	%a0, %zero, %k1
fbgt_cont.35707:
	beqi	%a0, 0, bnei_else.35708
	fmov	%f0, %f30
	j	bnei_cont.35709
bnei_else.35708:
	flw	%f0, 460(%zero)
bnei_cont.35709:
bnei_cont.35705:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.35691:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.35710
	j	bnei_cont.35689
bnei_else.35710:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f11, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.35712
	add	%a0, %zero, %zero
	j	fbgt_cont.35713
fbgt_else.35712:
	add	%a0, %zero, %k1
fbgt_cont.35713:
	beqi	%a0, 0, bnei_else.35714
	j	bnei_cont.35715
bnei_else.35714:
	fmov	%f0, %fzero
bnei_cont.35715:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t2)
	fmul	%f11, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35711:
	j	bnei_cont.35689
bnei_else.35688:
bnei_cont.35689:
bnei_cont.35647:
	addi	%a1, %zero, 116
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.35871
	lw	%a2, 7(%v0)
	sw	%a2, 7(%sp)
	lw	%fp, 6(%v0)
	sw	%fp, 8(%sp)
	lw	%t0, 5(%v0)
	lw	%a1, 4(%v0)
	sw	%a1, 9(%sp)
	lw	%k0, 3(%v0)
	sw	%k0, 10(%sp)
	lw	%a1, 2(%v0)
	sw	%a1, 11(%sp)
	lw	%a3, 1(%v0)
	sw	%a3, 12(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	blti	%a1, 0, bgti_else.35872
	add	%at, %k0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.35873
	add	%at, %t0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%t2, 0(%fp)
	add	%at, %a2, %v1
	lw	%t1, 0(%at)
	add	%at, %a3, %v1
	lw	%t3, 0(%at)
	beqi	%t2, 0, bnei_else.35875
	lw	%s0, 179(%zero)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	j	bnei_cont.35876
bnei_else.35875:
bnei_cont.35876:
	beqi	%t2, 1, bnei_else.35877
	lw	%s0, 180(%zero)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	j	bnei_cont.35878
bnei_else.35877:
bnei_cont.35878:
	beqi	%t2, 2, bnei_else.35879
	lw	%s0, 181(%zero)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	j	bnei_cont.35880
bnei_else.35879:
bnei_cont.35880:
	beqi	%t2, 3, bnei_else.35881
	lw	%s0, 182(%zero)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	j	bnei_cont.35882
bnei_else.35881:
bnei_cont.35882:
	beqi	%t2, 4, bnei_else.35883
	lw	%s0, 183(%zero)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	j	bnei_cont.35884
bnei_else.35883:
bnei_cont.35884:
	lw	%a1, 9(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.35874
bnei_else.35873:
bnei_cont.35874:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.35885
	lw	%a0, 11(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.35886
	lw	%a0, 10(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.35887
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
	beqi	%t3, 0, bnei_else.35889
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.35890
bnei_else.35889:
bnei_cont.35890:
	beqi	%t3, 1, bnei_else.35891
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.35892
bnei_else.35891:
bnei_cont.35892:
	beqi	%t3, 2, bnei_else.35893
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.35894
bnei_else.35893:
bnei_cont.35894:
	beqi	%t3, 3, bnei_else.35895
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.35896
bnei_else.35895:
bnei_cont.35896:
	beqi	%t3, 4, bnei_else.35897
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.35898
bnei_else.35897:
bnei_cont.35898:
	lw	%a0, 9(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.35888
bnei_else.35887:
bnei_cont.35888:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.35886:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.35885:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.35872:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.35871:
	add	%t0, %zero, %a0
	jr	%ra
try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s2, 0(%at)
	sw	%s2, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.36108
	lw	%s5, 7(%s2)
	lw	%s6, 6(%s2)
	lw	%s1, 5(%s2)
	lw	%fp, 4(%s2)
	sw	%fp, 3(%sp)
	lw	%k0, 3(%s2)
	lw	%s0, 2(%s2)
	lw	%s4, 1(%s2)
	add	%at, %s0, %a3
	lw	%s7, 0(%at)
	blti	%s7, 0, bgti_else.36109
	add	%at, %a0, %v0
	lw	%fp, 0(%at)
	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	add	%at, %s3, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.36110
	add	%at, %a2, %v0
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.36112
	addi	%fp, %v0, -1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.36114
	addi	%fp, %v0, 1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s7, beq_else.36116
	add	%a3, %zero, %k1
	j	beq_cont.36111
beq_else.36116:
	add	%a3, %zero, %zero
beq_cont.36117:
	j	beq_cont.36111
beq_else.36114:
	add	%a3, %zero, %zero
beq_cont.36115:
	j	beq_cont.36111
beq_else.36112:
	add	%a3, %zero, %zero
beq_cont.36113:
	j	beq_cont.36111
beq_else.36110:
	add	%a3, %zero, %zero
beq_cont.36111:
	beqi	%a3, 0, bnei_else.36118
	lw	%s4, 0(%sp)
	add	%at, %k0, %s4
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.36119
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s5, 5(%a3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%ra, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%fp, 5(%a3)
	add	%at, %s2, %s4
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 150(%zero)
	add	%at, %s5, %s4
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
	add	%at, %s1, %s4
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
	add	%at, %ra, %s4
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
	add	%at, %fp, %s4
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
	add	%at, %a3, %s4
	lw	%a3, 0(%at)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a3)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a3)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a3)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.36120
bnei_else.36119:
bnei_cont.36120:
	lw	%a3, 0(%sp)
	addi	%fp, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %fp, bgt_else.36121
	add	%at, %s0, %fp
	lw	%ra, 0(%at)
	blti	%ra, 0, bgti_else.36122
	add	%at, %s3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.36123
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.36125
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.36127
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.36129
	add	%a3, %zero, %k1
	j	beq_cont.36124
beq_else.36129:
	add	%a3, %zero, %zero
beq_cont.36130:
	j	beq_cont.36124
beq_else.36127:
	add	%a3, %zero, %zero
beq_cont.36128:
	j	beq_cont.36124
beq_else.36125:
	add	%a3, %zero, %zero
beq_cont.36126:
	j	beq_cont.36124
beq_else.36123:
	add	%a3, %zero, %zero
beq_cont.36124:
	beqi	%a3, 0, bnei_else.36131
	add	%at, %k0, %fp
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.36132
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%s0, 5(%a3)
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%ra, 5(%a3)
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%k0, 5(%a3)
	add	%at, %s2, %fp
	lw	%a3, 0(%at)
	flw	%f0, 0(%a3)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	fsw	%f0, 150(%zero)
	add	%at, %s0, %fp
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
	add	%at, %s1, %fp
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
	add	%at, %ra, %fp
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
	add	%at, %k0, %fp
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
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a3)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a3)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a3)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.36133
bnei_else.36132:
bnei_cont.36133:
	addi	%a3, %fp, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3018
bnei_else.36131:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002
bgti_else.36122:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.36121:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.36118:
	lw	%a2, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.36136
	blti	%s7, 0, bgti_else.36137
	add	%at, %k0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.36138
	add	%at, %s1, %a2
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
	add	%at, %s4, %a2
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	beqi	%a1, 0, bnei_else.36140
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.36141
bnei_else.36140:
bnei_cont.36141:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.36142
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.36143
bnei_else.36142:
bnei_cont.36143:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.36144
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.36145
bnei_else.36144:
bnei_cont.36145:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.36146
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.36147
bnei_else.36146:
bnei_cont.36147:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.36148
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.36149
bnei_else.36148:
bnei_cont.36149:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.36139
bnei_else.36138:
bnei_cont.36139:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3002
bgti_else.36137:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.36136:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.36109:
	jr	%ra
bgt_else.36108:
	jr	%ra
pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.36258
	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	sw	%a3, 5(%sp)
	lw	%a1, 5(%v0)
	sw	%a1, 6(%sp)
	lw	%fp, 3(%v0)
	sw	%fp, 7(%sp)
	lw	%a1, 2(%v0)
	sw	%a1, 8(%sp)
	lw	%a2, 1(%v0)
	sw	%a2, 9(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	blti	%a1, 0, bgti_else.36259
	add	%at, %fp, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.36260
	lw	%a0, 0(%a3)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%s1, 179(%a0)
	add	%at, %t0, %v1
	lw	%s0, 0(%at)
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
	jal	setup_startp_constants.2882
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	iter_trace_diffuse_rays.2980
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
	j	bnei_cont.36261
bnei_else.36260:
bnei_cont.36261:
	lw	%a0, 1(%sp)
	addi	%t1, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t1, bgt_else.36262
	lw	%a0, 8(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.36263
	lw	%a0, 7(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.36264
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
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -12
	lw	%a0, 10(%sp)
	lw	%v0, 118(%a0)
	lw	%a1, 0(%v0)
	flw	%f1, 0(%a1)
	lw	%a0, 11(%sp)
	flw	%f0, 0(%a0)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f11, %f0
	fblt	%f1, %fzero, fbgt_else.36266
	add	%a0, %zero, %zero
	j	fbgt_cont.36267
fbgt_else.36266:
	add	%a0, %zero, %k1
fbgt_cont.36267:
	beqi	%a0, 0, bnei_else.36268
	lw	%a0, 10(%sp)
	lw	%v0, 119(%a0)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -12
	j	bnei_cont.36269
bnei_else.36268:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -12
bnei_cont.36269:
	addi	%a1, %zero, 116
	lw	%v1, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%a0, %t0, 0
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.36265
bnei_else.36264:
bnei_cont.36265:
	addi	%v1, %t1, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3031
bgti_else.36263:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.36262:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.36259:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.36258:
	add	%t0, %zero, %a0
	jr	%ra
pretrace_pixels.3034:
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
	blti	%v1, 0, bgti_else.36364
	flw	%f12, 158(%zero)
	lw	%a0, 156(%zero)
	sub	%a0, %v1, %a0
	itof	%f11, %a0
	fmul	%f12, %f12, %f11
	flw	%f11, 165(%zero)
	fmul	%f11, %f12, %f11
	fadd	%f0, %f11, %f0
	fsw	%f0, 174(%zero)
	flw	%f0, 166(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f0, %f1
	fsw	%f0, 175(%zero)
	flw	%f0, 167(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f0, %f2
	fsw	%f0, 176(%zero)
	flw	%f13, 174(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 175(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 176(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fbne	%f0, %fzero, fbeq_else.36365
	add	%a0, %zero, %k1
	j	fbeq_cont.36366
fbeq_else.36365:
	add	%a0, %zero, %zero
fbeq_cont.36366:
	beqi	%a0, 0, bnei_else.36367
	fmov	%f0, %f30
	j	bnei_cont.36368
bnei_else.36367:
	fdiv	%f0, %f30, %f0
bnei_cont.36368:
	fmul	%f1, %f13, %f0
	fsw	%f1, 174(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 175(%zero)
	fmul	%f0, %f11, %f0
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
	jal	trace_ray.2971
	addi	%sp, %sp, -11
	lw	%a2, 7(%t0)
	lw	%fp, 6(%t0)
	lw	%a0, 5(%t0)
	sw	%a0, 11(%sp)
	lw	%k0, 3(%t0)
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
	sw	%a0, 0(%fp)
	lw	%a0, 0(%a1)
	blti	%a0, 0, bgti_else.36369
	lw	%a0, 0(%k0)
	beqi	%a0, 0, bnei_else.36371
	lw	%a0, 0(%fp)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%t1, 179(%a0)
	lw	%t2, 0(%a2)
	lw	%t3, 0(%a3)
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
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -12
	lw	%v0, 118(%t1)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t2)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f11, %f0
	fblt	%f1, %fzero, fbgt_else.36373
	add	%a0, %zero, %zero
	j	fbgt_cont.36374
fbgt_else.36373:
	add	%a0, %zero, %k1
fbgt_cont.36374:
	beqi	%a0, 0, bnei_else.36375
	lw	%v0, 119(%t1)
	flw	%f0, 440(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -12
	j	bnei_cont.36376
bnei_else.36375:
	flw	%f0, 439(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 12
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -12
bnei_cont.36376:
	addi	%a1, %zero, 116
	addi	%a0, %t3, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -12
	lw	%a0, 11(%sp)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.36372
bnei_else.36371:
bnei_cont.36372:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -12
	j	bgti_cont.36370
bgti_else.36369:
bgti_cont.36370:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.36377
	addi	%a0, %a0, -5
	j	bgti_cont.36378
bgti_else.36377:
bgti_cont.36378:
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.36364:
	jr	%ra
scan_pixel.3045:
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
	blt	%v0, %t0, bgt_else.37578
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.37578:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%fp, 7(%t1)
	lw	%s0, 6(%t1)
	lw	%k0, 5(%t1)
	lw	%a0, 4(%t1)
	sw	%a0, 11(%sp)
	lw	%a1, 3(%t1)
	lw	%a3, 2(%t1)
	lw	%ra, 1(%t1)
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
	blt	%a0, %a2, bgt_else.37580
	add	%a0, %zero, %zero
	j	bgt_cont.37581
bgt_else.37580:
	blt	%zero, %v1, bgt_else.37582
	add	%a0, %zero, %zero
	j	bgt_cont.37583
bgt_else.37582:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.37584
	add	%a0, %zero, %zero
	j	bgt_cont.37585
bgt_else.37584:
	blt	%zero, %v0, bgt_else.37586
	add	%a0, %zero, %zero
	j	bgt_cont.37587
bgt_else.37586:
	add	%a0, %zero, %k1
bgt_cont.37587:
bgt_cont.37585:
bgt_cont.37583:
bgt_cont.37581:
	beqi	%a0, 0, bnei_else.37588
	lw	%fp, 0(%a3)
	blti	%fp, 0, bnei_cont.37589
	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%ra, 5(%a0)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.37592
	lw	%a0, 4(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.37594
	addi	%a0, %a3, -1
	lw	%a2, 3(%sp)
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.37596
	addi	%a0, %a3, 1
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.37598
	add	%a0, %zero, %k1
	j	beq_cont.37593
beq_else.37598:
	add	%a0, %zero, %zero
beq_cont.37599:
	j	beq_cont.37593
beq_else.37596:
	add	%a0, %zero, %zero
beq_cont.37597:
	j	beq_cont.37593
beq_else.37594:
	add	%a0, %zero, %zero
beq_cont.37595:
	j	beq_cont.37593
beq_else.37592:
	add	%a0, %zero, %zero
beq_cont.37593:
	beqi	%a0, 0, bnei_else.37600
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.37602
	lw	%fp, 0(%sp)
	addi	%a0, %fp, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a3, 5(%a0)
	addi	%a0, %fp, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	add	%at, %a0, %fp
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	lw	%a0, 0(%ra)
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
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.37603
bnei_else.37602:
bnei_cont.37603:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.37589
bnei_else.37600:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.37601:
	j	bnei_cont.37589
bgti_else.37590:
bgti_cont.37591:
	j	bnei_cont.37589
bnei_else.37588:
	lw	%a0, 0(%a3)
	blti	%a0, 0, bgti_else.37604
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.37606
	lw	%a0, 0(%k0)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%t4, 0(%s0)
	lw	%t3, 0(%fp)
	lw	%t2, 0(%ra)
	beqi	%t4, 0, bnei_else.37608
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.37609
bnei_else.37608:
bnei_cont.37609:
	beqi	%t4, 1, bnei_else.37610
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.37611
bnei_else.37610:
bnei_cont.37611:
	beqi	%t4, 2, bnei_else.37612
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.37613
bnei_else.37612:
bnei_cont.37613:
	beqi	%t4, 3, bnei_else.37614
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.37615
bnei_else.37614:
bnei_cont.37615:
	beqi	%t4, 4, bnei_else.37616
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.37617
bnei_else.37616:
bnei_cont.37617:
	lw	%a0, 11(%sp)
	lw	%a0, 0(%a0)
	flw	%f11, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 151(%zero)
	flw	%f11, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 152(%zero)
	flw	%f11, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.37607
bnei_else.37606:
bnei_cont.37607:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
	j	bgti_cont.37605
bgti_else.37604:
bgti_cont.37605:
bnei_cont.37589:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.37618
	blti	%a1, 0, bgti_else.37620
	j	bgt_cont.37619
bgti_else.37620:
	add	%a1, %zero, %zero
bgti_cont.37621:
	j	bgt_cont.37619
bgt_else.37618:
	addi	%a1, %zero, 255
bgt_cont.37619:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	blti	%a1, 10, bgti_else.37622
	blti	%a1, 20, bgti_else.37624
	blti	%a1, 30, bgti_else.37626
	blti	%a1, 40, bgti_else.37628
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37623
	blti	%a1, 20, bgti_else.37632
	blti	%a1, 30, bgti_else.37634
	blti	%a1, 40, bgti_else.37636
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37623
	blti	%a1, 20, bgti_else.37640
	blti	%a1, 30, bgti_else.37642
	blti	%a1, 40, bgti_else.37644
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37623
	blti	%a1, 20, bgti_else.37648
	blti	%a1, 30, bgti_else.37650
	blti	%a1, 40, bgti_else.37652
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.37623
bgti_else.37652:
	addi	%a1, %a1, -30
bgti_cont.37653:
	j	bgti_cont.37623
bgti_else.37650:
	addi	%a1, %a1, -20
bgti_cont.37651:
	j	bgti_cont.37623
bgti_else.37648:
	addi	%a1, %a1, -10
bgti_cont.37649:
	j	bgti_cont.37623
bgti_else.37646:
bgti_cont.37647:
	j	bgti_cont.37623
bgti_else.37644:
	addi	%a1, %a1, -30
bgti_cont.37645:
	j	bgti_cont.37623
bgti_else.37642:
	addi	%a1, %a1, -20
bgti_cont.37643:
	j	bgti_cont.37623
bgti_else.37640:
	addi	%a1, %a1, -10
bgti_cont.37641:
	j	bgti_cont.37623
bgti_else.37638:
bgti_cont.37639:
	j	bgti_cont.37623
bgti_else.37636:
	addi	%a1, %a1, -30
bgti_cont.37637:
	j	bgti_cont.37623
bgti_else.37634:
	addi	%a1, %a1, -20
bgti_cont.37635:
	j	bgti_cont.37623
bgti_else.37632:
	addi	%a1, %a1, -10
bgti_cont.37633:
	j	bgti_cont.37623
bgti_else.37630:
bgti_cont.37631:
	j	bgti_cont.37623
bgti_else.37628:
	addi	%a1, %a1, -30
bgti_cont.37629:
	j	bgti_cont.37623
bgti_else.37626:
	addi	%a1, %a1, -20
bgti_cont.37627:
	j	bgti_cont.37623
bgti_else.37624:
	addi	%a1, %a1, -10
bgti_cont.37625:
	j	bgti_cont.37623
bgti_else.37622:
bgti_cont.37623:
	blt	%zero, %a2, bgt_else.37654
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37655
bgt_else.37654:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.37656
	blti	%a2, 20, bgti_else.37658
	blti	%a2, 30, bgti_else.37660
	blti	%a2, 40, bgti_else.37662
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37657
	blti	%a2, 20, bgti_else.37666
	blti	%a2, 30, bgti_else.37668
	blti	%a2, 40, bgti_else.37670
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37657
	blti	%a2, 20, bgti_else.37674
	blti	%a2, 30, bgti_else.37676
	blti	%a2, 40, bgti_else.37678
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37657
	blti	%a2, 20, bgti_else.37682
	blti	%a2, 30, bgti_else.37684
	blti	%a2, 40, bgti_else.37686
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.37657
bgti_else.37686:
	addi	%a2, %a2, -30
bgti_cont.37687:
	j	bgti_cont.37657
bgti_else.37684:
	addi	%a2, %a2, -20
bgti_cont.37685:
	j	bgti_cont.37657
bgti_else.37682:
	addi	%a2, %a2, -10
bgti_cont.37683:
	j	bgti_cont.37657
bgti_else.37680:
bgti_cont.37681:
	j	bgti_cont.37657
bgti_else.37678:
	addi	%a2, %a2, -30
bgti_cont.37679:
	j	bgti_cont.37657
bgti_else.37676:
	addi	%a2, %a2, -20
bgti_cont.37677:
	j	bgti_cont.37657
bgti_else.37674:
	addi	%a2, %a2, -10
bgti_cont.37675:
	j	bgti_cont.37657
bgti_else.37672:
bgti_cont.37673:
	j	bgti_cont.37657
bgti_else.37670:
	addi	%a2, %a2, -30
bgti_cont.37671:
	j	bgti_cont.37657
bgti_else.37668:
	addi	%a2, %a2, -20
bgti_cont.37669:
	j	bgti_cont.37657
bgti_else.37666:
	addi	%a2, %a2, -10
bgti_cont.37667:
	j	bgti_cont.37657
bgti_else.37664:
bgti_cont.37665:
	j	bgti_cont.37657
bgti_else.37662:
	addi	%a2, %a2, -30
bgti_cont.37663:
	j	bgti_cont.37657
bgti_else.37660:
	addi	%a2, %a2, -20
bgti_cont.37661:
	j	bgti_cont.37657
bgti_else.37658:
	addi	%a2, %a2, -10
bgti_cont.37659:
	j	bgti_cont.37657
bgti_else.37656:
bgti_cont.37657:
	blt	%zero, %a0, bgt_else.37688
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37689
bgt_else.37688:
	blti	%a0, 10, bgti_else.37690
	blti	%a0, 20, bgti_else.37692
	blti	%a0, 30, bgti_else.37694
	blti	%a0, 40, bgti_else.37696
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37691
	blti	%a0, 20, bgti_else.37700
	blti	%a0, 30, bgti_else.37702
	blti	%a0, 40, bgti_else.37704
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37691
	blti	%a0, 20, bgti_else.37708
	blti	%a0, 30, bgti_else.37710
	blti	%a0, 40, bgti_else.37712
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37691
	blti	%a0, 20, bgti_else.37716
	blti	%a0, 30, bgti_else.37718
	blti	%a0, 40, bgti_else.37720
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.37691
bgti_else.37720:
	addi	%a0, %a0, -30
bgti_cont.37721:
	j	bgti_cont.37691
bgti_else.37718:
	addi	%a0, %a0, -20
bgti_cont.37719:
	j	bgti_cont.37691
bgti_else.37716:
	addi	%a0, %a0, -10
bgti_cont.37717:
	j	bgti_cont.37691
bgti_else.37714:
bgti_cont.37715:
	j	bgti_cont.37691
bgti_else.37712:
	addi	%a0, %a0, -30
bgti_cont.37713:
	j	bgti_cont.37691
bgti_else.37710:
	addi	%a0, %a0, -20
bgti_cont.37711:
	j	bgti_cont.37691
bgti_else.37708:
	addi	%a0, %a0, -10
bgti_cont.37709:
	j	bgti_cont.37691
bgti_else.37706:
bgti_cont.37707:
	j	bgti_cont.37691
bgti_else.37704:
	addi	%a0, %a0, -30
bgti_cont.37705:
	j	bgti_cont.37691
bgti_else.37702:
	addi	%a0, %a0, -20
bgti_cont.37703:
	j	bgti_cont.37691
bgti_else.37700:
	addi	%a0, %a0, -10
bgti_cont.37701:
	j	bgti_cont.37691
bgti_else.37698:
bgti_cont.37699:
	j	bgti_cont.37691
bgti_else.37696:
	addi	%a0, %a0, -30
bgti_cont.37697:
	j	bgti_cont.37691
bgti_else.37694:
	addi	%a0, %a0, -20
bgti_cont.37695:
	j	bgti_cont.37691
bgti_else.37692:
	addi	%a0, %a0, -10
bgti_cont.37693:
	j	bgti_cont.37691
bgti_else.37690:
bgti_cont.37691:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.37689:
bgt_cont.37655:
	addi	%t2, %zero, 32
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.37722
	blti	%a1, 0, bgti_else.37724
	j	bgt_cont.37723
bgti_else.37724:
	add	%a1, %zero, %zero
bgti_cont.37725:
	j	bgt_cont.37723
bgt_else.37722:
	addi	%a1, %zero, 255
bgt_cont.37723:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.37726
	blti	%a1, 20, bgti_else.37728
	blti	%a1, 30, bgti_else.37730
	blti	%a1, 40, bgti_else.37732
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37727
	blti	%a1, 20, bgti_else.37736
	blti	%a1, 30, bgti_else.37738
	blti	%a1, 40, bgti_else.37740
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37727
	blti	%a1, 20, bgti_else.37744
	blti	%a1, 30, bgti_else.37746
	blti	%a1, 40, bgti_else.37748
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37727
	blti	%a1, 20, bgti_else.37752
	blti	%a1, 30, bgti_else.37754
	blti	%a1, 40, bgti_else.37756
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.37727
bgti_else.37756:
	addi	%a1, %a1, -30
bgti_cont.37757:
	j	bgti_cont.37727
bgti_else.37754:
	addi	%a1, %a1, -20
bgti_cont.37755:
	j	bgti_cont.37727
bgti_else.37752:
	addi	%a1, %a1, -10
bgti_cont.37753:
	j	bgti_cont.37727
bgti_else.37750:
bgti_cont.37751:
	j	bgti_cont.37727
bgti_else.37748:
	addi	%a1, %a1, -30
bgti_cont.37749:
	j	bgti_cont.37727
bgti_else.37746:
	addi	%a1, %a1, -20
bgti_cont.37747:
	j	bgti_cont.37727
bgti_else.37744:
	addi	%a1, %a1, -10
bgti_cont.37745:
	j	bgti_cont.37727
bgti_else.37742:
bgti_cont.37743:
	j	bgti_cont.37727
bgti_else.37740:
	addi	%a1, %a1, -30
bgti_cont.37741:
	j	bgti_cont.37727
bgti_else.37738:
	addi	%a1, %a1, -20
bgti_cont.37739:
	j	bgti_cont.37727
bgti_else.37736:
	addi	%a1, %a1, -10
bgti_cont.37737:
	j	bgti_cont.37727
bgti_else.37734:
bgti_cont.37735:
	j	bgti_cont.37727
bgti_else.37732:
	addi	%a1, %a1, -30
bgti_cont.37733:
	j	bgti_cont.37727
bgti_else.37730:
	addi	%a1, %a1, -20
bgti_cont.37731:
	j	bgti_cont.37727
bgti_else.37728:
	addi	%a1, %a1, -10
bgti_cont.37729:
	j	bgti_cont.37727
bgti_else.37726:
bgti_cont.37727:
	blt	%zero, %a2, bgt_else.37758
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37759
bgt_else.37758:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.37760
	blti	%a2, 20, bgti_else.37762
	blti	%a2, 30, bgti_else.37764
	blti	%a2, 40, bgti_else.37766
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37761
	blti	%a2, 20, bgti_else.37770
	blti	%a2, 30, bgti_else.37772
	blti	%a2, 40, bgti_else.37774
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37761
	blti	%a2, 20, bgti_else.37778
	blti	%a2, 30, bgti_else.37780
	blti	%a2, 40, bgti_else.37782
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37761
	blti	%a2, 20, bgti_else.37786
	blti	%a2, 30, bgti_else.37788
	blti	%a2, 40, bgti_else.37790
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.37761
bgti_else.37790:
	addi	%a2, %a2, -30
bgti_cont.37791:
	j	bgti_cont.37761
bgti_else.37788:
	addi	%a2, %a2, -20
bgti_cont.37789:
	j	bgti_cont.37761
bgti_else.37786:
	addi	%a2, %a2, -10
bgti_cont.37787:
	j	bgti_cont.37761
bgti_else.37784:
bgti_cont.37785:
	j	bgti_cont.37761
bgti_else.37782:
	addi	%a2, %a2, -30
bgti_cont.37783:
	j	bgti_cont.37761
bgti_else.37780:
	addi	%a2, %a2, -20
bgti_cont.37781:
	j	bgti_cont.37761
bgti_else.37778:
	addi	%a2, %a2, -10
bgti_cont.37779:
	j	bgti_cont.37761
bgti_else.37776:
bgti_cont.37777:
	j	bgti_cont.37761
bgti_else.37774:
	addi	%a2, %a2, -30
bgti_cont.37775:
	j	bgti_cont.37761
bgti_else.37772:
	addi	%a2, %a2, -20
bgti_cont.37773:
	j	bgti_cont.37761
bgti_else.37770:
	addi	%a2, %a2, -10
bgti_cont.37771:
	j	bgti_cont.37761
bgti_else.37768:
bgti_cont.37769:
	j	bgti_cont.37761
bgti_else.37766:
	addi	%a2, %a2, -30
bgti_cont.37767:
	j	bgti_cont.37761
bgti_else.37764:
	addi	%a2, %a2, -20
bgti_cont.37765:
	j	bgti_cont.37761
bgti_else.37762:
	addi	%a2, %a2, -10
bgti_cont.37763:
	j	bgti_cont.37761
bgti_else.37760:
bgti_cont.37761:
	blt	%zero, %a0, bgt_else.37792
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37793
bgt_else.37792:
	blti	%a0, 10, bgti_else.37794
	blti	%a0, 20, bgti_else.37796
	blti	%a0, 30, bgti_else.37798
	blti	%a0, 40, bgti_else.37800
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37795
	blti	%a0, 20, bgti_else.37804
	blti	%a0, 30, bgti_else.37806
	blti	%a0, 40, bgti_else.37808
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37795
	blti	%a0, 20, bgti_else.37812
	blti	%a0, 30, bgti_else.37814
	blti	%a0, 40, bgti_else.37816
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37795
	blti	%a0, 20, bgti_else.37820
	blti	%a0, 30, bgti_else.37822
	blti	%a0, 40, bgti_else.37824
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.37795
bgti_else.37824:
	addi	%a0, %a0, -30
bgti_cont.37825:
	j	bgti_cont.37795
bgti_else.37822:
	addi	%a0, %a0, -20
bgti_cont.37823:
	j	bgti_cont.37795
bgti_else.37820:
	addi	%a0, %a0, -10
bgti_cont.37821:
	j	bgti_cont.37795
bgti_else.37818:
bgti_cont.37819:
	j	bgti_cont.37795
bgti_else.37816:
	addi	%a0, %a0, -30
bgti_cont.37817:
	j	bgti_cont.37795
bgti_else.37814:
	addi	%a0, %a0, -20
bgti_cont.37815:
	j	bgti_cont.37795
bgti_else.37812:
	addi	%a0, %a0, -10
bgti_cont.37813:
	j	bgti_cont.37795
bgti_else.37810:
bgti_cont.37811:
	j	bgti_cont.37795
bgti_else.37808:
	addi	%a0, %a0, -30
bgti_cont.37809:
	j	bgti_cont.37795
bgti_else.37806:
	addi	%a0, %a0, -20
bgti_cont.37807:
	j	bgti_cont.37795
bgti_else.37804:
	addi	%a0, %a0, -10
bgti_cont.37805:
	j	bgti_cont.37795
bgti_else.37802:
bgti_cont.37803:
	j	bgti_cont.37795
bgti_else.37800:
	addi	%a0, %a0, -30
bgti_cont.37801:
	j	bgti_cont.37795
bgti_else.37798:
	addi	%a0, %a0, -20
bgti_cont.37799:
	j	bgti_cont.37795
bgti_else.37796:
	addi	%a0, %a0, -10
bgti_cont.37797:
	j	bgti_cont.37795
bgti_else.37794:
bgti_cont.37795:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.37793:
bgt_cont.37759:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.37826
	blti	%a1, 0, bgti_else.37828
	j	bgt_cont.37827
bgti_else.37828:
	add	%a1, %zero, %zero
bgti_cont.37829:
	j	bgt_cont.37827
bgt_else.37826:
	addi	%a1, %zero, 255
bgt_cont.37827:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.37830
	blti	%a1, 20, bgti_else.37832
	blti	%a1, 30, bgti_else.37834
	blti	%a1, 40, bgti_else.37836
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37831
	blti	%a1, 20, bgti_else.37840
	blti	%a1, 30, bgti_else.37842
	blti	%a1, 40, bgti_else.37844
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37831
	blti	%a1, 20, bgti_else.37848
	blti	%a1, 30, bgti_else.37850
	blti	%a1, 40, bgti_else.37852
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.37831
	blti	%a1, 20, bgti_else.37856
	blti	%a1, 30, bgti_else.37858
	blti	%a1, 40, bgti_else.37860
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.37831
bgti_else.37860:
	addi	%a1, %a1, -30
bgti_cont.37861:
	j	bgti_cont.37831
bgti_else.37858:
	addi	%a1, %a1, -20
bgti_cont.37859:
	j	bgti_cont.37831
bgti_else.37856:
	addi	%a1, %a1, -10
bgti_cont.37857:
	j	bgti_cont.37831
bgti_else.37854:
bgti_cont.37855:
	j	bgti_cont.37831
bgti_else.37852:
	addi	%a1, %a1, -30
bgti_cont.37853:
	j	bgti_cont.37831
bgti_else.37850:
	addi	%a1, %a1, -20
bgti_cont.37851:
	j	bgti_cont.37831
bgti_else.37848:
	addi	%a1, %a1, -10
bgti_cont.37849:
	j	bgti_cont.37831
bgti_else.37846:
bgti_cont.37847:
	j	bgti_cont.37831
bgti_else.37844:
	addi	%a1, %a1, -30
bgti_cont.37845:
	j	bgti_cont.37831
bgti_else.37842:
	addi	%a1, %a1, -20
bgti_cont.37843:
	j	bgti_cont.37831
bgti_else.37840:
	addi	%a1, %a1, -10
bgti_cont.37841:
	j	bgti_cont.37831
bgti_else.37838:
bgti_cont.37839:
	j	bgti_cont.37831
bgti_else.37836:
	addi	%a1, %a1, -30
bgti_cont.37837:
	j	bgti_cont.37831
bgti_else.37834:
	addi	%a1, %a1, -20
bgti_cont.37835:
	j	bgti_cont.37831
bgti_else.37832:
	addi	%a1, %a1, -10
bgti_cont.37833:
	j	bgti_cont.37831
bgti_else.37830:
bgti_cont.37831:
	blt	%zero, %a2, bgt_else.37862
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37863
bgt_else.37862:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.37864
	blti	%a2, 20, bgti_else.37866
	blti	%a2, 30, bgti_else.37868
	blti	%a2, 40, bgti_else.37870
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37865
	blti	%a2, 20, bgti_else.37874
	blti	%a2, 30, bgti_else.37876
	blti	%a2, 40, bgti_else.37878
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37865
	blti	%a2, 20, bgti_else.37882
	blti	%a2, 30, bgti_else.37884
	blti	%a2, 40, bgti_else.37886
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.37865
	blti	%a2, 20, bgti_else.37890
	blti	%a2, 30, bgti_else.37892
	blti	%a2, 40, bgti_else.37894
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.37865
bgti_else.37894:
	addi	%a2, %a2, -30
bgti_cont.37895:
	j	bgti_cont.37865
bgti_else.37892:
	addi	%a2, %a2, -20
bgti_cont.37893:
	j	bgti_cont.37865
bgti_else.37890:
	addi	%a2, %a2, -10
bgti_cont.37891:
	j	bgti_cont.37865
bgti_else.37888:
bgti_cont.37889:
	j	bgti_cont.37865
bgti_else.37886:
	addi	%a2, %a2, -30
bgti_cont.37887:
	j	bgti_cont.37865
bgti_else.37884:
	addi	%a2, %a2, -20
bgti_cont.37885:
	j	bgti_cont.37865
bgti_else.37882:
	addi	%a2, %a2, -10
bgti_cont.37883:
	j	bgti_cont.37865
bgti_else.37880:
bgti_cont.37881:
	j	bgti_cont.37865
bgti_else.37878:
	addi	%a2, %a2, -30
bgti_cont.37879:
	j	bgti_cont.37865
bgti_else.37876:
	addi	%a2, %a2, -20
bgti_cont.37877:
	j	bgti_cont.37865
bgti_else.37874:
	addi	%a2, %a2, -10
bgti_cont.37875:
	j	bgti_cont.37865
bgti_else.37872:
bgti_cont.37873:
	j	bgti_cont.37865
bgti_else.37870:
	addi	%a2, %a2, -30
bgti_cont.37871:
	j	bgti_cont.37865
bgti_else.37868:
	addi	%a2, %a2, -20
bgti_cont.37869:
	j	bgti_cont.37865
bgti_else.37866:
	addi	%a2, %a2, -10
bgti_cont.37867:
	j	bgti_cont.37865
bgti_else.37864:
bgti_cont.37865:
	blt	%zero, %a0, bgt_else.37896
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.37897
bgt_else.37896:
	blti	%a0, 10, bgti_else.37898
	blti	%a0, 20, bgti_else.37900
	blti	%a0, 30, bgti_else.37902
	blti	%a0, 40, bgti_else.37904
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37899
	blti	%a0, 20, bgti_else.37908
	blti	%a0, 30, bgti_else.37910
	blti	%a0, 40, bgti_else.37912
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37899
	blti	%a0, 20, bgti_else.37916
	blti	%a0, 30, bgti_else.37918
	blti	%a0, 40, bgti_else.37920
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.37899
	blti	%a0, 20, bgti_else.37924
	blti	%a0, 30, bgti_else.37926
	blti	%a0, 40, bgti_else.37928
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.37899
bgti_else.37928:
	addi	%a0, %a0, -30
bgti_cont.37929:
	j	bgti_cont.37899
bgti_else.37926:
	addi	%a0, %a0, -20
bgti_cont.37927:
	j	bgti_cont.37899
bgti_else.37924:
	addi	%a0, %a0, -10
bgti_cont.37925:
	j	bgti_cont.37899
bgti_else.37922:
bgti_cont.37923:
	j	bgti_cont.37899
bgti_else.37920:
	addi	%a0, %a0, -30
bgti_cont.37921:
	j	bgti_cont.37899
bgti_else.37918:
	addi	%a0, %a0, -20
bgti_cont.37919:
	j	bgti_cont.37899
bgti_else.37916:
	addi	%a0, %a0, -10
bgti_cont.37917:
	j	bgti_cont.37899
bgti_else.37914:
bgti_cont.37915:
	j	bgti_cont.37899
bgti_else.37912:
	addi	%a0, %a0, -30
bgti_cont.37913:
	j	bgti_cont.37899
bgti_else.37910:
	addi	%a0, %a0, -20
bgti_cont.37911:
	j	bgti_cont.37899
bgti_else.37908:
	addi	%a0, %a0, -10
bgti_cont.37909:
	j	bgti_cont.37899
bgti_else.37906:
bgti_cont.37907:
	j	bgti_cont.37899
bgti_else.37904:
	addi	%a0, %a0, -30
bgti_cont.37905:
	j	bgti_cont.37899
bgti_else.37902:
	addi	%a0, %a0, -20
bgti_cont.37903:
	j	bgti_cont.37899
bgti_else.37900:
	addi	%a0, %a0, -10
bgti_cont.37901:
	j	bgti_cont.37899
bgti_else.37898:
bgti_cont.37899:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.37897:
bgt_cont.37863:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%a0, 0(%sp)
	addi	%t3, %a0, 1
	blt	%t3, %t0, bgt_else.37930
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.37930:
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
	blt	%a0, %a1, bgt_else.37932
	add	%a0, %zero, %zero
	j	bgt_cont.37933
bgt_else.37932:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.37934
	add	%a0, %zero, %zero
	j	bgt_cont.37935
bgt_else.37934:
	addi	%a0, %t3, 1
	blt	%a0, %t0, bgt_else.37936
	add	%a0, %zero, %zero
	j	bgt_cont.37937
bgt_else.37936:
	blt	%zero, %t3, bgt_else.37938
	add	%a0, %zero, %zero
	j	bgt_cont.37939
bgt_else.37938:
	add	%a0, %zero, %k1
bgt_cont.37939:
bgt_cont.37937:
bgt_cont.37935:
bgt_cont.37933:
	beqi	%a0, 0, bnei_else.37940
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.37941
bnei_else.37940:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.37941:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37942
	blti	%v0, 0, bgti_else.37944
	j	bgt_cont.37943
bgti_else.37944:
	add	%v0, %zero, %zero
bgti_cont.37945:
	j	bgt_cont.37943
bgt_else.37942:
	addi	%v0, %zero, 255
bgt_cont.37943:
	addi	%sp, %sp, 14
	jal	print_int.2634
	addi	%v0, %t2, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37946
	blti	%v0, 0, bgti_else.37948
	j	bgt_cont.37947
bgti_else.37948:
	add	%v0, %zero, %zero
bgti_cont.37949:
	j	bgt_cont.37947
bgt_else.37946:
	addi	%v0, %zero, 255
bgt_cont.37947:
	addi	%sp, %sp, 14
	jal	print_int.2634
	addi	%v0, %t2, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37950
	blti	%v0, 0, bgti_else.37952
	j	bgt_cont.37951
bgti_else.37952:
	add	%v0, %zero, %zero
bgti_cont.37953:
	j	bgt_cont.37951
bgt_else.37950:
	addi	%v0, %zero, 255
bgt_cont.37951:
	addi	%sp, %sp, 14
	jal	print_int.2634
	addi	%v0, %t1, 0
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
	j	scan_pixel.3045
scan_line.3051:
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
	blt	%a3, %t0, bgt_else.38114
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.38114:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.38116
	j	bgt_cont.38117
bgt_else.38116:
	addi	%a2, %a3, 1
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%a1, %a2, %a1
	itof	%f0, %a1
	fmul	%f12, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f12, %f0
	flw	%f0, 171(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f11, %f12, %f1
	flw	%f1, 172(%zero)
	fadd	%f1, %f11, %f1
	flw	%f11, 170(%zero)
	fmul	%f12, %f12, %f11
	flw	%f11, 173(%zero)
	fadd	%f2, %f12, %f11
	lw	%a1, 154(%zero)
	addi	%v1, %a1, -1
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -11
bgt_cont.38117:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.38118
	j	bgt_cont.38119
bgt_else.38118:
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
	blt	%a0, %t0, bgt_else.38120
	j	bgt_cont.38121
bgt_else.38120:
	blt	%zero, %a1, bgt_else.38122
	j	bgt_cont.38123
bgt_else.38122:
	blt	%k1, %t1, bgt_else.38124
	j	bgt_cont.38125
bgt_else.38124:
bgt_cont.38125:
bgt_cont.38123:
bgt_cont.38121:
	beqi	%zero, 0, bnei_else.38126
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	j	bnei_cont.38127
bnei_else.38126:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
bnei_cont.38127:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38128
	blti	%v0, 0, bgti_else.38130
	j	bgt_cont.38129
bgti_else.38130:
	add	%v0, %zero, %zero
bgti_cont.38131:
	j	bgt_cont.38129
bgt_else.38128:
	addi	%v0, %zero, 255
bgt_cont.38129:
	addi	%sp, %sp, 11
	jal	print_int.2634
	addi	%fp, %zero, 32
	addi	%v0, %fp, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38132
	blti	%v0, 0, bgti_else.38134
	j	bgt_cont.38133
bgti_else.38134:
	add	%v0, %zero, %zero
bgti_cont.38135:
	j	bgt_cont.38133
bgt_else.38132:
	addi	%v0, %zero, 255
bgt_cont.38133:
	addi	%sp, %sp, 11
	jal	print_int.2634
	addi	%v0, %fp, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38136
	blti	%v0, 0, bgti_else.38138
	j	bgt_cont.38137
bgti_else.38138:
	add	%v0, %zero, %zero
bgti_cont.38139:
	j	bgt_cont.38137
bgt_else.38136:
	addi	%v0, %zero, 255
bgt_cont.38137:
	addi	%sp, %sp, 11
	jal	print_int.2634
	addi	%v0, %zero, 10
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3045
	addi	%sp, %sp, -11
bgt_cont.38119:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.38140
	addi	%t3, %t3, -5
	j	bgti_cont.38141
bgti_else.38140:
bgti_cont.38141:
	blt	%t2, %t0, bgt_else.38142
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.38142:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.38144
	j	bgt_cont.38145
bgt_else.38144:
	addi	%a1, %t2, 1
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %a1, %a0
	itof	%f0, %a0
	fmul	%f12, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f12, %f0
	flw	%f0, 171(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f11, %f12, %f1
	flw	%f1, 172(%zero)
	fadd	%f1, %f11, %f1
	flw	%f11, 170(%zero)
	fmul	%f12, %f12, %f11
	flw	%f11, 173(%zero)
	fadd	%f2, %f12, %f11
	addi	%v1, %t1, -1
	lw	%v0, 1(%sp)
	addi	%a0, %t3, 0
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -11
bgt_cont.38145:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3045
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1
	addi	%a2, %t3, 2
	blti	%a2, 5, bgti_else.38146
	addi	%a2, %a2, -5
	j	bgti_cont.38147
bgti_else.38146:
bgti_cont.38147:
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	j	scan_line.3051
init_line_elements.3061:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.38173
	addi	%fp, %zero, 3
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%s0, %zero, 5
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s4, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s4)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s4)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s4)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s4)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s6, 6(%ra)
	sw	%s5, 5(%ra)
	sw	%s4, 4(%ra)
	sw	%s3, 3(%ra)
	sw	%s2, 2(%ra)
	sw	%s1, 1(%ra)
	sw	%k0, 0(%ra)
	add	%at, %a1, %a2
	sw	%ra, 0(%at)
	addi	%s4, %a2, -1
	blti	%s4, 0, bgti_else.38174
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s6, 6(%ra)
	sw	%s5, 5(%ra)
	sw	%s3, 4(%ra)
	sw	%s2, 3(%ra)
	sw	%s1, 2(%ra)
	sw	%k0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.38175
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s6, 6(%ra)
	sw	%s5, 5(%ra)
	sw	%s3, 4(%ra)
	sw	%s2, 3(%ra)
	sw	%s1, 2(%ra)
	sw	%k0, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s4
	sw	%ra, 0(%at)
	addi	%s4, %s4, -1
	blti	%s4, 0, bgti_else.38176
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s3)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s5)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s5)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%fp, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%fp)
	sw	%s6, 6(%fp)
	sw	%s5, 5(%fp)
	sw	%s3, 4(%fp)
	sw	%s2, 3(%fp)
	sw	%s1, 2(%fp)
	sw	%k0, 1(%fp)
	sw	%a2, 0(%fp)
	add	%at, %a1, %s4
	sw	%fp, 0(%at)
	addi	%v1, %s4, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	init_line_elements.3061
bgti_else.38176:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.38175:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.38174:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.38173:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3071:
	add	%a1, %zero, %a0
	add	%a2, %zero, %ra
	blti	%v0, 5, bgti_else.38278
	fmul	%f12, %f0, %f0
	fmul	%f11, %f1, %f1
	fadd	%f11, %f12, %f11
	fadd	%f11, %f11, %f30
	fsqrt	%f11, %f11
	fdiv	%f14, %f0, %f11
	fdiv	%f13, %f1, %f11
	fdiv	%f12, %f30, %f11
	lw	%a3, 179(%v1)
	add	%at, %a3, %a1
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fsw	%f14, 0(%a0)
	fsw	%f13, 1(%a0)
	fsw	%f12, 2(%a0)
	addi	%a0, %a1, 40
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f13
	fsw	%f14, 0(%a0)
	fsw	%f12, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 80
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f1, %f14
	fneg	%f0, %f13
	fsw	%f12, 0(%a0)
	fsw	%f1, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 1
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f11, %f14
	fneg	%f1, %f13
	fneg	%f0, %f12
	fsw	%f11, 0(%a0)
	fsw	%f1, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 41
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f1, %f14
	fneg	%f0, %f12
	fsw	%f1, 0(%a0)
	fsw	%f0, 1(%a0)
	fsw	%f13, 2(%a0)
	addi	%a0, %a1, 81
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f12
	fsw	%f0, 0(%a0)
	fsw	%f14, 1(%a0)
	add	%ra, %zero, %a2
	fsw	%f13, 2(%a0)
	jr	%ra
bgti_else.38278:
	fmul	%f0, %f1, %f1
	flw	%f16, 441(%zero)
	fadd	%f0, %f0, %f16
	fsqrt	%f17, %f0
	fdiv	%f0, %f30, %f17
	jal	atan.2627
	fmul	%f11, %f0, %f2
	flw	%f18, 470(%zero)
	fblt	%f11, %fzero, fbgt_else.38280
	add	%a0, %zero, %k1
	j	fbgt_cont.38281
fbgt_else.38280:
	add	%a0, %zero, %zero
fbgt_cont.38281:
	fabs	%f1, %f11
	flw	%f19, 469(%zero)
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f18, fbgt_else.38282
	beqi	%a0, 0, bnei_else.38284
	add	%a0, %zero, %zero
	j	fbgt_cont.38283
bnei_else.38284:
	add	%a0, %zero, %k1
bnei_cont.38285:
	j	fbgt_cont.38283
fbgt_else.38282:
fbgt_cont.38283:
	fblt	%f0, %f18, fbgt_else.38286
	fsub	%f0, %f0, %f18
	j	fbgt_cont.38287
fbgt_else.38286:
fbgt_cont.38287:
	flw	%f20, 471(%zero)
	fblt	%f0, %f20, fbgt_else.38288
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38289
fbgt_else.38288:
fbgt_cont.38289:
	flw	%f21, 473(%zero)
	fblt	%f21, %f0, fbgt_else.38290
	fmul	%f14, %f0, %f0
	fmul	%f13, %f14, %f14
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f14
	fsub	%f12, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f13
	fadd	%f12, %f12, %f1
	flw	%f1, 466(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fsub	%f0, %f12, %f0
	j	fbgt_cont.38291
fbgt_else.38290:
	fsub	%f0, %f20, %f0
	fmul	%f13, %f0, %f0
	fmul	%f12, %f13, %f13
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f13
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f0, %f1, %f0
fbgt_cont.38291:
	beqi	%a0, 0, bnei_else.38292
	j	bnei_cont.38293
bnei_else.38292:
	fneg	%f0, %f0
bnei_cont.38293:
	fabs	%f11, %f11
	fdiv	%f1, %f11, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f11, %f1
	fblt	%f1, %f18, fbgt_else.38294
	add	%a0, %zero, %zero
	j	fbgt_cont.38295
fbgt_else.38294:
	add	%a0, %zero, %k1
fbgt_cont.38295:
	fblt	%f1, %f18, fbgt_else.38296
	fsub	%f1, %f1, %f18
	j	fbgt_cont.38297
fbgt_else.38296:
fbgt_cont.38297:
	fblt	%f1, %f20, fbgt_else.38298
	beqi	%a0, 0, bnei_else.38300
	add	%a0, %zero, %zero
	j	fbgt_cont.38299
bnei_else.38300:
	add	%a0, %zero, %k1
bnei_cont.38301:
	j	fbgt_cont.38299
fbgt_else.38298:
fbgt_cont.38299:
	fblt	%f1, %f20, fbgt_else.38302
	fsub	%f1, %f18, %f1
	j	fbgt_cont.38303
fbgt_else.38302:
fbgt_cont.38303:
	fblt	%f21, %f1, fbgt_else.38304
	fmul	%f13, %f1, %f1
	fmul	%f12, %f13, %f13
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f11, %f30, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 463(%zero)
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
	j	fbgt_cont.38305
fbgt_else.38304:
	fsub	%f14, %f20, %f1
	fmul	%f13, %f14, %f14
	fmul	%f12, %f13, %f13
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fsub	%f11, %f14, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 466(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.38305:
	beqi	%a0, 0, bnei_else.38306
	j	bnei_cont.38307
bnei_else.38306:
	fneg	%f1, %f1
bnei_cont.38307:
	fdiv	%f0, %f0, %f1
	fmul	%f17, %f0, %f17
	addi	%v0, %v0, 1
	fmul	%f0, %f17, %f17
	fadd	%f0, %f0, %f16
	fsqrt	%f16, %f0
	fdiv	%f0, %f30, %f16
	jal	atan.2627
	fmul	%f11, %f0, %f3
	fblt	%f11, %fzero, fbgt_else.38308
	add	%a0, %zero, %k1
	j	fbgt_cont.38309
fbgt_else.38308:
	add	%a0, %zero, %zero
fbgt_cont.38309:
	fabs	%f1, %f11
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f18, fbgt_else.38310
	beqi	%a0, 0, bnei_else.38312
	add	%a0, %zero, %zero
	j	fbgt_cont.38311
bnei_else.38312:
	add	%a0, %zero, %k1
bnei_cont.38313:
	j	fbgt_cont.38311
fbgt_else.38310:
fbgt_cont.38311:
	fblt	%f0, %f18, fbgt_else.38314
	fsub	%f0, %f0, %f18
	j	fbgt_cont.38315
fbgt_else.38314:
fbgt_cont.38315:
	fblt	%f0, %f20, fbgt_else.38316
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38317
fbgt_else.38316:
fbgt_cont.38317:
	fblt	%f21, %f0, fbgt_else.38318
	fmul	%f14, %f0, %f0
	fmul	%f13, %f14, %f14
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f14
	fsub	%f12, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f13
	fadd	%f12, %f12, %f1
	flw	%f1, 466(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fsub	%f0, %f12, %f0
	j	fbgt_cont.38319
fbgt_else.38318:
	fsub	%f0, %f20, %f0
	fmul	%f13, %f0, %f0
	fmul	%f12, %f13, %f13
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f13
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f0, %f1, %f0
fbgt_cont.38319:
	beqi	%a0, 0, bnei_else.38320
	j	bnei_cont.38321
bnei_else.38320:
	fneg	%f0, %f0
bnei_cont.38321:
	fabs	%f11, %f11
	fdiv	%f1, %f11, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f11, %f1
	fblt	%f1, %f18, fbgt_else.38322
	add	%a0, %zero, %zero
	j	fbgt_cont.38323
fbgt_else.38322:
	add	%a0, %zero, %k1
fbgt_cont.38323:
	fblt	%f1, %f18, fbgt_else.38324
	fsub	%f1, %f1, %f18
	j	fbgt_cont.38325
fbgt_else.38324:
fbgt_cont.38325:
	fblt	%f1, %f20, fbgt_else.38326
	beqi	%a0, 0, bnei_else.38328
	add	%a0, %zero, %zero
	j	fbgt_cont.38327
bnei_else.38328:
	add	%a0, %zero, %k1
bnei_cont.38329:
	j	fbgt_cont.38327
fbgt_else.38326:
fbgt_cont.38327:
	fblt	%f1, %f20, fbgt_else.38330
	fsub	%f1, %f18, %f1
	j	fbgt_cont.38331
fbgt_else.38330:
fbgt_cont.38331:
	fblt	%f21, %f1, fbgt_else.38332
	fmul	%f13, %f1, %f1
	fmul	%f12, %f13, %f13
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f11, %f30, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 463(%zero)
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
	j	fbgt_cont.38333
fbgt_else.38332:
	fsub	%f14, %f20, %f1
	fmul	%f13, %f14, %f14
	fmul	%f12, %f13, %f13
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fsub	%f11, %f14, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 466(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.38333:
	beqi	%a0, 0, bnei_else.38334
	j	bnei_cont.38335
bnei_else.38334:
	fneg	%f1, %f1
bnei_cont.38335:
	fdiv	%f0, %f0, %f1
	fmul	%f1, %f0, %f16
	add	%ra, %zero, %a2
	addi	%a0, %a1, 0
	fmov	%f0, %f17
	j	calc_dirvec.3071
calc_dirvecs.3079:
	fmov	%f3, %f0
	add	%fp, %zero, %v0
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra
	blti	%fp, 0, bgti_else.38363
	itof	%f0, %fp
	flw	%f22, 479(%zero)
	fmul	%f0, %f0, %f22
	flw	%f24, 438(%zero)
	fsub	%f2, %f0, %f24
	addi	%a0, %k0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %fp
	fmul	%f0, %f0, %f22
	flw	%f23, 441(%zero)
	fadd	%f2, %f0, %f23
	addi	%s1, %k0, 2
	addi	%a0, %s1, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%fp, %fp, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.38364
	addi	%v1, %v1, -5
	j	bgti_cont.38365
bgti_else.38364:
bgti_cont.38365:
	blti	%fp, 0, bgti_else.38366
	itof	%f0, %fp
	fmul	%f0, %f0, %f22
	fsub	%f2, %f0, %f24
	addi	%a0, %k0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %fp
	fmul	%f0, %f0, %f22
	fadd	%f2, %f0, %f23
	addi	%a0, %s1, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%v0, %fp, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.38367
	addi	%v1, %v1, -5
	j	bgti_cont.38368
bgti_else.38367:
bgti_cont.38368:
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3079
bgti_else.38366:
	add	%ra, %zero, %s0
	jr	%ra
bgti_else.38363:
	add	%ra, %zero, %s0
	jr	%ra
calc_dirvec_rows.3084:
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1
	add	%s4, %zero, %a0
	add	%s5, %zero, %ra
	blti	%s2, 0, bgti_else.38401
	itof	%f0, %s2
	flw	%f26, 479(%zero)
	fmul	%f0, %f0, %f26
	flw	%f25, 438(%zero)
	fsub	%f3, %f0, %f25
	addi	%s6, %zero, 4
	itof	%f0, %s6
	fmul	%f0, %f0, %f26
	fsub	%f2, %f0, %f25
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %s6
	fmul	%f1, %f0, %f26
	flw	%f0, 441(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s4, 2
	addi	%v1, %s3, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%v0, %zero, 3
	addi	%v1, %s3, 1
	blti	%v1, 5, bgti_else.38402
	addi	%v1, %v1, -5
	j	bgti_cont.38403
bgti_else.38402:
bgti_cont.38403:
	addi	%a0, %s4, 0
	fmov	%f0, %f3
	jal	calc_dirvecs.3079
	addi	%s7, %s2, -1
	addi	%s2, %s3, 2
	blti	%s2, 5, bgti_else.38404
	addi	%s2, %s2, -5
	j	bgti_cont.38405
bgti_else.38404:
bgti_cont.38405:
	addi	%s3, %s4, 4
	blti	%s7, 0, bgti_else.38406
	itof	%f0, %s7
	fmul	%f0, %f0, %f26
	fsub	%f0, %f0, %f25
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	addi	%v0, %s6, 0
	jal	calc_dirvecs.3079
	addi	%v0, %s7, -1
	addi	%v1, %s2, 2
	blti	%v1, 5, bgti_else.38407
	addi	%v1, %v1, -5
	j	bgti_cont.38408
bgti_else.38407:
bgti_cont.38408:
	addi	%a0, %s3, 4
	add	%ra, %zero, %s5
	j	calc_dirvec_rows.3084
bgti_else.38406:
	add	%ra, %zero, %s5
	jr	%ra
bgti_else.38401:
	add	%ra, %zero, %s5
	jr	%ra
create_dirvec_elements.3090:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.38440
	addi	%fp, %zero, 3
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	lw	%s0, 0(%zero)
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%k0, 0(%a0)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%k0, %a2, -1
	blti	%k0, 0, bgti_else.38441
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %k0
	sw	%a0, 0(%at)
	addi	%k0, %k0, -1
	blti	%k0, 0, bgti_else.38442
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %k0
	sw	%a0, 0(%at)
	addi	%k0, %k0, -1
	blti	%k0, 0, bgti_else.38443
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s0, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %k0
	sw	%a0, 0(%at)
	addi	%v1, %k0, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	create_dirvec_elements.3090
bgti_else.38443:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.38442:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.38441:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.38440:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3093:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	blti	%s1, 0, bgti_else.38469
	addi	%s5, %zero, 120
	addi	%s3, %zero, 3
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	lw	%s4, 0(%zero)
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s1)
	lw	%a2, 179(%s1)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%s6, %zero, 116
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 116(%a2)
	addi	%v1, %zero, 115
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3090
	addi	%s1, %s1, -1
	blti	%s1, 0, bgti_else.38470
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s1)
	lw	%a2, 179(%s1)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%v1, %s6, 0
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3090
	addi	%v0, %s1, -1
	add	%ra, %zero, %s2
	j	create_dirvecs.3093
bgti_else.38470:
	add	%ra, %zero, %s2
	jr	%ra
bgti_else.38469:
	add	%ra, %zero, %s2
	jr	%ra
init_dirvec_constants.3095:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	blti	%s5, 0, bgti_else.38583
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s7, %a0, -1
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.38584
	add	%at, %s4, %s5
	lw	%a1, 0(%at)
	blti	%s7, 0, bgti_else.38585
	lw	%a0, 12(%s7)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.38587
	beqi	%a0, 2, bnei_else.38589
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	flw	%f18, 2(%k0)
	fmul	%f0, %f16, %f16
	flw	%f14, 0(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17
	flw	%f12, 1(%a3)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	flw	%f13, 2(%a3)
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
	beqi	%s1, 0, bnei_else.38591
	fmul	%f11, %f17, %f18
	flw	%f1, 0(%s0)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f17
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.38592
bnei_else.38591:
bnei_cont.38592:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.38593
	flw	%f15, 1(%s0)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s0)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f12
	fmul	%f1, %f16, %f14
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f17, %f12
	fmul	%f1, %f16, %f15
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.38594
bnei_else.38593:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.38594:
	fbne	%f0, %fzero, fbeq_else.38595
	add	%a0, %zero, %k1
	j	fbeq_cont.38596
fbeq_else.38595:
	add	%a0, %zero, %zero
fbeq_cont.38596:
	beqi	%a0, 0, bnei_else.38597
	j	bnei_cont.38598
bnei_else.38597:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.38598:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
	j	bnei_cont.38588
bnei_else.38589:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	fmul	%f1, %f0, %f13
	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f11, 2(%a3)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.38599
	add	%a0, %zero, %zero
	j	fbgt_cont.38600
fbgt_else.38599:
	add	%a0, %zero, %k1
fbgt_cont.38600:
	beqi	%a0, 0, bnei_else.38601
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.38602
bnei_else.38601:
	fsw	%fzero, 0(%v0)
bnei_cont.38602:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.38590:
	j	bnei_cont.38588
bnei_else.38587:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.38603
	add	%a0, %zero, %k1
	j	fbeq_cont.38604
fbeq_else.38603:
	add	%a0, %zero, %zero
fbeq_cont.38604:
	beqi	%a0, 0, bnei_else.38605
	fsw	%fzero, 1(%v0)
	j	bnei_cont.38606
bnei_else.38605:
	fblt	%f1, %fzero, fbgt_else.38607
	add	%a0, %zero, %zero
	j	fbgt_cont.38608
fbgt_else.38607:
	add	%a0, %zero, %k1
fbgt_cont.38608:
	beqi	%fp, 0, bnei_else.38609
	beqi	%a0, 0, bnei_else.38611
	add	%a0, %zero, %zero
	j	bnei_cont.38610
bnei_else.38611:
	add	%a0, %zero, %k1
bnei_cont.38612:
	j	bnei_cont.38610
bnei_else.38609:
bnei_cont.38610:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.38613
	j	bnei_cont.38614
bnei_else.38613:
	fneg	%f0, %f0
bnei_cont.38614:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.38606:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.38615
	add	%a0, %zero, %k1
	j	fbeq_cont.38616
fbeq_else.38615:
	add	%a0, %zero, %zero
fbeq_cont.38616:
	beqi	%a0, 0, bnei_else.38617
	fsw	%fzero, 3(%v0)
	j	bnei_cont.38618
bnei_else.38617:
	fblt	%f1, %fzero, fbgt_else.38619
	add	%a0, %zero, %zero
	j	fbgt_cont.38620
fbgt_else.38619:
	add	%a0, %zero, %k1
fbgt_cont.38620:
	beqi	%fp, 0, bnei_else.38621
	beqi	%a0, 0, bnei_else.38623
	add	%a0, %zero, %zero
	j	bnei_cont.38622
bnei_else.38623:
	add	%a0, %zero, %k1
bnei_cont.38624:
	j	bnei_cont.38622
bnei_else.38621:
bnei_cont.38622:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.38625
	j	bnei_cont.38626
bnei_else.38625:
	fneg	%f0, %f0
bnei_cont.38626:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.38618:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.38627
	add	%a0, %zero, %k1
	j	fbeq_cont.38628
fbeq_else.38627:
	add	%a0, %zero, %zero
fbeq_cont.38628:
	beqi	%a0, 0, bnei_else.38629
	fsw	%fzero, 5(%v0)
	j	bnei_cont.38630
bnei_else.38629:
	fblt	%f1, %fzero, fbgt_else.38631
	add	%a0, %zero, %zero
	j	fbgt_cont.38632
fbgt_else.38631:
	add	%a0, %zero, %k1
fbgt_cont.38632:
	beqi	%fp, 0, bnei_else.38633
	beqi	%a0, 0, bnei_else.38635
	add	%a0, %zero, %zero
	j	bnei_cont.38634
bnei_else.38635:
	add	%a0, %zero, %k1
bnei_cont.38636:
	j	bnei_cont.38634
bnei_else.38633:
bnei_cont.38634:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.38637
	j	bnei_cont.38638
bnei_else.38637:
	fneg	%f0, %f0
bnei_cont.38638:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.38630:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.38588:
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.38586
bgti_else.38585:
bgti_cont.38586:
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.38639
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.38640
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2880
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095
bgti_else.38640:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.38639:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.38584:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.38583:
	add	%ra, %zero, %s6
	jr	%ra
init_vecset_constants.3098:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 0, bgti_else.38855
	lw	%s4, 179(%t7)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.38856
	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.38858
	beqi	%a0, 2, bnei_else.38860
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	flw	%f18, 2(%k0)
	fmul	%f0, %f16, %f16
	flw	%f14, 0(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17
	flw	%f12, 1(%a3)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	flw	%f13, 2(%a3)
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
	beqi	%s1, 0, bnei_else.38862
	fmul	%f11, %f17, %f18
	flw	%f1, 0(%s0)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f16, %f17
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.38863
bnei_else.38862:
bnei_cont.38863:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.38864
	flw	%f15, 1(%s0)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s0)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f12
	fmul	%f1, %f16, %f14
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f2, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f17, %f12
	fmul	%f1, %f16, %f15
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f19, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.38865
bnei_else.38864:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.38865:
	fbne	%f0, %fzero, fbeq_else.38866
	add	%a0, %zero, %k1
	j	fbeq_cont.38867
fbeq_else.38866:
	add	%a0, %zero, %zero
fbeq_cont.38867:
	beqi	%a0, 0, bnei_else.38868
	j	bnei_cont.38869
bnei_else.38868:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.38869:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
	j	bnei_cont.38859
bnei_else.38860:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	fmul	%f1, %f0, %f13
	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f11, 2(%a3)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.38870
	add	%a0, %zero, %zero
	j	fbgt_cont.38871
fbgt_else.38870:
	add	%a0, %zero, %k1
fbgt_cont.38871:
	beqi	%a0, 0, bnei_else.38872
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.38873
bnei_else.38872:
	fsw	%fzero, 0(%v0)
bnei_cont.38873:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.38861:
	j	bnei_cont.38859
bnei_else.38858:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.38874
	add	%a0, %zero, %k1
	j	fbeq_cont.38875
fbeq_else.38874:
	add	%a0, %zero, %zero
fbeq_cont.38875:
	beqi	%a0, 0, bnei_else.38876
	fsw	%fzero, 1(%v0)
	j	bnei_cont.38877
bnei_else.38876:
	fblt	%f1, %fzero, fbgt_else.38878
	add	%a0, %zero, %zero
	j	fbgt_cont.38879
fbgt_else.38878:
	add	%a0, %zero, %k1
fbgt_cont.38879:
	beqi	%fp, 0, bnei_else.38880
	beqi	%a0, 0, bnei_else.38882
	add	%a0, %zero, %zero
	j	bnei_cont.38881
bnei_else.38882:
	add	%a0, %zero, %k1
bnei_cont.38883:
	j	bnei_cont.38881
bnei_else.38880:
bnei_cont.38881:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.38884
	j	bnei_cont.38885
bnei_else.38884:
	fneg	%f0, %f0
bnei_cont.38885:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.38877:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.38886
	add	%a0, %zero, %k1
	j	fbeq_cont.38887
fbeq_else.38886:
	add	%a0, %zero, %zero
fbeq_cont.38887:
	beqi	%a0, 0, bnei_else.38888
	fsw	%fzero, 3(%v0)
	j	bnei_cont.38889
bnei_else.38888:
	fblt	%f1, %fzero, fbgt_else.38890
	add	%a0, %zero, %zero
	j	fbgt_cont.38891
fbgt_else.38890:
	add	%a0, %zero, %k1
fbgt_cont.38891:
	beqi	%fp, 0, bnei_else.38892
	beqi	%a0, 0, bnei_else.38894
	add	%a0, %zero, %zero
	j	bnei_cont.38893
bnei_else.38894:
	add	%a0, %zero, %k1
bnei_cont.38895:
	j	bnei_cont.38893
bnei_else.38892:
bnei_cont.38893:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.38896
	j	bnei_cont.38897
bnei_else.38896:
	fneg	%f0, %f0
bnei_cont.38897:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.38889:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.38898
	add	%a0, %zero, %k1
	j	fbeq_cont.38899
fbeq_else.38898:
	add	%a0, %zero, %zero
fbeq_cont.38899:
	beqi	%a0, 0, bnei_else.38900
	fsw	%fzero, 5(%v0)
	j	bnei_cont.38901
bnei_else.38900:
	fblt	%f1, %fzero, fbgt_else.38902
	add	%a0, %zero, %zero
	j	fbgt_cont.38903
fbgt_else.38902:
	add	%a0, %zero, %k1
fbgt_cont.38903:
	beqi	%fp, 0, bnei_else.38904
	beqi	%a0, 0, bnei_else.38906
	add	%a0, %zero, %zero
	j	bnei_cont.38905
bnei_else.38906:
	add	%a0, %zero, %k1
bnei_cont.38907:
	j	bnei_cont.38905
bnei_else.38904:
bnei_cont.38905:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.38908
	j	bnei_cont.38909
bnei_else.38908:
	fneg	%f0, %f0
bnei_cont.38909:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.38901:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.38859:
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.38857
bgti_else.38856:
bgti_cont.38857:
	addi	%a0, %zero, 118
	lw	%v0, 118(%s4)
	addi	%v1, %t9, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%a0, %zero, 117
	lw	%v0, 117(%s4)
	jal	setup_dirvec_constants.2880
	addi	%v1, %zero, 116
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3095
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.38910
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	addi	%v1, %t9, 0
	jal	iter_setup_dirvec_constants.2877
	lw	%v0, 118(%s4)
	jal	setup_dirvec_constants.2880
	addi	%v1, %zero, 117
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3095
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.38911
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	jal	setup_dirvec_constants.2880
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3095
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.38912
	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3098
bgti_else.38912:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.38911:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.38910:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.38855:
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
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
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
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
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
	sw	%s1, 6(%v1)
	sw	%s0, 5(%v1)
	sw	%k0, 4(%v1)
	sw	%fp, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	lw	%a0, 0(%sp)
	addi	%s7, %a0, -2
	blti	%s7, 0, bgti_else.40525
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
	addi	%fp, %v0, 0
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
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s2, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%fp, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s7
	sw	%ra, 0(%at)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3061
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	j	bgti_cont.40526
bgti_else.40525:
bgti_cont.40526:
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
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
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
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
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
	sw	%s1, 6(%v1)
	sw	%s0, 5(%v1)
	sw	%k0, 4(%v1)
	sw	%fp, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	blti	%s7, 0, bgti_else.40527
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
	addi	%fp, %v0, 0
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
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s2, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%fp, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s7
	sw	%ra, 0(%at)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3061
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	j	bgti_cont.40528
bgti_else.40527:
bgti_cont.40528:
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
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%k0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%k0)
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
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
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
	sw	%s1, 6(%v1)
	sw	%s0, 5(%v1)
	sw	%k0, 4(%v1)
	sw	%fp, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	blti	%s7, 0, bgti_else.40529
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
	addi	%fp, %v0, 0
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
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s2, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%fp, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %a1, %s7
	sw	%ra, 0(%at)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	init_line_elements.3061
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	j	bgti_cont.40530
bgti_else.40529:
bgti_cont.40530:
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
	flw	%f13, 461(%zero)
	fmul	%f11, %f0, %f13
	flw	%f12, 470(%zero)
	fabs	%f1, %f11
	flw	%f14, 469(%zero)
	fdiv	%f0, %f1, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.40531
	add	%a0, %zero, %zero
	j	fbgt_cont.40532
fbgt_else.40531:
	add	%a0, %zero, %k1
fbgt_cont.40532:
	fblt	%f0, %f12, fbgt_else.40533
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40534
fbgt_else.40533:
fbgt_cont.40534:
	flw	%f15, 471(%zero)
	fblt	%f0, %f15, fbgt_else.40535
	beqi	%a0, 0, bnei_else.40537
	add	%a0, %zero, %zero
	j	fbgt_cont.40536
bnei_else.40537:
	add	%a0, %zero, %k1
bnei_cont.40538:
	j	fbgt_cont.40536
fbgt_else.40535:
fbgt_cont.40536:
	fblt	%f0, %f15, fbgt_else.40539
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40540
fbgt_else.40539:
fbgt_cont.40540:
	flw	%f16, 473(%zero)
	fblt	%f16, %f0, fbgt_else.40541
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	j	fbgt_cont.40542
fbgt_else.40541:
	fsub	%f19, %f15, %f0
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f1, %f19, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
fbgt_cont.40542:
	beqi	%a0, 0, bnei_else.40543
	j	bnei_cont.40544
bnei_else.40543:
	fneg	%f1, %f1
bnei_cont.40544:
	fblt	%f11, %fzero, fbgt_else.40545
	add	%a0, %zero, %k1
	j	fbgt_cont.40546
fbgt_else.40545:
	add	%a0, %zero, %zero
fbgt_cont.40546:
	fabs	%f11, %f11
	fdiv	%f0, %f11, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.40547
	beqi	%a0, 0, bnei_else.40549
	add	%a0, %zero, %zero
	j	fbgt_cont.40548
bnei_else.40549:
	add	%a0, %zero, %k1
bnei_cont.40550:
	j	fbgt_cont.40548
fbgt_else.40547:
fbgt_cont.40548:
	fblt	%f0, %f12, fbgt_else.40551
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40552
fbgt_else.40551:
fbgt_cont.40552:
	fblt	%f0, %f15, fbgt_else.40553
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40554
fbgt_else.40553:
fbgt_cont.40554:
	fblt	%f16, %f0, fbgt_else.40555
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	flw	%f11, 468(%zero)
	fmul	%f11, %f11, %f0
	fmul	%f11, %f11, %f19
	fsub	%f17, %f0, %f11
	flw	%f11, 467(%zero)
	fmul	%f11, %f11, %f0
	fmul	%f11, %f11, %f18
	fadd	%f17, %f17, %f11
	flw	%f11, 466(%zero)
	fmul	%f0, %f11, %f0
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f11, %f17, %f0
	j	fbgt_cont.40556
fbgt_else.40555:
	fsub	%f0, %f15, %f0
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f11, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f11, %f11, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f11, %f11, %f0
fbgt_cont.40556:
	beqi	%a0, 0, bnei_else.40557
	j	bnei_cont.40558
bnei_else.40557:
	fneg	%f11, %f11
bnei_cont.40558:
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f18, %f0, %f13
	fabs	%f17, %f18
	fdiv	%f0, %f17, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f17, %f0
	fblt	%f0, %f12, fbgt_else.40559
	add	%a0, %zero, %zero
	j	fbgt_cont.40560
fbgt_else.40559:
	add	%a0, %zero, %k1
fbgt_cont.40560:
	fblt	%f0, %f12, fbgt_else.40561
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40562
fbgt_else.40561:
fbgt_cont.40562:
	fblt	%f0, %f15, fbgt_else.40563
	beqi	%a0, 0, bnei_else.40565
	add	%a0, %zero, %zero
	j	fbgt_cont.40564
bnei_else.40565:
	add	%a0, %zero, %k1
bnei_cont.40566:
	j	fbgt_cont.40564
fbgt_else.40563:
fbgt_cont.40564:
	fblt	%f0, %f15, fbgt_else.40567
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40568
fbgt_else.40567:
fbgt_cont.40568:
	fblt	%f16, %f0, fbgt_else.40569
	fmul	%f2, %f0, %f0
	fmul	%f19, %f2, %f2
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f2
	fsub	%f17, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f17, %f17, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fsub	%f0, %f17, %f0
	j	fbgt_cont.40570
fbgt_else.40569:
	fsub	%f20, %f15, %f0
	fmul	%f2, %f20, %f20
	fmul	%f19, %f2, %f2
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fsub	%f17, %f20, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f17, %f17, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fsub	%f0, %f17, %f0
fbgt_cont.40570:
	beqi	%a0, 0, bnei_else.40571
	j	bnei_cont.40572
bnei_else.40571:
	fneg	%f0, %f0
bnei_cont.40572:
	fblt	%f18, %fzero, fbgt_else.40573
	add	%a0, %zero, %k1
	j	fbgt_cont.40574
fbgt_else.40573:
	add	%a0, %zero, %zero
fbgt_cont.40574:
	fabs	%f18, %f18
	fdiv	%f17, %f18, %f14
	floor	%f17, %f17
	fmul	%f17, %f17, %f14
	fsub	%f17, %f18, %f17
	fblt	%f17, %f12, fbgt_else.40575
	beqi	%a0, 0, bnei_else.40577
	add	%a0, %zero, %zero
	j	fbgt_cont.40576
bnei_else.40577:
	add	%a0, %zero, %k1
bnei_cont.40578:
	j	fbgt_cont.40576
fbgt_else.40575:
fbgt_cont.40576:
	fblt	%f17, %f12, fbgt_else.40579
	fsub	%f17, %f17, %f12
	j	fbgt_cont.40580
fbgt_else.40579:
fbgt_cont.40580:
	fblt	%f17, %f15, fbgt_else.40581
	fsub	%f17, %f12, %f17
	j	fbgt_cont.40582
fbgt_else.40581:
fbgt_cont.40582:
	fblt	%f16, %f17, fbgt_else.40583
	fmul	%f20, %f17, %f17
	fmul	%f2, %f20, %f20
	flw	%f18, 468(%zero)
	fmul	%f18, %f18, %f17
	fmul	%f18, %f18, %f20
	fsub	%f19, %f17, %f18
	flw	%f18, 467(%zero)
	fmul	%f18, %f18, %f17
	fmul	%f18, %f18, %f2
	fadd	%f19, %f19, %f18
	flw	%f18, 466(%zero)
	fmul	%f17, %f18, %f17
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f19, %f17
	j	fbgt_cont.40584
fbgt_else.40583:
	fsub	%f17, %f15, %f17
	fmul	%f2, %f17, %f17
	fmul	%f19, %f2, %f2
	flw	%f17, 465(%zero)
	fmul	%f17, %f17, %f2
	fsub	%f18, %f30, %f17
	flw	%f17, 464(%zero)
	fmul	%f17, %f17, %f19
	fadd	%f18, %f18, %f17
	flw	%f17, 463(%zero)
	fmul	%f17, %f17, %f2
	fmul	%f17, %f17, %f19
	fsub	%f17, %f18, %f17
fbgt_cont.40584:
	beqi	%a0, 0, bnei_else.40585
	j	bnei_cont.40586
bnei_else.40585:
	fneg	%f17, %f17
bnei_cont.40586:
	fmul	%f18, %f1, %f17
	flw	%f19, 436(%zero)
	fmul	%f18, %f18, %f19
	fsw	%f18, 171(%zero)
	flw	%f18, 435(%zero)
	fmul	%f18, %f11, %f18
	fsw	%f18, 172(%zero)
	fmul	%f18, %f1, %f0
	fmul	%f18, %f18, %f19
	fsw	%f18, 173(%zero)
	fsw	%f0, 165(%zero)
	fsw	%fzero, 166(%zero)
	fneg	%f18, %f17
	fsw	%f18, 167(%zero)
	fneg	%f18, %f11
	fmul	%f17, %f18, %f17
	fsw	%f17, 168(%zero)
	fneg	%f1, %f1
	fsw	%f1, 169(%zero)
	fneg	%f1, %f11
	fmul	%f0, %f1, %f0
	fsw	%f0, 170(%zero)
	flw	%f0, 72(%zero)
	flw	%f27, 171(%zero)
	fsub	%f0, %f0, %f27
	fsw	%f0, 75(%zero)
	flw	%f0, 73(%zero)
	flw	%f28, 172(%zero)
	fsub	%f0, %f0, %f28
	fsw	%f0, 76(%zero)
	flw	%f0, 74(%zero)
	flw	%f29, 173(%zero)
	fsub	%f0, %f0, %f29
	fsw	%f0, 77(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f11, %f0, %f13
	fblt	%f11, %fzero, fbgt_else.40587
	add	%a0, %zero, %k1
	j	fbgt_cont.40588
fbgt_else.40587:
	add	%a0, %zero, %zero
fbgt_cont.40588:
	fabs	%f1, %f11
	fdiv	%f0, %f1, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.40589
	beqi	%a0, 0, bnei_else.40591
	add	%a0, %zero, %zero
	j	fbgt_cont.40590
bnei_else.40591:
	add	%a0, %zero, %k1
bnei_cont.40592:
	j	fbgt_cont.40590
fbgt_else.40589:
fbgt_cont.40590:
	fblt	%f0, %f12, fbgt_else.40593
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40594
fbgt_else.40593:
fbgt_cont.40594:
	fblt	%f0, %f15, fbgt_else.40595
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40596
fbgt_else.40595:
fbgt_cont.40596:
	fblt	%f16, %f0, fbgt_else.40597
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fsub	%f17, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f17, %f17, %f1
	flw	%f1, 466(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f0, %f17, %f0
	j	fbgt_cont.40598
fbgt_else.40597:
	fsub	%f0, %f15, %f0
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
fbgt_cont.40598:
	beqi	%a0, 0, bnei_else.40599
	j	bnei_cont.40600
bnei_else.40599:
	fneg	%f0, %f0
bnei_cont.40600:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f13, %f0, %f13
	fabs	%f1, %f11
	fdiv	%f0, %f1, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.40601
	add	%a0, %zero, %zero
	j	fbgt_cont.40602
fbgt_else.40601:
	add	%a0, %zero, %k1
fbgt_cont.40602:
	fblt	%f0, %f12, fbgt_else.40603
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40604
fbgt_else.40603:
fbgt_cont.40604:
	fblt	%f0, %f15, fbgt_else.40605
	beqi	%a0, 0, bnei_else.40607
	add	%a0, %zero, %zero
	j	fbgt_cont.40606
bnei_else.40607:
	add	%a0, %zero, %k1
bnei_cont.40608:
	j	fbgt_cont.40606
fbgt_else.40605:
fbgt_cont.40606:
	fblt	%f0, %f15, fbgt_else.40609
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40610
fbgt_else.40609:
fbgt_cont.40610:
	fblt	%f16, %f0, fbgt_else.40611
	fmul	%f17, %f0, %f0
	fmul	%f11, %f17, %f17
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40612
fbgt_else.40611:
	fsub	%f18, %f15, %f0
	fmul	%f17, %f18, %f18
	fmul	%f11, %f17, %f17
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.40612:
	beqi	%a0, 0, bnei_else.40613
	j	bnei_cont.40614
bnei_else.40613:
	fneg	%f0, %f0
bnei_cont.40614:
	fblt	%f13, %fzero, fbgt_else.40615
	add	%a0, %zero, %k1
	j	fbgt_cont.40616
fbgt_else.40615:
	add	%a0, %zero, %zero
fbgt_cont.40616:
	fabs	%f11, %f13
	fdiv	%f1, %f11, %f14
	floor	%f1, %f1
	fmul	%f1, %f1, %f14
	fsub	%f1, %f11, %f1
	fblt	%f1, %f12, fbgt_else.40617
	beqi	%a0, 0, bnei_else.40619
	add	%a0, %zero, %zero
	j	fbgt_cont.40618
bnei_else.40619:
	add	%a0, %zero, %k1
bnei_cont.40620:
	j	fbgt_cont.40618
fbgt_else.40617:
fbgt_cont.40618:
	fblt	%f1, %f12, fbgt_else.40621
	fsub	%f1, %f1, %f12
	j	fbgt_cont.40622
fbgt_else.40621:
fbgt_cont.40622:
	fblt	%f1, %f15, fbgt_else.40623
	fsub	%f1, %f12, %f1
	j	fbgt_cont.40624
fbgt_else.40623:
fbgt_cont.40624:
	fblt	%f16, %f1, fbgt_else.40625
	fmul	%f19, %f1, %f1
	fmul	%f18, %f19, %f19
	flw	%f11, 468(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f19
	fsub	%f17, %f1, %f11
	flw	%f11, 467(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f18
	fadd	%f17, %f17, %f11
	flw	%f11, 466(%zero)
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f1, %f17, %f1
	j	fbgt_cont.40626
fbgt_else.40625:
	fsub	%f1, %f15, %f1
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f18
	fsub	%f11, %f30, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f17
	fadd	%f11, %f11, %f1
	flw	%f1, 463(%zero)
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f11, %f1
fbgt_cont.40626:
	beqi	%a0, 0, bnei_else.40627
	j	bnei_cont.40628
bnei_else.40627:
	fneg	%f1, %f1
bnei_cont.40628:
	fmul	%f1, %f0, %f1
	fsw	%f1, 78(%zero)
	fabs	%f11, %f13
	fdiv	%f1, %f11, %f14
	floor	%f1, %f1
	fmul	%f1, %f1, %f14
	fsub	%f1, %f11, %f1
	fblt	%f1, %f12, fbgt_else.40629
	add	%a0, %zero, %zero
	j	fbgt_cont.40630
fbgt_else.40629:
	add	%a0, %zero, %k1
fbgt_cont.40630:
	fblt	%f1, %f12, fbgt_else.40631
	fsub	%f1, %f1, %f12
	j	fbgt_cont.40632
fbgt_else.40631:
fbgt_cont.40632:
	fblt	%f1, %f15, fbgt_else.40633
	beqi	%a0, 0, bnei_else.40635
	add	%a0, %zero, %zero
	j	fbgt_cont.40634
bnei_else.40635:
	add	%a0, %zero, %k1
bnei_cont.40636:
	j	fbgt_cont.40634
fbgt_else.40633:
fbgt_cont.40634:
	fblt	%f1, %f15, fbgt_else.40637
	fsub	%f1, %f12, %f1
	j	fbgt_cont.40638
fbgt_else.40637:
fbgt_cont.40638:
	fblt	%f16, %f1, fbgt_else.40639
	fmul	%f13, %f1, %f1
	fmul	%f12, %f13, %f13
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f11, %f30, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 463(%zero)
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
	j	fbgt_cont.40640
fbgt_else.40639:
	fsub	%f14, %f15, %f1
	fmul	%f13, %f14, %f14
	fmul	%f12, %f13, %f13
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fsub	%f11, %f14, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 466(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.40640:
	beqi	%a0, 0, bnei_else.40641
	j	bnei_cont.40642
bnei_else.40641:
	fneg	%f1, %f1
bnei_cont.40642:
	fmul	%f0, %f0, %f1
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.40643
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.40645
	addi	%v0, %zero, 2
	addi	%sp, %sp, 4
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.40647
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.40649
	addi	%v0, %zero, 4
	addi	%sp, %sp, 4
	jal	read_object.2772
	addi	%sp, %sp, -4
	j	bnei_cont.40644
bnei_else.40649:
	addi	%a0, %zero, 3
	sw	%a0, 0(%zero)
bnei_cont.40650:
	j	bnei_cont.40644
bnei_else.40647:
	addi	%a0, %zero, 2
	sw	%a0, 0(%zero)
bnei_cont.40648:
	j	bnei_cont.40644
bnei_else.40645:
	sw	%k1, 0(%zero)
bnei_cont.40646:
	j	bnei_cont.40644
bnei_else.40643:
	sw	%zero, 0(%zero)
bnei_cont.40644:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.40651
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	read_and_network.2780
	addi	%sp, %sp, -4
	j	bnei_cont.40652
bnei_else.40651:
bnei_cont.40652:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	lw	%a0, 0(%s0)
	beqi	%a0, -1, bnei_else.40653
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	read_or_network.2778
	addi	%sp, %sp, -4
	sw	%s0, 0(%v0)
	j	bnei_cont.40654
bnei_else.40653:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
bnei_cont.40654:
	sw	%v0, 134(%zero)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %zero, 51
	jal	min_caml_print_char
	addi	%a1, %zero, 10
	addi	%v0, %a1, 0
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	lw	%v0, 0(%sp)
	addi	%v1, %zero, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	lw	%a3, 0(%sp)
	blti	%a3, 10, bgti_else.40655
	blti	%a3, 20, bgti_else.40657
	blti	%a3, 30, bgti_else.40659
	blti	%a3, 40, bgti_else.40661
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40656
	blti	%a3, 20, bgti_else.40665
	blti	%a3, 30, bgti_else.40667
	blti	%a3, 40, bgti_else.40669
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40656
	blti	%a3, 20, bgti_else.40673
	blti	%a3, 30, bgti_else.40675
	blti	%a3, 40, bgti_else.40677
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40656
	blti	%a3, 20, bgti_else.40681
	blti	%a3, 30, bgti_else.40683
	blti	%a3, 40, bgti_else.40685
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	j	bgti_cont.40656
bgti_else.40685:
	addi	%a3, %a3, -30
bgti_cont.40686:
	j	bgti_cont.40656
bgti_else.40683:
	addi	%a3, %a3, -20
bgti_cont.40684:
	j	bgti_cont.40656
bgti_else.40681:
	addi	%a3, %a3, -10
bgti_cont.40682:
	j	bgti_cont.40656
bgti_else.40679:
bgti_cont.40680:
	j	bgti_cont.40656
bgti_else.40677:
	addi	%a3, %a3, -30
bgti_cont.40678:
	j	bgti_cont.40656
bgti_else.40675:
	addi	%a3, %a3, -20
bgti_cont.40676:
	j	bgti_cont.40656
bgti_else.40673:
	addi	%a3, %a3, -10
bgti_cont.40674:
	j	bgti_cont.40656
bgti_else.40671:
bgti_cont.40672:
	j	bgti_cont.40656
bgti_else.40669:
	addi	%a3, %a3, -30
bgti_cont.40670:
	j	bgti_cont.40656
bgti_else.40667:
	addi	%a3, %a3, -20
bgti_cont.40668:
	j	bgti_cont.40656
bgti_else.40665:
	addi	%a3, %a3, -10
bgti_cont.40666:
	j	bgti_cont.40656
bgti_else.40663:
bgti_cont.40664:
	j	bgti_cont.40656
bgti_else.40661:
	addi	%a3, %a3, -30
bgti_cont.40662:
	j	bgti_cont.40656
bgti_else.40659:
	addi	%a3, %a3, -20
bgti_cont.40660:
	j	bgti_cont.40656
bgti_else.40657:
	addi	%a3, %a3, -10
bgti_cont.40658:
	j	bgti_cont.40656
bgti_else.40655:
bgti_cont.40656:
	blt	%zero, %a2, bgt_else.40687
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40688
bgt_else.40687:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.40689
	blti	%a2, 20, bgti_else.40691
	blti	%a2, 30, bgti_else.40693
	blti	%a2, 40, bgti_else.40695
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40690
	blti	%a2, 20, bgti_else.40699
	blti	%a2, 30, bgti_else.40701
	blti	%a2, 40, bgti_else.40703
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40690
	blti	%a2, 20, bgti_else.40707
	blti	%a2, 30, bgti_else.40709
	blti	%a2, 40, bgti_else.40711
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40690
	blti	%a2, 20, bgti_else.40715
	blti	%a2, 30, bgti_else.40717
	blti	%a2, 40, bgti_else.40719
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	j	bgti_cont.40690
bgti_else.40719:
	addi	%a2, %a2, -30
bgti_cont.40720:
	j	bgti_cont.40690
bgti_else.40717:
	addi	%a2, %a2, -20
bgti_cont.40718:
	j	bgti_cont.40690
bgti_else.40715:
	addi	%a2, %a2, -10
bgti_cont.40716:
	j	bgti_cont.40690
bgti_else.40713:
bgti_cont.40714:
	j	bgti_cont.40690
bgti_else.40711:
	addi	%a2, %a2, -30
bgti_cont.40712:
	j	bgti_cont.40690
bgti_else.40709:
	addi	%a2, %a2, -20
bgti_cont.40710:
	j	bgti_cont.40690
bgti_else.40707:
	addi	%a2, %a2, -10
bgti_cont.40708:
	j	bgti_cont.40690
bgti_else.40705:
bgti_cont.40706:
	j	bgti_cont.40690
bgti_else.40703:
	addi	%a2, %a2, -30
bgti_cont.40704:
	j	bgti_cont.40690
bgti_else.40701:
	addi	%a2, %a2, -20
bgti_cont.40702:
	j	bgti_cont.40690
bgti_else.40699:
	addi	%a2, %a2, -10
bgti_cont.40700:
	j	bgti_cont.40690
bgti_else.40697:
bgti_cont.40698:
	j	bgti_cont.40690
bgti_else.40695:
	addi	%a2, %a2, -30
bgti_cont.40696:
	j	bgti_cont.40690
bgti_else.40693:
	addi	%a2, %a2, -20
bgti_cont.40694:
	j	bgti_cont.40690
bgti_else.40691:
	addi	%a2, %a2, -10
bgti_cont.40692:
	j	bgti_cont.40690
bgti_else.40689:
bgti_cont.40690:
	blt	%zero, %a0, bgt_else.40721
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40722
bgt_else.40721:
	blti	%a0, 10, bgti_else.40723
	blti	%a0, 20, bgti_else.40725
	blti	%a0, 30, bgti_else.40727
	blti	%a0, 40, bgti_else.40729
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40724
	blti	%a0, 20, bgti_else.40733
	blti	%a0, 30, bgti_else.40735
	blti	%a0, 40, bgti_else.40737
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40724
	blti	%a0, 20, bgti_else.40741
	blti	%a0, 30, bgti_else.40743
	blti	%a0, 40, bgti_else.40745
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40724
	blti	%a0, 20, bgti_else.40749
	blti	%a0, 30, bgti_else.40751
	blti	%a0, 40, bgti_else.40753
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.40724
bgti_else.40753:
	addi	%a0, %a0, -30
bgti_cont.40754:
	j	bgti_cont.40724
bgti_else.40751:
	addi	%a0, %a0, -20
bgti_cont.40752:
	j	bgti_cont.40724
bgti_else.40749:
	addi	%a0, %a0, -10
bgti_cont.40750:
	j	bgti_cont.40724
bgti_else.40747:
bgti_cont.40748:
	j	bgti_cont.40724
bgti_else.40745:
	addi	%a0, %a0, -30
bgti_cont.40746:
	j	bgti_cont.40724
bgti_else.40743:
	addi	%a0, %a0, -20
bgti_cont.40744:
	j	bgti_cont.40724
bgti_else.40741:
	addi	%a0, %a0, -10
bgti_cont.40742:
	j	bgti_cont.40724
bgti_else.40739:
bgti_cont.40740:
	j	bgti_cont.40724
bgti_else.40737:
	addi	%a0, %a0, -30
bgti_cont.40738:
	j	bgti_cont.40724
bgti_else.40735:
	addi	%a0, %a0, -20
bgti_cont.40736:
	j	bgti_cont.40724
bgti_else.40733:
	addi	%a0, %a0, -10
bgti_cont.40734:
	j	bgti_cont.40724
bgti_else.40731:
bgti_cont.40732:
	j	bgti_cont.40724
bgti_else.40729:
	addi	%a0, %a0, -30
bgti_cont.40730:
	j	bgti_cont.40724
bgti_else.40727:
	addi	%a0, %a0, -20
bgti_cont.40728:
	j	bgti_cont.40724
bgti_else.40725:
	addi	%a0, %a0, -10
bgti_cont.40726:
	j	bgti_cont.40724
bgti_else.40723:
bgti_cont.40724:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.40722:
bgt_cont.40688:
	addi	%a2, %zero, 32
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	addi	%v0, %a3, 0
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	blti	%a3, 10, bgti_else.40755
	blti	%a3, 20, bgti_else.40757
	blti	%a3, 30, bgti_else.40759
	blti	%a3, 40, bgti_else.40761
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40756
	blti	%a3, 20, bgti_else.40765
	blti	%a3, 30, bgti_else.40767
	blti	%a3, 40, bgti_else.40769
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40756
	blti	%a3, 20, bgti_else.40773
	blti	%a3, 30, bgti_else.40775
	blti	%a3, 40, bgti_else.40777
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.40756
	blti	%a3, 20, bgti_else.40781
	blti	%a3, 30, bgti_else.40783
	blti	%a3, 40, bgti_else.40785
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	j	bgti_cont.40756
bgti_else.40785:
	addi	%a3, %a3, -30
bgti_cont.40786:
	j	bgti_cont.40756
bgti_else.40783:
	addi	%a3, %a3, -20
bgti_cont.40784:
	j	bgti_cont.40756
bgti_else.40781:
	addi	%a3, %a3, -10
bgti_cont.40782:
	j	bgti_cont.40756
bgti_else.40779:
bgti_cont.40780:
	j	bgti_cont.40756
bgti_else.40777:
	addi	%a3, %a3, -30
bgti_cont.40778:
	j	bgti_cont.40756
bgti_else.40775:
	addi	%a3, %a3, -20
bgti_cont.40776:
	j	bgti_cont.40756
bgti_else.40773:
	addi	%a3, %a3, -10
bgti_cont.40774:
	j	bgti_cont.40756
bgti_else.40771:
bgti_cont.40772:
	j	bgti_cont.40756
bgti_else.40769:
	addi	%a3, %a3, -30
bgti_cont.40770:
	j	bgti_cont.40756
bgti_else.40767:
	addi	%a3, %a3, -20
bgti_cont.40768:
	j	bgti_cont.40756
bgti_else.40765:
	addi	%a3, %a3, -10
bgti_cont.40766:
	j	bgti_cont.40756
bgti_else.40763:
bgti_cont.40764:
	j	bgti_cont.40756
bgti_else.40761:
	addi	%a3, %a3, -30
bgti_cont.40762:
	j	bgti_cont.40756
bgti_else.40759:
	addi	%a3, %a3, -20
bgti_cont.40760:
	j	bgti_cont.40756
bgti_else.40757:
	addi	%a3, %a3, -10
bgti_cont.40758:
	j	bgti_cont.40756
bgti_else.40755:
bgti_cont.40756:
	blt	%zero, %fp, bgt_else.40787
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40788
bgt_else.40787:
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%fp, 10, bgti_else.40789
	blti	%fp, 20, bgti_else.40791
	blti	%fp, 30, bgti_else.40793
	blti	%fp, 40, bgti_else.40795
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.40790
	blti	%fp, 20, bgti_else.40799
	blti	%fp, 30, bgti_else.40801
	blti	%fp, 40, bgti_else.40803
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.40790
	blti	%fp, 20, bgti_else.40807
	blti	%fp, 30, bgti_else.40809
	blti	%fp, 40, bgti_else.40811
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.40790
	blti	%fp, 20, bgti_else.40815
	blti	%fp, 30, bgti_else.40817
	blti	%fp, 40, bgti_else.40819
	addi	%v0, %fp, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	j	bgti_cont.40790
bgti_else.40819:
	addi	%fp, %fp, -30
bgti_cont.40820:
	j	bgti_cont.40790
bgti_else.40817:
	addi	%fp, %fp, -20
bgti_cont.40818:
	j	bgti_cont.40790
bgti_else.40815:
	addi	%fp, %fp, -10
bgti_cont.40816:
	j	bgti_cont.40790
bgti_else.40813:
bgti_cont.40814:
	j	bgti_cont.40790
bgti_else.40811:
	addi	%fp, %fp, -30
bgti_cont.40812:
	j	bgti_cont.40790
bgti_else.40809:
	addi	%fp, %fp, -20
bgti_cont.40810:
	j	bgti_cont.40790
bgti_else.40807:
	addi	%fp, %fp, -10
bgti_cont.40808:
	j	bgti_cont.40790
bgti_else.40805:
bgti_cont.40806:
	j	bgti_cont.40790
bgti_else.40803:
	addi	%fp, %fp, -30
bgti_cont.40804:
	j	bgti_cont.40790
bgti_else.40801:
	addi	%fp, %fp, -20
bgti_cont.40802:
	j	bgti_cont.40790
bgti_else.40799:
	addi	%fp, %fp, -10
bgti_cont.40800:
	j	bgti_cont.40790
bgti_else.40797:
bgti_cont.40798:
	j	bgti_cont.40790
bgti_else.40795:
	addi	%fp, %fp, -30
bgti_cont.40796:
	j	bgti_cont.40790
bgti_else.40793:
	addi	%fp, %fp, -20
bgti_cont.40794:
	j	bgti_cont.40790
bgti_else.40791:
	addi	%fp, %fp, -10
bgti_cont.40792:
	j	bgti_cont.40790
bgti_else.40789:
bgti_cont.40790:
	blt	%zero, %a0, bgt_else.40821
	addi	%v0, %fp, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40822
bgt_else.40821:
	blti	%a0, 10, bgti_else.40823
	blti	%a0, 20, bgti_else.40825
	blti	%a0, 30, bgti_else.40827
	blti	%a0, 40, bgti_else.40829
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40824
	blti	%a0, 20, bgti_else.40833
	blti	%a0, 30, bgti_else.40835
	blti	%a0, 40, bgti_else.40837
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40824
	blti	%a0, 20, bgti_else.40841
	blti	%a0, 30, bgti_else.40843
	blti	%a0, 40, bgti_else.40845
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40824
	blti	%a0, 20, bgti_else.40849
	blti	%a0, 30, bgti_else.40851
	blti	%a0, 40, bgti_else.40853
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.40824
bgti_else.40853:
	addi	%a0, %a0, -30
bgti_cont.40854:
	j	bgti_cont.40824
bgti_else.40851:
	addi	%a0, %a0, -20
bgti_cont.40852:
	j	bgti_cont.40824
bgti_else.40849:
	addi	%a0, %a0, -10
bgti_cont.40850:
	j	bgti_cont.40824
bgti_else.40847:
bgti_cont.40848:
	j	bgti_cont.40824
bgti_else.40845:
	addi	%a0, %a0, -30
bgti_cont.40846:
	j	bgti_cont.40824
bgti_else.40843:
	addi	%a0, %a0, -20
bgti_cont.40844:
	j	bgti_cont.40824
bgti_else.40841:
	addi	%a0, %a0, -10
bgti_cont.40842:
	j	bgti_cont.40824
bgti_else.40839:
bgti_cont.40840:
	j	bgti_cont.40824
bgti_else.40837:
	addi	%a0, %a0, -30
bgti_cont.40838:
	j	bgti_cont.40824
bgti_else.40835:
	addi	%a0, %a0, -20
bgti_cont.40836:
	j	bgti_cont.40824
bgti_else.40833:
	addi	%a0, %a0, -10
bgti_cont.40834:
	j	bgti_cont.40824
bgti_else.40831:
bgti_cont.40832:
	j	bgti_cont.40824
bgti_else.40829:
	addi	%a0, %a0, -30
bgti_cont.40830:
	j	bgti_cont.40824
bgti_else.40827:
	addi	%a0, %a0, -20
bgti_cont.40828:
	j	bgti_cont.40824
bgti_else.40825:
	addi	%a0, %a0, -10
bgti_cont.40826:
	j	bgti_cont.40824
bgti_else.40823:
bgti_cont.40824:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %fp, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.40822:
bgt_cont.40788:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	jal	print_int_sub1.2629
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	blt	%zero, %a2, bgt_else.40855
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40856
bgt_else.40855:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.40857
	blti	%a2, 20, bgti_else.40859
	blti	%a2, 30, bgti_else.40861
	blti	%a2, 40, bgti_else.40863
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40858
	blti	%a2, 20, bgti_else.40867
	blti	%a2, 30, bgti_else.40869
	blti	%a2, 40, bgti_else.40871
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40858
	blti	%a2, 20, bgti_else.40875
	blti	%a2, 30, bgti_else.40877
	blti	%a2, 40, bgti_else.40879
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.40858
	blti	%a2, 20, bgti_else.40883
	blti	%a2, 30, bgti_else.40885
	blti	%a2, 40, bgti_else.40887
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	j	bgti_cont.40858
bgti_else.40887:
	addi	%a2, %a2, -30
bgti_cont.40888:
	j	bgti_cont.40858
bgti_else.40885:
	addi	%a2, %a2, -20
bgti_cont.40886:
	j	bgti_cont.40858
bgti_else.40883:
	addi	%a2, %a2, -10
bgti_cont.40884:
	j	bgti_cont.40858
bgti_else.40881:
bgti_cont.40882:
	j	bgti_cont.40858
bgti_else.40879:
	addi	%a2, %a2, -30
bgti_cont.40880:
	j	bgti_cont.40858
bgti_else.40877:
	addi	%a2, %a2, -20
bgti_cont.40878:
	j	bgti_cont.40858
bgti_else.40875:
	addi	%a2, %a2, -10
bgti_cont.40876:
	j	bgti_cont.40858
bgti_else.40873:
bgti_cont.40874:
	j	bgti_cont.40858
bgti_else.40871:
	addi	%a2, %a2, -30
bgti_cont.40872:
	j	bgti_cont.40858
bgti_else.40869:
	addi	%a2, %a2, -20
bgti_cont.40870:
	j	bgti_cont.40858
bgti_else.40867:
	addi	%a2, %a2, -10
bgti_cont.40868:
	j	bgti_cont.40858
bgti_else.40865:
bgti_cont.40866:
	j	bgti_cont.40858
bgti_else.40863:
	addi	%a2, %a2, -30
bgti_cont.40864:
	j	bgti_cont.40858
bgti_else.40861:
	addi	%a2, %a2, -20
bgti_cont.40862:
	j	bgti_cont.40858
bgti_else.40859:
	addi	%a2, %a2, -10
bgti_cont.40860:
	j	bgti_cont.40858
bgti_else.40857:
bgti_cont.40858:
	blt	%zero, %a0, bgt_else.40889
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.40890
bgt_else.40889:
	blti	%a0, 10, bgti_else.40891
	blti	%a0, 20, bgti_else.40893
	blti	%a0, 30, bgti_else.40895
	blti	%a0, 40, bgti_else.40897
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40892
	blti	%a0, 20, bgti_else.40901
	blti	%a0, 30, bgti_else.40903
	blti	%a0, 40, bgti_else.40905
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40892
	blti	%a0, 20, bgti_else.40909
	blti	%a0, 30, bgti_else.40911
	blti	%a0, 40, bgti_else.40913
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.40892
	blti	%a0, 20, bgti_else.40917
	blti	%a0, 30, bgti_else.40919
	blti	%a0, 40, bgti_else.40921
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.40892
bgti_else.40921:
	addi	%a0, %a0, -30
bgti_cont.40922:
	j	bgti_cont.40892
bgti_else.40919:
	addi	%a0, %a0, -20
bgti_cont.40920:
	j	bgti_cont.40892
bgti_else.40917:
	addi	%a0, %a0, -10
bgti_cont.40918:
	j	bgti_cont.40892
bgti_else.40915:
bgti_cont.40916:
	j	bgti_cont.40892
bgti_else.40913:
	addi	%a0, %a0, -30
bgti_cont.40914:
	j	bgti_cont.40892
bgti_else.40911:
	addi	%a0, %a0, -20
bgti_cont.40912:
	j	bgti_cont.40892
bgti_else.40909:
	addi	%a0, %a0, -10
bgti_cont.40910:
	j	bgti_cont.40892
bgti_else.40907:
bgti_cont.40908:
	j	bgti_cont.40892
bgti_else.40905:
	addi	%a0, %a0, -30
bgti_cont.40906:
	j	bgti_cont.40892
bgti_else.40903:
	addi	%a0, %a0, -20
bgti_cont.40904:
	j	bgti_cont.40892
bgti_else.40901:
	addi	%a0, %a0, -10
bgti_cont.40902:
	j	bgti_cont.40892
bgti_else.40899:
bgti_cont.40900:
	j	bgti_cont.40892
bgti_else.40897:
	addi	%a0, %a0, -30
bgti_cont.40898:
	j	bgti_cont.40892
bgti_else.40895:
	addi	%a0, %a0, -20
bgti_cont.40896:
	j	bgti_cont.40892
bgti_else.40893:
	addi	%a0, %a0, -10
bgti_cont.40894:
	j	bgti_cont.40892
bgti_else.40891:
bgti_cont.40892:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.40890:
bgt_cont.40856:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 4(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %a2, 0
	jal	min_caml_create_array
	sw	%v0, 183(%zero)
	lw	%t7, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %t7, 0
	jal	create_dirvec_elements.3090
	addi	%v0, %zero, 3
	jal	create_dirvecs.3093
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 479(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 438(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	jal	calc_dirvecs.3079
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	jal	calc_dirvec_rows.3084
	addi	%v1, %zero, 119
	addi	%v0, %t7, 0
	jal	init_dirvec_constants.3095
	addi	%v0, %zero, 3
	jal	init_vecset_constants.3098
	addi	%sp, %sp, -5
	flw	%f21, 78(%zero)
	fsw	%f21, 184(%zero)
	flw	%f22, 79(%zero)
	fsw	%f22, 185(%zero)
	flw	%f23, 80(%zero)
	fsw	%f23, 186(%zero)
	lw	%a0, 4(%sp)
	addi	%s4, %a0, -1
	blti	%s4, 0, bgti_else.40923
	lw	%a0, 12(%s4)
	lw	%a2, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.40925
	beqi	%a0, 2, bnei_else.40927
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	flw	%f15, 184(%zero)
	flw	%f13, 185(%zero)
	flw	%f2, 186(%zero)
	fmul	%f0, %f15, %f15
	flw	%f16, 0(%a1)
	fmul	%f1, %f0, %f16
	fmul	%f0, %f13, %f13
	flw	%f14, 1(%a1)
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	fmul	%f0, %f2, %f2
	flw	%f12, 2(%a1)
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	beqi	%a3, 0, bnei_else.40929
	fmul	%f11, %f13, %f2
	flw	%f1, 0(%a2)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f2, %f15
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f15, %f13
	flw	%f0, 2(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.40930
bnei_else.40929:
bnei_cont.40930:
	fmul	%f1, %f15, %f16
	fneg	%f20, %f1
	fmul	%f1, %f13, %f14
	fneg	%f19, %f1
	fmul	%f1, %f2, %f12
	fneg	%f14, %f1
	fsw	%f0, 0(%v0)
	beqi	%a3, 0, bnei_else.40931
	flw	%f17, 1(%a2)
	fmul	%f11, %f2, %f17
	flw	%f18, 2(%a2)
	fmul	%f1, %f13, %f18
	fadd	%f1, %f11, %f1
	flw	%f16, 465(%zero)
	fmul	%f1, %f1, %f16
	fsub	%f1, %f20, %f1
	fsw	%f1, 1(%v0)
	flw	%f12, 0(%a2)
	fmul	%f11, %f2, %f12
	fmul	%f1, %f15, %f18
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f16
	fsub	%f1, %f19, %f1
	fsw	%f1, 2(%v0)
	fmul	%f11, %f13, %f12
	fmul	%f1, %f15, %f17
	fadd	%f1, %f11, %f1
	fmul	%f1, %f1, %f16
	fsub	%f1, %f14, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.40932
bnei_else.40931:
	fsw	%f20, 1(%v0)
	fsw	%f19, 2(%v0)
	fsw	%f14, 3(%v0)
bnei_cont.40932:
	fbne	%f0, %fzero, fbeq_else.40933
	add	%a0, %zero, %k1
	j	fbeq_cont.40934
fbeq_else.40933:
	add	%a0, %zero, %zero
fbeq_cont.40934:
	beqi	%a0, 0, bnei_else.40935
	j	bnei_cont.40936
bnei_else.40935:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.40936:
	sw	%v0, 187(%s4)
	j	bnei_cont.40926
bnei_else.40927:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	flw	%f0, 184(%zero)
	flw	%f13, 0(%a1)
	fmul	%f1, %f0, %f13
	flw	%f0, 185(%zero)
	flw	%f12, 1(%a1)
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 186(%zero)
	flw	%f11, 2(%a1)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.40937
	add	%a0, %zero, %zero
	j	fbgt_cont.40938
fbgt_else.40937:
	add	%a0, %zero, %k1
fbgt_cont.40938:
	beqi	%a0, 0, bnei_else.40939
	flw	%f0, 460(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f13, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f12, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f11, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.40940
bnei_else.40939:
	fsw	%fzero, 0(%v0)
bnei_cont.40940:
	sw	%v0, 187(%s4)
bnei_cont.40928:
	j	bnei_cont.40926
bnei_else.40925:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	flw	%f1, 184(%zero)
	fbne	%f1, %fzero, fbeq_else.40941
	add	%a0, %zero, %k1
	j	fbeq_cont.40942
fbeq_else.40941:
	add	%a0, %zero, %zero
fbeq_cont.40942:
	beqi	%a0, 0, bnei_else.40943
	fsw	%fzero, 1(%v0)
	j	bnei_cont.40944
bnei_else.40943:
	fblt	%f1, %fzero, fbgt_else.40945
	add	%a0, %zero, %zero
	j	fbgt_cont.40946
fbgt_else.40945:
	add	%a0, %zero, %k1
fbgt_cont.40946:
	beqi	%fp, 0, bnei_else.40947
	beqi	%a0, 0, bnei_else.40949
	add	%a0, %zero, %zero
	j	bnei_cont.40948
bnei_else.40949:
	add	%a0, %zero, %k1
bnei_cont.40950:
	j	bnei_cont.40948
bnei_else.40947:
bnei_cont.40948:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.40951
	j	bnei_cont.40952
bnei_else.40951:
	fneg	%f0, %f0
bnei_cont.40952:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.40944:
	flw	%f1, 185(%zero)
	fbne	%f1, %fzero, fbeq_else.40953
	add	%a0, %zero, %k1
	j	fbeq_cont.40954
fbeq_else.40953:
	add	%a0, %zero, %zero
fbeq_cont.40954:
	beqi	%a0, 0, bnei_else.40955
	fsw	%fzero, 3(%v0)
	j	bnei_cont.40956
bnei_else.40955:
	fblt	%f1, %fzero, fbgt_else.40957
	add	%a0, %zero, %zero
	j	fbgt_cont.40958
fbgt_else.40957:
	add	%a0, %zero, %k1
fbgt_cont.40958:
	beqi	%fp, 0, bnei_else.40959
	beqi	%a0, 0, bnei_else.40961
	add	%a0, %zero, %zero
	j	bnei_cont.40960
bnei_else.40961:
	add	%a0, %zero, %k1
bnei_cont.40962:
	j	bnei_cont.40960
bnei_else.40959:
bnei_cont.40960:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.40963
	j	bnei_cont.40964
bnei_else.40963:
	fneg	%f0, %f0
bnei_cont.40964:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.40956:
	flw	%f1, 186(%zero)
	fbne	%f1, %fzero, fbeq_else.40965
	add	%a0, %zero, %k1
	j	fbeq_cont.40966
fbeq_else.40965:
	add	%a0, %zero, %zero
fbeq_cont.40966:
	beqi	%a0, 0, bnei_else.40967
	fsw	%fzero, 5(%v0)
	j	bnei_cont.40968
bnei_else.40967:
	fblt	%f1, %fzero, fbgt_else.40969
	add	%a0, %zero, %zero
	j	fbgt_cont.40970
fbgt_else.40969:
	add	%a0, %zero, %k1
fbgt_cont.40970:
	beqi	%fp, 0, bnei_else.40971
	beqi	%a0, 0, bnei_else.40973
	add	%a0, %zero, %zero
	j	bnei_cont.40972
bnei_else.40973:
	add	%a0, %zero, %k1
bnei_cont.40974:
	j	bnei_cont.40972
bnei_else.40971:
bnei_cont.40972:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.40975
	j	bnei_cont.40976
bnei_else.40975:
	fneg	%f0, %f0
bnei_cont.40976:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.40968:
	sw	%v0, 187(%s4)
bnei_cont.40926:
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 5
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -5
	j	bgti_cont.40924
bgti_else.40923:
bgti_cont.40924:
	blti	%s4, 0, bgti_else.40977
	lw	%a1, 12(%s4)
	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	beqi	%a0, 2, bnei_else.40979
	j	bgti_cont.40978
bnei_else.40979:
	flw	%f0, 0(%a2)
	fblt	%f0, %f30, fbgt_else.40981
	add	%a0, %zero, %zero
	j	fbgt_cont.40982
fbgt_else.40981:
	add	%a0, %zero, %k1
fbgt_cont.40982:
	beqi	%a0, 0, bgti_cont.40978
	beqi	%a1, 1, bnei_else.40985
	beqi	%a1, 2, bnei_else.40987
	j	bgti_cont.40978
bnei_else.40987:
	sll	%a0, %s4, 2
	addi	%s5, %a0, 1
	lw	%s6, 434(%zero)
	fsub	%f24, %f30, %f0
	flw	%f12, 0(%a3)
	fmul	%f1, %f21, %f12
	flw	%f11, 1(%a3)
	fmul	%f0, %f22, %f11
	fadd	%f1, %f1, %f0
	flw	%f14, 2(%a3)
	fmul	%f0, %f23, %f14
	fadd	%f13, %f1, %f0
	flw	%f1, 462(%zero)
	fmul	%f0, %f1, %f12
	fmul	%f0, %f0, %f13
	fsub	%f12, %f0, %f21
	fmul	%f0, %f1, %f11
	fmul	%f0, %f0, %f13
	fsub	%f11, %f0, %f22
	fmul	%f0, %f1, %f14
	fmul	%f0, %f0, %f13
	fsub	%f1, %f0, %f23
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0
	lw	%v0, 4(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s7)
	sw	%a1, 0(%s7)
	fsw	%f12, 0(%a1)
	fsw	%f11, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f24, 2(%a0)
	sw	%s7, 1(%a0)
	sw	%s5, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%a0, %s6, 1
	sw	%a0, 434(%zero)
bnei_cont.40988:
	j	bgti_cont.40978
bnei_else.40985:
	sll	%s5, %s4, 2
	lw	%s6, 434(%zero)
	fsub	%f3, %f30, %f0
	fneg	%f26, %f21
	fneg	%f25, %f22
	fneg	%f24, %f23
	addi	%s7, %s5, 1
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0
	lw	%v0, 4(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t7)
	sw	%a1, 0(%t7)
	fsw	%f21, 0(%a1)
	fsw	%f25, 1(%a1)
	fsw	%f24, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t7, 0
	jal	iter_setup_dirvec_constants.2877
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f3, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s7, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%s7, %s6, 1
	addi	%t7, %s5, 2
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0
	lw	%v0, 4(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t8)
	sw	%a1, 0(%t8)
	fsw	%f26, 0(%a1)
	fsw	%f22, 1(%a1)
	fsw	%f24, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t8, 0
	jal	iter_setup_dirvec_constants.2877
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f3, 2(%a0)
	sw	%t8, 1(%a0)
	sw	%t7, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%s7, %s6, 2
	addi	%s5, %s5, 3
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0
	lw	%v0, 4(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t7)
	sw	%a1, 0(%t7)
	fsw	%f26, 0(%a1)
	fsw	%f25, 1(%a1)
	fsw	%f23, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f3, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s5, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%a0, %s6, 3
	sw	%a0, 434(%zero)
bnei_cont.40986:
	j	bgti_cont.40978
bnei_else.40983:
bnei_cont.40984:
bnei_cont.40980:
	j	bgti_cont.40978
bgti_else.40977:
bgti_cont.40978:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %zero, %a0
	itof	%f0, %a0
	fmul	%f12, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f0, %f12, %f0
	fadd	%f0, %f0, %f27
	flw	%f1, 169(%zero)
	fmul	%f1, %f12, %f1
	fadd	%f1, %f1, %f28
	flw	%f11, 170(%zero)
	fmul	%f11, %f12, %f11
	fadd	%f2, %f11, %f29
	lw	%a0, 0(%sp)
	addi	%v1, %a0, -1
	lw	%v0, 2(%sp)
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -5
	addi	%a2, %zero, 2
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	scan_line.3051
	addi	%sp, %sp, -5
	add	%g0, %zero, %zero
	ret
