	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 44464
	ori	%hp, %hp, 483

	nop
	nop
	lui	%k1, 0
	lui	%at, 16256

	nop
	nop
	ori	%k1, %k1, 1
	ori	%at, %at, 0

	sw	%at, 0(%hp)
	nop
	lui	%at, 15395
	nop

	flw	%f30, 0(%hp)
	nop
	ori	%at, %at, 55050
	nop

	sw	%at, 0(%hp)
	nop
	lui	%at, 48716
	nop

	flw	%f9, 0(%hp)
	nop
	ori	%at, %at, 52429
	nop

	sw	%at, 0(%hp)
	nop
	nop
	nop

	flw	%f10, 0(%hp)
	nop
	nop
	j	min_caml_start

min_caml_print_char:
	nop
	nop
	nop
	out	%v0

	nop
	nop
	nop
	jr	%ra

min_caml_read_int:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 8
	nop

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 16
	nop

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 24
	nop

	nop
	nop
	or	%v0, %v0, %v1
	jr	%ra

min_caml_read_float:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 8
	nop

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 16
	nop

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 24
	nop

	nop
	nop
	or	%v0, %v0, %v1
	nop

	sw	%v0, 0(%hp)
	nop
	nop
	nop

	flw	%f0, 0(%hp)
	nop
	nop
	jr	%ra

min_caml_create_array:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0

create_array_loop:
	nop
	nop
	nop
	beqi	%a0, 0, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 1, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 2, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 3, create_array_exit

	sw	%v1, 0(%hp)
	nop
	addi	%a0, %a0, -4
	nop

	nop
	nop
	addi	%hp, %hp, 1
	j	create_array_loop

create_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_array:
	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0

create_float_array_loop:
	nop
	nop
	nop
	beqi	%v1, 0, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 1, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 2, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 3, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	addi	%v1, %v1, -4
	nop

	nop
	nop
	addi	%hp, %hp, 1
	j	create_float_array_loop

create_float_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_extarray:
	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0

create_extarray_loop:
	nop
	nop
	nop
	beqi	%a1, 0, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 1, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 2, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 3, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	addi	%a1, %a1, -4
	nop

	nop
	nop
	addi	%a0, %a0, 1
	j	create_extarray_loop

create_extarray_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_extarray:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

create_float_extarray_loop:
	nop
	nop
	nop
	beqi	%a0, 0, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 1, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 2, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 3, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	addi	%a0, %a0, -4
	nop

	nop
	nop
	addi	%v1, %v1, 1
	j	create_float_extarray_loop

create_float_extarray_exit:
	nop
	nop
	nop
	jr	%ra

print_int_sub1.2629:
	nop
	nop
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31512

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31513

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31514

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31515

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31516

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31517

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31518

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31519

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31520

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31521

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31522

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31523

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31524

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31525

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31526

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31527

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4

	nop
	nop
	addi	%v0, %a0, 0
	j	print_int_sub1.2629

bgti_else.31527:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.31526:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.31525:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.31524:
	nop
	nop
	nop
	jr	%ra

bgti_else.31523:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.31522:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.31521:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.31520:
	nop
	nop
	nop
	jr	%ra

bgti_else.31519:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.31518:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.31517:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.31516:
	nop
	nop
	nop
	jr	%ra

bgti_else.31515:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.31514:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.31513:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.31512:
	nop
	nop
	nop
	jr	%ra

print_int_sub2.2632:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31637

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31638

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31639

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31640

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31641

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31642

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31643

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31644

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31645

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31646

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31647

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31648

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31649

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31650

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31651

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31652

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31653

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31654

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31655

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31656

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31657

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31658

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31659

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31660

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31661

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31662

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31663

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31664

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31665

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31666

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31667

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31668

	nop
	nop
	addi	%v0, %v0, -40
	j	print_int_sub2.2632

bgti_else.31668:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31667:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31666:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31665:
	nop
	nop
	nop
	jr	%ra

bgti_else.31664:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31663:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31662:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31661:
	nop
	nop
	nop
	jr	%ra

bgti_else.31660:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31659:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31658:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31657:
	nop
	nop
	nop
	jr	%ra

bgti_else.31656:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31655:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31654:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31653:
	nop
	nop
	nop
	jr	%ra

bgti_else.31652:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31651:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31650:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31649:
	nop
	nop
	nop
	jr	%ra

bgti_else.31648:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31647:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31646:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31645:
	nop
	nop
	nop
	jr	%ra

bgti_else.31644:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31643:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31642:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31641:
	nop
	nop
	nop
	jr	%ra

bgti_else.31640:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.31639:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.31638:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.31637:
	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2767:
	flw	%f12, 0(%v1)
	flw	%f14, 482(%zero)
	nop
	nop

	flw	%f15, 481(%zero)
	nop
	fabs	%f1, %f12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f15
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.31809

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31810

fbgt_else.31809:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31810:
	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.31811

	nop
	nop
	fsub	%f0, %f0, %f14
	j	fbgt_cont.31812

fbgt_else.31811:
fbgt_cont.31812:
	flw	%f16, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.31813

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31815

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31814

bnei_else.31815:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31816:
	nop
	nop
	nop
	j	fbgt_cont.31814

fbgt_else.31813:
fbgt_cont.31814:
	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.31817

	nop
	nop
	fsub	%f0, %f14, %f0
	j	fbgt_cont.31818

fbgt_else.31817:
fbgt_cont.31818:
	flw	%f13, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f13, %f0, fbgt_else.31819

	flw	%f0, 474(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.31820

fbgt_else.31819:
	flw	%f0, 478(%zero)
	nop
	fsub	%f18, %f16, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.31820:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31821

	nop
	nop
	nop
	j	bnei_cont.31822

bnei_else.31821:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.31822:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.31823

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.31824

fbgt_else.31823:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.31824:
	nop
	nop
	fabs	%f11, %f12
	nop

	nop
	nop
	fdiv	%f1, %f11, %f15
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f15
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.31825

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31827

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31826

bnei_else.31827:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31828:
	nop
	nop
	nop
	j	fbgt_cont.31826

fbgt_else.31825:
fbgt_cont.31826:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.31829

	nop
	nop
	fsub	%f1, %f1, %f14
	j	fbgt_cont.31830

fbgt_else.31829:
fbgt_cont.31830:
	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.31831

	nop
	nop
	fsub	%f1, %f14, %f1
	j	fbgt_cont.31832

fbgt_else.31831:
fbgt_cont.31832:
	nop
	nop
	nop
	fblt	%f13, %f1, fbgt_else.31833

	flw	%f11, 478(%zero)
	nop
	fmul	%f18, %f1, %f1
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f11, %f11, %f1

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 477(%zero)
	nop
	fsub	%f12, %f1, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.31834

fbgt_else.31833:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f17, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f17, %f17
	fmul	%f1, %f1, %f17

	flw	%f1, 473(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.31834:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31835

	nop
	nop
	nop
	j	bnei_cont.31836

bnei_else.31835:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.31836:
	flw	%f17, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f12, %f17
	nop

	nop
	nop
	fdiv	%f11, %f12, %f15
	nop

	nop
	nop
	floor	%f11, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.31837

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31838

fbgt_else.31837:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31838:
	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.31839

	nop
	nop
	fsub	%f11, %f11, %f14
	j	fbgt_cont.31840

fbgt_else.31839:
fbgt_cont.31840:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.31841

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31843

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31842

bnei_else.31843:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31844:
	nop
	nop
	nop
	j	fbgt_cont.31842

fbgt_else.31841:
fbgt_cont.31842:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.31845

	nop
	nop
	fsub	%f11, %f14, %f11
	j	fbgt_cont.31846

fbgt_else.31845:
fbgt_cont.31846:
	nop
	nop
	nop
	fblt	%f13, %f11, fbgt_else.31847

	flw	%f11, 474(%zero)
	nop
	fmul	%f19, %f11, %f11
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 473(%zero)
	nop
	fsub	%f12, %f30, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 472(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	j	fbgt_cont.31848

fbgt_else.31847:
	flw	%f11, 478(%zero)
	nop
	fsub	%f2, %f16, %f11
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f11, %f11, %f2

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 477(%zero)
	nop
	fsub	%f12, %f2, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

fbgt_cont.31848:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31849

	nop
	nop
	nop
	j	bnei_cont.31850

bnei_else.31849:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.31850:
	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.31851

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.31852

fbgt_else.31851:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.31852:
	nop
	nop
	fabs	%f17, %f17
	nop

	nop
	nop
	fdiv	%f12, %f17, %f15
	nop

	nop
	nop
	floor	%f12, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f15
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.31853

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31855

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31854

bnei_else.31855:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31856:
	nop
	nop
	nop
	j	fbgt_cont.31854

fbgt_else.31853:
fbgt_cont.31854:
	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.31857

	nop
	nop
	fsub	%f12, %f12, %f14
	j	fbgt_cont.31858

fbgt_else.31857:
fbgt_cont.31858:
	nop
	nop
	nop
	fblt	%f12, %f16, fbgt_else.31859

	nop
	nop
	fsub	%f12, %f14, %f12
	j	fbgt_cont.31860

fbgt_else.31859:
fbgt_cont.31860:
	nop
	nop
	nop
	fblt	%f13, %f12, fbgt_else.31861

	flw	%f17, 478(%zero)
	nop
	fmul	%f2, %f12, %f12
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f17, %f17, %f12

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f12, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	flw	%f17, 476(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f12, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f2
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fsub	%f12, %f18, %f12
	j	fbgt_cont.31862

fbgt_else.31861:
	nop
	nop
	fsub	%f12, %f16, %f12
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f19, %f12, %f12
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f12, %f12, %f19

	flw	%f12, 473(%zero)
	nop
	fsub	%f17, %f30, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	flw	%f12, 472(%zero)
	nop
	fadd	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

fbgt_cont.31862:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31863

	nop
	nop
	nop
	j	bnei_cont.31864

bnei_else.31863:
	nop
	nop
	fneg	%f12, %f12
	nop

bnei_cont.31864:
	flw	%f19, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f18, %f19
	nop

	nop
	nop
	fdiv	%f17, %f18, %f15
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f15
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.31865

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31866

fbgt_else.31865:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31866:
	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.31867

	nop
	nop
	fsub	%f17, %f17, %f14
	j	fbgt_cont.31868

fbgt_else.31867:
fbgt_cont.31868:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.31869

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31871

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31870

bnei_else.31871:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31872:
	nop
	nop
	nop
	j	fbgt_cont.31870

fbgt_else.31869:
fbgt_cont.31870:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.31873

	nop
	nop
	fsub	%f17, %f14, %f17
	j	fbgt_cont.31874

fbgt_else.31873:
fbgt_cont.31874:
	nop
	nop
	nop
	fblt	%f13, %f17, fbgt_else.31875

	flw	%f17, 474(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 473(%zero)
	nop
	fsub	%f18, %f30, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 472(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.31876

fbgt_else.31875:
	flw	%f17, 478(%zero)
	nop
	fsub	%f21, %f16, %f17
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f17, %f17, %f21

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f21, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 476(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

fbgt_cont.31876:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31877

	nop
	nop
	nop
	j	bnei_cont.31878

bnei_else.31877:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.31878:
	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.31879

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.31880

fbgt_else.31879:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.31880:
	nop
	nop
	fabs	%f19, %f19
	nop

	nop
	nop
	fdiv	%f18, %f19, %f15
	nop

	nop
	nop
	floor	%f18, %f18
	nop

	nop
	nop
	fmul	%f15, %f18, %f15
	nop

	nop
	nop
	fsub	%f15, %f19, %f15
	nop

	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.31881

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31883

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31882

bnei_else.31883:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31884:
	nop
	nop
	nop
	j	fbgt_cont.31882

fbgt_else.31881:
fbgt_cont.31882:
	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.31885

	nop
	nop
	fsub	%f15, %f15, %f14
	j	fbgt_cont.31886

fbgt_else.31885:
fbgt_cont.31886:
	nop
	nop
	nop
	fblt	%f15, %f16, fbgt_else.31887

	nop
	nop
	fsub	%f15, %f14, %f15
	j	fbgt_cont.31888

fbgt_else.31887:
fbgt_cont.31888:
	nop
	nop
	nop
	fblt	%f13, %f15, fbgt_else.31889

	flw	%f13, 478(%zero)
	nop
	fmul	%f18, %f15, %f15
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f13, %f13, %f15

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	flw	%f13, 477(%zero)
	nop
	fsub	%f14, %f15, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	flw	%f13, 476(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	j	fbgt_cont.31890

fbgt_else.31889:
	nop
	nop
	fsub	%f13, %f16, %f15
	nop

	flw	%f13, 474(%zero)
	nop
	fmul	%f16, %f13, %f13
	nop

	nop
	nop
	fmul	%f15, %f16, %f16
	fmul	%f13, %f13, %f16

	flw	%f13, 473(%zero)
	nop
	fsub	%f14, %f30, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	flw	%f13, 472(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	nop

fbgt_cont.31890:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31891

	nop
	nop
	nop
	j	bnei_cont.31892

bnei_else.31891:
	nop
	nop
	fneg	%f13, %f13
	nop

bnei_cont.31892:
	nop
	nop
	fmul	%f18, %f11, %f17
	fmul	%f21, %f1, %f12

	nop
	nop
	fmul	%f15, %f21, %f17
	fmul	%f14, %f0, %f13

	nop
	nop
	fsub	%f16, %f15, %f14
	fmul	%f20, %f0, %f12

	nop
	nop
	fmul	%f15, %f20, %f17
	fmul	%f14, %f1, %f13

	nop
	nop
	fadd	%f19, %f15, %f14
	fmul	%f2, %f11, %f13

	nop
	nop
	fmul	%f15, %f21, %f13
	fmul	%f14, %f0, %f17

	nop
	nop
	fadd	%f15, %f15, %f14
	fmul	%f14, %f20, %f13

	flw	%f12, 1(%v0)
	flw	%f17, 470(%zero)
	fmul	%f13, %f1, %f17
	fneg	%f20, %f12

	flw	%f13, 0(%v0)
	nop
	fsub	%f21, %f14, %f13
	fmul	%f14, %f1, %f11

	flw	%f11, 2(%v0)
	nop
	fmul	%f22, %f0, %f11
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f20

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f15, %f15

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f14, %f14

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fmul	%f0, %f19, %f19
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fmul	%f0, %f13, %f16
	fmul	%f13, %f13, %f18

	nop
	nop
	fmul	%f1, %f0, %f19
	fmul	%f0, %f12, %f15

	nop
	nop
	fmul	%f0, %f0, %f21
	fmul	%f12, %f12, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fmul	%f0, %f0, %f22
	fmul	%f11, %f11, %f20

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f19

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 0(%v1)
	nop
	fmul	%f0, %f12, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f22

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f16

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%v1)
	nop
	fmul	%f0, %f12, %f15
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	jr	%ra

read_nth_object.2770:
	nop
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32120

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a3, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%fp, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%k0, %v0, 0
	addi	%s0, %zero, 3

	nop
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s1, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s1)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s1)
	nop
	addi	%s4, %zero, 2
	jal	min_caml_read_float

	fsw	%f0, 2(%s1)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s2, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s2)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s2)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s2)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.32121

	nop
	nop
	add	%s3, %zero, %zero
	j	fbgt_cont.32122

fbgt_else.32121:
	nop
	nop
	add	%s3, %zero, %k1
	nop

fbgt_cont.32122:
	nop
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s4, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s4)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s4)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s5, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s5)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s5)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s5)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32123

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%s0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%s0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	j	bnei_cont.32124

bnei_else.32123:
bnei_cont.32124:
	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32125

	nop
	nop
	add	%s6, %zero, %s3
	j	bnei_cont.32126

bnei_else.32125:
	nop
	nop
	add	%s6, %zero, %k1
	nop

bnei_cont.32126:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11

	sw	%v0, 10(%ra)
	nop
	nop
	nop

	sw	%s0, 9(%ra)
	nop
	nop
	nop

	sw	%s5, 8(%ra)
	nop
	nop
	nop

	sw	%s4, 7(%ra)
	nop
	nop
	nop

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s2, 5(%ra)
	nop
	nop
	nop

	sw	%s1, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 12(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.32127

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32129

	nop
	nop
	nop
	j	bnei_cont.32128

bnei_else.32129:
	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32131

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32132

bnei_else.32131:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32132:
	flw	%f13, 0(%s1)
	flw	%f12, 1(%s1)
	nop
	nop

	flw	%f11, 2(%s1)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32133

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.32134

fbeq_else.32133:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.32134:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32135

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32136

bnei_else.32135:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32137

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32138

bnei_else.32137:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.32138:
bnei_cont.32136:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 0(%s1)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 1(%s1)
	nop
	nop
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.32130:
	nop
	nop
	nop
	j	bnei_cont.32128

bnei_else.32127:
	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32139

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32140

fbeq_else.32139:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32140:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32141

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32142

bnei_else.32141:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32143

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32144

fbeq_else.32143:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32144:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32145

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32146

bnei_else.32145:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32147

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32148

fbgt_else.32147:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32148:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32149

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32150

bnei_else.32149:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32150:
bnei_cont.32146:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32142:
	fsw	%f0, 0(%s1)
	nop
	nop
	nop

	flw	%f1, 1(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32151

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32152

fbeq_else.32151:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32152:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32153

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32154

bnei_else.32153:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32155

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32156

fbeq_else.32155:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32156:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32157

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32158

bnei_else.32157:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32159

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32160

fbgt_else.32159:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32160:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32161

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32162

bnei_else.32161:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32162:
bnei_cont.32158:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32154:
	fsw	%f0, 1(%s1)
	nop
	nop
	nop

	flw	%f1, 2(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32163

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32164

fbeq_else.32163:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32164:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32165

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32166

bnei_else.32165:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32167

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32168

fbeq_else.32167:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32168:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32169

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32170

bnei_else.32169:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32171

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32172

fbgt_else.32171:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32172:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32173

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32174

bnei_else.32173:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32174:
bnei_cont.32170:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32166:
	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.32128:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32175

	flw	%f12, 0(%s0)
	flw	%f14, 482(%zero)
	nop
	nop

	flw	%f15, 481(%zero)
	nop
	fabs	%f1, %f12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f15
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.32177

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32178

fbgt_else.32177:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32178:
	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.32179

	nop
	nop
	fsub	%f0, %f0, %f14
	j	fbgt_cont.32180

fbgt_else.32179:
fbgt_cont.32180:
	flw	%f16, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.32181

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32183

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32182

bnei_else.32183:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32184:
	nop
	nop
	nop
	j	fbgt_cont.32182

fbgt_else.32181:
fbgt_cont.32182:
	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.32185

	nop
	nop
	fsub	%f0, %f14, %f0
	j	fbgt_cont.32186

fbgt_else.32185:
fbgt_cont.32186:
	flw	%f13, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f13, %f0, fbgt_else.32187

	flw	%f0, 474(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32188

fbgt_else.32187:
	flw	%f0, 478(%zero)
	nop
	fsub	%f18, %f16, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.32188:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32189

	nop
	nop
	nop
	j	bnei_cont.32190

bnei_else.32189:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32190:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.32191

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.32192

fbgt_else.32191:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.32192:
	nop
	nop
	fabs	%f11, %f12
	nop

	nop
	nop
	fdiv	%f1, %f11, %f15
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f15
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.32193

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32195

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32194

bnei_else.32195:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32196:
	nop
	nop
	nop
	j	fbgt_cont.32194

fbgt_else.32193:
fbgt_cont.32194:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.32197

	nop
	nop
	fsub	%f1, %f1, %f14
	j	fbgt_cont.32198

fbgt_else.32197:
fbgt_cont.32198:
	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.32199

	nop
	nop
	fsub	%f1, %f14, %f1
	j	fbgt_cont.32200

fbgt_else.32199:
fbgt_cont.32200:
	nop
	nop
	nop
	fblt	%f13, %f1, fbgt_else.32201

	flw	%f11, 478(%zero)
	nop
	fmul	%f18, %f1, %f1
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f11, %f11, %f1

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 477(%zero)
	nop
	fsub	%f12, %f1, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.32202

fbgt_else.32201:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f17, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f17, %f17
	fmul	%f1, %f1, %f17

	flw	%f1, 473(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.32202:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32203

	nop
	nop
	nop
	j	bnei_cont.32204

bnei_else.32203:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.32204:
	flw	%f17, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	fabs	%f12, %f17
	nop

	nop
	nop
	fdiv	%f11, %f12, %f15
	nop

	nop
	nop
	floor	%f11, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.32205

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32206

fbgt_else.32205:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32206:
	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.32207

	nop
	nop
	fsub	%f11, %f11, %f14
	j	fbgt_cont.32208

fbgt_else.32207:
fbgt_cont.32208:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.32209

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32211

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32210

bnei_else.32211:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32212:
	nop
	nop
	nop
	j	fbgt_cont.32210

fbgt_else.32209:
fbgt_cont.32210:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.32213

	nop
	nop
	fsub	%f11, %f14, %f11
	j	fbgt_cont.32214

fbgt_else.32213:
fbgt_cont.32214:
	nop
	nop
	nop
	fblt	%f13, %f11, fbgt_else.32215

	flw	%f11, 474(%zero)
	nop
	fmul	%f19, %f11, %f11
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 473(%zero)
	nop
	fsub	%f12, %f30, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 472(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	j	fbgt_cont.32216

fbgt_else.32215:
	flw	%f11, 478(%zero)
	nop
	fsub	%f2, %f16, %f11
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f11, %f11, %f2

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 477(%zero)
	nop
	fsub	%f12, %f2, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

fbgt_cont.32216:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32217

	nop
	nop
	nop
	j	bnei_cont.32218

bnei_else.32217:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.32218:
	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.32219

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.32220

fbgt_else.32219:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.32220:
	nop
	nop
	fabs	%f17, %f17
	nop

	nop
	nop
	fdiv	%f12, %f17, %f15
	nop

	nop
	nop
	floor	%f12, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f15
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.32221

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32223

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32222

bnei_else.32223:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32224:
	nop
	nop
	nop
	j	fbgt_cont.32222

fbgt_else.32221:
fbgt_cont.32222:
	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.32225

	nop
	nop
	fsub	%f12, %f12, %f14
	j	fbgt_cont.32226

fbgt_else.32225:
fbgt_cont.32226:
	nop
	nop
	nop
	fblt	%f12, %f16, fbgt_else.32227

	nop
	nop
	fsub	%f12, %f14, %f12
	j	fbgt_cont.32228

fbgt_else.32227:
fbgt_cont.32228:
	nop
	nop
	nop
	fblt	%f13, %f12, fbgt_else.32229

	flw	%f17, 478(%zero)
	nop
	fmul	%f2, %f12, %f12
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f17, %f17, %f12

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f12, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	flw	%f17, 476(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f12, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f2
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fsub	%f12, %f18, %f12
	j	fbgt_cont.32230

fbgt_else.32229:
	nop
	nop
	fsub	%f12, %f16, %f12
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f19, %f12, %f12
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f12, %f12, %f19

	flw	%f12, 473(%zero)
	nop
	fsub	%f17, %f30, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	flw	%f12, 472(%zero)
	nop
	fadd	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

fbgt_cont.32230:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32231

	nop
	nop
	nop
	j	bnei_cont.32232

bnei_else.32231:
	nop
	nop
	fneg	%f12, %f12
	nop

bnei_cont.32232:
	flw	%f19, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	fabs	%f18, %f19
	nop

	nop
	nop
	fdiv	%f17, %f18, %f15
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f15
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.32233

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32234

fbgt_else.32233:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32234:
	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.32235

	nop
	nop
	fsub	%f17, %f17, %f14
	j	fbgt_cont.32236

fbgt_else.32235:
fbgt_cont.32236:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.32237

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32239

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32238

bnei_else.32239:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32240:
	nop
	nop
	nop
	j	fbgt_cont.32238

fbgt_else.32237:
fbgt_cont.32238:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.32241

	nop
	nop
	fsub	%f17, %f14, %f17
	j	fbgt_cont.32242

fbgt_else.32241:
fbgt_cont.32242:
	nop
	nop
	nop
	fblt	%f13, %f17, fbgt_else.32243

	flw	%f17, 474(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 473(%zero)
	nop
	fsub	%f18, %f30, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 472(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.32244

fbgt_else.32243:
	flw	%f17, 478(%zero)
	nop
	fsub	%f21, %f16, %f17
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f17, %f17, %f21

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f21, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 476(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

fbgt_cont.32244:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32245

	nop
	nop
	nop
	j	bnei_cont.32246

bnei_else.32245:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.32246:
	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.32247

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.32248

fbgt_else.32247:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.32248:
	nop
	nop
	fabs	%f19, %f19
	nop

	nop
	nop
	fdiv	%f18, %f19, %f15
	nop

	nop
	nop
	floor	%f18, %f18
	nop

	nop
	nop
	fmul	%f15, %f18, %f15
	nop

	nop
	nop
	fsub	%f15, %f19, %f15
	nop

	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.32249

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32251

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32250

bnei_else.32251:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32252:
	nop
	nop
	nop
	j	fbgt_cont.32250

fbgt_else.32249:
fbgt_cont.32250:
	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.32253

	nop
	nop
	fsub	%f15, %f15, %f14
	j	fbgt_cont.32254

fbgt_else.32253:
fbgt_cont.32254:
	nop
	nop
	nop
	fblt	%f15, %f16, fbgt_else.32255

	nop
	nop
	fsub	%f15, %f14, %f15
	j	fbgt_cont.32256

fbgt_else.32255:
fbgt_cont.32256:
	nop
	nop
	nop
	fblt	%f13, %f15, fbgt_else.32257

	flw	%f13, 478(%zero)
	nop
	fmul	%f18, %f15, %f15
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f13, %f13, %f15

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	flw	%f13, 477(%zero)
	nop
	fsub	%f14, %f15, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	flw	%f13, 476(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	j	fbgt_cont.32258

fbgt_else.32257:
	nop
	nop
	fsub	%f13, %f16, %f15
	nop

	flw	%f13, 474(%zero)
	nop
	fmul	%f16, %f13, %f13
	nop

	nop
	nop
	fmul	%f15, %f16, %f16
	fmul	%f13, %f13, %f16

	flw	%f13, 473(%zero)
	nop
	fsub	%f14, %f30, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	flw	%f13, 472(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	nop

fbgt_cont.32258:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32259

	nop
	nop
	nop
	j	bnei_cont.32260

bnei_else.32259:
	nop
	nop
	fneg	%f13, %f13
	nop

bnei_cont.32260:
	nop
	nop
	fmul	%f18, %f11, %f17
	fmul	%f21, %f1, %f12

	nop
	nop
	fmul	%f15, %f21, %f17
	fmul	%f14, %f0, %f13

	nop
	nop
	fsub	%f16, %f15, %f14
	fmul	%f20, %f0, %f12

	nop
	nop
	fmul	%f15, %f20, %f17
	fmul	%f14, %f1, %f13

	nop
	nop
	fadd	%f19, %f15, %f14
	fmul	%f2, %f11, %f13

	nop
	nop
	fmul	%f15, %f21, %f13
	fmul	%f14, %f0, %f17

	nop
	nop
	fadd	%f15, %f15, %f14
	fmul	%f14, %f20, %f13

	flw	%f12, 1(%s1)
	flw	%f17, 470(%zero)
	fmul	%f13, %f1, %f17
	fneg	%f20, %f12

	flw	%f13, 0(%s1)
	nop
	fsub	%f21, %f14, %f13
	fmul	%f14, %f1, %f11

	flw	%f11, 2(%s1)
	nop
	fmul	%f22, %f0, %f11
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f20

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%s1)
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f15, %f15

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f14, %f14

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%s1)
	nop
	fmul	%f0, %f19, %f19
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%s1)
	nop
	fmul	%f0, %f13, %f16
	fmul	%f13, %f13, %f18

	nop
	nop
	fmul	%f1, %f0, %f19
	fmul	%f0, %f12, %f15

	nop
	nop
	fmul	%f0, %f0, %f21
	fmul	%f12, %f12, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fmul	%f0, %f0, %f22
	fmul	%f11, %f11, %f20

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f19

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 0(%s0)
	nop
	fmul	%f0, %f12, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f22

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f16

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%s0)
	nop
	fmul	%f0, %f12, %f15
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	j	bnei_cont.32176

bnei_else.32175:
bnei_cont.32176:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.32120:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

read_object.2772:
	nop
	nop
	add	%a1, %zero, %v0
	add	%s7, %zero, %ra

	nop
	nop
	nop
	blti	%a1, 60, bgti_else.32377

	nop
	nop
	add	%ra, %zero, %s7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32377:
	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32379

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%a3, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%fp, %v0, 0
	addi	%k0, %zero, 3

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s0, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s0)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s0)
	nop
	addi	%s3, %zero, 2
	jal	min_caml_read_float

	fsw	%f0, 2(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s1, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s1)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s1)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s1)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.32381

	nop
	nop
	add	%s2, %zero, %zero
	j	fbgt_cont.32382

fbgt_else.32381:
	nop
	nop
	add	%s2, %zero, %k1
	nop

fbgt_cont.32382:
	nop
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s3, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s3)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s3)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s4, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s4)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s4)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s4)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%k0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.32383

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%k0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%k0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%k0)
	nop
	nop
	j	bnei_cont.32384

bnei_else.32383:
bnei_cont.32384:
	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32385

	nop
	nop
	add	%s5, %zero, %s2
	j	bnei_cont.32386

bnei_else.32385:
	nop
	nop
	add	%s5, %zero, %k1
	nop

bnei_cont.32386:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11

	sw	%v0, 10(%ra)
	nop
	nop
	nop

	sw	%k0, 9(%ra)
	nop
	nop
	nop

	sw	%s4, 8(%ra)
	nop
	nop
	nop

	sw	%s3, 7(%ra)
	nop
	nop
	nop

	sw	%s5, 6(%ra)
	nop
	nop
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%fp, 3(%ra)
	nop
	nop
	nop

	sw	%a3, 2(%ra)
	nop
	nop
	nop

	sw	%a2, 1(%ra)
	nop
	nop
	nop

	sw	%a0, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 12(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.32387

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32389

	nop
	nop
	nop
	j	bnei_cont.32388

bnei_else.32389:
	nop
	nop
	nop
	beqi	%s2, 0, bnei_else.32391

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32392

bnei_else.32391:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32392:
	flw	%f13, 0(%s0)
	flw	%f12, 1(%s0)
	nop
	nop

	flw	%f11, 2(%s0)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32393

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.32394

fbeq_else.32393:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.32394:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32395

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32396

bnei_else.32395:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32397

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32398

bnei_else.32397:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.32398:
bnei_cont.32396:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 0(%s0)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 1(%s0)
	nop
	nop
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	nop

bnei_cont.32390:
	nop
	nop
	nop
	j	bnei_cont.32388

bnei_else.32387:
	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32399

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32400

fbeq_else.32399:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32400:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32401

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32402

bnei_else.32401:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32403

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32404

fbeq_else.32403:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32404:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32405

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32406

bnei_else.32405:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32407

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32408

fbgt_else.32407:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32408:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32409

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32410

bnei_else.32409:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32410:
bnei_cont.32406:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32402:
	fsw	%f0, 0(%s0)
	nop
	nop
	nop

	flw	%f1, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32411

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32412

fbeq_else.32411:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32412:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32413

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32414

bnei_else.32413:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32415

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32416

fbeq_else.32415:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32416:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32417

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32418

bnei_else.32417:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32419

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32420

fbgt_else.32419:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32420:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32421

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32422

bnei_else.32421:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32422:
bnei_cont.32418:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32414:
	fsw	%f0, 1(%s0)
	nop
	nop
	nop

	flw	%f1, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32423

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32424

fbeq_else.32423:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32424:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32425

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32426

bnei_else.32425:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32427

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32428

fbeq_else.32427:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32428:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32429

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32430

bnei_else.32429:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32431

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32432

fbgt_else.32431:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32432:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32433

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32434

bnei_else.32433:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32434:
bnei_cont.32430:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32426:
	fsw	%f0, 2(%s0)
	nop
	nop
	nop

bnei_cont.32388:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.32435

	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2767

	nop
	nop
	nop
	j	bnei_cont.32436

bnei_else.32435:
bnei_cont.32436:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32380

bnei_else.32379:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32380:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32437

	nop
	nop
	addi	%t7, %a1, 1
	nop

	nop
	nop
	nop
	blti	%t7, 60, bgti_else.32438

	nop
	nop
	add	%ra, %zero, %s7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32438:
	nop
	nop
	addi	%v0, %t7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32440

	nop
	nop
	addi	%v0, %t7, 1
	add	%ra, %zero, %s7

	nop
	nop
	nop
	j	read_object.2772

bnei_else.32440:
	sw	%t7, 0(%zero)
	nop
	add	%ra, %zero, %s7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32437:
	sw	%a1, 0(%zero)
	nop
	add	%ra, %zero, %s7
	nop

	nop
	nop
	nop
	jr	%ra

read_net_item.2776:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%t6, 1(%sp)
	nop
	nop
	nop

	sw	%t5, 2(%sp)
	nop
	nop
	nop

	sw	%t4, 3(%sp)
	nop
	nop
	nop

	sw	%t3, 4(%sp)
	nop
	nop
	nop

	sw	%t2, 5(%sp)
	nop
	nop
	nop

	sw	%t1, 6(%sp)
	nop
	nop
	nop

	sw	%t0, 7(%sp)
	nop
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t0, %v0, 0

	nop
	nop
	addi	%a0, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%t0, -1, bnei_else.32508

	lw	%a1, 0(%sp)
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	addi	%t1, %a1, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0

	nop
	nop
	nop
	beqi	%t2, -1, bnei_else.32509

	nop
	nop
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0

	nop
	nop
	nop
	beqi	%t4, -1, bnei_else.32511

	nop
	nop
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0

	nop
	nop
	nop
	beqi	%t6, -1, bnei_else.32513

	nop
	nop
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -9
	add	%at, %v0, %t5

	sw	%t6, 0(%at)
	nop
	nop
	j	bnei_cont.32514

bnei_else.32513:
	nop
	nop
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.32514:
	nop
	nop
	add	%at, %v0, %t3
	nop

	sw	%t4, 0(%at)
	nop
	nop
	j	bnei_cont.32512

bnei_else.32511:
	nop
	nop
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.32512:
	nop
	nop
	add	%at, %v0, %t1
	nop

	sw	%t2, 0(%at)
	nop
	nop
	j	bnei_cont.32510

bnei_else.32509:
	nop
	nop
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.32510:
	lw	%a0, 0(%sp)
	lw	%t6, 1(%sp)
	nop
	nop

	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	add	%at, %v0, %a0
	nop

	sw	%t0, 0(%at)
	lw	%t3, 4(%sp)
	nop
	nop

	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	nop
	nop

	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32508:
	lw	%a1, 0(%sp)
	lw	%t6, 1(%sp)
	addi	%v1, %a0, 0
	nop

	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	addi	%v0, %a1, 1
	nop

	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	nop
	nop

	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	nop
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	j	min_caml_create_array

read_or_network.2778:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%t1, 1(%sp)
	nop
	nop
	nop

	sw	%t0, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	addi	%a3, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32585

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32587

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.32589

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

	sw	%k0, 2(%v1)
	nop
	nop
	j	bnei_cont.32590

bnei_else.32589:
	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.32590:
	sw	%fp, 1(%v1)
	nop
	nop
	j	bnei_cont.32588

bnei_else.32587:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.32588:
	sw	%a2, 0(%v1)
	nop
	nop
	j	bnei_cont.32586

bnei_else.32585:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.32586:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32591

	lw	%a0, 0(%sp)
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	addi	%t0, %a0, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32592

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%fp, %v0, 0

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32594

	nop
	nop
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

	sw	%fp, 1(%t1)
	nop
	nop
	j	bnei_cont.32595

bnei_else.32594:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

bnei_cont.32595:
	sw	%a2, 0(%t1)
	nop
	nop
	j	bnei_cont.32593

bnei_else.32592:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

bnei_cont.32593:
	lw	%a0, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32596

	nop
	nop
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_or_network.2778

	nop
	nop
	addi	%sp, %sp, -5
	add	%at, %v0, %t0

	sw	%t1, 0(%at)
	nop
	nop
	j	bnei_cont.32597

bnei_else.32596:
	nop
	nop
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

bnei_cont.32597:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	add	%at, %v0, %a0
	nop

	sw	%a1, 0(%at)
	lw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32591:
	lw	%a0, 0(%sp)
	lw	%t1, 1(%sp)
	nop
	nop

	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	addi	%v0, %a0, 1
	j	min_caml_create_array

read_and_network.2780:
	nop
	nop
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%fp, %v0, 0
	addi	%k0, %zero, -1

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32645

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%s0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.32647

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%s1, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s1, -1, bnei_else.32649

	nop
	nop
	addi	%v0, %zero, 3
	jal	read_net_item.2776

	sw	%s1, 2(%v0)
	nop
	nop
	j	bnei_cont.32650

bnei_else.32649:
	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32650:
	sw	%s0, 1(%v0)
	nop
	nop
	j	bnei_cont.32648

bnei_else.32647:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32648:
	sw	%fp, 0(%v0)
	nop
	nop
	j	bnei_cont.32646

bnei_else.32645:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32646:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32651

	sw	%v0, 83(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%s0, %a2, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32652

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%fp, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32654

	nop
	nop
	addi	%v0, %zero, 2
	jal	read_net_item.2776

	sw	%fp, 1(%v0)
	nop
	nop
	j	bnei_cont.32655

bnei_else.32654:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32655:
	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.32653

bnei_else.32652:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32653:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32656

	sw	%v0, 83(%s0)
	nop
	nop
	nop

	nop
	nop
	addi	%fp, %s0, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32657

	nop
	nop
	addi	%v0, %k1, 0
	jal	read_net_item.2776

	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.32658

bnei_else.32657:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.32658:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32659

	sw	%v0, 83(%fp)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%a2, %fp, 1
	jal	read_net_item.2776

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32660

	sw	%v0, 83(%a2)
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	addi	%v0, %a2, 1
	j	read_and_network.2780

bnei_else.32660:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32659:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32656:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32651:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	nop
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1

	nop
	nop
	add	%a2, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.32842

	lw	%a3, 12(%a1)
	lw	%k0, 1(%a0)
	nop
	nop

	lw	%fp, 0(%a0)
	lw	%s2, 9(%a3)
	nop
	nop

	lw	%s1, 6(%a3)
	lw	%s0, 4(%a3)
	nop
	nop

	lw	%s3, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.32843

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32845

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f18, 2(%fp)
	flw	%f14, 0(%s0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%s0)
	flw	%f13, 2(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32847

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.32848

bnei_else.32847:
bnei_cont.32848:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32849

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 474(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.32850

bnei_else.32849:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.32850:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.32851

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.32852

fbeq_else.32851:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.32852:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32853

	nop
	nop
	nop
	j	bnei_cont.32854

bnei_else.32853:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.32854:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.32844

bnei_else.32845:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%s0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32855

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.32856

fbgt_else.32855:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.32856:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32857

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.32858

bnei_else.32857:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.32858:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32846:
	nop
	nop
	nop
	j	bnei_cont.32844

bnei_else.32843:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32859

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.32860

fbeq_else.32859:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.32860:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32861

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.32862

bnei_else.32861:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32863

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.32864

fbgt_else.32863:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.32864:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32865

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32867

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.32866

bnei_else.32867:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.32868:
	nop
	nop
	nop
	j	bnei_cont.32866

bnei_else.32865:
bnei_cont.32866:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32869

	nop
	nop
	nop
	j	bnei_cont.32870

bnei_else.32869:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32870:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.32862:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32871

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.32872

fbeq_else.32871:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.32872:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32873

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.32874

bnei_else.32873:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32875

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.32876

fbgt_else.32875:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.32876:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32877

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32879

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.32878

bnei_else.32879:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.32880:
	nop
	nop
	nop
	j	bnei_cont.32878

bnei_else.32877:
bnei_cont.32878:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32881

	nop
	nop
	nop
	j	bnei_cont.32882

bnei_else.32881:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32882:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.32874:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32883

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.32884

fbeq_else.32883:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.32884:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32885

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.32886

bnei_else.32885:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32887

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.32888

fbgt_else.32887:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.32888:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32889

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32891

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.32890

bnei_else.32891:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.32892:
	nop
	nop
	nop
	j	bnei_cont.32890

bnei_else.32889:
bnei_cont.32890:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32893

	nop
	nop
	nop
	j	bnei_cont.32894

bnei_else.32893:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32894:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.32886:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32844:
	nop
	nop
	addi	%a3, %a1, -1
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.32895

	lw	%a1, 12(%a3)
	nop
	nop
	nop

	lw	%s2, 9(%a1)
	lw	%s1, 6(%a1)
	nop
	nop

	lw	%s0, 4(%a1)
	lw	%s3, 3(%a1)
	nop
	nop

	lw	%a1, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.32896

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.32898

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f18, 2(%fp)
	flw	%f14, 0(%s0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%s0)
	flw	%f13, 2(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32900

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.32901

bnei_else.32900:
bnei_cont.32901:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32902

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 474(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.32903

bnei_else.32902:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.32903:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.32904

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.32905

fbeq_else.32904:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.32905:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32906

	nop
	nop
	nop
	j	bnei_cont.32907

bnei_else.32906:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.32907:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.32897

bnei_else.32898:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%s0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32908

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.32909

fbgt_else.32908:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.32909:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32910

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.32911

bnei_else.32910:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.32911:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32899:
	nop
	nop
	nop
	j	bnei_cont.32897

bnei_else.32896:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32912

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.32913

fbeq_else.32912:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.32913:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32914

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.32915

bnei_else.32914:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32916

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.32917

fbgt_else.32916:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.32917:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32918

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32920

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.32919

bnei_else.32920:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.32921:
	nop
	nop
	nop
	j	bnei_cont.32919

bnei_else.32918:
bnei_cont.32919:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32922

	nop
	nop
	nop
	j	bnei_cont.32923

bnei_else.32922:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32923:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.32915:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32924

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.32925

fbeq_else.32924:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.32925:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32926

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.32927

bnei_else.32926:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32928

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.32929

fbgt_else.32928:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.32929:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32930

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32932

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.32931

bnei_else.32932:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.32933:
	nop
	nop
	nop
	j	bnei_cont.32931

bnei_else.32930:
bnei_cont.32931:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32934

	nop
	nop
	nop
	j	bnei_cont.32935

bnei_else.32934:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32935:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.32927:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32936

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.32937

fbeq_else.32936:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.32937:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32938

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.32939

bnei_else.32938:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32940

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.32941

fbgt_else.32940:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.32941:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32942

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32944

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.32943

bnei_else.32944:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.32945:
	nop
	nop
	nop
	j	bnei_cont.32943

bnei_else.32942:
bnei_cont.32943:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32946

	nop
	nop
	nop
	j	bnei_cont.32947

bnei_else.32946:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32947:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.32939:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32897:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.32895:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32842:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2880:
	lw	%a2, 0(%zero)
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra

	nop
	nop
	addi	%a3, %a2, -1
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.33045

	lw	%a2, 12(%a3)
	lw	%fp, 1(%a0)
	nop
	nop

	lw	%s0, 0(%a0)
	lw	%s2, 9(%a2)
	nop
	nop

	lw	%s1, 6(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%s3, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33046

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33048

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%s0)
	flw	%f17, 1(%s0)
	nop
	nop

	flw	%f18, 2(%s0)
	flw	%f14, 0(%k0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%k0)
	flw	%f13, 2(%k0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.33050

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.33051

bnei_else.33050:
bnei_cont.33051:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.33052

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 474(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.33053

bnei_else.33052:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.33053:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.33054

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.33055

fbeq_else.33054:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.33055:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33056

	nop
	nop
	nop
	j	bnei_cont.33057

bnei_else.33056:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.33057:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.33047

bnei_else.33048:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%s0)
	flw	%f13, 0(%k0)
	nop
	nop

	flw	%f0, 1(%s0)
	flw	%f12, 1(%k0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%k0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%s0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.33058

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.33059

fbgt_else.33058:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.33059:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33060

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.33061

bnei_else.33060:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.33061:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.33049:
	nop
	nop
	nop
	j	bnei_cont.33047

bnei_else.33046:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33062

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.33063

fbeq_else.33062:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.33063:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33064

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.33065

bnei_else.33064:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33066

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.33067

fbgt_else.33066:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.33067:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33068

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33070

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.33069

bnei_else.33070:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.33071:
	nop
	nop
	nop
	j	bnei_cont.33069

bnei_else.33068:
bnei_cont.33069:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33072

	nop
	nop
	nop
	j	bnei_cont.33073

bnei_else.33072:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33073:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.33065:
	flw	%f1, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33074

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.33075

fbeq_else.33074:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.33075:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33076

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.33077

bnei_else.33076:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33078

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.33079

fbgt_else.33078:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.33079:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33080

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33082

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.33081

bnei_else.33082:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.33083:
	nop
	nop
	nop
	j	bnei_cont.33081

bnei_else.33080:
bnei_cont.33081:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33084

	nop
	nop
	nop
	j	bnei_cont.33085

bnei_else.33084:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33085:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.33077:
	flw	%f1, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33086

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.33087

fbeq_else.33086:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.33087:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33088

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.33089

bnei_else.33088:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33090

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.33091

fbgt_else.33090:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.33091:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33092

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33094

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.33093

bnei_else.33094:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.33095:
	nop
	nop
	nop
	j	bnei_cont.33093

bnei_else.33092:
bnei_cont.33093:
	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33096

	nop
	nop
	nop
	j	bnei_cont.33097

bnei_else.33096:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33097:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.33089:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.33047:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.33045:
	nop
	nop
	add	%ra, %zero, %a1
	nop

	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.33128

	lw	%a1, 12(%v1)
	flw	%f1, 0(%v0)
	nop
	nop

	lw	%k0, 10(%a1)
	lw	%a2, 9(%a1)
	nop
	nop

	lw	%a0, 5(%a1)
	lw	%fp, 4(%a1)
	nop
	nop

	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%k0)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 2(%v0)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%k0)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33129

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.33131

	nop
	nop
	nop
	j	bnei_cont.33130

bgt_else.33131:
	flw	%f14, 0(%k0)
	flw	%f13, 1(%k0)
	nop
	nop

	flw	%f12, 2(%k0)
	flw	%f0, 0(%fp)
	fmul	%f1, %f14, %f14
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f11, %f1, %f0
	fmul	%f1, %f13, %f13

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f12, %f12

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33133

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f13, %f12
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f12, %f14

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.33134

bnei_else.33133:
bnei_cont.33134:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33135

	nop
	nop
	nop
	j	bnei_cont.33136

bnei_else.33135:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33136:
	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bgt_cont.33132:
	nop
	nop
	nop
	j	bnei_cont.33130

bnei_else.33129:
	flw	%f1, 0(%k0)
	flw	%f12, 1(%k0)
	nop
	nop

	flw	%f11, 2(%k0)
	flw	%f0, 0(%fp)
	nop
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bnei_cont.33130:
	nop
	nop
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882

bgti_else.33128:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2907:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33277

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33278

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33280

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33282

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.33283

bnei_else.33282:
bnei_cont.33283:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33284

	nop
	nop
	nop
	j	bnei_cont.33285

bnei_else.33284:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.33285:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33286

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33287

fbgt_else.33286:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33287:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33288

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33290

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33289

bnei_else.33290:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33291:
	nop
	nop
	nop
	j	bnei_cont.33289

bnei_else.33288:
bnei_cont.33289:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33292

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33279

bnei_else.33292:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33293:
	nop
	nop
	nop
	j	bnei_cont.33279

bnei_else.33280:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33294

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33295

fbgt_else.33294:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33295:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33296

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33298

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33297

bnei_else.33298:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33299:
	nop
	nop
	nop
	j	bnei_cont.33297

bnei_else.33296:
bnei_cont.33297:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33300

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33279

bnei_else.33300:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33301:
bnei_cont.33281:
	nop
	nop
	nop
	j	bnei_cont.33279

bnei_else.33278:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33302

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33303

fbgt_else.33302:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33303:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33304

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33306

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33307

fbgt_else.33306:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33307:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33308

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33310

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33305

fbgt_else.33310:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33311:
	nop
	nop
	nop
	j	bnei_cont.33305

bnei_else.33308:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33309:
	nop
	nop
	nop
	j	bnei_cont.33305

bnei_else.33304:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33305:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33312

	nop
	nop
	nop
	j	bnei_cont.33313

bnei_else.33312:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33314

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33315

bnei_else.33314:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33315:
bnei_cont.33313:
bnei_cont.33279:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33316

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.33316:
	nop
	nop
	addi	%s0, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %s0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33317

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33318

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33320

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33322

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.33323

bnei_else.33322:
bnei_cont.33323:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33324

	nop
	nop
	nop
	j	bnei_cont.33325

bnei_else.33324:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.33325:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33326

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33327

fbgt_else.33326:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33327:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33328

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33330

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33329

bnei_else.33330:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33331:
	nop
	nop
	nop
	j	bnei_cont.33329

bnei_else.33328:
bnei_cont.33329:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33332

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33319

bnei_else.33332:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33333:
	nop
	nop
	nop
	j	bnei_cont.33319

bnei_else.33320:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33334

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33335

fbgt_else.33334:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33335:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33336

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33338

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33337

bnei_else.33338:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33339:
	nop
	nop
	nop
	j	bnei_cont.33337

bnei_else.33336:
bnei_cont.33337:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33340

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33319

bnei_else.33340:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33341:
bnei_cont.33321:
	nop
	nop
	nop
	j	bnei_cont.33319

bnei_else.33318:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33342

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33343

fbgt_else.33342:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33343:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33344

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33346

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33347

fbgt_else.33346:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33347:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33348

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33350

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33345

fbgt_else.33350:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33351:
	nop
	nop
	nop
	j	bnei_cont.33345

bnei_else.33348:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33349:
	nop
	nop
	nop
	j	bnei_cont.33345

bnei_else.33344:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33345:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33352

	nop
	nop
	nop
	j	bnei_cont.33353

bnei_else.33352:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33354

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33355

bnei_else.33354:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33355:
bnei_cont.33353:
bnei_cont.33319:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33356

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.33356:
	nop
	nop
	addi	%a0, %s0, 1
	nop

	nop
	nop
	addi	%v0, %a0, 0
	j	check_all_inside.2907

bnei_else.33317:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.33277:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

shadow_check_and_group.2913:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra

	nop
	nop
	add	%at, %v1, %s1
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%ra, -1, bnei_else.33547

	lw	%a2, 12(%ra)
	flw	%f14, 138(%zero)
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f11, 139(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f13, 140(%zero)
	fsub	%f17, %f14, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%ra, 187(%ra)
	fsub	%f18, %f11, %f0
	nop

	nop
	nop
	fsub	%f19, %f13, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33548

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33550

	flw	%f16, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.33552

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33553

fbeq_else.33552:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33553:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33554

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33549

bnei_else.33554:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 0(%k0)
	nop
	fadd	%f15, %f1, %f0
	fmul	%f1, %f17, %f17

	flw	%f0, 1(%k0)
	nop
	fmul	%f12, %f1, %f0
	fmul	%f1, %f18, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 2(%k0)
	nop
	fadd	%f12, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33556

	flw	%f1, 0(%a3)
	nop
	fmul	%f12, %f18, %f19
	nop

	nop
	nop
	fmul	%f1, %f12, %f1
	nop

	flw	%f0, 1(%a3)
	nop
	fadd	%f12, %f0, %f1
	fmul	%f1, %f19, %f17

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f17, %f18

	flw	%f0, 2(%a3)
	nop
	fadd	%f12, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	j	bnei_cont.33557

bnei_else.33556:
bnei_cont.33557:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33558

	nop
	nop
	nop
	j	bnei_cont.33559

bnei_else.33558:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33559:
	nop
	nop
	fmul	%f1, %f15, %f15
	fmul	%f0, %f16, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33560

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33561

fbgt_else.33560:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33561:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33562

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33564

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.33565

bnei_else.33564:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.33565:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33549

bnei_else.33562:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33563:
bnei_cont.33555:
	nop
	nop
	nop
	j	bnei_cont.33549

bnei_else.33550:
	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.33566

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33567

fbgt_else.33566:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33567:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33568

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33549

bnei_else.33568:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33569:
bnei_cont.33551:
	nop
	nop
	nop
	j	bnei_cont.33549

bnei_else.33548:
	flw	%f0, 0(%ra)
	flw	%f2, 1(%ra)
	nop
	nop

	flw	%f15, 185(%zero)
	flw	%f12, 1(%k0)
	fsub	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f16, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f16, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33570

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33571

fbgt_else.33570:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33571:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33572

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33574

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33575

fbgt_else.33574:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33575:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33576

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.33578

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33579

fbeq_else.33578:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33579:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33580

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33573

bnei_else.33580:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33581:
	nop
	nop
	nop
	j	bnei_cont.33573

bnei_else.33576:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33577:
	nop
	nop
	nop
	j	bnei_cont.33573

bnei_else.33572:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33573:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33582

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33583

bnei_else.33582:
	flw	%f0, 2(%ra)
	flw	%f21, 3(%ra)
	nop
	nop

	flw	%f20, 184(%zero)
	flw	%f2, 0(%k0)
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f16, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f16, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33584

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33585

fbgt_else.33584:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33585:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33586

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33588

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33589

fbgt_else.33588:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33589:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33590

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.33592

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33593

fbeq_else.33592:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33593:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33594

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33587

bnei_else.33594:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33595:
	nop
	nop
	nop
	j	bnei_cont.33587

bnei_else.33590:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33591:
	nop
	nop
	nop
	j	bnei_cont.33587

bnei_else.33586:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33587:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33596

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.33597

bnei_else.33596:
	flw	%f0, 4(%ra)
	flw	%f16, 5(%ra)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f1, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f1, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33598

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33599

fbgt_else.33598:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33599:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33600

	nop
	nop
	fmul	%f0, %f1, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33602

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33603

fbgt_else.33602:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33603:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33604

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.33606

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33607

fbeq_else.33606:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33607:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33608

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33601

bnei_else.33608:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33609:
	nop
	nop
	nop
	j	bnei_cont.33601

bnei_else.33604:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33605:
	nop
	nop
	nop
	j	bnei_cont.33601

bnei_else.33600:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33601:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33610

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.33611

bnei_else.33610:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33611:
bnei_cont.33597:
bnei_cont.33583:
bnei_cont.33549:
	flw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33612

	nop
	nop
	nop
	fblt	%f0, %f10, fbgt_else.33614

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33613

fbgt_else.33614:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33615:
	nop
	nop
	nop
	j	bnei_cont.33613

bnei_else.33612:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33613:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33616

	flw	%f0, 78(%zero)
	flw	%f1, 79(%zero)
	fadd	%f12, %f0, %f9
	nop

	lw	%a0, 0(%v1)
	nop
	fmul	%f0, %f0, %f12
	fmul	%f1, %f1, %f12

	flw	%f11, 80(%zero)
	nop
	fadd	%f0, %f0, %f14
	fadd	%f1, %f1, %f11

	nop
	nop
	fmul	%f11, %f11, %f12
	nop

	nop
	nop
	fadd	%f2, %f11, %f13
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33617

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33619

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33621

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33623

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.33624

bnei_else.33623:
bnei_cont.33624:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33625

	nop
	nop
	nop
	j	bnei_cont.33626

bnei_else.33625:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.33626:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33627

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33628

fbgt_else.33627:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33628:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33629

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33631

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33630

bnei_else.33631:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33632:
	nop
	nop
	nop
	j	bnei_cont.33630

bnei_else.33629:
bnei_cont.33630:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33633

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33620

bnei_else.33633:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33634:
	nop
	nop
	nop
	j	bnei_cont.33620

bnei_else.33621:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33635

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33636

fbgt_else.33635:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33636:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33637

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33639

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33638

bnei_else.33639:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33640:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33637:
bnei_cont.33638:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33641

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33620

bnei_else.33641:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33642:
bnei_cont.33622:
	nop
	nop
	nop
	j	bnei_cont.33620

bnei_else.33619:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33643

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33644

fbgt_else.33643:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33644:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33645

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33647

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33648

fbgt_else.33647:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33648:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33649

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33651

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33646

fbgt_else.33651:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33652:
	nop
	nop
	nop
	j	bnei_cont.33646

bnei_else.33649:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33650:
	nop
	nop
	nop
	j	bnei_cont.33646

bnei_else.33645:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33646:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33653

	nop
	nop
	nop
	j	bnei_cont.33654

bnei_else.33653:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33655

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33656

bnei_else.33655:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33656:
bnei_cont.33654:
bnei_cont.33620:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33657

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.33618

bnei_else.33657:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2907

bnei_cont.33658:
	nop
	nop
	nop
	j	bnei_cont.33618

bnei_else.33617:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.33618:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33659

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33659:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.33616:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33660

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.33660:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.33547:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2916:
	nop
	nop
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1

	nop
	nop
	add	%s5, %zero, %ra
	add	%at, %s4, %s3

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33698

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33699

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33699:
	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33700

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33701

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33701:
	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33702

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33703

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33703:
	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33704

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33705

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33705:
	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5

	nop
	nop
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916

bnei_else.33704:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.33702:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.33700:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.33698:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2919:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1

	nop
	nop
	add	%t7, %zero, %ra
	add	%at, %s7, %s6

	lw	%t8, 0(%at)
	nop
	nop
	nop

	lw	%k0, 0(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.33875

	nop
	nop
	nop
	beqi	%k0, 99, bnei_else.33876

	lw	%a1, 12(%k0)
	flw	%f1, 138(%zero)
	nop
	nop

	lw	%a2, 9(%a1)
	lw	%fp, 6(%a1)
	nop
	nop

	lw	%a0, 5(%a1)
	lw	%ra, 4(%a1)
	nop
	nop

	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%k0, 187(%k0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	nop
	nop
	fsub	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.33878

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33880

	flw	%f13, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.33882

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33883

fbeq_else.33882:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33883:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33884

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33879

bnei_else.33884:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 3(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 0(%ra)
	nop
	fadd	%f12, %f1, %f0
	fmul	%f1, %f14, %f14

	flw	%f0, 1(%ra)
	nop
	fmul	%f11, %f1, %f0
	fmul	%f1, %f15, %f15

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f16

	flw	%f0, 2(%ra)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33886

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f15, %f16
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f16, %f14

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f14, %f15

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.33887

bnei_else.33886:
bnei_cont.33887:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33888

	nop
	nop
	nop
	j	bnei_cont.33889

bnei_else.33888:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33889:
	nop
	nop
	fmul	%f1, %f12, %f12
	fmul	%f0, %f13, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33890

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33891

fbgt_else.33890:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33891:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33892

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33894

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fadd	%f1, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.33895

bnei_else.33894:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fsub	%f1, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.33895:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33879

bnei_else.33892:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33893:
bnei_cont.33885:
	nop
	nop
	nop
	j	bnei_cont.33879

bnei_else.33880:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.33896

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33897

fbgt_else.33896:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33897:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33898

	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 3(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33879

bnei_else.33898:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33899:
bnei_cont.33881:
	nop
	nop
	nop
	j	bnei_cont.33879

bnei_else.33878:
	flw	%f0, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f12, 185(%zero)
	flw	%f11, 1(%ra)
	fsub	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f13, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33900

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33901

fbgt_else.33900:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33901:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33902

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33904

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33905

fbgt_else.33904:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33905:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33906

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.33908

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33909

fbeq_else.33908:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33909:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33910

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33903

bnei_else.33910:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33911:
	nop
	nop
	nop
	j	bnei_cont.33903

bnei_else.33906:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33907:
	nop
	nop
	nop
	j	bnei_cont.33903

bnei_else.33902:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33903:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33912

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33913

bnei_else.33912:
	flw	%f0, 2(%k0)
	flw	%f19, 3(%k0)
	nop
	nop

	flw	%f18, 184(%zero)
	flw	%f17, 0(%ra)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f13, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f13, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33914

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33915

fbgt_else.33914:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33915:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33916

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33918

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33919

fbgt_else.33918:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33919:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33920

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.33922

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33923

fbeq_else.33922:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33923:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33924

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33917

bnei_else.33924:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33925:
	nop
	nop
	nop
	j	bnei_cont.33917

bnei_else.33920:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33921:
	nop
	nop
	nop
	j	bnei_cont.33917

bnei_else.33916:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33917:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33926

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.33927

bnei_else.33926:
	flw	%f0, 4(%k0)
	flw	%f13, 5(%k0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33928

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33929

fbgt_else.33928:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33929:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33930

	nop
	nop
	fmul	%f0, %f1, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33932

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33933

fbgt_else.33932:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33933:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33934

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.33936

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33937

fbeq_else.33936:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33937:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33938

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33931

bnei_else.33938:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33939:
	nop
	nop
	nop
	j	bnei_cont.33931

bnei_else.33934:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33935:
	nop
	nop
	nop
	j	bnei_cont.33931

bnei_else.33930:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33931:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33940

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.33941

bnei_else.33940:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33941:
bnei_cont.33927:
bnei_cont.33913:
bnei_cont.33879:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33942

	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33944

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33945

fbgt_else.33944:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33945:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33946

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33948

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33950

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33949

bnei_else.33950:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33952

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33954

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33949

bnei_else.33954:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33956

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33958

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33949

bnei_else.33958:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.33959:
	nop
	nop
	nop
	j	bnei_cont.33949

bnei_else.33956:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33957:
bnei_cont.33955:
	nop
	nop
	nop
	j	bnei_cont.33949

bnei_else.33952:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33953:
bnei_cont.33951:
	nop
	nop
	nop
	j	bnei_cont.33949

bnei_else.33948:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33949:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33960

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33877

bnei_else.33960:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33961:
	nop
	nop
	nop
	j	bnei_cont.33877

bnei_else.33946:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33947:
	nop
	nop
	nop
	j	bnei_cont.33877

bnei_else.33942:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33943:
	nop
	nop
	nop
	j	bnei_cont.33877

bnei_else.33876:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33877:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33962

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33963

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33965

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33964

bnei_else.33965:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33967

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33969

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33964

bnei_else.33969:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33971

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33973

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.33964

bnei_else.33973:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.33974:
	nop
	nop
	nop
	j	bnei_cont.33964

bnei_else.33971:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33972:
bnei_cont.33970:
	nop
	nop
	nop
	j	bnei_cont.33964

bnei_else.33967:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33968:
bnei_cont.33966:
	nop
	nop
	nop
	j	bnei_cont.33964

bnei_else.33963:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.33964:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33975

	nop
	nop
	add	%ra, %zero, %t7
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.33975:
	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7

	nop
	nop
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.33962:
	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7

	nop
	nop
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.33875:
	nop
	nop
	add	%ra, %zero, %t7
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

solve_each_element.2922:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0

	nop
	nop
	add	%s3, %zero, %ra
	add	%at, %v1, %s1

	lw	%s4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s4, -1, bnei_else.34216

	lw	%a3, 12(%s4)
	flw	%f14, 159(%zero)
	nop
	nop

	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	nop
	nop

	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	nop
	nop

	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f13, 160(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f12, 161(%zero)
	fsub	%f17, %f14, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fsub	%f18, %f13, %f0
	nop

	nop
	nop
	fsub	%f19, %f12, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.34217

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.34219

	flw	%f23, 0(%s2)
	flw	%f22, 1(%s2)
	nop
	nop

	flw	%f24, 2(%s2)
	flw	%f21, 0(%a1)
	fmul	%f0, %f23, %f23
	nop

	flw	%f2, 1(%a1)
	flw	%f16, 2(%a1)
	fmul	%f1, %f0, %f21
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34221

	flw	%f1, 0(%fp)
	nop
	fmul	%f11, %f22, %f24
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f24, %f23

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f23, %f22

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.34222

bnei_else.34221:
bnei_cont.34222:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.34223

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34224

fbeq_else.34223:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34224:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34225

	nop
	nop
	add	%s5, %zero, %zero
	j	bnei_cont.34218

bnei_else.34225:
	nop
	nop
	fmul	%f1, %f23, %f17
	nop

	nop
	nop
	fmul	%f11, %f1, %f21
	fmul	%f1, %f22, %f18

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	fmul	%f1, %f24, %f19

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34227

	nop
	nop
	fmul	%f15, %f24, %f18
	fmul	%f11, %f22, %f19

	flw	%f11, 0(%fp)
	nop
	fadd	%f15, %f15, %f11
	nop

	nop
	nop
	fmul	%f20, %f15, %f11
	fmul	%f15, %f23, %f19

	nop
	nop
	fmul	%f11, %f24, %f17
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f15, %f15, %f11
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	fmul	%f15, %f23, %f18

	nop
	nop
	fadd	%f20, %f20, %f11
	fmul	%f11, %f22, %f17

	flw	%f11, 2(%fp)
	nop
	fadd	%f15, %f15, %f11
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	nop

	flw	%f11, 474(%zero)
	nop
	fadd	%f15, %f20, %f11
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f11
	j	bnei_cont.34228

bnei_else.34227:
bnei_cont.34228:
	nop
	nop
	fmul	%f11, %f17, %f17
	nop

	nop
	nop
	fmul	%f15, %f11, %f21
	fmul	%f11, %f18, %f18

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fadd	%f15, %f15, %f11
	fmul	%f11, %f19, %f19

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f15, %f11
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34229

	flw	%f15, 0(%fp)
	nop
	fmul	%f16, %f18, %f19
	nop

	nop
	nop
	fmul	%f15, %f16, %f15
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f16, %f11, %f15
	fmul	%f15, %f19, %f17

	nop
	nop
	fmul	%f11, %f15, %f11
	fmul	%f15, %f17, %f18

	flw	%f11, 2(%fp)
	nop
	fadd	%f16, %f16, %f11
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	nop

	nop
	nop
	fadd	%f11, %f16, %f11
	j	bnei_cont.34230

bnei_else.34229:
bnei_cont.34230:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.34231

	nop
	nop
	nop
	j	bnei_cont.34232

bnei_else.34231:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.34232:
	nop
	nop
	fmul	%f15, %f1, %f1
	fmul	%f11, %f0, %f11

	nop
	nop
	fsub	%f11, %f15, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.34233

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34234

fbgt_else.34233:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34234:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34235

	nop
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34237

	nop
	nop
	nop
	j	bnei_cont.34238

bnei_else.34237:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.34238:
	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.34218

bnei_else.34235:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.34236:
bnei_cont.34226:
	nop
	nop
	nop
	j	bnei_cont.34218

bnei_else.34219:
	flw	%f0, 0(%s2)
	flw	%f2, 0(%a1)
	nop
	nop

	flw	%f0, 1(%s2)
	flw	%f16, 1(%a1)
	fmul	%f1, %f0, %f2
	nop

	flw	%f15, 2(%a1)
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 2(%s2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.34239

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34240

fbgt_else.34239:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34240:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34241

	nop
	nop
	fmul	%f1, %f2, %f17
	fmul	%f0, %f16, %f18

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f15, %f19

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f11
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.34218

bnei_else.34241:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.34242:
bnei_cont.34220:
	nop
	nop
	nop
	j	bnei_cont.34218

bnei_else.34217:
	flw	%f15, 0(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f15, %fzero, fbeq_else.34243

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34244

fbeq_else.34243:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34244:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34245

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34246

bnei_else.34245:
	nop
	nop
	nop
	fblt	%f15, %fzero, fbgt_else.34247

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34248

fbgt_else.34247:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34248:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34249

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34251

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34250

bnei_else.34251:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.34252:
	nop
	nop
	nop
	j	bnei_cont.34250

bnei_else.34249:
bnei_cont.34250:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34253

	nop
	nop
	nop
	j	bnei_cont.34254

bnei_else.34253:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34254:
	nop
	nop
	fsub	%f0, %f0, %f17
	nop

	flw	%f0, 1(%s2)
	nop
	fdiv	%f11, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34255

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34256

fbgt_else.34255:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34256:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34257

	flw	%f0, 2(%s2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34259

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34260

fbgt_else.34259:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34260:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34261

	fsw	%f11, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.34258

bnei_else.34261:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34262:
	nop
	nop
	nop
	j	bnei_cont.34258

bnei_else.34257:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34258:
bnei_cont.34246:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34263

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.34264

bnei_else.34263:
	flw	%f11, 1(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f11, %fzero, fbeq_else.34265

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34266

fbeq_else.34265:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34266:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34267

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34268

bnei_else.34267:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.34269

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34270

fbgt_else.34269:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34270:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34271

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34273

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34272

bnei_else.34273:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.34274:
	nop
	nop
	nop
	j	bnei_cont.34272

bnei_else.34271:
bnei_cont.34272:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34275

	nop
	nop
	nop
	j	bnei_cont.34276

bnei_else.34275:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34276:
	nop
	nop
	fsub	%f0, %f0, %f18
	nop

	flw	%f0, 2(%s2)
	nop
	fdiv	%f16, %f0, %f11
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34277

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34278

fbgt_else.34277:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34278:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34279

	nop
	nop
	fmul	%f0, %f16, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34281

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34282

fbgt_else.34281:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34282:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34283

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.34280

bnei_else.34283:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34284:
	nop
	nop
	nop
	j	bnei_cont.34280

bnei_else.34279:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34280:
bnei_cont.34268:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34285

	nop
	nop
	addi	%s5, %zero, 2
	j	bnei_cont.34286

bnei_else.34285:
	flw	%f1, 2(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34287

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34288

fbeq_else.34287:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34288:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34289

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34290

bnei_else.34289:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.34291

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34292

fbgt_else.34291:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34292:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34293

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34295

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34294

bnei_else.34295:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.34296:
	nop
	nop
	nop
	j	bnei_cont.34294

bnei_else.34293:
bnei_cont.34294:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34297

	nop
	nop
	nop
	j	bnei_cont.34298

bnei_else.34297:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34298:
	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	nop
	nop
	fdiv	%f16, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f16, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34299

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34300

fbgt_else.34299:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34300:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34301

	nop
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34303

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34304

fbgt_else.34303:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34304:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34305

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.34302

bnei_else.34305:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34306:
	nop
	nop
	nop
	j	bnei_cont.34302

bnei_else.34301:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34302:
bnei_cont.34290:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34307

	nop
	nop
	addi	%s5, %zero, 3
	j	bnei_cont.34308

bnei_else.34307:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.34308:
bnei_cont.34286:
bnei_cont.34264:
bnei_cont.34218:
	nop
	nop
	nop
	beqi	%s5, 0, bnei_else.34309

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34310

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34311

fbgt_else.34310:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34311:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34312

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34314

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34315

fbgt_else.34314:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34315:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.34313

	flw	%f0, 0(%s2)
	flw	%f1, 1(%s2)
	fadd	%f17, %f1, %f9
	nop

	flw	%f11, 2(%s2)
	lw	%a0, 0(%v1)
	fmul	%f0, %f0, %f17
	fmul	%f1, %f1, %f17

	nop
	nop
	fadd	%f0, %f0, %f14
	fadd	%f1, %f1, %f13

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f2, %f11, %f12
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34318

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.34320

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.34322

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.34324

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.34325

bnei_else.34324:
bnei_cont.34325:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.34326

	nop
	nop
	nop
	j	bnei_cont.34327

bnei_else.34326:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.34327:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.34328

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34329

fbgt_else.34328:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34329:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34330

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34332

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34331

bnei_else.34332:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.34333:
	nop
	nop
	nop
	j	bnei_cont.34331

bnei_else.34330:
bnei_cont.34331:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34334

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.34321

bnei_else.34334:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.34335:
	nop
	nop
	nop
	j	bnei_cont.34321

bnei_else.34322:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.34336

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34337

fbgt_else.34336:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34337:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34338

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34340

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34339

bnei_else.34340:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.34341:
	nop
	nop
	nop
	j	bnei_cont.34339

bnei_else.34338:
bnei_cont.34339:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34342

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.34321

bnei_else.34342:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.34343:
bnei_cont.34323:
	nop
	nop
	nop
	j	bnei_cont.34321

bnei_else.34320:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.34344

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34345

fbgt_else.34344:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34345:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34346

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.34348

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34349

fbgt_else.34348:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34349:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34350

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.34352

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34347

fbgt_else.34352:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34353:
	nop
	nop
	nop
	j	bnei_cont.34347

bnei_else.34350:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34351:
	nop
	nop
	nop
	j	bnei_cont.34347

bnei_else.34346:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34347:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34354

	nop
	nop
	nop
	j	bnei_cont.34355

bnei_else.34354:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34356

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.34357

bnei_else.34356:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.34357:
bnei_cont.34355:
bnei_cont.34321:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34358

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.34319

bnei_else.34358:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2907

bnei_cont.34359:
	nop
	nop
	nop
	j	bnei_cont.34319

bnei_else.34318:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.34319:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.34313

	fsw	%f17, 137(%zero)
	nop
	nop
	nop

	fsw	%f0, 138(%zero)
	nop
	nop
	nop

	fsw	%f1, 139(%zero)
	nop
	nop
	nop

	fsw	%f2, 140(%zero)
	nop
	nop
	nop

	sw	%s4, 141(%zero)
	nop
	nop
	nop

	sw	%s5, 136(%zero)
	nop
	nop
	j	bnei_cont.34313

bnei_else.34360:
bnei_cont.34361:
	nop
	nop
	nop
	j	bnei_cont.34313

bnei_else.34316:
bnei_cont.34317:
	nop
	nop
	nop
	j	bnei_cont.34313

bnei_else.34312:
bnei_cont.34313:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element.2922

bnei_else.34309:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34362

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element.2922

bnei_else.34362:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34216:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2926:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1

	nop
	nop
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34410

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34411

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34412

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34413

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34414

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34415

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34416

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34417

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8

	nop
	nop
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0

	nop
	nop
	nop
	j	solve_one_or_network.2926

bnei_else.34417:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34416:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34415:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34414:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34413:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34412:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34411:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34410:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	nop
	add	%t9, %zero, %a0
	add	%at, %v1, %v0

	sw	%v1, 1(%sp)
	lw	%s6, 0(%at)
	nop
	nop

	sw	%ra, 2(%sp)
	lw	%a0, 0(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35221

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.35222

	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	nop
	nop

	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	nop
	nop

	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	nop
	nop
	fsub	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.35224

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.35226

	flw	%f20, 0(%t9)
	flw	%f2, 1(%t9)
	nop
	nop

	flw	%f21, 2(%t9)
	flw	%f19, 0(%a1)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%a1)
	flw	%f17, 2(%a1)
	fmul	%f1, %f0, %f19
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35228

	flw	%f1, 0(%fp)
	nop
	fmul	%f11, %f2, %f21
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f21, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f2

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.35229

bnei_else.35228:
bnei_cont.35229:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35230

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35231

fbeq_else.35230:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35231:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35232

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35225

bnei_else.35232:
	nop
	nop
	fmul	%f1, %f20, %f14
	nop

	nop
	nop
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35234

	nop
	nop
	fmul	%f12, %f21, %f15
	fmul	%f11, %f2, %f16

	flw	%f11, 0(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f20, %f16

	nop
	nop
	fmul	%f11, %f21, %f14
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f20, %f15

	nop
	nop
	fadd	%f13, %f13, %f11
	fmul	%f11, %f2, %f14

	flw	%f11, 2(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	flw	%f11, 474(%zero)
	nop
	fadd	%f12, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f11
	j	bnei_cont.35235

bnei_else.35234:
bnei_cont.35235:
	nop
	nop
	fmul	%f11, %f14, %f14
	nop

	nop
	nop
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35236

	flw	%f12, 0(%fp)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%fp)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.35237

bnei_else.35236:
bnei_cont.35237:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.35238

	nop
	nop
	nop
	j	bnei_cont.35239

bnei_else.35238:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.35239:
	nop
	nop
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.35240

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35241

fbgt_else.35240:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35241:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35242

	nop
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35244

	nop
	nop
	nop
	j	bnei_cont.35245

bnei_else.35244:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.35245:
	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35225

bnei_else.35242:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35243:
bnei_cont.35233:
	nop
	nop
	nop
	j	bnei_cont.35225

bnei_else.35226:
	flw	%f0, 0(%t9)
	flw	%f17, 0(%a1)
	nop
	nop

	flw	%f0, 1(%t9)
	flw	%f13, 1(%a1)
	fmul	%f1, %f0, %f17
	nop

	flw	%f12, 2(%a1)
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%t9)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.35246

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35247

fbgt_else.35246:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35247:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35248

	nop
	nop
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f11
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35225

bnei_else.35248:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35249:
bnei_cont.35227:
	nop
	nop
	nop
	j	bnei_cont.35225

bnei_else.35224:
	flw	%f12, 0(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.35250

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35251

fbeq_else.35250:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35251:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35252

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35253

bnei_else.35252:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.35254

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35255

fbgt_else.35254:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35255:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35256

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35258

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35257

bnei_else.35258:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35259:
	nop
	nop
	nop
	j	bnei_cont.35257

bnei_else.35256:
bnei_cont.35257:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35260

	nop
	nop
	nop
	j	bnei_cont.35261

bnei_else.35260:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35261:
	nop
	nop
	fsub	%f0, %f0, %f14
	nop

	flw	%f0, 1(%t9)
	nop
	fdiv	%f11, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35262

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35263

fbgt_else.35262:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35263:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35264

	flw	%f0, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35266

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35267

fbgt_else.35266:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35267:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35268

	fsw	%f11, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35265

bnei_else.35268:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35269:
	nop
	nop
	nop
	j	bnei_cont.35265

bnei_else.35264:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35265:
bnei_cont.35253:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35270

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35271

bnei_else.35270:
	flw	%f11, 1(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f11, %fzero, fbeq_else.35272

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35273

fbeq_else.35272:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35273:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35274

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35275

bnei_else.35274:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.35276

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35277

fbgt_else.35276:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35277:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35278

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35280

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35279

bnei_else.35280:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35281:
	nop
	nop
	nop
	j	bnei_cont.35279

bnei_else.35278:
bnei_cont.35279:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35282

	nop
	nop
	nop
	j	bnei_cont.35283

bnei_else.35282:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35283:
	nop
	nop
	fsub	%f0, %f0, %f15
	nop

	flw	%f0, 2(%t9)
	nop
	fdiv	%f13, %f0, %f11
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35284

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35285

fbgt_else.35284:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35285:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35286

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35288

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35289

fbgt_else.35288:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35289:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35290

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35287

bnei_else.35290:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35291:
	nop
	nop
	nop
	j	bnei_cont.35287

bnei_else.35286:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35287:
bnei_cont.35275:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35292

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.35293

bnei_else.35292:
	flw	%f1, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35294

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35295

fbeq_else.35294:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35295:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35296

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35297

bnei_else.35296:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35298

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35299

fbgt_else.35298:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35299:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35300

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35302

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35301

bnei_else.35302:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35303:
	nop
	nop
	nop
	j	bnei_cont.35301

bnei_else.35300:
bnei_cont.35301:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35304

	nop
	nop
	nop
	j	bnei_cont.35305

bnei_else.35304:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35305:
	nop
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fdiv	%f13, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35306

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35307

fbgt_else.35306:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35307:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35308

	nop
	nop
	fmul	%f0, %f13, %f11
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35310

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35311

fbgt_else.35310:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35311:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35312

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35309

bnei_else.35312:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35313:
	nop
	nop
	nop
	j	bnei_cont.35309

bnei_else.35308:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35309:
bnei_cont.35297:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35314

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.35315

bnei_else.35314:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35315:
bnei_cont.35293:
bnei_cont.35271:
bnei_cont.35225:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35223

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35318

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35319

fbgt_else.35318:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35319:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35223

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35223

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.35223

bnei_else.35334:
bnei_cont.35335:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35332:
bnei_cont.35333:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35330:
bnei_cont.35331:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35328:
bnei_cont.35329:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35326:
bnei_cont.35327:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35324:
bnei_cont.35325:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35322:
bnei_cont.35323:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35320:
bnei_cont.35321:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35316:
bnei_cont.35317:
	nop
	nop
	nop
	j	bnei_cont.35223

bnei_else.35222:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35336

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35337

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element.2922

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.35337

bnei_else.35348:
bnei_cont.35349:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35346:
bnei_cont.35347:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35344:
bnei_cont.35345:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35342:
bnei_cont.35343:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35340:
bnei_cont.35341:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35338:
bnei_cont.35339:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35336:
bnei_cont.35337:
bnei_cont.35223:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, 1
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%s6, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35350

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.35351

	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	nop
	nop

	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	nop
	nop

	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	nop
	nop
	fsub	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.35353

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.35355

	flw	%f20, 0(%t9)
	flw	%f2, 1(%t9)
	nop
	nop

	flw	%f21, 2(%t9)
	flw	%f19, 0(%a1)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%a1)
	flw	%f17, 2(%a1)
	fmul	%f1, %f0, %f19
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35357

	flw	%f1, 0(%fp)
	nop
	fmul	%f11, %f2, %f21
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f21, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f2

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.35358

bnei_else.35357:
bnei_cont.35358:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35359

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35360

fbeq_else.35359:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35360:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35361

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35354

bnei_else.35361:
	nop
	nop
	fmul	%f1, %f20, %f14
	nop

	nop
	nop
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35363

	nop
	nop
	fmul	%f12, %f21, %f15
	fmul	%f11, %f2, %f16

	flw	%f11, 0(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f20, %f16

	nop
	nop
	fmul	%f11, %f21, %f14
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f20, %f15

	nop
	nop
	fadd	%f13, %f13, %f11
	fmul	%f11, %f2, %f14

	flw	%f11, 2(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	flw	%f11, 474(%zero)
	nop
	fadd	%f12, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f11
	j	bnei_cont.35364

bnei_else.35363:
bnei_cont.35364:
	nop
	nop
	fmul	%f11, %f14, %f14
	nop

	nop
	nop
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35365

	flw	%f12, 0(%fp)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%fp)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.35366

bnei_else.35365:
bnei_cont.35366:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.35367

	nop
	nop
	nop
	j	bnei_cont.35368

bnei_else.35367:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.35368:
	nop
	nop
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.35369

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35370

fbgt_else.35369:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35370:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35371

	nop
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35373

	nop
	nop
	nop
	j	bnei_cont.35374

bnei_else.35373:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.35374:
	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35354

bnei_else.35371:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35372:
bnei_cont.35362:
	nop
	nop
	nop
	j	bnei_cont.35354

bnei_else.35355:
	flw	%f0, 0(%t9)
	flw	%f17, 0(%a1)
	nop
	nop

	flw	%f0, 1(%t9)
	flw	%f13, 1(%a1)
	fmul	%f1, %f0, %f17
	nop

	flw	%f12, 2(%a1)
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%t9)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.35375

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35376

fbgt_else.35375:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35376:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35377

	nop
	nop
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f11
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35354

bnei_else.35377:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35378:
bnei_cont.35356:
	nop
	nop
	nop
	j	bnei_cont.35354

bnei_else.35353:
	flw	%f12, 0(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.35379

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35380

fbeq_else.35379:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35380:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35381

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35382

bnei_else.35381:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.35383

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35384

fbgt_else.35383:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35384:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35385

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35387

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35386

bnei_else.35387:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35388:
	nop
	nop
	nop
	j	bnei_cont.35386

bnei_else.35385:
bnei_cont.35386:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35389

	nop
	nop
	nop
	j	bnei_cont.35390

bnei_else.35389:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35390:
	nop
	nop
	fsub	%f0, %f0, %f14
	nop

	flw	%f0, 1(%t9)
	nop
	fdiv	%f11, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35391

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35392

fbgt_else.35391:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35392:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35393

	flw	%f0, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35395

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35396

fbgt_else.35395:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35396:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35397

	fsw	%f11, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35394

bnei_else.35397:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35398:
	nop
	nop
	nop
	j	bnei_cont.35394

bnei_else.35393:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35394:
bnei_cont.35382:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35399

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35400

bnei_else.35399:
	flw	%f11, 1(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f11, %fzero, fbeq_else.35401

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35402

fbeq_else.35401:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35402:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35403

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35404

bnei_else.35403:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.35405

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35406

fbgt_else.35405:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35406:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35407

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35409

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35408

bnei_else.35409:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35410:
	nop
	nop
	nop
	j	bnei_cont.35408

bnei_else.35407:
bnei_cont.35408:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35411

	nop
	nop
	nop
	j	bnei_cont.35412

bnei_else.35411:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35412:
	nop
	nop
	fsub	%f0, %f0, %f15
	nop

	flw	%f0, 2(%t9)
	nop
	fdiv	%f13, %f0, %f11
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35413

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35414

fbgt_else.35413:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35414:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35415

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35417

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35418

fbgt_else.35417:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35418:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35419

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35416

bnei_else.35419:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35420:
	nop
	nop
	nop
	j	bnei_cont.35416

bnei_else.35415:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35416:
bnei_cont.35404:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35421

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.35422

bnei_else.35421:
	flw	%f1, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35423

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35424

fbeq_else.35423:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35424:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35425

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35426

bnei_else.35425:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35427

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35428

fbgt_else.35427:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35428:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35429

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35431

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35430

bnei_else.35431:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35432:
	nop
	nop
	nop
	j	bnei_cont.35430

bnei_else.35429:
bnei_cont.35430:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35433

	nop
	nop
	nop
	j	bnei_cont.35434

bnei_else.35433:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35434:
	nop
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fdiv	%f13, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35435

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35436

fbgt_else.35435:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35436:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35437

	nop
	nop
	fmul	%f0, %f13, %f11
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35439

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35440

fbgt_else.35439:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35440:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35441

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35438

bnei_else.35441:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35442:
	nop
	nop
	nop
	j	bnei_cont.35438

bnei_else.35437:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35438:
bnei_cont.35426:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35443

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.35444

bnei_else.35443:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35444:
bnei_cont.35422:
bnei_cont.35400:
bnei_cont.35354:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35352

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35447

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35448

fbgt_else.35447:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35448:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35352

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.35352

bnei_else.35461:
bnei_cont.35462:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35459:
bnei_cont.35460:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35457:
bnei_cont.35458:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35455:
bnei_cont.35456:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35453:
bnei_cont.35454:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35451:
bnei_cont.35452:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35449:
bnei_cont.35450:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35445:
bnei_cont.35446:
	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35351:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35463

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35464

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35464

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35464

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35464

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35464

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element.2922

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.35464

bnei_else.35473:
bnei_cont.35474:
	nop
	nop
	nop
	j	bnei_cont.35464

bnei_else.35471:
bnei_cont.35472:
	nop
	nop
	nop
	j	bnei_cont.35464

bnei_else.35469:
bnei_cont.35470:
	nop
	nop
	nop
	j	bnei_cont.35464

bnei_else.35467:
bnei_cont.35468:
	nop
	nop
	nop
	j	bnei_cont.35464

bnei_else.35465:
bnei_cont.35466:
	nop
	nop
	nop
	j	bnei_cont.35464

bnei_else.35463:
bnei_cont.35464:
bnei_cont.35352:
	lw	%a0, 3(%sp)
	lw	%ra, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %a0, 1
	addi	%a0, %t9, 0

	nop
	nop
	nop
	j	trace_or_matrix.2930

bnei_else.35350:
	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35221:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2936:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0

	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%s3, %zero, %ra
	add	%at, %v1, %s1

	lw	%s4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s4, -1, bnei_else.35669

	lw	%a0, 12(%s4)
	nop
	add	%at, %fp, %s4
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%k0, 4(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%fp, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.35670

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35672

	flw	%f12, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.35674

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35675

fbeq_else.35674:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35675:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35676

	nop
	nop
	add	%s5, %zero, %zero
	j	bnei_cont.35671

bnei_else.35676:
	flw	%f0, 1(%fp)
	nop
	nop
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35678

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35679

fbgt_else.35678:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35679:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35680

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35682

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.35683

bnei_else.35682:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.35683:
	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.35671

bnei_else.35680:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.35681:
bnei_cont.35677:
	nop
	nop
	nop
	j	bnei_cont.35671

bnei_else.35672:
	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35684

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35685

fbgt_else.35684:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35686

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.35671

bnei_else.35686:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.35687:
bnei_cont.35673:
	nop
	nop
	nop
	j	bnei_cont.35671

bnei_else.35670:
	flw	%f0, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f14, 1(%a1)
	flw	%f12, 1(%k0)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.35688

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35689

fbgt_else.35688:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35689:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35690

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35692

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35693

fbgt_else.35692:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35693:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35694

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.35696

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35697

fbeq_else.35696:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35697:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35698

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35691

bnei_else.35698:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35699:
	nop
	nop
	nop
	j	bnei_cont.35691

bnei_else.35694:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35695:
	nop
	nop
	nop
	j	bnei_cont.35691

bnei_else.35690:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35691:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35700

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.35701

bnei_else.35700:
	flw	%f0, 2(%fp)
	flw	%f19, 3(%fp)
	nop
	nop

	flw	%f18, 0(%a1)
	flw	%f17, 0(%k0)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.35702

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35703

fbgt_else.35702:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35703:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35704

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35706

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35707

fbgt_else.35706:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35707:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35708

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.35710

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35711

fbeq_else.35710:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35711:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35712

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35705

bnei_else.35712:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35713:
	nop
	nop
	nop
	j	bnei_cont.35705

bnei_else.35708:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35709:
	nop
	nop
	nop
	j	bnei_cont.35705

bnei_else.35704:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35705:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35714

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s5, %zero, 2
	j	bnei_cont.35715

bnei_else.35714:
	flw	%f0, 4(%fp)
	nop
	nop
	nop

	flw	%f13, 5(%fp)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.35716

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35717

fbgt_else.35716:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35717:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35718

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.35720

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35721

fbgt_else.35720:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35721:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35722

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.35724

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35725

fbeq_else.35724:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35725:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35726

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35719

bnei_else.35726:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35727:
	nop
	nop
	nop
	j	bnei_cont.35719

bnei_else.35722:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35723:
	nop
	nop
	nop
	j	bnei_cont.35719

bnei_else.35718:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35719:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35728

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s5, %zero, 3
	j	bnei_cont.35729

bnei_else.35728:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.35729:
bnei_cont.35715:
bnei_cont.35701:
bnei_cont.35671:
	nop
	nop
	nop
	beqi	%s5, 0, bnei_else.35730

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35731

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35732

fbgt_else.35731:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35732:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35733

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35735

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35736

fbgt_else.35735:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35736:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35734

	flw	%f0, 0(%a1)
	lw	%a0, 0(%v1)
	fadd	%f17, %f1, %f9
	nop

	flw	%f0, 162(%zero)
	nop
	fmul	%f1, %f0, %f17
	nop

	flw	%f1, 1(%a1)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 163(%zero)
	nop
	fmul	%f11, %f1, %f17
	nop

	flw	%f11, 2(%a1)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 164(%zero)
	nop
	fmul	%f12, %f11, %f17
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35739

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.35741

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.35743

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.35745

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.35746

bnei_else.35745:
bnei_cont.35746:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.35747

	nop
	nop
	nop
	j	bnei_cont.35748

bnei_else.35747:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.35748:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.35749

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35750

fbgt_else.35749:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35750:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35751

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35753

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35752

bnei_else.35753:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35754:
	nop
	nop
	nop
	j	bnei_cont.35752

bnei_else.35751:
bnei_cont.35752:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35755

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35742

bnei_else.35755:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.35756:
	nop
	nop
	nop
	j	bnei_cont.35742

bnei_else.35743:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.35757

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35758

fbgt_else.35757:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35758:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35759

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35761

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35760

bnei_else.35761:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35762:
	nop
	nop
	nop
	j	bnei_cont.35760

bnei_else.35759:
bnei_cont.35760:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35763

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35742

bnei_else.35763:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.35764:
bnei_cont.35744:
	nop
	nop
	nop
	j	bnei_cont.35742

bnei_else.35741:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.35765

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35766

fbgt_else.35765:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35766:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35767

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.35769

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35770

fbgt_else.35769:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35770:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35771

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.35773

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35768

fbgt_else.35773:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35774:
	nop
	nop
	nop
	j	bnei_cont.35768

bnei_else.35771:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35772:
	nop
	nop
	nop
	j	bnei_cont.35768

bnei_else.35767:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35768:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35775

	nop
	nop
	nop
	j	bnei_cont.35776

bnei_else.35775:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35777

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35778

bnei_else.35777:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.35778:
bnei_cont.35776:
bnei_cont.35742:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35779

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.35740

bnei_else.35779:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2907

bnei_cont.35780:
	nop
	nop
	nop
	j	bnei_cont.35740

bnei_else.35739:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.35740:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.35734

	fsw	%f17, 137(%zero)
	nop
	nop
	nop

	fsw	%f0, 138(%zero)
	nop
	nop
	nop

	fsw	%f1, 139(%zero)
	nop
	nop
	nop

	fsw	%f2, 140(%zero)
	nop
	nop
	nop

	sw	%s4, 141(%zero)
	nop
	nop
	nop

	sw	%s5, 136(%zero)
	nop
	nop
	j	bnei_cont.35734

bnei_else.35781:
bnei_cont.35782:
	nop
	nop
	nop
	j	bnei_cont.35734

bnei_else.35737:
bnei_cont.35738:
	nop
	nop
	nop
	j	bnei_cont.35734

bnei_else.35733:
bnei_cont.35734:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.35730:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35783

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.35783:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35669:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2940:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1

	nop
	nop
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35831

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35832

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35833

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35834

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35835

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35836

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35837

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35838

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8

	nop
	nop
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0

	nop
	nop
	nop
	j	solve_one_or_network_fast.2940

bnei_else.35838:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35837:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35836:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35835:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35834:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35833:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35832:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35831:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	nop
	add	%t9, %zero, %a0
	add	%at, %v1, %v0

	sw	%v1, 1(%sp)
	lw	%s6, 0(%at)
	nop
	nop

	sw	%ra, 2(%sp)
	lw	%s0, 0(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.36450

	nop
	nop
	nop
	beqi	%s0, 99, bnei_else.36451

	lw	%a0, 12(%s0)
	lw	%k0, 0(%t9)
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%a0, 1(%t9)
	nop
	nop

	nop
	nop
	add	%at, %a0, %s0
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.36453

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36455

	flw	%f12, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.36457

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36458

fbeq_else.36457:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36458:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36459

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36454

bnei_else.36459:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36461

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36462

fbgt_else.36461:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36462:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36463

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36465

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36466

bnei_else.36465:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36466:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36454

bnei_else.36463:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36464:
bnei_cont.36460:
	nop
	nop
	nop
	j	bnei_cont.36454

bnei_else.36455:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36467

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36468

fbgt_else.36467:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36468:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36469

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36454

bnei_else.36469:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36470:
bnei_cont.36456:
	nop
	nop
	nop
	j	bnei_cont.36454

bnei_else.36453:
	flw	%f0, 0(%ra)
	flw	%f17, 1(%ra)
	nop
	nop

	flw	%f14, 1(%k0)
	flw	%f12, 1(%fp)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36471

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36472

fbgt_else.36471:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36472:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36473

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36475

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36476

fbgt_else.36475:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36476:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36477

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.36479

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36480

fbeq_else.36479:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36480:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36481

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36474

bnei_else.36481:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36482:
	nop
	nop
	nop
	j	bnei_cont.36474

bnei_else.36477:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36478:
	nop
	nop
	nop
	j	bnei_cont.36474

bnei_else.36473:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36474:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36483

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36484

bnei_else.36483:
	flw	%f0, 2(%ra)
	flw	%f19, 3(%ra)
	nop
	nop

	flw	%f18, 0(%k0)
	flw	%f17, 0(%fp)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36485

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36486

fbgt_else.36485:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36486:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36487

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36489

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36490

fbgt_else.36489:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36490:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36491

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.36493

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36494

fbeq_else.36493:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36494:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36495

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36488

bnei_else.36495:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36496:
	nop
	nop
	nop
	j	bnei_cont.36488

bnei_else.36491:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36492:
	nop
	nop
	nop
	j	bnei_cont.36488

bnei_else.36487:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36488:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36497

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.36498

bnei_else.36497:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f13, 5(%ra)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36499

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36500

fbgt_else.36499:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36500:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36501

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36503

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36504

fbgt_else.36503:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36504:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36505

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.36507

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36508

fbeq_else.36507:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36508:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36509

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36502

bnei_else.36509:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36510:
	nop
	nop
	nop
	j	bnei_cont.36502

bnei_else.36505:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36506:
	nop
	nop
	nop
	j	bnei_cont.36502

bnei_else.36501:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36502:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36511

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.36512

bnei_else.36511:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36512:
bnei_cont.36498:
bnei_cont.36484:
bnei_cont.36454:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36452

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36515

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36516

fbgt_else.36515:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36516:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36452

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36452

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.36452

bnei_else.36531:
bnei_cont.36532:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36529:
bnei_cont.36530:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36527:
bnei_cont.36528:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36525:
bnei_cont.36526:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36523:
bnei_cont.36524:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36521:
bnei_cont.36522:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36519:
bnei_cont.36520:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36517:
bnei_cont.36518:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36513:
bnei_cont.36514:
	nop
	nop
	nop
	j	bnei_cont.36452

bnei_else.36451:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36533

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36534

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.36534

bnei_else.36545:
bnei_cont.36546:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36543:
bnei_cont.36544:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36541:
bnei_cont.36542:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36539:
bnei_cont.36540:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36537:
bnei_cont.36538:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36535:
bnei_cont.36536:
	nop
	nop
	nop
	j	bnei_cont.36534

bnei_else.36533:
bnei_cont.36534:
bnei_cont.36452:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, 1
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%s6, 0(%at)
	nop
	nop
	nop

	lw	%ra, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%ra, -1, bnei_else.36547

	nop
	nop
	nop
	beqi	%ra, 99, bnei_else.36548

	lw	%a0, 12(%ra)
	lw	%k0, 0(%t9)
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%a0, 1(%t9)
	nop
	nop

	nop
	nop
	add	%at, %a0, %ra
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.36550

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36552

	flw	%f12, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.36554

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36555

fbeq_else.36554:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36555:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36556

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36551

bnei_else.36556:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36558

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36559

fbgt_else.36558:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36559:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36560

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36562

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36563

bnei_else.36562:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36563:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36551

bnei_else.36560:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36561:
bnei_cont.36557:
	nop
	nop
	nop
	j	bnei_cont.36551

bnei_else.36552:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36564

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36565

fbgt_else.36564:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36565:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36566

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36551

bnei_else.36566:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36567:
bnei_cont.36553:
	nop
	nop
	nop
	j	bnei_cont.36551

bnei_else.36550:
	flw	%f0, 0(%ra)
	flw	%f17, 1(%ra)
	nop
	nop

	flw	%f14, 1(%k0)
	flw	%f12, 1(%fp)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36568

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36569

fbgt_else.36568:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36569:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36570

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36572

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36573

fbgt_else.36572:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36573:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36574

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.36576

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36577

fbeq_else.36576:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36577:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36578

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36571

bnei_else.36578:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36579:
	nop
	nop
	nop
	j	bnei_cont.36571

bnei_else.36574:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36575:
	nop
	nop
	nop
	j	bnei_cont.36571

bnei_else.36570:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36571:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36580

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36581

bnei_else.36580:
	flw	%f0, 2(%ra)
	flw	%f19, 3(%ra)
	nop
	nop

	flw	%f18, 0(%k0)
	flw	%f17, 0(%fp)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36582

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36583

fbgt_else.36582:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36583:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36584

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36586

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36587

fbgt_else.36586:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36587:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36588

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.36590

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36591

fbeq_else.36590:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36591:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36592

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36585

bnei_else.36592:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36593:
	nop
	nop
	nop
	j	bnei_cont.36585

bnei_else.36588:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36589:
	nop
	nop
	nop
	j	bnei_cont.36585

bnei_else.36584:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36585:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36594

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.36595

bnei_else.36594:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f13, 5(%ra)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36596

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36597

fbgt_else.36596:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36597:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36598

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36600

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36601

fbgt_else.36600:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36601:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36602

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.36604

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36605

fbeq_else.36604:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36605:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36606

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36599

bnei_else.36606:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36607:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36602:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36603:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36598:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36599:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36608

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.36609

bnei_else.36608:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36609:
bnei_cont.36595:
bnei_cont.36581:
bnei_cont.36551:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36549

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36612

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36613

fbgt_else.36612:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36613:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36549

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36549

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.36549

bnei_else.36626:
bnei_cont.36627:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36624:
bnei_cont.36625:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36622:
bnei_cont.36623:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36620:
bnei_cont.36621:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36618:
bnei_cont.36619:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36616:
bnei_cont.36617:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36614:
bnei_cont.36615:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36610:
bnei_cont.36611:
	nop
	nop
	nop
	j	bnei_cont.36549

bnei_else.36548:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36628

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36629

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36629

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36629

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36629

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36629

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.36629

bnei_else.36638:
bnei_cont.36639:
	nop
	nop
	nop
	j	bnei_cont.36629

bnei_else.36636:
bnei_cont.36637:
	nop
	nop
	nop
	j	bnei_cont.36629

bnei_else.36634:
bnei_cont.36635:
	nop
	nop
	nop
	j	bnei_cont.36629

bnei_else.36632:
bnei_cont.36633:
	nop
	nop
	nop
	j	bnei_cont.36629

bnei_else.36630:
bnei_cont.36631:
	nop
	nop
	nop
	j	bnei_cont.36629

bnei_else.36628:
bnei_cont.36629:
bnei_cont.36549:
	lw	%a0, 3(%sp)
	lw	%ra, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %a0, 1
	addi	%a0, %t9, 0

	nop
	nop
	nop
	j	trace_or_matrix_fast.2944

bnei_else.36547:
	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36450:
	nop
	nop
	nop
	jr	%ra

utexture.2959:
	lw	%a0, 8(%v0)
	lw	%a3, 5(%v0)
	nop
	nop

	lw	%a1, 4(%v0)
	lw	%a2, 0(%v0)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 146(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.36771

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.36772

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.36773

	nop
	nop
	nop
	beqi	%a2, 4, bnei_else.36774

	nop
	nop
	nop
	jr	%ra

bnei_else.36774:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f0, 0(%a1)
	flw	%f11, 464(%zero)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fmul	%f14, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f13, %f1, %f0
	fmul	%f1, %f14, %f14

	nop
	nop
	fmul	%f0, %f13, %f13
	nop

	nop
	nop
	fadd	%f12, %f1, %f0
	fabs	%f0, %f14

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36776

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36777

fbgt_else.36776:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36777:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36778

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.36779

bnei_else.36778:
	nop
	nop
	fdiv	%f0, %f13, %f14
	nop

	nop
	nop
	fabs	%f15, %f0
	nop

	nop
	nop
	nop
	fblt	%f15, %fzero, fbgt_else.36780

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.36781

fbgt_else.36780:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.36781:
	flw	%f0, 462(%zero)
	nop
	fabs	%f14, %f15
	nop

	nop
	nop
	nop
	fblt	%f14, %f0, fbgt_else.36782

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f14, %f0, fbgt_else.36784

	flw	%f13, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f16, %f30, %f14
	nop

	nop
	nop
	fmul	%f17, %f16, %f16
	fmul	%f0, %f0, %f16

	nop
	nop
	fmul	%f15, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 460(%zero)
	nop
	fmul	%f14, %f15, %f15
	fsub	%f1, %f16, %f0

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f13, %f0
	j	fbgt_cont.36785

fbgt_else.36784:
	flw	%f13, 479(%zero)
	nop
	fsub	%f1, %f14, %f30
	fadd	%f0, %f14, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f16
	fmul	%f0, %f0, %f16

	nop
	nop
	fmul	%f15, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 460(%zero)
	nop
	fmul	%f14, %f15, %f15
	fsub	%f1, %f16, %f0

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f13, %f0
	nop

fbgt_cont.36785:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36786

	nop
	nop
	nop
	j	fbgt_cont.36783

bnei_else.36786:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36787:
	nop
	nop
	nop
	j	fbgt_cont.36783

fbgt_else.36782:
	flw	%f0, 461(%zero)
	nop
	fmul	%f16, %f15, %f15
	nop

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f0, %f0, %f16

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.36783:
	flw	%f1, 454(%zero)
	nop
	nop
	nop

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.36779:
	nop
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f13, %f1, %f0
	nop

	flw	%f0, 1(%a1)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	fabs	%f0, %f12

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36788

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36789

fbgt_else.36788:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36789:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36790

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.36791

bnei_else.36790:
	nop
	nop
	fdiv	%f0, %f1, %f12
	nop

	nop
	nop
	fabs	%f14, %f0
	nop

	nop
	nop
	nop
	fblt	%f14, %fzero, fbgt_else.36792

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.36793

fbgt_else.36792:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.36793:
	flw	%f0, 462(%zero)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.36794

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.36796

	flw	%f11, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f15, %f30, %f12
	nop

	nop
	nop
	fmul	%f16, %f15, %f15
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 460(%zero)
	nop
	fmul	%f12, %f14, %f14
	fsub	%f1, %f15, %f0

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.36797

fbgt_else.36796:
	flw	%f11, 479(%zero)
	nop
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f15, %f1, %f0
	nop

	nop
	nop
	fmul	%f16, %f15, %f15
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 460(%zero)
	nop
	fmul	%f12, %f14, %f14
	fsub	%f1, %f15, %f0

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

fbgt_cont.36797:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36798

	nop
	nop
	nop
	j	fbgt_cont.36795

bnei_else.36798:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36799:
	nop
	nop
	nop
	j	fbgt_cont.36795

fbgt_else.36794:
	flw	%f0, 461(%zero)
	nop
	fmul	%f15, %f14, %f14
	nop

	nop
	nop
	fmul	%f12, %f15, %f15
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f15

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f14, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.36795:
	flw	%f1, 454(%zero)
	nop
	nop
	nop

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.36791:
	flw	%f11, 474(%zero)
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 452(%zero)
	nop
	fsub	%f12, %f1, %f0
	fsub	%f0, %f11, %f13

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	fsub	%f0, %f11, %f12

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.36800

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36801

fbgt_else.36800:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36801:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36802

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.36803

bnei_else.36802:
bnei_cont.36803:
	flw	%f1, 451(%zero)
	nop
	nop
	nop

	flw	%f0, 450(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.36773:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f11, %f1, %f0
	nop

	flw	%f12, 482(%zero)
	nop
	fsub	%f0, %f1, %f0
	fmul	%f1, %f11, %f11

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f0, 449(%zero)
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	floor	%f0, %f1
	nop

	flw	%f0, 453(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	flw	%f1, 481(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36805

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36806

fbgt_else.36805:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36806:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36807

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.36808

fbgt_else.36807:
fbgt_cont.36808:
	flw	%f11, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36809

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36811

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36810

bnei_else.36811:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36812:
	nop
	nop
	nop
	j	fbgt_cont.36810

fbgt_else.36809:
fbgt_cont.36810:
	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36813

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.36814

fbgt_else.36813:
fbgt_cont.36814:
	flw	%f1, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36815

	flw	%f0, 474(%zero)
	nop
	fmul	%f12, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.36816

fbgt_else.36815:
	flw	%f0, 478(%zero)
	nop
	fsub	%f13, %f11, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f0, %f0, %f13

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f13, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.36816:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36817

	nop
	nop
	nop
	j	bnei_cont.36818

bnei_else.36817:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36818:
	flw	%f1, 451(%zero)
	nop
	fmul	%f11, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f1
	nop

	fsw	%f0, 146(%zero)
	nop
	fsub	%f0, %f30, %f11
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.36772:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	nop
	nop

	flw	%f12, 482(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.36820

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.36821

fbgt_else.36820:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.36821:
	flw	%f1, 481(%zero)
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36822

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36824

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36823

bnei_else.36824:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36825:
	nop
	nop
	nop
	j	fbgt_cont.36823

fbgt_else.36822:
fbgt_cont.36823:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.36826

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.36827

fbgt_else.36826:
fbgt_cont.36827:
	flw	%f11, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36828

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.36829

fbgt_else.36828:
fbgt_cont.36829:
	flw	%f1, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36830

	flw	%f1, 478(%zero)
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 477(%zero)
	nop
	fsub	%f11, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.36831

fbgt_else.36830:
	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f12, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.36831:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36832

	nop
	nop
	nop
	j	bnei_cont.36833

bnei_else.36832:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36833:
	flw	%f1, 451(%zero)
	nop
	fmul	%f11, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f11
	nop

	fsw	%f0, 145(%zero)
	nop
	fsub	%f0, %f30, %f11
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

bnei_else.36771:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f13, 447(%zero)
	flw	%f12, 446(%zero)
	fsub	%f1, %f1, %f0
	nop

	flw	%f11, 449(%zero)
	nop
	fmul	%f0, %f1, %f13
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36835

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36836

fbgt_else.36835:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36836:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f13
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.36837

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.36838

fbgt_else.36837:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.36838:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36839

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36841

	flw	%f0, 451(%zero)
	nop
	nop
	j	bnei_cont.36840

bnei_else.36841:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.36842:
	nop
	nop
	nop
	j	bnei_cont.36840

bnei_else.36839:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36843

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.36844

bnei_else.36843:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.36844:
bnei_cont.36840:
	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

trace_reflections.2966:
	sw	%v0, 0(%sp)
	nop
	fmov	%f22, %f0
	fmov	%f23, %f1

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t1, 2(%sp)
	nop
	nop
	nop

	sw	%t0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.36940

	lw	%a0, 254(%v0)
	flw	%f0, 445(%zero)
	nop
	nop

	flw	%f24, 2(%a0)
	lw	%t0, 1(%a0)
	nop
	nop

	lw	%a0, 0(%a0)
	fsw	%f0, 137(%zero)
	nop
	nop

	sw	%a0, 5(%sp)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.36941

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36942

fbgt_else.36941:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36942:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36943

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36945

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36944

fbgt_else.36945:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36946:
	nop
	nop
	nop
	j	bnei_cont.36944

bnei_else.36943:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36944:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36947

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%a0, 136(%zero)
	nop
	sll	%a1, %a0, 2
	nop

	lw	%a0, 5(%sp)
	nop
	add	%a1, %a1, %a0
	nop

	nop
	nop
	nop
	bne	%a1, %a0, bnei_cont.36948

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36951

	nop
	nop
	nop
	j	bnei_cont.36948

bnei_else.36951:
	lw	%a0, 0(%t0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f14, 0(%a0)
	flw	%f13, 1(%a0)
	nop
	nop

	flw	%f0, 143(%zero)
	flw	%f11, 2(%a0)
	fmul	%f1, %f0, %f14
	nop

	lw	%a0, 1(%sp)
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 144(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f22

	flw	%f0, 0(%a0)
	nop
	fmul	%f12, %f0, %f1
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f11, %f24, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.36953

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36954

fbgt_else.36953:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36954:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36955

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.36956

bnei_else.36955:
bnei_cont.36956:
	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.36957

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36958

fbgt_else.36957:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36958:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36948

	nop
	nop
	fmul	%f0, %f11, %f11
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f0, %f23
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.36948

bnei_else.36959:
bnei_cont.36960:
bnei_cont.36952:
	nop
	nop
	nop
	j	bnei_cont.36948

beq_else.36949:
beq_cont.36950:
	nop
	nop
	nop
	j	bnei_cont.36948

bnei_else.36947:
bnei_cont.36948:
	lw	%a0, 0(%sp)
	lw	%t1, 2(%sp)
	fmov	%f1, %f23
	fmov	%f0, %f22

	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	addi	%v0, %a0, -1
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	j	trace_reflections.2966

bgti_else.36940:
	nop
	nop
	nop
	jr	%ra

trace_ray.2971:
	fsw	%f1, 0(%sp)
	nop
	fmov	%f25, %f0
	add	%a1, %zero, %v1

	sw	%v0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	sw	%a1, 2(%sp)
	nop
	nop
	nop

	sw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37209

	lw	%a2, 7(%a0)
	flw	%f0, 445(%zero)
	nop
	nop

	sw	%a2, 5(%sp)
	lw	%a2, 4(%a0)
	nop
	nop

	sw	%a2, 6(%sp)
	lw	%a2, 3(%a0)
	nop
	nop

	sw	%a2, 7(%sp)
	lw	%a2, 2(%a0)
	nop
	nop

	sw	%a2, 8(%sp)
	lw	%a0, 1(%a0)
	nop
	nop

	sw	%a0, 9(%sp)
	fsw	%f0, 137(%zero)
	addi	%a0, %a1, 0
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	jal	trace_or_matrix.2930

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -11
	nop

	fsw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37210

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37211

fbgt_else.37210:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37211:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37212

	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37214

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37213

fbgt_else.37214:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37215:
	nop
	nop
	nop
	j	bnei_cont.37213

bnei_else.37212:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37213:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37216

	lw	%k0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%k0)
	nop
	nop
	nop

	lw	%a2, 9(%v0)
	lw	%fp, 7(%v0)
	nop
	nop

	lw	%ra, 6(%v0)
	lw	%a1, 5(%v0)
	nop
	nop

	lw	%s0, 4(%v0)
	lw	%a3, 3(%v0)
	nop
	nop

	lw	%a0, 2(%v0)
	flw	%f26, 0(%fp)
	nop
	nop

	sw	%a0, 12(%sp)
	lw	%a0, 1(%v0)
	fmul	%f22, %f26, %f25
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.37217

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37219

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f13, %f1, %f0
	nop

	flw	%f0, 0(%s0)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%s0)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%s0)
	nop
	fmul	%f17, %f13, %f0
	nop

	nop
	nop
	fmul	%f15, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37221

	flw	%f11, 2(%a2)
	flw	%f12, 1(%a2)
	nop
	nop

	flw	%f18, 474(%zero)
	nop
	fmul	%f1, %f13, %f11
	fmul	%f0, %f16, %f12

	flw	%f11, 0(%a2)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f12

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f13, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f15, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.37222

bnei_else.37221:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f17, 143(%zero)
	nop
	nop
	nop

	fsw	%f15, 144(%zero)
	nop
	nop
	nop

bnei_cont.37222:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.37223

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37224

fbeq_else.37223:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37224:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37225

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.37226

bnei_else.37225:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.37227

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.37228

bnei_else.37227:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.37228:
bnei_cont.37226:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.37218

bnei_else.37219:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%s0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%s0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.37220:
	nop
	nop
	nop
	j	bnei_cont.37218

bnei_else.37217:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	lw	%a0, 2(%sp)
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.37229

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37230

fbeq_else.37229:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37230:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37231

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.37232

bnei_else.37231:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.37233

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37234

fbgt_else.37233:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37234:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37235

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.37236

bnei_else.37235:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.37236:
bnei_cont.37232:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.37218:
	flw	%f23, 138(%zero)
	nop
	addi	%sp, %sp, 13
	nop

	fsw	%f23, 159(%zero)
	nop
	nop
	nop

	flw	%f24, 139(%zero)
	nop
	nop
	nop

	fsw	%f24, 160(%zero)
	nop
	nop
	nop

	flw	%f27, 140(%zero)
	nop
	nop
	nop

	fsw	%f27, 161(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 138
	jal	utexture.2959

	lw	%a0, 136(%zero)
	flw	%f0, 474(%zero)
	addi	%sp, %sp, -13
	sll	%a1, %k0, 2

	lw	%a0, 8(%sp)
	lw	%a1, 1(%sp)
	add	%a2, %a1, %a0
	nop

	lw	%a0, 9(%sp)
	nop
	add	%at, %a0, %a1
	nop

	sw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f23, 0(%a0)
	nop
	nop
	nop

	fsw	%f24, 1(%a0)
	nop
	nop
	nop

	fsw	%f27, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f26, %f0, fbgt_else.37237

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37238

fbgt_else.37237:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37238:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37239

	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	sw	%zero, 0(%at)
	nop
	nop
	j	bnei_cont.37240

bnei_else.37239:
	lw	%a0, 7(%sp)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a0, 6(%sp)
	flw	%f0, 145(%zero)
	add	%at, %a0, %a1
	nop

	sw	%k1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 146(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 147(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 443(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f1, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 142(%zero)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 143(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 144(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.37240:
	flw	%f14, 442(%zero)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	flw	%f13, 0(%a0)
	flw	%f3, 142(%zero)
	nop
	nop

	flw	%f12, 1(%a0)
	flw	%f29, 143(%zero)
	fmul	%f1, %f13, %f3
	nop

	flw	%f11, 2(%a0)
	flw	%f28, 144(%zero)
	fmul	%f0, %f12, %f29
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f28

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f14, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f3
	nop

	nop
	nop
	fadd	%f0, %f13, %f0
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f1, %f29
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f1, %f28
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f25, %f0
	nop

	fsw	%f0, 13(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.37241

	nop
	nop
	nop
	j	bnei_cont.37242

bnei_else.37241:
	flw	%f14, 78(%zero)
	flw	%f13, 79(%zero)
	nop
	nop

	flw	%f12, 80(%zero)
	lw	%a0, 2(%sp)
	fmul	%f1, %f3, %f14
	fmul	%f0, %f29, %f13

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f28, %f12

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f11, %f0, %f22
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f12, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.37243

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37244

fbgt_else.37243:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37244:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37245

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37246

bnei_else.37245:
bnei_cont.37246:
	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.37247

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37248

fbgt_else.37247:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37248:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37249

	nop
	nop
	fmul	%f0, %f12, %f12
	nop

	flw	%f0, 13(%sp)
	nop
	fmul	%f1, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37250

bnei_else.37249:
bnei_cont.37250:
bnei_cont.37242:
	fsw	%f23, 162(%zero)
	nop
	addi	%sp, %sp, 14
	nop

	fsw	%f24, 163(%zero)
	nop
	nop
	nop

	fsw	%f27, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%v0, %zero, 138
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	lw	%a0, 434(%zero)
	nop
	addi	%sp, %sp, -14
	fmov	%f0, %f22

	flw	%f1, 13(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_reflections.2966

	flw	%f0, 441(%zero)
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	fblt	%f0, %f25, fbgt_else.37251

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37252

fbgt_else.37251:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37252:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37253

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 4, bgti_else.37254

	nop
	nop
	nop
	j	bgti_cont.37255

bgti_else.37254:
	lw	%a0, 8(%sp)
	nop
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1

	nop
	nop
	add	%at, %a0, %a2
	nop

	sw	%a1, 0(%at)
	nop
	nop
	nop

bgti_cont.37255:
	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37256

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37256:
	lw	%a0, 1(%sp)
	flw	%f11, 0(%sp)
	fsub	%f0, %f30, %f26
	nop

	flw	%f1, 11(%sp)
	lw	%ra, 4(%sp)
	fmul	%f0, %f25, %f0
	addi	%v0, %a0, 1

	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	fadd	%f1, %f11, %f1
	j	trace_ray.2971

bnei_else.37253:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37216:
	lw	%a1, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%a2, %zero, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	sw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37259

	lw	%a0, 2(%sp)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.37260

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37261

fbgt_else.37260:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37261:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37262

	lw	%ra, 4(%sp)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f0, 81(%zero)
	nop
	fmul	%f1, %f0, %f25
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	jr	%ra

bnei_else.37262:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37259:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.37209:
	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2980:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	nop
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%t2, 4(%sp)
	nop
	nop
	nop

	sw	%t1, 5(%sp)
	nop
	nop
	nop

	sw	%t0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.38268

	flw	%f22, 0(%v1)
	flw	%f23, 1(%v1)
	add	%at, %v0, %a1
	nop

	lw	%t1, 0(%at)
	flw	%f24, 2(%v1)
	nop
	nop

	lw	%k0, 1(%t1)
	lw	%t0, 0(%t1)
	nop
	nop

	flw	%f16, 0(%t0)
	flw	%f14, 1(%t0)
	nop
	nop

	flw	%f17, 2(%t0)
	nop
	fmul	%f1, %f16, %f22
	fmul	%f0, %f14, %f23

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f24

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38269

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38270

fbgt_else.38269:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38270:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38271

	lw	%a0, 3(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%a0, 0(%sp)
	flw	%f0, 445(%zero)
	addi	%a1, %a0, 1
	fdiv	%f25, %f1, %f0

	fsw	%f0, 137(%zero)
	nop
	add	%at, %a0, %a1
	nop

	lw	%t0, 0(%at)
	lw	%t1, 134(%zero)
	nop
	nop

	lw	%s6, 0(%t1)
	nop
	nop
	nop

	lw	%ra, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%ra, -1, bnei_else.38273

	nop
	nop
	nop
	beqi	%ra, 99, bnei_else.38275

	lw	%a0, 12(%ra)
	lw	%k0, 0(%t0)
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%a0, 1(%t0)
	nop
	nop

	nop
	nop
	add	%at, %a0, %ra
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.38277

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.38279

	flw	%f12, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.38281

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38282

fbeq_else.38281:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38282:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38283

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38278

bnei_else.38283:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38285

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38286

fbgt_else.38285:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38286:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38287

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38289

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38290

bnei_else.38289:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38290:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38278

bnei_else.38287:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38288:
bnei_cont.38284:
	nop
	nop
	nop
	j	bnei_cont.38278

bnei_else.38279:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38291

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38292

fbgt_else.38291:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38292:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38293

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38278

bnei_else.38293:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38294:
bnei_cont.38280:
	nop
	nop
	nop
	j	bnei_cont.38278

bnei_else.38277:
	flw	%f0, 0(%ra)
	flw	%f17, 1(%ra)
	nop
	nop

	flw	%f14, 1(%k0)
	flw	%f12, 1(%fp)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.38295

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38296

fbgt_else.38295:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38296:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38297

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38299

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38300

fbgt_else.38299:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38300:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38301

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.38303

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38304

fbeq_else.38303:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38304:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38305

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38298

bnei_else.38305:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38306:
	nop
	nop
	nop
	j	bnei_cont.38298

bnei_else.38301:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38302:
	nop
	nop
	nop
	j	bnei_cont.38298

bnei_else.38297:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38298:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38307

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38308

bnei_else.38307:
	flw	%f0, 2(%ra)
	flw	%f19, 3(%ra)
	nop
	nop

	flw	%f17, 0(%k0)
	flw	%f16, 0(%fp)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f18, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.38309

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38310

fbgt_else.38309:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38310:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38311

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38313

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38314

fbgt_else.38313:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38314:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38315

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.38317

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38318

fbeq_else.38317:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38318:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38319

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38312

bnei_else.38319:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38320:
	nop
	nop
	nop
	j	bnei_cont.38312

bnei_else.38315:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38316:
	nop
	nop
	nop
	j	bnei_cont.38312

bnei_else.38311:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38312:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38321

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.38322

bnei_else.38321:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f13, 5(%ra)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.38323

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38324

fbgt_else.38323:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38324:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38325

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.38327

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38328

fbgt_else.38327:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38328:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38329

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.38331

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38332

fbeq_else.38331:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38332:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38333

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38326

bnei_else.38333:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38334:
	nop
	nop
	nop
	j	bnei_cont.38326

bnei_else.38329:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38330:
	nop
	nop
	nop
	j	bnei_cont.38326

bnei_else.38325:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38326:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38335

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.38336

bnei_else.38335:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38336:
bnei_cont.38322:
bnei_cont.38308:
bnei_cont.38278:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38276

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38339

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38340

fbgt_else.38339:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38340:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38276

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38276

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38276

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38276

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38276

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38276

bnei_else.38349:
bnei_cont.38350:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38347:
bnei_cont.38348:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38345:
bnei_cont.38346:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38343:
bnei_cont.38344:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38341:
bnei_cont.38342:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38337:
bnei_cont.38338:
	nop
	nop
	nop
	j	bnei_cont.38276

bnei_else.38275:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38351

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38352

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38352

bnei_else.38357:
bnei_cont.38358:
	nop
	nop
	nop
	j	bnei_cont.38352

bnei_else.38355:
bnei_cont.38356:
	nop
	nop
	nop
	j	bnei_cont.38352

bnei_else.38353:
bnei_cont.38354:
	nop
	nop
	nop
	j	bnei_cont.38352

bnei_else.38351:
bnei_cont.38352:
bnei_cont.38276:
	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38274

bnei_else.38273:
bnei_cont.38274:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38359

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38360

fbgt_else.38359:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38360:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38361

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38363

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38362

fbgt_else.38363:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38364:
	nop
	nop
	nop
	j	bnei_cont.38362

bnei_else.38361:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38362:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38272

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t0)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38367

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38369

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f13, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f12, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f13, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f16, %f12, %f0
	nop

	nop
	nop
	fmul	%f14, %f15, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38371

	flw	%f11, 2(%a1)
	flw	%f18, 1(%a1)
	nop
	nop

	flw	%f17, 474(%zero)
	nop
	fmul	%f1, %f12, %f11
	fmul	%f0, %f15, %f18

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f11

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f18

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f14, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38372

bnei_else.38371:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f16, 143(%zero)
	nop
	nop
	nop

	fsw	%f14, 144(%zero)
	nop
	nop
	nop

bnei_cont.38372:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38373

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38374

fbeq_else.38373:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38374:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38375

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38376

bnei_else.38375:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38377

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38378

bnei_else.38377:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38378:
bnei_cont.38376:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38368

bnei_else.38369:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38370:
	nop
	nop
	nop
	j	bnei_cont.38368

bnei_else.38367:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38379

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38380

fbeq_else.38379:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38380:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38381

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38382

bnei_else.38381:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38383

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38384

fbgt_else.38383:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38384:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38385

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38386

bnei_else.38385:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38386:
bnei_cont.38382:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38368:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38387

	nop
	nop
	nop
	j	bnei_cont.38272

bnei_else.38387:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38389

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38390

fbgt_else.38389:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38390:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38391

	nop
	nop
	nop
	j	bnei_cont.38392

bnei_else.38391:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38392:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38388:
	nop
	nop
	nop
	j	bnei_cont.38272

bnei_else.38365:
bnei_cont.38366:
	nop
	nop
	nop
	j	bnei_cont.38272

bnei_else.38271:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f25, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	nop
	nop

	lw	%s6, 0(%t2)
	nop
	nop
	nop

	lw	%fp, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.38393

	nop
	nop
	nop
	beqi	%fp, 99, bnei_else.38395

	lw	%a0, 12(%fp)
	nop
	add	%at, %k0, %fp
	nop

	lw	%a2, 10(%a0)
	lw	%a1, 6(%a0)
	nop
	nop

	lw	%a3, 4(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a2)
	flw	%f11, 1(%a2)
	nop
	nop

	flw	%f13, 2(%a2)
	lw	%fp, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38397

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38399

	flw	%f12, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.38401

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38402

fbeq_else.38401:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38402:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38403

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38398

bnei_else.38403:
	flw	%f0, 1(%fp)
	nop
	nop
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38405

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38406

fbgt_else.38405:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38406:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38407

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38409

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38410

bnei_else.38409:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38410:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38398

bnei_else.38407:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38408:
bnei_cont.38404:
	nop
	nop
	nop
	j	bnei_cont.38398

bnei_else.38399:
	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38411

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38412

fbgt_else.38411:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38412:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38413

	flw	%f0, 3(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38398

bnei_else.38413:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38414:
bnei_cont.38400:
	nop
	nop
	nop
	j	bnei_cont.38398

bnei_else.38397:
	flw	%f0, 0(%fp)
	flw	%f19, 1(%fp)
	nop
	nop

	flw	%f12, 1(%a3)
	nop
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f18, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f18, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.38415

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38416

fbgt_else.38415:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38416:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38417

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38419

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38420

fbgt_else.38419:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38420:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38421

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.38423

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38424

fbeq_else.38423:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38424:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38425

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38418

bnei_else.38425:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38426:
	nop
	nop
	nop
	j	bnei_cont.38418

bnei_else.38421:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38422:
	nop
	nop
	nop
	j	bnei_cont.38418

bnei_else.38417:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38418:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38427

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38428

bnei_else.38427:
	flw	%f0, 2(%fp)
	flw	%f2, 3(%fp)
	nop
	nop

	flw	%f18, 0(%a3)
	nop
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f19, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38429

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38430

fbgt_else.38429:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38430:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38431

	nop
	nop
	fmul	%f0, %f19, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38433

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38434

fbgt_else.38433:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38434:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38435

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.38437

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38438

fbeq_else.38437:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38438:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38439

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38432

bnei_else.38439:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38440:
	nop
	nop
	nop
	j	bnei_cont.38432

bnei_else.38435:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38436:
	nop
	nop
	nop
	j	bnei_cont.38432

bnei_else.38431:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38432:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38441

	fsw	%f19, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.38442

bnei_else.38441:
	flw	%f0, 4(%fp)
	nop
	nop
	nop

	flw	%f13, 5(%fp)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38443

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38444

fbgt_else.38443:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38444:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38445

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.38447

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38448

fbgt_else.38447:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38448:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38449

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.38451

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38452

fbeq_else.38451:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38452:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38453

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38446

bnei_else.38453:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38454:
	nop
	nop
	nop
	j	bnei_cont.38446

bnei_else.38449:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38450:
	nop
	nop
	nop
	j	bnei_cont.38446

bnei_else.38445:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38446:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38455

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.38456

bnei_else.38455:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38456:
bnei_cont.38442:
bnei_cont.38428:
bnei_cont.38398:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38396

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38459

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38460

fbgt_else.38459:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38460:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38396

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38396

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38396

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38396

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38396

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38396

bnei_else.38469:
bnei_cont.38470:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38467:
bnei_cont.38468:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38465:
bnei_cont.38466:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38463:
bnei_cont.38464:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38461:
bnei_cont.38462:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38457:
bnei_cont.38458:
	nop
	nop
	nop
	j	bnei_cont.38396

bnei_else.38395:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38471

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38472

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38472

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38472

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38472

bnei_else.38477:
bnei_cont.38478:
	nop
	nop
	nop
	j	bnei_cont.38472

bnei_else.38475:
bnei_cont.38476:
	nop
	nop
	nop
	j	bnei_cont.38472

bnei_else.38473:
bnei_cont.38474:
	nop
	nop
	nop
	j	bnei_cont.38472

bnei_else.38471:
bnei_cont.38472:
bnei_cont.38396:
	nop
	nop
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.38394

bnei_else.38393:
bnei_cont.38394:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38479

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38480

fbgt_else.38479:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38480:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38481

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38483

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38482

fbgt_else.38483:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38484:
	nop
	nop
	nop
	j	bnei_cont.38482

bnei_else.38481:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38482:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38485

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38487

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38489

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f13, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f12, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f13, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f16, %f12, %f0
	nop

	nop
	nop
	fmul	%f14, %f15, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38491

	flw	%f11, 2(%a1)
	flw	%f18, 1(%a1)
	nop
	nop

	flw	%f17, 474(%zero)
	nop
	fmul	%f1, %f12, %f11
	fmul	%f0, %f15, %f18

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f11

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f18

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f14, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38492

bnei_else.38491:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f16, 143(%zero)
	nop
	nop
	nop

	fsw	%f14, 144(%zero)
	nop
	nop
	nop

bnei_cont.38492:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38493

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38494

fbeq_else.38493:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38494:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38495

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38496

bnei_else.38495:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38497

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38498

bnei_else.38497:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38498:
bnei_cont.38496:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38488

bnei_else.38489:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38490:
	nop
	nop
	nop
	j	bnei_cont.38488

bnei_else.38487:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %t0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38499

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38500

fbeq_else.38499:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38500:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38501

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38502

bnei_else.38501:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38503

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38504

fbgt_else.38503:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38504:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38505

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38506

bnei_else.38505:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38506:
bnei_cont.38502:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38488:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38507

	nop
	nop
	nop
	j	bnei_cont.38486

bnei_else.38507:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38509

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38510

fbgt_else.38509:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38510:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38511

	nop
	nop
	nop
	j	bnei_cont.38512

bnei_else.38511:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38512:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38508:
	nop
	nop
	nop
	j	bnei_cont.38486

bnei_else.38485:
bnei_cont.38486:
bnei_cont.38272:
	lw	%a0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %a0, -2
	nop

	nop
	nop
	nop
	blti	%t0, 0, bgti_else.38513

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%t1, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 1(%t1)
	nop
	fmul	%f1, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 2(%t1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38514

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.38515

fbgt_else.38514:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.38515:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38516

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%a1, %t0, 1
	addi	%sp, %sp, 8

	flw	%f0, 445(%zero)
	nop
	add	%at, %a0, %a1
	fdiv	%f22, %f1, %f0

	lw	%t1, 0(%at)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %t2, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38518

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38519

fbgt_else.38518:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38519:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38520

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38522

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38521

fbgt_else.38522:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38523:
	nop
	nop
	nop
	j	bnei_cont.38521

bnei_else.38520:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38521:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38517

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t1)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38526

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38528

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38530

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38531

bnei_else.38530:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38531:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38532

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38533

fbeq_else.38532:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38533:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38534

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38535

bnei_else.38534:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38536

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38537

bnei_else.38536:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38537:
bnei_cont.38535:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38527

bnei_else.38528:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38529:
	nop
	nop
	nop
	j	bnei_cont.38527

bnei_else.38526:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38538

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38539

fbeq_else.38538:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38539:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38540

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38541

bnei_else.38540:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38542

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38543

fbgt_else.38542:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38543:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38544

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38545

bnei_else.38544:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38545:
bnei_cont.38541:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38527:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38546

	nop
	nop
	nop
	j	bnei_cont.38517

bnei_else.38546:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38548

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38549

fbgt_else.38548:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38549:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38550

	nop
	nop
	nop
	j	bnei_cont.38551

bnei_else.38550:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38551:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38547:
	nop
	nop
	nop
	j	bnei_cont.38517

bnei_else.38524:
bnei_cont.38525:
	nop
	nop
	nop
	j	bnei_cont.38517

bnei_else.38516:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 8
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t2, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38552

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38553

fbgt_else.38552:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38553:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38554

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38556

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38555

fbgt_else.38556:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38557:
	nop
	nop
	nop
	j	bnei_cont.38555

bnei_else.38554:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38555:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38558

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38560

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38562

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38564

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38565

bnei_else.38564:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38565:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38566

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38567

fbeq_else.38566:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38567:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38568

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38569

bnei_else.38568:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38570

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38571

bnei_else.38570:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38571:
bnei_cont.38569:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38561

bnei_else.38562:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38563:
	nop
	nop
	nop
	j	bnei_cont.38561

bnei_else.38560:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %t1, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38572

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38573

fbeq_else.38572:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38573:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38574

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38575

bnei_else.38574:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38576

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38577

fbgt_else.38576:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38577:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38578

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38579

bnei_else.38578:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38579:
bnei_cont.38575:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38561:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38580

	nop
	nop
	nop
	j	bnei_cont.38559

bnei_else.38580:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38582

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38583

fbgt_else.38582:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38583:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38584

	nop
	nop
	nop
	j	bnei_cont.38585

bnei_else.38584:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38585:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38581:
	nop
	nop
	nop
	j	bnei_cont.38559

bnei_else.38558:
bnei_cont.38559:
bnei_cont.38517:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	addi	%a1, %t0, -2
	nop

	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	iter_trace_diffuse_rays.2980

bgti_else.38513:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	nop
	nop

	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38268:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2985:
	sw	%v0, 0(%sp)
	nop
	add	%v0, %zero, %a0
	nop

	sw	%v1, 1(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	sw	%v0, 2(%sp)
	fsw	%f0, 162(%zero)
	nop
	nop

	sw	%t2, 3(%sp)
	flw	%f0, 1(%v0)
	nop
	nop

	sw	%t1, 4(%sp)
	fsw	%f0, 163(%zero)
	nop
	nop

	sw	%t0, 5(%sp)
	flw	%f0, 2(%v0)
	nop
	nop

	sw	%ra, 6(%sp)
	fsw	%f0, 164(%zero)
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%a0, 0(%sp)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a0, 118(%a0)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%t0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%t0)
	nop
	nop
	nop

	flw	%f1, 1(%t0)
	flw	%f0, 1(%a1)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%t0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38834

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.38835

fbgt_else.38834:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.38835:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38836

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 7
	nop

	lw	%t0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	addi	%a0, %t0, 0
	nop

	lw	%t1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t1, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38838

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38839

fbgt_else.38838:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38839:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38840

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38842

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38841

fbgt_else.38842:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38843:
	nop
	nop
	nop
	j	bnei_cont.38841

bnei_else.38840:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38841:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38837

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t0)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38846

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38848

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38850

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38851

bnei_else.38850:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38851:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38852

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38853

fbeq_else.38852:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38853:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38854

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38855

bnei_else.38854:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38856

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38857

bnei_else.38856:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38857:
bnei_cont.38855:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38847

bnei_else.38848:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38849:
	nop
	nop
	nop
	j	bnei_cont.38847

bnei_else.38846:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38858

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38859

fbeq_else.38858:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38859:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38860

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38861

bnei_else.38860:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38862

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38863

fbgt_else.38862:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38863:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38864

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38865

bnei_else.38864:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38865:
bnei_cont.38861:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38847:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38866

	nop
	nop
	nop
	j	bnei_cont.38837

bnei_else.38866:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38868

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38869

fbgt_else.38868:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38869:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38870

	nop
	nop
	nop
	j	bnei_cont.38871

bnei_else.38870:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38871:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38867:
	nop
	nop
	nop
	j	bnei_cont.38837

bnei_else.38844:
bnei_cont.38845:
	nop
	nop
	nop
	j	bnei_cont.38837

bnei_else.38836:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 7
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t1, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38872

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38873

fbgt_else.38872:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38873:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38874

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38876

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38875

fbgt_else.38876:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38877:
	nop
	nop
	nop
	j	bnei_cont.38875

bnei_else.38874:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38875:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38878

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.38880

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38882

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38884

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38885

bnei_else.38884:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38885:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38886

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38887

fbeq_else.38886:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38887:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38888

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38889

bnei_else.38888:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38890

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38891

bnei_else.38890:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38891:
bnei_cont.38889:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38881

bnei_else.38882:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.38883:
	nop
	nop
	nop
	j	bnei_cont.38881

bnei_else.38880:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %t0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38892

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38893

fbeq_else.38892:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38893:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38894

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38895

bnei_else.38894:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38896

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38897

fbgt_else.38896:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38897:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38898

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38899

bnei_else.38898:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38899:
bnei_cont.38895:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38881:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38900

	nop
	nop
	nop
	j	bnei_cont.38879

bnei_else.38900:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38902

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38903

fbgt_else.38902:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38903:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38904

	nop
	nop
	nop
	j	bnei_cont.38905

bnei_else.38904:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38905:
	flw	%f0, 0(%t2)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38901:
	nop
	nop
	nop
	j	bnei_cont.38879

bnei_else.38878:
bnei_cont.38879:
bnei_cont.38837:
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	iter_trace_diffuse_rays.2980

do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	nop
	add	%a0, %zero, %t0
	addi	%at, %zero, 4

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t3, 2(%sp)
	nop
	nop
	nop

	sw	%t2, 3(%sp)
	nop
	nop
	nop

	sw	%t1, 4(%sp)
	nop
	nop
	nop

	sw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.39061

	lw	%a2, 7(%v0)
	lw	%fp, 6(%v0)
	nop
	nop

	sw	%a2, 7(%sp)
	lw	%t0, 5(%v0)
	nop
	nop

	sw	%fp, 8(%sp)
	lw	%a1, 4(%v0)
	nop
	nop

	sw	%a1, 9(%sp)
	lw	%k0, 3(%v0)
	nop
	nop

	sw	%k0, 10(%sp)
	lw	%a1, 2(%v0)
	nop
	nop

	sw	%a1, 11(%sp)
	lw	%a3, 1(%v0)
	add	%at, %a1, %v1
	nop

	sw	%a3, 12(%sp)
	lw	%a1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.39062

	nop
	nop
	add	%at, %k0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39063

	lw	%t2, 0(%fp)
	nop
	add	%at, %t0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	add	%at, %a2, %v1
	nop

	flw	%f0, 0(%a0)
	lw	%t1, 0(%at)
	add	%at, %a3, %v1
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%t3, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.39065

	lw	%s0, 179(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39066

bnei_else.39065:
bnei_cont.39066:
	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.39067

	lw	%s0, 180(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39068

bnei_else.39067:
bnei_cont.39068:
	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.39069

	lw	%s0, 181(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39070

bnei_else.39069:
bnei_cont.39070:
	nop
	nop
	nop
	beqi	%t2, 3, bnei_else.39071

	lw	%s0, 182(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39072

bnei_else.39071:
bnei_cont.39072:
	nop
	nop
	nop
	beqi	%t2, 4, bnei_else.39073

	lw	%s0, 183(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39074

bnei_else.39073:
bnei_cont.39074:
	lw	%a1, 9(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	flw	%f11, 151(%zero)
	flw	%f0, 148(%zero)
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39064

bnei_else.39063:
bnei_cont.39064:
	lw	%a0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%t2, %a0, 1
	nop

	nop
	nop
	nop
	blt	%at, %t2, bgt_else.39075

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.39076

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39077

	nop
	nop
	add	%at, %t0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a0, 8(%sp)
	nop
	nop

	lw	%t3, 0(%a0)
	lw	%a0, 7(%sp)
	nop
	nop

	lw	%a0, 12(%sp)
	nop
	add	%at, %a0, %t2
	nop

	lw	%t1, 0(%at)
	nop
	add	%at, %a0, %t2
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.39079

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39080

bnei_else.39079:
bnei_cont.39080:
	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.39081

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39082

bnei_else.39081:
bnei_cont.39082:
	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.39083

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39084

bnei_else.39083:
bnei_cont.39084:
	nop
	nop
	nop
	beqi	%t3, 3, bnei_else.39085

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39086

bnei_else.39085:
bnei_cont.39086:
	nop
	nop
	nop
	beqi	%t3, 4, bnei_else.39087

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.39088

bnei_else.39087:
bnei_cont.39088:
	lw	%a0, 9(%sp)
	flw	%f11, 151(%zero)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39078

bnei_else.39077:
bnei_cont.39078:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	addi	%v1, %t2, 1
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	nop
	j	do_without_neighbors.3002

bgti_else.39076:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	nop
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39075:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	nop
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39062:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.39061:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	nop
	add	%at, %a1, %v0
	nop

	sw	%ra, 1(%sp)
	lw	%s2, 0(%at)
	addi	%at, %zero, 4
	nop

	sw	%s2, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.39298

	lw	%s5, 7(%s2)
	lw	%s6, 6(%s2)
	nop
	nop

	lw	%s1, 5(%s2)
	lw	%fp, 4(%s2)
	nop
	nop

	sw	%fp, 3(%sp)
	lw	%k0, 3(%s2)
	nop
	nop

	lw	%s0, 2(%s2)
	lw	%s4, 1(%s2)
	nop
	nop

	nop
	nop
	add	%at, %s0, %a3
	nop

	lw	%s7, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.39299

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	nop
	nop

	nop
	nop
	add	%at, %s3, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39300

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39302

	nop
	nop
	addi	%fp, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %fp
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39304

	nop
	nop
	addi	%fp, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %fp
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s7, beq_else.39306

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.39301

beq_else.39306:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39307:
	nop
	nop
	nop
	j	beq_cont.39301

beq_else.39304:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39305:
	nop
	nop
	nop
	j	beq_cont.39301

beq_else.39302:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39303:
	nop
	nop
	nop
	j	beq_cont.39301

beq_else.39300:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39301:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39308

	lw	%s4, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %s4
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39309

	nop
	nop
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s5, 5(%a3)
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	add	%at, %a2, %v0
	nop

	lw	%ra, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s2, %s4
	nop

	lw	%fp, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s5, %s4
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s1, %s4
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %ra, %s4
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %fp, %s4
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 3(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %s4

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f11, 151(%zero)
	flw	%f1, 0(%a3)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39310

bnei_else.39309:
bnei_cont.39310:
	lw	%a3, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%fp, %a3, 1
	nop

	nop
	nop
	nop
	blt	%at, %fp, bgt_else.39311

	nop
	nop
	add	%at, %s0, %fp
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%ra, 0, bgti_else.39312

	nop
	nop
	add	%at, %s3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39313

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39315

	nop
	nop
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39317

	nop
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39319

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.39314

beq_else.39319:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39320:
	nop
	nop
	nop
	j	beq_cont.39314

beq_else.39317:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39318:
	nop
	nop
	nop
	j	beq_cont.39314

beq_else.39315:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39316:
	nop
	nop
	nop
	j	beq_cont.39314

beq_else.39313:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.39314:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39321

	nop
	nop
	add	%at, %k0, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39322

	nop
	nop
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s0, 5(%a3)
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	add	%at, %a2, %v0
	nop

	lw	%ra, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s2, %fp
	nop

	lw	%k0, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s0, %fp
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s1, %fp
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %ra, %fp
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %k0, %fp
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 3(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %fp

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f11, 151(%zero)
	flw	%f1, 0(%a3)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39323

bnei_else.39322:
bnei_cont.39323:
	lw	%ra, 1(%sp)
	nop
	addi	%a3, %fp, 1
	j	try_exploit_neighbors.3018

bnei_else.39321:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002

bgti_else.39312:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39311:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.39308:
	lw	%a2, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.39326

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.39327

	nop
	nop
	add	%at, %k0, %a2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39328

	lw	%a1, 0(%s6)
	nop
	add	%at, %s1, %a2
	nop

	lw	%a0, 0(%at)
	sw	%a1, 4(%sp)
	add	%at, %s5, %a2
	nop

	flw	%f0, 0(%a0)
	lw	%v1, 0(%at)
	add	%at, %s4, %a2
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 150(%zero)
	sw	%v1, 5(%sp)
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	sw	%a0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39330

	lw	%v0, 179(%zero)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.39331

bnei_else.39330:
bnei_cont.39331:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.39332

	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.39333

bnei_else.39332:
bnei_cont.39333:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.39334

	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.39335

bnei_else.39334:
bnei_cont.39335:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.39336

	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.39337

bnei_else.39336:
bnei_cont.39337:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.39338

	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.39339

bnei_else.39338:
bnei_cont.39339:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	flw	%f11, 151(%zero)
	flw	%f0, 148(%zero)
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39329

bnei_else.39328:
bnei_cont.39329:
	lw	%a0, 0(%sp)
	lw	%ra, 1(%sp)
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	addi	%v1, %a0, 1
	j	do_without_neighbors.3002

bgti_else.39327:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39326:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39299:
	nop
	nop
	nop
	jr	%ra

bgt_else.39298:
	nop
	nop
	nop
	jr	%ra

pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	nop
	add	%a0, %zero, %t0
	addi	%at, %zero, 4

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t1, 2(%sp)
	nop
	nop
	nop

	sw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.39660

	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	nop
	nop

	sw	%a3, 5(%sp)
	lw	%a1, 5(%v0)
	nop
	nop

	sw	%a1, 6(%sp)
	lw	%fp, 3(%v0)
	nop
	nop

	sw	%fp, 7(%sp)
	lw	%a1, 2(%v0)
	nop
	nop

	sw	%a1, 8(%sp)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1
	nop

	sw	%a2, 9(%sp)
	lw	%a1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.39661

	nop
	nop
	add	%at, %fp, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39662

	lw	%a0, 0(%a3)
	fsw	%fzero, 148(%zero)
	add	%at, %t0, %v1
	addi	%sp, %sp, 10

	fsw	%fzero, 149(%zero)
	lw	%s1, 179(%a0)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%s0, 0(%at)
	add	%at, %a2, %v1
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -10
	nop

	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.39663

bnei_else.39662:
bnei_cont.39663:
	lw	%a0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%t1, %a0, 1
	nop

	nop
	nop
	nop
	blt	%at, %t1, bgt_else.39664

	lw	%a0, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.39665

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39666

	lw	%a0, 5(%sp)
	fsw	%fzero, 148(%zero)
	add	%at, %t0, %t1
	nop

	lw	%a0, 0(%a0)
	fsw	%fzero, 149(%zero)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%a0, 179(%a0)
	nop
	nop

	sw	%a0, 10(%sp)
	lw	%a0, 0(%at)
	nop
	nop

	sw	%a0, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 9(%sp)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%t0)
	nop
	addi	%v0, %t0, 0
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	lw	%a0, 118(%a0)
	nop
	nop
	nop

	lw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a2, 12(%sp)
	flw	%f1, 0(%a2)
	nop
	nop

	lw	%a1, 11(%sp)
	nop
	nop
	nop

	flw	%f0, 0(%a1)
	nop
	nop
	nop

	flw	%f1, 1(%a2)
	flw	%f0, 1(%a1)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%a2)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.39668

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.39669

fbgt_else.39668:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.39669:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39670

	lw	%a0, 10(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%a0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f22, %f1, %f0
	nop

	sw	%a0, 13(%sp)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -15
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39672

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39673

fbgt_else.39672:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39673:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39674

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39676

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.39675

fbgt_else.39676:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39677:
	nop
	nop
	nop
	j	bnei_cont.39675

bnei_else.39674:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.39675:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.39671

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	lw	%a0, 13(%sp)
	nop
	nop

	lw	%ra, 0(%a0)
	lw	%a1, 9(%v0)
	nop
	nop

	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	nop
	nop

	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	nop
	nop

	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.39680

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39682

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39684

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39685

bnei_else.39684:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39685:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.39686

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39687

fbeq_else.39686:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39687:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39688

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39689

bnei_else.39688:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39690

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39691

bnei_else.39690:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39691:
bnei_cont.39689:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39681

bnei_else.39682:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.39683:
	nop
	nop
	nop
	j	bnei_cont.39681

bnei_else.39680:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39692

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39693

fbeq_else.39692:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39693:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39694

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39695

bnei_else.39694:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39696

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39697

fbgt_else.39696:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39697:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39698

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39699

bnei_else.39698:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39699:
bnei_cont.39695:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39681:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v0, %zero, 0

	lw	%v1, 14(%sp)
	nop
	addi	%sp, %sp, 15
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -15
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39700

	nop
	nop
	nop
	j	bnei_cont.39671

bnei_else.39700:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39702

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39703

fbgt_else.39702:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39703:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39704

	nop
	nop
	nop
	j	bnei_cont.39705

bnei_else.39704:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39705:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39701:
	nop
	nop
	nop
	j	bnei_cont.39671

bnei_else.39678:
bnei_cont.39679:
	nop
	nop
	nop
	j	bnei_cont.39671

bnei_else.39670:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -16
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39706

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39707

fbgt_else.39706:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39707:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39708

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39710

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.39709

fbgt_else.39710:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39711:
	nop
	nop
	nop
	j	bnei_cont.39709

bnei_else.39708:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.39709:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39712

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.39714

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39716

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39718

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39719

bnei_else.39718:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39719:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.39720

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39721

fbeq_else.39720:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39721:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39722

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39723

bnei_else.39722:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39724

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39725

bnei_else.39724:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39725:
bnei_cont.39723:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39715

bnei_else.39716:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.39717:
	nop
	nop
	nop
	j	bnei_cont.39715

bnei_else.39714:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	lw	%a0, 12(%sp)
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39726

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39727

fbeq_else.39726:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39727:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39728

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39729

bnei_else.39728:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39730

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39731

fbgt_else.39730:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39731:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39732

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39733

bnei_else.39732:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39733:
bnei_cont.39729:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39715:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -16
	addi	%v0, %zero, 0

	lw	%v1, 15(%sp)
	nop
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -16
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39734

	nop
	nop
	nop
	j	bnei_cont.39713

bnei_else.39734:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39736

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39737

fbgt_else.39736:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39737:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39738

	nop
	nop
	nop
	j	bnei_cont.39739

bnei_else.39738:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39739:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39735:
	nop
	nop
	nop
	j	bnei_cont.39713

bnei_else.39712:
bnei_cont.39713:
bnei_cont.39671:
	lw	%v1, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0

	nop
	nop
	addi	%sp, %sp, 16
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -16
	nop

	lw	%a0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.39667

bnei_else.39666:
bnei_cont.39667:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	addi	%v1, %t1, 1
	nop

	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	nop
	j	pretrace_diffuse_rays.3031

bgti_else.39665:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	nop
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39664:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	nop
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39661:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.39660:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

pretrace_pixels.3034:
	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	fsw	%f1, 1(%sp)
	nop
	nop
	nop

	fsw	%f2, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%v1, 4(%sp)
	nop
	nop
	nop

	sw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%t5, 6(%sp)
	nop
	nop
	nop

	sw	%t4, 7(%sp)
	nop
	nop
	nop

	sw	%t3, 8(%sp)
	nop
	nop
	nop

	sw	%t2, 9(%sp)
	nop
	nop
	nop

	sw	%t1, 10(%sp)
	nop
	nop
	nop

	sw	%t0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.40042

	flw	%f12, 158(%zero)
	lw	%a0, 156(%zero)
	nop
	nop

	nop
	nop
	sub	%a0, %v1, %a0
	nop

	nop
	nop
	itof	%f11, %a0
	nop

	flw	%f11, 165(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 174(%zero)
	nop
	nop
	nop

	flw	%f0, 166(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 175(%zero)
	nop
	nop
	nop

	flw	%f0, 167(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	fsw	%f0, 176(%zero)
	nop
	nop
	nop

	flw	%f13, 174(%zero)
	flw	%f12, 175(%zero)
	nop
	nop

	flw	%f11, 176(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40043

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40044

fbeq_else.40043:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40044:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40045

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40046

bnei_else.40045:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

bnei_cont.40046:
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	fmul	%f1, %f13, %f0
	addi	%sp, %sp, 13

	fsw	%f1, 174(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 175(%zero)
	nop
	add	%at, %a1, %a0
	fmov	%f1, %fzero

	fsw	%f0, 176(%zero)
	lw	%t0, 0(%at)
	nop
	nop

	fsw	%fzero, 151(%zero)
	nop
	addi	%a0, %t0, 0
	nop

	fsw	%fzero, 152(%zero)
	nop
	nop
	nop

	fsw	%fzero, 153(%zero)
	nop
	nop
	nop

	flw	%f0, 75(%zero)
	nop
	nop
	nop

	fsw	%f0, 159(%zero)
	nop
	nop
	nop

	flw	%f0, 76(%zero)
	nop
	nop
	nop

	fsw	%f0, 160(%zero)
	nop
	nop
	nop

	flw	%f0, 77(%zero)
	nop
	nop
	nop

	fsw	%f0, 161(%zero)
	nop
	fmov	%f0, %f30
	nop

	nop
	nop
	addi	%v1, %zero, 174
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	trace_ray.2971

	lw	%a2, 7(%t0)
	lw	%fp, 6(%t0)
	addi	%sp, %sp, -13
	nop

	lw	%a0, 5(%t0)
	lw	%k0, 3(%t0)
	nop
	nop

	sw	%a0, 13(%sp)
	lw	%a1, 2(%t0)
	nop
	nop

	lw	%a3, 1(%t0)
	lw	%a0, 0(%t0)
	nop
	nop

	flw	%f0, 151(%zero)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 152(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 153(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 0(%fp)
	lw	%a0, 0(%a1)
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.40047

	lw	%a0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40049

	lw	%a0, 0(%fp)
	fsw	%fzero, 148(%zero)
	addi	%sp, %sp, 14
	nop

	fsw	%fzero, 149(%zero)
	lw	%t2, 179(%a0)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%t3, 0(%a2)
	nop
	nop

	lw	%t1, 0(%a3)
	nop
	nop
	nop

	flw	%f0, 0(%t1)
	nop
	addi	%v0, %t1, 0
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t1)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t1)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	lw	%a0, 118(%t2)
	flw	%f0, 0(%t3)
	addi	%sp, %sp, -14
	nop

	lw	%t4, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%t4)
	nop
	nop
	nop

	flw	%f1, 1(%t4)
	flw	%f0, 1(%t3)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%t4)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%t3)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40051

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.40052

fbgt_else.40051:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.40052:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40053

	lw	%t4, 119(%t2)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 14
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	addi	%a0, %t4, 0

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t5, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t5, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40055

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40056

fbgt_else.40055:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40056:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40057

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40059

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40058

fbgt_else.40059:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40060:
	nop
	nop
	nop
	j	bnei_cont.40058

bnei_else.40057:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40058:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40054

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t4)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t4, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.40063

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.40065

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40067

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40068

bnei_else.40067:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40068:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40069

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40070

fbeq_else.40069:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40070:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40071

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40072

bnei_else.40071:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40073

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40074

bnei_else.40073:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40074:
bnei_cont.40072:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40064

bnei_else.40065:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.40066:
	nop
	nop
	nop
	j	bnei_cont.40064

bnei_else.40063:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40075

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40076

fbeq_else.40075:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40076:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40077

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40078

bnei_else.40077:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40079

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40080

fbgt_else.40079:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40080:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40081

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40082

bnei_else.40081:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40082:
bnei_cont.40078:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40064:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40083

	nop
	nop
	nop
	j	bnei_cont.40054

bnei_else.40083:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40085

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40086

fbgt_else.40085:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40086:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40087

	nop
	nop
	nop
	j	bnei_cont.40088

bnei_else.40087:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40088:
	flw	%f0, 0(%t4)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40084:
	nop
	nop
	nop
	j	bnei_cont.40054

bnei_else.40061:
bnei_cont.40062:
	nop
	nop
	nop
	j	bnei_cont.40054

bnei_else.40053:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 14
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t5, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t5, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40089

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40090

fbgt_else.40089:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40090:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40091

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40093

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40092

fbgt_else.40093:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40094:
	nop
	nop
	nop
	j	bnei_cont.40092

bnei_else.40091:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40092:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40095

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.40097

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.40099

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40101

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 474(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40102

bnei_else.40101:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40102:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40103

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40104

fbeq_else.40103:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40104:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40105

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40106

bnei_else.40105:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40107

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40108

bnei_else.40107:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40108:
bnei_cont.40106:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40098

bnei_else.40099:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.40100:
	nop
	nop
	nop
	j	bnei_cont.40098

bnei_else.40097:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %t4, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40109

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40110

fbeq_else.40109:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40110:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40111

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40112

bnei_else.40111:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40113

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40114

fbgt_else.40113:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40114:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40115

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40116

bnei_else.40115:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40116:
bnei_cont.40112:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40098:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40117

	nop
	nop
	nop
	j	bnei_cont.40096

bnei_else.40117:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40119

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40120

fbgt_else.40119:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40120:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40121

	nop
	nop
	nop
	j	bnei_cont.40122

bnei_else.40121:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40122:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40118:
	nop
	nop
	nop
	j	bnei_cont.40096

bnei_else.40095:
bnei_cont.40096:
bnei_cont.40054:
	nop
	nop
	addi	%a1, %zero, 116
	addi	%a0, %t1, 0

	nop
	nop
	addi	%v1, %t3, 0
	addi	%v0, %t2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -14
	nop

	lw	%a0, 13(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.40050

bnei_else.40049:
bnei_cont.40050:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3031

	nop
	nop
	addi	%sp, %sp, -14
	j	bgti_cont.40048

bgti_else.40047:
bgti_cont.40048:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	addi	%v1, %a0, -1
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.40123

	nop
	nop
	addi	%a0, %a0, -5
	j	bgti_cont.40124

bgti_else.40123:
bgti_cont.40124:
	lw	%t5, 6(%sp)
	lw	%t4, 7(%sp)
	nop
	nop

	lw	%t3, 8(%sp)
	lw	%t2, 9(%sp)
	nop
	nop

	lw	%t1, 10(%sp)
	lw	%t0, 11(%sp)
	nop
	nop

	lw	%ra, 12(%sp)
	flw	%f2, 2(%sp)
	nop
	nop

	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	j	pretrace_pixels.3034

bgti_else.40042:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3045:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	lw	%t0, 154(%zero)
	add	%a0, %zero, %t0
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%a2, 4(%sp)
	nop
	nop
	nop

	sw	%t4, 5(%sp)
	nop
	nop
	nop

	sw	%t3, 6(%sp)
	nop
	nop
	nop

	sw	%t2, 7(%sp)
	nop
	nop
	nop

	sw	%t1, 8(%sp)
	nop
	nop
	nop

	sw	%a0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.42440

	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.42440:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%fp, 7(%t1)
	lw	%s0, 6(%t1)
	nop
	nop

	lw	%k0, 5(%t1)
	lw	%a0, 4(%t1)
	nop
	nop

	sw	%a0, 11(%sp)
	lw	%a1, 3(%t1)
	nop
	nop

	lw	%a3, 2(%t1)
	lw	%ra, 1(%t1)
	nop
	nop

	lw	%a0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	addi	%a0, %v1, 1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	lw	%a2, 155(%zero)
	nop
	nop
	nop

	sw	%a2, 12(%sp)
	nop
	nop
	nop

	sw	%a0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a2, bgt_else.42442

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42443

bgt_else.42442:
	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.42444

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42445

bgt_else.42444:
	nop
	nop
	addi	%a0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.42446

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42447

bgt_else.42446:
	nop
	nop
	nop
	blt	%zero, %v0, bgt_else.42448

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42449

bgt_else.42448:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.42449:
bgt_cont.42447:
bgt_cont.42445:
bgt_cont.42443:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42450

	lw	%fp, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 0, bnei_cont.42451

	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %a3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%ra, 5(%a0)
	lw	%a0, 2(%a0)
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %fp, beq_else.42454

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %fp, beq_else.42456

	lw	%a2, 3(%sp)
	nop
	addi	%a0, %a3, -1
	nop

	nop
	nop
	add	%at, %a2, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %fp, beq_else.42458

	nop
	nop
	addi	%a0, %a3, 1
	nop

	nop
	nop
	add	%at, %a2, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %fp, beq_else.42460

	nop
	nop
	add	%a0, %zero, %k1
	j	beq_cont.42455

beq_else.42460:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.42461:
	nop
	nop
	nop
	j	beq_cont.42455

beq_else.42458:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.42459:
	nop
	nop
	nop
	j	beq_cont.42455

beq_else.42456:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.42457:
	nop
	nop
	nop
	j	beq_cont.42455

beq_else.42454:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.42455:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42462

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42464

	lw	%fp, 0(%sp)
	lw	%a1, 3(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %fp, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a3, 5(%a0)
	nop
	addi	%a0, %fp, 1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %fp
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	lw	%a0, 0(%ra)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%k0)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%a2)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%a1)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 11(%sp)
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f11, 151(%zero)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.42465

bnei_else.42464:
bnei_cont.42465:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %k1, 0
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42451

bnei_else.42462:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	nop

bnei_cont.42463:
	nop
	nop
	nop
	j	bnei_cont.42451

bgti_else.42452:
bgti_cont.42453:
	nop
	nop
	nop
	j	bnei_cont.42451

bnei_else.42450:
	lw	%a0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.42466

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42468

	lw	%a0, 0(%k0)
	lw	%t4, 0(%s0)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%t3, 0(%fp)
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%t2, 0(%ra)
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.42470

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42471

bnei_else.42470:
bnei_cont.42471:
	nop
	nop
	nop
	beqi	%t4, 1, bnei_else.42472

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42473

bnei_else.42472:
bnei_cont.42473:
	nop
	nop
	nop
	beqi	%t4, 2, bnei_else.42474

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42475

bnei_else.42474:
bnei_cont.42475:
	nop
	nop
	nop
	beqi	%t4, 3, bnei_else.42476

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42477

bnei_else.42476:
bnei_cont.42477:
	nop
	nop
	nop
	beqi	%t4, 4, bnei_else.42478

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42479

bnei_else.42478:
bnei_cont.42479:
	lw	%a0, 11(%sp)
	flw	%f11, 151(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.42469

bnei_else.42468:
bnei_cont.42469:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	j	bgti_cont.42467

bgti_else.42466:
bgti_cont.42467:
bnei_cont.42451:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42480

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42482

	nop
	nop
	nop
	j	bgt_cont.42481

bgti_else.42482:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.42483:
	nop
	nop
	nop
	j	bgt_cont.42481

bgt_else.42480:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.42481:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	addi	%t1, %zero, 10
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42484

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42486

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42488

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42490

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42494

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42496

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42498

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42502

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42504

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42506

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42510

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42512

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42514

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42514:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42515:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42512:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42513:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42510:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42511:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42508:
bgti_cont.42509:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42506:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42507:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42504:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42505:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42502:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42503:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42500:
bgti_cont.42501:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42498:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42499:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42496:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42497:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42494:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42495:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42492:
bgti_cont.42493:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42490:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42491:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42488:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42489:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42486:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42487:
	nop
	nop
	nop
	j	bgti_cont.42485

bgti_else.42484:
bgti_cont.42485:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42516

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42517

bgt_else.42516:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42518

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42520

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42522

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42524

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42528

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42530

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42532

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42536

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42538

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42540

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42544

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42546

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42548

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42548:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42549:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42546:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42547:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42544:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42545:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42542:
bgti_cont.42543:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42540:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42541:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42538:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42539:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42536:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42537:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42534:
bgti_cont.42535:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42532:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42533:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42530:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42531:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42528:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42529:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42526:
bgti_cont.42527:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42524:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42525:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42522:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42523:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42520:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42521:
	nop
	nop
	nop
	j	bgti_cont.42519

bgti_else.42518:
bgti_cont.42519:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42550

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42551

bgt_else.42550:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42552

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42554

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42556

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42558

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42562

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42564

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42566

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42570

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42572

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42574

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42578

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42580

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42582

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42582:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42583:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42580:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42581:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42578:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42579:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42576:
bgti_cont.42577:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42574:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42575:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42572:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42573:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42570:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42571:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42568:
bgti_cont.42569:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42566:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42567:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42564:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42565:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42562:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42563:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42560:
bgti_cont.42561:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42558:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42559:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42556:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42557:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42554:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42555:
	nop
	nop
	nop
	j	bgti_cont.42553

bgti_else.42552:
bgti_cont.42553:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.42551:
bgt_cont.42517:
	nop
	nop
	addi	%t2, %zero, 32
	addi	%sp, %sp, 14

	nop
	nop
	addi	%v0, %t2, 0
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42584

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42586

	nop
	nop
	nop
	j	bgt_cont.42585

bgti_else.42586:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.42587:
	nop
	nop
	nop
	j	bgt_cont.42585

bgt_else.42584:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.42585:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42588

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42590

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42592

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42594

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42598

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42600

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42602

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42606

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42608

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42610

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42614

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42616

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42618

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42618:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42619:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42616:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42617:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42614:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42615:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42612:
bgti_cont.42613:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42610:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42611:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42608:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42609:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42606:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42607:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42604:
bgti_cont.42605:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42602:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42603:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42600:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42601:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42598:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42599:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42596:
bgti_cont.42597:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42594:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42595:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42592:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42593:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42590:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42591:
	nop
	nop
	nop
	j	bgti_cont.42589

bgti_else.42588:
bgti_cont.42589:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42620

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42621

bgt_else.42620:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42622

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42624

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42626

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42628

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42632

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42634

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42636

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42640

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42642

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42644

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42648

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42650

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42652

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42652:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42653:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42650:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42651:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42648:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42649:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42646:
bgti_cont.42647:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42644:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42645:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42642:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42643:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42640:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42641:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42638:
bgti_cont.42639:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42636:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42637:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42634:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42635:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42632:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42633:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42630:
bgti_cont.42631:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42628:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42629:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42626:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42627:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42624:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42625:
	nop
	nop
	nop
	j	bgti_cont.42623

bgti_else.42622:
bgti_cont.42623:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42654

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42655

bgt_else.42654:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42656

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42658

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42660

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42662

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42666

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42668

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42670

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42674

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42676

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42678

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42682

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42684

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42686

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42686:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42687:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42684:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42685:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42682:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42683:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42680:
bgti_cont.42681:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42678:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42679:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42676:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42677:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42674:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42675:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42672:
bgti_cont.42673:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42670:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42671:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42668:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42669:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42666:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42667:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42664:
bgti_cont.42665:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42662:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42663:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42660:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42661:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42658:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42659:
	nop
	nop
	nop
	j	bgti_cont.42657

bgti_else.42656:
bgti_cont.42657:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.42655:
bgt_cont.42621:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42688

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42690

	nop
	nop
	nop
	j	bgt_cont.42689

bgti_else.42690:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.42691:
	nop
	nop
	nop
	j	bgt_cont.42689

bgt_else.42688:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.42689:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42692

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42694

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42696

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42698

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42693

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42702

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42704

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42706

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42693

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42710

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42712

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42714

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42693

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42718

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42720

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42722

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42722:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42723:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42720:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42721:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42718:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42719:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42716:
bgti_cont.42717:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42714:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42715:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42712:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42713:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42710:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42711:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42708:
bgti_cont.42709:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42706:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42707:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42704:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42705:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42702:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42703:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42700:
bgti_cont.42701:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42698:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42699:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42696:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42697:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42694:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42695:
	nop
	nop
	nop
	j	bgti_cont.42693

bgti_else.42692:
bgti_cont.42693:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42724

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42725

bgt_else.42724:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42726

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42728

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42730

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42732

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42727

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42736

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42738

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42740

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42727

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42744

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42746

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42748

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42727

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42752

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42754

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42756

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42756:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42757:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42754:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42755:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42752:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42753:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42750:
bgti_cont.42751:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42748:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42749:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42746:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42747:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42744:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42745:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42742:
bgti_cont.42743:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42740:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42741:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42738:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42739:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42736:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42737:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42734:
bgti_cont.42735:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42732:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42733:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42730:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42731:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42728:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42729:
	nop
	nop
	nop
	j	bgti_cont.42727

bgti_else.42726:
bgti_cont.42727:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42758

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42759

bgt_else.42758:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42760

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42762

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42764

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42766

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42761

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42770

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42772

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42774

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42761

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42778

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42780

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42782

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42761

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42786

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42788

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42790

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42790:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42791:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42788:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42789:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42786:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42787:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42784:
bgti_cont.42785:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42782:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42783:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42780:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42781:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42778:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42779:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42776:
bgti_cont.42777:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42774:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42775:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42772:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42773:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42770:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42771:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42768:
bgti_cont.42769:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42766:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42767:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42764:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42765:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42762:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42763:
	nop
	nop
	nop
	j	bgti_cont.42761

bgti_else.42760:
bgti_cont.42761:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.42759:
bgt_cont.42725:
	nop
	nop
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %a0, 1
	nop

	nop
	nop
	nop
	blt	%t3, %t0, bgt_else.42792

	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	nop
	nop

	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	nop
	nop

	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.42792:
	lw	%a0, 3(%sp)
	lw	%a1, 12(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %t3
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 153(%zero)
	lw	%a0, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a1, bgt_else.42794

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42795

bgt_else.42794:
	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42796

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42797

bgt_else.42796:
	nop
	nop
	addi	%a0, %t3, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.42798

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42799

bgt_else.42798:
	nop
	nop
	nop
	blt	%zero, %t3, bgt_else.42800

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.42801

bgt_else.42800:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.42801:
bgt_cont.42799:
bgt_cont.42797:
bgt_cont.42795:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42802

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.42803

bnei_else.42802:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	nop

bnei_cont.42803:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42804

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42806

	nop
	nop
	nop
	j	bgt_cont.42805

bgti_else.42806:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.42807:
	nop
	nop
	nop
	j	bgt_cont.42805

bgt_else.42804:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.42805:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42808

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42810

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42812

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42814

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42816

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42818

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42820

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42822

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42824

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42826

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42828

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42830

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42830:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.42831:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42828:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.42829:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42826:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.42827:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42824:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.42825:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42822:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.42823:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42820:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.42821:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42818:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.42819:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42816:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.42817:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42814:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.42815:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42812:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.42813:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42810:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.42811:
	nop
	nop
	nop
	j	bgti_cont.42809

bgti_else.42808:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.42809:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42832

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42834

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42836

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42838

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42833

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42842

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42844

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42846

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42833

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42850

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42852

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42854

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42854:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42855:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42852:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42853:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42850:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42851:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42848:
bgti_cont.42849:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42846:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42847:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42844:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42845:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42842:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42843:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42840:
bgti_cont.42841:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42838:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42839:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42836:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42837:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42834:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42835:
	nop
	nop
	nop
	j	bgti_cont.42833

bgti_else.42832:
bgti_cont.42833:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42856

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42857

bgt_else.42856:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42858

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42860

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42862

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42864

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42866

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42868

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42870

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42872

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42874

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42876

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42878

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42880

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42880:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.42881:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42878:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.42879:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42876:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.42877:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42874:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.42875:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42872:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.42873:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42870:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.42871:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42868:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.42869:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42866:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.42867:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42864:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.42865:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42862:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.42863:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42860:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.42861:
	nop
	nop
	nop
	j	bgti_cont.42859

bgti_else.42858:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.42859:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42882

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42884

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42886

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42888

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42883

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42892

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42894

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42896

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42883

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42900

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42902

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42904

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42904:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42905:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42902:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42903:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42900:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42901:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42898:
bgti_cont.42899:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42896:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42897:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42894:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42895:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42892:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42893:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42890:
bgti_cont.42891:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42888:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.42889:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42886:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.42887:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42884:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.42885:
	nop
	nop
	nop
	j	bgti_cont.42883

bgti_else.42882:
bgti_cont.42883:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42906

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42907

bgt_else.42906:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42908

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42910

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42912

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42914

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42909

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42918

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42920

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42922

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42909

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42926

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42928

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42930

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42930:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42931:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42928:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42929:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42926:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42927:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42924:
bgti_cont.42925:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42922:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42923:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42920:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42921:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42918:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42919:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42916:
bgti_cont.42917:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42914:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.42915:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42912:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.42913:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42910:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.42911:
	nop
	nop
	nop
	j	bgti_cont.42909

bgti_else.42908:
bgti_cont.42909:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.42907:
bgt_cont.42857:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42932

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42934

	nop
	nop
	nop
	j	bgt_cont.42933

bgti_else.42934:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.42935:
	nop
	nop
	nop
	j	bgt_cont.42933

bgt_else.42932:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.42933:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42936

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42938

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42940

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42942

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42944

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42946

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42948

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42950

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42952

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42954

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42956

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42958

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42958:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.42959:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42956:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.42957:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42954:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.42955:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42952:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.42953:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42950:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.42951:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42948:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.42949:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42946:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.42947:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42944:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.42945:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42942:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.42943:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42940:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.42941:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42938:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.42939:
	nop
	nop
	nop
	j	bgti_cont.42937

bgti_else.42936:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.42937:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42960

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42962

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42964

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42966

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42961

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42970

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42972

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42974

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42961

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42978

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42980

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42982

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42982:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42983:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42980:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42981:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42978:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42979:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42976:
bgti_cont.42977:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42974:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42975:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42972:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42973:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42970:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42971:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42968:
bgti_cont.42969:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42966:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.42967:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42964:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.42965:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42962:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.42963:
	nop
	nop
	nop
	j	bgti_cont.42961

bgti_else.42960:
bgti_cont.42961:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42984

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.42985

bgt_else.42984:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42986

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42988

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42990

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42992

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42994

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42996

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42998

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43000

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43002

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43004

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43006

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43008

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.43008:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.43009:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.43006:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.43007:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.43004:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.43005:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.43002:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.43003:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.43000:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.43001:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42998:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.42999:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42996:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.42997:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42994:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.42995:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42992:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.42993:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42990:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.42991:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42988:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.42989:
	nop
	nop
	nop
	j	bgti_cont.42987

bgti_else.42986:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.42987:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43010

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43012

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43014

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43016

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43011

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43020

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43022

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43024

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43011

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43028

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43030

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43032

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43032:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43033:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43030:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43031:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43028:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43029:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43026:
bgti_cont.43027:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43024:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43025:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43022:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43023:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43020:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43021:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43018:
bgti_cont.43019:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43016:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43017:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43014:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43015:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43012:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43013:
	nop
	nop
	nop
	j	bgti_cont.43011

bgti_else.43010:
bgti_cont.43011:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43034

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.43035

bgt_else.43034:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43036

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43038

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43040

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43042

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43037

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43046

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43048

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43050

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43037

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43054

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43056

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43058

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43058:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43059:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43056:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43057:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43054:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43055:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43052:
bgti_cont.43053:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43050:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43051:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43048:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43049:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43046:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43047:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43044:
bgti_cont.43045:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43042:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43043:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43040:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43041:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43038:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43039:
	nop
	nop
	nop
	j	bgti_cont.43037

bgti_else.43036:
bgti_cont.43037:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.43035:
bgt_cont.42985:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.43060

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.43062

	nop
	nop
	nop
	j	bgt_cont.43061

bgti_else.43062:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.43063:
	nop
	nop
	nop
	j	bgt_cont.43061

bgt_else.43060:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.43061:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43064

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43066

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43068

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43070

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43072

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43074

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43076

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43078

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43080

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43082

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43084

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43086

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43086:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.43087:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43084:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.43085:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43082:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.43083:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43080:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.43081:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43078:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.43079:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43076:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.43077:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43074:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.43075:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43072:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.43073:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43070:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.43071:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43068:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.43069:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43066:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.43067:
	nop
	nop
	nop
	j	bgti_cont.43065

bgti_else.43064:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.43065:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43088

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43090

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43092

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43094

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43089

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43098

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43100

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43102

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43089

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43106

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43108

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43110

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43110:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.43111:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43108:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.43109:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43106:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.43107:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43104:
bgti_cont.43105:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43102:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.43103:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43100:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.43101:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43098:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.43099:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43096:
bgti_cont.43097:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43094:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.43095:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43092:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.43093:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43090:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.43091:
	nop
	nop
	nop
	j	bgti_cont.43089

bgti_else.43088:
bgti_cont.43089:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.43112

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.43113

bgt_else.43112:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43114

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43116

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43118

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43120

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43122

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43124

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43126

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43128

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43130

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43132

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43134

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43136

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43136:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.43137:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43134:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.43135:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43132:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.43133:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43130:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.43131:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43128:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.43129:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43126:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.43127:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43124:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.43125:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43122:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.43123:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43120:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.43121:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43118:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.43119:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43116:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.43117:
	nop
	nop
	nop
	j	bgti_cont.43115

bgti_else.43114:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.43115:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43138

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43140

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43142

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43144

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43139

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43148

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43150

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43152

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43139

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43156

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43158

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43160

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43160:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43161:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43158:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43159:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43156:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43157:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43154:
bgti_cont.43155:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43152:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43153:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43150:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43151:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43148:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43149:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43146:
bgti_cont.43147:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43144:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.43145:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43142:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.43143:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43140:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.43141:
	nop
	nop
	nop
	j	bgti_cont.43139

bgti_else.43138:
bgti_cont.43139:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43162

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.43163

bgt_else.43162:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43164

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43166

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43168

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43170

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43165

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43174

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43176

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43178

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43165

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43182

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43184

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43186

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43186:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43187:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43184:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43185:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43182:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43183:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43180:
bgti_cont.43181:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43178:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43179:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43176:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43177:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43174:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43175:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43172:
bgti_cont.43173:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43170:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.43171:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43168:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.43169:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43166:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.43167:
	nop
	nop
	nop
	j	bgti_cont.43165

bgti_else.43164:
bgti_cont.43165:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.43163:
bgt_cont.43113:
	nop
	nop
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %t3, 1

	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	nop
	nop

	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	nop
	nop

	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	nop
	nop

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	j	scan_pixel.3045

scan_line.3051:
	nop
	nop
	add	%a3, %zero, %v0
	add	%v0, %zero, %a1

	sw	%a3, 0(%sp)
	lw	%t0, 155(%zero)
	add	%a1, %zero, %t0
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	add	%a0, %zero, %a2
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a0, 4(%sp)
	nop
	nop
	nop

	sw	%t3, 5(%sp)
	nop
	nop
	nop

	sw	%t2, 6(%sp)
	nop
	nop
	nop

	sw	%t1, 7(%sp)
	nop
	nop
	nop

	sw	%a1, 8(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a3, %t0, bgt_else.44464

	nop
	nop
	add	%t0, %zero, %a1
	jr	%ra

bgt_else.44464:
	nop
	nop
	addi	%a1, %t0, -1
	nop

	sw	%a1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a3, %a1, bgt_else.44466

	nop
	nop
	nop
	j	bgt_cont.44467

bgt_else.44466:
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	addi	%a2, %a3, 1
	addi	%sp, %sp, 11

	nop
	nop
	sub	%a1, %a2, %a1
	nop

	lw	%a1, 154(%zero)
	nop
	itof	%f0, %a1
	nop

	flw	%f0, 168(%zero)
	nop
	fmul	%f12, %f1, %f0
	addi	%v1, %a1, -1

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f12, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f11, %f12, %f1
	nop

	flw	%f11, 170(%zero)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 173(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44467:
	lw	%t1, 154(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %t1, bgt_else.44468

	nop
	nop
	nop
	j	bgt_cont.44469

bgt_else.44468:
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	nop
	nop

	lw	%v0, 0(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	addi	%a0, %a1, 1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.44470

	nop
	nop
	nop
	j	bgt_cont.44471

bgt_else.44470:
	nop
	nop
	nop
	blt	%zero, %a1, bgt_else.44472

	nop
	nop
	nop
	j	bgt_cont.44473

bgt_else.44472:
	nop
	nop
	nop
	blt	%k1, %t1, bgt_else.44474

	nop
	nop
	nop
	j	bgt_cont.44475

bgt_else.44474:
bgt_cont.44475:
bgt_cont.44473:
bgt_cont.44471:
	nop
	nop
	nop
	beqi	%zero, 0, bnei_else.44476

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -11
	j	bnei_cont.44477

bnei_else.44476:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -11
	nop

bnei_cont.44477:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44478

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44480

	nop
	nop
	nop
	j	bgt_cont.44479

bgti_else.44480:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.44481:
	nop
	nop
	nop
	j	bgt_cont.44479

bgt_else.44478:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44479:
	nop
	nop
	addi	%a3, %zero, 10
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44482

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44484

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44486

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44488

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44490

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44492

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44494

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44496

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44498

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44500

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44502

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44504

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44504:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.44505:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44502:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.44503:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44500:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.44501:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44498:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.44499:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44496:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.44497:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44494:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.44495:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44492:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.44493:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44490:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.44491:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44488:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.44489:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44486:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.44487:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44484:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.44485:
	nop
	nop
	nop
	j	bgti_cont.44483

bgti_else.44482:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44483:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44506

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44508

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44510

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44512

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44507

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44516

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44518

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44520

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44507

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44524

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44526

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44528

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44528:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44529:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44526:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44527:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44524:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44525:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44522:
bgti_cont.44523:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44520:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44521:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44518:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44519:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44516:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44517:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44514:
bgti_cont.44515:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44512:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44513:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44510:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44511:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44508:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44509:
	nop
	nop
	nop
	j	bgti_cont.44507

bgti_else.44506:
bgti_cont.44507:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44530

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44531

bgt_else.44530:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44532

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44534

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44536

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44538

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44540

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44542

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44544

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44546

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44548

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44550

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44552

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44554

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44554:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.44555:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44552:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.44553:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44550:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.44551:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44548:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.44549:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44546:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.44547:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44544:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.44545:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44542:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.44543:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44540:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.44541:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44538:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.44539:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44536:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.44537:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44534:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.44535:
	nop
	nop
	nop
	j	bgti_cont.44533

bgti_else.44532:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.44533:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44556

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44558

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44560

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44562

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44557

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44566

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44568

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44570

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44557

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44574

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44576

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44578

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44578:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44579:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44576:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44577:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44574:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44575:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44572:
bgti_cont.44573:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44570:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44571:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44568:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44569:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44566:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44567:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44564:
bgti_cont.44565:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44562:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44563:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44560:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44561:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44558:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44559:
	nop
	nop
	nop
	j	bgti_cont.44557

bgti_else.44556:
bgti_cont.44557:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44580

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44581

bgt_else.44580:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44582

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44584

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44586

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44588

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44583

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44592

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44594

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44596

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44583

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44600

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44602

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44604

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44604:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44605:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44602:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44603:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44600:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44601:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44598:
bgti_cont.44599:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44596:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44597:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44594:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44595:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44592:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44593:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44590:
bgti_cont.44591:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44588:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44589:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44586:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44587:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44584:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44585:
	nop
	nop
	nop
	j	bgti_cont.44583

bgti_else.44582:
bgti_cont.44583:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44581:
bgt_cont.44531:
	nop
	nop
	addi	%a1, %zero, 32
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a1, 0
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a2, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.44606

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.44608

	nop
	nop
	nop
	j	bgt_cont.44607

bgti_else.44608:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44609:
	nop
	nop
	nop
	j	bgt_cont.44607

bgt_else.44606:
	nop
	nop
	addi	%a2, %zero, 255
	nop

bgt_cont.44607:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44610

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44612

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44614

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44616

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44618

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44620

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44622

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44624

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44626

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44628

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44630

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44632

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44632:
	nop
	nop
	addi	%fp, %zero, 11
	nop

bgti_cont.44633:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44630:
	nop
	nop
	addi	%fp, %zero, 10
	nop

bgti_cont.44631:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44628:
	nop
	nop
	addi	%fp, %zero, 9
	nop

bgti_cont.44629:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44626:
	nop
	nop
	addi	%fp, %zero, 8
	nop

bgti_cont.44627:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44624:
	nop
	nop
	addi	%fp, %zero, 7
	nop

bgti_cont.44625:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44622:
	nop
	nop
	addi	%fp, %zero, 6
	nop

bgti_cont.44623:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44620:
	nop
	nop
	addi	%fp, %zero, 5
	nop

bgti_cont.44621:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44618:
	nop
	nop
	addi	%fp, %zero, 4
	nop

bgti_cont.44619:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44616:
	nop
	nop
	addi	%fp, %zero, 3
	nop

bgti_cont.44617:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44614:
	nop
	nop
	addi	%fp, %zero, 2
	nop

bgti_cont.44615:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44612:
	nop
	nop
	add	%fp, %zero, %k1
	nop

bgti_cont.44613:
	nop
	nop
	nop
	j	bgti_cont.44611

bgti_else.44610:
	nop
	nop
	add	%fp, %zero, %zero
	nop

bgti_cont.44611:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44634

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44636

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44638

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44640

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44635

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44644

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44646

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44648

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44635

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44652

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44654

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44656

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44656:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44657:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44654:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44655:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44652:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44653:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44650:
bgti_cont.44651:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44648:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44649:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44646:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44647:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44644:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44645:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44642:
bgti_cont.44643:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44640:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44641:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44638:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44639:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44636:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44637:
	nop
	nop
	nop
	j	bgti_cont.44635

bgti_else.44634:
bgti_cont.44635:
	nop
	nop
	nop
	blt	%zero, %fp, bgt_else.44658

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44659

bgt_else.44658:
	nop
	nop
	nop
	blti	%fp, 10, bgti_else.44660

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44662

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44664

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44666

	nop
	nop
	addi	%a0, %fp, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44668

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44670

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44672

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44674

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44676

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44678

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44680

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44682

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44682:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.44683:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44680:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.44681:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44678:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.44679:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44676:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.44677:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44674:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.44675:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44672:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.44673:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44670:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.44671:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44668:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.44669:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44666:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.44667:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44664:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.44665:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44662:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.44663:
	nop
	nop
	nop
	j	bgti_cont.44661

bgti_else.44660:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.44661:
	nop
	nop
	nop
	blti	%fp, 10, bgti_else.44684

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44686

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44688

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44690

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.44685

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44694

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44696

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44698

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.44685

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44702

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44704

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44706

	nop
	nop
	addi	%v0, %fp, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44706:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.44707:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44704:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.44705:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44702:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.44703:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44700:
bgti_cont.44701:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44698:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.44699:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44696:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.44697:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44694:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.44695:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44692:
bgti_cont.44693:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44690:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.44691:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44688:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.44689:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44686:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.44687:
	nop
	nop
	nop
	j	bgti_cont.44685

bgti_else.44684:
bgti_cont.44685:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44708

	nop
	nop
	addi	%v0, %fp, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44709

bgt_else.44708:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44710

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44712

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44714

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44716

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44711

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44720

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44722

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44724

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44711

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44728

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44730

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44732

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44732:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44733:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44730:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44731:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44728:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44729:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44726:
bgti_cont.44727:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44724:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44725:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44722:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44723:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44720:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44721:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44718:
bgti_cont.44719:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44716:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44717:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44714:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44715:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44712:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44713:
	nop
	nop
	nop
	j	bgti_cont.44711

bgti_else.44710:
bgti_cont.44711:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %fp, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44709:
bgt_cont.44659:
	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44734

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44736

	nop
	nop
	nop
	j	bgt_cont.44735

bgti_else.44736:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.44737:
	nop
	nop
	nop
	j	bgt_cont.44735

bgt_else.44734:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44735:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44738

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44740

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44742

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44744

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44746

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44748

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44750

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44752

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44754

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44756

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44758

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44760

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44760:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.44761:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44758:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.44759:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44756:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.44757:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44754:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.44755:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44752:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.44753:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44750:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.44751:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44748:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.44749:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44746:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.44747:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44744:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.44745:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44742:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.44743:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44740:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.44741:
	nop
	nop
	nop
	j	bgti_cont.44739

bgti_else.44738:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44739:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44762

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44764

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44766

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44768

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44763

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44772

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44774

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44776

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44763

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44780

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44782

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44784

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44784:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44785:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44782:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44783:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44780:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44781:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44778:
bgti_cont.44779:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44776:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44777:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44774:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44775:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44772:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44773:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44770:
bgti_cont.44771:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44768:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44769:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44766:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44767:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44764:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44765:
	nop
	nop
	nop
	j	bgti_cont.44763

bgti_else.44762:
bgti_cont.44763:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44786

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44787

bgt_else.44786:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44788

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44790

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44792

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44794

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44796

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44798

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44800

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44802

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44804

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44806

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44808

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44810

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44810:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.44811:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44808:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.44809:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44806:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.44807:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44804:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.44805:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44802:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.44803:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44800:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.44801:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44798:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.44799:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44796:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.44797:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44794:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.44795:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44792:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.44793:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44790:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.44791:
	nop
	nop
	nop
	j	bgti_cont.44789

bgti_else.44788:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.44789:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44812

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44814

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44816

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44818

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44813

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44822

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44824

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44826

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44813

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44830

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44832

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44834

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44834:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44835:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44832:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44833:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44830:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44831:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44828:
bgti_cont.44829:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44826:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44827:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44824:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44825:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44822:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44823:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44820:
bgti_cont.44821:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44818:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.44819:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44816:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44817:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44814:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44815:
	nop
	nop
	nop
	j	bgti_cont.44813

bgti_else.44812:
bgti_cont.44813:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44836

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.44837

bgt_else.44836:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44838

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44840

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44842

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44844

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44839

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44848

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44850

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44852

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44839

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44856

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44858

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44860

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44860:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44861:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44858:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44859:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44856:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44857:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44854:
bgti_cont.44855:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44852:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44853:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44850:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44851:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44848:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44849:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44846:
bgti_cont.44847:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44844:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.44845:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44842:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.44843:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44840:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.44841:
	nop
	nop
	nop
	j	bgti_cont.44839

bgti_else.44838:
bgti_cont.44839:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44837:
bgt_cont.44787:
	nop
	nop
	addi	%v0, %a3, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %k1, 0

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3045

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44469:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	addi	%t2, %a0, 1
	nop

	nop
	nop
	addi	%t3, %a0, 2
	nop

	nop
	nop
	nop
	blti	%t3, 5, bgti_else.44862

	nop
	nop
	addi	%t3, %t3, -5
	j	bgti_cont.44863

bgti_else.44862:
bgti_cont.44863:
	nop
	nop
	nop
	blt	%t2, %t0, bgt_else.44864

	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	nop
	nop

	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	nop
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.44864:
	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t2, %a0, bgt_else.44866

	nop
	nop
	nop
	j	bgt_cont.44867

bgt_else.44866:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	addi	%a1, %t2, 1
	addi	%v1, %t1, -1

	lw	%v0, 1(%sp)
	nop
	sub	%a0, %a1, %a0
	addi	%sp, %sp, 11

	nop
	nop
	itof	%f0, %a0
	addi	%a0, %t3, 0

	flw	%f0, 168(%zero)
	nop
	fmul	%f12, %f1, %f0
	nop

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f12, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f11, %f12, %f1
	nop

	flw	%f11, 170(%zero)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 173(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.44867:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	lw	%a0, 2(%sp)
	nop
	addi	%sp, %sp, 11
	jal	scan_pixel.3045

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1

	nop
	nop
	addi	%a2, %t3, 2
	nop

	nop
	nop
	nop
	blti	%a2, 5, bgti_else.44868

	nop
	nop
	addi	%a2, %a2, -5
	j	bgti_cont.44869

bgti_else.44868:
bgti_cont.44869:
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	nop
	nop

	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	nop
	nop

	lw	%ra, 9(%sp)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	nop
	j	scan_line.3051

init_line_elements.3061:
	nop
	nop
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1

	nop
	nop
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.44895

	nop
	nop
	addi	%fp, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_create_float_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%s0, %zero, 5

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s4, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %a2
	nop

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s4, 4(%ra)
	nop
	addi	%s4, %a2, -1
	nop

	sw	%s3, 3(%ra)
	nop
	nop
	nop

	sw	%s2, 2(%ra)
	nop
	nop
	nop

	sw	%s1, 1(%ra)
	nop
	nop
	nop

	sw	%k0, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.44896

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s4
	addi	%s4, %s4, -1

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s3, 4(%ra)
	nop
	nop
	nop

	sw	%s2, 3(%ra)
	nop
	nop
	nop

	sw	%s1, 2(%ra)
	nop
	nop
	nop

	sw	%k0, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.44897

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s4
	addi	%s4, %s4, -1

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s3, 4(%ra)
	nop
	nop
	nop

	sw	%s2, 3(%ra)
	nop
	nop
	nop

	sw	%s1, 2(%ra)
	nop
	nop
	nop

	sw	%k0, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.44898

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%fp, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%fp)
	nop
	add	%at, %a1, %s4
	addi	%v1, %s4, -1

	sw	%s6, 6(%fp)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%s5, 5(%fp)
	nop
	nop
	nop

	sw	%s3, 4(%fp)
	nop
	nop
	nop

	sw	%s2, 3(%fp)
	nop
	nop
	nop

	sw	%s1, 2(%fp)
	nop
	nop
	nop

	sw	%k0, 1(%fp)
	nop
	nop
	nop

	sw	%a2, 0(%fp)
	nop
	nop
	nop

	sw	%fp, 0(%at)
	nop
	nop
	j	init_line_elements.3061

bgti_else.44898:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.44897:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.44896:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.44895:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.45024

	lw	%a2, 179(%v1)
	nop
	fmul	%f12, %f0, %f0
	fmul	%f11, %f1, %f1

	nop
	nop
	fadd	%f11, %f12, %f11
	add	%at, %a2, %a0

	lw	%a1, 0(%at)
	nop
	fadd	%f11, %f11, %f30
	nop

	lw	%a1, 0(%a1)
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	fdiv	%f14, %f0, %f11
	fdiv	%f13, %f1, %f11

	fsw	%f14, 0(%a1)
	nop
	fdiv	%f12, %f30, %f11
	fneg	%f0, %f13

	fsw	%f13, 1(%a1)
	nop
	fneg	%f1, %f14
	fneg	%f11, %f14

	fsw	%f12, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, 40
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f14, 0(%a1)
	nop
	nop
	nop

	fsw	%f12, 1(%a1)
	nop
	nop
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f13
	nop

	nop
	nop
	addi	%a1, %a0, 80
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f12, 0(%a1)
	nop
	nop
	nop

	fsw	%f1, 1(%a1)
	nop
	fneg	%f1, %f13
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f12
	nop

	nop
	nop
	addi	%a1, %a0, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f11, 0(%a1)
	nop
	nop
	nop

	fsw	%f1, 1(%a1)
	nop
	fneg	%f1, %f14
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f12
	nop

	nop
	nop
	addi	%a1, %a0, 41
	addi	%a0, %a0, 81

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	nop
	add	%at, %a2, %a0
	nop

	lw	%a1, 0(%a1)
	lw	%a0, 0(%at)
	nop
	nop

	fsw	%f1, 0(%a1)
	lw	%a0, 0(%a0)
	nop
	nop

	fsw	%f0, 1(%a1)
	nop
	fneg	%f0, %f12
	nop

	fsw	%f13, 2(%a1)
	fsw	%f0, 0(%a0)
	nop
	nop

	fsw	%f14, 1(%a0)
	nop
	nop
	nop

	fsw	%f13, 2(%a0)
	nop
	nop
	jr	%ra

bgti_else.45024:
	flw	%f15, 441(%zero)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fsqrt	%f17, %f0
	nop

	nop
	nop
	fdiv	%f13, %f30, %f17
	nop

	nop
	nop
	nop
	fblt	%f13, %fzero, fbgt_else.45026

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.45027

fbgt_else.45026:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbgt_cont.45027:
	flw	%f16, 462(%zero)
	nop
	fabs	%f12, %f13
	nop

	nop
	nop
	nop
	fblt	%f12, %f16, fbgt_else.45028

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.45030

	flw	%f11, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f14, %f30, %f12
	nop

	nop
	nop
	fmul	%f18, %f14, %f14
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f13, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 460(%zero)
	nop
	fmul	%f12, %f13, %f13
	fsub	%f1, %f14, %f0

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.45031

fbgt_else.45030:
	flw	%f11, 479(%zero)
	nop
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f14, %f1, %f0
	nop

	nop
	nop
	fmul	%f18, %f14, %f14
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f13, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 460(%zero)
	nop
	fmul	%f12, %f13, %f13
	fsub	%f1, %f14, %f0

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

fbgt_cont.45031:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45032

	nop
	nop
	nop
	j	fbgt_cont.45029

bnei_else.45032:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45033:
	nop
	nop
	nop
	j	fbgt_cont.45029

fbgt_else.45028:
	flw	%f0, 461(%zero)
	nop
	fmul	%f14, %f13, %f13
	nop

	nop
	nop
	fmul	%f12, %f14, %f14
	fmul	%f0, %f0, %f13

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f14

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f13, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.45029:
	flw	%f12, 482(%zero)
	nop
	fmul	%f18, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f18, %fzero, fbgt_else.45034

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.45035

fbgt_else.45034:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbgt_cont.45035:
	flw	%f13, 481(%zero)
	nop
	fabs	%f1, %f18
	nop

	nop
	nop
	fdiv	%f0, %f1, %f13
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.45036

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45038

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45037

bnei_else.45038:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.45039:
	nop
	nop
	nop
	j	fbgt_cont.45037

fbgt_else.45036:
fbgt_cont.45037:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.45040

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.45041

fbgt_else.45040:
fbgt_cont.45041:
	flw	%f14, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.45042

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.45043

fbgt_else.45042:
fbgt_cont.45043:
	flw	%f11, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f11, %f0, fbgt_else.45044

	flw	%f1, 478(%zero)
	nop
	fmul	%f21, %f0, %f0
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	flw	%f1, 477(%zero)
	nop
	fsub	%f19, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f19, %f19, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.45045

fbgt_else.45044:
	nop
	nop
	fsub	%f0, %f14, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f20, %f0, %f0
	nop

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.45045:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45046

	nop
	nop
	nop
	j	bnei_cont.45047

bnei_else.45046:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45047:
	nop
	nop
	fabs	%f18, %f18
	nop

	nop
	nop
	fdiv	%f1, %f18, %f13
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.45048

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45049

fbgt_else.45048:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.45049:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.45050

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.45051

fbgt_else.45050:
fbgt_cont.45051:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.45052

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45054

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45053

bnei_else.45054:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.45055:
	nop
	nop
	nop
	j	fbgt_cont.45053

fbgt_else.45052:
fbgt_cont.45053:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.45056

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.45057

fbgt_else.45056:
fbgt_cont.45057:
	nop
	nop
	nop
	fblt	%f11, %f1, fbgt_else.45058

	flw	%f1, 474(%zero)
	nop
	fmul	%f20, %f1, %f1
	nop

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f1, %f1, %f20

	flw	%f1, 473(%zero)
	nop
	fsub	%f18, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f18, %f18, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.45059

fbgt_else.45058:
	flw	%f1, 478(%zero)
	nop
	fsub	%f21, %f14, %f1
	nop

	nop
	nop
	fmul	%f19, %f21, %f21
	fmul	%f1, %f1, %f21

	nop
	nop
	fmul	%f20, %f19, %f19
	fmul	%f1, %f1, %f19

	flw	%f1, 477(%zero)
	nop
	fsub	%f18, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f18, %f18, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	nop

fbgt_cont.45059:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45060

	nop
	nop
	nop
	j	bnei_cont.45061

bnei_else.45060:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45061:
	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v0, 1

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f15
	nop

	nop
	nop
	fsqrt	%f15, %f1
	nop

	nop
	nop
	fdiv	%f19, %f30, %f15
	nop

	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.45062

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.45063

fbgt_else.45062:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbgt_cont.45063:
	nop
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.45064

	flw	%f1, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.45066

	flw	%f1, 461(%zero)
	nop
	fdiv	%f19, %f30, %f17
	nop

	nop
	nop
	fmul	%f20, %f19, %f19
	fmul	%f1, %f1, %f19

	nop
	nop
	fmul	%f18, %f20, %f20
	fmul	%f1, %f1, %f20

	flw	%f1, 460(%zero)
	nop
	fmul	%f17, %f18, %f18
	fsub	%f16, %f19, %f1

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fsub	%f1, %f14, %f1
	j	fbgt_cont.45067

fbgt_else.45066:
	nop
	nop
	fsub	%f16, %f17, %f30
	fadd	%f1, %f17, %f30

	flw	%f1, 461(%zero)
	nop
	fdiv	%f19, %f16, %f1
	nop

	nop
	nop
	fmul	%f20, %f19, %f19
	fmul	%f1, %f1, %f19

	nop
	nop
	fmul	%f18, %f20, %f20
	fmul	%f1, %f1, %f20

	flw	%f1, 460(%zero)
	nop
	fmul	%f17, %f18, %f18
	fsub	%f16, %f19, %f1

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

fbgt_cont.45067:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45068

	nop
	nop
	nop
	j	fbgt_cont.45065

bnei_else.45068:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45069:
	nop
	nop
	nop
	j	fbgt_cont.45065

fbgt_else.45064:
	flw	%f1, 461(%zero)
	nop
	fmul	%f20, %f19, %f19
	nop

	nop
	nop
	fmul	%f18, %f20, %f20
	fmul	%f1, %f1, %f19

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f1, %f1, %f20

	flw	%f1, 460(%zero)
	nop
	fsub	%f16, %f19, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

fbgt_cont.45065:
	nop
	nop
	fmul	%f17, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.45070

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.45071

fbgt_else.45070:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbgt_cont.45071:
	nop
	nop
	fabs	%f16, %f17
	nop

	nop
	nop
	fdiv	%f1, %f16, %f13
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.45072

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45074

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45073

bnei_else.45074:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.45075:
	nop
	nop
	nop
	j	fbgt_cont.45073

fbgt_else.45072:
fbgt_cont.45073:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.45076

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.45077

fbgt_else.45076:
fbgt_cont.45077:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.45078

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.45079

fbgt_else.45078:
fbgt_cont.45079:
	nop
	nop
	nop
	fblt	%f11, %f1, fbgt_else.45080

	flw	%f16, 478(%zero)
	nop
	fmul	%f20, %f1, %f1
	nop

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f16, %f16, %f1

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 477(%zero)
	nop
	fsub	%f18, %f1, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f16, %f16, %f19
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.45081

fbgt_else.45080:
	nop
	nop
	fsub	%f1, %f14, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f19, %f1, %f1
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f1, %f1, %f19

	flw	%f1, 473(%zero)
	nop
	fsub	%f16, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

fbgt_cont.45081:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45082

	nop
	nop
	nop
	j	bnei_cont.45083

bnei_else.45082:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45083:
	nop
	nop
	fabs	%f17, %f17
	nop

	nop
	nop
	fdiv	%f16, %f17, %f13
	nop

	nop
	nop
	floor	%f16, %f16
	nop

	nop
	nop
	fmul	%f13, %f16, %f13
	nop

	nop
	nop
	fsub	%f13, %f17, %f13
	nop

	nop
	nop
	nop
	fblt	%f13, %f12, fbgt_else.45084

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45085

fbgt_else.45084:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.45085:
	nop
	nop
	nop
	fblt	%f13, %f12, fbgt_else.45086

	nop
	nop
	fsub	%f13, %f13, %f12
	j	fbgt_cont.45087

fbgt_else.45086:
fbgt_cont.45087:
	nop
	nop
	nop
	fblt	%f13, %f14, fbgt_else.45088

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45090

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.45089

bnei_else.45090:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.45091:
	nop
	nop
	nop
	j	fbgt_cont.45089

fbgt_else.45088:
fbgt_cont.45089:
	nop
	nop
	nop
	fblt	%f13, %f14, fbgt_else.45092

	nop
	nop
	fsub	%f13, %f12, %f13
	j	fbgt_cont.45093

fbgt_else.45092:
fbgt_cont.45093:
	nop
	nop
	nop
	fblt	%f11, %f13, fbgt_else.45094

	flw	%f11, 474(%zero)
	nop
	fmul	%f14, %f13, %f13
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f11, %f11, %f14

	flw	%f11, 473(%zero)
	nop
	fsub	%f12, %f30, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	flw	%f11, 472(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	j	fbgt_cont.45095

fbgt_else.45094:
	flw	%f11, 478(%zero)
	nop
	fsub	%f16, %f14, %f13
	nop

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f11, %f11, %f16

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f11, %f11, %f14

	flw	%f11, 477(%zero)
	nop
	fsub	%f12, %f16, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fmul	%f11, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

fbgt_cont.45095:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45096

	nop
	nop
	nop
	j	bnei_cont.45097

bnei_else.45096:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.45097:
	nop
	nop
	fdiv	%f1, %f1, %f11
	nop

	nop
	nop
	fmul	%f1, %f1, %f15
	j	calc_dirvec.3071

calc_dirvecs.3079:
	nop
	nop
	fmov	%f3, %f0
	add	%a3, %zero, %v0

	nop
	nop
	add	%fp, %zero, %a0
	add	%k0, %zero, %ra

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.45125

	flw	%f22, 460(%zero)
	flw	%f24, 438(%zero)
	itof	%f0, %a3
	addi	%a0, %fp, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f24
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	flw	%f23, 441(%zero)
	nop
	itof	%f0, %a3
	addi	%s0, %fp, 2

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%a0, %s0, 0

	nop
	nop
	fadd	%f2, %f0, %f23
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%a3, %a3, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45126

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.45127

bgti_else.45126:
bgti_cont.45127:
	nop
	nop
	nop
	blti	%a3, 0, bgti_else.45128

	nop
	nop
	itof	%f0, %a3
	addi	%a0, %fp, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f24
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	nop
	nop
	itof	%f0, %a3
	addi	%a0, %s0, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fadd	%f2, %f0, %f23
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	nop
	nop
	addi	%v0, %a3, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45129

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.45130

bgti_else.45129:
bgti_cont.45130:
	nop
	nop
	add	%ra, %zero, %k0
	addi	%a0, %fp, 0

	nop
	nop
	fmov	%f0, %f3
	j	calc_dirvecs.3079

bgti_else.45128:
	nop
	nop
	add	%ra, %zero, %k0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45125:
	nop
	nop
	add	%ra, %zero, %k0
	nop

	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3084:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1

	nop
	nop
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45163

	flw	%f26, 460(%zero)
	flw	%f25, 438(%zero)
	itof	%f0, %s1
	addi	%s5, %zero, 4

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%a0, %s3, 0

	nop
	nop
	fsub	%f3, %f0, %f25
	itof	%f0, %s5

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%v1, %s2, 0

	nop
	nop
	fsub	%f2, %f0, %f25
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	itof	%f0, %s5
	addi	%a0, %s3, 2

	flw	%f0, 441(%zero)
	nop
	fmul	%f1, %f0, %f26
	addi	%v1, %s2, 0

	nop
	nop
	fadd	%f2, %f1, %f0
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %s2, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45164

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.45165

bgti_else.45164:
bgti_cont.45165:
	nop
	nop
	addi	%a0, %s3, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%s6, %s1, -1
	addi	%s1, %s2, 2

	nop
	nop
	nop
	blti	%s1, 5, bgti_else.45166

	nop
	nop
	addi	%s1, %s1, -5
	j	bgti_cont.45167

bgti_else.45166:
bgti_cont.45167:
	nop
	nop
	addi	%s2, %s3, 4
	nop

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.45168

	nop
	nop
	itof	%f0, %s6
	addi	%a0, %s2, 0

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%v1, %s1, 0

	nop
	nop
	fsub	%f0, %f0, %f25
	addi	%v0, %s5, 0

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%v0, %s6, -1
	addi	%v1, %s1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45169

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.45170

bgti_else.45169:
bgti_cont.45170:
	nop
	nop
	addi	%a0, %s2, 4
	add	%ra, %zero, %s4

	nop
	nop
	nop
	j	calc_dirvec_rows.3084

bgti_else.45168:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45163:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
	nop
	nop
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1

	nop
	nop
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.45202

	nop
	nop
	addi	%fp, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_create_float_array

	lw	%s0, 0(%zero)
	nop
	addi	%k0, %v0, 0
	nop

	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %a2
	nop

	sw	%k0, 0(%a0)
	nop
	addi	%k0, %a2, -1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.45203

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

	sw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.45204

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

	sw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.45205

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %k0
	addi	%v1, %k0, -1

	sw	%a2, 0(%a0)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%a0, 0(%at)
	nop
	nop
	j	create_dirvec_elements.3090

bgti_else.45205:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45204:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45203:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45202:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45231

	nop
	nop
	addi	%s5, %zero, 120
	addi	%s3, %zero, 3

	nop
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	lw	%s4, 0(%zero)
	nop
	addi	%a1, %v0, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %s5, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%s6, %zero, 116
	addi	%v0, %s3, 0

	sw	%a1, 0(%a0)
	nop
	fmov	%f0, %fzero
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v1, %zero, 115
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 116(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%s1, %s1, -1
	nop

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45232

	nop
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %s5, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v1, %s6, 0
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%v0, %s1, -1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	create_dirvecs.3093

bgti_else.45232:
	nop
	nop
	add	%ra, %zero, %s2
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45231:
	nop
	nop
	add	%ra, %zero, %s2
	nop

	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	nop
	nop
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1

	nop
	nop
	add	%s6, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45345

	lw	%a0, 0(%zero)
	nop
	add	%at, %s4, %s5
	nop

	lw	%v0, 0(%at)
	nop
	addi	%s7, %a0, -1
	nop

	nop
	nop
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45346

	nop
	nop
	add	%at, %s4, %s5
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.45347

	lw	%a0, 12(%s7)
	lw	%a2, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	nop
	nop

	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	nop
	nop

	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.45349

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.45351

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f18, 2(%k0)
	flw	%f14, 0(%a3)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%a3)
	flw	%f13, 2(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45353

	flw	%f1, 0(%s0)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s0)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.45354

bnei_else.45353:
bnei_cont.45354:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45355

	flw	%f15, 1(%s0)
	flw	%f14, 2(%s0)
	nop
	nop

	flw	%f13, 474(%zero)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.45356

bnei_else.45355:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.45356:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.45357

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45358

fbeq_else.45357:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45358:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45359

	nop
	nop
	nop
	j	bnei_cont.45360

bnei_else.45359:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.45360:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.45350

bnei_else.45351:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a3)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.45361

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45362

fbgt_else.45361:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45362:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45363

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.45364

bnei_else.45363:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.45364:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45352:
	nop
	nop
	nop
	j	bnei_cont.45350

bnei_else.45349:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45365

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45366

fbeq_else.45365:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45366:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45367

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.45368

bnei_else.45367:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45369

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45370

fbgt_else.45369:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45370:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45371

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45373

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45372

bnei_else.45373:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45374:
	nop
	nop
	nop
	j	bnei_cont.45372

bnei_else.45371:
bnei_cont.45372:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45375

	nop
	nop
	nop
	j	bnei_cont.45376

bnei_else.45375:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45376:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.45368:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45377

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45378

fbeq_else.45377:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45378:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45379

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.45380

bnei_else.45379:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45381

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45382

fbgt_else.45381:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45382:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45383

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45385

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45384

bnei_else.45385:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45386:
	nop
	nop
	nop
	j	bnei_cont.45384

bnei_else.45383:
bnei_cont.45384:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45387

	nop
	nop
	nop
	j	bnei_cont.45388

bnei_else.45387:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45388:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.45380:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45389

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45390

fbeq_else.45389:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45390:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45391

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.45392

bnei_else.45391:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45393

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45394

fbgt_else.45393:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45394:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45395

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45397

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45396

bnei_else.45397:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45398:
	nop
	nop
	nop
	j	bnei_cont.45396

bnei_else.45395:
bnei_cont.45396:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45399

	nop
	nop
	nop
	j	bnei_cont.45400

bnei_else.45399:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45400:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.45392:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45350:
	nop
	nop
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.45348

bgti_else.45347:
bgti_cont.45348:
	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45401

	nop
	nop
	add	%at, %s4, %s5
	addi	%v1, %s7, 0

	lw	%v0, 0(%at)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45402

	nop
	nop
	add	%at, %s4, %s5
	nop

	lw	%v0, 0(%at)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6

	nop
	nop
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095

bgti_else.45402:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45401:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45346:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45345:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	nop
	nop
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45617

	lw	%s4, 179(%t7)
	nop
	addi	%a0, %zero, 119
	nop

	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	nop
	nop

	nop
	nop
	addi	%t9, %a0, -1
	nop

	nop
	nop
	nop
	blti	%t9, 0, bgti_else.45618

	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	nop
	nop

	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	nop
	nop

	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.45620

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.45622

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f18, 2(%k0)
	flw	%f14, 0(%a3)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%a3)
	flw	%f13, 2(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45624

	flw	%f1, 0(%s0)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s0)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.45625

bnei_else.45624:
bnei_cont.45625:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45626

	flw	%f15, 1(%s0)
	flw	%f14, 2(%s0)
	nop
	nop

	flw	%f13, 474(%zero)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.45627

bnei_else.45626:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.45627:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.45628

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45629

fbeq_else.45628:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45629:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45630

	nop
	nop
	nop
	j	bnei_cont.45631

bnei_else.45630:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.45631:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.45621

bnei_else.45622:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a3)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.45632

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45633

fbgt_else.45632:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45633:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45634

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.45635

bnei_else.45634:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.45635:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45623:
	nop
	nop
	nop
	j	bnei_cont.45621

bnei_else.45620:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45636

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45637

fbeq_else.45636:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45637:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45638

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.45639

bnei_else.45638:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45640

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45641

fbgt_else.45640:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45641:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45642

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45644

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45643

bnei_else.45644:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45645:
	nop
	nop
	nop
	j	bnei_cont.45643

bnei_else.45642:
bnei_cont.45643:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45646

	nop
	nop
	nop
	j	bnei_cont.45647

bnei_else.45646:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45647:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.45639:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45648

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45649

fbeq_else.45648:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45649:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45650

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.45651

bnei_else.45650:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45652

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45653

fbgt_else.45652:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45653:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45654

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45656

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45655

bnei_else.45656:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45657:
	nop
	nop
	nop
	j	bnei_cont.45655

bnei_else.45654:
bnei_cont.45655:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45658

	nop
	nop
	nop
	j	bnei_cont.45659

bnei_else.45658:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45659:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.45651:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45660

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.45661

fbeq_else.45660:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.45661:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45662

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.45663

bnei_else.45662:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45664

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.45665

fbgt_else.45664:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.45665:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45666

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45668

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.45667

bnei_else.45668:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.45669:
	nop
	nop
	nop
	j	bnei_cont.45667

bnei_else.45666:
bnei_cont.45667:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45670

	nop
	nop
	nop
	j	bnei_cont.45671

bnei_else.45670:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45671:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.45663:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45621:
	nop
	nop
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.45619

bgti_else.45618:
bgti_cont.45619:
	lw	%v0, 118(%s4)
	nop
	addi	%a0, %zero, 118
	addi	%v1, %t9, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	lw	%v0, 117(%s4)
	nop
	addi	%a0, %zero, 117
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 116
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45672

	lw	%s4, 179(%t7)
	nop
	addi	%v1, %t9, 0
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	lw	%v0, 118(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 117
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45673

	lw	%s4, 179(%t7)
	nop
	nop
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45674

	lw	%v0, 179(%t7)
	nop
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8

	nop
	nop
	nop
	j	init_vecset_constants.3098

bgti_else.45674:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45673:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45672:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45617:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

min_caml_start:
	nop
	nop
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	sw	%v0, 11(%zero)
	nop
	addi	%a2, %zero, 60
	addi	%v1, %k1, 0

	sw	%v0, 10(%zero)
	nop
	nop
	nop

	sw	%v0, 9(%zero)
	nop
	nop
	nop

	sw	%v0, 8(%zero)
	nop
	nop
	nop

	sw	%zero, 7(%zero)
	nop
	nop
	nop

	sw	%v0, 6(%zero)
	nop
	nop
	nop

	sw	%v0, 5(%zero)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%zero, 4(%zero)
	nop
	nop
	nop

	sw	%zero, 3(%zero)
	nop
	nop
	nop

	sw	%zero, 2(%zero)
	nop
	nop
	nop

	sw	%zero, 1(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 12
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 75
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 78
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	flw	%f0, 451(%zero)
	nop
	addi	%v1, %zero, 81
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %zero, 50
	addi	%v1, %zero, -1

	nop
	nop
	addi	%a0, %zero, 82
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82

	nop
	nop
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray

	lw	%v1, 83(%zero)
	nop
	addi	%a0, %zero, 133
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 135
	addi	%v0, %k1, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	flw	%f0, 445(%zero)
	nop
	addi	%v1, %zero, 137
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 142
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 145
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 148
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 151
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 156
	addi	%v0, %zero, 2

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 158
	addi	%v0, %k1, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 159
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 162
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 165
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 168
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 171
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 174
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %v0, 0
	addi	%a0, %zero, 177

	nop
	nop
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 178(%zero)
	nop
	nop
	nop

	sw	%a3, 177(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177

	nop
	nop
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179

	nop
	nop
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %v0, 0
	addi	%a0, %zero, 187

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 248(%zero)
	nop
	fmov	%f0, %fzero
	nop

	sw	%a3, 247(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a2, %v0, 0
	addi	%a0, %zero, 249

	nop
	nop
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 250(%zero)
	nop
	addi	%a0, %zero, 249
	nop

	sw	%a2, 249(%zero)
	nop
	nop
	nop

	fsw	%fzero, 253(%zero)
	nop
	addi	%v0, %zero, 180
	nop

	sw	%a0, 252(%zero)
	nop
	nop
	nop

	sw	%zero, 251(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 434
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a1, %zero, 128
	nop

	sw	%a1, 154(%zero)
	nop
	itof	%f0, %a1
	nop

	sw	%a1, 155(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 64
	nop

	sw	%a0, 156(%zero)
	nop
	nop
	nop

	sw	%a0, 157(%zero)
	nop
	nop
	nop

	flw	%f1, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 158(%zero)
	nop
	fmov	%f0, %fzero
	nop

	lw	%a0, 154(%zero)
	nop
	addi	%v0, %zero, 3
	nop

	sw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%a0, %zero, 4
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -1
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 1

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%s7, %a0, -2
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47258

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47259

bgti_else.47258:
bgti_cont.47259:
	sw	%a1, 1(%sp)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -2
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 2

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47260

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47261

bgti_else.47260:
bgti_cont.47261:
	sw	%a1, 2(%sp)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -3
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 3

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47262

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47263

bgti_else.47262:
bgti_cont.47263:
	sw	%a1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	fsw	%f0, 72(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 73(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 74(%zero)
	nop
	nop
	jal	min_caml_read_float

	flw	%f13, 469(%zero)
	flw	%f12, 482(%zero)
	addi	%sp, %sp, -4
	nop

	flw	%f14, 481(%zero)
	nop
	fmul	%f11, %f0, %f13
	nop

	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47264

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47265

fbgt_else.47264:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47265:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47266

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47267

fbgt_else.47266:
fbgt_cont.47267:
	flw	%f15, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47268

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47270

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47269

bnei_else.47270:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47271:
	nop
	nop
	nop
	j	fbgt_cont.47269

fbgt_else.47268:
fbgt_cont.47269:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47272

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47273

fbgt_else.47272:
fbgt_cont.47273:
	flw	%f16, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.47274

	flw	%f0, 474(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	j	fbgt_cont.47275

fbgt_else.47274:
	flw	%f0, 478(%zero)
	nop
	fsub	%f19, %f15, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

fbgt_cont.47275:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47276

	nop
	nop
	nop
	j	bnei_cont.47277

bnei_else.47276:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47277:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.47278

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.47279

fbgt_else.47278:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.47279:
	nop
	nop
	fabs	%f11, %f11
	nop

	nop
	nop
	fdiv	%f0, %f11, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47280

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47282

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47281

bnei_else.47282:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47283:
	nop
	nop
	nop
	j	fbgt_cont.47281

fbgt_else.47280:
fbgt_cont.47281:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47284

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47285

fbgt_else.47284:
fbgt_cont.47285:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47286

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47287

fbgt_else.47286:
fbgt_cont.47287:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.47288

	flw	%f11, 478(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f0

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	flw	%f11, 477(%zero)
	nop
	fsub	%f17, %f0, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f17, %f17, %f11
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f11, %f17, %f0
	j	fbgt_cont.47289

fbgt_else.47288:
	nop
	nop
	fsub	%f0, %f15, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 473(%zero)
	nop
	fsub	%f11, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f11, %f11, %f0
	nop

fbgt_cont.47289:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47290

	nop
	nop
	nop
	j	bnei_cont.47291

bnei_else.47290:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.47291:
	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f18, %f0, %f13

	nop
	nop
	fabs	%f17, %f18
	nop

	nop
	nop
	fdiv	%f0, %f17, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f17, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47292

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47293

fbgt_else.47292:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47293:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47294

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47295

fbgt_else.47294:
fbgt_cont.47295:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47296

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47298

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47297

bnei_else.47298:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47299:
	nop
	nop
	nop
	j	fbgt_cont.47297

fbgt_else.47296:
fbgt_cont.47297:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47300

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47301

fbgt_else.47300:
fbgt_cont.47301:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.47302

	flw	%f0, 474(%zero)
	nop
	fmul	%f2, %f0, %f0
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 473(%zero)
	nop
	fsub	%f17, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47303

fbgt_else.47302:
	flw	%f0, 478(%zero)
	nop
	fsub	%f20, %f15, %f0
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 477(%zero)
	nop
	fsub	%f17, %f20, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f17, %f0
	nop

fbgt_cont.47303:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47304

	nop
	nop
	nop
	j	bnei_cont.47305

bnei_else.47304:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47305:
	nop
	nop
	nop
	fblt	%f18, %fzero, fbgt_else.47306

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.47307

fbgt_else.47306:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.47307:
	nop
	nop
	fabs	%f18, %f18
	nop

	nop
	nop
	fdiv	%f17, %f18, %f14
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f14
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f12, fbgt_else.47308

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47310

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47309

bnei_else.47310:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47311:
	nop
	nop
	nop
	j	fbgt_cont.47309

fbgt_else.47308:
fbgt_cont.47309:
	nop
	nop
	nop
	fblt	%f17, %f12, fbgt_else.47312

	nop
	nop
	fsub	%f17, %f17, %f12
	j	fbgt_cont.47313

fbgt_else.47312:
fbgt_cont.47313:
	nop
	nop
	nop
	fblt	%f17, %f15, fbgt_else.47314

	nop
	nop
	fsub	%f17, %f12, %f17
	j	fbgt_cont.47315

fbgt_else.47314:
fbgt_cont.47315:
	nop
	nop
	nop
	fblt	%f16, %f17, fbgt_else.47316

	flw	%f18, 478(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f18, %f18, %f17

	nop
	nop
	fmul	%f18, %f18, %f20
	nop

	flw	%f18, 477(%zero)
	nop
	fsub	%f19, %f17, %f18
	nop

	nop
	nop
	fmul	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f18, %f18, %f2
	nop

	flw	%f18, 476(%zero)
	nop
	fadd	%f19, %f19, %f18
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f19, %f17
	j	fbgt_cont.47317

fbgt_else.47316:
	nop
	nop
	fsub	%f17, %f15, %f17
	nop

	flw	%f17, 474(%zero)
	nop
	fmul	%f2, %f17, %f17
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f17, %f17, %f2

	flw	%f17, 473(%zero)
	nop
	fsub	%f18, %f30, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	flw	%f17, 472(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

fbgt_cont.47317:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47318

	nop
	nop
	nop
	j	bnei_cont.47319

bnei_else.47318:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.47319:
	flw	%f19, 436(%zero)
	nop
	fmul	%f18, %f1, %f17
	addi	%sp, %sp, 4

	nop
	nop
	fmul	%f18, %f18, %f19
	nop

	fsw	%f18, 171(%zero)
	nop
	nop
	nop

	flw	%f18, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f18, %f11, %f18
	nop

	fsw	%f18, 172(%zero)
	nop
	fmul	%f18, %f1, %f0
	fneg	%f1, %f1

	nop
	nop
	fmul	%f18, %f18, %f19
	nop

	fsw	%f18, 173(%zero)
	nop
	fneg	%f18, %f17
	nop

	fsw	%f0, 165(%zero)
	nop
	nop
	nop

	fsw	%fzero, 166(%zero)
	nop
	nop
	nop

	fsw	%f18, 167(%zero)
	nop
	fneg	%f18, %f11
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	fsw	%f17, 168(%zero)
	nop
	nop
	nop

	fsw	%f1, 169(%zero)
	nop
	fneg	%f1, %f11
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 170(%zero)
	nop
	nop
	nop

	flw	%f0, 72(%zero)
	flw	%f27, 171(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f27
	nop

	fsw	%f0, 75(%zero)
	nop
	nop
	nop

	flw	%f0, 73(%zero)
	flw	%f28, 172(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f28
	nop

	fsw	%f0, 76(%zero)
	nop
	nop
	nop

	flw	%f0, 74(%zero)
	flw	%f29, 173(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f29
	nop

	fsw	%f0, 77(%zero)
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f11, %f0, %f13

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.47320

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.47321

fbgt_else.47320:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.47321:
	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47322

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47324

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47323

bnei_else.47324:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47325:
	nop
	nop
	nop
	j	fbgt_cont.47323

fbgt_else.47322:
fbgt_cont.47323:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47326

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47327

fbgt_else.47326:
fbgt_cont.47327:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47328

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47329

fbgt_else.47328:
fbgt_cont.47329:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.47330

	flw	%f1, 478(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	flw	%f1, 477(%zero)
	nop
	fsub	%f17, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47331

fbgt_else.47330:
	nop
	nop
	fsub	%f0, %f15, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.47331:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47332

	nop
	nop
	nop
	j	bnei_cont.47333

bnei_else.47332:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47333:
	nop
	nop
	fneg	%f0, %f0
	addi	%sp, %sp, 4

	fsw	%f0, 79(%zero)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f13, %f0, %f13

	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47334

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47335

fbgt_else.47334:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47335:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.47336

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47337

fbgt_else.47336:
fbgt_cont.47337:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47338

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47340

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47339

bnei_else.47340:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47341:
	nop
	nop
	nop
	j	fbgt_cont.47339

fbgt_else.47338:
fbgt_cont.47339:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.47342

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47343

fbgt_else.47342:
fbgt_cont.47343:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.47344

	flw	%f0, 474(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47345

fbgt_else.47344:
	flw	%f0, 478(%zero)
	nop
	fsub	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.47345:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47346

	nop
	nop
	nop
	j	bnei_cont.47347

bnei_else.47346:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47347:
	nop
	nop
	nop
	fblt	%f13, %fzero, fbgt_else.47348

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.47349

fbgt_else.47348:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.47349:
	nop
	nop
	fabs	%f11, %f13
	nop

	nop
	nop
	fdiv	%f1, %f11, %f14
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.47350

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47352

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47351

bnei_else.47352:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47353:
	nop
	nop
	nop
	j	fbgt_cont.47351

fbgt_else.47350:
fbgt_cont.47351:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.47354

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.47355

fbgt_else.47354:
fbgt_cont.47355:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.47356

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.47357

fbgt_else.47356:
fbgt_cont.47357:
	nop
	nop
	nop
	fblt	%f16, %f1, fbgt_else.47358

	flw	%f11, 478(%zero)
	nop
	fmul	%f19, %f1, %f1
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f1

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	flw	%f11, 477(%zero)
	nop
	fsub	%f17, %f1, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 476(%zero)
	nop
	fadd	%f17, %f17, %f11
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47359

fbgt_else.47358:
	nop
	nop
	fsub	%f1, %f15, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f18, %f1, %f1
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f1, %f1, %f18

	flw	%f1, 473(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.47359:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47360

	nop
	nop
	nop
	j	bnei_cont.47361

bnei_else.47360:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47361:
	nop
	nop
	fmul	%f1, %f0, %f1
	fabs	%f11, %f13

	fsw	%f1, 78(%zero)
	nop
	fdiv	%f1, %f11, %f14
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.47362

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47363

fbgt_else.47362:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47363:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.47364

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.47365

fbgt_else.47364:
fbgt_cont.47365:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.47366

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47368

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47367

bnei_else.47368:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47369:
	nop
	nop
	nop
	j	fbgt_cont.47367

fbgt_else.47366:
fbgt_cont.47367:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.47370

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.47371

fbgt_else.47370:
fbgt_cont.47371:
	nop
	nop
	nop
	fblt	%f16, %f1, fbgt_else.47372

	flw	%f1, 474(%zero)
	nop
	fmul	%f13, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 473(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	j	fbgt_cont.47373

fbgt_else.47372:
	flw	%f1, 478(%zero)
	nop
	fsub	%f14, %f15, %f1
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f14

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 477(%zero)
	nop
	fsub	%f11, %f14, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.47373:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47374

	nop
	nop
	nop
	j	bnei_cont.47375

bnei_else.47374:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47375:
	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%sp, %sp, 4

	fsw	%f0, 80(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 81(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 0
	jal	read_object.2772

	nop
	nop
	addi	%v0, %zero, 0
	jal	read_net_item.2776

	lw	%a0, 0(%v0)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.47376

	sw	%v0, 83(%zero)
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_and_network.2780

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.47377

bnei_else.47376:
bnei_cont.47377:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0

	lw	%a0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.47378

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_or_network.2778

	sw	%s0, 0(%v0)
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.47379

bnei_else.47378:
	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	nop

bnei_cont.47379:
	sw	%v0, 134(%zero)
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	addi	%v0, %zero, 80
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %zero, 51
	jal	min_caml_print_char

	nop
	nop
	addi	%a1, %zero, 10
	nop

	nop
	nop
	addi	%v0, %a1, 0
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 0

	lw	%v0, 0(%sp)
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	lw	%a3, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.47380

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47382

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47384

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47386

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47381

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47390

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47392

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47394

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47381

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47398

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47400

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47402

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47381

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47406

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47408

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47410

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47410:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47411:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47408:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47409:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47406:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47407:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47404:
bgti_cont.47405:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47402:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47403:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47400:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47401:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47398:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47399:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47396:
bgti_cont.47397:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47394:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47395:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47392:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47393:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47390:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47391:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47388:
bgti_cont.47389:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47386:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47387:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47384:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47385:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47382:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47383:
	nop
	nop
	nop
	j	bgti_cont.47381

bgti_else.47380:
bgti_cont.47381:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.47412

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47413

bgt_else.47412:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.47414

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47416

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47418

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47420

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47424

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47426

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47428

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47432

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47434

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47436

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47440

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47442

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47444

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47444:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47445:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47442:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47443:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47440:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47441:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47438:
bgti_cont.47439:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47436:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47437:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47434:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47435:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47432:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47433:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47430:
bgti_cont.47431:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47428:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47429:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47426:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47427:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47424:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47425:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47422:
bgti_cont.47423:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47420:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47421:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47418:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47419:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47416:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47417:
	nop
	nop
	nop
	j	bgti_cont.47415

bgti_else.47414:
bgti_cont.47415:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47446

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47447

bgt_else.47446:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47448

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47450

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47452

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47454

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47458

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47460

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47462

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47466

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47468

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47470

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47474

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47476

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47478

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47478:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47479:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47476:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47477:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47474:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47475:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47472:
bgti_cont.47473:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47470:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47471:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47468:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47469:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47466:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47467:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47464:
bgti_cont.47465:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47462:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47463:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47460:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47461:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47458:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47459:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47456:
bgti_cont.47457:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47454:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47455:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47452:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47453:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47450:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47451:
	nop
	nop
	nop
	j	bgti_cont.47449

bgti_else.47448:
bgti_cont.47449:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.47447:
bgt_cont.47413:
	nop
	nop
	addi	%a2, %zero, 32
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v0, %a2, 0
	jal	min_caml_print_char

	lw	%a3, 155(%zero)
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a3, 0
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.47480

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47482

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47484

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47486

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47481

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47490

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47492

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47494

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47481

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47498

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47500

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47502

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47481

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47506

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47508

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47510

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47510:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47511:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47508:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47509:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47506:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47507:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47504:
bgti_cont.47505:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47502:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47503:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47500:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47501:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47498:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47499:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47496:
bgti_cont.47497:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47494:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47495:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47492:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47493:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47490:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47491:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47488:
bgti_cont.47489:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47486:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.47487:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47484:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.47485:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47482:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.47483:
	nop
	nop
	nop
	j	bgti_cont.47481

bgti_else.47480:
bgti_cont.47481:
	nop
	nop
	nop
	blt	%zero, %fp, bgt_else.47512

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47513

bgt_else.47512:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%fp, 10, bgti_else.47514

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47516

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47518

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47520

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47515

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47524

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47526

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47528

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47515

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47532

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47534

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47536

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47515

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47540

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47542

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47544

	nop
	nop
	addi	%v0, %fp, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47544:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.47545:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47542:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.47543:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47540:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.47541:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47538:
bgti_cont.47539:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47536:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.47537:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47534:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.47535:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47532:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.47533:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47530:
bgti_cont.47531:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47528:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.47529:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47526:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.47527:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47524:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.47525:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47522:
bgti_cont.47523:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47520:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.47521:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47518:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.47519:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47516:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.47517:
	nop
	nop
	nop
	j	bgti_cont.47515

bgti_else.47514:
bgti_cont.47515:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47546

	nop
	nop
	addi	%v0, %fp, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47547

bgt_else.47546:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47548

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47550

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47552

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47554

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47549

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47558

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47560

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47562

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47549

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47566

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47568

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47570

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47549

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47574

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47576

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47578

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47578:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47579:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47576:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47577:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47574:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47575:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47572:
bgti_cont.47573:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47570:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47571:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47568:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47569:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47566:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47567:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47564:
bgti_cont.47565:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47562:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47563:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47560:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47561:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47558:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47559:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47556:
bgti_cont.47557:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47554:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47555:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47552:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47553:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47550:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47551:
	nop
	nop
	nop
	j	bgti_cont.47549

bgti_else.47548:
bgti_cont.47549:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %fp, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.47547:
bgt_cont.47513:
	nop
	nop
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.47580

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47581

bgt_else.47580:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.47582

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47584

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47586

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47588

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47583

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47592

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47594

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47596

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47583

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47600

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47602

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47604

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47583

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47608

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47610

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47612

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47612:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47613:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47610:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47611:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47608:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47609:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47606:
bgti_cont.47607:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47604:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47605:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47602:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47603:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47600:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47601:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47598:
bgti_cont.47599:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47596:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47597:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47594:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47595:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47592:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47593:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47590:
bgti_cont.47591:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47588:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.47589:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47586:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.47587:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47584:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.47585:
	nop
	nop
	nop
	j	bgti_cont.47583

bgti_else.47582:
bgti_cont.47583:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47614

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.47615

bgt_else.47614:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47616

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47618

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47620

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47622

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47617

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47626

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47628

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47630

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47617

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47634

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47636

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47638

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47617

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47642

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47644

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47646

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47646:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47647:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47644:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47645:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47642:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47643:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47640:
bgti_cont.47641:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47638:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47639:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47636:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47637:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47634:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47635:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47632:
bgti_cont.47633:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47630:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47631:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47628:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47629:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47626:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47627:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47624:
bgti_cont.47625:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47622:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.47623:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47620:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.47621:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47618:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.47619:
	nop
	nop
	nop
	j	bgti_cont.47617

bgti_else.47616:
bgti_cont.47617:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.47615:
bgt_cont.47581:
	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 183(%zero)
	nop
	nop
	nop

	lw	%s7, 183(%zero)
	nop
	addi	%v1, %zero, 118
	nop

	nop
	nop
	addi	%v0, %s7, 0
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%v0, %zero, 3
	jal	create_dirvecs.3093

	flw	%f0, 460(%zero)
	nop
	addi	%a0, %zero, 9
	addi	%v0, %zero, 4

	nop
	nop
	itof	%f1, %a0
	addi	%a0, %zero, 0

	flw	%f0, 438(%zero)
	nop
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 0

	nop
	nop
	fsub	%f0, %f1, %f0
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4

	nop
	nop
	addi	%v1, %zero, 2
	jal	calc_dirvec_rows.3084

	nop
	nop
	addi	%v1, %zero, 119
	addi	%v0, %s7, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%v0, %zero, 3
	jal	init_vecset_constants.3098

	flw	%f21, 78(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	fsw	%f21, 184(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	flw	%f22, 79(%zero)
	nop
	addi	%s4, %a0, -1
	nop

	fsw	%f22, 185(%zero)
	nop
	nop
	nop

	flw	%f23, 80(%zero)
	nop
	nop
	nop

	fsw	%f23, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.47648

	lw	%a0, 12(%s4)
	nop
	nop
	nop

	lw	%a2, 9(%a0)
	lw	%fp, 6(%a0)
	nop
	nop

	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	nop
	nop

	lw	%a0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.47650

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47652

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f15, 184(%zero)
	flw	%f13, 185(%zero)
	addi	%sp, %sp, -5
	nop

	flw	%f2, 186(%zero)
	flw	%f16, 0(%a1)
	fmul	%f0, %f15, %f15
	nop

	flw	%f14, 1(%a1)
	flw	%f12, 2(%a1)
	fmul	%f1, %f0, %f16
	fmul	%f0, %f13, %f13

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47654

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f13, %f2
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f2, %f15

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f15, %f13

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.47655

bnei_else.47654:
bnei_cont.47655:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f15, %f16
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f13, %f14

	nop
	nop
	fneg	%f19, %f1
	fmul	%f1, %f2, %f12

	nop
	nop
	fneg	%f14, %f1
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47656

	flw	%f17, 1(%a2)
	flw	%f18, 2(%a2)
	nop
	nop

	flw	%f16, 474(%zero)
	flw	%f12, 0(%a2)
	fmul	%f11, %f2, %f17
	fmul	%f1, %f13, %f18

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f2, %f12

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f15, %f18
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f13, %f12

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f15, %f17
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f14, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.47657

bnei_else.47656:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f19, 2(%v0)
	nop
	nop
	nop

	fsw	%f14, 3(%v0)
	nop
	nop
	nop

bnei_cont.47657:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.47658

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47659

fbeq_else.47658:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.47659:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47660

	nop
	nop
	nop
	j	bnei_cont.47661

bnei_else.47660:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.47661:
	sw	%v0, 187(%s4)
	nop
	nop
	j	bnei_cont.47651

bnei_else.47652:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f0, 184(%zero)
	flw	%f13, 0(%a1)
	addi	%sp, %sp, -5
	nop

	flw	%f0, 185(%zero)
	flw	%f12, 1(%a1)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a1)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 186(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.47662

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47663

fbgt_else.47662:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47664

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.47665

bnei_else.47664:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.47665:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.47653:
	nop
	nop
	nop
	j	bnei_cont.47651

bnei_else.47650:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f1, 184(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47666

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47667

fbeq_else.47666:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.47667:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47668

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.47669

bnei_else.47668:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47670

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47671

fbgt_else.47670:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47671:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.47672

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47674

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47673

bnei_else.47674:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47675:
	nop
	nop
	nop
	j	bnei_cont.47673

bnei_else.47672:
bnei_cont.47673:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47676

	nop
	nop
	nop
	j	bnei_cont.47677

bnei_else.47676:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47677:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.47669:
	flw	%f1, 185(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47678

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47679

fbeq_else.47678:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.47679:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47680

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.47681

bnei_else.47680:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47682

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47683

fbgt_else.47682:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47683:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.47684

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47686

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47685

bnei_else.47686:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47687:
	nop
	nop
	nop
	j	bnei_cont.47685

bnei_else.47684:
bnei_cont.47685:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47688

	nop
	nop
	nop
	j	bnei_cont.47689

bnei_else.47688:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47689:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.47681:
	flw	%f1, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47690

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47691

fbeq_else.47690:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.47691:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47692

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.47693

bnei_else.47692:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47694

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47695

fbgt_else.47694:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47695:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.47696

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47698

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47697

bnei_else.47698:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.47699:
	nop
	nop
	nop
	j	bnei_cont.47697

bnei_else.47696:
bnei_cont.47697:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47700

	nop
	nop
	nop
	j	bnei_cont.47701

bnei_else.47700:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47701:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.47693:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.47651:
	nop
	nop
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247

	nop
	nop
	addi	%sp, %sp, 5
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	j	bgti_cont.47649

bgti_else.47648:
bgti_cont.47649:
	nop
	nop
	nop
	blti	%s4, 0, bgti_else.47702

	lw	%a1, 12(%s4)
	nop
	nop
	nop

	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	nop
	nop

	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47704

	nop
	nop
	nop
	j	bgti_cont.47703

bnei_else.47704:
	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f30, fbgt_else.47706

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47707

fbgt_else.47706:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47707:
	nop
	nop
	nop
	beqi	%a0, 0, bgti_cont.47703

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.47710

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.47712

	nop
	nop
	nop
	j	bgti_cont.47703

bnei_else.47712:
	lw	%s6, 434(%zero)
	flw	%f12, 0(%a3)
	sll	%a0, %s4, 2
	fsub	%f24, %f30, %f0

	flw	%f11, 1(%a3)
	flw	%f14, 2(%a3)
	addi	%s5, %a0, 1
	fmul	%f1, %f21, %f12

	nop
	nop
	fmul	%f0, %f22, %f11
	addi	%v0, %zero, 3

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f23, %f14

	flw	%f1, 470(%zero)
	nop
	fadd	%f13, %f1, %f0
	addi	%sp, %sp, 5

	nop
	nop
	fmul	%f0, %f1, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f12, %f0, %f21
	fmul	%f0, %f1, %f11

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f11, %f0, %f22
	fmul	%f0, %f1, %f14

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f1, %f0, %f23
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%s7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%s7)
	fsw	%f12, 0(%a1)
	nop
	nop

	fsw	%f11, 1(%a1)
	nop
	addi	%v0, %s7, 0
	nop

	fsw	%f1, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp

	fsw	%f24, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%s7, 1(%a0)
	nop
	nop
	nop

	sw	%s5, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %s6, 1
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.47713:
	nop
	nop
	nop
	j	bgti_cont.47703

bnei_else.47710:
	lw	%s6, 434(%zero)
	nop
	sll	%s5, %s4, 2
	fsub	%f3, %f30, %f0

	nop
	nop
	fneg	%f26, %f21
	fneg	%f25, %f22

	nop
	nop
	fneg	%f24, %f23
	addi	%s7, %s5, 1

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t7)
	fsw	%f21, 0(%a1)
	nop
	nop

	fsw	%f25, 1(%a1)
	nop
	addi	%v0, %t7, 0
	nop

	fsw	%f24, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3

	fsw	%f3, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	sw	%t7, 1(%a0)
	nop
	addi	%t7, %s5, 2
	nop

	sw	%s7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	nop
	nop

	nop
	nop
	addi	%s7, %s6, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t8)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t8)
	fsw	%f26, 0(%a1)
	nop
	nop

	fsw	%f22, 1(%a1)
	nop
	addi	%v0, %t8, 0
	nop

	fsw	%f24, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3

	fsw	%f3, 2(%a0)
	nop
	addi	%s5, %s5, 3
	addi	%v0, %zero, 3

	sw	%t8, 1(%a0)
	nop
	fmov	%f0, %fzero
	nop

	sw	%t7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s7)
	nop
	nop
	nop

	nop
	nop
	addi	%s7, %s6, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t7)
	fsw	%f26, 0(%a1)
	nop
	nop

	fsw	%f25, 1(%a1)
	nop
	addi	%v0, %t7, 0
	nop

	fsw	%f23, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp

	fsw	%f3, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%t7, 1(%a0)
	nop
	nop
	nop

	sw	%s5, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s7)
	nop
	addi	%a0, %s6, 3
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.47711:
	nop
	nop
	nop
	j	bgti_cont.47703

bnei_else.47708:
bnei_cont.47709:
bnei_cont.47705:
	nop
	nop
	nop
	j	bgti_cont.47703

bgti_else.47702:
bgti_cont.47703:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	nop
	nop

	flw	%f11, 170(%zero)
	lw	%v0, 2(%sp)
	sub	%a0, %zero, %a0
	nop

	lw	%a0, 0(%sp)
	nop
	itof	%f0, %a0
	addi	%sp, %sp, 5

	flw	%f0, 168(%zero)
	flw	%f1, 169(%zero)
	fmul	%f12, %f1, %f0
	addi	%v1, %a0, -1

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f12, %f1

	nop
	nop
	fadd	%f0, %f0, %f27
	fadd	%f1, %f1, %f28

	nop
	nop
	fmul	%f11, %f12, %f11
	addi	%a0, %zero, 0

	nop
	nop
	fadd	%f2, %f11, %f29
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a2, %zero, 2

	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%sp, %sp, 5
	jal	scan_line.3051

	nop
	nop
	addi	%sp, %sp, -5
	ret

